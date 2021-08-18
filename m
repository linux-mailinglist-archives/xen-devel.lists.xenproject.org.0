Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EEE3F0105
	for <lists+xen-devel@lfdr.de>; Wed, 18 Aug 2021 11:54:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168157.306999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGIGO-0008Gq-Ig; Wed, 18 Aug 2021 09:53:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168157.306999; Wed, 18 Aug 2021 09:53:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGIGO-0008DM-Dd; Wed, 18 Aug 2021 09:53:36 +0000
Received: by outflank-mailman (input) for mailman id 168157;
 Wed, 18 Aug 2021 09:53:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mGIGN-0008DC-3L; Wed, 18 Aug 2021 09:53:35 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mGIGM-0002s5-Uj; Wed, 18 Aug 2021 09:53:34 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mGIGM-0002Hl-Ni; Wed, 18 Aug 2021 09:53:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mGIGM-0006yc-N1; Wed, 18 Aug 2021 09:53:34 +0000
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
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=R4nHtISBsFobS7FAvBD+nPph7n+essC09rfzqtcfhZs=; b=OSfsazp9Jm5lnZq1+6hzx6pQ0m
	n7y/KQNmHsVUtQZf2H9E2PNHznCCWBG+yu/Aql5eSEbLqJgn+Tv6U+SSR6p0cQ1prTGOxJbQcsU6/
	BcDwUioCLzY6+WnKgxp/HHnFSbQdCOgQ6AtkbAwpAK1IcAFtijTSpdRhS0Ag1ii7fRlA=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164239-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 164239: all pass - PUSHED
X-Osstest-Versions-This:
    xen=54c9736382e0d558a6acd820e44185e020131c48
X-Osstest-Versions-That:
    xen=5c34b9af05b9e5abd25d88efc4fb783136547810
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 18 Aug 2021 09:53:34 +0000

flight 164239 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164239/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  54c9736382e0d558a6acd820e44185e020131c48
baseline version:
 xen                  5c34b9af05b9e5abd25d88efc4fb783136547810

Last test of basis   164193  2021-08-15 09:18:30 Z    3 days
Testing same since   164239  2021-08-18 09:19:40 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Jane Malalane <jane.malalane@citrix.com>
  Kevin Stefanov <kevin.stefanov@citrix.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

jobs:
 coverity-amd64                                               pass    


------------------------------------------------------------
sg-report-flight on osstest.test-lab.xenproject.org
logs: /home/logs/logs
images: /home/logs/images

Logs, config files, etc. are available at
    http://logs.test-lab.xenproject.org/osstest/logs

Explanation of these reports, and of osstest in general, is at
    http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README.email;hb=master
    http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README;hb=master

Test harness code can be found at
    http://xenbits.xen.org/gitweb?p=osstest.git;a=summary


Pushing revision :

To xenbits.xen.org:/home/xen/git/xen.git
   5c34b9af05..54c9736382  54c9736382e0d558a6acd820e44185e020131c48 -> coverity-tested/smoke

