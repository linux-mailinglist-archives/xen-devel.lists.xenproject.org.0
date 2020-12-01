Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E80352C9476
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 02:14:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41541.74753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjuEc-0005hk-12; Tue, 01 Dec 2020 01:13:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41541.74753; Tue, 01 Dec 2020 01:13:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjuEb-0005hL-U3; Tue, 01 Dec 2020 01:13:37 +0000
Received: by outflank-mailman (input) for mailman id 41541;
 Tue, 01 Dec 2020 01:13:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fi77=FF=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kjuEb-0005hG-51
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 01:13:37 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 861f628a-24df-49d1-bf64-4e7033c2fa17;
 Tue, 01 Dec 2020 01:13:36 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B7E9E2073C;
 Tue,  1 Dec 2020 01:13:34 +0000 (UTC)
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
X-Inumbo-ID: 861f628a-24df-49d1-bf64-4e7033c2fa17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606785215;
	bh=z5rOzcOj/GGFIXPoAItrL7xTCRxPVuL79Ztcu8USgXE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cJ8DdGWyvyphnLxAZ3VL77fyIMbb1eQ+Cdibiv5JulNRCu1vGPRgqz5jtZWKNSxNl
	 cSbg2w5L+58fzEwfKkqy3vRv/5YvRIAIjq7DH/gV8Dt4iB/3alFZjO8aoLHzDrrLCf
	 AuUIhuqFL7LjSnu7uRQixMUA2snPE6Dub65VFDL8=
Date: Mon, 30 Nov 2020 17:13:34 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Diederik de Haas <didi.debian@cknow.org>
cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>, 
    Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH] Fix spelling errors.
In-Reply-To: <a60e2c98183d7c873f4e306954f900614fcdb582.1606757711.git.didi.debian@cknow.org>
Message-ID: <alpine.DEB.2.21.2011301713210.1100@sstabellini-ThinkPad-T480s>
References: <a60e2c98183d7c873f4e306954f900614fcdb582.1606757711.git.didi.debian@cknow.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 30 Nov 2020, Diederik de Haas wrote:
> Only spelling errors; no functional changes.
> 
> In docs/misc/dump-core-format.txt there are a few more instances of
> 'informations'. I'll leave that up to someone who can properly determine
> how those sentences should be constructed.
> 
> Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
> 
> Please CC me in replies as I'm not subscribed to this list.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  docs/man/xl.1.pod.in                   | 2 +-
>  docs/man/xl.cfg.5.pod.in               | 2 +-
>  docs/man/xlcpupool.cfg.5.pod           | 2 +-
>  tools/firmware/rombios/rombios.c       | 2 +-
>  tools/libs/light/libxl_stream_read.c   | 2 +-
>  tools/xl/xl_cmdtable.c                 | 2 +-
>  xen/arch/x86/boot/video.S              | 2 +-
>  xen/arch/x86/cpu/vpmu.c                | 2 +-
>  xen/arch/x86/mpparse.c                 | 2 +-
>  xen/arch/x86/x86_emulate/x86_emulate.c | 2 +-
>  xen/common/libelf/libelf-dominfo.c     | 2 +-
>  xen/drivers/passthrough/arm/smmu.c     | 2 +-
>  xen/tools/gen-cpuid.py                 | 2 +-
>  xen/xsm/flask/policy/access_vectors    | 2 +-
>  14 files changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
> index f92bacfa72..eaa72faad6 100644
> --- a/docs/man/xl.1.pod.in
> +++ b/docs/man/xl.1.pod.in
> @@ -1578,7 +1578,7 @@ List vsnd devices for a domain.
>  Creates a new keyboard device in the domain specified by I<domain-id>.
>  I<vkb-device> describes the device to attach, using the same format as the
>  B<VKB_SPEC_STRING> string in the domain config file. See L<xl.cfg(5)>
> -for more informations.
> +for more information.
>  
>  =item B<vkb-detach> I<domain-id> I<devid>
>  
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index 0532739c1f..b4625f56db 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -2385,7 +2385,7 @@ If B<videoram> is set less than 128MB, an error will be triggered.
>  
>  =item B<stdvga=BOOLEAN>
>  
> -Speficies a standard VGA card with VBE (VESA BIOS Extensions) as the
> +Specifies a standard VGA card with VBE (VESA BIOS Extensions) as the
>  emulated graphics device. If your guest supports VBE 2.0 or
>  later (e.g. Windows XP onwards) then you should enable this.
>  stdvga supports more video ram and bigger resolutions than Cirrus.
> diff --git a/docs/man/xlcpupool.cfg.5.pod b/docs/man/xlcpupool.cfg.5.pod
> index 3c9ddf7958..c577c7ca3a 100644
> --- a/docs/man/xlcpupool.cfg.5.pod
> +++ b/docs/man/xlcpupool.cfg.5.pod
> @@ -106,7 +106,7 @@ means that cpus 2,3,5 will be member of the cpupool.
>  means that cpus 0,2,3 and 5 will be member of the cpupool. A "node:" or
>  "nodes:" modifier can be used. E.g., "0,node:1,nodes:2-3,^10-13" means
>  that pcpus 0, plus all the cpus of NUMA nodes 1,2,3 with the exception
> -of cpus 10,11,12,13 will be memeber of the cpupool.
> +of cpus 10,11,12,13 will be members of the cpupool.
>  
>  =back
>  
> diff --git a/tools/firmware/rombios/rombios.c b/tools/firmware/rombios/rombios.c
> index 51558ee57a..5cda22785f 100644
> --- a/tools/firmware/rombios/rombios.c
> +++ b/tools/firmware/rombios/rombios.c
> @@ -2607,7 +2607,7 @@ void ata_detect( )
>    write_byte(ebda_seg,&EbdaData->ata.channels[3].irq,11);
>  #endif
>  #if BX_MAX_ATA_INTERFACES > 4
> -#error Please fill the ATA interface informations
> +#error Please fill the ATA interface information
>  #endif
>  
>    // Device detection
> diff --git a/tools/libs/light/libxl_stream_read.c b/tools/libs/light/libxl_stream_read.c
> index 514f6d9f89..99a6714e76 100644
> --- a/tools/libs/light/libxl_stream_read.c
> +++ b/tools/libs/light/libxl_stream_read.c
> @@ -459,7 +459,7 @@ static void stream_continue(libxl__egc *egc,
>          while (process_record(egc, stream))
>              ; /*
>                 * Nothing! process_record() helpfully tells us if no specific
> -               * futher actions have been set up, in which case we want to go
> +               * further actions have been set up, in which case we want to go
>                 * ahead and process the next record.
>                 */
>          break;
> diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
> index 7da6c1b927..6ab5e47da3 100644
> --- a/tools/xl/xl_cmdtable.c
> +++ b/tools/xl/xl_cmdtable.c
> @@ -154,7 +154,7 @@ struct cmd_spec cmd_table[] = {
>        "-h  Print this help.\n"
>        "-c  Leave domain running after creating the snapshot.\n"
>        "-p  Leave domain paused after creating the snapshot.\n"
> -      "-D  Store the domain id in the configration."
> +      "-D  Store the domain id in the configuration."
>      },
>      { "migrate",
>        &main_migrate, 0, 1,
> diff --git a/xen/arch/x86/boot/video.S b/xen/arch/x86/boot/video.S
> index a485779ce7..0efbe8d3b3 100644
> --- a/xen/arch/x86/boot/video.S
> +++ b/xen/arch/x86/boot/video.S
> @@ -177,7 +177,7 @@ dac_set:
>          movb    $0, _param(PARAM_LFB_COLORS+7)
>  
>  dac_done:
> -# get protected mode interface informations
> +# get protected mode interface information
>          movw    $0x4f0a, %ax
>          xorw    %bx, %bx
>          xorw    %di, %di
> diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
> index 1ed39ef03f..ac32379c2e 100644
> --- a/xen/arch/x86/cpu/vpmu.c
> +++ b/xen/arch/x86/cpu/vpmu.c
> @@ -680,7 +680,7 @@ static void pvpmu_finish(struct domain *d, xen_pmu_params_t *params)
>          vcpu_unpause(v);
>  }
>  
> -/* Dump some vpmu informations on console. Used in keyhandler dump_domains(). */
> +/* Dump some vpmu information on console. Used in keyhandler dump_domains(). */
>  void vpmu_dump(struct vcpu *v)
>  {
>      struct vpmu_struct *vpmu = vcpu_vpmu(v);
> diff --git a/xen/arch/x86/mpparse.c b/xen/arch/x86/mpparse.c
> index d532575fee..dff02b142b 100644
> --- a/xen/arch/x86/mpparse.c
> +++ b/xen/arch/x86/mpparse.c
> @@ -170,7 +170,7 @@ static int MP_processor_info_x(struct mpc_config_processor *m,
>  	if (num_processors >= 8 && hotplug
>  	    && genapic.name == apic_default.name) {
>  		printk_once(XENLOG_WARNING
> -			    "WARNING: CPUs limit of 8 reached - ignoring futher processors\n");
> +			    "WARNING: CPUs limit of 8 reached - ignoring further processors\n");
>  		unaccounted_cpus = true;
>  		return -ENOSPC;
>  	}
> diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
> index a35b63634b..ecc067bffe 100644
> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -3246,7 +3246,7 @@ x86_decode(
>              case 0x23: /* mov reg,dr */
>                  /*
>                   * Mov to/from cr/dr ignore the encoding of Mod, and behave as
> -                 * if they were encoded as reg/reg instructions.  No futher
> +                 * if they were encoded as reg/reg instructions. No further
>                   * disp/SIB bytes are fetched.
>                   */
>                  modrm_mod = 3;
> diff --git a/xen/common/libelf/libelf-dominfo.c b/xen/common/libelf/libelf-dominfo.c
> index 508f08db42..69c94b6f3b 100644
> --- a/xen/common/libelf/libelf-dominfo.c
> +++ b/xen/common/libelf/libelf-dominfo.c
> @@ -1,5 +1,5 @@
>  /*
> - * parse xen-specific informations out of elf kernel binaries.
> + * parse xen-specific information out of elf kernel binaries.
>   *
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
> index b8321f5d8d..ed04d85e05 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -214,7 +214,7 @@ struct iommu_domain
>  	struct list_head		list;
>  };
>  
> -/* Xen: Describes informations required for a Xen domain */
> +/* Xen: Describes information required for a Xen domain */
>  struct arm_smmu_xen_domain {
>  	spinlock_t			lock;
>  	/* List of context (i.e iommu_domain) associated to this domain */
> diff --git a/xen/tools/gen-cpuid.py b/xen/tools/gen-cpuid.py
> index 50412b9a46..36f67750e5 100755
> --- a/xen/tools/gen-cpuid.py
> +++ b/xen/tools/gen-cpuid.py
> @@ -192,7 +192,7 @@ def crunch_numbers(state):
>          FXSR: [FFXSR, SSE],
>  
>          # SSE is taken to mean support for the %XMM registers as well as the
> -        # instructions.  Several futher instruction sets are built on core
> +        # instructions.  Several further instruction sets are built on core
>          # %XMM support, without specific inter-dependencies.  Additionally
>          # AMD has a special mis-alignment sub-mode.
>          SSE: [SSE2, MISALIGNSSE],
> diff --git a/xen/xsm/flask/policy/access_vectors b/xen/xsm/flask/policy/access_vectors
> index 1aa0bb501c..6359c7fc87 100644
> --- a/xen/xsm/flask/policy/access_vectors
> +++ b/xen/xsm/flask/policy/access_vectors
> @@ -507,7 +507,7 @@ class security
>  #
>  class version
>  {
> -# Extra informations (-unstable).
> +# Extra information (-unstable).
>      xen_extraversion
>  # Compile information of the hypervisor.
>      xen_compile_info
> -- 
> 2.29.2
> 

