Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 973967815AC
	for <lists+xen-devel@lfdr.de>; Sat, 19 Aug 2023 01:15:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586609.917872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX8f1-0006yE-3O; Fri, 18 Aug 2023 23:13:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586609.917872; Fri, 18 Aug 2023 23:13:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX8f1-0006wF-0A; Fri, 18 Aug 2023 23:13:43 +0000
Received: by outflank-mailman (input) for mailman id 586609;
 Fri, 18 Aug 2023 23:13:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qX8ez-0006w5-LD; Fri, 18 Aug 2023 23:13:41 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qX8ez-0007nZ-El; Fri, 18 Aug 2023 23:13:41 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qX8ez-0001pS-1x; Fri, 18 Aug 2023 23:13:41 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qX8ez-0004UV-1U; Fri, 18 Aug 2023 23:13:41 +0000
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
	bh=dqJfKY4HqYUoNyepvT3MSNAtfrMJbRdnHF6ovuqzAOc=; b=2ehs8n7KHMAQkQQlnNgqk0NxSY
	EB7kA3YVYjFn4pAxBW7HLK7sN+kNl6LsNMZ79ytmq9ityp/0wn3ehlTr4NKek6Zf08qRSwB2iWDsF
	Yop7DRCkmFfIzXgUmlvf8S7cK4kiUNuDCpMY2CuZ4UgBuDphOtRcfu+y/CyMnosHj6s8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182388-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 182388: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=b2865c2b6f164d2c379177cdd1cb200e4eaba549
X-Osstest-Versions-That:
    xen=cd36188b2762a05c322a5f56bcfce59c2d9cac2e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 18 Aug 2023 23:13:41 +0000

flight 182388 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182388/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  b2865c2b6f164d2c379177cdd1cb200e4eaba549
baseline version:
 xen                  cd36188b2762a05c322a5f56bcfce59c2d9cac2e

Last test of basis   182386  2023-08-18 16:02:00 Z    0 days
Testing same since   182388  2023-08-18 20:03:50 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jinoh Kang <jinoh.kang.kr@gmail.com>

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
   cd36188b27..b2865c2b6f  b2865c2b6f164d2c379177cdd1cb200e4eaba549 -> smoke

