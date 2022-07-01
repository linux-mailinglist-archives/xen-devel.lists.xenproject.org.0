Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62406563C1F
	for <lists+xen-devel@lfdr.de>; Fri,  1 Jul 2022 23:58:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.359253.588680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o7Odo-0004zS-I4; Fri, 01 Jul 2022 21:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 359253.588680; Fri, 01 Jul 2022 21:57:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o7Odo-0004wn-Eh; Fri, 01 Jul 2022 21:57:32 +0000
Received: by outflank-mailman (input) for mailman id 359253;
 Fri, 01 Jul 2022 21:57:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o7Odn-0004wd-5o; Fri, 01 Jul 2022 21:57:31 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o7Odn-0003gc-3a; Fri, 01 Jul 2022 21:57:31 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o7Odm-00006l-Ml; Fri, 01 Jul 2022 21:57:30 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1o7Odm-0002RX-MJ; Fri, 01 Jul 2022 21:57:30 +0000
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
	bh=E2pa4jOmHK1hYQwTRZrG1zz3veIOcXgAQo0+iKpDuGg=; b=nEsM5X9Y09r0KYYhVkPNrhBOTC
	63PeIxDNpxvNH+wkelMIxz07cthL6PqnS/p4rTDlsg0G8e9uqc7RhP9Ws7KJU9wepaXhK8zTvDq4h
	nMt0Pc7Hb8KBmMldkTO7pTvvNsceU67LbnQ1R/HeWHD2xgGY5A1AHQnndf218VdbdRDU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171447-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 171447: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=bf2f989531ad3851685a1847cbc1e28901ed80a2
X-Osstest-Versions-That:
    xen=ee11f092b515bf3c926eaad053d12d3f2b6e593e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 01 Jul 2022 21:57:30 +0000

flight 171447 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171447/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  bf2f989531ad3851685a1847cbc1e28901ed80a2
baseline version:
 xen                  ee11f092b515bf3c926eaad053d12d3f2b6e593e

Last test of basis   171430  2022-06-30 21:01:45 Z    1 days
Testing same since   171447  2022-07-01 18:00:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
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
   ee11f092b5..bf2f989531  bf2f989531ad3851685a1847cbc1e28901ed80a2 -> smoke

