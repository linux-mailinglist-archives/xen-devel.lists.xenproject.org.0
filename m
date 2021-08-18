Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 471A13F078C
	for <lists+xen-devel@lfdr.de>; Wed, 18 Aug 2021 17:10:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168284.307258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGNCd-0008Fd-L2; Wed, 18 Aug 2021 15:10:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168284.307258; Wed, 18 Aug 2021 15:10:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGNCd-0008Bd-Gy; Wed, 18 Aug 2021 15:10:03 +0000
Received: by outflank-mailman (input) for mailman id 168284;
 Wed, 18 Aug 2021 15:10:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGNCb-0007zy-UX
 for xen-devel@lists.xenproject.org; Wed, 18 Aug 2021 15:10:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGNCb-00006Y-Rw
 for xen-devel@lists.xenproject.org; Wed, 18 Aug 2021 15:10:01 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGNCb-0007X4-Qh
 for xen-devel@lists.xenproject.org; Wed, 18 Aug 2021 15:10:01 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mGNCY-0007M7-ES; Wed, 18 Aug 2021 16:09:58 +0100
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
	bh=BhMobUyDYTMpNJwwe7EXjAx2OP8zxb8aHi5y5VL6IHQ=; b=1L9ymWnsB2uJdhN6UFS+i5DyVy
	31s70CMWpm6FSdJ7ahV4LMehK1kKoMx35z+OSO6IXEDcaXFAfPv42H6eT9/CZ+uF9/XaPskJnVCCH
	+GETFShqSx1fMFFbleex8TPZPm5vtTz/OdfUaz1sYjcxN4DryxN1lwD+NoeFjQpdkbd4=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24861.8902.217023.673705@mariner.uk.xensource.com>
Date: Wed, 18 Aug 2021 16:09:58 +0100
To: committers@xenproject.org
CC: xen-devel@lists.xenproject.org,
    George Dunlap <George.Dunlap@citrix.com>
Subject: Xen 4.16: Proposed release manager and schedule

We haven't formally appointed a release manager for Xen 4.16.
I was approached and asked if I would do the job, and said yes,
but I think things got stuck there.  Taking this as a prima
faciae indication of community confidence, I hereby volunteer to
take on this role.

And, I would like to tentatively propose the following schedule and
policies for Xen 4.16.  This is based on the 4.15 schedule with some
tweaks, and is intended to align the ultimate date roughly with the
4.10 and 4.13 releases, which were also in early/mid December.

I suggest we use the Lazy Consensus procedure to decide on the Release
Manager appointment, starting now (since we're already rather late).
In particular, if you feel someone else would make a better release
manager, please say so right away.

For the release schedule, assuming I'm the RM, please send comments
ASAP and in any case by noon UTC on Wednesday the 25th of August.  I
hope to finalise the schedule then.

** DRAFT **

  Friday 17th September                 Last posting date

    Patches adding new features should be posted to the mailing list
    by this cate, although perhaps not in their final version.
    (3 weeks)

  Friday 8th October                    Feature freeze
 
    Patches adding new features should be committed by this date.
    Straightforward bugfixes may continue to be accepted by
    maintainers.
    (3 weeks)

  Friday 29th October **tentatve**      Code freeze

    Bugfixes only, all changes to be approved by the Release Manager,
    on the basis of a (progressively stricter[*]) risk assessment.
    (2.5 weeks)

  Tuesday 16nd November **tentative**   Branch off staging-4.16
                                        Hard code freeze [*]

    Bugfixes for serious bugs (including regressions), and low-risk
    fixes only.  All changes to be approved by the Release Manager on
    the basis of a (progressively stricter[*]) risk assessment.

    xen-unstable open again - with caveats to avoid release disruption.

    (2.5 weeks)

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

** END OF DRAFT **

Thanks,
Ian.

