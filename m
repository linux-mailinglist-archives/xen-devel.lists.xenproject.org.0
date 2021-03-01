Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED11B3287ED
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 18:35:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91853.173377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGmRe-00022C-2H; Mon, 01 Mar 2021 17:34:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91853.173377; Mon, 01 Mar 2021 17:34:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGmRd-00021p-V2; Mon, 01 Mar 2021 17:34:57 +0000
Received: by outflank-mailman (input) for mailman id 91853;
 Mon, 01 Mar 2021 17:34:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGmRc-00021i-Dm
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:34:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGmRc-0005EY-AK
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:34:56 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGmRc-0004FG-9U
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:34:56 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lGmRZ-000552-0x; Mon, 01 Mar 2021 17:34:53 +0000
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
	bh=Q+8XN0d3qYX7XfRqB5/FPpslPfpdv3ZBVMyg4pSoVJI=; b=QT0NslL7Q87R5lAkkkq39Pf7tS
	FO4IAmCr+f+M0mYIH70V1HrUrk3csaar9FGX9ciiI7+zOHgyVJ4i6WrMflGsbE1V/Wc8vcCxjT2wx
	3ycJXMj3/ei4z6YOUBqHVbgafFGJL0JwFROJdNuO6/gIlILCWb2fT+0IE/O6btj7AQ2c=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24637.9660.724649.505079@mariner.uk.xensource.com>
Date: Mon, 1 Mar 2021 17:34:52 +0000
To: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
Cc: xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>,
    =?iso-8859-2?Q?Micha=B3_Leszczy=F1ski?= <michal.leszczynski@cert.pl>
Subject: Re: [PATCH] tools: Improve signal handling in xen-vmtrace
In-Reply-To: <26720bf5c8258e1b7b4600af3648039b5b9ee18d.1614336820.git.hubert.jasudowicz@cert.pl>
References: <26720bf5c8258e1b7b4600af3648039b5b9ee18d.1614336820.git.hubert.jasudowicz@cert.pl>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Hubert Jasudowicz writes ("[PATCH] tools: Improve signal handling in xen-vmtrace"):
> Make sure xen-vmtrace exits cleanly in case SIGPIPE is sent. This can
> happen when piping the output to some other program.
> 
> Additionaly, add volatile qualifier to interrupted flag to avoid
> it being optimized away by the compiler.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

