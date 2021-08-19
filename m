Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4B13F1D84
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 18:12:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168927.308500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGkeD-0002qi-Az; Thu, 19 Aug 2021 16:12:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168927.308500; Thu, 19 Aug 2021 16:12:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGkeD-0002nk-70; Thu, 19 Aug 2021 16:12:05 +0000
Received: by outflank-mailman (input) for mailman id 168927;
 Thu, 19 Aug 2021 16:12:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGkeB-0002ne-A8
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 16:12:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGkeB-0003qJ-4l
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 16:12:03 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGkeB-0001mz-3V
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 16:12:03 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mGke7-0002EC-Se; Thu, 19 Aug 2021 17:11:59 +0100
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
	bh=++BrMWpwmpBg1rI+sKrak4d6F8xYIOwIc1JiUfTIfIY=; b=NcHq1QJOkCS2CwQnA22fj6xThL
	OeV4CrqaGhVmrjXsq27WTtjy432u1KVgrgpXraPDLTbhppDujYP1s5nN9CK3Q2pRdjlNmA79gbi9T
	uwttgDYv6ZG01FWpp5F9kOzqabVba+atImtQeFbpwPUYcG3QKAQNmKx1695lddNfjL9M=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24862.33487.603952.992529@mariner.uk.xensource.com>
Date: Thu, 19 Aug 2021 17:11:59 +0100
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
    Ian Jackson <iwj@xenproject.org>,
    Wei Liu <wl@xen.org>,
    Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH-4.15] tools/libs/ctrl: fix xc_core_arch_map_p2m() to
 support linear p2m table
In-Reply-To: <e7b0a267-6b9d-7bde-1d8b-75c602d5d74d@suse.com>
References: <20210702142944.1698-1-jgross@suse.com>
	<b871c368-0e9b-20d4-ad18-55c5d8be881e@suse.com>
	<e7b0a267-6b9d-7bde-1d8b-75c602d5d74d@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Juergen Gross writes ("Re: [PATCH-4.15] tools/libs/ctrl: fix xc_core_arch_map_p2m() to support linear p2m table"):
> PING!!!

Sorry.

I have reviewed this and I think it is good to backport, so

Reviewed-by: Ian Jackson <iwj@xenproject.org>

and queued.  I'll push it to staging-4.15 later today.

Ian.

