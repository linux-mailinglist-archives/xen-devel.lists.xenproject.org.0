Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E028A20EC
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 23:31:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704219.1100462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rv1zY-00031m-NG; Thu, 11 Apr 2024 21:29:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704219.1100462; Thu, 11 Apr 2024 21:29:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rv1zY-000307-J9; Thu, 11 Apr 2024 21:29:56 +0000
Received: by outflank-mailman (input) for mailman id 704219;
 Thu, 11 Apr 2024 21:29:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UKzY=LQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rv1zW-000301-MP
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 21:29:54 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a13239c4-f84a-11ee-b908-491648fe20b8;
 Thu, 11 Apr 2024 23:29:52 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 619F6CE2357;
 Thu, 11 Apr 2024 21:29:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F00FC072AA;
 Thu, 11 Apr 2024 21:29:48 +0000 (UTC)
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
X-Inumbo-ID: a13239c4-f84a-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712870989;
	bh=zMYXoG2iWs0Wt6yI2K32YGYw8c6L89iCTp3MY8ML2fE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mSvDhoTj/pyzUFU/iGliwTq4lqp1g5k39z2v6/NbKfy0swC08lLjI68XhWG1dvSS+
	 RkzL/dOphMQt0KQFW2hgRfDxFpZzcrPAAqTZ2ETplNiTvKyYFlhLaqSMSnBt3qVrWW
	 7soitKTgqTtbbRE5q39c6pl3cJ5iAQ2bKx2k3pQrj23T9UP2/alnpenq69u2dUGz6/
	 gUrzVbD5LjM3pIK856D2RB7bW++EnUNslKFxfg/9k2mkVjAKHITSCDV+k9oU2LtlsM
	 hxJ6dJk+hnNf4PaLdkxU8X/Hxd78IEKeott8wt20ozwGVecmwSlU5XSG2GauQ5c4MI
	 58tDtrbBgqMoQ==
Date: Thu, 11 Apr 2024 14:29:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    George Dunlap <George.Dunlap@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] docs/hypercall-abi: State that the hypercall page is
 optional
In-Reply-To: <20240411150458.1726116-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2404111429330.997881@ubuntu-linux-20-04-desktop>
References: <20240411150458.1726116-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-636236586-1712870989=:997881"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-636236586-1712870989=:997881
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 10 Apr 2024, Andrew Cooper wrote:
> Xen doesn't care (and indeed, cannot feasibly tell) whether a hypercall was
> initiated from inside or outside a hypercall page.
> 
> For SEV-SNP/TDX encrypted VMs, use of a hypercall page would violate the
> integrity properties wanted.
> 
> Explicitly state that the hypercall page is optional.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: George Dunlap <George.Dunlap@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Anthony PERARD <anthony.perard@citrix.com>
> ---
>  docs/guest-guide/x86/hypercall-abi.rst | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/guest-guide/x86/hypercall-abi.rst b/docs/guest-guide/x86/hypercall-abi.rst
> index 83890e1cb613..8004122ca49d 100644
> --- a/docs/guest-guide/x86/hypercall-abi.rst
> +++ b/docs/guest-guide/x86/hypercall-abi.rst
> @@ -79,7 +79,8 @@ Hypercall Page
>  ==============
>  
>  The hypercall page is a page of guest RAM into which Xen will write suitable
> -transfer stubs.
> +transfer stubs.  It is intended as a convenience for guests, but use of the
> +hypercall page is not mandatory for making hypercalls to Xen.
>  
>  Creating a hypercall page is an isolated operation from Xen's point of view.
>  It is the guests responsibility to ensure that the hypercall page, once
> 
> base-commit: 6cb501e3e6db36b1b4b6345f5af8adc0a291b404
> -- 
> 2.30.2
> 
--8323329-636236586-1712870989=:997881--

