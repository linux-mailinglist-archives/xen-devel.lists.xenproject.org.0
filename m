Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7F0A431DA
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 01:29:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895390.1303990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmioY-0007N8-Iw; Tue, 25 Feb 2025 00:28:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895390.1303990; Tue, 25 Feb 2025 00:28:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmioY-0007Lg-Fw; Tue, 25 Feb 2025 00:28:46 +0000
Received: by outflank-mailman (input) for mailman id 895390;
 Tue, 25 Feb 2025 00:28:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qxAZ=VQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tmioW-0007La-KO
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 00:28:44 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04::f03c:95ff:fe5e:7468])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 768abba3-f30f-11ef-9aae-95dc52dad729;
 Tue, 25 Feb 2025 01:28:42 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 56EB261210;
 Tue, 25 Feb 2025 00:28:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16974C4CED6;
 Tue, 25 Feb 2025 00:28:38 +0000 (UTC)
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
X-Inumbo-ID: 768abba3-f30f-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740443320;
	bh=tz6sXafLRBTAzpIRjhkLDrjXx52jWXrwvqrPl17fE0E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZyxZmIT9/1cPkDkAD2Y6jES3R1jVrrAcVWNfRXuCUSV7FRYlFo/+/IGeobH695fgm
	 B+USlvqO7CPvxmoXQvoblHrKlSbDCT+JnO/+rhWAuNQ9if1ydcuwGOnLm4h2zrRMZ/
	 9NL6YYKPNPv2V+th0CMzb4YNaAohyDSkaTqIYEpdYkHdrVyjxz4jvSYav5DDo7SJWX
	 gFMhgdQt7vPSB9B2TFicuZGjULp6+v+Yl8jog/1fFFv8MYdun0FQ0qqwLYV/V1/0+i
	 3kaAGTuvEEmuvIebz8CbYoFHXBXh3slfiVK1ZCXl2UBk2nL/yVNnDYSunVh/efwcLK
	 z9f+8YKB+GECA==
Date: Mon, 24 Feb 2025 16:28:37 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH] CirrusCI: Use shallow clone
In-Reply-To: <20250224154236.1116264-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2502241628290.1791669@ubuntu-linux-20-04-desktop>
References: <20250224154236.1116264-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-944627328-1740443319=:1791669"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-944627328-1740443319=:1791669
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 24 Feb 2025, Andrew Cooper wrote:
> This reduces the Clone step from ~50s to ~3s.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Doug Goldstein <cardoe@cardoe.com>
> 
> Example with shallow clone:
>   https://cirrus-ci.com/task/4625566281760768
> 
> Example without:
>   https://cirrus-ci.com/task/5338544140451840
> ---
>  .cirrus.yml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/.cirrus.yml b/.cirrus.yml
> index 7216729b6993..e2949d99d73a 100644
> --- a/.cirrus.yml
> +++ b/.cirrus.yml
> @@ -13,6 +13,7 @@ freebsd_template: &FREEBSD_ENV
>    environment:
>      APPEND_LIB: /usr/local/lib
>      APPEND_INCLUDES: /usr/local/include
> +    CIRRUS_CLONE_DEPTH: 1
>  
>  freebsd_full_build_template: &FREEBSD_FULL_BUILD_TEMPLATE
>    << : *FREEBSD_ENV
> 
> base-commit: e16acd80674002cbc6b51626e826bd6f9f624a63
> -- 
> 2.39.5
> 
--8323329-944627328-1740443319=:1791669--

