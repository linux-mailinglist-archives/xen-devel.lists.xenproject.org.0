Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B7B3BEF6B
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 20:40:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152663.282010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1CST-0000l2-94; Wed, 07 Jul 2021 18:39:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152663.282010; Wed, 07 Jul 2021 18:39:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1CST-0000j6-5M; Wed, 07 Jul 2021 18:39:41 +0000
Received: by outflank-mailman (input) for mailman id 152663;
 Wed, 07 Jul 2021 18:39:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m1CSR-0000iv-VC; Wed, 07 Jul 2021 18:39:39 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m1CSR-0002Dr-NF; Wed, 07 Jul 2021 18:39:39 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m1CSR-0004fw-Cu; Wed, 07 Jul 2021 18:39:39 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1m1CSR-0005TK-CN; Wed, 07 Jul 2021 18:39:39 +0000
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
	bh=LEGr3M4dup8LbUBnjYYxgiu8OyDopCqGeBYNr+5f9OA=; b=yEiJX0kCLseuV1Af0eKhZh8n7l
	ORNedV0Z5Os9hT5ezLzBybyu8YC7ht2w3W9aM74fq3Aapu0Wf6sPCbLKKvaRfunOj8mxg9nJyfXGx
	7eRnbsyG+TAQnv70OYtZNJ3b5TbO9WQ7hiMW/TYC0Ppwk6/CMuR/Q5A9r4GU63dzMh/Y=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-163408-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 163408: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=e362d3276d40e4f370c92eaa6c0e84e34badb92b
X-Osstest-Versions-That:
    xen=4473f3601098a2c3cf5ab89d5a29504772985e3a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 07 Jul 2021 18:39:39 +0000

flight 163408 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/163408/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  e362d3276d40e4f370c92eaa6c0e84e34badb92b
baseline version:
 xen                  4473f3601098a2c3cf5ab89d5a29504772985e3a

Last test of basis   163326  2021-07-06 09:01:40 Z    1 days
Failing since        163328  2021-07-06 13:01:47 Z    1 days   17 attempts
Testing same since   163408  2021-07-07 15:00:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bertrand Marquis <bertrand.marquis@arm.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Michal Orzel <michal.orzel@arm.com>
  Olaf Hering <olaf@aepfle.de>
  Rahul Singh <rahul.singh@arm.com>
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
   4473f36010..e362d3276d  e362d3276d40e4f370c92eaa6c0e84e34badb92b -> smoke

