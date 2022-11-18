Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAE0630429
	for <lists+xen-devel@lfdr.de>; Sat, 19 Nov 2022 00:36:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445934.701369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1owAsv-0003j3-5a; Fri, 18 Nov 2022 23:35:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445934.701369; Fri, 18 Nov 2022 23:35:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1owAsv-0003gN-10; Fri, 18 Nov 2022 23:35:01 +0000
Received: by outflank-mailman (input) for mailman id 445934;
 Fri, 18 Nov 2022 23:35:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TJKL=3S=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1owAst-0003gH-BY
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 23:35:00 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b8a188a-6799-11ed-8fd2-01056ac49cbb;
 Sat, 19 Nov 2022 00:34:56 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F2069627C2;
 Fri, 18 Nov 2022 23:34:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36654C433D7;
 Fri, 18 Nov 2022 23:34:53 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 9b8a188a-6799-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668814494;
	bh=skqeH9P/3U/0oqXFG+A3ElWlnHoKLUDJ0goaqolA7mc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SrrpXpKdN5TVCYfgUXrxhYZt4YxOQxcW5K0vHUJUobEfSpByRuIl/11SxA1kSlu+k
	 gvvrCflDYnJnAwhS7UQSKCrDRekMX+CwcpZhFIh3GhHb0dwX8ozM5F6EMER+joxfI/
	 f4W6ffA+wyJxdS9qFZRLuOFq+uYSUZGTYhDUnB4qaOC+jOQXwuwcjChtfQnfxrDWVz
	 1EW12MI4rnWnCYahlLI/Xu9B0DJi6/C9iPgcADq+5GTadcGprNDa5sepHJ1Zg9IRdl
	 jQnS540AFaYA7LAWr3N/Q4eRD14JD3nCX3LTylJsgxwe7hVHy3DZxpAAl3ATQwmGrR
	 +1D8OU4F7KL9A==
Date: Fri, 18 Nov 2022 15:34:51 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand Marquis <bertrand.marquis@arm.com>
cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v4 1/3] automation: Create Yocto docker images
In-Reply-To: <6d48a0f83324d2f42597d43c41ce72d6d80150e6.1668677493.git.bertrand.marquis@arm.com>
Message-ID: <alpine.DEB.2.22.394.2211171757230.7022@ubuntu-linux-20-04-desktop>
References: <cover.1668677493.git.bertrand.marquis@arm.com> <6d48a0f83324d2f42597d43c41ce72d6d80150e6.1668677493.git.bertrand.marquis@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1987139687-1668809228=:1049131"
Content-ID: <alpine.DEB.2.22.394.2211181531460.1049131@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1987139687-1668809228=:1049131
Content-Type: text/plain; CHARSET=US-ASCII
Content-ID: <alpine.DEB.2.22.394.2211181531461.1049131@ubuntu-linux-20-04-desktop>

On Thu, 17 Nov 2022, Bertrand Marquis wrote:
> Add containers suitable to run yocto kirkstone build based on ubuntu
> 22.04. It contains all packages required by Yocto and a checkout of the
> layers required to build Xen with Yocto.
> 
> Add a generic docker image template to be used to automatically generate
> docker files for different configurations:
> - specific yocto version
> - different targets (qemu arm, arm64 and x86)
> - different host platforms (x86 or arm64)
> 
> During a call to 'make all', only the images for the current host
> platform will be generated.
> If needed, images for an other host platform can be generated manually
> by calling the right make target (see make help).
> 
> Add a build script to build and run xen on qemu using Yocto.
> The script supports arm32, arm64 and x86_64 and checks that dom0 is
> properly booting. At this stage this does not run any guest on top of
> dom0. The script is to be executed in one of the docker images to build
> and run a system using a Xen source tree.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

This series looks great and I think it is almost ready to be committed.
Only one comment from me below.

Also, I tested it successfully both building the containers, and also
the full gitlab-ci pipeline, hurray!

The only issue is that it works for qemuarm64 and qemuarm, but not
qemux86-64: the container build doesn't work. I am attaching the error
logs from 2 different builds on 2 different arm64 machines.

To be honest, if qemux86-64 on arm64 turns out to be an issue, I'd be
happy to take the series without it for now.


> ---
> Changes in v4:
> - Rework the system to have one dockerfile template from which make will
> generate the required dockerfiles for the wanted configuration
> - add support for different host architectures
> - Merge the generation system into one single dockerfile
> - Merge patches 1 and 2 in a single patch
> - Introduce CONTAINERS_EXTRA to have extra containers not built by
> default (for those not used by CI but useful to users)
> Changes in v3:
> - limit number of jobs in yocto by default to 8 and add --num-jobs
> option to the script to set a custom number of jobs
> - do not copy anymore the build-yocto.sh script inside the main image so
> that the current one in the repository is used when running
> Changes in v2:
> - add a --dump-log command line option to build-yocto.sh script to dump
> the logs if an error occurs.
> Changes in v1:
> - add --image command line argument to build-yocto.sh to allow building
> something different than xen-image-minimal.
> - modify dockerfile to have one layer per line and make it easier to add
> other. I kept the for loop to keep the number of docker steps lower
> - update commit message to warn that no guest are tested.
> - fix build-yocto script to properly return with an error if expect
> script ends up in timeout or EOF.
> ---
>  automation/build/Makefile                  |  14 +-
>  automation/build/yocto/build-yocto.sh      | 349 +++++++++++++++++++++
>  automation/build/yocto/yocto.dockerfile.in | 114 +++++++
>  automation/build/yocto/yocto.inc           |  41 +++
>  4 files changed, 516 insertions(+), 2 deletions(-)
>  create mode 100755 automation/build/yocto/build-yocto.sh
>  create mode 100644 automation/build/yocto/yocto.dockerfile.in
>  create mode 100644 automation/build/yocto/yocto.inc
> 
> diff --git a/automation/build/Makefile b/automation/build/Makefile
> index a4b2b85178cf..72a5335baec1 100644
> --- a/automation/build/Makefile
> +++ b/automation/build/Makefile
> @@ -1,13 +1,18 @@
>  
>  # the base of where these containers will appear
>  REGISTRY := registry.gitlab.com/xen-project/xen
> -CONTAINERS = $(subst .dockerfile,,$(wildcard */*.dockerfile))
> +CONTAINERS = $(filter-out yocto/%,$(subst .dockerfile,,$(wildcard */*.dockerfile)))
> +CONTAINERS_EXTRA =
>  DOCKER_CMD ?= docker
>  
> +include yocto/yocto.inc

I think it would be good to add a comment here to say how make could be
invoked for the yocto containers, for instance "make
yocto/kirkstone-qemuarm64" or "make yocto/kirkstone-qemuarm64-arm64v8"
and explain the difference. People tend to build locally individual
containers, rather than the whole set.


>  help:
>  	@echo "Builds containers for building Xen based on different distros"
>  	@echo "To build one run 'make DISTRO/VERSION'. Available containers:"
>  	@$(foreach file,$(sort $(CONTAINERS)),echo ${file};)
> +	@echo "Extra containers (not built using make all):"
> +	@$(foreach file,$(sort $(CONTAINERS_EXTRA)),echo ${file};)
>  	@echo "To push container builds, set the env var PUSH"
>  
>  %: %.dockerfile ## Builds containers
> @@ -16,5 +21,10 @@ help:
>  		$(DOCKER_CMD) push $(REGISTRY)/$(@D):$(@F); \
>  	fi
>  
> -.PHONY: all
> +.PHONY: all clean
>  all: $(CONTAINERS)
> +
> +# Remove generated dockerfiles for yocto
> +clean:
> +	rm -f yocto/*.dockerfiles
> +
> diff --git a/automation/build/yocto/build-yocto.sh b/automation/build/yocto/build-yocto.sh
> new file mode 100755
> index 000000000000..d0c93dfaffe0
> --- /dev/null
> +++ b/automation/build/yocto/build-yocto.sh
> @@ -0,0 +1,349 @@
> +#!/bin/bash
> +#
> +# Yocto meta virtualization build and run script
> +#
> +# This script is building Yocto xen-image-minimal for qemu targets and run
> +# them using runqemu inside yocto to check that dom0 is booting properly
> +# The build is using a local xen source tree so that specific patches can be
> +# tested.
> +# In order to optimize the build time, a build cache is used so that only xen
> +# packages and its dependencies are rebuilt (qemu and final image mainly).
> +#
> +
> +# Directories
> +YOCTODIR="$HOME/yocto-layers"
> +CACHEDIR="$HOME/yocto-cache"
> +LOGDIR="$HOME/logs"
> +XENDIR="$HOME/xen"
> +BUILDDIR="$HOME/build"
> +
> +# what yocto bsp we support
> +TARGET_SUPPORTED="qemuarm qemuarm64 qemux86-64"
> +VERBOSE="n"
> +TARGETLIST=""
> +BUILDJOBS="8"
> +
> +# actions to do
> +do_clean="n"
> +do_build="y"
> +do_run="y"
> +do_localsrc="n"
> +do_dump="n"
> +build_result=0
> +
> +# layers to include in the project
> +build_layerlist="poky/meta poky/meta-poky poky/meta-yocto-bsp \
> +                 meta-openembedded/meta-oe meta-openembedded/meta-python \
> +                 meta-openembedded/meta-filesystems \
> +                 meta-openembedded/meta-networking meta-virtualization"
> +
> +# yocto image to build
> +build_image="xen-image-minimal"
> +
> +function print_progress() {
> +    echo -n "$(date +%T) $*"
> +}
> +
> +function run_task() {
> +    local task_name="$1"
> +    local task_target="$2"
> +
> +    task_log="${task_name//project_}-${task_target}"
> +
> +    mkdir -p "${LOGDIR}"
> +    print_progress
> +    echo -n "${task_name//project_} ${task_target}: "
> +    if [ "${VERBOSE}" = "n" ]; then
> +        $@ > "${LOGDIR}/${task_log}.log" 2>&1
> +    else
> +        $@ 2>&1 | tee "${LOGDIR}/${task_log}.log"
> +    fi
> +
> +    if [ ${?} -ne 0 ]; then
> +        echo "Error"
> +        build_result=$((build_result+1))
> +        if [ "${do_dump}" = "y" ]; then
> +            echo
> +            echo "############ LOGS-START ############"
> +            cat "${LOGDIR}/${task_log}.log"
> +            echo "############  LOGS-END  ############"
> +            echo
> +        fi
> +        return 1
> +    else
> +        echo "OK"
> +        return 0
> +    fi
> +}
> +
> +function project_create() {
> +    target="${1:?}"
> +    destdir="${BUILDDIR}/${target}"
> +
> +    (
> +        # init yocto project
> +        source ${YOCTODIR}/poky/oe-init-build-env "${destdir}"
> +
> +        # add needed layers
> +        for layer in ${build_layerlist}; do
> +            bitbake-layers add-layer ${YOCTODIR}/${layer} || exit 1
> +        done
> +    ) || return 1
> +
> +    # customize project configuration
> +    cat <<EOF >> "${destdir}/conf/local.conf"
> +# Yocto BSP
> +MACHINE = "${target}"
> +
> +# Use local cache to reuse previous builds results
> +SSTATE_DIR = "${CACHEDIR}/sstate-cache"
> +DL_DIR = "${CACHEDIR}/downloads"
> +
> +# Enable xen and virtualization
> +DISTRO_FEATURES = " virtualization xen ipv4"
> +
> +# Speed up run by not generating ssh host keys
> +IMAGE_INSTALL:append:pn-xen-image-minimal = " ssh-pregen-hostkeys"
> +
> +# Save some disk space
> +INHERIT += "rm_work"
> +
> +# Reduce number of jobs
> +BB_NUMBER_THREADS="${BUILDJOBS}"
> +
> +EOF
> +
> +    if [ "${do_localsrc}" = "y" ]; then
> +        XENVERS=$(grep -e "^XEN_REL" \
> +            "${YOCTODIR}"/meta-virtualization/recipes-extended/xen/xen_*.bb \
> +            2> /dev/null | tr -d ' ' | tr -d '?' | tr -d '"' \
> +            | sed -e "s/.*=//" | sort -V | tail -n 1)
> +
> +        XENBASE=$(dirname "$(realpath -m "${XENDIR}")")
> +        XENSUB=$(basename "$(realpath -m "${XENDIR}")")
> +
> +        cat <<EOF >> "${destdir}/conf/local.conf"
> +# Use local sources for xen and xen-tools
> +FILESEXTRAPATHS:prepend:pn-xen := "${XENBASE}:"
> +FILESEXTRAPATHS:prepend:pn-xen-tools := "${XENBASE}:"
> +
> +SRC_URI:pn-xen = "file://${XENSUB}/;subdir=local-xen/"
> +SRC_URI:pn-xen-tools = "file://${XENSUB}/;subdir=local-xen/"
> +
> +PREFERRED_VERSION:pn-xen = "${XENVERS}%"
> +PREFERRED_VERSION:pn-xen-tools = "${XENVERS}%"
> +
> +S:pn-xen = "\${WORKDIR}/local-xen/${XENSUB}"
> +S:pn-xen-tools = "\${WORKDIR}/local-xen/${XENSUB}"
> +
> +SRCREV:pn-xen = "\${AUTOREV}"
> +SRCREV:pn-xen-tools = "\${AUTOREV}"
> +
> +SRCPV:pn-xen = "1"
> +SRCPV:pn-xen-tools = "1"
> +
> +# Disable all QA errors as the recipe is not up to date with changes in Xen
> +# when we use local sources
> +ERROR_QA:pn-xen = "arch"
> +ERROR_QA:pn-xen-tools = "arch"
> +
> +EOF
> +    fi
> +}
> +
> +function project_build() {
> +    target="${1:?}"
> +    destdir="${BUILDDIR}/${target}"
> +
> +    (
> +        source ${YOCTODIR}/poky/oe-init-build-env "${destdir}"
> +
> +        bitbake "${build_image}" || exit 1
> +    ) || return 1
> +}
> +
> +function project_clean() {
> +    target="${1:?}"
> +    destdir="${BUILDDIR}/${target}"
> +
> +    rm -rf "${destdir}"
> +}
> +
> +function project_run() {
> +    target="${1:?}"
> +    destdir="${BUILDDIR}/${target}"
> +    (
> +        source ${YOCTODIR}/poky/oe-init-build-env "${destdir}" > /dev/null 2>&1
> +
> +        /usr/bin/expect <<EOF
> +set timeout 100
> +spawn bash -c "runqemu serialstdio nographic slirp"
> +
> +expect_after {
> +    -re "(.*)\r" {
> +        exp_continue
> +    }
> +    timeout {send_user "ERROR-Timeout!\n"; exit 1}
> +    eof {send_user "ERROR-EOF!\n"; exit 1}
> +}
> +
> +# wait initial login
> +expect -re ".* login: "
> +send "root\r"
> +expect -re "root@.*# "
> +
> +EOF
> +    exit $?
> +    ) || return 1
> +}
> +
> +function help() {
> +    cat <<EOF
> +Usage: ${0} [TARGET1] [TARGET2]
> +
> +This script is build the yocto xen-image-minimal for different qemu targets
> +and is running it after.
> +Without any target specified, all supported targets are done.
> +
> +Options:
> +  -h, --help       Print this help
> +  -v, --verbose    Verbose build
> +  --list-target    List supported targets
> +  --clean          Clean existing project before starting
> +  --no-build       Do not build (to run an already built project)
> +  --no-run         Do not run
> +  --num-jobs=NUM   Define the number of parallel jobs in Yocto.
> +                   Default: ${BUILDJOBS}
> +  --dump-log       On error, dump the logs on the console
> +  --image=IMG      Yocto image or package to build
> +                   Default: xen-image-minimal
> +  --xen-dir=DIR    path to xen hypervisor source tree
> +                   if not provide, normal yocto version of xen is built
> +                   Default: ${XENDIR}
> +  --out-dir=DIR    directory where to create the projectss
> +                   Default: ${BUILDDIR}
> +  --log-dir=DIR    directory to store logs
> +                   Default: ${LOGDIR}
> +  --cache-dir=DIR  directory where to take and store build cache
> +                   Default: ${CACHEDIR}
> +  --layer-dir=DIR  directory containing the checkout of yocto layers
> +                   Default: ${YOCTODIR}
> +EOF
> +}
> +
> +for OPTION in "$@"
> +do
> +    case ${OPTION} in
> +        -h|--help)
> +            help
> +            exit 0
> +            ;;
> +        -v|--verbose)
> +            VERBOSE="y"
> +            ;;
> +        --list-targets)
> +            echo "${TARGET_SUPPORTED}"
> +            exit 0
> +            ;;
> +        --clean)
> +            do_clean="y"
> +            ;;
> +        --no-build)
> +            do_build="n"
> +            ;;
> +        --no-run)
> +            do_run="n"
> +            ;;
> +        --dump-log)
> +            do_dump="y"
> +            ;;
> +        --num-jobs=*)
> +            BUILDJOBS="${OPTION#*=}"
> +            ;;
> +        --image=*)
> +            build_image="${OPTION#*=}"
> +            ;;
> +        --xen-dir=*)
> +            XENDIR="${OPTION#*=}"
> +            if [ ! -e "${XENDIR}/xen/Makefile" ]; then
> +                echo "No Xen source tree in ${XENDIR}"
> +                exit 1
> +            fi
> +            do_localsrc="y"
> +            ;;
> +        --out-dir=*)
> +            BUILDDIR="${OPTION#*=}"
> +            ;;
> +        --log-dir=*)
> +            LOGDIR="${OPTION#*=}"
> +            ;;
> +        --cache-dir=*)
> +            CACHEDIR="${OPTION#*=}"
> +            ;;
> +        --layer-dir=*)
> +            YOCTODIR="${OPTION#*=}"
> +            ;;
> +        --*)
> +            echo "Invalid option ${OPTION}"
> +            help
> +            exit 1
> +            ;;
> +        *)
> +            if echo "${TARGET_SUPPORTED}" | grep -q -w "${OPTION}"; then
> +                TARGETLIST="${TARGETLIST} ${OPTION}"
> +            else
> +                echo "Unsupported target ${OPTION}"
> +                exit 1
> +            fi
> +            ;;
> +    esac
> +done
> +
> +# if no target is specified build all targets
> +if [ -z "${TARGETLIST}" ]; then
> +    TARGETLIST="${TARGET_SUPPORTED}"
> +fi
> +
> +mkdir -p "${CACHEDIR}"
> +mkdir -p "${LOGDIR}"
> +mkdir -p "${BUILDDIR}"
> +
> +# Make sure we have an absolute path
> +YOCTODIR=$(realpath -m "${YOCTODIR}")
> +CACHEDIR=$(realpath -m "${CACHEDIR}")
> +BUILDDIR=$(realpath -m "${BUILDDIR}")
> +LOGDIR=$(realpath -m "${LOGDIR}")
> +if [ "${do_localsrc}" = "y" ]; then
> +    XENDIR=$(realpath -m "${XENDIR}")
> +fi
> +
> +# Check that we have all the layers we need
> +for f in ${build_layerlist}; do
> +    if [ ! -f "${YOCTODIR}/${f}/conf/layer.conf" ]; then
> +        echo "Layer ${f} missing in ${YOCTODIR}"
> +        exit 1
> +    fi
> +done
> +
> +for f in ${TARGETLIST}; do
> +    if [ "${do_clean}" = "y" ]; then
> +        run_task project_clean ${f}
> +    fi
> +    if [ ! -f ${BUILDDIR}/${f}/conf/local.conf ]; then
> +        run_task project_create ${f}
> +    fi
> +    if [ -f ${BUILDDIR}/${f}/conf/local.conf ]; then
> +        if [ "${do_build}" = "y" ]; then
> +            run_task project_build ${f}
> +        fi
> +        if [ "${do_run}" = "y" ]; then
> +            run_task project_run ${f}
> +        fi
> +
> +    fi
> +done
> +
> +print_progress "Build Complete (${build_result} errors)"
> +echo
> +exit ${build_result}
> +
> diff --git a/automation/build/yocto/yocto.dockerfile.in b/automation/build/yocto/yocto.dockerfile.in
> new file mode 100644
> index 000000000000..5350bb2b87b7
> --- /dev/null
> +++ b/automation/build/yocto/yocto.dockerfile.in
> @@ -0,0 +1,114 @@
> +# Docker file to create an environment to build yocto with virtualization
> +#
> +# Arguments that can be passed during image creation using --build-arg:
> +# "host_uid=$(id -u)": to use current user uid for build user in the image
> +# "host_gid=$(id -g)": to use current user gid for build user in the image
> +# "ubuntu_version=VERS": to select the ubuntu version number
> +
> +# Use standard ubuntu minimal
> +ARG ubuntu_version=22.04
> +From ##DOCKERPLAT##ubuntu:$ubuntu_version AS base
> +LABEL maintainer.name="The Xen Project " \
> +      maintainer.email="xen-devel@lists.xenproject.org"
> +
> +ENV DEBIAN_FRONTEND=noninteractive
> +
> +# Install minimal ubuntu requirements for yocto and other tools we need
> +# See https://docs.yoctoproject.org/4.0.1/brief-yoctoprojectqs/index.html#build-host-packages
> +RUN apt-get update && \
> +    apt-get --quiet --yes install \
> +        gawk \
> +        wget \
> +        git \
> +        diffstat \
> +        unzip \
> +        texinfo \
> +        gcc \
> +        build-essential \
> +        chrpath \
> +        socat \
> +        cpio \
> +        python3 \
> +        python3-pip \
> +        python3-pexpect \
> +        xz-utils \
> +        debianutils \
> +        iputils-ping \
> +        python3-git \
> +        python3-jinja2 \
> +        libegl1-mesa \
> +        libsdl1.2-dev \
> +        python3-subunit \
> +        mesa-common-dev \
> +        zstd \
> +        liblz4-tool \
> +        file \
> +        vim \
> +        bison \
> +        expect \
> +        locales \
> +        liblz4-tool \
> +        zstd \
> +        openssl \
> +        libssl3 \
> +        ca-certificates \
> +        && \
> +        apt-get autoremove -y && \
> +        apt-get clean && \
> +        rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
> +
> +# Use bash as shell
> +RUN rm /bin/sh && ln -s bash /bin/sh
> +
> +# Fix local for yocto
> +RUN locale-gen en_US.UTF-8 && update-locale LC_ALL=en_US.UTF-8 \
> +    LANG=en_US.UTF-8
> +ENV LANG en_US.UTF-8
> +ENV LC_ALL en_US.UTF-8
> +
> +# Create a user for the build (we don't want to build as root)
> +ENV USER_NAME docker-build
> +ARG host_uid=1000
> +ARG host_gid=1000
> +RUN groupadd -g $host_gid $USER_NAME && \
> +    useradd -g $host_gid -m -s /bin/bash -u $host_uid $USER_NAME
> +
> +# Switch to our user instead of root and start in its home
> +USER $USER_NAME
> +WORKDIR /home/$USER_NAME
> +
> +# Create needed directories
> +RUN mkdir -p /home/$USER_NAME/yocto-layers \
> +             /home/$USER_NAME/yocto-cache \
> +             /home/$USER_NAME/logs \
> +             /home/$USER_NAME/bin \
> +             /home/$USER_NAME/xen && \
> +    chown $USER_NAME.$USER_NAME /home/$USER_NAME/*
> +
> +# clone yocto repositories we need
> +RUN for rep in \
> +                https://github.com/openembedded/meta-openembedded \
> +                https://git.yoctoproject.org/poky \
> +                https://git.yoctoproject.org/meta-virtualization \
> +            ; do \
> +        git -C /home/$USER_NAME/yocto-layers \
> +            clone -b ##YOCTOVERSION## --single-branch $rep; \
> +    done
> +
> +# The builder stage is building an initial cache state that we include in the
> +# final image
> +From base AS builder
> +
> +# This step can take one to several hours depending on your download bandwith
> +# and the speed of your computer
> +COPY ./build-yocto.sh /
> +RUN /build-yocto.sh --dump-log ##YOCTOTARGET##
> +
> +From base
> +
> +# Only copy the cache status
> +COPY --from=builder /home/$USER_NAME/yocto-cache /home/$USER_NAME/yocto-cache/.
> +
> +LABEL maintainer.name="The Xen Project " \
> +      maintainer.email="xen-devel@lists.xenproject.org"
> +
> diff --git a/automation/build/yocto/yocto.inc b/automation/build/yocto/yocto.inc
> new file mode 100644
> index 000000000000..04076bc8d174
> --- /dev/null
> +++ b/automation/build/yocto/yocto.inc
> @@ -0,0 +1,41 @@
> +# This makefile generates the docker files for Yocto builds
> +# The containers for the current architecture are the one built using make all
> +# To build containers for a different architecture, you need to call make for
> +# the image you want explicitely
> +# The containers are named this way:
> +# YOCTOVERSION-TARGET for x86_64 hosts
> +# YOCTOVERSION-TARGET-arm64v8 for arm64 hosts
> +
> +# Yocto versions we are currently using
> +YOCTO_VERSION = kirkstone
> +
> +# Yocto BSPs we want to build for
> +YOCTO_TARGETS = qemuarm64 qemuarm qemux86-64
> +
> +# Supported Host platforms (host architecture specific ones)
> +YOCTO_HOSTS = amd64 arm64v8
> +
> +# Architecture we want to use in gitlab CI (depends on runners arch)
> +CI_ARCH = arm64v8
> +
> +define GEN_DOCKER
> +# Make all is generating what we want in the CI
> +ifeq ($(CI_ARCH),$(3))
> +CONTAINERS += yocto/$(1)-$(2)$(4)
> +else
> +CONTAINERS_EXTRA += yocto/$(1)-$(2)$(4)
> +endif
> +
> +yocto/$(1)-$(2)$(4).dockerfile: yocto/yocto.dockerfile.in
> +	echo > $$@
> +	cat $$< | \
> +	    sed -e "s,##YOCTOVERSION##,$(1),g" | \
> +	    sed -e "s,##YOCTOTARGET##,$(2),g" | \
> +	    sed -e "s,##DOCKERPLAT##,$(3)/,g" > $$@
> +
> +endef
> +
> +$(eval $(foreach vers,$(YOCTO_VERSION),\
> +    $(foreach tar,$(YOCTO_TARGETS),\
> +    $(foreach hst,$(YOCTO_HOSTS),\
> +    $(call GEN_DOCKER,$(vers),$(tar),$(hst),$(if $(filter amd64,$(hst)),,-$(hst)))))))
> -- 
> 2.25.1
> 
--8323329-1987139687-1668809228=:1049131
Content-Type: application/octet-stream; NAME=build.log
Content-Transfer-Encoding: BASE64
Content-ID: <alpine.DEB.2.22.394.2211181533380.1049131@ubuntu-linux-20-04-desktop>
Content-Description: 
Content-Disposition: ATTACHMENT; FILENAME=build.log

fCBzZWQgLWUgJ3MvQW1sQ29kZS9zc2R0X3M0L2cnIC1lICdzL19hbWxfY29k
ZS8vZycgL2hvbWUvZG9ja2VyLWJ1aWxkL2J1aWxkL3FlbXV4ODYtNjQvdG1w
L3dvcmsvY29yZTItNjQtcG9reS1saW51eC94ZW4tdG9vbHMvNC4xNitzdGFi
bGVBVVRPSU5DK2YyNjU0NDQ5MjItcjAvZ2l0L3Rvb2xzL2xpYnMvbGlnaHQv
c3NkdF9zNC5oZXggPi9ob21lL2RvY2tlci1idWlsZC9idWlsZC9xZW11eDg2
LTY0L3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgveGVuLXRvb2xzLzQu
MTYrc3RhYmxlQVVUT0lOQytmMjY1NDQ0OTIyLXIwL2dpdC90b29scy9saWJz
L2xpZ2h0L3NzZHRfczQuaAp8IEFTTCBJbnB1dDogICAgIHNzZHRfdHBtLmFz
bCAtICAgICA5MTIgYnl0ZXMgICAgICAzIGtleXdvcmRzICAgICAzMCBzb3Vy
Y2UgbGluZXMKfCBBTUwgT3V0cHV0OiAgICAvaG9tZS9kb2NrZXItYnVpbGQv
YnVpbGQvcWVtdXg4Ni02NC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4
L3hlbi10b29scy80LjE2K3N0YWJsZUFVVE9JTkMrZjI2NTQ0NDkyMi1yMC9n
aXQvdG9vbHMvbGlicy9saWdodC9zc2R0X3RwbS5hbWwgLSAgICAgIDc2IGJ5
dGVzICAgICAgMCBvcGNvZGVzICAgICAgIDMgbmFtZWQgb2JqZWN0cwp8IEhl
eCBEdW1wOiAgICAgIC9ob21lL2RvY2tlci1idWlsZC9idWlsZC9xZW11eDg2
LTY0L3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgveGVuLXRvb2xzLzQu
MTYrc3RhYmxlQVVUT0lOQytmMjY1NDQ0OTIyLXIwL2dpdC90b29scy9saWJz
L2xpZ2h0L3NzZHRfdHBtLmhleCAtICAgIDExNTMgYnl0ZXMKfCAKfCBDb21w
aWxhdGlvbiBzdWNjZXNzZnVsLiAwIEVycm9ycywgMCBXYXJuaW5ncywgMCBS
ZW1hcmtzLCAwIE9wdGltaXphdGlvbnMKfCBzZWQgLWUgJ3MvQW1sQ29kZS9z
c2R0X3RwbS9nJyAtZSAncy9fYW1sX2NvZGUvL2cnIC9ob21lL2RvY2tlci1i
dWlsZC9idWlsZC9xZW11eDg2LTY0L3RtcC93b3JrL2NvcmUyLTY0LXBva3kt
bGludXgveGVuLXRvb2xzLzQuMTYrc3RhYmxlQVVUT0lOQytmMjY1NDQ0OTIy
LXIwL2dpdC90b29scy9saWJzL2xpZ2h0L3NzZHRfdHBtLmhleCA+L2hvbWUv
ZG9ja2VyLWJ1aWxkL2J1aWxkL3FlbXV4ODYtNjQvdG1wL3dvcmsvY29yZTIt
NjQtcG9reS1saW51eC94ZW4tdG9vbHMvNC4xNitzdGFibGVBVVRPSU5DK2Yy
NjU0NDQ5MjItcjAvZ2l0L3Rvb2xzL2xpYnMvbGlnaHQvc3NkdF90cG0uaAp8
IEFTTCBJbnB1dDogICAgIHNzZHRfbGFwdG9wX3NsYXRlLmFzbCAtICAgIDEw
ODYgYnl0ZXMgICAgICA0IGtleXdvcmRzICAgICA0MCBzb3VyY2UgbGluZXMK
fCBBTUwgT3V0cHV0OiAgICAvaG9tZS9kb2NrZXItYnVpbGQvYnVpbGQvcWVt
dXg4Ni02NC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4L3hlbi10b29s
cy80LjE2K3N0YWJsZUFVVE9JTkMrZjI2NTQ0NDkyMi1yMC9naXQvdG9vbHMv
bGlicy9saWdodC9zc2R0X2xhcHRvcF9zbGF0ZS5hbWwgLSAgICAgIDczIGJ5
dGVzICAgICAgMSBvcGNvZGVzICAgICAgIDMgbmFtZWQgb2JqZWN0cwp8IEhl
eCBEdW1wOiAgICAgIC9ob21lL2RvY2tlci1idWlsZC9idWlsZC9xZW11eDg2
LTY0L3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgveGVuLXRvb2xzLzQu
MTYrc3RhYmxlQVVUT0lOQytmMjY1NDQ0OTIyLXIwL2dpdC90b29scy9saWJz
L2xpZ2h0L3NzZHRfbGFwdG9wX3NsYXRlLmhleCAtICAgIDExODkgYnl0ZXMK
fCAKfCBDb21waWxhdGlvbiBzdWNjZXNzZnVsLiAwIEVycm9ycywgMCBXYXJu
aW5ncywgMCBSZW1hcmtzLCAwIE9wdGltaXphdGlvbnMKfCBzZWQgLWUgJ3Mv
QW1sQ29kZS9zc2R0X2xhcHRvcF9zbGF0ZS9nJyAtZSAncy9fYW1sX2NvZGUv
L2cnIC9ob21lL2RvY2tlci1idWlsZC9idWlsZC9xZW11eDg2LTY0L3RtcC93
b3JrL2NvcmUyLTY0LXBva3ktbGludXgveGVuLXRvb2xzLzQuMTYrc3RhYmxl
QVVUT0lOQytmMjY1NDQ0OTIyLXIwL2dpdC90b29scy9saWJzL2xpZ2h0L3Nz
ZHRfbGFwdG9wX3NsYXRlLmhleCA+L2hvbWUvZG9ja2VyLWJ1aWxkL2J1aWxk
L3FlbXV4ODYtNjQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC94ZW4t
dG9vbHMvNC4xNitzdGFibGVBVVRPSU5DK2YyNjU0NDQ5MjItcjAvZ2l0L3Rv
b2xzL2xpYnMvbGlnaHQvc3NkdF9sYXB0b3Bfc2xhdGUuaAp8IHNzZHRfcG0u
YXNsICAgIDM5NzogICAgICAgICAgICAgICAgIFN0b3JlIChcX1NCLlBCMiwg
TG9jYWwwKQp8IFdhcm5pbmcgIDMxNDQgLSAgICAgICBNZXRob2QgTG9jYWwg
aXMgc2V0IGJ1dCBuZXZlciB1c2VkIF4gIChMb2NhbDApCnwgCnwgQVNMIElu
cHV0OiAgICAgc3NkdF9wbS5hc2wgLSAgIDEyNTc1IGJ5dGVzICAgIDE5MiBr
ZXl3b3JkcyAgICA0MjAgc291cmNlIGxpbmVzCnwgQU1MIE91dHB1dDogICAg
L2hvbWUvZG9ja2VyLWJ1aWxkL2J1aWxkL3FlbXV4ODYtNjQvdG1wL3dvcmsv
Y29yZTItNjQtcG9reS1saW51eC94ZW4tdG9vbHMvNC4xNitzdGFibGVBVVRP
SU5DK2YyNjU0NDQ5MjItcjAvZ2l0L3Rvb2xzL2xpYnMvbGlnaHQvc3NkdF9w
bS5hbWwgLSAgICAxNDQ3IGJ5dGVzICAgIDEzMSBvcGNvZGVzICAgICAgNjEg
bmFtZWQgb2JqZWN0cwp8IEhleCBEdW1wOiAgICAgIC9ob21lL2RvY2tlci1i
dWlsZC9idWlsZC9xZW11eDg2LTY0L3RtcC93b3JrL2NvcmUyLTY0LXBva3kt
bGludXgveGVuLXRvb2xzLzQuMTYrc3RhYmxlQVVUT0lOQytmMjY1NDQ0OTIy
LXIwL2dpdC90b29scy9saWJzL2xpZ2h0L3NzZHRfcG0uaGV4IC0gICAxMzk3
NSBieXRlcwp8IAp8IENvbXBpbGF0aW9uIHN1Y2Nlc3NmdWwuIDAgRXJyb3Jz
LCAxIFdhcm5pbmdzLCAwIFJlbWFya3MsIDMxIE9wdGltaXphdGlvbnMKfCBz
ZWQgLWUgJ3MvQW1sQ29kZS9zc2R0X3BtL2cnIC1lICdzL19hbWxfY29kZS8v
ZycgL2hvbWUvZG9ja2VyLWJ1aWxkL2J1aWxkL3FlbXV4ODYtNjQvdG1wL3dv
cmsvY29yZTItNjQtcG9reS1saW51eC94ZW4tdG9vbHMvNC4xNitzdGFibGVB
VVRPSU5DK2YyNjU0NDQ5MjItcjAvZ2l0L3Rvb2xzL2xpYnMvbGlnaHQvc3Nk
dF9wbS5oZXggPi9ob21lL2RvY2tlci1idWlsZC9idWlsZC9xZW11eDg2LTY0
L3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgveGVuLXRvb2xzLzQuMTYr
c3RhYmxlQVVUT0lOQytmMjY1NDQ0OTIyLXIwL2dpdC90b29scy9saWJzL2xp
Z2h0L3NzZHRfcG0uaAp8IHJtIC1mIC9ob21lL2RvY2tlci1idWlsZC9idWls
ZC9xZW11eDg2LTY0L3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgveGVu
LXRvb2xzLzQuMTYrc3RhYmxlQVVUT0lOQytmMjY1NDQ0OTIyLXIwL2dpdC90
b29scy9saWJzL2xpZ2h0L3NzZHRfczMuYW1sIC9ob21lL2RvY2tlci1idWls
ZC9idWlsZC9xZW11eDg2LTY0L3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGlu
dXgveGVuLXRvb2xzLzQuMTYrc3RhYmxlQVVUT0lOQytmMjY1NDQ0OTIyLXIw
L2dpdC90b29scy9saWJzL2xpZ2h0L3NzZHRfczMuaGV4Cnwgcm0gLWYgL2hv
bWUvZG9ja2VyLWJ1aWxkL2J1aWxkL3FlbXV4ODYtNjQvdG1wL3dvcmsvY29y
ZTItNjQtcG9reS1saW51eC94ZW4tdG9vbHMvNC4xNitzdGFibGVBVVRPSU5D
K2YyNjU0NDQ5MjItcjAvZ2l0L3Rvb2xzL2xpYnMvbGlnaHQvc3NkdF90cG0u
YW1sIC9ob21lL2RvY2tlci1idWlsZC9idWlsZC9xZW11eDg2LTY0L3RtcC93
b3JrL2NvcmUyLTY0LXBva3ktbGludXgveGVuLXRvb2xzLzQuMTYrc3RhYmxl
QVVUT0lOQytmMjY1NDQ0OTIyLXIwL2dpdC90b29scy9saWJzL2xpZ2h0L3Nz
ZHRfdHBtLmhleAp8IHg4Nl82NC1wb2t5LWxpbnV4LWdjYyAgLS1zeXNyb290
PS9ob21lL2RvY2tlci1idWlsZC9idWlsZC9xZW11eDg2LTY0L3RtcC93b3Jr
L2NvcmUyLTY0LXBva3ktbGludXgveGVuLXRvb2xzLzQuMTYrc3RhYmxlQVVU
T0lOQytmMjY1NDQ0OTIyLXIwL3JlY2lwZS1zeXNyb290ICAgLW02NCAtREJV
SUxEX0lEIC1mbm8tc3RyaWN0LWFsaWFzaW5nIC1zdGQ9Z251OTkgLVdhbGwg
LVdzdHJpY3QtcHJvdG90eXBlcyAtV2RlY2xhcmF0aW9uLWFmdGVyLXN0YXRl
bWVudCAtV25vLXVudXNlZC1idXQtc2V0LXZhcmlhYmxlIC1Xbm8tdW51c2Vk
LWxvY2FsLXR5cGVkZWZzICAgLU8yIC1mb21pdC1mcmFtZS1wb2ludGVyIC1E
X19YRU5fSU5URVJGQUNFX1ZFUlNJT05fXz1fX1hFTl9MQVRFU1RfSU5URVJG
QUNFX1ZFUlNJT05fXyAtTU1EIC1NUCAtTUYgLl9saWJ4bC5hcGktZm9yLWNo
ZWNrLmQgLURfTEFSR0VGSUxFX1NPVVJDRSAtRF9MQVJHRUZJTEU2NF9TT1VS
Q0UgLURDT05GSUdfUENJX1NVUFBfTEVHQUNZX0lSUSAtZnN0YWNrLXByb3Rl
Y3Rvci1zdHJvbmcgIC1PMiAtRF9GT1JUSUZZX1NPVVJDRT0yIC1XZm9ybWF0
IC1XZm9ybWF0LXNlY3VyaXR5IC1XZXJyb3I9Zm9ybWF0LXNlY3VyaXR5ICAt
TzIgLXBpcGUgLWcgLWZlbGltaW5hdGUtdW51c2VkLWRlYnVnLXR5cGVzIC1m
bWFjcm8tcHJlZml4LW1hcD0vaG9tZS9kb2NrZXItYnVpbGQvYnVpbGQvcWVt
dXg4Ni02NC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4L3hlbi10b29s
cy80LjE2K3N0YWJsZUFVVE9JTkMrZjI2NTQ0NDkyMi1yMD0vdXNyL3NyYy9k
ZWJ1Zy94ZW4tdG9vbHMvNC4xNitzdGFibGVBVVRPSU5DK2YyNjU0NDQ5MjIt
cjAgICAgICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9o
b21lL2RvY2tlci1idWlsZC9idWlsZC9xZW11eDg2LTY0L3RtcC93b3JrL2Nv
cmUyLTY0LXBva3ktbGludXgveGVuLXRvb2xzLzQuMTYrc3RhYmxlQVVUT0lO
QytmMjY1NDQ0OTIyLXIwPS91c3Ivc3JjL2RlYnVnL3hlbi10b29scy80LjE2
K3N0YWJsZUFVVE9JTkMrZjI2NTQ0NDkyMi1yMCAgICAgICAgICAgICAgICAg
ICAgICAtZmRlYnVnLXByZWZpeC1tYXA9L2hvbWUvZG9ja2VyLWJ1aWxkL2J1
aWxkL3FlbXV4ODYtNjQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC94
ZW4tdG9vbHMvNC4xNitzdGFibGVBVVRPSU5DK2YyNjU0NDQ5MjItcjAvcmVj
aXBlLXN5c3Jvb3Q9ICAgICAgICAgICAgICAgICAgICAgIC1mZGVidWctcHJl
Zml4LW1hcD0vaG9tZS9kb2NrZXItYnVpbGQvYnVpbGQvcWVtdXg4Ni02NC90
bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4L3hlbi10b29scy80LjE2K3N0
YWJsZUFVVE9JTkMrZjI2NTQ0NDkyMi1yMC9yZWNpcGUtc3lzcm9vdC1uYXRp
dmU9ICAtV25vLWZvcm1hdC16ZXJvLWxlbmd0aCAtV21pc3NpbmctZGVjbGFy
YXRpb25zIC1Xbm8tZGVjbGFyYXRpb24tYWZ0ZXItc3RhdGVtZW50IC1XZm9y
bWF0LW5vbmxpdGVyYWwgLUkuIC1wdGhyZWFkIC1XZXJyb3IgLVdtaXNzaW5n
LXByb3RvdHlwZXMgLUkuL2luY2x1ZGUgLUkvaG9tZS9kb2NrZXItYnVpbGQv
YnVpbGQvcWVtdXg4Ni02NC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4
L3hlbi10b29scy80LjE2K3N0YWJsZUFVVE9JTkMrZjI2NTQ0NDkyMi1yMC9n
aXQvdG9vbHMvbGlicy9saWdodC8uLi8uLi8uLi90b29scy9pbmNsdWRlICAt
SS9ob21lL2RvY2tlci1idWlsZC9idWlsZC9xZW11eDg2LTY0L3RtcC93b3Jr
L2NvcmUyLTY0LXBva3ktbGludXgveGVuLXRvb2xzLzQuMTYrc3RhYmxlQVVU
T0lOQytmMjY1NDQ0OTIyLXIwL2dpdC90b29scy9saWJzL2xpZ2h0Ly4uLy4u
Ly4uL3Rvb2xzL2luY2x1ZGUgIC1JL2hvbWUvZG9ja2VyLWJ1aWxkL2J1aWxk
L3FlbXV4ODYtNjQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC94ZW4t
dG9vbHMvNC4xNitzdGFibGVBVVRPSU5DK2YyNjU0NDQ5MjItcjAvZ2l0L3Rv
b2xzL2xpYnMvbGlnaHQvLi4vLi4vLi4vdG9vbHMvaW5jbHVkZSAgLUkvaG9t
ZS9kb2NrZXItYnVpbGQvYnVpbGQvcWVtdXg4Ni02NC90bXAvd29yay9jb3Jl
Mi02NC1wb2t5LWxpbnV4L3hlbi10b29scy80LjE2K3N0YWJsZUFVVE9JTkMr
ZjI2NTQ0NDkyMi1yMC9naXQvdG9vbHMvbGlicy9saWdodC8uLi8uLi8uLi90
b29scy9pbmNsdWRlICAtSS9ob21lL2RvY2tlci1idWlsZC9idWlsZC9xZW11
eDg2LTY0L3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgveGVuLXRvb2xz
LzQuMTYrc3RhYmxlQVVUT0lOQytmMjY1NDQ0OTIyLXIwL2dpdC90b29scy9s
aWJzL2xpZ2h0Ly4uLy4uLy4uL3Rvb2xzL2luY2x1ZGUgLURfX1hFTl9UT09M
U19fICAtSS9ob21lL2RvY2tlci1idWlsZC9idWlsZC9xZW11eDg2LTY0L3Rt
cC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgveGVuLXRvb2xzLzQuMTYrc3Rh
YmxlQVVUT0lOQytmMjY1NDQ0OTIyLXIwL2dpdC90b29scy9saWJzL2xpZ2h0
Ly4uLy4uLy4uL3Rvb2xzL2luY2x1ZGUgIC1JL2hvbWUvZG9ja2VyLWJ1aWxk
L2J1aWxkL3FlbXV4ODYtNjQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51
eC94ZW4tdG9vbHMvNC4xNitzdGFibGVBVVRPSU5DK2YyNjU0NDQ5MjItcjAv
Z2l0L3Rvb2xzL2xpYnMvbGlnaHQvLi4vLi4vLi4vdG9vbHMvaW5jbHVkZSAg
LUkvaG9tZS9kb2NrZXItYnVpbGQvYnVpbGQvcWVtdXg4Ni02NC90bXAvd29y
ay9jb3JlMi02NC1wb2t5LWxpbnV4L3hlbi10b29scy80LjE2K3N0YWJsZUFV
VE9JTkMrZjI2NTQ0NDkyMi1yMC9naXQvdG9vbHMvbGlicy9saWdodC8uLi8u
Li8uLi90b29scy9pbmNsdWRlIC1JL2hvbWUvZG9ja2VyLWJ1aWxkL2J1aWxk
L3FlbXV4ODYtNjQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC94ZW4t
dG9vbHMvNC4xNitzdGFibGVBVVRPSU5DK2YyNjU0NDQ5MjItcjAvcmVjaXBl
LXN5c3Jvb3QvdXNyL2luY2x1ZGUvbGlibmwzIC1Xc2hhZG93IC1pbmNsdWRl
IC9ob21lL2RvY2tlci1idWlsZC9idWlsZC9xZW11eDg2LTY0L3RtcC93b3Jr
L2NvcmUyLTY0LXBva3ktbGludXgveGVuLXRvb2xzLzQuMTYrc3RhYmxlQVVU
T0lOQytmMjY1NDQ0OTIyLXIwL2dpdC90b29scy9saWJzL2xpZ2h0Ly4uLy4u
Ly4uL3Rvb2xzL2NvbmZpZy5oIC1JL2hvbWUvZG9ja2VyLWJ1aWxkL2J1aWxk
L3FlbXV4ODYtNjQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC94ZW4t
dG9vbHMvNC4xNitzdGFibGVBVVRPSU5DK2YyNjU0NDQ5MjItcjAvZ2l0L3Rv
b2xzL2xpYnMvbGlnaHQvLi4vLi4vLi4vdG9vbHMvaW5jbHVkZSAtSS9ob21l
L2RvY2tlci1idWlsZC9idWlsZC9xZW11eDg2LTY0L3RtcC93b3JrL2NvcmUy
LTY0LXBva3ktbGludXgveGVuLXRvb2xzLzQuMTYrc3RhYmxlQVVUT0lOQytm
MjY1NDQ0OTIyLXIwL2dpdC90b29scy9saWJzL2xpZ2h0Ly4uLy4uLy4uL3Rv
b2xzL2luY2x1ZGUgIC1jIC1FIC9ob21lL2RvY2tlci1idWlsZC9idWlsZC9x
ZW11eDg2LTY0L3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgveGVuLXRv
b2xzLzQuMTYrc3RhYmxlQVVUT0lOQytmMjY1NDQ0OTIyLXIwL2dpdC90b29s
cy9saWJzL2xpZ2h0Ly4uLy4uLy4uL3Rvb2xzL2luY2x1ZGUvbGlieGwuaCAg
XAp8ICAgICAgIC1ETElCWExfRVhURVJOQUxfQ0FMTEVSU19PTkxZPUxJQlhM
X0VYVEVSTkFMX0NBTExFUlNfT05MWSBcCnwgICAgICAgPl9saWJ4bC5hcGkt
Zm9yLWNoZWNrLm5ldwp8IHJtIC1mIC9ob21lL2RvY2tlci1idWlsZC9idWls
ZC9xZW11eDg2LTY0L3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgveGVu
LXRvb2xzLzQuMTYrc3RhYmxlQVVUT0lOQytmMjY1NDQ0OTIyLXIwL2dpdC90
b29scy9saWJzL2xpZ2h0L3NzZHRfczQuYW1sIC9ob21lL2RvY2tlci1idWls
ZC9idWlsZC9xZW11eDg2LTY0L3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGlu
dXgveGVuLXRvb2xzLzQuMTYrc3RhYmxlQVVUT0lOQytmMjY1NDQ0OTIyLXIw
L2dpdC90b29scy9saWJzL2xpZ2h0L3NzZHRfczQuaGV4CnwgL2hvbWUvZG9j
a2VyLWJ1aWxkL2J1aWxkL3FlbXV4ODYtNjQvdG1wL3dvcmsvY29yZTItNjQt
cG9reS1saW51eC94ZW4tdG9vbHMvNC4xNitzdGFibGVBVVRPSU5DK2YyNjU0
NDQ5MjItcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4vcHl0aG9u
My1uYXRpdmUvcHl0aG9uMyBnZW50ZXN0LnB5IGxpYnhsX3R5cGVzLmlkbCB0
ZXN0aWRsLmMubmV3Cnwgcm0gLWYgL2hvbWUvZG9ja2VyLWJ1aWxkL2J1aWxk
L3FlbXV4ODYtNjQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC94ZW4t
dG9vbHMvNC4xNitzdGFibGVBVVRPSU5DK2YyNjU0NDQ5MjItcjAvZ2l0L3Rv
b2xzL2xpYnMvbGlnaHQvc3NkdF9sYXB0b3Bfc2xhdGUuYW1sIC9ob21lL2Rv
Y2tlci1idWlsZC9idWlsZC9xZW11eDg2LTY0L3RtcC93b3JrL2NvcmUyLTY0
LXBva3ktbGludXgveGVuLXRvb2xzLzQuMTYrc3RhYmxlQVVUT0lOQytmMjY1
NDQ0OTIyLXIwL2dpdC90b29scy9saWJzL2xpZ2h0L3NzZHRfbGFwdG9wX3Ns
YXRlLmhleAp8IHJtIC1mIC9ob21lL2RvY2tlci1idWlsZC9idWlsZC9xZW11
eDg2LTY0L3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgveGVuLXRvb2xz
LzQuMTYrc3RhYmxlQVVUT0lOQytmMjY1NDQ0OTIyLXIwL2dpdC90b29scy9s
aWJzL2xpZ2h0L3NzZHRfcG0uYW1sIC9ob21lL2RvY2tlci1idWlsZC9idWls
ZC9xZW11eDg2LTY0L3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgveGVu
LXRvb2xzLzQuMTYrc3RhYmxlQVVUT0lOQytmMjY1NDQ0OTIyLXIwL2dpdC90
b29scy9saWJzL2xpZ2h0L3NzZHRfcG0uaGV4CnwgSW4gZmlsZSBpbmNsdWRl
ZCBmcm9tIG1rX2RzZHQuYzoyMToKfCAvaG9tZS9kb2NrZXItYnVpbGQvYnVp
bGQvcWVtdXg4Ni02NC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4L3hl
bi10b29scy80LjE2K3N0YWJsZUFVVE9JTkMrZjI2NTQ0NDkyMi1yMC9naXQv
dG9vbHMvbGliYWNwaS8uLi8uLi90b29scy9pbmNsdWRlL3hlbi9hcmNoLXg4
Ni94ZW4uaDozNDogZXJyb3I6ICJfX19ERUZJTkVfWEVOX0dVRVNUX0hBTkRM
RSIgcmVkZWZpbmVkIFstV2Vycm9yXQp8ICAgIDM0IHwgI2RlZmluZSBfX19E
RUZJTkVfWEVOX0dVRVNUX0hBTkRMRShuYW1lLCB0eXBlKSBcCnwgICAgICAg
fAp8IEluIGZpbGUgaW5jbHVkZWQgZnJvbSAvaG9tZS9kb2NrZXItYnVpbGQv
YnVpbGQvcWVtdXg4Ni02NC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4
L3hlbi10b29scy80LjE2K3N0YWJsZUFVVE9JTkMrZjI2NTQ0NDkyMi1yMC9n
aXQvdG9vbHMvbGliYWNwaS8uLi8uLi90b29scy9pbmNsdWRlL3hlbi9hcmNo
LXg4Ni8uLi94ZW4uaDozNSwKfCAgICAgICAgICAgICAgICAgIGZyb20gL2hv
bWUvZG9ja2VyLWJ1aWxkL2J1aWxkL3FlbXV4ODYtNjQvdG1wL3dvcmsvY29y
ZTItNjQtcG9reS1saW51eC94ZW4tdG9vbHMvNC4xNitzdGFibGVBVVRPSU5D
K2YyNjU0NDQ5MjItcjAvZ2l0L3Rvb2xzL2xpYmFjcGkvLi4vLi4vdG9vbHMv
aW5jbHVkZS94ZW4vYXJjaC14ODYveGVuLmg6MjcsCnwgICAgICAgICAgICAg
ICAgICBmcm9tIG1rX2RzZHQuYzoyMToKfCAvaG9tZS9kb2NrZXItYnVpbGQv
YnVpbGQvcWVtdXg4Ni02NC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4
L3hlbi10b29scy80LjE2K3N0YWJsZUFVVE9JTkMrZjI2NTQ0NDkyMi1yMC9n
aXQvdG9vbHMvbGliYWNwaS8uLi8uLi90b29scy9pbmNsdWRlL3hlbi9hcmNo
LXg4Ni8uLi9hcmNoLWFybS5oOjE3Njogbm90ZTogdGhpcyBpcyB0aGUgbG9j
YXRpb24gb2YgdGhlIHByZXZpb3VzIGRlZmluaXRpb24KfCAgIDE3NiB8ICNk
ZWZpbmUgX19fREVGSU5FX1hFTl9HVUVTVF9IQU5ETEUobmFtZSwgdHlwZSkg
ICAgICAgICAgICAgICAgICBcCnwgICAgICAgfAp8IEluIGZpbGUgaW5jbHVk
ZWQgZnJvbSBta19kc2R0LmM6MjE6CnwgL2hvbWUvZG9ja2VyLWJ1aWxkL2J1
aWxkL3FlbXV4ODYtNjQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC94
ZW4tdG9vbHMvNC4xNitzdGFibGVBVVRPSU5DK2YyNjU0NDQ5MjItcjAvZ2l0
L3Rvb2xzL2xpYmFjcGkvLi4vLi4vdG9vbHMvaW5jbHVkZS94ZW4vYXJjaC14
ODYveGVuLmg6NTM6IGVycm9yOiAiX19YRU5fR1VFU1RfSEFORExFIiByZWRl
ZmluZWQgWy1XZXJyb3JdCnwgICAgNTMgfCAjZGVmaW5lIF9fWEVOX0dVRVNU
X0hBTkRMRShuYW1lKSAgICAgICAgX19ndWVzdF9oYW5kbGVfICMjIG5hbWUK
fCAgICAgICB8CnwgSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC9ob21lL2RvY2tl
ci1idWlsZC9idWlsZC9xZW11eDg2LTY0L3RtcC93b3JrL2NvcmUyLTY0LXBv
a3ktbGludXgveGVuLXRvb2xzLzQuMTYrc3RhYmxlQVVUT0lOQytmMjY1NDQ0
OTIyLXIwL2dpdC90b29scy9saWJhY3BpLy4uLy4uL3Rvb2xzL2luY2x1ZGUv
eGVuL2FyY2gteDg2Ly4uL3hlbi5oOjM1LAp8ICAgICAgICAgICAgICAgICAg
ZnJvbSAvaG9tZS9kb2NrZXItYnVpbGQvYnVpbGQvcWVtdXg4Ni02NC90bXAv
d29yay9jb3JlMi02NC1wb2t5LWxpbnV4L3hlbi10b29scy80LjE2K3N0YWJs
ZUFVVE9JTkMrZjI2NTQ0NDkyMi1yMC9naXQvdG9vbHMvbGliYWNwaS8uLi8u
Li90b29scy9pbmNsdWRlL3hlbi9hcmNoLXg4Ni94ZW4uaDoyNywKfCAgICAg
ICAgICAgICAgICAgIGZyb20gbWtfZHNkdC5jOjIxOgp8IC9ob21lL2RvY2tl
ci1idWlsZC9idWlsZC9xZW11eDg2LTY0L3RtcC93b3JrL2NvcmUyLTY0LXBv
a3ktbGludXgveGVuLXRvb2xzLzQuMTYrc3RhYmxlQVVUT0lOQytmMjY1NDQ0
OTIyLXIwL2dpdC90b29scy9saWJhY3BpLy4uLy4uL3Rvb2xzL2luY2x1ZGUv
eGVuL2FyY2gteDg2Ly4uL2FyY2gtYXJtLmg6MTkzOiBub3RlOiB0aGlzIGlz
IHRoZSBsb2NhdGlvbiBvZiB0aGUgcHJldmlvdXMgZGVmaW5pdGlvbgp8ICAg
MTkzIHwgI2RlZmluZSBfX1hFTl9HVUVTVF9IQU5ETEUobmFtZSkgICAgICAg
IF9fZ3Vlc3RfaGFuZGxlXzY0XyAjIyBuYW1lCnwgICAgICAgfAp8IEluIGZp
bGUgaW5jbHVkZWQgZnJvbSBta19kc2R0LmM6MjE6CnwgL2hvbWUvZG9ja2Vy
LWJ1aWxkL2J1aWxkL3FlbXV4ODYtNjQvdG1wL3dvcmsvY29yZTItNjQtcG9r
eS1saW51eC94ZW4tdG9vbHMvNC4xNitzdGFibGVBVVRPSU5DK2YyNjU0NDQ5
MjItcjAvZ2l0L3Rvb2xzL2xpYmFjcGkvLi4vLi4vdG9vbHMvaW5jbHVkZS94
ZW4vYXJjaC14ODYveGVuLmg6NTU6IGVycm9yOiAiWEVOX0dVRVNUX0hBTkRM
RV9QQVJBTSIgcmVkZWZpbmVkIFstV2Vycm9yXQp8ICAgIDU1IHwgI2RlZmlu
ZSBYRU5fR1VFU1RfSEFORExFX1BBUkFNKG5hbWUpICAgIFhFTl9HVUVTVF9I
QU5ETEUobmFtZSkKfCAgICAgICB8CnwgSW4gZmlsZSBpbmNsdWRlZCBmcm9t
IC9ob21lL2RvY2tlci1idWlsZC9idWlsZC9xZW11eDg2LTY0L3RtcC93b3Jr
L2NvcmUyLTY0LXBva3ktbGludXgveGVuLXRvb2xzLzQuMTYrc3RhYmxlQVVU
T0lOQytmMjY1NDQ0OTIyLXIwL2dpdC90b29scy9saWJhY3BpLy4uLy4uL3Rv
b2xzL2luY2x1ZGUveGVuL2FyY2gteDg2Ly4uL3hlbi5oOjM1LAp8ICAgICAg
ICAgICAgICAgICAgZnJvbSAvaG9tZS9kb2NrZXItYnVpbGQvYnVpbGQvcWVt
dXg4Ni02NC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4L3hlbi10b29s
cy80LjE2K3N0YWJsZUFVVE9JTkMrZjI2NTQ0NDkyMi1yMC9naXQvdG9vbHMv
bGliYWNwaS8uLi8uLi90b29scy9pbmNsdWRlL3hlbi9hcmNoLXg4Ni94ZW4u
aDoyNywKfCAgICAgICAgICAgICAgICAgIGZyb20gbWtfZHNkdC5jOjIxOgp8
IC9ob21lL2RvY2tlci1idWlsZC9idWlsZC9xZW11eDg2LTY0L3RtcC93b3Jr
L2NvcmUyLTY0LXBva3ktbGludXgveGVuLXRvb2xzLzQuMTYrc3RhYmxlQVVU
T0lOQytmMjY1NDQ0OTIyLXIwL2dpdC90b29scy9saWJhY3BpLy4uLy4uL3Rv
b2xzL2luY2x1ZGUveGVuL2FyY2gteDg2Ly4uL2FyY2gtYXJtLmg6MTk1OiBu
b3RlOiB0aGlzIGlzIHRoZSBsb2NhdGlvbiBvZiB0aGUgcHJldmlvdXMgZGVm
aW5pdGlvbgp8ICAgMTk1IHwgI2RlZmluZSBYRU5fR1VFU1RfSEFORExFX1BB
UkFNKG5hbWUpICAgIF9fZ3Vlc3RfaGFuZGxlXyAjIyBuYW1lCnwgICAgICAg
fAp8IEluIGZpbGUgaW5jbHVkZWQgZnJvbSBta19kc2R0LmM6MjE6CnwgL2hv
bWUvZG9ja2VyLWJ1aWxkL2J1aWxkL3FlbXV4ODYtNjQvdG1wL3dvcmsvY29y
ZTItNjQtcG9reS1saW51eC94ZW4tdG9vbHMvNC4xNitzdGFibGVBVVRPSU5D
K2YyNjU0NDQ5MjItcjAvZ2l0L3Rvb2xzL2xpYmFjcGkvLi4vLi4vdG9vbHMv
aW5jbHVkZS94ZW4vYXJjaC14ODYveGVuLmg6NTY6IGVycm9yOiAic2V0X3hl
bl9ndWVzdF9oYW5kbGVfcmF3IiByZWRlZmluZWQgWy1XZXJyb3JdCnwgICAg
NTYgfCAjZGVmaW5lIHNldF94ZW5fZ3Vlc3RfaGFuZGxlX3JhdyhobmQsIHZh
bCkgIGRvIHsgKGhuZCkucCA9IHZhbDsgfSB3aGlsZSAoMCkKfCAgICAgICB8
CnwgSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC9ob21lL2RvY2tlci1idWlsZC9i
dWlsZC9xZW11eDg2LTY0L3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgv
eGVuLXRvb2xzLzQuMTYrc3RhYmxlQVVUT0lOQytmMjY1NDQ0OTIyLXIwL2dp
dC90b29scy9saWJhY3BpLy4uLy4uL3Rvb2xzL2luY2x1ZGUveGVuL2FyY2gt
eDg2Ly4uL3hlbi5oOjM1LAp8ICAgICAgICAgICAgICAgICAgZnJvbSAvaG9t
ZS9kb2NrZXItYnVpbGQvYnVpbGQvcWVtdXg4Ni02NC90bXAvd29yay9jb3Jl
Mi02NC1wb2t5LWxpbnV4L3hlbi10b29scy80LjE2K3N0YWJsZUFVVE9JTkMr
ZjI2NTQ0NDkyMi1yMC9naXQvdG9vbHMvbGliYWNwaS8uLi8uLi90b29scy9p
bmNsdWRlL3hlbi9hcmNoLXg4Ni94ZW4uaDoyNywKfCAgICAgICAgICAgICAg
ICAgIGZyb20gbWtfZHNkdC5jOjIxOgp8IC9ob21lL2RvY2tlci1idWlsZC9i
dWlsZC9xZW11eDg2LTY0L3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgv
eGVuLXRvb2xzLzQuMTYrc3RhYmxlQVVUT0lOQytmMjY1NDQ0OTIyLXIwL2dp
dC90b29scy9saWJhY3BpLy4uLy4uL3Rvb2xzL2luY2x1ZGUveGVuL2FyY2gt
eDg2Ly4uL2FyY2gtYXJtLmg6MTk2OiBub3RlOiB0aGlzIGlzIHRoZSBsb2Nh
dGlvbiBvZiB0aGUgcHJldmlvdXMgZGVmaW5pdGlvbgp8ICAgMTk2IHwgI2Rl
ZmluZSBzZXRfeGVuX2d1ZXN0X2hhbmRsZV9yYXcoaG5kLCB2YWwpICAgICAg
ICAgICAgICAgICAgXAp8ICAgICAgIHwKfCBJbiBmaWxlIGluY2x1ZGVkIGZy
b20gbWtfZHNkdC5jOjIxOgp8IC9ob21lL2RvY2tlci1idWlsZC9idWlsZC9x
ZW11eDg2LTY0L3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgveGVuLXRv
b2xzLzQuMTYrc3RhYmxlQVVUT0lOQytmMjY1NDQ0OTIyLXIwL2dpdC90b29s
cy9saWJhY3BpLy4uLy4uL3Rvb2xzL2luY2x1ZGUveGVuL2FyY2gteDg2L3hl
bi5oOjc3OiBlcnJvcjogIlBSSV94ZW5fcGZuIiByZWRlZmluZWQgWy1XZXJy
b3JdCnwgICAgNzcgfCAjZGVmaW5lIFBSSV94ZW5fcGZuICJseCIKfCAgICAg
ICB8CnwgSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC9ob21lL2RvY2tlci1idWls
ZC9idWlsZC9xZW11eDg2LTY0L3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGlu
dXgveGVuLXRvb2xzLzQuMTYrc3RhYmxlQVVUT0lOQytmMjY1NDQ0OTIyLXIw
L2dpdC90b29scy9saWJhY3BpLy4uLy4uL3Rvb2xzL2luY2x1ZGUveGVuL2Fy
Y2gteDg2Ly4uL3hlbi5oOjM1LAp8ICAgICAgICAgICAgICAgICAgZnJvbSAv
aG9tZS9kb2NrZXItYnVpbGQvYnVpbGQvcWVtdXg4Ni02NC90bXAvd29yay9j
b3JlMi02NC1wb2t5LWxpbnV4L3hlbi10b29scy80LjE2K3N0YWJsZUFVVE9J
TkMrZjI2NTQ0NDkyMi1yMC9naXQvdG9vbHMvbGliYWNwaS8uLi8uLi90b29s
cy9pbmNsdWRlL3hlbi9hcmNoLXg4Ni94ZW4uaDoyNywKfCAgICAgICAgICAg
ICAgICAgIGZyb20gbWtfZHNkdC5jOjIxOgp8IC9ob21lL2RvY2tlci1idWls
ZC9idWlsZC9xZW11eDg2LTY0L3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGlu
dXgveGVuLXRvb2xzLzQuMTYrc3RhYmxlQVVUT0lOQytmMjY1NDQ0OTIyLXIw
L2dpdC90b29scy9saWJhY3BpLy4uLy4uL3Rvb2xzL2luY2x1ZGUveGVuL2Fy
Y2gteDg2Ly4uL2FyY2gtYXJtLmg6MjA1OiBub3RlOiB0aGlzIGlzIHRoZSBs
b2NhdGlvbiBvZiB0aGUgcHJldmlvdXMgZGVmaW5pdGlvbgp8ICAgMjA1IHwg
I2RlZmluZSBQUklfeGVuX3BmbiBQUkl4NjQKfCAgICAgICB8CnwgSW4gZmls
ZSBpbmNsdWRlZCBmcm9tIG1rX2RzZHQuYzoyMToKfCAvaG9tZS9kb2NrZXIt
YnVpbGQvYnVpbGQvcWVtdXg4Ni02NC90bXAvd29yay9jb3JlMi02NC1wb2t5
LWxpbnV4L3hlbi10b29scy80LjE2K3N0YWJsZUFVVE9JTkMrZjI2NTQ0NDky
Mi1yMC9naXQvdG9vbHMvbGliYWNwaS8uLi8uLi90b29scy9pbmNsdWRlL3hl
bi9hcmNoLXg4Ni94ZW4uaDo3ODogZXJyb3I6ICJQUkl1X3hlbl9wZm4iIHJl
ZGVmaW5lZCBbLVdlcnJvcl0KfCAgICA3OCB8ICNkZWZpbmUgUFJJdV94ZW5f
cGZuICJsdSIKfCAgICAgICB8CnwgSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC9o
b21lL2RvY2tlci1idWlsZC9idWlsZC9xZW11eDg2LTY0L3RtcC93b3JrL2Nv
cmUyLTY0LXBva3ktbGludXgveGVuLXRvb2xzLzQuMTYrc3RhYmxlQVVUT0lO
QytmMjY1NDQ0OTIyLXIwL2dpdC90b29scy9saWJhY3BpLy4uLy4uL3Rvb2xz
L2luY2x1ZGUveGVuL2FyY2gteDg2Ly4uL3hlbi5oOjM1LAp8ICAgICAgICAg
ICAgICAgICAgZnJvbSAvaG9tZS9kb2NrZXItYnVpbGQvYnVpbGQvcWVtdXg4
Ni02NC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4L3hlbi10b29scy80
LjE2K3N0YWJsZUFVVE9JTkMrZjI2NTQ0NDkyMi1yMC9naXQvdG9vbHMvbGli
YWNwaS8uLi8uLi90b29scy9pbmNsdWRlL3hlbi9hcmNoLXg4Ni94ZW4uaDoy
NywKfCAgICAgICAgICAgICAgICAgIGZyb20gbWtfZHNkdC5jOjIxOgp8IC9o
b21lL2RvY2tlci1idWlsZC9idWlsZC9xZW11eDg2LTY0L3RtcC93b3JrL2Nv
cmUyLTY0LXBva3ktbGludXgveGVuLXRvb2xzLzQuMTYrc3RhYmxlQVVUT0lO
QytmMjY1NDQ0OTIyLXIwL2dpdC90b29scy9saWJhY3BpLy4uLy4uL3Rvb2xz
L2luY2x1ZGUveGVuL2FyY2gteDg2Ly4uL2FyY2gtYXJtLmg6MjA2OiBub3Rl
OiB0aGlzIGlzIHRoZSBsb2NhdGlvbiBvZiB0aGUgcHJldmlvdXMgZGVmaW5p
dGlvbgp8ICAgMjA2IHwgI2RlZmluZSBQUkl1X3hlbl9wZm4gUFJJdTY0Cnwg
ICAgICAgfAp8IEluIGZpbGUgaW5jbHVkZWQgZnJvbSBta19kc2R0LmM6MjE6
CnwgL2hvbWUvZG9ja2VyLWJ1aWxkL2J1aWxkL3FlbXV4ODYtNjQvdG1wL3dv
cmsvY29yZTItNjQtcG9reS1saW51eC94ZW4tdG9vbHMvNC4xNitzdGFibGVB
VVRPSU5DK2YyNjU0NDQ5MjItcjAvZ2l0L3Rvb2xzL2xpYmFjcGkvLi4vLi4v
dG9vbHMvaW5jbHVkZS94ZW4vYXJjaC14ODYveGVuLmg6MTE3OiBlcnJvcjog
IlhFTl9MRUdBQ1lfTUFYX1ZDUFVTIiByZWRlZmluZWQgWy1XZXJyb3JdCnwg
ICAxMTcgfCAjZGVmaW5lIFhFTl9MRUdBQ1lfTUFYX1ZDUFVTIDMyCnwgICAg
ICAgfAp8IEluIGZpbGUgaW5jbHVkZWQgZnJvbSAvaG9tZS9kb2NrZXItYnVp
bGQvYnVpbGQvcWVtdXg4Ni02NC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxp
bnV4L3hlbi10b29scy80LjE2K3N0YWJsZUFVVE9JTkMrZjI2NTQ0NDkyMi1y
MC9naXQvdG9vbHMvbGliYWNwaS8uLi8uLi90b29scy9pbmNsdWRlL3hlbi9h
cmNoLXg4Ni8uLi94ZW4uaDozNSwKfCAgICAgICAgICAgICAgICAgIGZyb20g
L2hvbWUvZG9ja2VyLWJ1aWxkL2J1aWxkL3FlbXV4ODYtNjQvdG1wL3dvcmsv
Y29yZTItNjQtcG9reS1saW51eC94ZW4tdG9vbHMvNC4xNitzdGFibGVBVVRP
SU5DK2YyNjU0NDQ5MjItcjAvZ2l0L3Rvb2xzL2xpYmFjcGkvLi4vLi4vdG9v
bHMvaW5jbHVkZS94ZW4vYXJjaC14ODYveGVuLmg6MjcsCnwgICAgICAgICAg
ICAgICAgICBmcm9tIG1rX2RzZHQuYzoyMToKfCAvaG9tZS9kb2NrZXItYnVp
bGQvYnVpbGQvcWVtdXg4Ni02NC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxp
bnV4L3hlbi10b29scy80LjE2K3N0YWJsZUFVVE9JTkMrZjI2NTQ0NDkyMi1y
MC9naXQvdG9vbHMvbGliYWNwaS8uLi8uLi90b29scy9pbmNsdWRlL3hlbi9h
cmNoLXg4Ni8uLi9hcmNoLWFybS5oOjIxMjogbm90ZTogdGhpcyBpcyB0aGUg
bG9jYXRpb24gb2YgdGhlIHByZXZpb3VzIGRlZmluaXRpb24KfCAgIDIxMiB8
ICNkZWZpbmUgWEVOX0xFR0FDWV9NQVhfVkNQVVMgMQp8ICAgICAgIHwKfCBJ
biBmaWxlIGluY2x1ZGVkIGZyb20gbWtfZHNkdC5jOjIxOgp8IC9ob21lL2Rv
Y2tlci1idWlsZC9idWlsZC9xZW11eDg2LTY0L3RtcC93b3JrL2NvcmUyLTY0
LXBva3ktbGludXgveGVuLXRvb2xzLzQuMTYrc3RhYmxlQVVUT0lOQytmMjY1
NDQ0OTIyLXIwL2dpdC90b29scy9saWJhY3BpLy4uLy4uL3Rvb2xzL2luY2x1
ZGUveGVuL2FyY2gteDg2L3hlbi5oOjEyMjogZXJyb3I6ICJQUklfeGVuX3Vs
b25nIiByZWRlZmluZWQgWy1XZXJyb3JdCnwgICAxMjIgfCAjZGVmaW5lIFBS
SV94ZW5fdWxvbmcgImx4Igp8ICAgICAgIHwKfCBJbiBmaWxlIGluY2x1ZGVk
IGZyb20gL2hvbWUvZG9ja2VyLWJ1aWxkL2J1aWxkL3FlbXV4ODYtNjQvdG1w
L3dvcmsvY29yZTItNjQtcG9reS1saW51eC94ZW4tdG9vbHMvNC4xNitzdGFi
bGVBVVRPSU5DK2YyNjU0NDQ5MjItcjAvZ2l0L3Rvb2xzL2xpYmFjcGkvLi4v
Li4vdG9vbHMvaW5jbHVkZS94ZW4vYXJjaC14ODYvLi4veGVuLmg6MzUsCnwg
ICAgICAgICAgICAgICAgICBmcm9tIC9ob21lL2RvY2tlci1idWlsZC9idWls
ZC9xZW11eDg2LTY0L3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgveGVu
LXRvb2xzLzQuMTYrc3RhYmxlQVVUT0lOQytmMjY1NDQ0OTIyLXIwL2dpdC90
b29scy9saWJhY3BpLy4uLy4uL3Rvb2xzL2luY2x1ZGUveGVuL2FyY2gteDg2
L3hlbi5oOjI3LAp8ICAgICAgICAgICAgICAgICAgZnJvbSBta19kc2R0LmM6
MjE6CnwgL2hvbWUvZG9ja2VyLWJ1aWxkL2J1aWxkL3FlbXV4ODYtNjQvdG1w
L3dvcmsvY29yZTItNjQtcG9reS1saW51eC94ZW4tdG9vbHMvNC4xNitzdGFi
bGVBVVRPSU5DK2YyNjU0NDQ5MjItcjAvZ2l0L3Rvb2xzL2xpYmFjcGkvLi4v
Li4vdG9vbHMvaW5jbHVkZS94ZW4vYXJjaC14ODYvLi4vYXJjaC1hcm0uaDoy
MTU6IG5vdGU6IHRoaXMgaXMgdGhlIGxvY2F0aW9uIG9mIHRoZSBwcmV2aW91
cyBkZWZpbml0aW9uCnwgICAyMTUgfCAjZGVmaW5lIFBSSV94ZW5fdWxvbmcg
UFJJeDY0CnwgICAgICAgfAp8IEluIGZpbGUgaW5jbHVkZWQgZnJvbSBta19k
c2R0LmM6MjE6CnwgL2hvbWUvZG9ja2VyLWJ1aWxkL2J1aWxkL3FlbXV4ODYt
NjQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC94ZW4tdG9vbHMvNC4x
NitzdGFibGVBVVRPSU5DK2YyNjU0NDQ5MjItcjAvZ2l0L3Rvb2xzL2xpYmFj
cGkvLi4vLi4vdG9vbHMvaW5jbHVkZS94ZW4vYXJjaC14ODYveGVuLmg6MTc5
Ojg6IGVycm9yOiByZWRlZmluaXRpb24gb2Yg4oCYc3RydWN0IHZjcHVfZ3Vl
c3RfY29udGV4dOKAmQp8ICAgMTc5IHwgc3RydWN0IHZjcHVfZ3Vlc3RfY29u
dGV4dCB7CnwgICAgICAgfCAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+Cnwg
SW4gZmlsZSBpbmNsdWRlZCBmcm9tIC9ob21lL2RvY2tlci1idWlsZC9idWls
ZC9xZW11eDg2LTY0L3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgveGVu
LXRvb2xzLzQuMTYrc3RhYmxlQVVUT0lOQytmMjY1NDQ0OTIyLXIwL2dpdC90
b29scy9saWJhY3BpLy4uLy4uL3Rvb2xzL2luY2x1ZGUveGVuL2FyY2gteDg2
Ly4uL3hlbi5oOjM1LAp8ICAgICAgICAgICAgICAgICAgZnJvbSAvaG9tZS9k
b2NrZXItYnVpbGQvYnVpbGQvcWVtdXg4Ni02NC90bXAvd29yay9jb3JlMi02
NC1wb2t5LWxpbnV4L3hlbi10b29scy80LjE2K3N0YWJsZUFVVE9JTkMrZjI2
NTQ0NDkyMi1yMC9naXQvdG9vbHMvbGliYWNwaS8uLi8uLi90b29scy9pbmNs
dWRlL3hlbi9hcmNoLXg4Ni94ZW4uaDoyNywKfCAgICAgICAgICAgICAgICAg
IGZyb20gbWtfZHNkdC5jOjIxOgp8IC9ob21lL2RvY2tlci1idWlsZC9idWls
ZC9xZW11eDg2LTY0L3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgveGVu
LXRvb2xzLzQuMTYrc3RhYmxlQVVUT0lOQytmMjY1NDQ0OTIyLXIwL2dpdC90
b29scy9saWJhY3BpLy4uLy4uL3Rvb2xzL2luY2x1ZGUveGVuL2FyY2gteDg2
Ly4uL2FyY2gtYXJtLmg6MjkzOjg6IG5vdGU6IG9yaWdpbmFsbHkgZGVmaW5l
ZCBoZXJlCnwgICAyOTMgfCBzdHJ1Y3QgdmNwdV9ndWVzdF9jb250ZXh0IHsK
fCAgICAgICB8ICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn4KfCBJbiBmaWxl
IGluY2x1ZGVkIGZyb20gbWtfZHNkdC5jOjIxOgp8IC9ob21lL2RvY2tlci1i
dWlsZC9idWlsZC9xZW11eDg2LTY0L3RtcC93b3JrL2NvcmUyLTY0LXBva3kt
bGludXgveGVuLXRvb2xzLzQuMTYrc3RhYmxlQVVUT0lOQytmMjY1NDQ0OTIy
LXIwL2dpdC90b29scy9saWJhY3BpLy4uLy4uL3Rvb2xzL2luY2x1ZGUveGVu
L2FyY2gteDg2L3hlbi5oOjE5MjogZXJyb3I6ICJfVkdDRl9vbmxpbmUiIHJl
ZGVmaW5lZCBbLVdlcnJvcl0KfCAgIDE5MiB8ICNkZWZpbmUgX1ZHQ0Zfb25s
aW5lICAgICAgICAgICAgICAgICAgIDUKfCAgICAgICB8CnwgSW4gZmlsZSBp
bmNsdWRlZCBmcm9tIC9ob21lL2RvY2tlci1idWlsZC9idWlsZC9xZW11eDg2
LTY0L3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgveGVuLXRvb2xzLzQu
MTYrc3RhYmxlQVVUT0lOQytmMjY1NDQ0OTIyLXIwL2dpdC90b29scy9saWJh
Y3BpLy4uLy4uL3Rvb2xzL2luY2x1ZGUveGVuL2FyY2gteDg2Ly4uL3hlbi5o
OjM1LAp8ICAgICAgICAgICAgICAgICAgZnJvbSAvaG9tZS9kb2NrZXItYnVp
bGQvYnVpbGQvcWVtdXg4Ni02NC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxp
bnV4L3hlbi10b29scy80LjE2K3N0YWJsZUFVVE9JTkMrZjI2NTQ0NDkyMi1y
MC9naXQvdG9vbHMvbGliYWNwaS8uLi8uLi90b29scy9pbmNsdWRlL3hlbi9h
cmNoLXg4Ni94ZW4uaDoyNywKfCAgICAgICAgICAgICAgICAgIGZyb20gbWtf
ZHNkdC5jOjIxOgp8IC9ob21lL2RvY2tlci1idWlsZC9idWlsZC9xZW11eDg2
LTY0L3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgveGVuLXRvb2xzLzQu
MTYrc3RhYmxlQVVUT0lOQytmMjY1NDQ0OTIyLXIwL2dpdC90b29scy9saWJh
Y3BpLy4uLy4uL3Rvb2xzL2luY2x1ZGUveGVuL2FyY2gteDg2Ly4uL2FyY2gt
YXJtLmg6Mjk0OiBub3RlOiB0aGlzIGlzIHRoZSBsb2NhdGlvbiBvZiB0aGUg
cHJldmlvdXMgZGVmaW5pdGlvbgp8ICAgMjk0IHwgI2RlZmluZSBfVkdDRl9v
bmxpbmUgICAgICAgICAgICAgICAgICAgMAp8ICAgICAgIHwKfCBJbiBmaWxl
IGluY2x1ZGVkIGZyb20gbWtfZHNkdC5jOjIxOgp8IC9ob21lL2RvY2tlci1i
dWlsZC9idWlsZC9xZW11eDg2LTY0L3RtcC93b3JrL2NvcmUyLTY0LXBva3kt
bGludXgveGVuLXRvb2xzLzQuMTYrc3RhYmxlQVVUT0lOQytmMjY1NDQ0OTIy
LXIwL2dpdC90b29scy9saWJhY3BpLy4uLy4uL3Rvb2xzL2luY2x1ZGUveGVu
L2FyY2gteDg2L3hlbi5oOjE5NToyNjogZXJyb3I6IGZpZWxkIOKAmHVzZXJf
cmVnc+KAmSBoYXMgaW5jb21wbGV0ZSB0eXBlCnwgICAxOTUgfCAgICAgc3Ry
dWN0IGNwdV91c2VyX3JlZ3MgdXNlcl9yZWdzOyAgICAgICAgIC8qIFVzZXIt
bGV2ZWwgQ1BVIHJlZ2lzdGVycyAgICAgKi8KfCAgICAgICB8ICAgICAgICAg
ICAgICAgICAgICAgICAgICBefn5+fn5+fn4KfCAvaG9tZS9kb2NrZXItYnVp
bGQvYnVpbGQvcWVtdXg4Ni02NC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxp
bnV4L3hlbi10b29scy80LjE2K3N0YWJsZUFVVE9JTkMrZjI2NTQ0NDkyMi1y
MC9naXQvdG9vbHMvbGliYWNwaS8uLi8uLi90b29scy9pbmNsdWRlL3hlbi9h
cmNoLXg4Ni94ZW4uaDoyMzE6MzU6IGVycm9yOiBjb25mbGljdGluZyB0eXBl
cyBmb3Ig4oCYdmNwdV9ndWVzdF9jb250ZXh0X3TigJk7IGhhdmUg4oCYc3Ry
dWN0IHZjcHVfZ3Vlc3RfY29udGV4dOKAmQp8ICAgMjMxIHwgdHlwZWRlZiBz
dHJ1Y3QgdmNwdV9ndWVzdF9jb250ZXh0IHZjcHVfZ3Vlc3RfY29udGV4dF90
Owp8ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IF5+fn5+fn5+fn5+fn5+fn5+fn5+CnwgSW4gZmlsZSBpbmNsdWRlZCBmcm9t
IC9ob21lL2RvY2tlci1idWlsZC9idWlsZC9xZW11eDg2LTY0L3RtcC93b3Jr
L2NvcmUyLTY0LXBva3ktbGludXgveGVuLXRvb2xzLzQuMTYrc3RhYmxlQVVU
T0lOQytmMjY1NDQ0OTIyLXIwL2dpdC90b29scy9saWJhY3BpLy4uLy4uL3Rv
b2xzL2luY2x1ZGUveGVuL2FyY2gteDg2Ly4uL3hlbi5oOjM1LAp8ICAgICAg
ICAgICAgICAgICAgZnJvbSAvaG9tZS9kb2NrZXItYnVpbGQvYnVpbGQvcWVt
dXg4Ni02NC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4L3hlbi10b29s
cy80LjE2K3N0YWJsZUFVVE9JTkMrZjI2NTQ0NDkyMi1yMC9naXQvdG9vbHMv
bGliYWNwaS8uLi8uLi90b29scy9pbmNsdWRlL3hlbi9hcmNoLXg4Ni94ZW4u
aDoyNywKfCAgICAgICAgICAgICAgICAgIGZyb20gbWtfZHNkdC5jOjIxOgp8
IC9ob21lL2RvY2tlci1idWlsZC9idWlsZC9xZW11eDg2LTY0L3RtcC93b3Jr
L2NvcmUyLTY0LXBva3ktbGludXgveGVuLXRvb2xzLzQuMTYrc3RhYmxlQVVU
T0lOQytmMjY1NDQ0OTIyLXIwL2dpdC90b29scy9saWJhY3BpLy4uLy4uL3Rv
b2xzL2luY2x1ZGUveGVuL2FyY2gteDg2Ly4uL2FyY2gtYXJtLmg6MzAzOjM1
OiBub3RlOiBwcmV2aW91cyBkZWNsYXJhdGlvbiBvZiDigJh2Y3B1X2d1ZXN0
X2NvbnRleHRfdOKAmSB3aXRoIHR5cGUg4oCYdmNwdV9ndWVzdF9jb250ZXh0
X3TigJkge2FrYSDigJhzdHJ1Y3QgdmNwdV9ndWVzdF9jb250ZXh04oCZfQp8
ICAgMzAzIHwgdHlwZWRlZiBzdHJ1Y3QgdmNwdV9ndWVzdF9jb250ZXh0IHZj
cHVfZ3Vlc3RfY29udGV4dF90Owp8ICAgICAgIHwgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+CnwgSW4g
ZmlsZSBpbmNsdWRlZCBmcm9tIG1rX2RzZHQuYzoyMToKfCAvaG9tZS9kb2Nr
ZXItYnVpbGQvYnVpbGQvcWVtdXg4Ni02NC90bXAvd29yay9jb3JlMi02NC1w
b2t5LWxpbnV4L3hlbi10b29scy80LjE2K3N0YWJsZUFVVE9JTkMrZjI2NTQ0
NDkyMi1yMC9naXQvdG9vbHMvbGliYWNwaS8uLi8uLi90b29scy9pbmNsdWRl
L3hlbi9hcmNoLXg4Ni94ZW4uaDozNTozMzogZXJyb3I6IGNvbmZsaWN0aW5n
IHR5cGVzIGZvciDigJhfX2d1ZXN0X2hhbmRsZV92Y3B1X2d1ZXN0X2NvbnRl
eHRfdOKAmTsgaGF2ZSDigJhzdHJ1Y3QgPGFub255bW91cz7igJkKfCAgICAz
NSB8ICAgICB0eXBlZGVmIHN0cnVjdCB7IHR5cGUgKnA7IH0gX19ndWVzdF9o
YW5kbGVfICMjIG5hbWUKfCAgICAgICB8ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+CnwgL2hvbWUvZG9ja2VyLWJ1
aWxkL2J1aWxkL3FlbXV4ODYtNjQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1s
aW51eC94ZW4tdG9vbHMvNC4xNitzdGFibGVBVVRPSU5DK2YyNjU0NDQ5MjIt
cjAvZ2l0L3Rvb2xzL2xpYmFjcGkvLi4vLi4vdG9vbHMvaW5jbHVkZS94ZW4v
YXJjaC14ODYveGVuLmg6NTA6NTogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1h
Y3JvIOKAmF9fX0RFRklORV9YRU5fR1VFU1RfSEFORExF4oCZCnwgICAgNTAg
fCAgICAgX19fREVGSU5FX1hFTl9HVUVTVF9IQU5ETEUobmFtZSwgdHlwZSk7
ICAgXAp8ICAgICAgIHwgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
CnwgL2hvbWUvZG9ja2VyLWJ1aWxkL2J1aWxkL3FlbXV4ODYtNjQvdG1wL3dv
cmsvY29yZTItNjQtcG9reS1saW51eC94ZW4tdG9vbHMvNC4xNitzdGFibGVB
VVRPSU5DK2YyNjU0NDQ5MjItcjAvZ2l0L3Rvb2xzL2xpYmFjcGkvLi4vLi4v
dG9vbHMvaW5jbHVkZS94ZW4vYXJjaC14ODYveGVuLmg6NTI6NDE6IG5vdGU6
IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhfX0RFRklORV9YRU5fR1VFU1Rf
SEFORExF4oCZCnwgICAgNTIgfCAjZGVmaW5lIERFRklORV9YRU5fR1VFU1Rf
SEFORExFKG5hbWUpICAgX19ERUZJTkVfWEVOX0dVRVNUX0hBTkRMRShuYW1l
LCBuYW1lKQp8ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KfCAvaG9t
ZS9kb2NrZXItYnVpbGQvYnVpbGQvcWVtdXg4Ni02NC90bXAvd29yay9jb3Jl
Mi02NC1wb2t5LWxpbnV4L3hlbi10b29scy80LjE2K3N0YWJsZUFVVE9JTkMr
ZjI2NTQ0NDkyMi1yMC9naXQvdG9vbHMvbGliYWNwaS8uLi8uLi90b29scy9p
bmNsdWRlL3hlbi9hcmNoLXg4Ni94ZW4uaDoyMzI6MTogbm90ZTogaW4gZXhw
YW5zaW9uIG9mIG1hY3JvIOKAmERFRklORV9YRU5fR1VFU1RfSEFORExF4oCZ
CnwgICAyMzIgfCBERUZJTkVfWEVOX0dVRVNUX0hBTkRMRSh2Y3B1X2d1ZXN0
X2NvbnRleHRfdCk7CnwgICAgICAgfCBefn5+fn5+fn5+fn5+fn5+fn5+fn5+
fgp8IEluIGZpbGUgaW5jbHVkZWQgZnJvbSAvaG9tZS9kb2NrZXItYnVpbGQv
YnVpbGQvcWVtdXg4Ni02NC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4
L3hlbi10b29scy80LjE2K3N0YWJsZUFVVE9JTkMrZjI2NTQ0NDkyMi1yMC9n
aXQvdG9vbHMvbGliYWNwaS8uLi8uLi90b29scy9pbmNsdWRlL3hlbi9hcmNo
LXg4Ni8uLi94ZW4uaDozNSwKfCAgICAgICAgICAgICAgICAgIGZyb20gL2hv
bWUvZG9ja2VyLWJ1aWxkL2J1aWxkL3FlbXV4ODYtNjQvdG1wL3dvcmsvY29y
ZTItNjQtcG9reS1saW51eC94ZW4tdG9vbHMvNC4xNitzdGFibGVBVVRPSU5D
K2YyNjU0NDQ5MjItcjAvZ2l0L3Rvb2xzL2xpYmFjcGkvLi4vLi4vdG9vbHMv
aW5jbHVkZS94ZW4vYXJjaC14ODYveGVuLmg6MjcsCnwgICAgICAgICAgICAg
ICAgICBmcm9tIG1rX2RzZHQuYzoyMToKfCAvaG9tZS9kb2NrZXItYnVpbGQv
YnVpbGQvcWVtdXg4Ni02NC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4
L3hlbi10b29scy80LjE2K3N0YWJsZUFVVE9JTkMrZjI2NTQ0NDkyMi1yMC9n
aXQvdG9vbHMvbGliYWNwaS8uLi8uLi90b29scy9pbmNsdWRlL3hlbi9hcmNo
LXg4Ni8uLi9hcmNoLWFybS5oOjE3ODo5OiBub3RlOiBwcmV2aW91cyBkZWNs
YXJhdGlvbiBvZiDigJhfX2d1ZXN0X2hhbmRsZV92Y3B1X2d1ZXN0X2NvbnRl
eHRfdOKAmSB3aXRoIHR5cGUg4oCYX19ndWVzdF9oYW5kbGVfdmNwdV9ndWVz
dF9jb250ZXh0X3TigJkKfCAgIDE3OCB8ICAgICAgICAgX19ndWVzdF9oYW5k
bGVfICMjIG5hbWU7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
CnwgICAgICAgfCAgICAgICAgIF5+fn5+fn5+fn5+fn5+fgp8IC9ob21lL2Rv
Y2tlci1idWlsZC9idWlsZC9xZW11eDg2LTY0L3RtcC93b3JrL2NvcmUyLTY0
LXBva3ktbGludXgveGVuLXRvb2xzLzQuMTYrc3RhYmxlQVVUT0lOQytmMjY1
NDQ0OTIyLXIwL2dpdC90b29scy9saWJhY3BpLy4uLy4uL3Rvb2xzL2luY2x1
ZGUveGVuL2FyY2gteDg2Ly4uL2FyY2gtYXJtLmg6MTkwOjU6IG5vdGU6IGlu
IGV4cGFuc2lvbiBvZiBtYWNybyDigJhfX19ERUZJTkVfWEVOX0dVRVNUX0hB
TkRMReKAmQp8ICAgMTkwIHwgICAgIF9fX0RFRklORV9YRU5fR1VFU1RfSEFO
RExFKG5hbWUsIHR5cGUpOyAgIFwKfCAgICAgICB8ICAgICBefn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fgp8IC9ob21lL2RvY2tlci1idWlsZC9idWlsZC9x
ZW11eDg2LTY0L3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgveGVuLXRv
b2xzLzQuMTYrc3RhYmxlQVVUT0lOQytmMjY1NDQ0OTIyLXIwL2dpdC90b29s
cy9saWJhY3BpLy4uLy4uL3Rvb2xzL2luY2x1ZGUveGVuL2FyY2gteDg2Ly4u
L2FyY2gtYXJtLmg6MTkyOjQxOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFj
cm8g4oCYX19ERUZJTkVfWEVOX0dVRVNUX0hBTkRMReKAmQp8ICAgMTkyIHwg
I2RlZmluZSBERUZJTkVfWEVOX0dVRVNUX0hBTkRMRShuYW1lKSAgIF9fREVG
SU5FX1hFTl9HVUVTVF9IQU5ETEUobmFtZSwgbmFtZSkKfCAgICAgICB8ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+CnwgL2hvbWUvZG9ja2VyLWJ1aWxkL2J1aWxk
L3FlbXV4ODYtNjQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC94ZW4t
dG9vbHMvNC4xNitzdGFibGVBVVRPSU5DK2YyNjU0NDQ5MjItcjAvZ2l0L3Rv
b2xzL2xpYmFjcGkvLi4vLi4vdG9vbHMvaW5jbHVkZS94ZW4vYXJjaC14ODYv
Li4vYXJjaC1hcm0uaDozMDQ6MTogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1h
Y3JvIOKAmERFRklORV9YRU5fR1VFU1RfSEFORExF4oCZCnwgICAzMDQgfCBE
RUZJTkVfWEVOX0dVRVNUX0hBTkRMRSh2Y3B1X2d1ZXN0X2NvbnRleHRfdCk7
CnwgICAgICAgfCBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fgp8IEluIGZpbGUg
aW5jbHVkZWQgZnJvbSBta19kc2R0LmM6MjE6CnwgL2hvbWUvZG9ja2VyLWJ1
aWxkL2J1aWxkL3FlbXV4ODYtNjQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1s
aW51eC94ZW4tdG9vbHMvNC4xNitzdGFibGVBVVRPSU5DK2YyNjU0NDQ5MjIt
cjAvZ2l0L3Rvb2xzL2xpYmFjcGkvLi4vLi4vdG9vbHMvaW5jbHVkZS94ZW4v
YXJjaC14ODYveGVuLmg6MzU6MzM6IGVycm9yOiBjb25mbGljdGluZyB0eXBl
cyBmb3Ig4oCYX19ndWVzdF9oYW5kbGVfY29uc3RfdmNwdV9ndWVzdF9jb250
ZXh0X3TigJk7IGhhdmUg4oCYc3RydWN0IDxhbm9ueW1vdXM+4oCZCnwgICAg
MzUgfCAgICAgdHlwZWRlZiBzdHJ1Y3QgeyB0eXBlICpwOyB9IF9fZ3Vlc3Rf
aGFuZGxlXyAjIyBuYW1lCnwgICAgICAgfCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fgp8IC9ob21lL2RvY2tlci1i
dWlsZC9idWlsZC9xZW11eDg2LTY0L3RtcC93b3JrL2NvcmUyLTY0LXBva3kt
bGludXgveGVuLXRvb2xzLzQuMTYrc3RhYmxlQVVUT0lOQytmMjY1NDQ0OTIy
LXIwL2dpdC90b29scy9saWJhY3BpLy4uLy4uL3Rvb2xzL2luY2x1ZGUveGVu
L2FyY2gteDg2L3hlbi5oOjUxOjU6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBt
YWNybyDigJhfX19ERUZJTkVfWEVOX0dVRVNUX0hBTkRMReKAmQp8ICAgIDUx
IHwgICAgIF9fX0RFRklORV9YRU5fR1VFU1RfSEFORExFKGNvbnN0XyMjbmFt
ZSwgY29uc3QgdHlwZSkKfCAgICAgICB8ICAgICBefn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fgp8IC9ob21lL2RvY2tlci1idWlsZC9idWlsZC9xZW11eDg2
LTY0L3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgveGVuLXRvb2xzLzQu
MTYrc3RhYmxlQVVUT0lOQytmMjY1NDQ0OTIyLXIwL2dpdC90b29scy9saWJh
Y3BpLy4uLy4uL3Rvb2xzL2luY2x1ZGUveGVuL2FyY2gteDg2L3hlbi5oOjUy
OjQxOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYX19ERUZJTkVf
WEVOX0dVRVNUX0hBTkRMReKAmQp8ICAgIDUyIHwgI2RlZmluZSBERUZJTkVf
WEVOX0dVRVNUX0hBTkRMRShuYW1lKSAgIF9fREVGSU5FX1hFTl9HVUVTVF9I
QU5ETEUobmFtZSwgbmFtZSkKfCAgICAgICB8ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+CnwgL2hvbWUvZG9ja2VyLWJ1aWxkL2J1aWxkL3FlbXV4ODYtNjQvdG1w
L3dvcmsvY29yZTItNjQtcG9reS1saW51eC94ZW4tdG9vbHMvNC4xNitzdGFi
bGVBVVRPSU5DK2YyNjU0NDQ5MjItcjAvZ2l0L3Rvb2xzL2xpYmFjcGkvLi4v
Li4vdG9vbHMvaW5jbHVkZS94ZW4vYXJjaC14ODYveGVuLmg6MjMyOjE6IG5v
dGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhERUZJTkVfWEVOX0dVRVNU
X0hBTkRMReKAmQp8ICAgMjMyIHwgREVGSU5FX1hFTl9HVUVTVF9IQU5ETEUo
dmNwdV9ndWVzdF9jb250ZXh0X3QpOwp8ICAgICAgIHwgXn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn4KfCBJbiBmaWxlIGluY2x1ZGVkIGZyb20gL2hvbWUvZG9j
a2VyLWJ1aWxkL2J1aWxkL3FlbXV4ODYtNjQvdG1wL3dvcmsvY29yZTItNjQt
cG9reS1saW51eC94ZW4tdG9vbHMvNC4xNitzdGFibGVBVVRPSU5DK2YyNjU0
NDQ5MjItcjAvZ2l0L3Rvb2xzL2xpYmFjcGkvLi4vLi4vdG9vbHMvaW5jbHVk
ZS94ZW4vYXJjaC14ODYvLi4veGVuLmg6MzUsCnwgICAgICAgICAgICAgICAg
ICBmcm9tIC9ob21lL2RvY2tlci1idWlsZC9idWlsZC9xZW11eDg2LTY0L3Rt
cC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgveGVuLXRvb2xzLzQuMTYrc3Rh
YmxlQVVUT0lOQytmMjY1NDQ0OTIyLXIwL2dpdC90b29scy9saWJhY3BpLy4u
Ly4uL3Rvb2xzL2luY2x1ZGUveGVuL2FyY2gteDg2L3hlbi5oOjI3LAp8ICAg
ICAgICAgICAgICAgICAgZnJvbSBta19kc2R0LmM6MjE6CnwgL2hvbWUvZG9j
a2VyLWJ1aWxkL2J1aWxkL3FlbXV4ODYtNjQvdG1wL3dvcmsvY29yZTItNjQt
cG9reS1saW51eC94ZW4tdG9vbHMvNC4xNitzdGFibGVBVVRPSU5DK2YyNjU0
NDQ5MjItcjAvZ2l0L3Rvb2xzL2xpYmFjcGkvLi4vLi4vdG9vbHMvaW5jbHVk
ZS94ZW4vYXJjaC14ODYvLi4vYXJjaC1hcm0uaDoxNzg6OTogbm90ZTogcHJl
dmlvdXMgZGVjbGFyYXRpb24gb2Yg4oCYX19ndWVzdF9oYW5kbGVfY29uc3Rf
dmNwdV9ndWVzdF9jb250ZXh0X3TigJkgd2l0aCB0eXBlIOKAmF9fZ3Vlc3Rf
aGFuZGxlX2NvbnN0X3ZjcHVfZ3Vlc3RfY29udGV4dF904oCZCnwgICAxNzgg
fCAgICAgICAgIF9fZ3Vlc3RfaGFuZGxlXyAjIyBuYW1lOyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXAp8ICAgICAgIHwgICAgICAgICBefn5+
fn5+fn5+fn5+fn4KfCAvaG9tZS9kb2NrZXItYnVpbGQvYnVpbGQvcWVtdXg4
Ni02NC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4L3hlbi10b29scy80
LjE2K3N0YWJsZUFVVE9JTkMrZjI2NTQ0NDkyMi1yMC9naXQvdG9vbHMvbGli
YWNwaS8uLi8uLi90b29scy9pbmNsdWRlL3hlbi9hcmNoLXg4Ni8uLi9hcmNo
LWFybS5oOjE5MTo1OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCY
X19fREVGSU5FX1hFTl9HVUVTVF9IQU5ETEXigJkKfCAgIDE5MSB8ICAgICBf
X19ERUZJTkVfWEVOX0dVRVNUX0hBTkRMRShjb25zdF8jI25hbWUsIGNvbnN0
IHR5cGUpCnwgICAgICAgfCAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn4KfCAvaG9tZS9kb2NrZXItYnVpbGQvYnVpbGQvcWVtdXg4Ni02NC90bXAv
d29yay9jb3JlMi02NC1wb2t5LWxpbnV4L3hlbi10b29scy80LjE2K3N0YWJs
ZUFVVE9JTkMrZjI2NTQ0NDkyMi1yMC9naXQvdG9vbHMvbGliYWNwaS8uLi8u
Li90b29scy9pbmNsdWRlL3hlbi9hcmNoLXg4Ni8uLi9hcmNoLWFybS5oOjE5
Mjo0MTogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmF9fREVGSU5F
X1hFTl9HVUVTVF9IQU5ETEXigJkKfCAgIDE5MiB8ICNkZWZpbmUgREVGSU5F
X1hFTl9HVUVTVF9IQU5ETEUobmFtZSkgICBfX0RFRklORV9YRU5fR1VFU1Rf
SEFORExFKG5hbWUsIG5hbWUpCnwgICAgICAgfCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fgp8IC9ob21lL2RvY2tlci1idWlsZC9idWlsZC9xZW11eDg2LTY0L3Rt
cC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgveGVuLXRvb2xzLzQuMTYrc3Rh
YmxlQVVUT0lOQytmMjY1NDQ0OTIyLXIwL2dpdC90b29scy9saWJhY3BpLy4u
Ly4uL3Rvb2xzL2luY2x1ZGUveGVuL2FyY2gteDg2Ly4uL2FyY2gtYXJtLmg6
MzA0OjE6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhERUZJTkVf
WEVOX0dVRVNUX0hBTkRMReKAmQp8ICAgMzA0IHwgREVGSU5FX1hFTl9HVUVT
VF9IQU5ETEUodmNwdV9ndWVzdF9jb250ZXh0X3QpOwp8ICAgICAgIHwgXn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn4KfCBJbiBmaWxlIGluY2x1ZGVkIGZyb20g
bWtfZHNkdC5jOjIxOgp8IC9ob21lL2RvY2tlci1idWlsZC9idWlsZC9xZW11
eDg2LTY0L3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgveGVuLXRvb2xz
LzQuMTYrc3RhYmxlQVVUT0lOQytmMjY1NDQ0OTIyLXIwL2dpdC90b29scy9s
aWJhY3BpLy4uLy4uL3Rvb2xzL2luY2x1ZGUveGVuL2FyY2gteDg2L3hlbi5o
OjIzNDo4OiBlcnJvcjogcmVkZWZpbml0aW9uIG9mIOKAmHN0cnVjdCBhcmNo
X3NoYXJlZF9pbmZv4oCZCnwgICAyMzQgfCBzdHJ1Y3QgYXJjaF9zaGFyZWRf
aW5mbyB7CnwgICAgICAgfCAgICAgICAgXn5+fn5+fn5+fn5+fn5+fgp8IElu
IGZpbGUgaW5jbHVkZWQgZnJvbSAvaG9tZS9kb2NrZXItYnVpbGQvYnVpbGQv
cWVtdXg4Ni02NC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4L3hlbi10
b29scy80LjE2K3N0YWJsZUFVVE9JTkMrZjI2NTQ0NDkyMi1yMC9naXQvdG9v
bHMvbGliYWNwaS8uLi8uLi90b29scy9pbmNsdWRlL3hlbi9hcmNoLXg4Ni8u
Li94ZW4uaDozNSwKfCAgICAgICAgICAgICAgICAgIGZyb20gL2hvbWUvZG9j
a2VyLWJ1aWxkL2J1aWxkL3FlbXV4ODYtNjQvdG1wL3dvcmsvY29yZTItNjQt
cG9reS1saW51eC94ZW4tdG9vbHMvNC4xNitzdGFibGVBVVRPSU5DK2YyNjU0
NDQ5MjItcjAvZ2l0L3Rvb2xzL2xpYmFjcGkvLi4vLi4vdG9vbHMvaW5jbHVk
ZS94ZW4vYXJjaC14ODYveGVuLmg6MjcsCnwgICAgICAgICAgICAgICAgICBm
cm9tIG1rX2RzZHQuYzoyMToKfCAvaG9tZS9kb2NrZXItYnVpbGQvYnVpbGQv
cWVtdXg4Ni02NC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4L3hlbi10
b29scy80LjE2K3N0YWJsZUFVVE9JTkMrZjI2NTQ0NDkyMi1yMC9naXQvdG9v
bHMvbGliYWNwaS8uLi8uLi90b29scy9pbmNsdWRlL3hlbi9hcmNoLXg4Ni8u
Li9hcmNoLWFybS5oOjM0NTo4OiBub3RlOiBvcmlnaW5hbGx5IGRlZmluZWQg
aGVyZQp8ICAgMzQ1IHwgc3RydWN0IGFyY2hfc2hhcmVkX2luZm8gewp8ICAg
ICAgIHwgICAgICAgIF5+fn5+fn5+fn5+fn5+fn4KfCBJbiBmaWxlIGluY2x1
ZGVkIGZyb20gbWtfZHNkdC5jOjIxOgp8IC9ob21lL2RvY2tlci1idWlsZC9i
dWlsZC9xZW11eDg2LTY0L3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgv
eGVuLXRvb2xzLzQuMTYrc3RhYmxlQVVUT0lOQytmMjY1NDQ0OTIyLXIwL2dp
dC90b29scy9saWJhY3BpLy4uLy4uL3Rvb2xzL2luY2x1ZGUveGVuL2FyY2gt
eDg2L3hlbi5oOjI3NTozMzogZXJyb3I6IGNvbmZsaWN0aW5nIHR5cGVzIGZv
ciDigJhhcmNoX3NoYXJlZF9pbmZvX3TigJk7IGhhdmUg4oCYc3RydWN0IGFy
Y2hfc2hhcmVkX2luZm/igJkKfCAgIDI3NSB8IHR5cGVkZWYgc3RydWN0IGFy
Y2hfc2hhcmVkX2luZm8gYXJjaF9zaGFyZWRfaW5mb190Owp8ICAgICAgIHwg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+
fn5+fn4KfCBJbiBmaWxlIGluY2x1ZGVkIGZyb20gL2hvbWUvZG9ja2VyLWJ1
aWxkL2J1aWxkL3FlbXV4ODYtNjQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1s
aW51eC94ZW4tdG9vbHMvNC4xNitzdGFibGVBVVRPSU5DK2YyNjU0NDQ5MjIt
cjAvZ2l0L3Rvb2xzL2xpYmFjcGkvLi4vLi4vdG9vbHMvaW5jbHVkZS94ZW4v
YXJjaC14ODYvLi4veGVuLmg6MzUsCnwgICAgICAgICAgICAgICAgICBmcm9t
IC9ob21lL2RvY2tlci1idWlsZC9idWlsZC9xZW11eDg2LTY0L3RtcC93b3Jr
L2NvcmUyLTY0LXBva3ktbGludXgveGVuLXRvb2xzLzQuMTYrc3RhYmxlQVVU
T0lOQytmMjY1NDQ0OTIyLXIwL2dpdC90b29scy9saWJhY3BpLy4uLy4uL3Rv
b2xzL2luY2x1ZGUveGVuL2FyY2gteDg2L3hlbi5oOjI3LAp8ICAgICAgICAg
ICAgICAgICAgZnJvbSBta19kc2R0LmM6MjE6CnwgL2hvbWUvZG9ja2VyLWJ1
aWxkL2J1aWxkL3FlbXV4ODYtNjQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1s
aW51eC94ZW4tdG9vbHMvNC4xNitzdGFibGVBVVRPSU5DK2YyNjU0NDQ5MjIt
cjAvZ2l0L3Rvb2xzL2xpYmFjcGkvLi4vLi4vdG9vbHMvaW5jbHVkZS94ZW4v
YXJjaC14ODYvLi4vYXJjaC1hcm0uaDozNDc6MzM6IG5vdGU6IHByZXZpb3Vz
IGRlY2xhcmF0aW9uIG9mIOKAmGFyY2hfc2hhcmVkX2luZm9fdOKAmSB3aXRo
IHR5cGUg4oCYYXJjaF9zaGFyZWRfaW5mb1904oCZIHtha2Eg4oCYc3RydWN0
IGFyY2hfc2hhcmVkX2luZm/igJl9CnwgICAzNDcgfCB0eXBlZGVmIHN0cnVj
dCBhcmNoX3NoYXJlZF9pbmZvIGFyY2hfc2hhcmVkX2luZm9fdDsKfCAgICAg
ICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+
fn5+fn5+fn5+CnwgSW4gZmlsZSBpbmNsdWRlZCBmcm9tIG1rX2RzZHQuYzoy
MToKfCAvaG9tZS9kb2NrZXItYnVpbGQvYnVpbGQvcWVtdXg4Ni02NC90bXAv
d29yay9jb3JlMi02NC1wb2t5LWxpbnV4L3hlbi10b29scy80LjE2K3N0YWJs
ZUFVVE9JTkMrZjI2NTQ0NDkyMi1yMC9naXQvdG9vbHMvbGliYWNwaS8uLi8u
Li90b29scy9pbmNsdWRlL3hlbi9hcmNoLXg4Ni94ZW4uaDoyODI6ODogZXJy
b3I6IHJlZGVmaW5pdGlvbiBvZiDigJhzdHJ1Y3QgeGVuX2FyY2hfZG9tYWlu
Y29uZmln4oCZCnwgICAyODIgfCBzdHJ1Y3QgeGVuX2FyY2hfZG9tYWluY29u
ZmlnIHsKfCAgICAgICB8ICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn4K
fCBJbiBmaWxlIGluY2x1ZGVkIGZyb20gL2hvbWUvZG9ja2VyLWJ1aWxkL2J1
aWxkL3FlbXV4ODYtNjQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC94
ZW4tdG9vbHMvNC4xNitzdGFibGVBVVRPSU5DK2YyNjU0NDQ5MjItcjAvZ2l0
L3Rvb2xzL2xpYmFjcGkvLi4vLi4vdG9vbHMvaW5jbHVkZS94ZW4vYXJjaC14
ODYvLi4veGVuLmg6MzUsCnwgICAgICAgICAgICAgICAgICBmcm9tIC9ob21l
L2RvY2tlci1idWlsZC9idWlsZC9xZW11eDg2LTY0L3RtcC93b3JrL2NvcmUy
LTY0LXBva3ktbGludXgveGVuLXRvb2xzLzQuMTYrc3RhYmxlQVVUT0lOQytm
MjY1NDQ0OTIyLXIwL2dpdC90b29scy9saWJhY3BpLy4uLy4uL3Rvb2xzL2lu
Y2x1ZGUveGVuL2FyY2gteDg2L3hlbi5oOjI3LAp8ICAgICAgICAgICAgICAg
ICAgZnJvbSBta19kc2R0LmM6MjE6CnwgL2hvbWUvZG9ja2VyLWJ1aWxkL2J1
aWxkL3FlbXV4ODYtNjQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC94
ZW4tdG9vbHMvNC4xNitzdGFibGVBVVRPSU5DK2YyNjU0NDQ5MjItcjAvZ2l0
L3Rvb2xzL2xpYmFjcGkvLi4vLi4vdG9vbHMvaW5jbHVkZS94ZW4vYXJjaC14
ODYvLi4vYXJjaC1hcm0uaDozMTc6ODogbm90ZTogb3JpZ2luYWxseSBkZWZp
bmVkIGhlcmUKfCAgIDMxNyB8IHN0cnVjdCB4ZW5fYXJjaF9kb21haW5jb25m
aWcgewp8ICAgICAgIHwgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fgp8
IGNjMTogYWxsIHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3JzCnwg
bWFrZVs3XTogKioqIFtNYWtlZmlsZTo1MDogL2hvbWUvZG9ja2VyLWJ1aWxk
L2J1aWxkL3FlbXV4ODYtNjQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51
eC94ZW4tdG9vbHMvNC4xNitzdGFibGVBVVRPSU5DK2YyNjU0NDQ5MjItcjAv
Z2l0L3Rvb2xzL2xpYnMvbGlnaHQvbWtfZHNkdF0gRXJyb3IgMQp8IG1ha2Vb
N106IExlYXZpbmcgZGlyZWN0b3J5ICcvaG9tZS9kb2NrZXItYnVpbGQvYnVp
bGQvcWVtdXg4Ni02NC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4L3hl
bi10b29scy80LjE2K3N0YWJsZUFVVE9JTkMrZjI2NTQ0NDkyMi1yMC9naXQv
dG9vbHMvbGliYWNwaScKfCBtYWtlWzZdOiAqKiogW01ha2VmaWxlOjQxOiBh
Y3BpXSBFcnJvciAyCnwgbWFrZVs2XTogKioqIFdhaXRpbmcgZm9yIHVuZmlu
aXNoZWQgam9icy4uLi4KfCBQYXJzaW5nIGxpYnhsX3R5cGVzLmlkbAp8IG12
IC1mIF9saWJ4bC5hcGktZm9yLWNoZWNrLm5ldyBfbGlieGwuYXBpLWZvci1j
aGVjawp8IG12IHRlc3RpZGwuYy5uZXcgdGVzdGlkbC5jCnwgbWFrZVs2XTog
TGVhdmluZyBkaXJlY3RvcnkgJy9ob21lL2RvY2tlci1idWlsZC9idWlsZC9x
ZW11eDg2LTY0L3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgveGVuLXRv
b2xzLzQuMTYrc3RhYmxlQVVUT0lOQytmMjY1NDQ0OTIyLXIwL2dpdC90b29s
cy9saWJzL2xpZ2h0Jwp8IG1ha2VbNV06ICoqKiBbL2hvbWUvZG9ja2VyLWJ1
aWxkL2J1aWxkL3FlbXV4ODYtNjQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1s
aW51eC94ZW4tdG9vbHMvNC4xNitzdGFibGVBVVRPSU5DK2YyNjU0NDQ5MjIt
cjAvZ2l0L3Rvb2xzL2xpYnMvLi4vLi4vdG9vbHMvUnVsZXMubWs6MTY2OiBz
dWJkaXItaW5zdGFsbC1saWdodF0gRXJyb3IgMgp8IG1ha2VbNV06IExlYXZp
bmcgZGlyZWN0b3J5ICcvaG9tZS9kb2NrZXItYnVpbGQvYnVpbGQvcWVtdXg4
Ni02NC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4L3hlbi10b29scy80
LjE2K3N0YWJsZUFVVE9JTkMrZjI2NTQ0NDkyMi1yMC9naXQvdG9vbHMvbGli
cycKfCBtYWtlWzRdOiAqKiogWy9ob21lL2RvY2tlci1idWlsZC9idWlsZC9x
ZW11eDg2LTY0L3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgveGVuLXRv
b2xzLzQuMTYrc3RhYmxlQVVUT0lOQytmMjY1NDQ0OTIyLXIwL2dpdC90b29s
cy9saWJzLy4uLy4uL3Rvb2xzL1J1bGVzLm1rOjE2MTogc3ViZGlycy1pbnN0
YWxsXSBFcnJvciAyCnwgbWFrZVs0XTogTGVhdmluZyBkaXJlY3RvcnkgJy9o
b21lL2RvY2tlci1idWlsZC9idWlsZC9xZW11eDg2LTY0L3RtcC93b3JrL2Nv
cmUyLTY0LXBva3ktbGludXgveGVuLXRvb2xzLzQuMTYrc3RhYmxlQVVUT0lO
QytmMjY1NDQ0OTIyLXIwL2dpdC90b29scy9saWJzJwp8IG1ha2VbM106ICoq
KiBbL2hvbWUvZG9ja2VyLWJ1aWxkL2J1aWxkL3FlbXV4ODYtNjQvdG1wL3dv
cmsvY29yZTItNjQtcG9reS1saW51eC94ZW4tdG9vbHMvNC4xNitzdGFibGVB
VVRPSU5DK2YyNjU0NDQ5MjItcjAvZ2l0L3Rvb2xzLy4uL3Rvb2xzL1J1bGVz
Lm1rOjE2Njogc3ViZGlyLWluc3RhbGwtbGlic10gRXJyb3IgMgp8IG1ha2Vb
M106IExlYXZpbmcgZGlyZWN0b3J5ICcvaG9tZS9kb2NrZXItYnVpbGQvYnVp
bGQvcWVtdXg4Ni02NC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4L3hl
bi10b29scy80LjE2K3N0YWJsZUFVVE9JTkMrZjI2NTQ0NDkyMi1yMC9naXQv
dG9vbHMnCnwgbWFrZVsyXTogKioqIFsvaG9tZS9kb2NrZXItYnVpbGQvYnVp
bGQvcWVtdXg4Ni02NC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4L3hl
bi10b29scy80LjE2K3N0YWJsZUFVVE9JTkMrZjI2NTQ0NDkyMi1yMC9naXQv
dG9vbHMvLi4vdG9vbHMvUnVsZXMubWs6MTYxOiBzdWJkaXJzLWluc3RhbGxd
IEVycm9yIDIKfCBtYWtlWzJdOiBMZWF2aW5nIGRpcmVjdG9yeSAnL2hvbWUv
ZG9ja2VyLWJ1aWxkL2J1aWxkL3FlbXV4ODYtNjQvdG1wL3dvcmsvY29yZTIt
NjQtcG9reS1saW51eC94ZW4tdG9vbHMvNC4xNitzdGFibGVBVVRPSU5DK2Yy
NjU0NDQ5MjItcjAvZ2l0L3Rvb2xzJwp8IG1ha2VbMV06ICoqKiBbTWFrZWZp
bGU6NjY6IGluc3RhbGxdIEVycm9yIDIKfCBtYWtlWzFdOiBMZWF2aW5nIGRp
cmVjdG9yeSAnL2hvbWUvZG9ja2VyLWJ1aWxkL2J1aWxkL3FlbXV4ODYtNjQv
dG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC94ZW4tdG9vbHMvNC4xNitz
dGFibGVBVVRPSU5DK2YyNjU0NDQ5MjItcjAvZ2l0L3Rvb2xzJwp8IG1ha2U6
ICoqKiBbTWFrZWZpbGU6MTQwOiBpbnN0YWxsLXRvb2xzXSBFcnJvciAyCnwg
RVJST1I6IG9lX3J1bm1ha2UgZmFpbGVkCnwgV0FSTklORzogL2hvbWUvZG9j
a2VyLWJ1aWxkL2J1aWxkL3FlbXV4ODYtNjQvdG1wL3dvcmsvY29yZTItNjQt
cG9reS1saW51eC94ZW4tdG9vbHMvNC4xNitzdGFibGVBVVRPSU5DK2YyNjU0
NDQ5MjItcjAvdGVtcC9ydW4uZG9fY29tcGlsZS4yNTgxODk0OjIwMiBleGl0
IDEgZnJvbSAnZXhpdCAxJwp8IFdBUk5JTkc6IEJhY2t0cmFjZSAoQkIgZ2Vu
ZXJhdGVkIHNjcmlwdCk6CnwgICAgICAgIzE6IGJiZmF0YWxfbG9nLCAvaG9t
ZS9kb2NrZXItYnVpbGQvYnVpbGQvcWVtdXg4Ni02NC90bXAvd29yay9jb3Jl
Mi02NC1wb2t5LWxpbnV4L3hlbi10b29scy80LjE2K3N0YWJsZUFVVE9JTkMr
ZjI2NTQ0NDkyMi1yMC90ZW1wL3J1bi5kb19jb21waWxlLjI1ODE4OTQsIGxp
bmUgMjAyCnwgICAgICAgIzI6IGRpZSwgL2hvbWUvZG9ja2VyLWJ1aWxkL2J1
aWxkL3FlbXV4ODYtNjQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC94
ZW4tdG9vbHMvNC4xNitzdGFibGVBVVRPSU5DK2YyNjU0NDQ5MjItcjAvdGVt
cC9ydW4uZG9fY29tcGlsZS4yNTgxODk0LCBsaW5lIDE4Ngp8ICAgICAgICMz
OiBvZV9ydW5tYWtlLCAvaG9tZS9kb2NrZXItYnVpbGQvYnVpbGQvcWVtdXg4
Ni02NC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4L3hlbi10b29scy80
LjE2K3N0YWJsZUFVVE9JTkMrZjI2NTQ0NDkyMi1yMC90ZW1wL3J1bi5kb19j
b21waWxlLjI1ODE4OTQsIGxpbmUgMTgxCnwgICAgICAgIzQ6IGRvX2NvbXBp
bGUsIC9ob21lL2RvY2tlci1idWlsZC9idWlsZC9xZW11eDg2LTY0L3RtcC93
b3JrL2NvcmUyLTY0LXBva3ktbGludXgveGVuLXRvb2xzLzQuMTYrc3RhYmxl
QVVUT0lOQytmMjY1NDQ0OTIyLXIwL3RlbXAvcnVuLmRvX2NvbXBpbGUuMjU4
MTg5NCwgbGluZSAxNzUKfCAgICAgICAjNTogbWFpbiwgL2hvbWUvZG9ja2Vy
LWJ1aWxkL2J1aWxkL3FlbXV4ODYtNjQvdG1wL3dvcmsvY29yZTItNjQtcG9r
eS1saW51eC94ZW4tdG9vbHMvNC4xNitzdGFibGVBVVRPSU5DK2YyNjU0NDQ5
MjItcjAvdGVtcC9ydW4uZG9fY29tcGlsZS4yNTgxODk0LCBsaW5lIDIxNQpO
T1RFOiByZWNpcGUgeGVuLXRvb2xzLTQuMTYrc3RhYmxlQVVUT0lOQytmMjY1
NDQ0OTIyLXIwOiB0YXNrIGRvX2NvbXBpbGU6IEZhaWxlZApFUlJPUjogVGFz
ayAoL2hvbWUvZG9ja2VyLWJ1aWxkL3lvY3RvLWxheWVycy9tZXRhLXZpcnR1
YWxpemF0aW9uL3JlY2lwZXMtZXh0ZW5kZWQveGVuL3hlbi10b29sc180LjE2
LmJiOmRvX2NvbXBpbGUpIGZhaWxlZCB3aXRoIGV4aXQgY29kZSAnMScKTk9U
RTogcmVjaXBlIGdldHRleHQtMC4yMS1yMDogdGFzayBkb19wYWNrYWdlX3dy
aXRlX3JwbTogU3VjY2VlZGVkCk5PVEU6IHJlY2lwZSB4ZW4tNC4xNitzdGFi
bGVBVVRPSU5DK2YyNjU0NDQ5MjItcjA6IHRhc2sgZG9fY29tcGlsZTogU3Vj
Y2VlZGVkCk5PVEU6IFRhc2tzIFN1bW1hcnk6IEF0dGVtcHRlZCAzMzk2IHRh
c2tzIG9mIHdoaWNoIDAgZGlkbid0IG5lZWQgdG8gYmUgcmVydW4gYW5kIDEg
ZmFpbGVkLgoKU3VtbWFyeTogMSB0YXNrIGZhaWxlZDoKICAvaG9tZS9kb2Nr
ZXItYnVpbGQveW9jdG8tbGF5ZXJzL21ldGEtdmlydHVhbGl6YXRpb24vcmVj
aXBlcy1leHRlbmRlZC94ZW4veGVuLXRvb2xzXzQuMTYuYmI6ZG9fY29tcGls
ZQpTdW1tYXJ5OiBUaGVyZSB3YXMgMSBXQVJOSU5HIG1lc3NhZ2UuClN1bW1h
cnk6IFRoZXJlIHdlcmUgMiBFUlJPUiBtZXNzYWdlcywgcmV0dXJuaW5nIGEg
bm9uLXplcm8gZXhpdCBjb2RlLgojIyMjIyMjIyMjIyMgIExPR1MtRU5EICAj
IyMjIyMjIyMjIyMKCjA2OjMyOjE4IHJ1biBxZW11eDg2LTY0OiBFcnJvcgoK
IyMjIyMjIyMjIyMjIExPR1MtU1RBUlQgIyMjIyMjIyMjIyMjCnNwYXduIGJh
c2ggLWMgcnVucWVtdSBzZXJpYWxzdGRpbyBub2dyYXBoaWMgc2xpcnAKcnVu
cWVtdSAtIElORk8gLSBSdW5uaW5nIGJpdGJha2UgLWUgLi4uCmxzOiBjYW5u
b3QgYWNjZXNzICcvaG9tZS9kb2NrZXItYnVpbGQvYnVpbGQvcWVtdXg4Ni02
NC90bXAvZGVwbG95L2ltYWdlcy9xZW11eDg2LTY0LyoucWVtdWJvb3QuY29u
Zic6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKcnVucWVtdSAtIEVSUk9S
IC0gQ29tbWFuZCAnbHMgLXQgL2hvbWUvZG9ja2VyLWJ1aWxkL2J1aWxkL3Fl
bXV4ODYtNjQvdG1wL2RlcGxveS9pbWFnZXMvcWVtdXg4Ni02NC8qLnFlbXVi
b290LmNvbmYnIHJldHVybmVkIG5vbi16ZXJvIGV4aXQgc3RhdHVzIDIuCnJ1
bnFlbXUgLSBJTkZPIC0gQ2xlYW5pbmcgdXAKcnVucWVtdSAtIElORk8gLSBI
b3N0IHVwdGltZTogMTIyMDExLjgxCgp0cHV0OiBObyB2YWx1ZSBmb3IgJFRF
Uk0gYW5kIG5vIC1UIHNwZWNpZmllZApFUlJPUi1FT0YhCiMjIyMjIyMjIyMj
IyAgTE9HUy1FTkQgICMjIyMjIyMjIyMjIwoKMDY6MzI6MjAgQnVpbGQgQ29t
cGxldGUgKDIgZXJyb3JzKQpUaGUgY29tbWFuZCAnL2Jpbi9zaCAtYyAvYnVp
bGQteW9jdG8uc2ggLS1kdW1wLWxvZyBxZW11eDg2LTY0JyByZXR1cm5lZCBh
IG5vbi16ZXJvIGNvZGU6IDIKbWFrZTogKioqIFtNYWtlZmlsZToxOTogeW9j
dG8va2lya3N0b25lLXFlbXV4ODYtNjQtYXJtNjR2OF0gRXJyb3IgMgo=

--8323329-1987139687-1668809228=:1049131
Content-Type: application/octet-stream; NAME=build2.log
Content-Transfer-Encoding: BASE64
Content-ID: <alpine.DEB.2.22.394.2211181533381.1049131@ubuntu-linux-20-04-desktop>
Content-Description: 
Content-Disposition: ATTACHMENT; FILENAME=build2.log

LTY0L3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgveGVuLXRvb2xzLzQu
MTYrc3RhYmxlQVVUT0lOQytmMjY1NDQ0OTIyLXIwL3JlY2lwZS1zeXNyb290
LW5hdGl2ZT0gIC1Xbm8tZm9ybWF0LXplcm8tbGVuZ3RoIC1XbWlzc2luZy1k
ZWNsYXJhdGlvbnMgLVduby1kZWNsYXJhdGlvbi1hZnRlci1zdGF0ZW1lbnQg
LVdmb3JtYXQtbm9ubGl0ZXJhbCAtSS4gLXB0aHJlYWQgLVdlcnJvciAtV21p
c3NpbmctcHJvdG90eXBlcyAtSS4vaW5jbHVkZSAtSS9ob21lL2RvY2tlci1i
dWlsZC9idWlsZC9xZW11eDg2LTY0L3RtcC93b3JrL2NvcmUyLTY0LXBva3kt
bGludXgveGVuLXRvb2xzLzQuMTYrc3RhYmxlQVVUT0lOQytmMjY1NDQ0OTIy
LXIwL2dpdC90b29scy9saWJzL2xpZ2h0Ly4uLy4uLy4uL3Rvb2xzL2luY2x1
ZGUgIC1JL2hvbWUvZG9ja2VyLWJ1aWxkL2J1aWxkL3FlbXV4ODYtNjQvdG1w
L3dvcmsvY29yZTItNjQtcG9reS1saW51eC94ZW4tdG9vbHMvNC4xNitzdGFi
bGVBVVRPSU5DK2YyNjU0NDQ5MjItcjAvZ2l0L3Rvb2xzL2xpYnMvbGlnaHQv
Li4vLi4vLi4vdG9vbHMvaW5jbHVkZSAgLUkvaG9tZS9kb2NrZXItYnVpbGQv
YnVpbGQvcWVtdXg4Ni02NC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4
L3hlbi10b29scy80LjE2K3N0YWJsZUFVVE9JTkMrZjI2NTQ0NDkyMi1yMC9n
aXQvdG9vbHMvbGlicy9saWdodC8uLi8uLi8uLi90b29scy9pbmNsdWRlICAt
SS9ob21lL2RvY2tlci1idWlsZC9idWlsZC9xZW11eDg2LTY0L3RtcC93b3Jr
L2NvcmUyLTY0LXBva3ktbGludXgveGVuLXRvb2xzLzQuMTYrc3RhYmxlQVVU
T0lOQytmMjY1NDQ0OTIyLXIwL2dpdC90b29scy9saWJzL2xpZ2h0Ly4uLy4u
Ly4uL3Rvb2xzL2luY2x1ZGUgIC1JL2hvbWUvZG9ja2VyLWJ1aWxkL2J1aWxk
L3FlbXV4ODYtNjQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC94ZW4t
dG9vbHMvNC4xNitzdGFibGVBVVRPSU5DK2YyNjU0NDQ5MjItcjAvZ2l0L3Rv
b2xzL2xpYnMvbGlnaHQvLi4vLi4vLi4vdG9vbHMvaW5jbHVkZSAtRF9fWEVO
X1RPT0xTX18gIC1JL2hvbWUvZG9ja2VyLWJ1aWxkL2J1aWxkL3FlbXV4ODYt
NjQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC94ZW4tdG9vbHMvNC4x
NitzdGFibGVBVVRPSU5DK2YyNjU0NDQ5MjItcjAvZ2l0L3Rvb2xzL2xpYnMv
bGlnaHQvLi4vLi4vLi4vdG9vbHMvaW5jbHVkZSAgLUkvaG9tZS9kb2NrZXIt
YnVpbGQvYnVpbGQvcWVtdXg4Ni02NC90bXAvd29yay9jb3JlMi02NC1wb2t5
LWxpbnV4L3hlbi10b29scy80LjE2K3N0YWJsZUFVVE9JTkMrZjI2NTQ0NDky
Mi1yMC9naXQvdG9vbHMvbGlicy9saWdodC8uLi8uLi8uLi90b29scy9pbmNs
dWRlICAtSS9ob21lL2RvY2tlci1idWlsZC9idWlsZC9xZW11eDg2LTY0L3Rt
cC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgveGVuLXRvb2xzLzQuMTYrc3Rh
YmxlQVVUT0lOQytmMjY1NDQ0OTIyLXIwL2dpdC90b29scy9saWJzL2xpZ2h0
Ly4uLy4uLy4uL3Rvb2xzL2luY2x1ZGUgLUkvaG9tZS9kb2NrZXItYnVpbGQv
YnVpbGQvcWVtdXg4Ni02NC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4
L3hlbi10b29scy80LjE2K3N0YWJsZUFVVE9JTkMrZjI2NTQ0NDkyMi1yMC9y
ZWNpcGUtc3lzcm9vdC91c3IvaW5jbHVkZS9saWJubDMgLVdzaGFkb3cgLWlu
Y2x1ZGUgL2hvbWUvZG9ja2VyLWJ1aWxkL2J1aWxkL3FlbXV4ODYtNjQvdG1w
L3dvcmsvY29yZTItNjQtcG9reS1saW51eC94ZW4tdG9vbHMvNC4xNitzdGFi
bGVBVVRPSU5DK2YyNjU0NDQ5MjItcjAvZ2l0L3Rvb2xzL2xpYnMvbGlnaHQv
Li4vLi4vLi4vdG9vbHMvY29uZmlnLmggIC1jIC1vIGxpYnhsX2Jvb3Rsb2Fk
ZXIubyBsaWJ4bF9ib290bG9hZGVyLmMKfCBybSAtZiAvaG9tZS9kb2NrZXIt
YnVpbGQvYnVpbGQvcWVtdXg4Ni02NC90bXAvd29yay9jb3JlMi02NC1wb2t5
LWxpbnV4L3hlbi10b29scy80LjE2K3N0YWJsZUFVVE9JTkMrZjI2NTQ0NDky
Mi1yMC9naXQvdG9vbHMvbGlicy9saWdodC9zc2R0X3BtLmFtbCAvaG9tZS9k
b2NrZXItYnVpbGQvYnVpbGQvcWVtdXg4Ni02NC90bXAvd29yay9jb3JlMi02
NC1wb2t5LWxpbnV4L3hlbi10b29scy80LjE2K3N0YWJsZUFVVE9JTkMrZjI2
NTQ0NDkyMi1yMC9naXQvdG9vbHMvbGlicy9saWdodC9zc2R0X3BtLmhleAp8
IG1ha2VbN106IExlYXZpbmcgZGlyZWN0b3J5ICcvaG9tZS9kb2NrZXItYnVp
bGQvYnVpbGQvcWVtdXg4Ni02NC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxp
bnV4L3hlbi10b29scy80LjE2K3N0YWJsZUFVVE9JTkMrZjI2NTQ0NDkyMi1y
MC9naXQvdG9vbHMvbGliYWNwaScKfCBtYWtlWzZdOiAqKiogW01ha2VmaWxl
OjQxOiBhY3BpXSBFcnJvciAyCnwgbWFrZVs2XTogKioqIFdhaXRpbmcgZm9y
IHVuZmluaXNoZWQgam9icy4uLi4KfCBtYWtlWzZdOiBMZWF2aW5nIGRpcmVj
dG9yeSAnL2hvbWUvZG9ja2VyLWJ1aWxkL2J1aWxkL3FlbXV4ODYtNjQvdG1w
L3dvcmsvY29yZTItNjQtcG9reS1saW51eC94ZW4tdG9vbHMvNC4xNitzdGFi
bGVBVVRPSU5DK2YyNjU0NDQ5MjItcjAvZ2l0L3Rvb2xzL2xpYnMvbGlnaHQn
CnwgbWFrZVs1XTogTGVhdmluZyBkaXJlY3RvcnkgJy9ob21lL2RvY2tlci1i
dWlsZC9idWlsZC9xZW11eDg2LTY0L3RtcC93b3JrL2NvcmUyLTY0LXBva3kt
bGludXgveGVuLXRvb2xzLzQuMTYrc3RhYmxlQVVUT0lOQytmMjY1NDQ0OTIy
LXIwL2dpdC90b29scy9saWJzJwp8IG1ha2VbNV06ICoqKiBbL2hvbWUvZG9j
a2VyLWJ1aWxkL2J1aWxkL3FlbXV4ODYtNjQvdG1wL3dvcmsvY29yZTItNjQt
cG9reS1saW51eC94ZW4tdG9vbHMvNC4xNitzdGFibGVBVVRPSU5DK2YyNjU0
NDQ5MjItcjAvZ2l0L3Rvb2xzL2xpYnMvLi4vLi4vdG9vbHMvUnVsZXMubWs6
MTY2OiBzdWJkaXItaW5zdGFsbC1saWdodF0gRXJyb3IgMgp8IG1ha2VbNF06
IExlYXZpbmcgZGlyZWN0b3J5ICcvaG9tZS9kb2NrZXItYnVpbGQvYnVpbGQv
cWVtdXg4Ni02NC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4L3hlbi10
b29scy80LjE2K3N0YWJsZUFVVE9JTkMrZjI2NTQ0NDkyMi1yMC9naXQvdG9v
bHMvbGlicycKfCBtYWtlWzNdOiBMZWF2aW5nIGRpcmVjdG9yeSAnL2hvbWUv
ZG9ja2VyLWJ1aWxkL2J1aWxkL3FlbXV4ODYtNjQvdG1wL3dvcmsvY29yZTIt
NjQtcG9reS1saW51eC94ZW4tdG9vbHMvNC4xNitzdGFibGVBVVRPSU5DK2Yy
NjU0NDQ5MjItcjAvZ2l0L3Rvb2xzJwp8IG1ha2VbNF06ICoqKiBbL2hvbWUv
ZG9ja2VyLWJ1aWxkL2J1aWxkL3FlbXV4ODYtNjQvdG1wL3dvcmsvY29yZTIt
NjQtcG9reS1saW51eC94ZW4tdG9vbHMvNC4xNitzdGFibGVBVVRPSU5DK2Yy
NjU0NDQ5MjItcjAvZ2l0L3Rvb2xzL2xpYnMvLi4vLi4vdG9vbHMvUnVsZXMu
bWs6MTYxOiBzdWJkaXJzLWluc3RhbGxdIEVycm9yIDIKfCBtYWtlWzNdOiAq
KiogWy9ob21lL2RvY2tlci1idWlsZC9idWlsZC9xZW11eDg2LTY0L3RtcC93
b3JrL2NvcmUyLTY0LXBva3ktbGludXgveGVuLXRvb2xzLzQuMTYrc3RhYmxl
QVVUT0lOQytmMjY1NDQ0OTIyLXIwL2dpdC90b29scy8uLi90b29scy9SdWxl
cy5tazoxNjY6IHN1YmRpci1pbnN0YWxsLWxpYnNdIEVycm9yIDIKfCBtYWtl
WzJdOiAqKiogWy9ob21lL2RvY2tlci1idWlsZC9idWlsZC9xZW11eDg2LTY0
L3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgveGVuLXRvb2xzLzQuMTYr
c3RhYmxlQVVUT0lOQytmMjY1NDQ0OTIyLXIwL2dpdC90b29scy8uLi90b29s
cy9SdWxlcy5tazoxNjE6IHN1YmRpcnMtaW5zdGFsbF0gRXJyb3IgMgp8IG1h
a2VbMl06IExlYXZpbmcgZGlyZWN0b3J5ICcvaG9tZS9kb2NrZXItYnVpbGQv
YnVpbGQvcWVtdXg4Ni02NC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4
L3hlbi10b29scy80LjE2K3N0YWJsZUFVVE9JTkMrZjI2NTQ0NDkyMi1yMC9n
aXQvdG9vbHMnCnwgbWFrZVsxXTogKioqIFtNYWtlZmlsZTo2NjogaW5zdGFs
bF0gRXJyb3IgMgp8IG1ha2VbMV06IExlYXZpbmcgZGlyZWN0b3J5ICcvaG9t
ZS9kb2NrZXItYnVpbGQvYnVpbGQvcWVtdXg4Ni02NC90bXAvd29yay9jb3Jl
Mi02NC1wb2t5LWxpbnV4L3hlbi10b29scy80LjE2K3N0YWJsZUFVVE9JTkMr
ZjI2NTQ0NDkyMi1yMC9naXQvdG9vbHMnCnwgbWFrZTogKioqIFtNYWtlZmls
ZToxNDA6IGluc3RhbGwtdG9vbHNdIEVycm9yIDIKfCBFUlJPUjogb2VfcnVu
bWFrZSBmYWlsZWQKfCBXQVJOSU5HOiAvaG9tZS9kb2NrZXItYnVpbGQvYnVp
bGQvcWVtdXg4Ni02NC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4L3hl
bi10b29scy80LjE2K3N0YWJsZUFVVE9JTkMrZjI2NTQ0NDkyMi1yMC90ZW1w
L3J1bi5kb19jb21waWxlLjIyNDAzODQ6MjAyIGV4aXQgMSBmcm9tICdleGl0
IDEnCnwgV0FSTklORzogQmFja3RyYWNlIChCQiBnZW5lcmF0ZWQgc2NyaXB0
KToKfCAgICAgICAjMTogYmJmYXRhbF9sb2csIC9ob21lL2RvY2tlci1idWls
ZC9idWlsZC9xZW11eDg2LTY0L3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGlu
dXgveGVuLXRvb2xzLzQuMTYrc3RhYmxlQVVUT0lOQytmMjY1NDQ0OTIyLXIw
L3RlbXAvcnVuLmRvX2NvbXBpbGUuMjI0MDM4NCwgbGluZSAyMDIKfCAgICAg
ICAjMjogZGllLCAvaG9tZS9kb2NrZXItYnVpbGQvYnVpbGQvcWVtdXg4Ni02
NC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4L3hlbi10b29scy80LjE2
K3N0YWJsZUFVVE9JTkMrZjI2NTQ0NDkyMi1yMC90ZW1wL3J1bi5kb19jb21w
aWxlLjIyNDAzODQsIGxpbmUgMTg2CnwgICAgICAgIzM6IG9lX3J1bm1ha2Us
IC9ob21lL2RvY2tlci1idWlsZC9idWlsZC9xZW11eDg2LTY0L3RtcC93b3Jr
L2NvcmUyLTY0LXBva3ktbGludXgveGVuLXRvb2xzLzQuMTYrc3RhYmxlQVVU
T0lOQytmMjY1NDQ0OTIyLXIwL3RlbXAvcnVuLmRvX2NvbXBpbGUuMjI0MDM4
NCwgbGluZSAxODEKfCAgICAgICAjNDogZG9fY29tcGlsZSwgL2hvbWUvZG9j
a2VyLWJ1aWxkL2J1aWxkL3FlbXV4ODYtNjQvdG1wL3dvcmsvY29yZTItNjQt
cG9reS1saW51eC94ZW4tdG9vbHMvNC4xNitzdGFibGVBVVRPSU5DK2YyNjU0
NDQ5MjItcjAvdGVtcC9ydW4uZG9fY29tcGlsZS4yMjQwMzg0LCBsaW5lIDE3
NQp8ICAgICAgICM1OiBtYWluLCAvaG9tZS9kb2NrZXItYnVpbGQvYnVpbGQv
cWVtdXg4Ni02NC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4L3hlbi10
b29scy80LjE2K3N0YWJsZUFVVE9JTkMrZjI2NTQ0NDkyMi1yMC90ZW1wL3J1
bi5kb19jb21waWxlLjIyNDAzODQsIGxpbmUgMjE1Ck5PVEU6IHJlY2lwZSB4
ZW4tdG9vbHMtNC4xNitzdGFibGVBVVRPSU5DK2YyNjU0NDQ5MjItcjA6IHRh
c2sgZG9fY29tcGlsZTogRmFpbGVkCkVSUk9SOiBUYXNrICgvaG9tZS9kb2Nr
ZXItYnVpbGQveW9jdG8tbGF5ZXJzL21ldGEtdmlydHVhbGl6YXRpb24vcmVj
aXBlcy1leHRlbmRlZC94ZW4veGVuLXRvb2xzXzQuMTYuYmI6ZG9fY29tcGls
ZSkgZmFpbGVkIHdpdGggZXhpdCBjb2RlICcxJwpOT1RFOiByZWNpcGUgeGVu
LTQuMTYrc3RhYmxlQVVUT0lOQytmMjY1NDQ0OTIyLXIwOiB0YXNrIGRvX2Nv
bXBpbGU6IFN1Y2NlZWRlZApOT1RFOiByZWNpcGUgcWVtdS1zeXN0ZW0tbmF0
aXZlLTYuMi4wLXIwOiB0YXNrIGRvX2NvbXBpbGU6IFN1Y2NlZWRlZApOT1RF
OiBUYXNrcyBTdW1tYXJ5OiBBdHRlbXB0ZWQgMzM4OSB0YXNrcyBvZiB3aGlj
aCAwIGRpZG4ndCBuZWVkIHRvIGJlIHJlcnVuIGFuZCAxIGZhaWxlZC4KClN1
bW1hcnk6IDEgdGFzayBmYWlsZWQ6CiAgL2hvbWUvZG9ja2VyLWJ1aWxkL3lv
Y3RvLWxheWVycy9tZXRhLXZpcnR1YWxpemF0aW9uL3JlY2lwZXMtZXh0ZW5k
ZWQveGVuL3hlbi10b29sc180LjE2LmJiOmRvX2NvbXBpbGUKU3VtbWFyeTog
VGhlcmUgd2VyZSAyIEVSUk9SIG1lc3NhZ2VzLCByZXR1cm5pbmcgYSBub24t
emVybyBleGl0IGNvZGUuCiMjIyMjIyMjIyMjIyAgTE9HUy1FTkQgICMjIyMj
IyMjIyMjIwoKMjM6MTc6MzcgcnVuIHFlbXV4ODYtNjQ6IEVycm9yCgojIyMj
IyMjIyMjIyMgTE9HUy1TVEFSVCAjIyMjIyMjIyMjIyMKc3Bhd24gYmFzaCAt
YyBydW5xZW11IHNlcmlhbHN0ZGlvIG5vZ3JhcGhpYyBzbGlycApydW5xZW11
IC0gSU5GTyAtIFJ1bm5pbmcgYml0YmFrZSAtZSAuLi4KbHM6IGNhbm5vdCBh
Y2Nlc3MgJy9ob21lL2RvY2tlci1idWlsZC9idWlsZC9xZW11eDg2LTY0L3Rt
cC9kZXBsb3kvaW1hZ2VzL3FlbXV4ODYtNjQvKi5xZW11Ym9vdC5jb25mJzog
Tm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQpydW5xZW11IC0gRVJST1IgLSBD
b21tYW5kICdscyAtdCAvaG9tZS9kb2NrZXItYnVpbGQvYnVpbGQvcWVtdXg4
Ni02NC90bXAvZGVwbG95L2ltYWdlcy9xZW11eDg2LTY0LyoucWVtdWJvb3Qu
Y29uZicgcmV0dXJuZWQgbm9uLXplcm8gZXhpdCBzdGF0dXMgMi4KcnVucWVt
dSAtIElORk8gLSBDbGVhbmluZyB1cApydW5xZW11IC0gSU5GTyAtIEhvc3Qg
dXB0aW1lOiA4MTIzOS4yMgoKdHB1dDogTm8gdmFsdWUgZm9yICRURVJNIGFu
ZCBubyAtVCBzcGVjaWZpZWQKRVJST1ItRU9GIQojIyMjIyMjIyMjIyMgIExP
R1MtRU5EICAjIyMjIyMjIyMjIyMKCjIzOjE3OjM4IEJ1aWxkIENvbXBsZXRl
ICgyIGVycm9ycykKVGhlIGNvbW1hbmQgJy9iaW4vc2ggLWMgL2J1aWxkLXlv
Y3RvLnNoIC0tZHVtcC1sb2cgcWVtdXg4Ni02NCcgcmV0dXJuZWQgYSBub24t
emVybyBjb2RlOiAyCm1ha2U6ICoqKiBbTWFrZWZpbGU6MTk6IHlvY3RvL2tp
cmtzdG9uZS1xZW11eDg2LTY0LWFybTY0djhdIEVycm9yIDIK

--8323329-1987139687-1668809228=:1049131--

