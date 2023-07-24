Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 217F17602B2
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 00:51:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569260.889650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO4OB-00055r-JN; Mon, 24 Jul 2023 22:50:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569260.889650; Mon, 24 Jul 2023 22:50:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO4OB-000547-Fh; Mon, 24 Jul 2023 22:50:51 +0000
Received: by outflank-mailman (input) for mailman id 569260;
 Mon, 24 Jul 2023 22:50:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AJiQ=DK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qO4O9-000541-8i
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 22:50:49 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8737dc3a-2a74-11ee-b23c-6b7b168915f2;
 Tue, 25 Jul 2023 00:50:47 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 70E406145D;
 Mon, 24 Jul 2023 22:50:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 805C7C433C8;
 Mon, 24 Jul 2023 22:50:44 +0000 (UTC)
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
X-Inumbo-ID: 8737dc3a-2a74-11ee-b23c-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690239045;
	bh=pNNBq0RfOTyBuT58wWlas3Su+nG5r5Bea5RMeqWoue4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=A7DgH5T7cKJRAShkT+Azz2jphbL5+7ETQaAu4rsNJ9vby9E0SZ72QSQnhaSqLjD42
	 bRi2SHlS8qoJg2IE8qz7E7TC5ua4JxKwZvslx/1p17kRVEUumfEWXovOI3abZxq0ml
	 mvB7Jk/rqo+IyFepQFpzAEpzDzC3U4zTkGROApASSlNLAdvI9BGhksHM/fS9bi3XT9
	 2xDMLwNEC8RzuaUCQHTbNJ486E36I8NuZIvGCGEPuMewHxZffpbTyRBxSq/xFYCovs
	 FEewZK+NvCKIi6OsbWcWIySoINiWcnZ7ESJYIn/aUK5qG0TRTqQrDYzE7OHWxB/0Dd
	 2vGWkSRfwL1FQ==
Date: Mon, 24 Jul 2023 15:50:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 1/3] xen/irq: add missing parameter names
In-Reply-To: <54ce64f3634a19a834cc1ce5ed74527bf8fa9420.1690217195.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2307241544080.3118466@ubuntu-linux-20-04-desktop>
References: <cover.1690217195.git.federico.serafini@bugseng.com> <54ce64f3634a19a834cc1ce5ed74527bf8fa9420.1690217195.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Jul 2023, Federico Serafini wrote:
> -extern int pirq_guest_bind(struct vcpu *, struct pirq *, int will_share);
> -extern void pirq_guest_unbind(struct domain *d, struct pirq *);
> -extern void pirq_set_affinity(struct domain *d, int irq, const cpumask_t *);
> -extern irq_desc_t *domain_spin_lock_irq_desc(
> +extern int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share);
> +extern void pirq_guest_unbind(struct domain *d, struct pirq *pirq);
> +extern void pirq_set_affinity(struct domain *d, int irq, const cpumask_t *mask);

This should be:
void pirq_set_affinity(struct domain *d, int pirq, const cpumask_t *mask)


Everything else looks good to me

