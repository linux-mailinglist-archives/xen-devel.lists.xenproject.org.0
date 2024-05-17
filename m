Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E11F8C8DEA
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 23:58:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724489.1129770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s85b4-0004Of-UD; Fri, 17 May 2024 21:58:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724489.1129770; Fri, 17 May 2024 21:58:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s85b4-0004MC-Qe; Fri, 17 May 2024 21:58:38 +0000
Received: by outflank-mailman (input) for mailman id 724489;
 Fri, 17 May 2024 21:58:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ijk8=MU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s85b2-0004M6-Mp
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 21:58:36 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 929e9a9a-1498-11ef-b4bb-af5377834399;
 Fri, 17 May 2024 23:58:22 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0D654CE1B67;
 Fri, 17 May 2024 21:58:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B89B9C2BD10;
 Fri, 17 May 2024 21:58:15 +0000 (UTC)
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
X-Inumbo-ID: 929e9a9a-1498-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715983096;
	bh=rUqFai1gUXokCmftMmeJg2QnclhtWE9JTxxkYCtBU6U=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UWA3HEzZi7lgbMMw1rLzE/vtbNbWNJkl4lwnmOM+PPsb2iooxjWGzNFCHuSChfvYW
	 1A+W13GiDbEkce8mmYZU0lxHrVGNAenGB8U42PeNNXb8Ad6cn16JgC3JyEm08YZ0ld
	 OZEqx73vmeelUJtZFR6tZ/cnSkFGZ1A3YLskoFiUMRZz2h5QufLoFijl0mOg9RbR38
	 7EIt25/Ql4Ks6Z96hYqmRWaKXGDVdPxyNgNB7S9o8tBh7Ba8KVR+71BwF74dgZ/lmG
	 1xQzttV/gnpNPgyZ4pK+tSEC3gi60OWoeudkY2XQX2ObaKJLEOrrZLfccloa0HKXT8
	 NJFIGscVIB1hQ==
Date: Fri, 17 May 2024 14:58:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 03/12] automation: switch to alpine:3.19
In-Reply-To: <a681e1d414c0735128cdde70d6b521d8c96e6e45.1715867907.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2405171458040.1052252@ubuntu-linux-20-04-desktop>
References: <cover.f23e316613d8f82981f99b5fb90e36255c4adc63.1715867907.git-series.marmarek@invisiblethingslab.com> <a681e1d414c0735128cdde70d6b521d8c96e6e45.1715867907.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-529455756-1715983095=:1052252"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-529455756-1715983095=:1052252
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 16 May 2024, Marek Marczykowski-Górecki wrote:
> Alpine 3.19 is needed for upcoming stubdomain tests, as linux stubdomain
> build requires dracut-core package (dracut-install tool specifically)
> which isn't available in 3.18. While technically it will be needed only
> in the x86_64 builds, switch Alpine version everywhere for uniformity.
> Note this bumps kernel version requirement on docker runners -
> dracut-install uses faccessat2() syscall which was introduced in Linux
> 5.8.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

--8323329-529455756-1715983095=:1052252--

