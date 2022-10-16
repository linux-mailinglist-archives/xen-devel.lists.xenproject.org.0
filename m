Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB51600283
	for <lists+xen-devel@lfdr.de>; Sun, 16 Oct 2022 19:51:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.423892.670969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ok7mv-0001SJ-MT; Sun, 16 Oct 2022 17:51:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 423892.670969; Sun, 16 Oct 2022 17:51:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ok7mv-0001P3-J8; Sun, 16 Oct 2022 17:51:01 +0000
Received: by outflank-mailman (input) for mailman id 423892;
 Sun, 16 Oct 2022 17:51:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ok7mu-0001Or-QP; Sun, 16 Oct 2022 17:51:00 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ok7mu-0003Ma-PY; Sun, 16 Oct 2022 17:51:00 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ok7mu-0005kU-I7; Sun, 16 Oct 2022 17:51:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ok7mu-000864-Hg; Sun, 16 Oct 2022 17:51:00 +0000
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
	bh=3STeXF6aoAQxk/VHcsvOFx/dnGS9UN7tyPDtaTxmbWA=; b=XViy2J4BW8yAIWQV3pzP7tQovQ
	qQclOnhijOmuP3RCW04aPyj0fQVCznJKpnQ62Q4EPxu8/Pf/oPD3uUVDtVjwslv8Gb8f+9Maev0jW
	waZnV8N5FmCkcxxNSmMOjlPdTqcB+2DQHYZeDDPrBmdxdSAtga/VQ847yq+oiQ5+E/x8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173931-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 173931: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:build-amd64:xen-build:fail:regression
    xen-unstable-smoke:test-armhf-armhf-xl:guest-start:fail:regression
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:guest-start:fail:heisenbug
    xen-unstable-smoke:build-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=5310a3aa5026fb27d6834306d920d6207a1e0898
X-Osstest-Versions-That:
    xen=9029bc265cdf2bd63376dde9fdd91db4ce9c0586
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 16 Oct 2022 17:51:00 +0000

flight 173931 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/173931/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                   6 xen-build                fail REGR. vs. 173457
 test-armhf-armhf-xl          14 guest-start              fail REGR. vs. 173457

Tests which are failing intermittently (not blocking):
 test-arm64-arm64-xl-xsm      14 guest-start                fail pass in 173911

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-arm64-arm64-xl-xsm     15 migrate-support-check fail in 173911 never pass
 test-arm64-arm64-xl-xsm 16 saverestore-support-check fail in 173911 never pass

version targeted for testing:
 xen                  5310a3aa5026fb27d6834306d920d6207a1e0898
baseline version:
 xen                  9029bc265cdf2bd63376dde9fdd91db4ce9c0586

Last test of basis   173457  2022-10-07 14:03:14 Z    9 days
Failing since        173492  2022-10-11 13:01:50 Z    5 days   32 attempts
Testing same since   173776  2022-10-14 21:00:25 Z    1 days   13 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
  Borislav Petkov <bp@suse.de>
  Christian Lindig <christian.lindig@citrix.com>
  Daniel P. Smith <dpsmith@apertussolutions.com>
  George Dunlap <george.dunlap@citrix.com>
  Henry Wang <Henry.Wang@arm.com>
  Jan Beulich <jbeulich@suse.com>
  Jason Andryuk <jandryuk@gmail.com>
  Julien Grall <jgrall@amazon.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Peter Zijlstra <peterz@infradead.org>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Tim Deegan <tim@xen.org>
  Zhang Rui <rui.zhang@intel.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  fail    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          blocked 
 test-armhf-armhf-xl                                          fail    
 test-arm64-arm64-xl-xsm                                      fail    
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

(No revision log; it would be 938 lines long.)

