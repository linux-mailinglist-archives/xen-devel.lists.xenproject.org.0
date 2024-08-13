Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A21DF94FB43
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 03:46:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775806.1186005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdgbr-0002mU-Bo; Tue, 13 Aug 2024 01:46:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775806.1186005; Tue, 13 Aug 2024 01:46:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdgbr-0002j2-92; Tue, 13 Aug 2024 01:46:03 +0000
Received: by outflank-mailman (input) for mailman id 775806;
 Tue, 13 Aug 2024 01:46:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jgOn=PM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sdgbp-0002Qe-1j
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 01:46:01 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9a848bf-5915-11ef-8776-851b0ebba9a2;
 Tue, 13 Aug 2024 03:45:59 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AE593614F9;
 Tue, 13 Aug 2024 01:45:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05C6FC4AF09;
 Tue, 13 Aug 2024 01:45:55 +0000 (UTC)
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
X-Inumbo-ID: c9a848bf-5915-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723513557;
	bh=c7qNRpyDUtvju/qAk+YMAJaPGvskpjD01S2agnEPCiQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ilrZNn1Te05ZkG2uzeYAKdlwv80dCsj2//lN8yzLyuVj3U/Qyj7iqwjWW4+6Ro42A
	 IWzDqc2V3vtHcBfR1AoBMwl3cFrGLVP041j8EVPqhDA2yH+bq7agTFsbxsTqrx42tq
	 DG3R1GKtLEIhbFK3vPbIDKPGuC0h3WW7ptTqKMpC/FU1a+bazY2t1lnkzKFQFFAJT9
	 9t8u+tgiP3xY+tvMwjuW+BFptD2aFkutHgPHIestZf+yWGiqFAjvHK5wIaH3NWHvl9
	 nuvaMGxA33Mh92kR7w62I+He8YnVAtNXACPTIA99bO8tTcbXotSTuuk4pEPTyA+pky
	 fcVOQAqxDiLXw==
Date: Mon, 12 Aug 2024 18:45:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, anthony@xenproject.org, 
    paul@xen.org, peter.maydell@linaro.org, alex.bennee@linaro.org, 
    xenia.ragiadakou@amd.com, jason.andryuk@amd.com, edgar.iglesias@amd.com, 
    xen-devel@lists.xenproject.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v1 03/10] hw/arm: xenpvh: Tweak machine description
In-Reply-To: <20240812130606.90410-4-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2408121647440.298534@ubuntu-linux-20-04-desktop>
References: <20240812130606.90410-1-edgar.iglesias@gmail.com> <20240812130606.90410-4-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 12 Aug 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Tweak machine description to better express that this is
> a Xen PVH machine for ARM.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  hw/arm/xen_arm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
> index 766a194fa1..5f75cc3779 100644
> --- a/hw/arm/xen_arm.c
> +++ b/hw/arm/xen_arm.c
> @@ -216,7 +216,7 @@ static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
>  {
>  
>      MachineClass *mc = MACHINE_CLASS(oc);
> -    mc->desc = "Xen Para-virtualized PC";
> +    mc->desc = "Xen PVH ARM machine";
>      mc->init = xen_arm_init;
>      mc->max_cpus = 1;
>      mc->default_machine_opts = "accel=xen";
> -- 
> 2.43.0
> 

