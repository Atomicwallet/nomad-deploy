import setuptools

with open("README.md", "r") as fh:
    long_description = fh.read()

setuptools.setup(
    name = "nomad-deploy",
    version = "0.0.2",
    author = "Iakov Markov",
    author_email = "iakov.markov@ataccama.com",
    description = "A small Python 3 utiility to render jinja 2 tempaltes and schedule a Nomad deployment.",
    long_description = long_description,
    long_description_content_type = "text/markdown",
    url = "https://github.com/ataccama/nomad-deploy",
    packages = setuptools.find_packages(),
    scripts=['bin/nomad-deploy'],
    classifiers = [
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
)
