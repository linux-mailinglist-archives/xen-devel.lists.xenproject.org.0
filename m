Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7956770B1F
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 23:39:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577362.904461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qS2Vn-0003z5-GZ; Fri, 04 Aug 2023 21:39:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577362.904461; Fri, 04 Aug 2023 21:39:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qS2Vn-0003x2-Dv; Fri, 04 Aug 2023 21:39:07 +0000
Received: by outflank-mailman (input) for mailman id 577362;
 Fri, 04 Aug 2023 21:39:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zgx5=DV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qS2Vm-0003ww-WC
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 21:39:07 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 556ce9be-330f-11ee-b271-6b7b168915f2;
 Fri, 04 Aug 2023 23:39:05 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DF99F62117;
 Fri,  4 Aug 2023 21:39:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D645C433C8;
 Fri,  4 Aug 2023 21:39:02 +0000 (UTC)
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
X-Inumbo-ID: 556ce9be-330f-11ee-b271-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691185143;
	bh=GvitZrETfuQTQcjj77blBRLxc8mSkNWAcqIOxy8tSGk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DTWK0Q1biByoVWr7BsZ8uhoR0SCFpuY6s2B+Ojd4urwkuqCR4Z5eVQhrcly8dwYAR
	 G5OcVGvrFM93fN+wyRu3UmzEM8Bo1b4jOdpN0d47Z85CzgO3wXIjeF+l+1wLLyER4a
	 LGxmCx14T+ByxmIWKnXJllVTjWoi+vIBbgN4VrlIX5HFHrdJQJ5OGOPjBX2RtLAy/7
	 CIIrQEYs2ErGO/ZM3RDXl6XhpS1U2NqZmQweDhjqTUWtoPPfuvu/OrdFX4NKhS9oqZ
	 hQSF+Jms63aeaDuh1kc8MXa3jaB4vsaM2CKb8K0J2xfiEPCE8/+QdUURRqckNMtcXV
	 abR2D1l9cq9rQ==
Date: Fri, 4 Aug 2023 14:39:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: tamas@tklengyel.com
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Alexandru Isaila <aisaila@bitdefender.com>, 
    Petre Pircalabu <ppircalabu@bitdefender.com>, 
    federico.serafini@bugseng.com, sstabellini@kernel.org
Subject: Re: [XEN PATCH] xen: change parameter name in monitor_domctl()
 declaration
In-Reply-To: <6a25e9d729e85ba5712fd00f9c0514a459bb7631.1690471420.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308041438170.2127516@ubuntu-linux-20-04-desktop>
References: <6a25e9d729e85ba5712fd00f9c0514a459bb7631.1690471420.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Tamas,

May I have your ack on this change?


On Thu, 27 Jul 2023, Federico Serafini wrote:
> Change parameter name in monitor_domctl() declaration for
> consistency with the corresponding definition.
> This addresses a violation of MISRA C:2012 Rule 8.3: "All declarations
> of an object or function shall use the same names and type qualifiers".
> 
> No functional changes.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/include/xen/monitor.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/include/xen/monitor.h b/xen/include/xen/monitor.h
> index 6b17a93071..713d54f7c1 100644
> --- a/xen/include/xen/monitor.h
> +++ b/xen/include/xen/monitor.h
> @@ -27,7 +27,7 @@
>  struct domain;
>  struct xen_domctl_monitor_op;
>  
> -int monitor_domctl(struct domain *d, struct xen_domctl_monitor_op *op);
> +int monitor_domctl(struct domain *d, struct xen_domctl_monitor_op *mop);
>  void monitor_guest_request(void);
>  
>  int monitor_traps(struct vcpu *v, bool sync, vm_event_request_t *req);
> -- 
> 2.34.1
> 
> 

