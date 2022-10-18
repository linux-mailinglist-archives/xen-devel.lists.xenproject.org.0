Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C22060225D
	for <lists+xen-devel@lfdr.de>; Tue, 18 Oct 2022 05:17:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424707.672334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okd5P-0001Sb-1J; Tue, 18 Oct 2022 03:16:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424707.672334; Tue, 18 Oct 2022 03:16:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okd5O-0001P8-Uw; Tue, 18 Oct 2022 03:16:10 +0000
Received: by outflank-mailman (input) for mailman id 424707;
 Tue, 18 Oct 2022 03:16:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1okd5O-0001Oy-7p; Tue, 18 Oct 2022 03:16:10 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1okd5O-00061n-5X; Tue, 18 Oct 2022 03:16:10 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1okd5N-0003FY-SY; Tue, 18 Oct 2022 03:16:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1okd5N-0005fA-S6; Tue, 18 Oct 2022 03:16:09 +0000
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
	bh=UHkxreUhdpqhpD+OIyPe0HtdgUZqsAkelMHxJGfpNm0=; b=z6uFz3eJs9mQFh+nI42QuSxlH/
	jWl+dsGJHqdf0vWW5H18WN0PiAwd81tilH2f16ybDz6YY5wpY/+KHZFRk58VhkQQwVs+WGRh8J/IZ
	LMzCK5IBWbil7vi0iIH0aD7VW6OPDQJ6+wGv/JSmbF2LCAhZXIDlSYK9Y5HfMznLHc78=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-174028-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 174028: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-armhf-armhf-xl:guest-start:fail:regression
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:guest-start:fail:heisenbug
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=cc4747be8ba157a3b310921e9ee07fb8545aa206
X-Osstest-Versions-That:
    xen=9029bc265cdf2bd63376dde9fdd91db4ce9c0586
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 18 Oct 2022 03:16:09 +0000

flight 174028 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/174028/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl          14 guest-start              fail REGR. vs. 173457

Tests which are failing intermittently (not blocking):
 test-arm64-arm64-xl-xsm      14 guest-start                fail pass in 174001

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-xsm     15 migrate-support-check fail in 174001 never pass
 test-arm64-arm64-xl-xsm 16 saverestore-support-check fail in 174001 never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass

version targeted for testing:
 xen                  cc4747be8ba157a3b310921e9ee07fb8545aa206
baseline version:
 xen                  9029bc265cdf2bd63376dde9fdd91db4ce9c0586

Last test of basis   173457  2022-10-07 14:03:14 Z   10 days
Failing since        173492  2022-10-11 13:01:50 Z    6 days   42 attempts
Testing same since   174001  2022-10-17 15:00:30 Z    0 days    4 attempts

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
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          fail    
 test-arm64-arm64-xl-xsm                                      fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-libvirt                                     pass    


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

(No revision log; it would be 961 lines long.)

