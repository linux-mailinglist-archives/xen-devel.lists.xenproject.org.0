Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1282F4C41
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 14:33:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66546.118241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzgHB-00049Y-33; Wed, 13 Jan 2021 13:33:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66546.118241; Wed, 13 Jan 2021 13:33:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzgHA-000499-WF; Wed, 13 Jan 2021 13:33:29 +0000
Received: by outflank-mailman (input) for mailman id 66546;
 Wed, 13 Jan 2021 13:33:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kzgH9-000494-KN
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 13:33:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kzgH9-0004id-Hn
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 13:33:27 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kzgH9-0006Rr-GR
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 13:33:27 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1kzgH4-0001Cv-NV; Wed, 13 Jan 2021 13:33:22 +0000
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
	bh=1rbbHu/nGzyyXtlSGIcblv56EAtWBynK3SZxIHPl2+A=; b=6PgdDPn28S5T2G93P/o/g3G6kc
	JdtdKQ3hG1OF1CkvrtoeJWlOxXGxuM5SyJZFo05zIhFjthl3aOVF+jqY0dbvXxtgHC3wRVCZ0JHSY
	+46lc8JdTCG9DEnnwdVTMJEt8BrTnDTkifo86Dqh6AoeonR/lS4IVvY701VlZsCAiTSs=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24574.63138.454907.906182@mariner.uk.xensource.com>
Date: Wed, 13 Jan 2021 13:33:22 +0000
To: Andrew Cooper <amc96@cam.ac.uk>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
    Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 3/3] tools: Move memshrtool from tests/ to misc/
In-Reply-To: <a8d6da68-f977-a742-dbf3-a0a51c9f469b@cam.ac.uk>
References: <20210113123455.23209-1-andrew.cooper3@citrix.com>
	<20210113123455.23209-4-andrew.cooper3@citrix.com>
	<24574.61222.420015.914048@mariner.uk.xensource.com>
	<a8d6da68-f977-a742-dbf3-a0a51c9f469b@cam.ac.uk>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("Re: [PATCH 3/3] tools: Move memshrtool from tests/ to misc/"):
> On 13/01/2021 13:01, Ian Jackson wrote:
> > Andrew Cooper writes ("[PATCH 3/3] tools: Move memshrtool from tests/ to misc/"):
> >> memshrtool is a tool for a human to use, rather than a test.  Move it into
> >> misc/ as a more appropriate location to live.  Also rename it to
> >> xen-memshare-tool
> > Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
> 
> Thanks, but I expect that Gitlab will tell me that I broke the ARM
> build, by losing a "only build this for x86"-ism.
> 
> I've folded this delta in to resolve:

Ooops.  Thanks.

Ian.

