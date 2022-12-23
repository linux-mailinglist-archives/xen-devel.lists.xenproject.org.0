Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1EA6554A1
	for <lists+xen-devel@lfdr.de>; Fri, 23 Dec 2022 21:58:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.469018.728263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8p6q-0006ex-3h; Fri, 23 Dec 2022 20:57:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 469018.728263; Fri, 23 Dec 2022 20:57:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8p6q-0006cF-0u; Fri, 23 Dec 2022 20:57:40 +0000
Received: by outflank-mailman (input) for mailman id 469018;
 Fri, 23 Dec 2022 20:57:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p8p6p-0006c5-5h; Fri, 23 Dec 2022 20:57:39 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p8p6o-0008Fo-Qr; Fri, 23 Dec 2022 20:57:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p8p6o-00011a-9v; Fri, 23 Dec 2022 20:57:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p8p6o-0002o8-9R; Fri, 23 Dec 2022 20:57:38 +0000
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
	bh=MjewtR19hvsm/1N7Uk4mWmW5plXLcWONhTrNrNq4YRQ=; b=NNiNgw+vJKQ/B2JxK8oMefQLrR
	7EQVwG1YkJIEbyZL8iUqcruikbl8KanQsUnRL5ck7aSzVqsS/j1vi/3I61F4ksLTdNU4aSbgOn8jw
	/VPvB1/6wN503Ofqi8pjv8bL5FKLNUkwQc/JMC0TRTHBJz0w5YBadadm8q4cXXRUpUuk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175472-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 175472: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=84ece04e7f11fe30c2f83753d72f481610357ed0
X-Osstest-Versions-That:
    xen=03697629bc1d05742098038bf3e93f519b0a7711
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 23 Dec 2022 20:57:38 +0000

flight 175472 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175472/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  84ece04e7f11fe30c2f83753d72f481610357ed0
baseline version:
 xen                  03697629bc1d05742098038bf3e93f519b0a7711

Last test of basis   175464  2022-12-23 10:03:30 Z    0 days
Testing same since   175472  2022-12-23 18:00:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jiamei Xie <jiamei.xie@arm.com>
  Julien Grall <jgrall@amazon.com>

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
   03697629bc..84ece04e7f  84ece04e7f11fe30c2f83753d72f481610357ed0 -> smoke

