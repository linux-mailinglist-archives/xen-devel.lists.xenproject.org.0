Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AF87622EC
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 22:04:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569914.891105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOOGI-0007yr-IW; Tue, 25 Jul 2023 20:04:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569914.891105; Tue, 25 Jul 2023 20:04:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOOGI-0007vZ-FV; Tue, 25 Jul 2023 20:04:02 +0000
Received: by outflank-mailman (input) for mailman id 569914;
 Tue, 25 Jul 2023 20:04:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ITxH=DL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qOOGG-0007un-Fh
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 20:04:00 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6381d33f-2b26-11ee-b240-6b7b168915f2;
 Tue, 25 Jul 2023 22:03:58 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0042F618BF;
 Tue, 25 Jul 2023 20:03:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E902C433C8;
 Tue, 25 Jul 2023 20:03:53 +0000 (UTC)
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
X-Inumbo-ID: 6381d33f-2b26-11ee-b240-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690315434;
	bh=MzWzGRJivhRCcOXKFZ9+FWvezZzk8r0YsmFhI005yyM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rq/lMFfDg/g7E5mxu15Mc5NzFFsEDboZOQ38N4vxTsqoqhP5P6kXFyCYhCDpXAlQM
	 ABzt7dVLvTkRDgXJhICKJ4FCIcCC5SjWe9d+3ZzduUM/TUvy50qF2ZiBTHismgB+eo
	 KtsZ7mHwmlERk65srxYUrrym+YizF0F2elhSLO11jAjQlvuTiOYoG4SRAtgFqmHGqa
	 mQ9JYyEA2yvfD9yZvL2ZJXSWEmrIJkSd/U3b5eGRY0dcjXO0W23JjTDbCI1vjORrDU
	 HbcBOI0DhchkRmcB0iKuIZnhXBRfmg1KoT39zZdY9W8t0W19+KwoucwA8Whng7pEKB
	 DtKwN0VBwMM9w==
Date: Tue, 25 Jul 2023 13:03:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 2/4] automation: Add xen builds for the ECLAIR
 analyses
In-Reply-To: <256dd32f1496400c7fc8554aa03db417e729c741.1690294965.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2307251256420.3118466@ubuntu-linux-20-04-desktop>
References: <cover.1690294965.git.simone.ballarin@bugseng.com> <256dd32f1496400c7fc8554aa03db417e729c741.1690294965.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 25 Jul 2023, Simone Ballarin wrote:
> This patch defines an ARM64 and a X86_64 build for the
> ECLAIR pipelines.
> 
> These files are used by the analyze.sh script in
> automation/eclair_analysis: it initially calls prepare.sh,
> then runs into an ECLAIR environment build.sh.
> 
> Only the toolchain invocations triggered by build.sh
> are analyzed; the prepare.sh script is instead intended
> to perform all the required operations for building xen
> that are not supposed to be analyzed: e.g. dependencies
> build.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> --
> Changes in v3:
> - split build definitions in a separate patch.
> 
> Changes in v2:
> - add ECLAIR configuration files (before they were fetched from a separate
>   repository);
> - now the pipeline fails if there are new violations of guidelines tagged
>   with clean:added.
> ---
>  automation/eclair_analysis/Makefile.prepare |   6 +
>  automation/eclair_analysis/build.sh         |  44 ++++++
>  automation/eclair_analysis/prepare.sh       |  42 ++++++
>  automation/eclair_analysis/xen_arm_config   | 147 +++++++++++++++++++
>  automation/eclair_analysis/xen_x86_config   | 152 ++++++++++++++++++++
>  5 files changed, 391 insertions(+)
>  create mode 100644 automation/eclair_analysis/Makefile.prepare
>  create mode 100755 automation/eclair_analysis/build.sh
>  create mode 100755 automation/eclair_analysis/prepare.sh
>  create mode 100644 automation/eclair_analysis/xen_arm_config
>  create mode 100644 automation/eclair_analysis/xen_x86_config
> 
> diff --git a/automation/eclair_analysis/Makefile.prepare b/automation/eclair_analysis/Makefile.prepare
> new file mode 100644
> index 0000000000..90f4a31172
> --- /dev/null
> +++ b/automation/eclair_analysis/Makefile.prepare
> @@ -0,0 +1,6 @@
> +include Makefile
> +prepare:
> +	$(Q)$(MAKE) $(build)=tools
> +	$(Q)$(MAKE) $(build)=. include/xen/compile.h
> +	$(Q)$(MAKE) $(build)=include all
> +	$(Q)$(MAKE) $(build)=arch/$(SRCARCH) include
> diff --git a/automation/eclair_analysis/build.sh b/automation/eclair_analysis/build.sh
> new file mode 100755
> index 0000000000..ec087dd822
> --- /dev/null
> +++ b/automation/eclair_analysis/build.sh
> @@ -0,0 +1,44 @@
> +#!/bin/bash
> +# Stop immediately if any executed command has exit status different from 0.
> +set -e
> +
> +script_name="$(basename "$0")"
> +
> +fatal() {
> +  echo "${script_name}: $*" >&2
> +  exit 1
> +}
> +
> +usage() {
> +  fatal "Usage: ${script_name} <ARM64|X86_64>"
> +}
> +
> +if [ $# -ne 1 ]; then
> +  usage
> +fi
> +
> +if [ "$1" = "X86_64" ]; then
> +  export CROSS_COMPILE=
> +  export XEN_TARGET_ARCH=x86_64
> +elif [ "$1" = "ARM64" ]; then
> +  export CROSS_COMPILE=aarch64-linux-gnu-
> +  export XEN_TARGET_ARCH=arm64
> +else
> +  fatal "Unknown configuration: $1"
> +fi
> +
> +if [[ -f /proc/cpuinfo ]]; then
> +  PROCESSORS=$(grep -c ^processor /proc/cpuinfo)
> +else
> +  PROCESSORS=6
> +fi
> +
> +(
> +  cd xen
> +
> +  make "-j${PROCESSORS}" "-l${PROCESSORS}.0"    \
> +       "CROSS_COMPILE=${CROSS_COMPILE}"         \
> +       "CC=${CROSS_COMPILE}gcc-12"              \
> +       "CXX=${CROSS_COMPILE}g++-12"             \
> +       "XEN_TARGET_ARCH=${XEN_TARGET_ARCH}"
> +)
> diff --git a/automation/eclair_analysis/prepare.sh b/automation/eclair_analysis/prepare.sh
> new file mode 100755
> index 0000000000..275a1a3f51
> --- /dev/null
> +++ b/automation/eclair_analysis/prepare.sh
> @@ -0,0 +1,42 @@
> +#!/bin/bash
> +# Stop immediately if any executed command has exit status different from 0.
> +set -e
> +
> +script_name="$(basename "$0")"
> +script_dir="$(
> +  cd "$(dirname "$0")"
> +  echo "${PWD}"
> +)"
> +
> +fatal() {
> +  echo "${script_name}: $*" >&2
> +  exit 1
> +}
> +
> +usage() {
> +  fatal "Usage: ${script_name}"
> +}
> +
> +if [ $# -ne 1 ]; then
> +  usage
> +  exit 1
> +fi
> +
> +export XEN_TARGET_ARCH
> +
> +if [ "$1" = "X86_64" ]; then
> +  CONFIG_FILE="${script_dir}/xen_x86_config"
> +  XEN_TARGET_ARCH=x86_64
> +elif [ "$1" = "ARM64" ]; then
> +  CONFIG_FILE="${script_dir}/xen_arm_config"
> +  XEN_TARGET_ARCH=arm64
> +else
> +  fatal "Unknown configuration: $1"
> +fi
> +
> +(
> +    cd xen
> +    cp "${CONFIG_FILE}" .config
> +    make clean
> +    make -f ${script_dir}/Makefile.prepare prepare
> +)
> diff --git a/automation/eclair_analysis/xen_arm_config b/automation/eclair_analysis/xen_arm_config
> new file mode 100644
> index 0000000000..82102b889e
> --- /dev/null
> +++ b/automation/eclair_analysis/xen_arm_config
> @@ -0,0 +1,147 @@
> +# File provided in
> +# Re: Xen MISRA C: Source files in scope and out of scope
> +# from:	Stefano Stabellini <stefano.stabellini@amd.com>
> +# date:	6 giu 2023, 02:53
> +
> +#
> +# Automatically generated file; DO NOT EDIT.
> +# Xen/arm 4.18-unstable Configuration
> +#
> +CONFIG_CC_IS_GCC=y
> +CONFIG_GCC_VERSION=90400
> +CONFIG_CLANG_VERSION=0
> +CONFIG_LD_IS_GNU=y
> +CONFIG_CC_HAS_VISIBILITY_ATTRIBUTE=y
> +CONFIG_ARM_64=y
> +CONFIG_ARM=y
> +CONFIG_ARCH_DEFCONFIG="arch/arm/configs/arm64_defconfig"
> +
> +# UBSAN
> +CONFIG_UBSAN=n
> +
> +#
> +# Architecture Features
> +#
> +CONFIG_ARM64_SVE=n
> +CONFIG_64BIT=y
> +CONFIG_NR_CPUS=4
> +# CONFIG_ACPI is not set
> +CONFIG_ARM_EFI=y
> +CONFIG_GICV3=y
> +CONFIG_HAS_ITS=y
> +CONFIG_HVM=y
> +# CONFIG_NEW_VGIC is not set
> +CONFIG_SBSA_VUART_CONSOLE=y
> +CONFIG_ARM_SSBD=y
> +CONFIG_HARDEN_BRANCH_PREDICTOR=y
> +# CONFIG_TEE is not set
> +# CONFIG_STATIC_SHM is not set
> +# end of Architecture Features
> +
> +#
> +# ARM errata workaround via the alternative framework
> +#
> +CONFIG_ARM64_ERRATUM_827319=y
> +CONFIG_ARM64_ERRATUM_824069=y
> +CONFIG_ARM64_ERRATUM_819472=y
> +CONFIG_ARM64_ERRATUM_843419=y
> +CONFIG_ARM64_ERRATUM_832075=y
> +CONFIG_ARM64_ERRATUM_834220=y
> +CONFIG_ARM_ERRATUM_858921=y
> +CONFIG_ARM64_WORKAROUND_REPEAT_TLBI=y
> +CONFIG_ARM64_ERRATUM_1286807=y
> +# end of ARM errata workaround via the alternative framework
> +
> +CONFIG_ARM64_HARDEN_BRANCH_PREDICTOR=y
> +# CONFIG_ALL_PLAT is not set
> +# CONFIG_QEMU is not set
> +# CONFIG_RCAR3 is not set
> +CONFIG_MPSOC=y
> +# CONFIG_NO_PLAT is not set
> +CONFIG_MPSOC_PLATFORM=y
> +
> +#
> +# Common Features
> +#
> +CONFIG_GRANT_TABLE=y
> +CONFIG_HAS_ALTERNATIVE=y
> +CONFIG_HAS_DEVICE_TREE=y
> +CONFIG_HAS_FAST_MULTIPLY=y
> +CONFIG_HAS_PDX=y
> +CONFIG_HAS_PMAP=y
> +# CONFIG_MEM_ACCESS is not set
> +CONFIG_STATIC_MEMORY=y
> +
> +#
> +# Speculative hardening
> +#
> +CONFIG_SPECULATIVE_HARDEN_ARRAY=y
> +# end of Speculative hardening
> +
> +# CONFIG_HYPFS is not set
> +CONFIG_IOREQ_SERVER=y
> +# CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP is not set
> +# CONFIG_XSM is not set
> +# CONFIG_ARGO is not set
> +
> +#
> +# Schedulers
> +#
> +# CONFIG_SCHED_CREDIT is not set
> +CONFIG_SCHED_CREDIT2=y
> +# CONFIG_SCHED_RTDS is not set
> +# CONFIG_SCHED_ARINC653 is not set
> +CONFIG_SCHED_NULL=y
> +CONFIG_SCHED_CREDIT2_DEFAULT=y
> +# CONFIG_SCHED_NULL_DEFAULT is not set
> +CONFIG_SCHED_DEFAULT="credit2"
> +# end of Schedulers
> +
> +CONFIG_BOOT_TIME_CPUPOOLS=y
> +# CONFIG_LIVEPATCH is not set
> +# CONFIG_ENFORCE_UNIQUE_SYMBOLS is not set
> +CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS=y
> +CONFIG_CMDLINE=""
> +CONFIG_DOM0_MEM=""
> +CONFIG_DTB_FILE=""
> +# CONFIG_TRACEBUFFER is not set
> +# end of Common Features
> +
> +#
> +# Device Drivers
> +#
> +# CONFIG_HAS_NS16550 is not set
> +CONFIG_HAS_CADENCE_UART=y
> +# CONFIG_HAS_IMX_LPUART is not set
> +# CONFIG_HAS_MVEBU is not set
> +# CONFIG_HAS_MESON is not set
> +CONFIG_HAS_PL011=y
> +# CONFIG_HAS_SCIF is not set
> +CONFIG_SERIAL_TX_BUFSIZE=16384
> +CONFIG_HAS_PASSTHROUGH=y
> +CONFIG_ARM_SMMU=y
> +CONFIG_ARM_SMMU_V3=y
> +# CONFIG_IPMMU_VMSA is not set
> +CONFIG_IOMMU_FORCE_PT_SHARE=y
> +# end of Device Drivers
> +
> +CONFIG_EXPERT=y
> +CONFIG_UNSUPPORTED=y
> +
> +#
> +# Debugging Options
> +#
> +CONFIG_DEBUG=y
> +CONFIG_FRAME_POINTER=y
> +CONFIG_COVERAGE=y
> +CONFIG_DEBUG_LOCK_PROFILE=y
> +CONFIG_DEBUG_LOCKS=y
> +CONFIG_PERF_COUNTERS=y
> +CONFIG_PERF_ARRAYS=y
> +CONFIG_VERBOSE_DEBUG=y
> +CONFIG_DEVICE_TREE_DEBUG=y
> +CONFIG_SCRUB_DEBUG=y
> +CONFIG_DEBUG_TRACE=y
> +CONFIG_XMEM_POOL_POISON=y
> +CONFIG_DEBUG_INFO=y
> +# end of Debugging Options
> diff --git a/automation/eclair_analysis/xen_x86_config b/automation/eclair_analysis/xen_x86_config
> new file mode 100644
> index 0000000000..9b2709bfc8
> --- /dev/null
> +++ b/automation/eclair_analysis/xen_x86_config
> @@ -0,0 +1,152 @@
> +# File provided in
> +# Re: Xen MISRA C: Source files in scope and out of scope
> +# from:	Stefano Stabellini <stefano.stabellini@amd.com> 
> +# date:	6 giu 2023, 02:53
> +
> +#
> +# Automatically generated file; DO NOT EDIT.
> +# Xen/x86 4.18-unstable Configuration
> +#
> +CONFIG_CC_IS_GCC=y
> +CONFIG_GCC_VERSION=90400
> +CONFIG_CLANG_VERSION=0
> +CONFIG_LD_IS_GNU=y
> +CONFIG_CC_HAS_VISIBILITY_ATTRIBUTE=y
> +CONFIG_X86_64=y
> +CONFIG_X86=y
> +CONFIG_ARCH_DEFCONFIG="arch/x86/configs/x86_64_defconfig"
> +CONFIG_CC_HAS_INDIRECT_THUNK=y
> +CONFIG_HAS_AS_CET_SS=y
> +CONFIG_HAS_CC_CET_IBT=y
> +
> +CONFIG_REQUIRE_NX=n
> +
> +#
> +# Architecture Features
> +#
> +CONFIG_64BIT=y
> +CONFIG_NR_CPUS=16
> +CONFIG_NR_NUMA_NODES=2
> +# CONFIG_PV is not set
> +CONFIG_HVM=y
> +# CONFIG_XEN_SHSTK is not set
> +# CONFIG_XEN_IBT is not set
> +# CONFIG_SHADOW_PAGING is not set
> +# CONFIG_BIGMEM is not set
> +# CONFIG_HVM_FEP is not set
> +# CONFIG_TBOOT is not set
> +CONFIG_XEN_ALIGN_DEFAULT=y
> +# CONFIG_XEN_ALIGN_2M is not set
> +CONFIG_X2APIC_PHYSICAL=y
> +# CONFIG_XEN_GUEST is not set
> +# CONFIG_HYPERV_GUEST is not set
> +# CONFIG_MEM_PAGING is not set
> +# CONFIG_MEM_SHARING is not set
> +# end of Architecture Features
> +
> +#
> +# Common Features
> +#
> +CONFIG_COMPAT=y
> +CONFIG_CORE_PARKING=y
> +CONFIG_GRANT_TABLE=y
> +CONFIG_ALTERNATIVE_CALL=y
> +CONFIG_ARCH_MAP_DOMAIN_PAGE=y
> +CONFIG_GENERIC_BUG_FRAME=y
> +CONFIG_HAS_ALTERNATIVE=y
> +CONFIG_HAS_COMPAT=y
> +CONFIG_HAS_EX_TABLE=y
> +CONFIG_HAS_FAST_MULTIPLY=y
> +CONFIG_HAS_IOPORTS=y
> +CONFIG_HAS_KEXEC=y
> +CONFIG_HAS_PDX=y
> +CONFIG_HAS_SCHED_GRANULARITY=y
> +CONFIG_HAS_UBSAN=y
> +CONFIG_MEM_ACCESS_ALWAYS_ON=y
> +CONFIG_MEM_ACCESS=y
> +CONFIG_NEEDS_LIBELF=y
> +CONFIG_NUMA=y
> +
> +#
> +# Speculative hardening
> +#
> +CONFIG_INDIRECT_THUNK=y
> +CONFIG_SPECULATIVE_HARDEN_ARRAY=y
> +CONFIG_SPECULATIVE_HARDEN_BRANCH=y
> +# end of Speculative hardening
> +
> +# CONFIG_HYPFS is not set
> +CONFIG_IOREQ_SERVER=y
> +# CONFIG_KEXEC is not set
> +# CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP is not set
> +# CONFIG_XENOPROF is not set
> +# CONFIG_XSM is not set
> +# CONFIG_ARGO is not set
> +
> +#
> +# Schedulers
> +#
> +# CONFIG_SCHED_CREDIT is not set
> +CONFIG_SCHED_CREDIT2=y
> +# CONFIG_SCHED_RTDS is not set
> +# CONFIG_SCHED_ARINC653 is not set
> +CONFIG_SCHED_NULL=y
> +CONFIG_SCHED_CREDIT2_DEFAULT=y
> +# CONFIG_SCHED_NULL_DEFAULT is not set
> +CONFIG_SCHED_DEFAULT="credit2"
> +# end of Schedulers
> +
> +# CONFIG_LIVEPATCH is not set
> +# CONFIG_ENFORCE_UNIQUE_SYMBOLS is not set
> +# CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS is not set
> +CONFIG_CMDLINE=""
> +CONFIG_DOM0_MEM=""
> +# CONFIG_TRACEBUFFER is not set
> +# end of Common Features
> +
> +#
> +# Device Drivers
> +#
> +CONFIG_ACPI=y
> +CONFIG_ACPI_LEGACY_TABLES_LOOKUP=y
> +CONFIG_ACPI_NUMA=y
> +CONFIG_HAS_NS16550=y
> +CONFIG_HAS_EHCI=y
> +CONFIG_SERIAL_TX_BUFSIZE=16384
> +# CONFIG_XHCI is not set
> +CONFIG_HAS_CPUFREQ=y
> +CONFIG_HAS_PASSTHROUGH=y
> +CONFIG_AMD_IOMMU=y
> +# CONFIG_INTEL_IOMMU is not set
> +# CONFIG_IOMMU_QUARANTINE_NONE is not set
> +CONFIG_IOMMU_QUARANTINE_BASIC=y
> +# CONFIG_IOMMU_QUARANTINE_SCRATCH_PAGE is not set
> +CONFIG_HAS_PCI=y
> +CONFIG_HAS_PCI_MSI=y
> +CONFIG_VIDEO=y
> +CONFIG_VGA=y
> +CONFIG_HAS_VPCI=y
> +# end of Device Drivers
> +
> +CONFIG_EXPERT=y
> +CONFIG_UNSUPPORTED=y
> +CONFIG_ARCH_SUPPORTS_INT128=y
> +
> +#
> +# Debugging Options
> +#
> +CONFIG_DEBUG=y
> +# CONFIG_CRASH_DEBUG is not set
> +CONFIG_GDBSX=y
> +CONFIG_FRAME_POINTER=y
> +# CONFIG_COVERAGE is not set
> +# CONFIG_DEBUG_LOCK_PROFILE is not set
> +CONFIG_DEBUG_LOCKS=y
> +# CONFIG_PERF_COUNTERS is not set
> +CONFIG_VERBOSE_DEBUG=y
> +CONFIG_SCRUB_DEBUG=y
> +# CONFIG_UBSAN is not set
> +# CONFIG_DEBUG_TRACE is not set
> +CONFIG_XMEM_POOL_POISON=y
> +CONFIG_DEBUG_INFO=y
> +# end of Debugging Options
> -- 
> 2.34.1
> 

