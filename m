Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4963F1A52
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 15:25:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168792.308207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGi2Y-0003bP-58; Thu, 19 Aug 2021 13:25:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168792.308207; Thu, 19 Aug 2021 13:25:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGi2Y-0003Yj-1w; Thu, 19 Aug 2021 13:25:02 +0000
Received: by outflank-mailman (input) for mailman id 168792;
 Thu, 19 Aug 2021 13:25:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGi2W-0003Yd-OW
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 13:25:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGi2W-0008OF-ML
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 13:25:00 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGi2W-0000Du-LC
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 13:25:00 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mGi2R-0001mx-RH; Thu, 19 Aug 2021 14:24:55 +0100
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
	bh=7n/PjEn2CCyFoH/uHNcEqmiJ21lrwOFjIufHabUc6Ps=; b=RAqPw0kWpQCVlyg8ioIAymqk9Z
	J5pYldDfOzRlsTFD2dtnZCaBRuVo9ILSS1a6QJrExHeUyPto3ju4OP3Pi63qEupxyvKmE7dfjCavG
	bj2YIQo7QUi3lNRgClWi9IDDis74oNNq3mXwWDWQRWg0Fj4NeTjPiuXkzNJQ/FUtlznw=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24862.23463.360542.801702@mariner.uk.xensource.com>
Date: Thu, 19 Aug 2021 14:24:55 +0100
To: Juergen Gross <jgross@suse.com>
Cc: Jan Beulich <jbeulich@suse.com>,
    xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>
Subject: Re: [xen-unstable test] 164237: regressions - FAIL
In-Reply-To: <771e9b22-222a-6e79-0e70-3e5dec0bddd8@suse.com>
References: <osstest-164237-mainreport@xen.org>
	<63c26289-4797-9ac0-af95-56b6efd64cc3@suse.com>
	<24862.21094.866583.748384@mariner.uk.xensource.com>
	<771e9b22-222a-6e79-0e70-3e5dec0bddd8@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Juergen Gross writes ("Re: [xen-unstable test] 164237: regressions - FAIL"):
> Does this mean we should de-support pvgrub? Or even remove it?
> 
> BTW, I don't see any reason why someone would want to keep using pvgrub
> with grub-pv being available...

I went to change its status in SUPPORT.md and it wasn't in evidence.
I guess you might still want it to boot old guests.
I don't think it has any security implications because it runs in
guest context.

I have prepared a patch to SUPPORT.md which I will send in a moemnt.

Ian.

