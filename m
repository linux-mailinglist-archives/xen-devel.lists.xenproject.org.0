Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F458C8017
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 05:03:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723777.1128848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7nrb-0002cq-Us; Fri, 17 May 2024 03:02:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723777.1128848; Fri, 17 May 2024 03:02:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7nrb-0002Zo-Rx; Fri, 17 May 2024 03:02:31 +0000
Received: by outflank-mailman (input) for mailman id 723777;
 Fri, 17 May 2024 03:02:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s7nra-0002Ze-Q3; Fri, 17 May 2024 03:02:30 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s7nra-0002tY-KZ; Fri, 17 May 2024 03:02:30 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s7nra-000375-CU; Fri, 17 May 2024 03:02:30 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1s7nra-0004aY-C1; Fri, 17 May 2024 03:02:30 +0000
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
	bh=+pIowa0YaB4iA+sbJQbKzLXJ3cm/EHBkHc/UPtxese4=; b=axfsO+kLHIWgZW3vzpGQJkiWGH
	QJKcqHwCuftOKchG++i7RphoV3CiN/CzXz0dzdbADUuCtS4md1oSNnQQ8ZOU+CL+mR3ly7WxSffwQ
	ueAKZoUw7gXyrtP6ClU0qgUvnUIF2DMZwobkpNzNvhq4UX6ld0CCw4JKIv0KcQVeBSaQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186022-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 186022: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=53dc37829c31edf02e8fc56aeccca8d60f6e2f5e
X-Osstest-Versions-That:
    xen=977d98e67c2e929c62aa1f495fc4c6341c45abb5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 17 May 2024 03:02:30 +0000

flight 186022 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186022/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  53dc37829c31edf02e8fc56aeccca8d60f6e2f5e
baseline version:
 xen                  977d98e67c2e929c62aa1f495fc4c6341c45abb5

Last test of basis   186019  2024-05-16 18:02:05 Z    0 days
Testing same since   186022  2024-05-16 23:00:22 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Edgar E. Iglesias <edgar.iglesias@amd.com>
  Julien Grall <jgrall@amazon.com>
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
   977d98e67c..53dc37829c  53dc37829c31edf02e8fc56aeccca8d60f6e2f5e -> smoke

