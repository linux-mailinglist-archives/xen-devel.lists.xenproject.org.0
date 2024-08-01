Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 224E69449C0
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 12:53:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769574.1180464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZTQz-0001ty-1M; Thu, 01 Aug 2024 10:53:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769574.1180464; Thu, 01 Aug 2024 10:53:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZTQy-0001s6-Uz; Thu, 01 Aug 2024 10:53:24 +0000
Received: by outflank-mailman (input) for mailman id 769574;
 Thu, 01 Aug 2024 10:53:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sZTQw-0001rw-PQ; Thu, 01 Aug 2024 10:53:22 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sZTQw-0003QU-FA; Thu, 01 Aug 2024 10:53:22 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sZTQw-0005E0-4X; Thu, 01 Aug 2024 10:53:22 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sZTQw-00034V-3p; Thu, 01 Aug 2024 10:53:22 +0000
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
	bh=G95YRpDuxXzsjWSUWqsZ2zr4MINh6thF2oqePYOzvQ0=; b=skbjLO2npvVteIwJhbFQhtauMk
	99JuB1pqhHp3NZcYNEcrwBCDbDMUT3sujU5IVipmsBOcozUniD7KyVHXR5bSAr02HV1AtSEEdI6Dh
	io4D1JNy3xVzMTc7xB3VQ+5rIE05JH9KipJFxn5vXD4e4ih3mfW744lIgQE5wGJbp8ok=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187102-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 187102: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=f2dc25686b6c90fc631525e4b9e6537154ee4b0b
X-Osstest-Versions-That:
    xen=36f75d39b38d94a0d17119a4178c08de994ead23
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 01 Aug 2024 10:53:22 +0000

flight 187102 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187102/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  f2dc25686b6c90fc631525e4b9e6537154ee4b0b
baseline version:
 xen                  36f75d39b38d94a0d17119a4178c08de994ead23

Last test of basis   187096  2024-08-01 01:00:22 Z    0 days
Testing same since   187102  2024-08-01 08:02:06 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alejandro Vallejo <alejandro.vallejo@cloud.com>
  Alistair Francis <alistair.francis@wdc.com>
  Christian Lindig <christian.lindig@cloud.com>
  Jan Beulich <jbeulich@suse.com>
  Oleksii Kurochko <oleksii.kurochko@gmail.com>
  Petr Beneš <w1benny@gmail.com>
  Sergiy Kibrik <Sergiy_Kibrik@epam.com>

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
   36f75d39b3..f2dc25686b  f2dc25686b6c90fc631525e4b9e6537154ee4b0b -> smoke

