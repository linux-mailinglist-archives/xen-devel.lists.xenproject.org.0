Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC47B30B05A
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 20:28:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80103.146257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6esF-0008CW-TC; Mon, 01 Feb 2021 19:28:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80103.146257; Mon, 01 Feb 2021 19:28:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6esF-0008C7-PC; Mon, 01 Feb 2021 19:28:35 +0000
Received: by outflank-mailman (input) for mailman id 80103;
 Mon, 01 Feb 2021 19:28:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l6esE-0008Bz-1O; Mon, 01 Feb 2021 19:28:34 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l6esD-0001DA-Pt; Mon, 01 Feb 2021 19:28:33 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l6esD-0004VR-GK; Mon, 01 Feb 2021 19:28:33 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l6esD-0008TA-Fr; Mon, 01 Feb 2021 19:28:33 +0000
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
	bh=KohISRuccSuwVcXh8mccbxy+nl+FowFVxzFb0rVsIwY=; b=KOuteP/5DtwlXA56JGB3ER+RE/
	w9Jb8sase2g3tU64wNNO5X7DC6qVsYWyvz/8rhGhH7PmaZ+9kPY0qaUUhEM1XXa7lde6gSNgpUg4U
	69GWMLPBD+oHlnP7dTPR+26MULoyvO6Z9Uj//p8Asde0e3kTWjhDXv+theEs6e++0NUA=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158897-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 158897: regressions - trouble: blocked/fail
X-Osstest-Failures:
    xen-unstable-smoke:build-amd64:xen-build:fail:regression
    xen-unstable-smoke:build-arm64-xsm:xen-build:fail:regression
    xen-unstable-smoke:build-armhf:xen-build:fail:regression
    xen-unstable-smoke:build-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    xen=ffbb8aa282de262403275f2395d8540818cf576e
X-Osstest-Versions-That:
    xen=9dc687f155a57216b83b17f9cde55dd43e06b0cd
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 01 Feb 2021 19:28:33 +0000

flight 158897 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158897/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                   6 xen-build                fail REGR. vs. 158804
 build-arm64-xsm               6 xen-build                fail REGR. vs. 158804
 build-armhf                   6 xen-build                fail REGR. vs. 158804

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a

version targeted for testing:
 xen                  ffbb8aa282de262403275f2395d8540818cf576e
baseline version:
 xen                  9dc687f155a57216b83b17f9cde55dd43e06b0cd

Last test of basis   158804  2021-01-30 04:00:24 Z    2 days
Failing since        158892  2021-02-01 16:00:25 Z    0 days    2 attempts
Testing same since   158897  2021-02-01 19:02:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ian Jackson <iwj@xenproject.org>
  Manuel Bouyer <bouyer@netbsd.org>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>

jobs:
 build-arm64-xsm                                              fail    
 build-amd64                                                  fail    
 build-armhf                                                  fail    
 build-amd64-libvirt                                          blocked 
 test-armhf-armhf-xl                                          blocked 
 test-arm64-arm64-xl-xsm                                      blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    blocked 
 test-amd64-amd64-libvirt                                     blocked 


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


Not pushing.

------------------------------------------------------------
commit ffbb8aa282de262403275f2395d8540818cf576e
Author: Roger Pau Monne <roger.pau@citrix.com>
Date:   Mon Feb 1 16:53:17 2021 +0100

    xenstore: fix build on {Net/Free}BSD
    
    The endian.h header is in sys/ on NetBSD and FreeBSD.
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Acked-by: Ian Jackson <iwj@xenproject.org>
    Release-Acked-by: Ian Jackson <iwj@xenproject.org>

commit 419cd07895891c6642f29085aee07be72413f08c
Author: Ian Jackson <iwj@xenproject.org>
Date:   Mon Feb 1 15:18:36 2021 +0000

    xenpmd.c: Remove hard tab
    
    bbed98e7cedc "xenpmd.c: use dynamic allocation" had a hard tab.
    I thought we had fixed that and I thought I had checked.
    Remove it now.
    
    Signed-off-by: Ian Jackson <iwj@xenproject.org>

commit bbed98e7cedcd5072671c21605330075740382d3
Author: Manuel Bouyer <bouyer@netbsd.org>
Date:   Sat Jan 30 19:27:10 2021 +0100

    xenpmd.c: use dynamic allocation
    
    On NetBSD, d_name is larger than 256, so file_name[284] may not be large
    enough (and gcc emits a format-truncation error).
    Use asprintf() instead of snprintf() on a static on-stack buffer.
    
    Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
    Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    Release-Acked-by: Ian Jackson <iwj@xenproject.org>
    
    Plus
    
    define GNU_SOURCE for asprintf()
    
    Harmless on NetBSD.
    
    Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
    Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>
    Release-Acked-by: Ian Jackson <iwj@xenproject.org>
(qemu changes not included)

