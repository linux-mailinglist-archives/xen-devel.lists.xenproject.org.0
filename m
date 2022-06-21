Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 658F7552B12
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jun 2022 08:38:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352975.579849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3XWq-0004Cs-Us; Tue, 21 Jun 2022 06:38:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352975.579849; Tue, 21 Jun 2022 06:38:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3XWq-00049x-RR; Tue, 21 Jun 2022 06:38:24 +0000
Received: by outflank-mailman (input) for mailman id 352975;
 Tue, 21 Jun 2022 06:38:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Od3y=W4=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1o3XWo-00049r-UZ
 for xen-devel@lists.xenproject.org; Tue, 21 Jun 2022 06:38:22 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bdec9bca-f12c-11ec-bd2d-47488cf2e6aa;
 Tue, 21 Jun 2022 08:38:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id A46CC20159;
 Tue, 21 Jun 2022 08:38:20 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3x1XNA8Raift; Tue, 21 Jun 2022 08:38:20 +0200 (CEST)
Received: from begin (nat-inria-interne-52-gw-01-bso.bordeaux.inria.fr
 [194.199.1.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 44ECA20151;
 Tue, 21 Jun 2022 08:38:20 +0200 (CEST)
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1o3XWl-008pA3-Ti;
 Tue, 21 Jun 2022 08:38:19 +0200
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
X-Inumbo-ID: bdec9bca-f12c-11ec-bd2d-47488cf2e6aa
Date: Tue, 21 Jun 2022 08:38:19 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] maintainers: add me as reviewer for Mini-OS
Message-ID: <20220621063819.6ksfam6k6yqqdt5j@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220621061952.6673-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220621061952.6673-1-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le mar. 21 juin 2022 08:19:52 +0200, a ecrit:
> I'm the main contributor for Mini-OS since several years now.
> 
> Add myself as reviewer.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Thanks!

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a0b0d88ea4..8a99526784 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -419,6 +419,7 @@ F:	xen/test/livepatch/*
>  MINI-OS
>  M:	Samuel Thibault <samuel.thibault@ens-lyon.org>
>  R:	Wei Liu <wl@xen.org>
> +R:	Juergen Gross <jgross@suse.com>
>  S:	Supported
>  L:	minios-devel@lists.xenproject.org
>  T:	git https://xenbits.xenproject.org/git-http/mini-os.git
> -- 
> 2.35.3
> 

