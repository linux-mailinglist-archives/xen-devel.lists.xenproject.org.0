Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD05C6E8907
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 06:15:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523888.814279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppLgu-0007Vb-0H; Thu, 20 Apr 2023 04:14:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523888.814279; Thu, 20 Apr 2023 04:14:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppLgt-0007Tu-Tj; Thu, 20 Apr 2023 04:14:39 +0000
Received: by outflank-mailman (input) for mailman id 523888;
 Thu, 20 Apr 2023 04:14:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ppLgs-0007Tk-I4; Thu, 20 Apr 2023 04:14:38 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ppLgs-0000vq-8R; Thu, 20 Apr 2023 04:14:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ppLgr-0006UA-Q5; Thu, 20 Apr 2023 04:14:37 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ppLgr-00088H-PN; Thu, 20 Apr 2023 04:14:37 +0000
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
	bh=2DwXf8YxTZskjySyu69zK3cES/cgU9yoWi9oryZjCAo=; b=pcuSltsyhwXgQjs5acsYnqPCjo
	gnfWSvlBASXutK2ZAU0u5fhobUZSyKEYr4KkrAyQSuzPR26Y/SdsCdY7KBWrIlsfZXrPwW+rKGSS8
	TGuG+0UBHOhFGzEQf4ptGs6CpYlQL4+ywB1rvd/SP8iwClQzX/oISRZNx/ved8rufvlI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180326-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 180326: trouble: blocked/broken/pass
X-Osstest-Failures:
    xen-unstable-smoke:build-armhf:<job status>:broken:regression
    xen-unstable-smoke:build-armhf:hosts-allocate:broken:regression
    xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=dff17457c482dcb38b7caafd095334f461ef6d35
X-Osstest-Versions-That:
    xen=8676092a0f16ca6ad188d3fb270784a2caecf542
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 20 Apr 2023 04:14:37 +0000

flight 180326 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180326/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-armhf                     <job status>                 broken
 build-armhf                   2 hosts-allocate         broken REGR. vs. 180302

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  dff17457c482dcb38b7caafd095334f461ef6d35
baseline version:
 xen                  8676092a0f16ca6ad188d3fb270784a2caecf542

Last test of basis   180302  2023-04-18 20:01:55 Z    1 days
Failing since        180314  2023-04-19 10:00:24 Z    0 days    7 attempts
Testing same since   180323  2023-04-19 21:01:54 Z    0 days    3 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alexander Kanavin <alex@linutronix.de>
  Andrew Cooper <andrew.cooper3@citrix.com>
  Henry Wang <Henry.Wang@arm.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stewart Hildebrand <stewart.hildebrand@amd.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  broken  
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          blocked 
 test-arm64-arm64-xl-xsm                                      pass    
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

broken-job build-armhf broken
broken-step build-armhf hosts-allocate

Not pushing.

(No revision log; it would be 317 lines long.)

