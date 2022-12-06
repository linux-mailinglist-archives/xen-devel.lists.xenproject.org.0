Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D87644DE6
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 22:23:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455576.713081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2fPR-0005GI-FV; Tue, 06 Dec 2022 21:23:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455576.713081; Tue, 06 Dec 2022 21:23:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2fPR-0005EX-CO; Tue, 06 Dec 2022 21:23:25 +0000
Received: by outflank-mailman (input) for mailman id 455576;
 Tue, 06 Dec 2022 21:23:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p2fPQ-0005EL-LB; Tue, 06 Dec 2022 21:23:24 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p2fPQ-0002oH-KT; Tue, 06 Dec 2022 21:23:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p2fPQ-0002cN-5q; Tue, 06 Dec 2022 21:23:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p2fPQ-0000QD-55; Tue, 06 Dec 2022 21:23:24 +0000
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
	bh=r/mr6DOjvTyqTG+TFC9lq2srH3NTVH5K3aQSqMQMdfE=; b=R3oH+rbuQvb2Jr7YqYAW4efMWY
	xQDqyw3qjZd1IQFDvAdngWW9UAxUxgbQKoMCbQVcH6S+4Jfb3N+qj7LsByOEyTDffuRYZ7ERB7JWU
	DFH95zFlhBfL+u+B+hTni6scNHZZvlswcjUmdGIG2Tb1BseLMQaTaCvOAa+t8Tsc0U/0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175063-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 175063: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=b926dbcccaa92831dda37576f768ddab9ec8a701
X-Osstest-Versions-That:
    xen=a6da84524ceaf24ff997d03407b93f60c12857f3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 06 Dec 2022 21:23:24 +0000

flight 175063 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175063/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  b926dbcccaa92831dda37576f768ddab9ec8a701
baseline version:
 xen                  a6da84524ceaf24ff997d03407b93f60c12857f3

Last test of basis   175060  2022-12-06 13:00:26 Z    0 days
Testing same since   175063  2022-12-06 19:00:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ayan Kumar Halder <ayan.kumar.halder@amd.com>
  Ayan Kumar Halder <ayankuma@amd.com>
  Julien Grall <jgrall@amazon.com>
  Julien Grall <julien@xen.org>
  Michal Orzel <michal.orzel@amd.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Viresh Kumar <viresh.kumar@linaro.org>

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
   a6da84524c..b926dbccca  b926dbcccaa92831dda37576f768ddab9ec8a701 -> smoke

