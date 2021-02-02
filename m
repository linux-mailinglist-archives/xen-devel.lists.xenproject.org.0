Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C045530BCD3
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 12:22:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80495.147269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6tkX-0002La-6J; Tue, 02 Feb 2021 11:21:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80495.147269; Tue, 02 Feb 2021 11:21:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6tkX-0002LB-2k; Tue, 02 Feb 2021 11:21:37 +0000
Received: by outflank-mailman (input) for mailman id 80495;
 Tue, 02 Feb 2021 11:21:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6tkV-0002L6-Hl
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 11:21:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6tkV-0003jP-Ga
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 11:21:35 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6tkV-000125-DG
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 11:21:35 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l6tkS-0001rb-54; Tue, 02 Feb 2021 11:21:32 +0000
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
	bh=a6OB6ReDxGsFWtrMM+RFjzdpQ9rx5NiYkJ75O5McMwU=; b=M5C8ywgg91p0R5jN2v8jalRDK/
	50FN9x0LJmfs/z/CLMnWg4NjrJEFKvYUfXUad/5JRh9/yKdlJyxQcDuP+VZXwr/SXOMSH9SK9hdrR
	f44m+dose21gl6h0lSCFbmmWvGU7XAP6k5Lx6resx5ZNBOvLh7Yc6BBUCLjXmJJerqnc=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24601.13755.876115.891026@mariner.uk.xensource.com>
Date: Tue, 2 Feb 2021 11:21:31 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: [PATCH] xenstore: Fix all builds
In-Reply-To: <20210201233513.30923-1-andrew.cooper3@citrix.com>
References: <20210201233513.30923-1-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH] xenstore: Fix all builds"):
> This diff is easier viewed through `cat -A`
...
> A non-breaking space isn't a valid C preprocessor token.

Yikes.

Thanks!

Ian.

