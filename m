Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 239B0AC5E06
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 02:08:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998832.1379534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uK4Kr-00016S-Ds; Wed, 28 May 2025 00:07:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998832.1379534; Wed, 28 May 2025 00:07:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uK4Kr-00014X-Ai; Wed, 28 May 2025 00:07:57 +0000
Received: by outflank-mailman (input) for mailman id 998832;
 Wed, 28 May 2025 00:07:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I8Hg=YM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uK4Kq-0000rc-QE
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 00:07:56 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd83fdee-3b57-11f0-a2fe-13f23c93f187;
 Wed, 28 May 2025 02:07:55 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BD602614B3;
 Wed, 28 May 2025 00:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B56B1C4CEE9;
 Wed, 28 May 2025 00:07:52 +0000 (UTC)
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
X-Inumbo-ID: cd83fdee-3b57-11f0-a2fe-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748390873;
	bh=M1+i/XHruc3Dm6VRBbhQy2b1KfoqoxA04Ngy73RPfjg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=B7/X4KzwRD50SW5V1NTqg0jhnzAbWLvWWcAQn22rswcKl2N50ayS/kU1MubYoFlVw
	 qP1DGGJrkjHRgAg1MiwbjGkEEQnb3C7tlXJU3njQzZqguXugIVIxww+K5wcrqvOZRx
	 aCAzOV5If7OWKQmtYSVEw0jhZMKSChzQxDxD4BpFkBONFqW1tUVoDiCUUbdbj9O5EG
	 93PGYsx+rx2+FxHWHBjZUlfLKa705C4GM/iMg8UTO8+dUmCes1+UJTP6FuMSldDKs0
	 MlJ1cBYMuysMkFhTL096+Ef3ltdeaA9+ymdqrD8ElOq2/XH/0DYoxirBJ8HH0dSOwI
	 DlPtyhGSzzEKQ==
Date: Tue, 27 May 2025 17:07:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Anthony PERARD <anthony@xenproject.org>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH 2/3] tools/tests: Install tests into $(LIBEXEC)/tests
In-Reply-To: <aDSdVx116mXNKJr5@l14>
Message-ID: <alpine.DEB.2.22.394.2505271707430.135336@ubuntu-linux-20-04-desktop>
References: <20250520205239.203253-1-andrew.cooper3@citrix.com> <20250520205239.203253-3-andrew.cooper3@citrix.com> <aDSdVx116mXNKJr5@l14>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 26 May 2025, Anthony PERARD wrote:
> On Tue, May 20, 2025 at 09:52:38PM +0100, Andrew Cooper wrote:
> > $(LIBEXEC_BIN) is a dumping ground of many things.  Separate the "clearly
> > tests" from everything else so we can clean up how they're run in CI.
> > 
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

