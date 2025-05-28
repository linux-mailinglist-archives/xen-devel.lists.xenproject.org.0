Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E55DAC5E05
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 02:08:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998825.1379525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uK4KK-0000eq-6v; Wed, 28 May 2025 00:07:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998825.1379525; Wed, 28 May 2025 00:07:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uK4KK-0000cp-3Y; Wed, 28 May 2025 00:07:24 +0000
Received: by outflank-mailman (input) for mailman id 998825;
 Wed, 28 May 2025 00:07:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I8Hg=YM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uK4KH-0000cj-Qg
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 00:07:21 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8218388-3b57-11f0-b894-0df219b8e170;
 Wed, 28 May 2025 02:07:19 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EA7A7A4F23B;
 Wed, 28 May 2025 00:07:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFCDDC4CEE9;
 Wed, 28 May 2025 00:07:16 +0000 (UTC)
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
X-Inumbo-ID: b8218388-3b57-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748390837;
	bh=hMi9VbDT7He5JUpkxI5juV513vfu1z7Dcmt8BzdXlNI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=swE9Unmnh+uAzIq9TZiiWam5kmwGyN54tzdYLrKbF/VycRhMxWGrvXgL4B9twKD2E
	 JRXi+XZBNocA7AcfAj3Elh0ISYW2QQUhdQqKL+Rpx8LGuTnPXJGJrSP3CoP+ZmmAwL
	 jVrvfGEVNUCFvCG5YztRNSDPLoP0xJrZuk50PJAfDBFF3/S6gsguQ2qtxoDnWdKMM+
	 3lHu3x79/dzFw3wYiHw5FqmBxZ/7pvFkA198VwAnyfCT/Mdigslfu4FsH8EFeHaBfE
	 01tMMB96ucdkKCNme8ev9cLJWS8xiifDM7buzMqdL52yEEV54elmAJ9WSaB8uPeTWF
	 CEEm38EOLyCfA==
Date: Tue, 27 May 2025 17:07:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Anthony PERARD <anthony@xenproject.org>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH 1/3] tools/tests: Drop depriv-fd-checker
In-Reply-To: <aDSZ8r3JhYn6LtPH@l14>
Message-ID: <alpine.DEB.2.22.394.2505271707030.135336@ubuntu-linux-20-04-desktop>
References: <20250520205239.203253-1-andrew.cooper3@citrix.com> <20250520205239.203253-2-andrew.cooper3@citrix.com> <aDSZ8r3JhYn6LtPH@l14>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 26 May 2025, Anthony PERARD wrote:
> On Tue, May 20, 2025 at 09:52:37PM +0100, Andrew Cooper wrote:
> > Unlike the other tests, this is not standalone.  It requires poking at a live
> > system, making it unweildly to use.
> > 
> > It hasn't been touched in 7 years, despite changes in libraries and kernel
> > devices using the deprivilege infrastructure.
> > 
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

