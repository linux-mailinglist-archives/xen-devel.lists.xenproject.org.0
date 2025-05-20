Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 162A1ABE451
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 22:03:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991107.1375007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHTB0-0007Mk-Dl; Tue, 20 May 2025 20:03:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991107.1375007; Tue, 20 May 2025 20:03:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHTB0-0007KT-B6; Tue, 20 May 2025 20:03:02 +0000
Received: by outflank-mailman (input) for mailman id 991107;
 Tue, 20 May 2025 20:03:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t5uZ=YE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uHTAy-0007KJ-H4
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 20:03:00 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ce2e59c-35b5-11f0-a2fa-13f23c93f187;
 Tue, 20 May 2025 22:02:59 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 437B14A90C;
 Tue, 20 May 2025 20:02:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F670C4CEE9;
 Tue, 20 May 2025 20:02:56 +0000 (UTC)
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
X-Inumbo-ID: 6ce2e59c-35b5-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747771377;
	bh=kUJ98PLL4WbosrjwO3iyr66mZbx35KyWFRV12XfJfH0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pgyIy+1zFYu12dN+VYIYI6LQy9/QI0MYBnVwJlDZExO39F/kQNT6UPOD7GzrDcQ4u
	 PwXMgqldsWgoei+CzIIbob3myLQ/UE15EvLeg1XbJ1jR+BpGRzGQQwmz1jZgTD3jSm
	 PAsWqMVg1Rtqf5gvDEPdoDvvl0xPWQrvnM4iz+fXI1/cA9C6FlK8I/C6fvQjx+xzrw
	 XIWND7ZErhVrO6ECm7ZXt0kFci5TK1FxretM+yX0i9mMQGi5dbIEPiS6xsRia3qsPo
	 23DdKy1Q7iwsgoRiFlXywsxh5D9NBb3LPk0GSdf0VbMdH7+WltsUM9/W08tQQUPYWG
	 6ohhL6AZLp5vg==
Date: Tue, 20 May 2025 13:02:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH TEST-ARTEFACTS] (Re)add python3 to alpine rootfs
In-Reply-To: <20250520195141.198061-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2505201302480.2019926@ubuntu-linux-20-04-desktop>
References: <20250520195141.198061-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1091536216-1747771377=:2019926"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1091536216-1747771377=:2019926
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 20 May 2025, Andrew Cooper wrote:
> XTF uses python, and we're looking to reintroduce XTF testing to Xen.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
>  scripts/alpine-rootfs.sh | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/scripts/alpine-rootfs.sh b/scripts/alpine-rootfs.sh
> index c304e2ebfbd9..c999b89dbcd8 100755
> --- a/scripts/alpine-rootfs.sh
> +++ b/scripts/alpine-rootfs.sh
> @@ -22,6 +22,9 @@ PKGS=(
>      xz
>      yajl
>  
> +    # Xen Test Framework
> +    python3
> +
>      # QEMU
>      glib
>      libaio
> -- 
> 2.39.5
> 
--8323329-1091536216-1747771377=:2019926--

