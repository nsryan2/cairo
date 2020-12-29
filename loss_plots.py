import numpy as np
import os
import glob
import sys
import matplotlib.pyplot as plt
from mpl_toolkits import mplot3d


plt.rcParams['figure.figsize'] = (12, 9)
plt.rcParams['figure.edgecolor'] = 'k'
plt.rcParams['figure.facecolor'] = 'w'
plt.rcParams['savefig.dpi'] = 400
plt.rcParams['savefig.bbox'] = 'tight'
plt.rcParams['text.usetex'] = True
plt.rcParams['font.family'] = "serif"


# Optimization Sets
radius_set = [0.5, 0.7, 0.9, 1, 1.1, 1.2, 1.3, 1.5]
noise_set = [0.0001, 0.0003, 0.0007, 0.001, 0.003, 0.005, 0.007, 0.01]

# radius_set = [0.1, 0.5, 1]
# noise_set = [0.001, 0.0007, 0.003]

reservoir_set = [600, 800, 1000, 1500, 2000, 2500, 3000, 4000]
sparsity_set = [0.005, 0.01, 0.03, 0.05, 0.1, 0.12, 0.15, 0.2]

# reservoir_set = [600, 800, 1000]
# sparsity_set = [0.005, 0.01, 0.2]

parameter_sets = {"reservoir": reservoir_set,
                  "sparsity": sparsity_set,
                  "rho": radius_set,
                  "noise": noise_set}

variables = {'reservoir': 'Reservoir Size',
             'sparsity': 'Sparsity',
             'rho': 'Spectral Radius',
             'noise': 'Noise',
             'trainlen': 'Training Length'}


def get_loss_data():
    """
    This function returns a list of paths to all .npy loss
    files.

    Returns
    -------
    path_list : list of strings
        The list of paths to output files
    """

    path = "./data/*_loss.npy"

    path_list = glob.glob(path, recursive=True)
    return path_list


def get_variable_sets(fname):
    """
    This function returns the variable set given a
    file name of loss data.

    Parameters
    ----------
    fname : string
        The file name of the data. This string is
        parsed and should include the model parameters being
        optimized.

    Returns
    -------
    xset : list
        The list of values for the first variable
    xvar : string
        The name of the first variable
    yset : list
        The list of values for the second variable
    yvar : string
        The name of the second variable
    figure_path : string
    """
    splitstring = fname.split('_')

    xset, yset = None, None
    xvar, yvar = None, None

    for st in splitstring:
        if st == 'trainlen':
            pass
        elif (st in parameter_sets) and (xset is None):
            xset = parameter_sets[st]
            xvar = st
        elif (st in parameter_sets) and (xset is not None):
            yset = parameter_sets[st]
            yvar = st

    figure_path = fname.replace('data', 'figures').replace('npy', 'png')
    return xset, xvar, yset, yvar, figure_path


if __name__ == "__main__":
    loss_files = get_loss_data()
    print(len(loss_files))

    target_folder = "./figures/"

    if not os.path.isdir(target_folder):
        os.mkdir(target_folder)

    for file in loss_files:
        print(file)
        if 'trainlen' in file:
            pass
        loss = np.load(file)

        xset, xvar, yset, yvar, path = get_variable_sets(file)

        if (xset is not None) and (yset is not None):
            fig = plt.figure(figsize=(16, 9), facecolor='w', edgecolor='k')
            ax = plt.axes(projection='3d')

            X = np.array(xset)
            Y = np.array(yset)
            Z = np.array(loss).T

            print(f"Shape X {X.shape}")
            print(f"Shape Y {Y.shape}")
            print(f"Shape Z {Z.shape}")

            mappable = plt.cm.ScalarMappable()
            mappable.set_array(Z)

            ax.plot_surface(X, Y, Z, rstride=1, cstride=1,
                            cmap=mappable.cmap,
                            norm=mappable.norm)
            ax.set_xlabel(f'{variables[xvar]}', fontsize=18)
            ax.set_ylabel(f'{variables[yvar]}', fontsize=18)
            ax.set_zlabel('MSE', fontsize=18)

            cb = plt.colorbar(mappable)
            cb.set_label(label="Mean Squared Error",
                         fontsize=16,
                         rotation=-90,
                         labelpad=25)
            fig.tight_layout()
            print(f"saving file to {path}")
            plt.savefig(path)
        elif (xset is not None) and (yset is None):
            plt.figure(figsize=(16, 9), facecolor='w', edgecolor='k')
            plt.plot(xset, loss, '-ok', alpha=0.6)
            plt.title(f'MSE as a Function of {variables[xvar]}', fontsize=20)
            plt.xlabel(f'{variables[xvar]}', fontsize=18)
            plt.ylabel('MSE', fontsize=18)
