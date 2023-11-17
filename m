Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2907EEA9B
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 02:15:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634803.990345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3nSJ-0007Wr-Pb; Fri, 17 Nov 2023 01:15:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634803.990345; Fri, 17 Nov 2023 01:15:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3nSJ-0007Uj-Mx; Fri, 17 Nov 2023 01:15:35 +0000
Received: by outflank-mailman (input) for mailman id 634803;
 Fri, 17 Nov 2023 01:15:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5d38=G6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r3nSI-0007UV-CU
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 01:15:34 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc43400a-84e6-11ee-9b0e-b553b5be7939;
 Fri, 17 Nov 2023 02:15:31 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8F3D4CE21FC;
 Fri, 17 Nov 2023 01:15:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F962C433C7;
 Fri, 17 Nov 2023 01:15:24 +0000 (UTC)
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
X-Inumbo-ID: cc43400a-84e6-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700183724;
	bh=InRDp9G1uU4PcQDoE/JSVFCXhBDOGqsWBf+3hOzsdBs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GA9sAoVxkRZxR0/tfqXivD+FzvXu0mLprR2xSka1HRfBGaiKm5rb452ryChJmalaa
	 M+lWHeoJ8hJEly1iS3t1ISpMvCOXly3Q49GwcE9I/1yLeV7Wr0KQp5BqNrfS16Iokm
	 8sFHF0PsKHdm1686fCgaXnzU+sAjgqWBgrHpg3P/NnHPT2gEmABRFAjkZ/cqeQo2FU
	 ukU+xmkL8jc237CG2pBLkBKGlE875a+u/pNqNDdt+uQbnBhNDVFF1wCKTFAx0kRLrY
	 rldPtQJ9tXbyoRsAdbSyCgl4gu2JCYMQUogbkIV1yAz9d7RgVnPvpaiLCSMLjgsl3M
	 7R2Pet//l60ag==
Date: Thu, 16 Nov 2023 17:15:23 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Roger Pau Monne <roger.pau@citrix.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 3/6] automation: fix jessie/stretch images to use
 archive.debian.org apt repos
In-Reply-To: <20231116121310.72210-4-roger.pau@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2311161715170.773207@ubuntu-linux-20-04-desktop>
References: <20231116121310.72210-1-roger.pau@citrix.com> <20231116121310.72210-4-roger.pau@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-606778400-1700183724=:773207"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-606778400-1700183724=:773207
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 16 Nov 2023, Roger Pau Monne wrote:
> Otherwise it's impossible to build the images.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/build/debian/jessie-i386.dockerfile  | 7 +++++++
>  automation/build/debian/jessie.dockerfile       | 7 +++++++
>  automation/build/debian/stretch-i386.dockerfile | 7 +++++++
>  automation/build/debian/stretch.dockerfile      | 7 +++++++
>  4 files changed, 28 insertions(+)
> 
> diff --git a/automation/build/debian/jessie-i386.dockerfile b/automation/build/debian/jessie-i386.dockerfile
> index c9ac15a3ffd6..a8dec82bb299 100644
> --- a/automation/build/debian/jessie-i386.dockerfile
> +++ b/automation/build/debian/jessie-i386.dockerfile
> @@ -10,6 +10,13 @@ WORKDIR /build
>  
>  ENTRYPOINT ["linux32"]
>  
> +# replace repos in archive as release is EOL
> +RUN cat <<"END" > /etc/apt/sources.list
> +deb http://archive.debian.org/debian/ jessie main contrib non-free
> +deb http://archive.debian.org/debian/ jessie-backports main contrib non-free
> +deb http://archive.debian.org/debian-security/ jessie/updates main contrib non-free
> +END
> +
>  # build depends
>  RUN apt-get update && \
>      apt-get --quiet --yes install \
> diff --git a/automation/build/debian/jessie.dockerfile b/automation/build/debian/jessie.dockerfile
> index 63b2c1e5b771..5c71c3e3ea75 100644
> --- a/automation/build/debian/jessie.dockerfile
> +++ b/automation/build/debian/jessie.dockerfile
> @@ -8,6 +8,13 @@ ENV USER root
>  RUN mkdir /build
>  WORKDIR /build
>  
> +# replace repos in archive as release is EOL
> +RUN cat <<"END" > /etc/apt/sources.list
> +deb http://archive.debian.org/debian/ jessie main contrib non-free
> +deb http://archive.debian.org/debian/ jessie-backports main contrib non-free
> +deb http://archive.debian.org/debian-security/ jessie/updates main contrib non-free
> +END
> +
>  # build depends
>  RUN apt-get update && \
>      apt-get --quiet --yes install \
> diff --git a/automation/build/debian/stretch-i386.dockerfile b/automation/build/debian/stretch-i386.dockerfile
> index d93f74c979ef..9739651e25dd 100644
> --- a/automation/build/debian/stretch-i386.dockerfile
> +++ b/automation/build/debian/stretch-i386.dockerfile
> @@ -10,6 +10,13 @@ WORKDIR /build
>  
>  ENTRYPOINT ["linux32"]
>  
> +# replace repos in archive as release is EOL
> +RUN cat <<"END" > /etc/apt/sources.list
> +deb http://archive.debian.org/debian/ stretch main contrib non-free
> +deb http://archive.debian.org/debian/ stretch-backports main contrib non-free
> +deb http://archive.debian.org/debian-security/ stretch/updates main contrib non-free
> +END
> +
>  # build depends
>  RUN apt-get update && \
>      apt-get --quiet --yes install \
> diff --git a/automation/build/debian/stretch.dockerfile b/automation/build/debian/stretch.dockerfile
> index 1af6c691f8f4..2f1a99f45017 100644
> --- a/automation/build/debian/stretch.dockerfile
> +++ b/automation/build/debian/stretch.dockerfile
> @@ -8,6 +8,13 @@ ENV USER root
>  RUN mkdir /build
>  WORKDIR /build
>  
> +# replace repos in archive as release is EOL
> +RUN cat <<"END" > /etc/apt/sources.list
> +deb http://archive.debian.org/debian/ stretch main contrib non-free
> +deb http://archive.debian.org/debian/ stretch-backports main contrib non-free
> +deb http://archive.debian.org/debian-security/ stretch/updates main contrib non-free
> +END
> +
>  # build depends
>  RUN apt-get update && \
>      apt-get --quiet --yes install \
> -- 
> 2.42.0
> 
--8323329-606778400-1700183724=:773207--

