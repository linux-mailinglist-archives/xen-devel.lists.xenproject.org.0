Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A58194FB52
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 03:48:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775834.1186034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdgds-00050o-8M; Tue, 13 Aug 2024 01:48:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775834.1186034; Tue, 13 Aug 2024 01:48:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdgds-0004z4-5G; Tue, 13 Aug 2024 01:48:08 +0000
Received: by outflank-mailman (input) for mailman id 775834;
 Tue, 13 Aug 2024 01:48:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jgOn=PM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sdgdq-0004Ab-QM
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 01:48:06 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14af59ca-5916-11ef-a505-bb4a2ccca743;
 Tue, 13 Aug 2024 03:48:06 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A5F60CE1153;
 Tue, 13 Aug 2024 01:48:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42CACC4AF09;
 Tue, 13 Aug 2024 01:48:01 +0000 (UTC)
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
X-Inumbo-ID: 14af59ca-5916-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723513682;
	bh=VkK9y3PftMujevNgRvLFeHhq9QPvuE6tdab0J9rfRrQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uEeLSfLHcLEgcCu0BjrGZDwg1HpxlafoArMgDFX7h2PUDazcstMjFJVFo9gArJXH9
	 AwU66a/gXHvf4ey3lfyNuynXq8IXsgRRihLrK4FBpZ/lm3STkUy8W8DU1Hzu2lAq/8
	 KCzrRWXk9eS+WizWjlNg6bnW7O4gw9tpWKt6zp6F5OmKS/VK2psZ+01bv2B0d/wo4S
	 ZUQ8sKnhyMGvK2hxoH1JvbHT4OxtEmrs7lCqljTelHTep9nEHkPbweg53AlXcl855i
	 S3xYjYgQ8qXps0jq+zd8DblXZ7Ashp+HJxnlos8sg+t0l5SBqzys3gtlKKEs5w0tyg
	 BEvEv7QJ5tLFw==
Date: Mon, 12 Aug 2024 18:48:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, anthony@xenproject.org, 
    paul@xen.org, peter.maydell@linaro.org, alex.bennee@linaro.org, 
    xenia.ragiadakou@amd.com, jason.andryuk@amd.com, edgar.iglesias@amd.com, 
    xen-devel@lists.xenproject.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v1 06/10] hw/arm: xenpvh: Rename xen_arm.c -> xen-pvh.c
In-Reply-To: <20240812130606.90410-7-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2408121812210.298534@ubuntu-linux-20-04-desktop>
References: <20240812130606.90410-1-edgar.iglesias@gmail.com> <20240812130606.90410-7-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 12 Aug 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Rename xen_arm.c -> xen-pvh.c to better express that this
> is a PVH machine and to align with x86 HVM and future PVH
> machine filenames:
> hw/i386/xen/xen-hvm.c
> hw/i386/xen/xen-pvh.c (in preparation)
> 
> No functional changes.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  hw/arm/meson.build              | 2 +-
>  hw/arm/{xen_arm.c => xen-pvh.c} | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename hw/arm/{xen_arm.c => xen-pvh.c} (100%)
> 
> diff --git a/hw/arm/meson.build b/hw/arm/meson.build
> index 0c07ab522f..769fe9ec1a 100644
> --- a/hw/arm/meson.build
> +++ b/hw/arm/meson.build
> @@ -59,7 +59,7 @@ arm_ss.add(when: 'CONFIG_FSL_IMX7', if_true: files('fsl-imx7.c', 'mcimx7d-sabre.
>  arm_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmuv3.c'))
>  arm_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-evk.c'))
>  arm_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
> -arm_ss.add(when: 'CONFIG_XEN', if_true: files('xen_arm.c'))
> +arm_ss.add(when: 'CONFIG_XEN', if_true: files('xen-pvh.c'))
>  
>  system_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmu-common.c'))
>  system_ss.add(when: 'CONFIG_CHEETAH', if_true: files('palm.c'))
> diff --git a/hw/arm/xen_arm.c b/hw/arm/xen-pvh.c
> similarity index 100%
> rename from hw/arm/xen_arm.c
> rename to hw/arm/xen-pvh.c
> -- 
> 2.43.0
> 

