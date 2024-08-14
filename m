Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D07F5951310
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 05:23:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776731.1186892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1se4bb-0001iY-F2; Wed, 14 Aug 2024 03:23:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776731.1186892; Wed, 14 Aug 2024 03:23:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1se4bb-0001gy-C2; Wed, 14 Aug 2024 03:23:23 +0000
Received: by outflank-mailman (input) for mailman id 776731;
 Wed, 14 Aug 2024 03:23:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1se4bZ-0001go-DO; Wed, 14 Aug 2024 03:23:21 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1se4bZ-0005TF-7s; Wed, 14 Aug 2024 03:23:21 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1se4bY-00045Q-SC; Wed, 14 Aug 2024 03:23:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1se4bY-0007vw-Re; Wed, 14 Aug 2024 03:23:20 +0000
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
	bh=/03Htl0fJVqsg9XdmZNMy9/fZAbKxD/pWOJspNeCPxA=; b=rxAKjocejeeLVwVdH0Y8xCFY05
	xl1BHZPHBisN0c1OvnyCsbRXNfOPg3yzkU6Nj09SAJFMCHpPflpGXFfi1dn3Gxk5XUs5sb1dTPUsy
	1+SyoIwN15/BC74r+sN3m6NShGibbnrPhzFcdjoSKPXE7/KpqwOM7EOFTaZeZvdRyuR4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187234-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 187234: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=35c64c3dce01c2d0689a8c13240bf48a10cef783
X-Osstest-Versions-That:
    xen=98a462f8b169f93ab7463023f0ed94575f8225b4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 14 Aug 2024 03:23:20 +0000

flight 187234 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187234/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  35c64c3dce01c2d0689a8c13240bf48a10cef783
baseline version:
 xen                  98a462f8b169f93ab7463023f0ed94575f8225b4

Last test of basis   187219  2024-08-12 23:00:28 Z    1 days
Failing since        187227  2024-08-13 15:04:06 Z    0 days    2 attempts
Testing same since   187234  2024-08-13 21:00:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alejandro Vallejo <alejandro.vallejo@cloud.com>
  Andrew Cooper <andrew.cooper3@citrix.com>
  Edgar E. Iglesias <edgar.iglesias@amd.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Oleksii Kurochko <oleksii.kurochko@gmail.com>
  Paul Durrant <paul@xen.org>
  Rahul Singh <rahul.singh@arm.com>
  Sergiy Kibrik <Sergiy_Kibrik@epam.com>
  Teddy Astie <teddy.astie@vates.tech>

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
   98a462f8b1..35c64c3dce  35c64c3dce01c2d0689a8c13240bf48a10cef783 -> smoke

