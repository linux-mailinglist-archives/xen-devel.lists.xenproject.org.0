Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C06483F9CB1
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 18:43:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173790.317082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJevN-0004SH-AK; Fri, 27 Aug 2021 16:41:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173790.317082; Fri, 27 Aug 2021 16:41:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJevN-0004PW-6l; Fri, 27 Aug 2021 16:41:49 +0000
Received: by outflank-mailman (input) for mailman id 173790;
 Fri, 27 Aug 2021 16:41:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mJevL-0004PQ-OF
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 16:41:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mJevL-0001c4-MO
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 16:41:47 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mJevL-0007vi-Kr
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 16:41:47 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mJevI-00034J-AH; Fri, 27 Aug 2021 17:41:44 +0100
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
	d=xenproject.org; s=20200302mail; h=Subject:CC:To:Date:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=HolTDPaE2qS+ObH60KgaiHUAH+tZ0/vP5+AlAQzjJH4=; b=1SmiV0M30V6DGMqvRc9u8/ysd3
	UVeUDfkuwL2V5oj/T+kZJCEFXi9pHZTJLZANw24YcFAOATTWSYcoeC1BmNh1/F10yd5VLF7ek1TMI
	v6wrPfa/jd+X6BTWQCr9MhpHZD+vX9VVSW5PzUUK7wiRXRRLLQ1VlAR4xFNH6QyEsX6Y=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24873.5576.45086.392600@mariner.uk.xensource.com>
Date: Fri, 27 Aug 2021 17:41:44 +0100
To: committers@xenproject.org
CC: xen-devel@lists.xenproject.org,
    George Dunlap <George.Dunlap@citrix.com>
Subject: Xen 4.16 release schedule
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Thanks everyone for your input and your support.  The consensus
seems to be that, despite this release being a little thin, we should
keep to the usual cadence.  There were multiple requests to slip by
about a week, which for this release seems a reasonable risk to take.
I'm hoping that we can achieve this by compressing the freeze.

So, here is the release schedule for Xen 4.16.

  Friday 24th September                 Last posting date

    Patches adding new features should be posted to the mailing list
    by this cate, although perhaps not in their final version.
    (3 weeks)

  Friday 15th October                   Feature freeze
 
    Patches adding new features should be committed by this date.
    Straightforward bugfixes may continue to be accepted by
    maintainers.
    (3 weeks)

  Friday 5th November **tentatve**      Code freeze

    Bugfixes only, all changes to be approved by the Release Manager,
    on the basis of a (progressively stricter[*]) risk assessment.
    (2 weeks)

  Friday 19th November **tentative**    Hard code freeze [*]

    Bugfixes for serious bugs (including regressions), and low-risk
    fixes only.
    (0.5 weeks)

  Tuesday 23rd November **tentative**   Branch off staging-4.16
                                        
    xen-unstable open again - with caveats to avoid release disruption.
    (1.5 weeks)

  Friday 3rd December **tentative**     Final commits (docs/prep only)
  Week of 6th December **tentative**    Release
    (probably Tuesday or Wednesday)

Any patches containing substantial refactoring are to treated as
new features, even if they intent is to fix bugs.

Freeze exceptions will not be routine, but may be granted in
exceptional cases for small changes (on the basis of risk assessment,
like any release-ack).  Large series will not get exceptions.
Contributors *must not* rely on, or expect, a freeze exception, or
release schedule slip.

If as a feature proponent you feel your feature is at risk and there
is something the Xen Project could do to help, please consult me or
ask here on xen-devel.  In such situations please reach out earlier
rather than later.  I will try to put you in touch with people who may
be able to help.

[*] The distinction between Code Freeze and Hard Code Freeze is a
matter of degree, not kind; the Hard Code Freeze data and associated
tighter policy text is indicative rather than normative.

Thanks,
Ian.

PS Sorry for not posting this on Wednesday.  I suffered a series of
hardware failures in my home network.  It was all rather
https://xkcd.com/349/ for a while but I have made it back to land now.

