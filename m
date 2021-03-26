Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EBC34A6D1
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 13:05:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101752.194780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPlDY-0003qG-2o; Fri, 26 Mar 2021 12:05:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101752.194780; Fri, 26 Mar 2021 12:05:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPlDX-0003pi-VS; Fri, 26 Mar 2021 12:05:31 +0000
Received: by outflank-mailman (input) for mailman id 101752;
 Fri, 26 Mar 2021 12:05:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPlDX-0003pb-5b
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 12:05:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPlDX-00068w-4p
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 12:05:31 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPlDX-0000lo-47
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 12:05:31 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lPlDT-0002Px-Qs; Fri, 26 Mar 2021 12:05:27 +0000
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
	bh=sxMftzVO4rhCfs0sMFoUzHUCONowjcnv5n2bpgJrDxw=; b=4KJUIuLk7lrRdRISoEfeMaaqkd
	AyE6c7yTjUN/rA+etdBsNTtmYGOSTCUYBJyshJJRmaf00iwSweYaFaVFZNAbUqwIVqjXGPCx2rX2J
	b3tkkZxJAi653LE2sUlCs8qHxSYarxrftJ1LssPbOZJA2WPnbnuLirfrW+q/EtvH2x5Q=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24669.52743.650789.478215@mariner.uk.xensource.com>
Date: Fri, 26 Mar 2021 12:05:27 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH] tools/libfsimage: Bump SONAME to 4.16
In-Reply-To: <20210325194201.10998-1-andrew.cooper3@citrix.com>
References: <20210325194201.10998-1-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH] tools/libfsimage: Bump SONAME to 4.16"):
> Fixes: a04509d34d ("Branching: Update version files etc. for newly unstable")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Release-Acked-by: Ian Jackson <iwj@xenproject.org>
Acked-by: Ian Jackson <iwj@xenproject.org>

