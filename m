Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6C251243F
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 23:04:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315454.534015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njopV-0004tZ-Rt; Wed, 27 Apr 2022 21:04:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315454.534015; Wed, 27 Apr 2022 21:04:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njopV-0004sf-Ne; Wed, 27 Apr 2022 21:04:09 +0000
Received: by outflank-mailman (input) for mailman id 315454;
 Wed, 27 Apr 2022 21:04:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1njopU-0004sP-SP; Wed, 27 Apr 2022 21:04:08 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1njopU-0006qH-QX; Wed, 27 Apr 2022 21:04:08 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1njopU-0005Aw-JA; Wed, 27 Apr 2022 21:04:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1njopU-0000ge-Ik; Wed, 27 Apr 2022 21:04:08 +0000
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
	bh=WemcyO6rDW2koBVp3TVD1D63k56XK/tl39sVvbLMaNQ=; b=cVHwaacHyrZi9JzhQpPvoG9Ks+
	vFSEfLxauPRS0/XuO0Be3iFbv1QeIzWBJCf3JT2i5mBVcVt0sPB0fuGQWZEOG4toWyY4CPpCskuDY
	vOHi87tKFR/pEphaoP4PFRu2cZqlU8ODxHkk2Ful45jkuw44zijEa4tsHvJJ3Te9Cfvg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-169788-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 169788: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=53b705d02cec03861044e673536586bd1b2443bd
X-Osstest-Versions-That:
    xen=163071b1800304c962756789b4ef0ddb978059ba
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 27 Apr 2022 21:04:08 +0000

flight 169788 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/169788/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  53b705d02cec03861044e673536586bd1b2443bd
baseline version:
 xen                  163071b1800304c962756789b4ef0ddb978059ba

Last test of basis   169773  2022-04-27 08:01:54 Z    0 days
Failing since        169781  2022-04-27 12:01:52 Z    0 days    2 attempts
Testing same since   169788  2022-04-27 17:01:44 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
  Ayan Kumar Halder <ayankuma@xilinx.com>
  David Vrabel <dvrabel@amazon.co.uk>
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
   163071b180..53b705d02c  53b705d02cec03861044e673536586bd1b2443bd -> smoke

