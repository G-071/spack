# Copyright 2013-2023 Lawrence Livermore National Security, LLC and other
# Spack Project Developers. See the top-level COPYRIGHT file for details.
#
# SPDX-License-Identifier: (Apache-2.0 OR MIT)

from spack.package import *


class Pv(AutotoolsPackage):
    """Pipe Viewer - is a terminal-based tool for monitoring the progress
    of data through a pipeline
    """

    homepage = "https://www.ivarch.com/programs/pv.shtml"
    url = "https://www.ivarch.com/programs/sources/pv-1.6.6.tar.bz2"

    license("Artistic-2.0")

    version("1.6.20", sha256="e831951eff0718fba9b1ef286128773b9d0e723e1fbfae88d5a3188814fdc603")
    version("1.6.6", sha256="608ef935f7a377e1439c181c4fc188d247da10d51a19ef79bcdee5043b0973f1")
