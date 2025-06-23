Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE0BAE4E6A
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 22:58:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022775.1398626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uToFZ-0000nq-6l; Mon, 23 Jun 2025 20:58:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022775.1398626; Mon, 23 Jun 2025 20:58:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uToFZ-0000m1-3U; Mon, 23 Jun 2025 20:58:45 +0000
Received: by outflank-mailman (input) for mailman id 1022775;
 Mon, 23 Jun 2025 20:58:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o1Rx=ZG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uToFX-0000bA-2j
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 20:58:43 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7fddd25-5074-11f0-a30f-13f23c93f187;
 Mon, 23 Jun 2025 22:58:42 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A245A6114F;
 Mon, 23 Jun 2025 20:58:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C808CC4CEEA;
 Mon, 23 Jun 2025 20:58:40 +0000 (UTC)
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
X-Inumbo-ID: d7fddd25-5074-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750712321;
	bh=zO5RyXJKC6tJtnyZUNUZd6Ly40jn/cN8Mwyaq460avU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JH5xScjifOvxpmcKgn/PnuSa/oPcdsgp9TGTxPTPIWbzVUv8ONvAXkPoJ5iHcwGi7
	 /vWUzIB7357j3RvE4bQ9M5O3uRMJiaIMFcYhVKfP1bIRB/GkN58MXxGxjvF6h/Eh5n
	 JcElSAkUVsb5vu/2qst6hTxqMuyXXgqpfzQsLYtMdeJk8FFwL0ZdsFg7jQYGzRIqNK
	 ugO7nSJnQkoZm5DaSy0MY/le9arpnVnnvFRZOAqxOH/Vij3ISBf4Q12GM6rIJZkhZT
	 t1Ar51G53XmAVjIOYTzODHPbo7XKDSDd02uFEOvF0rY08RCgCluOG74P4H6CfIBQPg
	 fcHRUmTecM82A==
Date: Mon, 23 Jun 2025 13:58:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 6/6] [DO NOT MERGE] CI: example how to use ssh to
 extract logs
In-Reply-To: <9e10434c1e5ff6edb53b9efc65485247ad450f0c.1750686195.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2506231358340.8066@ubuntu-linux-20-04-desktop>
References: <cover.16ccd290bf95e314a4f23777f5564b3aa2417e57.1750686195.git-series.marmarek@invisiblethingslab.com> <9e10434c1e5ff6edb53b9efc65485247ad450f0c.1750686195.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-910698808-1750712321=:8066"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-910698808-1750712321=:8066
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

Nice!

On Mon, 23 Jun 2025, Marek Marczykowski-Górecki wrote:
> ---
>  automation/scripts/qubes-x86-64.sh | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
> index cf040a29856b..944d0c6d383f 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -292,6 +292,8 @@ export TEST_LOG="smoke.serial"
>  export TEST_TIMEOUT="$timeout"
>  ./automation/scripts/console.exp | sed 's/\r\+$//'
>  TEST_RESULT=$?
> +ssh -o StrictHostKeyChecking=no root@$SUT_ADDR xl dmesg || :
> +ssh -o StrictHostKeyChecking=no root@$SUT_ADDR dmesg || :
>  
>  if [ -n "$retrieve_xml" ]; then
>      nc -w 10 "$SUT_ADDR" 8080 > tests-junit.xml </dev/null
> -- 
> git-series 0.9.1
> 
--8323329-910698808-1750712321=:8066--

