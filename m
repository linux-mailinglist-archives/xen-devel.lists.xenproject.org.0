Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E70BAF03F4
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 21:39:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029920.1403625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWgoJ-0005DT-A0; Tue, 01 Jul 2025 19:38:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029920.1403625; Tue, 01 Jul 2025 19:38:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWgoJ-0005Bx-68; Tue, 01 Jul 2025 19:38:31 +0000
Received: by outflank-mailman (input) for mailman id 1029920;
 Tue, 01 Jul 2025 19:38:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h8i3=ZO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uWgoH-0005Br-Ls
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 19:38:29 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5a15f22-56b2-11f0-a313-13f23c93f187;
 Tue, 01 Jul 2025 21:38:28 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B895360008;
 Tue,  1 Jul 2025 19:38:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14375C4CEEB;
 Tue,  1 Jul 2025 19:38:24 +0000 (UTC)
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
X-Inumbo-ID: f5a15f22-56b2-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751398706;
	bh=d54H0AeuXw7EB+TSyeidBWQDxC3DvB9MClJcnKjuMDI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AnYxHEGtdTcPEdZ7jjPFyOmMM8cM7lKESeQlfQ2H+ZxloHdxElwOaTberFz7uMRZi
	 oGB8WttkLWXkyZ5biGzPFlnsoAaS7rdVyCmGY8Oj7hABt6fn5ibzf2DsLkZwCO9uwf
	 ppjSQNafj0Mibh0ct7O9q/3jei+rhYyd9mFGBDUzIXLr7pn2W6P55MSCuxDNWAN9XN
	 8tHx9pgPSLIvzwoFkyxj4rafY40EnhcujseMMkBmznGpkKSd+J+6OfARoiqYrP418p
	 xBR7Q96S2lXnRZMBCHLZeNSKF992HR5PPK56cs0QVbpvmanIPapCxMP8m+svfMRQ4o
	 yF/dZUns4ewCw==
Date: Tue, 1 Jul 2025 12:38:23 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Juergen Gross <jgross@suse.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: add me as an additional stubdom
 maintainer
In-Reply-To: <20250701062232.7117-1-jgross@suse.com>
Message-ID: <alpine.DEB.2.22.394.2507011238170.862517@ubuntu-linux-20-04-desktop>
References: <20250701062232.7117-1-jgross@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 1 Jul 2025, Juergen Gross wrote:
> I've been the main contributor to the stubdom framework for several
> years now.
> 
> Add me as a maintainer.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fcd24b3d58..c4886c1159 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -516,6 +516,7 @@ T:	git https://xenbits.xenproject.org/git-http/seabios.git
>  
>  STUB DOMAINS
>  M:	Samuel Thibault <samuel.thibault@ens-lyon.org>
> +M:	Juergen Gross <jgross@suse.com>
>  S:	Supported
>  F:	config/Stubdom.mk.in
>  F:	m4/stubdom.m4
> -- 
> 2.43.0
> 

