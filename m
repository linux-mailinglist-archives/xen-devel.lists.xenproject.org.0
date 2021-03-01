Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 597D9328716
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 18:20:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91827.173295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGmDq-0000CA-5I; Mon, 01 Mar 2021 17:20:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91827.173295; Mon, 01 Mar 2021 17:20:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGmDq-0000Bl-1k; Mon, 01 Mar 2021 17:20:42 +0000
Received: by outflank-mailman (input) for mailman id 91827;
 Mon, 01 Mar 2021 17:20:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGmDo-0000Bg-O6
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:20:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGmDo-0004xE-NQ
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:20:40 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGmDo-0002ri-L3
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:20:40 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lGmDl-0004zl-Ek; Mon, 01 Mar 2021 17:20:37 +0000
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
	bh=BDMyj64U5QPXri/Yn/CnXt6gBLjC8mPDXeq1WEUGsks=; b=mQ2TumlOS7V+x938eoyFdKrji+
	TgcALwgpfR716zUa+DxSq9AK/9v0EEyusePBHUYom5KxklrX6h0tKHeu2ExF58S8DtyKbTal3BuVt
	BTv284ECnerdng7Hvwfi5FTXh3fky4CTBPoLVsOfDa0sPtR5FD0W+6N9dFlAXI2DIp/0=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24637.8805.239765.656484@mariner.uk.xensource.com>
Date: Mon, 1 Mar 2021 17:20:37 +0000
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Doug Goldstein <cardoe@cardoe.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH for-4.15] automation/alpine: add g++ to the list of build depends
In-Reply-To: <20210301095806.68518-1-roger.pau@citrix.com>
References: <20210301095806.68518-1-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monne writes ("[PATCH for-4.15] automation/alpine: add g++ to the list of build depends"):
> clang++ relies on the C++ headers installed by g++, or else a clang
> build will hit the following error:
> 
> <built-in>:3:10: fatal error: 'cstring' file not found
> #include "cstring"
>          ^~~~~~~~~
> 1 error generated.
> make[10]: *** [Makefile:120: headers++.chk] Error 1
> 
> Reported-by: Stefano Stabellini <sstabellini@kernel.org>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Cc: Ian Jackson <iwj@xenproject.org>
> No real risk here from a release PoV, it's just pulling a package
> required for the Alpine clang build. Worse that cold happen is that
> the Alpine clang build broke, but it's already broken.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

