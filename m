Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0249E8C7126
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 06:51:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722794.1127105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7T49-0006Lg-Ky; Thu, 16 May 2024 04:50:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722794.1127105; Thu, 16 May 2024 04:50:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7T49-0006Ht-Gs; Thu, 16 May 2024 04:50:05 +0000
Received: by outflank-mailman (input) for mailman id 722794;
 Thu, 16 May 2024 04:50:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s7T48-00067y-Fm; Thu, 16 May 2024 04:50:04 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s7T48-0002gs-Dt; Thu, 16 May 2024 04:50:04 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s7T48-0006eD-2W; Thu, 16 May 2024 04:50:04 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1s7T48-0002CI-1z; Thu, 16 May 2024 04:50:04 +0000
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
	bh=nEq6vfxa19GkunGPMaFdRHvIZp8K+c24hnpUO2xsbLw=; b=X82mPdQsqO8jsgfda+jiD57bmq
	LbZUUkv84+/bdEqbCrcgTTpnHSPmy6nIgxO4m0L4gsH0JzY2cZbCXKoNmpnw36095CXv4tpzamr/X
	Ity/90wWVPI6q3EmBtqDusyQ/QPmiUljA7FAF4rDy+vW3IZe5kSbWZS84gnwS+4tQR/Q=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186009-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 186009: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=762a848223e0fd61aa87b4e040c83dd2c490fb79
X-Osstest-Versions-That:
    xen=abd00b037da5ffa4e8c4508a5df0cd6eabb805a4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 16 May 2024 04:50:04 +0000

flight 186009 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186009/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  762a848223e0fd61aa87b4e040c83dd2c490fb79
baseline version:
 xen                  abd00b037da5ffa4e8c4508a5df0cd6eabb805a4

Last test of basis   186006  2024-05-15 20:04:01 Z    0 days
Testing same since   186009  2024-05-16 01:00:26 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Nicola Vetrini <nicola.vetrini@bugseng.com>

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
   abd00b037d..762a848223  762a848223e0fd61aa87b4e040c83dd2c490fb79 -> smoke

