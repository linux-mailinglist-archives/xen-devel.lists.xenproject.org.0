Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D57930E14A
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 18:42:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81007.148870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7MA1-0001bu-5j; Wed, 03 Feb 2021 17:41:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81007.148870; Wed, 03 Feb 2021 17:41:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7MA1-0001bV-1t; Wed, 03 Feb 2021 17:41:49 +0000
Received: by outflank-mailman (input) for mailman id 81007;
 Wed, 03 Feb 2021 17:41:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7M9z-0001bQ-FX
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 17:41:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7M9z-00055W-Em
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 17:41:47 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7M9z-0001dk-E1
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 17:41:47 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l7M9w-0005dL-99; Wed, 03 Feb 2021 17:41:44 +0000
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
	bh=ayb0T0Fvvd9i7BGUWA3i7gIWyFpIhf+Ysfr4i8JpAKk=; b=QG/9M8uLpyh0sS9llvb90f7hEP
	1h4uDQltGHbhCg6626b70lx0Y+YgXFl5R3iIKKw3YpF+C476st0tUJT3lTwSLrPSWJnJ9Dq4+fZRi
	XVk8+8ZZglUNXwNr38RG21G5hMLlozAfDRh4rNndOdbEIKUnHcEnPuWzGxMAQe9WVTTI=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24602.57432.3548.55315@mariner.uk.xensource.com>
Date: Wed, 3 Feb 2021 17:41:44 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Christian Lindig <christian.lindig@citrix.com>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH for-4.15 0/3] tools/oxenstored bugfixes
In-Reply-To: <20210203173549.21159-1-andrew.cooper3@citrix.com>
References: <20210203173549.21159-1-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH for-4.15 0/3] tools/oxenstored bugfixes"):
> All of these been posted before, but were tangled in other content which is
> not appropriate for 4.15 any more.  As a consequence, I didn't get around to
> committing them before the code freeze.
> 
> They were all found with unit testing, specifically fuzzing the
> serialising/deserialising logic introduced for restartiblity, asserting that
> the tree before and after was identical.
> 
> The unit testing/fuzzing content isn't suitable for 4.15, but these bugfixes
> want backporting to all releases, and should therefore be considered for 4.15
> at this point.

I just gave my

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

in that other mail.  FTAOD that applies to all three.

Christian, would you be able to do a maintainer review ?

Thanks,
Ian.

