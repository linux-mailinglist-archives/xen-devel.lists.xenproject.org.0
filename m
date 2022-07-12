Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6CA571A03
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jul 2022 14:31:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365650.595918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBF2K-0005yu-Ny; Tue, 12 Jul 2022 12:30:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365650.595918; Tue, 12 Jul 2022 12:30:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBF2K-0005wm-Kn; Tue, 12 Jul 2022 12:30:44 +0000
Received: by outflank-mailman (input) for mailman id 365650;
 Tue, 12 Jul 2022 12:30:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oBF2J-0005vq-NS; Tue, 12 Jul 2022 12:30:43 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oBF2J-0004pC-ME; Tue, 12 Jul 2022 12:30:43 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oBF2J-0004iG-2Y; Tue, 12 Jul 2022 12:30:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oBF2I-0001qO-W9; Tue, 12 Jul 2022 12:30:42 +0000
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
	bh=t188d9qqxpbbDYnIL6A2q8Qv029TcEGLIpWwjn68y2w=; b=WjYV6PZagSdeMcchEMjzB7dbjE
	OxjhUB37DLRtSMWP/Tnny+v+gXL3y0zhiGWHkcvBQjVTZFmzaRxF7ihwxPU9Eb9mfTH+U6UpZo6Zi
	8LsT2EuApdJFWh+Q1toKFexVcmBACU7qCr3VD/WL1r33+MrxvwUD2OmX38dqptxUH3BY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171590-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 171590: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=dc7da0874ba4e8fab4c5783055755938ef19fc37
X-Osstest-Versions-That:
    xen=27357c394ba6e1571a89105b840ce1c6f026485c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 12 Jul 2022 12:30:42 +0000

flight 171590 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171590/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  dc7da0874ba4e8fab4c5783055755938ef19fc37
baseline version:
 xen                  27357c394ba6e1571a89105b840ce1c6f026485c

Last test of basis   171584  2022-07-11 15:01:38 Z    0 days
Testing same since   171590  2022-07-12 07:01:45 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "G.R." <firemeteor@users.sourceforge.net>
  Anthony PERARD <anthony.perard@citrix.com>
  Demi Marie Obenour <demi@invisiblethingslab.com>
  Luca Fancellu <luca.fancellu@arm.com>

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
   27357c394b..dc7da0874b  dc7da0874ba4e8fab4c5783055755938ef19fc37 -> smoke

