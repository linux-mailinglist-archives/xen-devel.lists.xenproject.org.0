Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BC3728710
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jun 2023 20:18:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545411.851832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7KD6-0002Vw-Im; Thu, 08 Jun 2023 18:18:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545411.851832; Thu, 08 Jun 2023 18:18:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7KD6-0002UG-Fq; Thu, 08 Jun 2023 18:18:12 +0000
Received: by outflank-mailman (input) for mailman id 545411;
 Thu, 08 Jun 2023 18:18:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q7KD5-0002U6-1i; Thu, 08 Jun 2023 18:18:11 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q7KD4-0003Kn-Kt; Thu, 08 Jun 2023 18:18:10 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q7KD4-0003Dx-E4; Thu, 08 Jun 2023 18:18:10 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q7KD4-0005lA-DZ; Thu, 08 Jun 2023 18:18:10 +0000
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
	bh=MFKYvciE+FInKgirZPlzbGqeZhEUQD5UUv5zK3gu2Qo=; b=c6XnFl+IL/GiEBSpntkTu1tagl
	lOGASlaO03WnnIgWkwJmh1pIVxyhfVshQzhe9qAT9RJIXXNlZnGL+cC6IIt+VtUYr6o7Eg/492LRd
	fDTj4Y5q6fMSNMx2pyri0clIZgml3kmdI8lwxKLcCGj1xN8F1zb6T7I5tUOCI0vf762E=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181311-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 181311: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:build-arm64-xsm:xen-build:fail:regression
    xen-unstable-smoke:build-armhf:xen-build:fail:regression
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=6915a120641b5d232762af7882266048cf039ca0
X-Osstest-Versions-That:
    xen=64a647f8d817c6989edc000613b5afae19f03f99
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 08 Jun 2023 18:18:10 +0000

flight 181311 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181311/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64-xsm               6 xen-build                fail REGR. vs. 181233
 build-armhf                   6 xen-build                fail REGR. vs. 181233

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass

version targeted for testing:
 xen                  6915a120641b5d232762af7882266048cf039ca0
baseline version:
 xen                  64a647f8d817c6989edc000613b5afae19f03f99

Last test of basis   181233  2023-06-07 02:04:37 Z    1 days
Failing since        181246  2023-06-07 11:02:03 Z    1 days   15 attempts
Testing same since   181303  2023-06-08 11:00:25 Z    0 days    4 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Christian Lindig <christian.lindig@cloud.com>
  George Dunlap <george.dunlap@citrix.com>
  Henry Wang <Henry.Wang@arm.com> # CHANGELOG
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Luca Fancellu <luca.fancellu@arm.com>
  Michal Orzel <michal.orzel@amd.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>

jobs:
 build-arm64-xsm                                              fail    
 build-amd64                                                  pass    
 build-armhf                                                  fail    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          blocked 
 test-arm64-arm64-xl-xsm                                      blocked 
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

(No revision log; it would be 504 lines long.)

