Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 117405AF7BC
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 00:13:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400636.642278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgoU-0007TC-Lm; Tue, 06 Sep 2022 22:12:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400636.642278; Tue, 06 Sep 2022 22:12:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgoU-0007Qe-Im; Tue, 06 Sep 2022 22:12:58 +0000
Received: by outflank-mailman (input) for mailman id 400636;
 Tue, 06 Sep 2022 22:12:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4s6j=ZJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oVgoS-0007QF-KK
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 22:12:56 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0de98ffa-2e31-11ed-af93-0125da4c0113;
 Wed, 07 Sep 2022 00:12:55 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 84C17615B0;
 Tue,  6 Sep 2022 22:12:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18614C433C1;
 Tue,  6 Sep 2022 22:12:51 +0000 (UTC)
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
X-Inumbo-ID: 0de98ffa-2e31-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662502372;
	bh=lBcGXX22EEBnypmILhKJ7XGiGfYojBp0b6PI0XiwAOI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=o43ymXLoT6AghsTSpmEYitnUfi2QlosXoj8pP1P1SAmIhUp+agB4O3GKetUH8SyEp
	 +C99naS1he4w+VU02AzKWGlr2+BCeXK8MHfdP4wEPOkHRsQSNn6b4YkoxXa9pfq3is
	 ZbrnciNVTboKys0N/TwOov9HmeDQIm3EenxeR4lY+vXgiGVzgYpOnwGZpSiM1uTOen
	 lP6NQsd7oOS6ImMcvSML7pQuYIU6Cz/8VSce2hUDOpbeNgaWzDTn4MU5Q8HgwGwJQt
	 CG6BlAjWwqgOtL0kbxgl6w1NU4lt0+psIwaH5RJ8oVoP2aT1ejPTWvOi5aBKZMjKd5
	 zA2+inR37ewyA==
Date: Tue, 6 Sep 2022 15:12:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 6/7] xen/arm: introduce new xen,enhanced property
 value
In-Reply-To: <667059a3bc6ed9a8b993f64f2b1176a2a131f41e.1662462034.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.22.394.2209061507481.157835@ubuntu-linux-20-04-desktop>
References: <cover.1662462034.git.rahul.singh@arm.com> <667059a3bc6ed9a8b993f64f2b1176a2a131f41e.1662462034.git.rahul.singh@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 6 Sep 2022, Rahul Singh wrote:
> Introduce a new "xen,enhanced" dom0less property value "no-xenstore" to
> disable xenstore interface for dom0less guests.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
> Changes in v4:
>  - Implement defines for dom0less features
> Changes in v3:
>  - new patch in this version
> ---
>  docs/misc/arm/device-tree/booting.txt |  4 ++++
>  xen/arch/arm/domain_build.c           | 10 ++++++----
>  xen/arch/arm/include/asm/kernel.h     | 23 +++++++++++++++++++++--
>  3 files changed, 31 insertions(+), 6 deletions(-)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index 98253414b8..1b0dca1454 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -204,6 +204,10 @@ with the following properties:
>      - "disabled"
>      Xen PV interfaces are disabled.
>  
> +    - no-xenstore
> +    Xen PV interfaces, including grant-table will be enabled but xenstore
> +    will be disabled for the VM.

Please use "" for consistency:

    - "no-xenstore"


>      If the xen,enhanced property is present with no value, it defaults
>      to "enabled". If the xen,enhanced property is not present, PV
>      interfaces are disabled.
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 707e247f6a..0b164ef595 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2891,7 +2891,7 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>              goto err;
>      }
>  
> -    if ( kinfo->dom0less_enhanced )
> +    if ( kinfo->dom0less_feature & DOM0LESS_ENHANCED_NO_XS )
>      {
>          ret = make_hypervisor_node(d, kinfo, addrcells, sizecells);
>          if ( ret )
> @@ -3209,10 +3209,12 @@ static int __init construct_domU(struct domain *d,
>           (rc == 0 && !strcmp(dom0less_enhanced, "enabled")) )
>      {
>          if ( hardware_domain )
> -            kinfo.dom0less_enhanced = true;
> +            kinfo.dom0less_feature = DOM0LESS_ENHANCED;
>          else
> -            panic("Tried to use xen,enhanced without dom0\n");
> +            panic("At the moment, Xenstore support requires dom0 to be present\n");
>      }
> +    else if ( rc == 0 && !strcmp(dom0less_enhanced, "no-xenstore") )
> +        kinfo.dom0less_feature = DOM0LESS_ENHANCED_NO_XS;
>  
>      if ( vcpu_create(d, 0) == NULL )
>          return -ENOMEM;
> @@ -3252,7 +3254,7 @@ static int __init construct_domU(struct domain *d,
>      if ( rc < 0 )
>          return rc;
>  
> -    if ( kinfo.dom0less_enhanced )
> +    if ( kinfo.dom0less_feature & DOM0LESS_XENSTORE )
>      {
>          ASSERT(hardware_domain);
>          rc = alloc_xenstore_evtchn(d);
> diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
> index c4dc039b54..ad240494ea 100644
> --- a/xen/arch/arm/include/asm/kernel.h
> +++ b/xen/arch/arm/include/asm/kernel.h
> @@ -9,6 +9,25 @@
>  #include <xen/device_tree.h>
>  #include <asm/setup.h>
>  
> +/*
> + * List of possible features for dom0less domUs
> + *
> + * DOM0LESS_ENHANCED_NO_XS: Notify the OS it is running on top of Xen. All the
> + *                          default features (excluding Xenstore) will be
> + *                          available. Note that an OS *must* not rely on the
> + *                          availability of Xen features if this is not set.
> + * DOM0LESS_XENSTORE:       Xenstore will be enabled for the VM. This feature
> + *                          can't be enabled without the
> + *                          DOM0LESS_ENHANCED_NO_XS.
> + * DOM0LESS_ENHANCED:       Notify the OS it is running on top of Xen. All the
> + *                          default features (including Xenstore) will be
> + *                          available. Note that an OS *must* not rely on the
> + *                          availability of Xen features if this is not set.
> + */
> +#define DOM0LESS_ENHANCED_NO_XS  BIT(0, U)
> +#define DOM0LESS_XENSTORE        BIT(1, U)
> +#define DOM0LESS_ENHANCED        (DOM0LESS_ENHANCED_NO_XS | DOM0LESS_XENSTORE)
> +
>  struct kernel_info {
>  #ifdef CONFIG_ARM_64
>      enum domain_type type;
> @@ -36,8 +55,8 @@ struct kernel_info {
>      /* Enable pl011 emulation */
>      bool vpl011;
>  
> -    /* Enable PV drivers */
> -    bool dom0less_enhanced;
> +    /* Enable/Disable PV drivers interface,grant table, evtchn or xenstore */

missing a whitespace


> +    uint32_t dom0less_feature;

Given that we only really need 2 bits today, and given that uint8_t and
uint16_t are free but uint32_t increases the size of the struct, could
we just use uint16_t dom0less_feature ?


Everything else looks good, these are just minor things.


>      /* GIC phandle */
>      uint32_t phandle_gic;
> -- 
> 2.25.1
> 

