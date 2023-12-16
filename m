Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F12815587
	for <lists+xen-devel@lfdr.de>; Sat, 16 Dec 2023 01:32:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655438.1023198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rEIaZ-0004nP-5I; Sat, 16 Dec 2023 00:31:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655438.1023198; Sat, 16 Dec 2023 00:31:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rEIaZ-0004kF-2Z; Sat, 16 Dec 2023 00:31:31 +0000
Received: by outflank-mailman (input) for mailman id 655438;
 Sat, 16 Dec 2023 00:31:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rEIaX-0004k5-76; Sat, 16 Dec 2023 00:31:29 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rEIaW-0003x5-Pw; Sat, 16 Dec 2023 00:31:28 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rEIaW-0006U1-BF; Sat, 16 Dec 2023 00:31:28 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rEIaW-0006xm-Ah; Sat, 16 Dec 2023 00:31:28 +0000
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
	bh=SPDemTFh0UGQ0tPDN7wD0AqxsQ+QN1PpW8HDgdFhLeU=; b=tmF629fR4AF92qW95IdTVF+sMc
	k/VVVzaimYEJbwaAATmbQXr39YIX+6s8xMyQNb/DWWwENBB1Kg7oFRj6+M8oKH03DhYI2p4PLmYTP
	fw3cFEx7ZtaATcVUHl7nqAO+NFY4b9I1c1ma1jwYwQ2rvUpw5lH0APJqaRpblFkO/JgE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184147-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 184147: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=a60067f39882a4f40547fc0cd8177bac89cb01b7
X-Osstest-Versions-That:
    xen=cad6f9a4c12dd4d5cdb2620e3fe24727ee81c7ce
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 16 Dec 2023 00:31:28 +0000

flight 184147 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184147/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  a60067f39882a4f40547fc0cd8177bac89cb01b7
baseline version:
 xen                  cad6f9a4c12dd4d5cdb2620e3fe24727ee81c7ce

Last test of basis   184135  2023-12-14 10:03:56 Z    1 days
Testing same since   184147  2023-12-15 22:03:52 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Julien Grall <jgrall@amazon.com>
  Nicola Vetrini <nicola.vetrini@bugseng.com>
  Stefano Stabellini <stefano.stabellini@amd.com>

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
   cad6f9a4c1..a60067f398  a60067f39882a4f40547fc0cd8177bac89cb01b7 -> smoke

