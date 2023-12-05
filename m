Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6BE8062B2
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 00:06:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648668.1012643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAeUC-0003XL-43; Tue, 05 Dec 2023 23:05:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648668.1012643; Tue, 05 Dec 2023 23:05:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAeUC-0003Vf-08; Tue, 05 Dec 2023 23:05:52 +0000
Received: by outflank-mailman (input) for mailman id 648668;
 Tue, 05 Dec 2023 23:05:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MQDs=HQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rAeOc-0001rP-5L
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 23:00:06 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 068d810e-93c2-11ee-98e5-6d05b1d4d9a1;
 Wed, 06 Dec 2023 00:00:05 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id DB265CE1B7D;
 Tue,  5 Dec 2023 23:00:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33450C433C8;
 Tue,  5 Dec 2023 23:00:01 +0000 (UTC)
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
X-Inumbo-ID: 068d810e-93c2-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701817202;
	bh=de85faNbES6GMHE2TWVFPP2n2qe5Y4DDk91KBKFrjHA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Vi/AcdolOIISPESliqJxEDsadX2YQypwqWL7qb8NvfPW0NHmYcX9Ed0bRQeDH4RF8
	 xxE8ZDYo2ibJSA6Ns0i4/WRkuJxZaFhJgJ5XuKrv2RuP3rKz9bK/WSxJ/0RZZV2VCH
	 OSPVDD3e4w0AWbyH0J7y7Fq2K/u9lZfUIdSaHvFu6LDV6ksXJnuzxxobiw1HhFlH4n
	 jBR89oW9dcUuc+0dY4lIv8J0G2HGqgqAgOmY9wHJ8KTpnAviymFIsUj780lYVa26rf
	 owtSOKsdKiQI028hW+oETybG3Bs2tA+XnmAh+Wk9VU7NyF7CEEfxBL26BUxYj3eiGm
	 houg8/EHwYCew==
Date: Tue, 5 Dec 2023 14:59:59 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] CI: Fix fallout from adding elfutils-dev to the build
 container
In-Reply-To: <20231205225640.75987-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2312051459520.110490@ubuntu-linux-20-04-desktop>
References: <20231205225640.75987-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1255926777-1701817202=:110490"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1255926777-1701817202=:110490
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 5 Dec 2023, Andrew Cooper wrote:
> Commit 948e03303138 ("automation/alpine: add elfutils-dev") had an unintended
> consequence of causing Qemu to gain a runtime dependency on libdw.so
> 
> The {adl,zen3p}-pci-hvm-x86-64-gcc-debug tests, which are the only two tests
> that run the built Qemu, started failing with:
> 
>   Error loading shared library libdw.so.1: No such file or directory (needed by /usr/local/lib/xen/bin/qemu-system-i386)
>   Error relocating /usr/local/lib/xen/bin/qemu-system-i386: dwfl_begin: symbol not found
> 
> Update the test container with libelf to cope.
> 
> While editing the runtime dependency list, fix up two other problems causing
> bloat.  texinfo isn't a runtime dependency, and we should be using xz itself,
> not it's development libraries.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Anthony PERARD <anthony.perard@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Doug Goldstein <cardoe@cardoe.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> I've already pushed the x86 container as part of confirming the fix.
> ---
>  automation/tests-artifacts/alpine/3.18-arm64v8.dockerfile | 3 +--
>  automation/tests-artifacts/alpine/3.18.dockerfile         | 4 ++--
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/automation/tests-artifacts/alpine/3.18-arm64v8.dockerfile b/automation/tests-artifacts/alpine/3.18-arm64v8.dockerfile
> index 94f69621f40e..0e5ae7f2b4d8 100644
> --- a/automation/tests-artifacts/alpine/3.18-arm64v8.dockerfile
> +++ b/automation/tests-artifacts/alpine/3.18-arm64v8.dockerfile
> @@ -21,10 +21,9 @@ RUN \
>    apk add python3 && \
>    apk add zlib && \
>    apk add ncurses && \
> -  apk add texinfo && \
>    apk add yajl && \
>    apk add libaio && \
> -  apk add xz-dev && \
> +  apk add xz && \
>    apk add util-linux && \
>    apk add argp-standalone && \
>    apk add libfdt && \
> diff --git a/automation/tests-artifacts/alpine/3.18.dockerfile b/automation/tests-artifacts/alpine/3.18.dockerfile
> index f1b4a8b7a191..9cde6c9ad4da 100644
> --- a/automation/tests-artifacts/alpine/3.18.dockerfile
> +++ b/automation/tests-artifacts/alpine/3.18.dockerfile
> @@ -22,10 +22,9 @@ RUN \
>    apk add python3 && \
>    apk add zlib && \
>    apk add ncurses && \
> -  apk add texinfo && \
>    apk add yajl && \
>    apk add libaio && \
> -  apk add xz-dev && \
> +  apk add xz && \
>    apk add util-linux && \
>    apk add argp-standalone && \
>    apk add libfdt && \
> @@ -34,6 +33,7 @@ RUN \
>    apk add curl && \
>    apk add udev && \
>    apk add pciutils && \
> +  apk add libelf && \
>    \
>    # Xen
>    cd / && \
> 
> base-commit: ff1178062094837d55ef342070e58316c43a54c9
> prerequisite-patch-id: 477e3af5692ee0daa13d795fdf78384be604fd66
> prerequisite-patch-id: 60d13b1c04d8a808a42d20b3432270cfd87a47fc
> prerequisite-patch-id: 457b56a295e75d2d9f837b44cd483812ca66cd85
> -- 
> 2.30.2
> 
--8323329-1255926777-1701817202=:110490--

