Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC75A45DDE0
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 16:47:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231610.400884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqGxl-00043D-KE; Thu, 25 Nov 2021 15:47:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231610.400884; Thu, 25 Nov 2021 15:47:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqGxl-0003zv-GY; Thu, 25 Nov 2021 15:47:05 +0000
Received: by outflank-mailman (input) for mailman id 231610;
 Thu, 25 Nov 2021 15:47:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mqGxj-0003zp-Qv
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 15:47:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mqGxj-0005y1-Q6
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 15:47:03 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mqGxj-0007sN-PG
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 15:47:03 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mqGxg-0007b8-HH; Thu, 25 Nov 2021 15:47:00 +0000
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
	bh=36z7osfXGf8p7AkC7R4kIegyxV4DBECbS6YQeX2cVjo=; b=Vunqfd346v58KiKC/NDgymXojb
	aXUdVaDHkcucX/wx/IN7mZvmt9Ht+ZFEhKV8vj9bzAVyulXvXceXgfubXYUqo48m6u7A9HW7D00PG
	vLPJOUpMKfPtlNLR1RBcO14XGB3JiTmKQlqjprUBo22WKOWNYFPgxY8yy4i6ShItzmJE=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24991.45043.677553.434670@mariner.uk.xensource.com>
Date: Thu, 25 Nov 2021 15:46:59 +0000
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] osstest: enable timestamp on guests logs
In-Reply-To: <20211125150646.10414-1-roger.pau@citrix.com>
References: <20211125150646.10414-1-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monne writes ("[PATCH] osstest: enable timestamp on guests logs"):
> Enable the timestamp feature of xenconsoled so guests logs have a time
> reference. Can be helpful when debugging boot related slowness.
> 
> This requires using the XENCONSOLED_ARGS option and setting both the
> log and the timestamp options. Note that setting XENCONSOLED_TRACE
> will override any options in XENCONSOLED_ARGS, so they can not be used
> in conjunction.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Ian Jackson <iwj@xenproject.org>

Thanks!

I have queued this on my "to be pushed after 4.16" branch.

Ian.

