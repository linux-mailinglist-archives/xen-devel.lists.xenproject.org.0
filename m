Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 083DD32EC02
	for <lists+xen-devel@lfdr.de>; Fri,  5 Mar 2021 14:25:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93694.176779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIARs-0006bj-Fi; Fri, 05 Mar 2021 13:24:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93694.176779; Fri, 05 Mar 2021 13:24:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIARs-0006bJ-Ce; Fri, 05 Mar 2021 13:24:56 +0000
Received: by outflank-mailman (input) for mailman id 93694;
 Fri, 05 Mar 2021 13:24:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lIARr-0006bD-8o
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 13:24:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lIARr-0006i3-85
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 13:24:55 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lIARr-0001oa-7E
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 13:24:55 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lIARn-0008OQ-QZ; Fri, 05 Mar 2021 13:24:51 +0000
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
	bh=h3cfrY8MA3VSc5TALv7Rc6fduNBtb3sFNMgBZL07nF0=; b=OXOEO8t0dqwGC4l6IOw4//Z6in
	F9LZSpuc2wqncBSwzWjg8iWtA43BEWmIJ4t2X9ZzH8bDGP6VLxXQxT11SR9FryJoplq2G96WSBeaC
	J+k8vdz0gpzIv2iB2E2N9NvEZCZi8CQnRIaxHw2upnvcPTCKt0kd8bagDt7ckOxS0g+s=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24642.12579.543046.234448@mariner.uk.xensource.com>
Date: Fri, 5 Mar 2021 13:24:51 +0000
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
    raphning@amazon.co.uk,
    Julien Grall <jgrall@amazon.com>,
    Wei Liu <wl@xen.org>,
    Juergen Gross <jgross@suse.com>
Subject: [PATCH for-4.15 2/2] tools/xenstore: Check the format printf for xprintf() and barf{,_perror}()
In-Reply-To: <20210305124003.13582-3-julien@xen.org>
References: <20210305124003.13582-1-julien@xen.org>
	<20210305124003.13582-3-julien@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("[PATCH for-4.15 2/2] tools/xenstore: Check the format printf for xprintf() and barf{,_perror}()"):
> From: Julien Grall <jgrall@amazon.com>
> 
> Allow GCC to analyze the format printf for xprintf() and
> barf{,_perror}().
> 
> Take the opportunity to define __noreturn to make the prototype for
> barf{,_perror})() easier to read.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>


