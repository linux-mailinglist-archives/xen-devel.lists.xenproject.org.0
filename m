Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6197B87C3AC
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 20:24:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693474.1081582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkqgg-0007NT-Ll; Thu, 14 Mar 2024 19:24:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693474.1081582; Thu, 14 Mar 2024 19:24:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkqgg-0007Kc-JE; Thu, 14 Mar 2024 19:24:22 +0000
Received: by outflank-mailman (input) for mailman id 693474;
 Thu, 14 Mar 2024 19:24:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=69K2=KU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rkqgf-0007KW-M5
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 19:24:21 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73131814-e238-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 20:24:19 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id EF150CE1E62;
 Thu, 14 Mar 2024 19:24:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19B47C433F1;
 Thu, 14 Mar 2024 19:24:13 +0000 (UTC)
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
X-Inumbo-ID: 73131814-e238-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710444255;
	bh=8HWGyCa2jj/1cUUh9PVsnhTUObz0v0gsP1kArkzUU3o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RJwRjxefgg0bsJlP4oyxjnbWEO5ORW02BKsVY9aT8E+e548E1aoL1s9hSG85If3nB
	 JMlIlHpkr8qebTrG2GL021iQ0au4OIf0OX1Un+1GDAUlOYyC9Bdn73oLt7RDy38beZ
	 HzRvjZHPlGNxJY1Jmt/h3KFCGj+qdfDX+EyBfBcWAAiJEZoa6EXfApGqcA5baE4Bzb
	 +pIy8hlW6zetVE7il5n0ewmyBBiqyBBRS/l6/uzgzpkAR/2gxYb+vQcczg4eYyx7qG
	 DTpQCz9DHi4o4AdmiO9nXaZg6x0oiyk7l/aphdNEgqr/3sBmP2vzF5xlGgJu88Q7UE
	 MnDQlPopQ61nA==
Date: Thu, 14 Mar 2024 12:24:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Wei Liu <wl@xen.org>
cc: Xen Development List <xen-devel@lists.xenproject.org>, liuwe@microsoft.com, 
    wei.liu@kernel.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: remove myself from various positions
In-Reply-To: <20240314190239.908402-1-wl@xen.org>
Message-ID: <alpine.DEB.2.22.394.2403141221200.853156@ubuntu-linux-20-04-desktop>
References: <20240314190239.908402-1-wl@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1778962320-1710444255=:853156"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1778962320-1710444255=:853156
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 14 Mar 2024, Wei Liu wrote:
> I have not been active in the Xen community for some time. Update the
> MAINTAINERS file to reflect reality.
> 
> Signed-off-by: Wei Liu <wl@xen.org>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> It has been a pleasure working with all of you. I'm sure we will cross
> paths in the future.

Thanks Wei! It has been fantastic working with you, and I look forward
at the opportunity to do so again when the opportunity arises in the
future.


> Seabios is in need for a new owner. For now I left my name there.
> ---
>  MAINTAINERS | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b2cc3cc3921b..f003085ad175 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -387,7 +387,6 @@ F:	xen/arch/x86/machine_kexec.c
>  F:	xen/arch/x86/x86_64/kexec_reloc.S
>  
>  LIBS
> -M:	Wei Liu <wl@xen.org>
>  M:	Anthony PERARD <anthony.perard@citrix.com>
>  R:	Juergen Gross <jgross@suse.com>
>  S:	Supported
> @@ -422,7 +421,6 @@ F:	xen/test/livepatch/*
>  MINI-OS
>  M:	Samuel Thibault <samuel.thibault@ens-lyon.org>
>  M:	Juergen Gross <jgross@suse.com>
> -R:	Wei Liu <wl@xen.org>
>  S:	Supported
>  L:	minios-devel@lists.xenproject.org
>  T:	git https://xenbits.xenproject.org/git-http/mini-os.git
> @@ -436,7 +434,6 @@ F:	tools/ocaml/
>  
>  OVMF UPSTREAM
>  M:	Anthony PERARD <anthony.perard@citrix.com>
> -M:	Wei Liu <wl@xen.org>
>  S:	Supported
>  T:	git https://xenbits.xenproject.org/git-http/ovmf.git
>  
> @@ -521,7 +518,6 @@ F:	xen/arch/arm/include/asm/tee
>  F:	xen/arch/arm/tee/
>  
>  TOOLSTACK
> -M:	Wei Liu <wl@xen.org>
>  M:	Anthony PERARD <anthony.perard@citrix.com>
>  S:	Supported
>  F:	autogen.sh
> @@ -583,7 +579,6 @@ X86 ARCHITECTURE
>  M:	Jan Beulich <jbeulich@suse.com>
>  M:	Andrew Cooper <andrew.cooper3@citrix.com>
>  M:	Roger Pau Monné <roger.pau@citrix.com>
> -R:	Wei Liu <wl@xen.org>
>  S:	Supported
>  L:	xen-devel@lists.xenproject.org
>  F:	xen/arch/x86/
> @@ -626,7 +621,6 @@ F:	xen/arch/x86/mm/shadow/
>  
>  X86 VIRIDIAN ENLIGHTENMENTS
>  M:	Paul Durrant <paul@xen.org>
> -M:	Wei Liu <wl@xen.org>
>  S:	Supported
>  F:	xen/arch/x86/guest/hyperv/
>  F:	xen/arch/x86/hvm/viridian/
> @@ -636,7 +630,6 @@ F:	xen/arch/x86/include/asm/guest/hyperv-tlfs.h
>  F:	xen/arch/x86/include/asm/hvm/viridian.h
>  
>  XENSTORE
> -M:	Wei Liu <wl@xen.org>
>  M:	Juergen Gross <jgross@suse.com>
>  R:	Julien Grall <julien@xen.org>
>  S:	Supported
> @@ -682,7 +675,6 @@ M:	George Dunlap <george.dunlap@citrix.com>
>  M:	Jan Beulich <jbeulich@suse.com>
>  M:	Julien Grall <julien@xen.org>
>  M:	Stefano Stabellini <sstabellini@kernel.org>
> -M:	Wei Liu <wl@xen.org>
>  L:	xen-devel@lists.xenproject.org
>  S:	Supported
>  F:	*
> -- 
> 2.43.0
> 
--8323329-1778962320-1710444255=:853156--

