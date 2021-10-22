Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8075B437B0D
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 18:39:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215208.374254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdxZu-0004y0-Qc; Fri, 22 Oct 2021 16:39:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215208.374254; Fri, 22 Oct 2021 16:39:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdxZu-0004vb-NA; Fri, 22 Oct 2021 16:39:34 +0000
Received: by outflank-mailman (input) for mailman id 215208;
 Fri, 22 Oct 2021 16:39:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mdxZs-0004vT-J7
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 16:39:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mdxZs-0000KK-CK
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 16:39:32 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mdxZs-0007vB-B7
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 16:39:32 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mdxZo-00028O-Q3; Fri, 22 Oct 2021 17:39:28 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=d8oRa1yNpBhV0f5hvaDdaht5jHs3LW30RkrPh7mChZ0=; b=c4p+rGTCJMTic+49NzxABVt/gJ
	mGzBkcYJYaaspHyV3RF7ZI0mZls+8Xa3NPA0mYT4YouYEAHHPm7FghTh2GQ/q8W8QMt4U/zxEABC8
	1diZtZRUpSgaFyqNA3QddEuvt800BLoz6feVq5ss3C9GHQde9iRylgZQ6hTL8Xqxd0tE=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24946.59712.338061.192369@mariner.uk.xensource.com>
Date: Fri, 22 Oct 2021 17:39:28 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    <wl@xen.org>,
    <sstabellini@kernel.org>,
    <andrew.cooper3@citrix.com>,
    "Doug Goldstein" <cardoe@cardoe.com>
Subject: Re: [XEN PATCH] automation: actually build with clang for ubuntu-focal-clang* jobs
In-Reply-To: <20211022163644.547018-1-anthony.perard@citrix.com>
References: <20211022163644.547018-1-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Anthony PERARD writes ("[XEN PATCH] automation: actually build with clang for ubuntu-focal-clang* jobs"):
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

I think this is a "straightforawrd bugfix" so does not need a release
ack, but FTR

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Ian.

