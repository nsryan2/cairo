import pyESN.pyESN as pyESN
from tools import *
from optimizers import *
from pyESN.pyESN import ESN

class MRESN(ESN):
    """docstring for MRESN."""

    def __init__(self, n_res,  n_inputs, n_outputs,
                    n_reservoir=200,
                    spectral_radius=0.95, sparsity=0,
                    noise=0.001, input_shift=None,
                    input_scaling=None, teacher_forcing=True,
                    feedback_scaling=None,
                    teacher_scaling=None, teacher_shift=None,
                    out_activation=identity,
                    inverse_out_activation=identity,
                    random_state=None, silent=True):
        """
        Args:
            n_reservoirs: nr of reservoirs
        """
        #establish the variables
        super(MRESN, self).__init__(self, n_res, n_inputs, n_outputs,
                        n_reservoir,
                        spectral_radius, sparsity,
                        noise, input_shift,
                        input_scaling,
                        teacher_forcing,
                        feedback_scaling,
                        teacher_scaling, teacher_shift,
                        out_activation,
                        inverse_out_activation,
                        random_state, silent)
        self.n_res = n_res
        
    def generate(self):
        """
        Args:
            Not sure what to say here
        """
        # establish the network
        network = []

        #create the list elements
        for index in range(self.n_res):
            reservoir = ESN(self)
            network.append(reservoir)

        return network

    #def _mupdate(self,)


    #def multi_prediction():


if __name__ == "__main__":
    test = MRESN(n_reservoirs=1)

    print(test.n_reservoirs)
    print(test.n_inputs)
    print(test.n_outputs)
