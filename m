Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEC9296DEE
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 13:46:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10891.29031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVvWe-0001pA-Bs; Fri, 23 Oct 2020 11:46:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10891.29031; Fri, 23 Oct 2020 11:46:28 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVvWe-0001ol-8f; Fri, 23 Oct 2020 11:46:28 +0000
Received: by outflank-mailman (input) for mailman id 10891;
 Fri, 23 Oct 2020 11:46:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vJnI=D6=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kVvWd-0001og-FG
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 11:46:27 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 067deedc-ae4d-4971-876e-ddd83b8525bd;
 Fri, 23 Oct 2020 11:46:22 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kVvWY-0001rU-H1; Fri, 23 Oct 2020 11:46:22 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kVvWY-0004Do-6E; Fri, 23 Oct 2020 11:46:22 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kVvWY-0006zp-5j; Fri, 23 Oct 2020 11:46:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=vJnI=D6=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kVvWd-0001og-FG
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 11:46:27 +0000
X-Inumbo-ID: 067deedc-ae4d-4971-876e-ddd83b8525bd
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 067deedc-ae4d-4971-876e-ddd83b8525bd;
	Fri, 23 Oct 2020 11:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=Ia4fUy5X8BIstY/W+oUhyCxVZ+V/KEPXLLc8nlAkx0o=; b=QggjBKr1QSG269M4Jfha5Do8et
	v5HOuRO0R+XWN2r7PStY+DjW8NqVLBzBQZmXRJX+tTM7z+fcOzBJMRhzdMyQoK+r/mSR3Xf/BGQV+
	YOt5e2dJY32M5QSMyKRmxB45KzUVz631HvDZJU4NUDUy8vkuCRORd0jC+ljfyJfL0upo=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kVvWY-0001rU-H1; Fri, 23 Oct 2020 11:46:22 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kVvWY-0004Do-6E; Fri, 23 Oct 2020 11:46:22 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kVvWY-0006zp-5j; Fri, 23 Oct 2020 11:46:22 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156117-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 156117: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=6ca70821b59849ad97c3fadc47e63c1a4af1a78c
X-Osstest-Versions-That:
    xen=861f0c110976fa8879b7bf63d9478b6be83d4ab6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 23 Oct 2020 11:46:22 +0000

flight 156117 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156117/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  6ca70821b59849ad97c3fadc47e63c1a4af1a78c
baseline version:
 xen                  861f0c110976fa8879b7bf63d9478b6be83d4ab6

Last test of basis   156108  2020-10-22 19:02:27 Z    0 days
Testing same since   156117  2020-10-23 09:01:23 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Roger Pau Monné <roger.pau@citrix.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
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


Pushing revision :

To xenbits.xen.org:/home/xen/git/xen.git
   861f0c1109..6ca70821b5  6ca70821b59849ad97c3fadc47e63c1a4af1a78c -> smoke

