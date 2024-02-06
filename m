Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AECD684B72F
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 15:00:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676952.1053321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXLz7-0007RM-A8; Tue, 06 Feb 2024 13:59:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676952.1053321; Tue, 06 Feb 2024 13:59:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXLz7-0007Pr-7T; Tue, 06 Feb 2024 13:59:37 +0000
Received: by outflank-mailman (input) for mailman id 676952;
 Tue, 06 Feb 2024 13:59:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rXLz5-0007Ph-SW; Tue, 06 Feb 2024 13:59:35 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rXLz5-00044K-PK; Tue, 06 Feb 2024 13:59:35 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rXLz5-0003B0-FZ; Tue, 06 Feb 2024 13:59:35 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rXLz5-00077i-F0; Tue, 06 Feb 2024 13:59:35 +0000
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
	bh=KLAV87Rn9yZM7fgGLfvboF7pG4XjSgIPK2yYQ3S9xiE=; b=re4gseFzaFdhsQ5PHlrxrRLThF
	GbPh+2kl2NoH2dkJptlMR7O5ApM48RTV4qiw+OC+UCtSlv0uy7IBDQFHZNF2BPzSO3M4EHgTmWEGE
	Cchh6VQ07WgRkFdP87Uqm10EpAM8YlVoifxCfNBz+gsoDvmA2bs/8mtPAKRy6HuxAcZU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184605-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 184605: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=57a923bfd920307c5bfa533c95dba16a13ea0225
X-Osstest-Versions-That:
    xen=1cb7949b37b3d8892d8a3cea3ad1e2448352a34d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 06 Feb 2024 13:59:35 +0000

flight 184605 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184605/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  57a923bfd920307c5bfa533c95dba16a13ea0225
baseline version:
 xen                  1cb7949b37b3d8892d8a3cea3ad1e2448352a34d

Last test of basis   184599  2024-02-06 01:00:34 Z    0 days
Testing same since   184605  2024-02-06 11:03:06 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Anthony PERARD <anthony.perard@citrix.com>
  David Woodhouse <dwmw2@amazon.com>
  Elias El Yandouzi <eliasely@amazon.com>
  Frediano Ziglio <frediano.ziglio@cloud.com>
  George Dunlap <george.dunlap@cloud.com>
  Hongyan Xia <hongyxia@amazon.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  oxjo <oxjo@proton.me>
  Roger Pau Monné <roger.pau@citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Wei Liu <wei.liu2@citrix.com>

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
   1cb7949b37..57a923bfd9  57a923bfd920307c5bfa533c95dba16a13ea0225 -> smoke

