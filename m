Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BA78BA029
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 20:17:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716126.1118214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2az5-0001yh-Bx; Thu, 02 May 2024 18:16:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716126.1118214; Thu, 02 May 2024 18:16:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2az5-0001wi-8P; Thu, 02 May 2024 18:16:43 +0000
Received: by outflank-mailman (input) for mailman id 716126;
 Thu, 02 May 2024 18:16:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Qsp=MF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s2az3-0001wc-Qg
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 18:16:41 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e4736b4-08b0-11ef-909b-e314d9c70b13;
 Thu, 02 May 2024 20:16:39 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E689C61C00;
 Thu,  2 May 2024 18:16:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20C3AC113CC;
 Thu,  2 May 2024 18:16:32 +0000 (UTC)
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
X-Inumbo-ID: 1e4736b4-08b0-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714673797;
	bh=rwNEAoQNXpcPPM83mK5yiJdPzVUoLdLwJ399JpicAp8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=T5nOwUxTKVqb4UFVkVHc1Xh82DB3ObUayoC68S0UWzD9N9CRSTDBZv6WjOXTZ9K1/
	 +eda8uqphVEPq7NE8CdYAomc6IlgfGbcLcZTTIkM5FrAbCTEvDDnJ6seI67mitB3DZ
	 PRPd0NZvwg6K4Y6B0IJd2GMtoBo+Z5pxOYQ75moKVzCJ43UJkRz+rrcZkOLEbQRxg/
	 K3Zk+JMUQpWzoMKqxLOYrEVyIebpTUdD86Mczp3BG3EsT004va3Op++qvh1Oo4lTKv
	 AeQwfkE0z7NOVb8surCs+I+QsJm55wWoL1eQylCbq1NPKxv4W/qJmX8m/pBCtPeMCG
	 kMsIl/XWr6dCA==
Date: Thu, 2 May 2024 11:16:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH] xen/Kconfig: Drop the final remnants of ---help---
In-Reply-To: <20240502181049.1361384-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2405021116250.624854@ubuntu-linux-20-04-desktop>
References: <20240502181049.1361384-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 2 May 2024, Andrew Cooper wrote:
> We deprecated the use of ---help--- a while ago, but a lot of new content
> copy&pastes bad examples.  Convert the remaining instances, and update
> Kconfig's parser to no longer recongise it.
> 
> This now causes builds to fail with:
> 
>   Kconfig.debug:8: syntax error
>   Kconfig.debug:7: unknown statement "---help---"
> 
> which short circuits one common piece of churn in new content.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: George Dunlap <George.Dunlap@citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> For 4.19.  This cleans up a legacy we've been wanting to get rid of for a
> while, and will be least disruptive on people if it gets in ahead of most
> people starting work for 4.20.
> ---
>  xen/Kconfig                     |  2 +-
>  xen/Kconfig.debug               | 28 +++++++++----------
>  xen/arch/arm/Kconfig            |  8 +++---
>  xen/arch/arm/platforms/Kconfig  | 12 ++++-----
>  xen/arch/x86/Kconfig            | 32 +++++++++++-----------
>  xen/common/Kconfig              | 48 ++++++++++++++++-----------------
>  xen/common/sched/Kconfig        | 10 +++----
>  xen/drivers/passthrough/Kconfig |  8 +++---
>  xen/drivers/video/Kconfig       |  2 +-
>  xen/tools/kconfig/lexer.l       |  2 +-
>  10 files changed, 76 insertions(+), 76 deletions(-)
> 
> diff --git a/xen/Kconfig b/xen/Kconfig
> index 1e1b041fd52f..e459cdac0cd7 100644
> --- a/xen/Kconfig
> +++ b/xen/Kconfig
> @@ -84,7 +84,7 @@ config UNSUPPORTED
>  config LTO
>  	bool "Link Time Optimisation"
>  	depends on BROKEN
> -	---help---
> +	help
>  	  Enable Link Time Optimisation.
>  
>  	  If unsure, say N.
> diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
> index fa81853e9385..61b24ac552cd 100644
> --- a/xen/Kconfig.debug
> +++ b/xen/Kconfig.debug
> @@ -4,7 +4,7 @@ menu "Debugging Options"
>  config DEBUG
>  	bool "Developer Checks"
>  	default y
> -	---help---
> +	help
>  	  If you say Y here this will enable developer checks such as asserts
>  	  and extra printks. This option is intended for development purposes
>  	  only, and not for production use.
> @@ -17,14 +17,14 @@ config GDBSX
>  	bool "Guest debugging with gdbsx"
>  	depends on X86
>  	default y
> -	---help---
> +	help
>  	  If you want to enable support for debugging guests from dom0 via
>  	  gdbsx then say Y.
>  
>  config FRAME_POINTER
>  	bool "Compile Xen with frame pointers"
>  	default DEBUG
> -	---help---
> +	help
>  	  If you say Y here the resulting Xen will be slightly larger and
>  	  maybe slower, but it gives very useful debugging information
>  	  in case of any Xen bugs.
> @@ -33,7 +33,7 @@ config COVERAGE
>  	bool "Code coverage support"
>  	depends on !LIVEPATCH
>  	select SUPPRESS_DUPLICATE_SYMBOL_WARNINGS if !ENFORCE_UNIQUE_SYMBOLS
> -	---help---
> +	help
>  	  Enable code coverage support.
>  
>  	  If unsure, say N here.
> @@ -41,7 +41,7 @@ config COVERAGE
>  config DEBUG_LOCK_PROFILE
>  	bool "Lock Profiling"
>  	select DEBUG_LOCKS
> -	---help---
> +	help
>  	  Lock profiling allows you to see how often locks are taken and blocked.
>  	  You can use serial console to print (and reset) using 'l' and 'L'
>  	  respectively, or the 'xenlockprof' tool.
> @@ -49,13 +49,13 @@ config DEBUG_LOCK_PROFILE
>  config DEBUG_LOCKS
>  	bool "Lock debugging"
>  	default DEBUG
> -	---help---
> +	help
>  	  Enable debugging features of lock handling.  Some additional
>  	  checks will be performed when acquiring and releasing locks.
>  
>  config PERF_COUNTERS
>  	bool "Performance Counters"
> -	---help---
> +	help
>  	  Enables software performance counters that allows you to analyze
>  	  bottlenecks in the system.  To access this data you can use serial
>  	  console to print (and reset) using 'p' and 'P' respectively, or
> @@ -64,21 +64,21 @@ config PERF_COUNTERS
>  config PERF_ARRAYS
>  	bool "Performance Counter Array Histograms"
>  	depends on PERF_COUNTERS
> -	---help---
> +	help
>  	  Enables software performance counter array histograms.
>  
>  
>  config VERBOSE_DEBUG
>  	bool "Verbose debug messages"
>  	default DEBUG
> -	---help---
> +	help
>  	  Guest output from HYPERVISOR_console_io and hypervisor parsing
>  	  ELF images (dom0) will be logged in the Xen ring buffer.
>  
>  config DEVICE_TREE_DEBUG
>  	bool "Device tree debug messages"
>  	depends on HAS_DEVICE_TREE
> -	---help---
> +	help
>  	  Device tree parsing and DOM0 device tree building messages are
>  	  logged in the Xen ring buffer.
>  	  If unsure, say N here.
> @@ -86,14 +86,14 @@ config DEVICE_TREE_DEBUG
>  config SCRUB_DEBUG
>  	bool "Page scrubbing test"
>  	default DEBUG
> -	---help---
> +	help
>  	  Verify that pages that need to be scrubbed before being allocated to
>  	  a guest are indeed scrubbed.
>  
>  config UBSAN
>  	bool "Undefined behaviour sanitizer"
>  	depends on HAS_UBSAN
> -	---help---
> +	help
>  	  Enable undefined behaviour sanitizer. It uses compiler to insert code
>  	  snippets so that undefined behaviours in C are detected during runtime.
>  	  This requires a UBSAN capable compiler and it is a debug only feature.
> @@ -109,7 +109,7 @@ config UBSAN_FATAL
>  
>  config DEBUG_TRACE
>  	bool "Debug trace support"
> -	---help---
> +	help
>  	  Debug trace enables to record debug trace messages which are printed
>  	  either directly to the console or are printed to console in case of
>  	  a system crash.
> @@ -117,7 +117,7 @@ config DEBUG_TRACE
>  config XMEM_POOL_POISON
>  	bool "Poison free xenpool blocks"
>  	default DEBUG
> -	---help---
> +	help
>  	  Poison free blocks with 0xAA bytes and verify them when a block is
>  	  allocated in order to spot use-after-free issues.
>  
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index f8139a773a43..21d03d9f4424 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -67,7 +67,7 @@ source "arch/Kconfig"
>  config ACPI
>  	bool "ACPI (Advanced Configuration and Power Interface) Support (UNSUPPORTED)" if UNSUPPORTED
>  	depends on ARM_64 && ARM_EFI
> -	---help---
> +	help
>  
>  	  Advanced Configuration and Power Interface (ACPI) support for Xen is
>  	  an alternative to device tree on ARM64. This requires UEFI.
> @@ -102,7 +102,7 @@ config GICV3
>  	depends on !NEW_VGIC
>  	default n if ARM_32
>  	default y if ARM_64
> -	---help---
> +	help
>  
>  	  Driver for the ARM Generic Interrupt Controller v3.
>  	  If unsure, use the default setting.
> @@ -132,7 +132,7 @@ config HVM
>  config NEW_VGIC
>  	bool "Use new VGIC implementation"
>  	select GICV2
> -	---help---
> +	help
>  
>  	This is an alternative implementation of the ARM GIC interrupt
>  	controller emulation, based on the Linux/KVM VGIC. It has a better
> @@ -147,7 +147,7 @@ config NEW_VGIC
>  config SBSA_VUART_CONSOLE
>  	bool "Emulated SBSA UART console support"
>  	default y
> -	---help---
> +	help
>  	  Allows a guest to use SBSA Generic UART as a console. The
>  	  SBSA Generic UART implements a subset of ARM PL011 UART.
>  
> diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kconfig
> index c93a6b275620..76f7e76b1bf4 100644
> --- a/xen/arch/arm/platforms/Kconfig
> +++ b/xen/arch/arm/platforms/Kconfig
> @@ -1,14 +1,14 @@
>  choice
>  	prompt "Platform Support"
>  	default ALL_PLAT
> -	---help---
> +	help
>  	Choose which hardware platform to enable in Xen.
>  
>  	If unsure, choose ALL_PLAT.
>  
>  config ALL_PLAT
>  	bool "All Platforms"
> -	---help---
> +	help
>  	Enable support for all available hardware platforms. It doesn't
>  	automatically select any of the related drivers.
>  
> @@ -17,7 +17,7 @@ config QEMU
>  	depends on ARM_64
>  	select GICV3
>  	select HAS_PL011
> -	---help---
> +	help
>  	Enable all the required drivers for QEMU aarch64 virt emulated
>  	machine.
>  
> @@ -26,7 +26,7 @@ config RCAR3
>  	depends on ARM_64
>  	select HAS_SCIF
>  	select IPMMU_VMSA
> -	---help---
> +	help
>  	Enable all the required drivers for Renesas RCar3
>  
>  config MPSOC
> @@ -34,12 +34,12 @@ config MPSOC
>  	depends on ARM_64
>  	select HAS_CADENCE_UART
>  	select ARM_SMMU
> -	---help---
> +	help
>  	Enable all the required drivers for Xilinx Ultrascale+ MPSoC
>  
>  config NO_PLAT
>  	bool "No Platforms"
> -	---help---
> +	help
>  	Do not enable specific support for any platform.
>  
>  endchoice
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index 2b6248774d8f..7e03e4bc5546 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -58,7 +58,7 @@ source "arch/Kconfig"
>  config PV
>  	def_bool y
>  	prompt "PV support"
> -	---help---
> +	help
>  	  Interfaces to support PV domains. These require guest kernel support
>  	  to run as a PV guest, but don't require any specific hardware support.
>  
> @@ -71,7 +71,7 @@ config PV32
>  	depends on PV
>  	default PV_SHIM
>  	select COMPAT
> -	---help---
> +	help
>  	  The 32bit PV ABI uses Ring1, an area of the x86 architecture which
>  	  was deprecated and mostly removed in the AMD64 spec.  As a result,
>  	  it occasionally conflicts with newer x86 hardware features, causing
> @@ -90,7 +90,7 @@ config PV_LINEAR_PT
>         bool "Support for PV linear pagetables"
>         depends on PV
>         default y
> -       ---help---
> +       help
>           Linear pagetables (also called "recursive pagetables") refers
>           to the practice of a guest operating system having pagetable
>           entries pointing to other pagetables of the same level (i.e.,
> @@ -113,7 +113,7 @@ config HVM
>  	select COMPAT
>  	select IOREQ_SERVER
>  	select MEM_ACCESS_ALWAYS_ON
> -	---help---
> +	help
>  	  Interfaces to support HVM domains.  HVM domains require hardware
>  	  virtualisation extensions (e.g. Intel VT-x, AMD SVM), but can boot
>  	  guests which have no specific Xen knowledge.
> @@ -126,7 +126,7 @@ config XEN_SHSTK
>  	bool "Supervisor Shadow Stacks"
>  	depends on HAS_AS_CET_SS
>  	default y
> -	---help---
> +	help
>  	  Control-flow Enforcement Technology (CET) is a set of features in
>  	  hardware designed to combat Return-oriented Programming (ROP, also
>  	  call/jump COP/JOP) attacks.  Shadow Stacks are one CET feature
> @@ -152,7 +152,7 @@ config SHADOW_PAGING
>  	bool "Shadow Paging"
>  	default !PV_SHIM_EXCLUSIVE
>  	depends on PV || HVM
> -	---help---
> +	help
>  
>            Shadow paging is a software alternative to hardware paging support
>            (Intel EPT, AMD NPT).
> @@ -171,7 +171,7 @@ config SHADOW_PAGING
>  config BIGMEM
>  	bool "big memory support"
>  	default n
> -	---help---
> +	help
>  	  Allows Xen to support up to 123Tb of memory.
>  
>  	  This requires enlarging struct page_info as well as shrinking
> @@ -183,7 +183,7 @@ config HVM_FEP
>  	bool "HVM Forced Emulation Prefix support (UNSUPPORTED)" if UNSUPPORTED
>  	default DEBUG
>  	depends on HVM
> -	---help---
> +	help
>  
>  	  Compiles in a feature that allows HVM guest to arbitrarily
>  	  exercise the instruction emulator.
> @@ -203,7 +203,7 @@ config TBOOT
>  	depends on UNSUPPORTED
>  	default !PV_SHIM_EXCLUSIVE
>  	select CRYPTO
> -	---help---
> +	help
>  	  Allows support for Trusted Boot using the Intel(R) Trusted Execution
>  	  Technology (TXT)
>  
> @@ -213,14 +213,14 @@ choice
>  	prompt "Alignment of Xen image"
>  	default XEN_ALIGN_2M if PV_SHIM_EXCLUSIVE
>  	default XEN_ALIGN_DEFAULT
> -	---help---
> +	help
>  	  Specify alignment for Xen image.
>  
>  	  If unsure, choose "default".
>  
>  config XEN_ALIGN_DEFAULT
>  	bool "Default alignment"
> -	---help---
> +	help
>  	  Pick alignment according to build variants.
>  
>  	  For EFI build the default alignment is 2M. For ELF build
> @@ -281,7 +281,7 @@ config GUEST
>  config XEN_GUEST
>  	bool "Xen Guest"
>  	select GUEST
> -	---help---
> +	help
>  	  Support for Xen detecting when it is running under Xen.
>  
>  	  If unsure, say N.
> @@ -290,7 +290,7 @@ config PVH_GUEST
>  	def_bool y
>  	prompt "PVH Guest"
>  	depends on XEN_GUEST
> -	---help---
> +	help
>  	  Support booting using the PVH ABI.
>  
>  	  If unsure, say Y.
> @@ -299,7 +299,7 @@ config PV_SHIM
>  	def_bool y
>  	prompt "PV Shim"
>  	depends on PV && XEN_GUEST
> -	---help---
> +	help
>  	  Build Xen with a mode which acts as a shim to allow PV guest to run
>  	  in an HVM/PVH container. This mode can only be enabled with command
>  	  line option.
> @@ -309,7 +309,7 @@ config PV_SHIM
>  config PV_SHIM_EXCLUSIVE
>  	bool "PV Shim Exclusive"
>  	depends on PV_SHIM
> -	---help---
> +	help
>  	  Build Xen in a way which unconditionally assumes PV_SHIM mode.  This
>  	  option is only intended for use when building a dedicated PV Shim
>  	  firmware, and will not function correctly in other scenarios.
> @@ -321,7 +321,7 @@ if !PV_SHIM_EXCLUSIVE
>  config HYPERV_GUEST
>  	bool "Hyper-V Guest"
>  	select GUEST
> -	---help---
> +	help
>  	  Support for Xen detecting when it is running under Hyper-V.
>  
>  	  If unsure, say N.
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index cff3166ff923..565ceda741b9 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -15,7 +15,7 @@ config CORE_PARKING
>  config GRANT_TABLE
>  	bool "Grant table support" if EXPERT
>  	default y
> -	---help---
> +	help
>  	  Grant table provides a generic mechanism to memory sharing
>  	  between domains. This shared memory interface underpins the
>  	  split device drivers for block and network IO in a classic
> @@ -90,7 +90,7 @@ config MEM_ACCESS
>  	def_bool MEM_ACCESS_ALWAYS_ON
>  	prompt "Memory Access and VM events" if !MEM_ACCESS_ALWAYS_ON
>  	depends on HVM
> -	---help---
> +	help
>  
>  	  Framework to configure memory access types for guests and receive
>  	  related events in userspace.
> @@ -133,7 +133,7 @@ config INDIRECT_THUNK
>  config SPECULATIVE_HARDEN_ARRAY
>  	bool "Speculative Array Hardening"
>  	default y
> -	---help---
> +	help
>  	  Contemporary processors may use speculative execution as a
>  	  performance optimisation, but this can potentially be abused by an
>  	  attacker to leak data via speculative sidechannels.
> @@ -154,7 +154,7 @@ config SPECULATIVE_HARDEN_BRANCH
>  	bool "Speculative Branch Hardening"
>  	default y
>  	depends on X86
> -        ---help---
> +        help
>  	  Contemporary processors may use speculative execution as a
>  	  performance optimisation, but this can potentially be abused by an
>  	  attacker to leak data via speculative sidechannels.
> @@ -228,7 +228,7 @@ config DIT_DEFAULT
>  config HYPFS
>  	bool "Hypervisor file system support"
>  	default y
> -	---help---
> +	help
>  	  Support Xen hypervisor file system. This file system is used to
>  	  present various hypervisor internal data to dom0 and in some
>  	  cases to allow modifying settings. Disabling the support will
> @@ -241,7 +241,7 @@ config HYPFS_CONFIG
>  	bool "Provide hypervisor .config via hypfs entry"
>  	default y
>  	depends on HYPFS
> -	---help---
> +	help
>  	  When enabled the contents of the .config file used to build the
>  	  hypervisor are provided via the hypfs entry /buildinfo/config.
>  
> @@ -252,7 +252,7 @@ config IOREQ_SERVER
>  	bool "IOREQ support (EXPERT)" if EXPERT && !X86
>  	default X86
>  	depends on HVM
> -	---help---
> +	help
>  	  Enables generic mechanism for providing emulated devices to the guests.
>  
>  	  If unsure, say N.
> @@ -261,7 +261,7 @@ config KEXEC
>  	bool "kexec support"
>  	default y
>  	depends on HAS_KEXEC
> -	---help---
> +	help
>  	  Allows a running Xen hypervisor to be replaced with another OS
>  	  without rebooting. This is primarily used to execute a crash
>  	  environment to collect information on a Xen hypervisor or dom0 crash.
> @@ -270,7 +270,7 @@ config KEXEC
>  
>  config EFI_SET_VIRTUAL_ADDRESS_MAP
>      bool "EFI: call SetVirtualAddressMap()" if EXPERT
> -    ---help---
> +    help
>        Call EFI SetVirtualAddressMap() runtime service to setup memory map for
>        further runtime services. According to UEFI spec, it isn't strictly
>        necessary, but many UEFI implementations misbehave when this call is
> @@ -292,7 +292,7 @@ config XENOPROF
>  config XSM
>  	bool "Xen Security Modules support"
>  	default ARM
> -	---help---
> +	help
>  	  Enables the security framework known as Xen Security Modules which
>  	  allows administrators fine-grained control over a Xen domain and
>  	  its capabilities by defining permissible interactions between domains,
> @@ -305,7 +305,7 @@ config XSM_FLASK
>  	def_bool y
>  	prompt "FLux Advanced Security Kernel support"
>  	depends on XSM
> -	---help---
> +	help
>  	  Enables FLASK (FLux Advanced Security Kernel) as the access control
>  	  mechanism used by the XSM framework.  This provides a mandatory access
>  	  control framework by which security enforcement, isolation, and
> @@ -318,7 +318,7 @@ config XSM_FLASK_AVC_STATS
>  	def_bool y
>  	prompt "Maintain statistics on the FLASK access vector cache" if EXPERT
>  	depends on XSM_FLASK
> -	---help---
> +	help
>  	  Maintain counters on the access vector cache that can be viewed using
>  	  the FLASK_AVC_CACHESTATS sub-op of the xsm_op hypercall.  Disabling
>  	  this will save a tiny amount of memory and time to update the stats.
> @@ -329,7 +329,7 @@ config XSM_FLASK_POLICY
>  	bool "Compile Xen with a built-in FLASK security policy"
>  	default y if "$(XEN_HAS_CHECKPOLICY)" = "y"
>  	depends on XSM_FLASK
> -	---help---
> +	help
>  	  This includes a default XSM policy in the hypervisor so that the
>  	  bootloader does not need to load a policy to get sane behavior from an
>  	  XSM-enabled hypervisor.  If this is disabled, a policy must be
> @@ -345,7 +345,7 @@ config XSM_SILO
>  	def_bool y
>  	prompt "SILO support"
>  	depends on XSM
> -	---help---
> +	help
>  	  Enables SILO as the access control mechanism used by the XSM framework.
>  	  This is not the default module, add boot parameter xsm=silo to choose
>  	  it. This will deny any unmediated communication channels (grant tables
> @@ -372,7 +372,7 @@ config LATE_HWDOM
>  	bool "Dedicated hardware domain"
>  	default n
>  	depends on XSM && X86
> -	---help---
> +	help
>  	  Allows the creation of a dedicated hardware domain distinct from
>  	  domain 0 that manages devices without needing access to other
>  	  privileged functionality such as the ability to manage domains.
> @@ -390,7 +390,7 @@ config LATE_HWDOM
>  
>  config ARGO
>  	bool "Argo: hypervisor-mediated interdomain communication (UNSUPPORTED)" if UNSUPPORTED
> -	---help---
> +	help
>  	  Enables a hypercall for domains to ask the hypervisor to perform
>  	  data transfer of messages between domains.
>  
> @@ -417,7 +417,7 @@ config LIVEPATCH
>  	default X86
>  	depends on "$(XEN_HAS_BUILD_ID)" = "y"
>  	select CC_SPLIT_SECTIONS
> -	---help---
> +	help
>  	  Allows a running Xen hypervisor to be dynamically patched using
>  	  binary patches without rebooting. This is primarily used to binarily
>  	  patch in the field an hypervisor with XSA fixes.
> @@ -428,7 +428,7 @@ config FAST_SYMBOL_LOOKUP
>  	bool "Fast symbol lookup (bigger binary)"
>  	default y
>  	depends on LIVEPATCH
> -	---help---
> +	help
>  	  When searching for symbol addresses we can use the built-in system
>  	  that is optimized for searching symbols using addresses as the key.
>  	  However using it for the inverse (find address using the symbol name)
> @@ -440,7 +440,7 @@ config FAST_SYMBOL_LOOKUP
>  config ENFORCE_UNIQUE_SYMBOLS
>  	bool "Enforce unique symbols"
>  	default LIVEPATCH
> -	---help---
> +	help
>  	  Multiple symbols with the same name aren't generally a problem
>  	  unless livepatching is to be used.
>  
> @@ -454,7 +454,7 @@ config ENFORCE_UNIQUE_SYMBOLS
>  config SUPPRESS_DUPLICATE_SYMBOL_WARNINGS
>  	bool "Suppress duplicate symbol warnings"
>  	depends on !ENFORCE_UNIQUE_SYMBOLS
> -	---help---
> +	help
>  	  Multiple symbols with the same name aren't generally a problem
>  	  unless Live patching is to be used, so these warnings can be
>  	  suppressed by enabling this option.  Certain other options (known
> @@ -464,7 +464,7 @@ config SUPPRESS_DUPLICATE_SYMBOL_WARNINGS
>  config CMDLINE
>  	string "Built-in hypervisor command string" if EXPERT
>  	default ""
> -	---help---
> +	help
>  	  Enter arguments here that should be compiled into the hypervisor
>  	  image and used at boot time. When the system boots, this string
>  	  will be parsed prior to the bootloader command line. So if a
> @@ -475,7 +475,7 @@ config CMDLINE_OVERRIDE
>  	bool "Built-in command line overrides bootloader arguments"
>  	default n
>  	depends on CMDLINE != ""
> -	---help---
> +	help
>  	  Set this option to 'Y' to have the hypervisor ignore the bootloader
>  	  command line, and use ONLY the built-in command line.
>  
> @@ -485,7 +485,7 @@ config CMDLINE_OVERRIDE
>  config DOM0_MEM
>  	string "Default value for dom0_mem boot parameter"
>  	default ""
> -	---help---
> +	help
>  	  Sets a default value for dom0_mem, e.g. "512M".
>  	  The specified string will be used for the dom0_mem parameter in
>  	  case it was not specified on the command line.
> @@ -507,7 +507,7 @@ config DTB_FILE
>  config TRACEBUFFER
>  	bool "Enable tracing infrastructure" if EXPERT
>  	default y
> -	---help---
> +	help
>  	  Enable tracing infrastructure and pre-defined tracepoints within Xen.
>  	  This will allow live information about Xen's execution and performance
>  	  to be collected at run time for debugging or performance analysis.
> diff --git a/xen/common/sched/Kconfig b/xen/common/sched/Kconfig
> index b2ef0c99a3f8..18ca1ce7ab9f 100644
> --- a/xen/common/sched/Kconfig
> +++ b/xen/common/sched/Kconfig
> @@ -4,20 +4,20 @@ menu "Schedulers"
>  config SCHED_CREDIT
>  	bool "Credit scheduler support"
>  	default y
> -	---help---
> +	help
>  	  The traditional credit scheduler is a general purpose scheduler.
>  
>  config SCHED_CREDIT2
>  	bool "Credit2 scheduler support"
>  	default y
> -	---help---
> +	help
>  	  The credit2 scheduler is a general purpose scheduler that is
>  	  optimized for lower latency and higher VM density.
>  
>  config SCHED_RTDS
>  	bool "RTDS scheduler support (UNSUPPORTED)" if UNSUPPORTED
>  	default DEBUG
> -	---help---
> +	help
>  	  The RTDS scheduler is a soft and firm real-time scheduler for
>  	  multicore, targeted for embedded, automotive, graphics and gaming
>  	  in the cloud, and general low-latency workloads.
> @@ -25,14 +25,14 @@ config SCHED_RTDS
>  config SCHED_ARINC653
>  	bool "ARINC653 scheduler support (UNSUPPORTED)" if UNSUPPORTED
>  	default DEBUG
> -	---help---
> +	help
>  	  The ARINC653 scheduler is a hard real-time scheduler for single
>  	  cores, targeted for avionics, drones, and medical devices.
>  
>  config SCHED_NULL
>  	bool "Null scheduler support (UNSUPPORTED)" if UNSUPPORTED
>  	default PV_SHIM || DEBUG
> -	---help---
> +	help
>  	  The null scheduler is a static, zero overhead scheduler,
>  	  for when there always are less vCPUs than pCPUs, typically
>  	  in embedded or HPC scenarios.
> diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/Kconfig
> index 864fcf3b0cef..78edd805365e 100644
> --- a/xen/drivers/passthrough/Kconfig
> +++ b/xen/drivers/passthrough/Kconfig
> @@ -6,7 +6,7 @@ if ARM
>  config ARM_SMMU
>  	bool "ARM SMMUv1 and v2 driver"
>  	default y
> -	---help---
> +	help
>  	  Support for implementations of the ARM System MMU architecture
>  	  versions 1 and 2.
>  
> @@ -16,7 +16,7 @@ config ARM_SMMU
>  config ARM_SMMU_V3
>  	bool "ARM Ltd. System MMU Version 3 (SMMUv3) Support" if EXPERT
>  	depends on ARM_64 && (!ACPI || BROKEN)
> -	---help---
> +	help
>  	 Support for implementations of the ARM System MMU architecture
>  	 version 3. Driver is in experimental stage and should not be used in
>  	 production.
> @@ -27,7 +27,7 @@ config ARM_SMMU_V3
>  config IPMMU_VMSA
>  	bool "Renesas IPMMU-VMSA found in R-Car Gen3/Gen4 SoCs"
>  	depends on ARM_64
> -	---help---
> +	help
>  	  Support for implementations of the Renesas IPMMU-VMSA found
>  	  in R-Car Gen3/Gen4 SoCs.
>  
> @@ -68,7 +68,7 @@ choice
>  	prompt "IOMMU device quarantining default behavior"
>  	depends on HAS_PCI
>  	default IOMMU_QUARANTINE_BASIC
> -	---help---
> +	help
>  	  When a PCI device is assigned to an untrusted domain, it is possible
>  	  for that domain to program the device to DMA to an arbitrary address.
>  	  The IOMMU is used to protect the host from malicious DMA by making
> diff --git a/xen/drivers/video/Kconfig b/xen/drivers/video/Kconfig
> index 41ca503cc961..245030beeaa2 100644
> --- a/xen/drivers/video/Kconfig
> +++ b/xen/drivers/video/Kconfig
> @@ -7,7 +7,7 @@ config VGA
>  	select VIDEO
>  	depends on X86
>  	default y if !PV_SHIM_EXCLUSIVE
> -	---help---
> +	help
>  	  Enable VGA output for the Xen hypervisor.
>  
>  	  If unsure, say Y.
> diff --git a/xen/tools/kconfig/lexer.l b/xen/tools/kconfig/lexer.l
> index 6354c905b006..4b7339ff4c8b 100644
> --- a/xen/tools/kconfig/lexer.l
> +++ b/xen/tools/kconfig/lexer.l
> @@ -105,7 +105,7 @@ n	[A-Za-z0-9_-]
>  "endchoice"		return T_ENDCHOICE;
>  "endif"			return T_ENDIF;
>  "endmenu"		return T_ENDMENU;
> -"help"|"---help---"	return T_HELP;
> +"help"			return T_HELP;
>  "hex"			return T_HEX;
>  "if"			return T_IF;
>  "imply"			return T_IMPLY;
> 
> base-commit: feb9158a620040846d76981acbe8ea9e2255a07b
> -- 
> 2.30.2
> 

