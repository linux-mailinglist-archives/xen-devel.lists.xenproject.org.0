Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2F480F8E6
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 22:05:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653603.1020015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD9wB-0008Ey-P0; Tue, 12 Dec 2023 21:05:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653603.1020015; Tue, 12 Dec 2023 21:05:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD9wB-0008DG-KU; Tue, 12 Dec 2023 21:05:07 +0000
Received: by outflank-mailman (input) for mailman id 653603;
 Tue, 12 Dec 2023 21:05:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rD9w9-0008D6-GX; Tue, 12 Dec 2023 21:05:05 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rD9w9-0008HM-C9; Tue, 12 Dec 2023 21:05:05 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rD9w9-0000XK-5c; Tue, 12 Dec 2023 21:05:05 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rD9w9-0001mi-52; Tue, 12 Dec 2023 21:05:05 +0000
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
	bh=0wVBs88FJ/lRQfybuPSoNfq6h1DDT8kSxgvTEqc/W94=; b=VXkiBxSP2SS0H+NcMc6kVsI9k6
	g11pxZuIgL6qiu2m0/C+NW9rYs5PLHensaLBIclCIVKDHpvhmPz/wKNQHxeeEPom6mo/ef3UfJXe5
	K/SwZvM7h8jR2ZsVUM/sFDPztI1kWz2r4e9lnEWSPuxj53Ac59LU8NTabNGjbX6sxmRc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184112-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 184112: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=a6a8fe0eb177ca27c9155177e7e60c13fc46e5f6
X-Osstest-Versions-That:
    xen=cf40abbc7ff2a73eaaea84e919fc7762354e75ad
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 12 Dec 2023 21:05:05 +0000

flight 184112 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184112/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  a6a8fe0eb177ca27c9155177e7e60c13fc46e5f6
baseline version:
 xen                  cf40abbc7ff2a73eaaea84e919fc7762354e75ad

Last test of basis   184102  2023-12-12 11:00:28 Z    0 days
Failing since        184106  2023-12-12 14:02:12 Z    0 days    2 attempts
Testing same since   184112  2023-12-12 18:02:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Arnd Bergmann <arnd@arndb.de>
  Federico Serafini <federico.serafini@bugseng.com>
  George Dunlap <george.dunlap@cloud.com>
  Henry Wang <Henry.Wang@arm.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Michal Orzel <michal.orzel@amd.com>
  Nicola Vetrini <nicola.vetrini@bugseng.com>
  Oleksii Kurochko <oleksii.kurochko@gmail.com>

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
   cf40abbc7f..a6a8fe0eb1  a6a8fe0eb177ca27c9155177e7e60c13fc46e5f6 -> smoke

