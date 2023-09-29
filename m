Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB7C7B36D1
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 17:29:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610602.950042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmFQL-0001kZ-U9; Fri, 29 Sep 2023 15:29:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610602.950042; Fri, 29 Sep 2023 15:29:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmFQL-0001hT-R3; Fri, 29 Sep 2023 15:29:01 +0000
Received: by outflank-mailman (input) for mailman id 610602;
 Fri, 29 Sep 2023 15:29:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qmFQK-0001hJ-K4; Fri, 29 Sep 2023 15:29:00 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qmFQK-0003FL-FR; Fri, 29 Sep 2023 15:29:00 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qmFQJ-0006Fe-UW; Fri, 29 Sep 2023 15:29:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qmFQJ-0004i4-Ty; Fri, 29 Sep 2023 15:28:59 +0000
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
	bh=N6MWPdVpm3uKO4usnKxZNyvBptHLNnAkqkgx34TiYHs=; b=aMrT0t4opW7N2U52RpOEmH0ii/
	0bOAx07aPT9jxOq/0kQLyCBFSWKKITetAPOAOqOsNPtUlC1RTsnvvtjjlyOhC9LGCwz499+/cIgiY
	Ph1Zyyw0/ovJxksbxAjfIQRHVOsN4tBMhY4uvGbeD3e01T1oaIysQg01FDU3EW+6v0/8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183214-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 183214: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=2797a717121cda0da5eeea3a17203d1c155c5e54
X-Osstest-Versions-That:
    xen=a8ab67cae01eca7bba8627ce13429c59fda056f3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 29 Sep 2023 15:28:59 +0000

flight 183214 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183214/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  2797a717121cda0da5eeea3a17203d1c155c5e54
baseline version:
 xen                  a8ab67cae01eca7bba8627ce13429c59fda056f3

Last test of basis   183213  2023-09-29 09:02:08 Z    0 days
Testing same since   183214  2023-09-29 13:03:41 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  David Kahurani <k.kahurani@gmail.com>
  Shawn Anastasio <sanastasio@raptorengineering.com>

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
   a8ab67cae0..2797a71712  2797a717121cda0da5eeea3a17203d1c155c5e54 -> smoke

