Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5335FB5094D
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 01:36:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1117425.1463522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uw7sQ-0007vZ-VE; Tue, 09 Sep 2025 23:35:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1117425.1463522; Tue, 09 Sep 2025 23:35:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uw7sQ-0007tx-SU; Tue, 09 Sep 2025 23:35:54 +0000
Received: by outflank-mailman (input) for mailman id 1117425;
 Tue, 09 Sep 2025 23:35:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aO0K=3U=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uw7sP-0007tr-RF
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 23:35:53 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b84282f5-8dd5-11f0-9809-7dc792cee155;
 Wed, 10 Sep 2025 01:35:51 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1458760230;
 Tue,  9 Sep 2025 23:35:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC7B1C4CEF4;
 Tue,  9 Sep 2025 23:35:48 +0000 (UTC)
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
X-Inumbo-ID: b84282f5-8dd5-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757460949;
	bh=UdqYZhSD2LFvS1Of2ShP2efKh3iuuOWBIgkXRo70Z8o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=J0VHhwWKSMEUvakYfYxAhZk7TRE5TxNLXQ1dG/Gr88WTr17/3j3WqlPWJtwp7Gk/1
	 ro22dVEkBX0UOHyhParxyDS1arhBjHPlV/KjepTxof8UVMmDUyJvZrsvtAtqzEnv3i
	 X2t5135ijxDHidTLJqWVeWyHgEJF9nyOOQQAfl7obGQEVPGWA1WmCjDZ3E3rInhD7F
	 WFAn0RPHvqgdUY4x/z/vsSY+s1pYciGL/XjOuG0AgTvzwM3l7I4PXjT/9FLV92ps6s
	 doHflMbeX9RACQyrzU7xEXqwda/OenV+USLoo9Unmj4VL7mJcopV0WhPpRIih+iuJL
	 ZUpkeXRKQfXNg==
Date: Tue, 9 Sep 2025 16:35:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmukhin@xen.org
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH TEST-ARTEFACTS] Be explicit about root in
 scripts/alpine-rootfs.sh
In-Reply-To: <aMB/GpG7/VZRqVK9@kraken>
Message-ID: <alpine.DEB.2.22.394.2509091635400.1405870@ubuntu-linux-20-04-desktop>
References: <20250909170111.1810147-1-andrew.cooper3@citrix.com> <aMB/GpG7/VZRqVK9@kraken>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 9 Sep 2025, dmukhin@xen.org wrote:
> On Tue, Sep 09, 2025 at 06:01:11PM +0100, Andrew Cooper wrote:
> > The container is running as root, but be explicit anyway.
> > 
> > No functional change.
> > 
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Reviewed-by: Denis Mukhin <dmukhin@ford.com> 

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

