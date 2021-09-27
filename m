Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E54CB419643
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 16:24:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196951.349875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUrYY-0004rR-LT; Mon, 27 Sep 2021 14:24:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196951.349875; Mon, 27 Sep 2021 14:24:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUrYY-0004om-HA; Mon, 27 Sep 2021 14:24:34 +0000
Received: by outflank-mailman (input) for mailman id 196951;
 Mon, 27 Sep 2021 14:24:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mUrYW-0004mJ-Tz
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 14:24:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mUrYW-0001BJ-TG
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 14:24:32 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mUrYW-0003U8-SE
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 14:24:32 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mUrYR-0000f5-Tz; Mon, 27 Sep 2021 15:24:27 +0100
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
	d=xenproject.org; s=20200302mail; h=Reply-to:CC:Subject:To:Date:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=fmHR2HKkcxwSkg8VSxsFQk8VEDEH0dEXe9jHJ5l4uFg=; b=IihPu8hyZe6PRs87MbjTJnsJMX
	qaev38foZPnp4z598Ji3f62G0YPb3Gs/J9/SM/aFmATG25PR/pRr92/nll/01IH96jstXU7lrJq5f
	sVpHRpXNwdQDdglz9gfmMTLliELypgkZA0aItzm3OxyitXYR9b1LWnX2tHzr68OGe558=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24913.54299.590779.955301@mariner.uk.xensource.com>
Date: Mon, 27 Sep 2021 15:24:27 +0100
To: xen-announce@lists.xenproject.org
Subject: Xen 4.16 development update; request for regression bug reports
CC: committers@xenproject.org,
    xen-devel@lists.xenproject.org
Reply-to: xen-devel@lists.xenproject.org,
          iwj@xenproject.org

The mainline development branch of Xen is has taken the first step
towards stabilisation for 4.16: new features not yet submitted, at
least in draft form, will now be deferred to the following release.

We aim to make each Xen release as good as possible, and that includes
high quality and particularly an absence of serious regressions.
To help deliver this as Release Manager for Xen 4.16, I need the help
of the Xen developer and user community

In particular, please would users and developers make sure that I know
about:

 * Regressions in the current development branch (xen-unstable)
   compared to Xen 4.15;

 * Major or important work which is targeted for 4.16, but at risk
   of missing the deadlines.

Please email me, CC xen-devel (as in the Reply-To), and of course
other interested parties. including the maintainer(s) of relevant
subsystems (if you know who that would be).

Thanks for your attention,
Ian.


Planned release schedule for Xen 4.16 (recap):

  Friday 24th September   PASSED        Last posting date

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

