Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0515A5D261
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 23:16:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909447.1316386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts7t7-0003J1-8P; Tue, 11 Mar 2025 22:15:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909447.1316386; Tue, 11 Mar 2025 22:15:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts7t7-0003GK-5m; Tue, 11 Mar 2025 22:15:49 +0000
Received: by outflank-mailman (input) for mailman id 909447;
 Tue, 11 Mar 2025 22:15:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NzKm=V6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ts7t6-0003GE-5q
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 22:15:48 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 611c48d3-fec6-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 23:15:46 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5C9365C5E24;
 Tue, 11 Mar 2025 22:13:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26EC3C4CEE9;
 Tue, 11 Mar 2025 22:15:43 +0000 (UTC)
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
X-Inumbo-ID: 611c48d3-fec6-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741731344;
	bh=mh6LCT0NJjNAvKN19yehBveDjxYI8DOKn1UPiT6aLGE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WrbNpt+xHiVX18hDg/tJGn8PuMUbav01AJ9M51ycb5rM+fJfNA5Pv3t3KBN3D0hqC
	 MRXYfaPw5ahKo7njjzIpMYLYrxe+Nk/2qb3Nq/OgKFdDAAYg46LR5781h+3Hpgu/eR
	 MyQk4+Zx60MSnUFqU5JNj96iekoINFH/V1LJQdfFg0lFt11CY46n9Z1suqf46MgBc0
	 xWxg4LaVCInAxtR96PVDzY1s0Yh8FScXJROjzlvctGHmroVxo9PHnRwSxY87V9YfxS
	 JEprokMUrhcvaXR4r3hIi3rgg+LPf0fwlJlgCCaNRuIWIx1VG7GCFKO2KqfTh9mFjM
	 jXCyizueUV/Mg==
Date: Tue, 11 Mar 2025 15:15:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jason Andryuk <jason.andryuk@amd.com>
cc: dmkhn@proton.me, xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH] docs: add explanation for 'Resolved:'
In-Reply-To: <55c35901-de99-46a2-891d-991925e9bf7b@amd.com>
Message-ID: <alpine.DEB.2.22.394.2503111515190.3090675@ubuntu-linux-20-04-desktop>
References: <20250311072805.778362-1-dmkhn@proton.me> <55c35901-de99-46a2-891d-991925e9bf7b@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 11 Mar 2025, Jason Andryuk wrote:
> On 2025-03-11 03:28, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> > 
> > 'Resolves:' tag may be used if the patch addresses one of the tickets
> > logged via Gitlab to auto-close such ticket when the patch got merged.
> > 
> > Add documentation for the tag.
> > 
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> 
> With the commit title change,
> 
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

