Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE59733B1C
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 22:43:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550448.859547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qAGHU-0005Ma-Ui; Fri, 16 Jun 2023 20:42:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550448.859547; Fri, 16 Jun 2023 20:42:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qAGHU-0005JH-Rr; Fri, 16 Jun 2023 20:42:52 +0000
Received: by outflank-mailman (input) for mailman id 550448;
 Fri, 16 Jun 2023 20:42:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qAGHT-0005J7-Pg; Fri, 16 Jun 2023 20:42:51 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qAGHT-0007Tc-NP; Fri, 16 Jun 2023 20:42:51 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qAGHS-0000HJ-Cf; Fri, 16 Jun 2023 20:42:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qAGHP-0007CM-0s; Fri, 16 Jun 2023 20:42:50 +0000
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
	bh=MRAtYK28hTFcLG/sl6IdTsCOQRFSu7Nlq8ykZCWj3Wg=; b=w5jb/hPfHLcanpl4mBM6zaM3S3
	y8LYW9KLR1YEB71EHCZ8jn0i65OTr1TTMppbK30gdWNEmbKU92zbIKIm23GXlGWCJ1CDzBQF1jkEj
	Zl+qQKRwdPvEvYmQJ7OxxsbC5SduuED6mnQjShNQNlomh9rhSRTo064vS8dqmfKHRygE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181467-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 181467: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=e533438e3d28158602dce051b032811bdd26377d
X-Osstest-Versions-That:
    xen=e0586a4ff514590eec50185e2440b97f9a31cb7f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 16 Jun 2023 20:42:47 +0000

flight 181467 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181467/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  e533438e3d28158602dce051b032811bdd26377d
baseline version:
 xen                  e0586a4ff514590eec50185e2440b97f9a31cb7f

Last test of basis   181466  2023-06-16 14:01:56 Z    0 days
Testing same since   181467  2023-06-16 18:00:24 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Shawn Anastasio <sanastasio@raptorengineering.com>
  Shawn Anastasio <shawn@anastas.io>

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
   e0586a4ff5..e533438e3d  e533438e3d28158602dce051b032811bdd26377d -> smoke

