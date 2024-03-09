Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F238876F61
	for <lists+xen-devel@lfdr.de>; Sat,  9 Mar 2024 07:32:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690509.1076562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riqEN-0004wG-2i; Sat, 09 Mar 2024 06:30:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690509.1076562; Sat, 09 Mar 2024 06:30:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riqEM-0004tU-VP; Sat, 09 Mar 2024 06:30:50 +0000
Received: by outflank-mailman (input) for mailman id 690509;
 Sat, 09 Mar 2024 06:30:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1riqEL-0004t3-73; Sat, 09 Mar 2024 06:30:49 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1riqEL-0003OR-5P; Sat, 09 Mar 2024 06:30:49 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1riqEK-00086K-P0; Sat, 09 Mar 2024 06:30:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1riqEK-0006B5-OX; Sat, 09 Mar 2024 06:30:48 +0000
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
	bh=82ROUxkEtiwSdz/lv+kjamuEeeKE7vA2aKY6dWGKByo=; b=2qB2GZxxL37HQgLFHq7Uspzy4a
	xm+LJ3huCvwgGW+jGorBLNewLWp4X9fuCnJjAdofpEqbnFtmsKMrqQFzwDB/2c1eobelgP5gYny8D
	Ut6t7hHnHtHVrAxL0VNZwVGGWluVQ/3tWlZSSl2IT937sy+rhuuH7sTZDKGXl1B86rYk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184965-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 184965: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=ef31ffbc3dc124173fc9420988772fa96bc4bf12
X-Osstest-Versions-That:
    xen=90173fc5a2a826bbcabde22af405d0a617818b70
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 09 Mar 2024 06:30:48 +0000

flight 184965 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184965/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  ef31ffbc3dc124173fc9420988772fa96bc4bf12
baseline version:
 xen                  90173fc5a2a826bbcabde22af405d0a617818b70

Last test of basis   184932  2024-03-07 15:02:11 Z    1 days
Testing same since   184965  2024-03-09 03:00:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Federico Serafini <federico.serafini@bugseng.com>

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
   90173fc5a2..ef31ffbc3d  ef31ffbc3dc124173fc9420988772fa96bc4bf12 -> smoke

