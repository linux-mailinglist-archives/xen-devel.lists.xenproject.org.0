Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3B45FE13B
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 20:30:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422365.668335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oj2xE-00011l-6D; Thu, 13 Oct 2022 18:29:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422365.668335; Thu, 13 Oct 2022 18:29:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oj2xE-0000zI-2z; Thu, 13 Oct 2022 18:29:12 +0000
Received: by outflank-mailman (input) for mailman id 422365;
 Thu, 13 Oct 2022 18:29:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oj2xC-0000z8-T5; Thu, 13 Oct 2022 18:29:10 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oj2xC-0005s9-RI; Thu, 13 Oct 2022 18:29:10 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oj2xC-0004iK-K9; Thu, 13 Oct 2022 18:29:10 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oj2xC-0005cI-Jf; Thu, 13 Oct 2022 18:29:10 +0000
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
	bh=bsUapyTScCai0hFSzYMdnYRNG7gbYCF3DggTAjoDqoQ=; b=cn7Wic2a7O7sZ14gsJUKi9C2Xw
	h8VzC8N5lV2yew9H6ygAWW7wmTl59QTFPGxZMn3DKIuMAG0WyVyYCOX4OJGl3tzwHNZEpEkG1zlDh
	t5sXld5H8hjO44bKKp0buWHY3UxrCxBhY3x+dLZt8r97hdloLwAQvixry6zhkyK/cPqs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173721-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 173721: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:guest-start:fail:regression
    xen-unstable-smoke:test-armhf-armhf-xl:guest-start:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=171d4d24f829075cac83b6fafe7a4ed7c93935a6
X-Osstest-Versions-That:
    xen=9029bc265cdf2bd63376dde9fdd91db4ce9c0586
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 13 Oct 2022 18:29:10 +0000

flight 173721 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/173721/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-arm64-arm64-xl-xsm      14 guest-start              fail REGR. vs. 173457
 test-armhf-armhf-xl          14 guest-start              fail REGR. vs. 173457

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass

version targeted for testing:
 xen                  171d4d24f829075cac83b6fafe7a4ed7c93935a6
baseline version:
 xen                  9029bc265cdf2bd63376dde9fdd91db4ce9c0586

Last test of basis   173457  2022-10-07 14:03:14 Z    6 days
Failing since        173492  2022-10-11 13:01:50 Z    2 days   13 attempts
Testing same since   173721  2022-10-13 16:00:32 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
  Borislav Petkov <bp@suse.de>
  Christian Lindig <christian.lindig@citrix.com>
  Henry Wang <Henry.Wang@arm.com>
  Jan Beulich <jbeulich@suse.com>
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

(No revision log; it would be 654 lines long.)

