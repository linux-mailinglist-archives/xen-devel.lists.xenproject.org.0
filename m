Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB04358952
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 18:11:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107470.205438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUXFN-0004Lg-TK; Thu, 08 Apr 2021 16:11:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107470.205438; Thu, 08 Apr 2021 16:11:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUXFN-0004LH-Ps; Thu, 08 Apr 2021 16:11:09 +0000
Received: by outflank-mailman (input) for mailman id 107470;
 Thu, 08 Apr 2021 16:11:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lUXFM-0004LB-Fp
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 16:11:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lUXFM-0007Rm-6M
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 16:11:08 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lUXFM-0006Zq-51
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 16:11:08 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lUXFJ-0008DF-1U; Thu, 08 Apr 2021 17:11:05 +0100
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:To:From:
	Date:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version;
	bh=p8hvqvfT0CllenG6VvoUXfHUObaVmy00s0xutxtDa+s=; b=3gF/2wwnvxZEEUlqlX8GVIxsbg
	mRevahZrTjs9qv2m9TQEu3m8SQiJHYOKtz0kuJiYPFbW+RglV/dd1+xOr6voBGvKYHgDtRmJyL7vi
	1KA7XXAjGMrTQ3FMiQQp4MxeU6n5CCXt6XPCFIcqv5iVYlp0YpuqOYr5AUqX4lqV+fdM=;
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24687.11032.872713.894725@mariner.uk.xensource.com>
Date: Thu, 8 Apr 2021 17:11:04 +0100
From: Ian Jackson <iwj@xenproject.org>
To: committers@xenproject.org,
    xen-devel@lists.xenproject.org
Subject: Re: Commit moratorium on staging-4.15
In-Reply-To: <24684.14467.302145.214064@mariner.uk.xensource.com>
References: <24684.14467.302145.214064@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Ian Jackson writes ("Commit moratorium on staging-4.15"):
> The Xen 4.15 branch is now closed for release preparation work.
> Nothing more should be pushed without my specific permission.

Hi.  Xen 4.15 is now officially released.

The Xen-next (staging) branch is now completely open for every kind of
change, subject to the usual development rules.

Please hold off pushing to staging-4.15 until advised.  I need to
do post-release updates do the version number and README and so on.  I
plan to do that on Monday.

Ian.

