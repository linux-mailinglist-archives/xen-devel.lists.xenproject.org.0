Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1A89591FB
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2024 02:57:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780816.1190425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgZed-0001ZI-8n; Wed, 21 Aug 2024 00:56:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780816.1190425; Wed, 21 Aug 2024 00:56:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgZed-0001Xh-63; Wed, 21 Aug 2024 00:56:51 +0000
Received: by outflank-mailman (input) for mailman id 780816;
 Wed, 21 Aug 2024 00:56:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0c/y=PU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sgZeb-0001N3-L2
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2024 00:56:49 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3db296a2-5f58-11ef-8776-851b0ebba9a2;
 Wed, 21 Aug 2024 02:56:47 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5A97A60F81;
 Wed, 21 Aug 2024 00:56:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EC82C4AF0F;
 Wed, 21 Aug 2024 00:56:43 +0000 (UTC)
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
X-Inumbo-ID: 3db296a2-5f58-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724201806;
	bh=iP+o8FjrkW5d8IANhD6wo3Kazu6e02UnaUSXg3Ib1MY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OoEY54OXyjObjVuSMgqtFJw+/EIe5484piVfBINT8oGtG27p2BR0tx9cSSwJQJ2vq
	 1ZHDBUW+tC5wVL5ZApWW7YiXtT5EyAeUgKppKLh/8CJhfuLpXmOoTkFdGybIy11GmQ
	 aZtNPVAga6FFaaUZwUuoxrCAaOQ+NmqkRjI9ibuVdPMIVhQ0qCjjL1/k8TzVIy1KBA
	 rD2Zsk+iE/B8oD+g41hGq8GTEVpyCSYTQy3z0v+Vo9GxsDxlZVs9rHNZGyJ31JrRxL
	 RBvP+AM+6pks3qAbPC0iwRUBKVdc1irT2h7wZ5/7EEoNer6HjoBFQmAxXsuNiVcynY
	 9TcTTIu9iWp8g==
Date: Tue, 20 Aug 2024 17:56:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, anthony@xenproject.org, 
    paul@xen.org, peter.maydell@linaro.org, alex.bennee@linaro.org, 
    xenia.ragiadakou@amd.com, jason.andryuk@amd.com, edgar.iglesias@amd.com, 
    xen-devel@lists.xenproject.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v2 05/12] hw/arm: xenpvh: Remove double-negation in
 warning
In-Reply-To: <20240820142949.533381-6-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2408201756360.298534@ubuntu-linux-20-04-desktop>
References: <20240820142949.533381-1-edgar.iglesias@gmail.com> <20240820142949.533381-6-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 20 Aug 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  hw/arm/xen_arm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
> index fda65d0d8d..16b3f00992 100644
> --- a/hw/arm/xen_arm.c
> +++ b/hw/arm/xen_arm.c
> @@ -165,7 +165,7 @@ static void xen_arm_init(MachineState *machine)
>      xam->state =  g_new0(XenIOState, 1);
>  
>      if (machine->ram_size == 0) {
> -        warn_report("%s non-zero ram size not specified. QEMU machine started"
> +        warn_report("%s: ram size not specified. QEMU machine started"
>                      " without IOREQ (no emulated devices including virtio)",
>                      MACHINE_CLASS(object_get_class(OBJECT(machine)))->desc);
>          return;
> -- 
> 2.43.0
> 

