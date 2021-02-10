Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F5D316A94
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 16:58:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83658.156257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9rsw-00049n-D5; Wed, 10 Feb 2021 15:58:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83658.156257; Wed, 10 Feb 2021 15:58:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9rsw-00049O-9i; Wed, 10 Feb 2021 15:58:34 +0000
Received: by outflank-mailman (input) for mailman id 83658;
 Wed, 10 Feb 2021 15:58:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l9rsu-00049H-F6
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 15:58:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l9rsu-0004Gc-C0
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 15:58:32 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l9rsu-0004kR-Av
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 15:58:32 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l9rsr-0000KE-0C; Wed, 10 Feb 2021 15:58:29 +0000
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
	bh=anaMKxXPZNARA9p0XBY0RLmDeOf/tum7GlpdhDHS2tI=; b=UVRyUcfi/CVzv8dehVi7sEsTzv
	J1NuA709OiURIyoTPbFl7WJh1cnv/hdWALXOf8SRgywoifBnJnF6fey/xZLG8OkJ+y/08k2107/jZ
	5KfsJzH7NqEbOGW1IFv0cZwNk4aSInuN8oNxvK6/PoWCp0rAbbpJcLFwpbN+zhYMS+gk=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24612.676.586372.372903@mariner.uk.xensource.com>
Date: Wed, 10 Feb 2021 15:58:28 +0000
To: committers@xenproject.org,
CC: xen-devel@lists.xenproject.org,
    community.manager@xenproject.org
Subject: [ANNOUNCE] Xen 4.15 - hard codefreeze slip by one week
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Hello.  Unfortunately we are having difficulty with osstest due to a
combination of an ill-timed Debian update and Linux kernel regressions
which got into the upstream stable trees and thence into Debian.  I
have been working to try to resolve this situation.  That has taken
time I should have been spending on release management and caused a
delay to pushes.  There have been a few other bugs, some in recently
introduced patches.  And we still have some bugs being investigated.

So I have decided to slip by one week.  Accordingly, here is the new
freeze status and remaining schedule:

  We are in feature freeze.  No new features should be committed to
  xen.git#staging.

  You may continue to commit straightforward bugfixes, docs changes, and
  new tests, without a release-ack.  Anything involving reorganisation
  or refactoring should get a release ack.  If in doubt please ask me
  and I will grant (or withhold) permission.

* Hard codefreeze (after which all patches will need a release manager
* ack) will occur on the 19th of February.
*
* Friday 19th February   Code freeze

       Bugfixes only, all changes to be approved by the Release Manager.

* Week of 19th March **tentative**    Release
       (probably Tuesday or Wednesday)

  Any patches containing substantial refactoring are to treated as
  new features, even if they intent is to fix bugs.

  Freeze exceptions will not be routine, but may be granted in
  exceptional cases for small changes on the basis of risk assessment.
  Large series will not get exceptions.  Contributors *must not* rely on
  getting, or expect, a freeze exception.

  New or improved tests (supposing they do not involve refactoring,
  even build system reorganisation), and documentation improvements,
  will generally be treated as bugfixes.

  The release dates is provisional and will be adjusted in the light
  of apparent code quality etc.

Thanks,
Ian.

