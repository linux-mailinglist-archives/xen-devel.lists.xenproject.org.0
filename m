Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 505B97FDB68
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 16:29:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644029.1004652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8MVO-0007kc-Nw; Wed, 29 Nov 2023 15:29:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644029.1004652; Wed, 29 Nov 2023 15:29:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8MVO-0007hD-Kw; Wed, 29 Nov 2023 15:29:38 +0000
Received: by outflank-mailman (input) for mailman id 644029;
 Wed, 29 Nov 2023 15:29:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r8MVM-0007h3-PV; Wed, 29 Nov 2023 15:29:36 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r8MVM-0005Vz-IY; Wed, 29 Nov 2023 15:29:36 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r8MVM-0001il-8I; Wed, 29 Nov 2023 15:29:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1r8MVM-0006YP-7l; Wed, 29 Nov 2023 15:29:36 +0000
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
	bh=rjVFo5D0MY5waj9JO8Tji51NV7uX797I74eqmdAWKtU=; b=AoLpEAge+RzGy0y3AcOA6MG9xU
	4BLfnoPhsRl9+H5IknZ5AVa+btgjkkO3MLhT+jk+gl8HywO55rUKdpvR0p2lT2kRDQ1tMO+xqfh8M
	IysHgiuaM08L6dyIpfU9vOGQlxFLTWctP178VEZ5lZslmMZTifp6Yx/0ok9vmEUL5zqQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183934-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 183934: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=902377b690f42ddf44ae91c4b0751d597f1cd694
X-Osstest-Versions-That:
    xen=80c153c48b255bae61948827241c26671207cf4e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 29 Nov 2023 15:29:36 +0000

flight 183934 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183934/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  902377b690f42ddf44ae91c4b0751d597f1cd694
baseline version:
 xen                  80c153c48b255bae61948827241c26671207cf4e

Last test of basis   183851  2023-11-24 09:03:53 Z    5 days
Failing since        183871  2023-11-27 14:00:26 Z    2 days   11 attempts
Testing same since   183934  2023-11-29 11:04:12 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alejandro Vallejo <alejandro.vallejo@cloud.com>
  Andrew Cooper <andrew.cooper3@citrix.com>
  Federico Serafini <federico.serafini@bugseng.com>
  Frediano Ziglio <frediano.ziglio@cloud.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Luca Fancellu <luca.fancellu@arm.com>
  Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
  Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
  Michal Orzel <michal.orzel@amd.com>
  Nicola Vetrini <nicola.vetrini@bugseng.com>
  Oleksii Kurochko <oleksii.kurochko@gmail.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Shawn Anastasio <sanastasio@raptorengineering.com>
  Simone Ballarin  <simone.ballarin@bugseng.com>
  Simone Ballarin <simone.ballarin@bugseng.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Tamas K Lengyel <tamas@tklengyel.com>

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
   80c153c48b..902377b690  902377b690f42ddf44ae91c4b0751d597f1cd694 -> smoke

