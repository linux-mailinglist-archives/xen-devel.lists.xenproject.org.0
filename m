Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9878C5B8E62
	for <lists+xen-devel@lfdr.de>; Wed, 14 Sep 2022 19:54:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407029.649460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYWZs-0007uv-TA; Wed, 14 Sep 2022 17:53:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407029.649460; Wed, 14 Sep 2022 17:53:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYWZs-0007ru-PN; Wed, 14 Sep 2022 17:53:36 +0000
Received: by outflank-mailman (input) for mailman id 407029;
 Wed, 14 Sep 2022 17:53:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oYWZq-0007rk-Em; Wed, 14 Sep 2022 17:53:34 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oYWZq-0003So-Bt; Wed, 14 Sep 2022 17:53:34 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oYWZp-0000gc-UP; Wed, 14 Sep 2022 17:53:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oYWZp-0002ij-Ty; Wed, 14 Sep 2022 17:53:33 +0000
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
	bh=x5IXKCTeK6fAN2+nxpwYYTOJUIbjGaaihFxsxiuUI+s=; b=jYDCDkxiA1Pqh9cF7njFRXrk4o
	X5PS+2iCzlm3wIUqYXKf54YiWRhKaX5yIvCgbMzi38/an/4IL9WK4bmHT0mYS0jcJLz0sNhMVf8tY
	T44gVgNjrz+Gw3jETyMKl66KDIf2Tb1ktHg3GlN2gYm11JKAeEm8tZfj+Ym0mcjw4wU8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173192-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 173192: tolerable FAIL - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:build-amd64-libvirt:libvirt-build:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=3007efadf74d6146a1c0ff1c2fbbae6b53ce7898
X-Osstest-Versions-That:
    xen=942ac5fc15ecc2f7ef1d9331c76d89d2cef10e5c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 14 Sep 2022 17:53:33 +0000

flight 173192 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/173192/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 build-amd64-libvirt           6 libvirt-build                fail  like 173103
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  3007efadf74d6146a1c0ff1c2fbbae6b53ce7898
baseline version:
 xen                  942ac5fc15ecc2f7ef1d9331c76d89d2cef10e5c

Last test of basis   173103  2022-09-10 01:03:22 Z    4 days
Testing same since   173192  2022-09-14 14:03:20 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Daniel P. Smith <dpsmith@apertussolutions.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          fail    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
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


Pushing revision :

To xenbits.xen.org:/home/xen/git/xen.git
   942ac5fc15..3007efadf7  3007efadf74d6146a1c0ff1c2fbbae6b53ce7898 -> smoke

