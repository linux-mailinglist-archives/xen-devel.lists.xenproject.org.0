Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6130331FD5E
	for <lists+xen-devel@lfdr.de>; Fri, 19 Feb 2021 17:47:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86993.163824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD8wG-0002vU-1Y; Fri, 19 Feb 2021 16:47:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86993.163824; Fri, 19 Feb 2021 16:47:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD8wF-0002v3-UO; Fri, 19 Feb 2021 16:47:31 +0000
Received: by outflank-mailman (input) for mailman id 86993;
 Fri, 19 Feb 2021 16:47:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lD8wE-0002uw-A6
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 16:47:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lD8wE-0004sa-5O
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 16:47:30 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lD8wE-0002yV-3m
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 16:47:30 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lD8wA-0001QN-Ur; Fri, 19 Feb 2021 16:47:26 +0000
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:CC:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=1MkExnMamECWYQx76dG5d7NGinCeUMdPZgwxTkBhnYI=; b=3QEKuczr8RsRvHYQmhBcF37bpZ
	UGxe9ZYkEfUBnKOH7dgEtuC2u70HXRr/0u+RAakLhbxBgEyd8JkKBU+bHUyB0xDaUUSvZz5738DrZ
	de5cvRnAF8YLueib2RgA+ftYsnWswU10bmeSFardA6q8w9EM85cpcoSz4uxe6plHIM04=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24623.60318.719046.601197@mariner.uk.xensource.com>
Date: Fri, 19 Feb 2021 16:47:26 +0000
To: committers@xenproject.org,
CC: xen-devel@lists.xenproject.org,
    community.manager@xenproject.org
Subject: [ANNOUNCE] Xen 4.15 - hard codefreeze today
In-Reply-To: <24612.676.586372.372903@mariner.uk.xensource.com>
References: <24612.676.586372.372903@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Today is the last day for committing anything to 4.15 without an
explicit release-ack.

Today, still:

    You may continue to commit straightforward bugfixes, docs changes, and
    new tests, without a release-ack.  Anything involving reorganisation
    or refactoring should get a release ack.

From the end of today, *all* changes must have a Release-Ack.

I intend to grant release-acks for bugfixes.  By and large I will try
to adopt a risk/benefit analysis.  As the freeze goes on I will grow
stricter.  I will be much more liberal with docs and tests.

So we are now here in the release schedule:

> * Friday 19th February   Code freeze
> 
>        Bugfixes only, all changes to be approved by the Release Manager.
> 
> * Week of 19th March **tentative**    Release
>        (probably Tuesday or Wednesday)
...
>   The releas dates is provisional and will be adjusted in the light
>   of apparent code quality etc.

My current list of issues I am tracking for the release is below.  If
you know about any of these issues please do let me know.

I'm slightly concerned that there are some issues on that list that
I'm not aware of any progress occurring on.  But maybe I haven't been
CC'd on all the mails, in which case I'd appreciate a summary update.

Also, please try to make sure that any patches targeted for 4.15
contain `4.15` in the Subject line.  Typically, something like this:
   [PATCH for-4.15 v2] re-invert the neutron polarisation

Thanks,
Ian.


OPEN ISSUES AND BLOCKERS
------------------------

C. Fallout from MSR handling behavioral change.

Information from
  Jan Beulich <jbeulich@suse.com>
  Andrew Cooper <andrew.cooper3@citrix.com>

Andrew writes:
| Bugs are "VMs which boot on earlier releases don't boot on
| 4.15 at the moment".
| 
| Still WIP and on my TODO list.

I think this
  [PATCH v2 4/4] tools/libs: Apply MSR policy to a guest
is probably part of the answer but it hasn't been committed yet.


D. Use-after-free in the IOMMU code

Information from
  Julien Grall <julien@xen.org>
References
 [PATCH for-4.15 0/4] xen/iommu: Collection of bug fixes for IOMMU teadorwn
 <20201222154338.9459-1-julien@xen.org>

Quoting the 0/:
| This series is a collection of bug fixes for the IOMMU teardown code.
| All of them are candidate for 4.15 as they can either leak memory or
| lead to host crash/host corruption.

These patches are still being discussed.  One went in, so now we are
talking about
  [PATCH v3 0/3] xen/iommu: Collection of bug fixes for IOMMU teadorwn


F. BUG: credit=sched2 machine hang when using DRAKVUF

Information from
  Dario Faggioli <dfaggioli@suse.com>
References
  https://lists.xen.org/archives/html/xen-devel/2020-05/msg01985.html
  https://lists.xenproject.org/archives/html/xen-devel/2020-10/msg01561.html
  https://bugzilla.opensuse.org/show_bug.cgi?id=1179246

Quoting Dario:
| Manifests only with certain combination of hardware and workload. 
| I'm not reproducing, but there are multiple reports of it (see 
| above). I'm investigating and trying to come up at least with 
| debug patches that one of the reporter should be able and willing to 
| test.

Dario is working on this.  Last update 29.1.21 ?


G. Null scheduler and vwfi native problem

Information from
  Dario Faggioli <dfaggioli@suse.com>

References
  https://lists.xenproject.org/archives/html/xen-devel/2021-01/msg01634.html

Quoting Dario:
| RCU issues, but manifests due to scheduler behavior (especially   
| NULL scheduler, especially on ARM).
|
| Patches that should solve the issue for ARM posted already. They
| will need to be slightly adjusted to cover x86 as well.

As of last update from Dario 29.1.21:
waiting for test report from submitter.


H. Ryzen 4000 (Mobile) Softlocks/Micro-stutters

Information from
  Dario Faggioli <dfaggioli@suse.com>

As of last update from Dario 29.1.21:
Discussions currently ongoing about the severity of this issue.


I. "x86/PV: avoid speculation abuse through guest accessors"

Information from
  Jan Beulich <jbeulich@suse.com>

| F. The almost-XSA "x86/PV: avoid speculation abuse through guest
| accessors" - the first 4 patches are needed to address the actual
| issue. The next 3 patches are needed to get the tree into
| consistent state again, identifier-wise. The remaining patches
| can probably wait.

The primary fixes for this have reviews and R-A and will be going in
shortly.  There is some followup work which needs to be reviewed and
acked.


J. x86/time: calibration rendezvous adjustments

Information from
  Jan Beulich <jbeulich@suse.com>

Not entirely a regression.  But 3 out of the 4 patches have reviews
and R-A and should be going in shortly.

Patch 4/ is RFC and it's not clear to e whether it's targeted at 4.15.


K. Problems with xl save / cancel

Information from Jürgen Groß:
  xl daemon won't kill the domain after it has gone through a
  suspend-cancel cycle.

Investigation is ongoing.  Not clear at this stage how big a blocker
this is.


L. ABI stability checking

   [PATCH for-4.15 00/10] tools: Support to use abi-dumper on libraries
   [PATCH v2 for-4.15] tools/libxl: Work around unintialised variable libxl__domain_get_device_model_uid()

This is testing/build work and will enable ABI checking of future
changes to 4.15 after its release.  I don't think it's a blocker but
it would be nice to have.  It has R-A and I think most acks now.


NEWLY CLOSED ISSUES
===================


A. HPET/PIT issue on newer Intel systems

Information from
  Andrew Cooper <andrew.cooper3@citrix.com>

| This has had literally tens of reports across the devel and users
| mailing lists, and prevents Xen from booting at all on the past two
| generations of Intel laptop.  I've finally got a repro and posted a
| fix to the list, but still in progress.

Fixed.  c/s e1de4c196a.


B. "scheduler broken" bugs.

Information from
  Andrew Cooper <andrew.cooper3@citrix.com>
  Dario Faggioli <dfaggioli@suse.com>

Quoting Andrew Cooper
| We've had 4 or 5 reports of Xen not working, and very little
| investigation on whats going on.  Suspicion is that there might be
| two bugs, one with smt=0 on recent AMD hardware, and one more
| general "some workloads cause negative credit" and might or might
| not be specific to credit2 (debugging feedback differs - also might
| be 3 underlying issue).

Dario has expaneded on this and I am closing this one out in favour of
F, G, H.


PREVIOUS CLOSED ISSUES
======================

E. zstd support

