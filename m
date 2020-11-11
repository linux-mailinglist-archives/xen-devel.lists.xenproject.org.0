Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFA02AE5DA
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 02:32:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24139.51234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kceyg-0005VQ-8z; Wed, 11 Nov 2020 01:31:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24139.51234; Wed, 11 Nov 2020 01:31:14 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kceyg-0005VB-4n; Wed, 11 Nov 2020 01:31:14 +0000
Received: by outflank-mailman (input) for mailman id 24139;
 Wed, 11 Nov 2020 01:31:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iq8f=ER=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kceye-0005V6-LW
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 01:31:12 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7a824303-b16b-43c0-8559-c0a1efeccb4e;
 Wed, 11 Nov 2020 01:31:10 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kceyb-0004EK-Jp; Wed, 11 Nov 2020 01:31:09 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kceyb-0000gw-4X; Wed, 11 Nov 2020 01:31:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kceyb-0007wy-42; Wed, 11 Nov 2020 01:31:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Iq8f=ER=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kceye-0005V6-LW
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 01:31:12 +0000
X-Inumbo-ID: 7a824303-b16b-43c0-8559-c0a1efeccb4e
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 7a824303-b16b-43c0-8559-c0a1efeccb4e;
	Wed, 11 Nov 2020 01:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
	bh=RkxAee3Pfj/VGx/Ts8l8FqUpizg+8ZCH07GD00r9v0k=; b=QAFcjxtzEtcRur/zllODYd9w5u
	ocwnJ/eZAs0WTQNmVmhvDHsH5GJ+do+14F9/FtXXLP6+peqjga4NoeJ3QpiJiPADTo6HxDM3EBVCx
	dS08/P3Aq9/bnGjKM9yJV8lgiDIJkEL1fa6LvxLbTTp+9p7sjynQgwZ/p6b4sDxWmUto=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kceyb-0004EK-Jp; Wed, 11 Nov 2020 01:31:09 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kceyb-0000gw-4X; Wed, 11 Nov 2020 01:31:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kceyb-0007wy-42; Wed, 11 Nov 2020 01:31:09 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable bisection] complete test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm
Message-Id: <E1kceyb-0007wy-42@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 11 Nov 2020 01:31:09 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm
testid debian-hvm-install

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  e19bcb626f50a652fb1854a8b2f2c9c371687a11
  Bug not present: c3453a23f7905d24f2404787543e26ec7d02301c
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/156664/


  commit e19bcb626f50a652fb1854a8b2f2c9c371687a11
  Author: Juergen Gross <jgross@suse.com>
  Date:   Fri Nov 6 10:48:07 2020 +0100
  
      xen/rwlock: add check_lock() handling to rwlocks
      
      Checking whether a lock is consistently used regarding interrupts on
      or off is beneficial for rwlocks, too.
      
      So add check_lock() calls to rwlock functions. For this purpose make
      check_lock() globally accessible.
      
      Signed-off-by: Juergen Gross <jgross@suse.com>
      Reviewed-by: Julien Grall <jgrall@amazon.com>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm.debian-hvm-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm.debian-hvm-install --summary-out=tmp/156664.bisection-summary --basis-template=156443 --blessings=real,real-bisect,real-retry xen-unstable test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm debian-hvm-install
Searching for failure / basis pass:
 156608 fail [host=godello0] / 156443 [host=albana0] 156401 [host=huxelrebe1] 156389 [host=godello1] 156373 [host=albana1] 156354 [host=fiano1] 156339 ok.
Failure / basis pass flights: 156608 / 156339
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 0a5e0ce0fb7e5a3b5dfdc936058d2c0e04e5e258
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd 7056f2f89f03f2f804ac7e776c7b2b000cd716cd
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#677cbe1324c29294bb1d1b8454b3f21\
 4725e40fd-7ea428895af2840d85c524f0bd11a38aac308308 git://xenbits.xen.org/xen.git#7056f2f89f03f2f804ac7e776c7b2b000cd716cd-0a5e0ce0fb7e5a3b5dfdc936058d2c0e04e5e258
Loaded 10007 nodes in revision graph
Searching for test results:
 156331 [host=elbling0]
 156339 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd 7056f2f89f03f2f804ac7e776c7b2b000cd716cd
 156354 [host=fiano1]
 156373 [host=albana1]
 156389 [host=godello1]
 156401 [host=huxelrebe1]
 156443 [host=albana0]
 156524 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd 2a5f9f6a6932214fda76b9b3c03e024772882d34
 156538 fail irrelevant
 156556 fail irrelevant
 156577 fail irrelevant
 156588 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 0a5e0ce0fb7e5a3b5dfdc936058d2c0e04e5e258
 156626 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd 7056f2f89f03f2f804ac7e776c7b2b000cd716cd
 156627 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 0a5e0ce0fb7e5a3b5dfdc936058d2c0e04e5e258
 156629 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd 2b8314a3c354d04545700c80ff5a5f86799b79c7
 156637 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd 957708c2d1ae25d7375abd5e5e70c3043d64f1f1
 156638 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd c3453a23f7905d24f2404787543e26ec7d02301c
 156643 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd e19bcb626f50a652fb1854a8b2f2c9c371687a11
 156651 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd c3453a23f7905d24f2404787543e26ec7d02301c
 156656 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd e19bcb626f50a652fb1854a8b2f2c9c371687a11
 156608 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 0a5e0ce0fb7e5a3b5dfdc936058d2c0e04e5e258
 156661 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd c3453a23f7905d24f2404787543e26ec7d02301c
 156664 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd e19bcb626f50a652fb1854a8b2f2c9c371687a11
Searching for interesting versions
 Result found: flight 156339 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd c3453a23f7905d24f2404787543e26ec7d02301c, results HASH(0x55cd7b11cd80) HASH(0x55cd7b1270d0) HASH(0x55cd7b134050) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe132\
 4c29294bb1d1b8454b3f214725e40fd 957708c2d1ae25d7375abd5e5e70c3043d64f1f1, results HASH(0x55cd7b118748) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd 2b8314a3c354d04545700c80ff5a5f86799b79c7, results HASH(0x55cd7b12a780) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f\
 0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd 7056f2f89f03f2f804ac7e776c7b2b000cd716cd, results HASH(0x55cd799a5ae0) HASH(0x55cd7b11d380) Result found: flight 156524 (fail), for basis failure (at ancestor ~524)
 Repro found: flight 156626 (pass), for basis pass
 Repro found: flight 156627 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd c3453a23f7905d24f2404787543e26ec7d02301c
No revisions left to test, checking graph state.
 Result found: flight 156638 (pass), for last pass
 Result found: flight 156643 (fail), for first failure
 Repro found: flight 156651 (pass), for last pass
 Repro found: flight 156656 (fail), for first failure
 Repro found: flight 156661 (pass), for last pass
 Repro found: flight 156664 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  e19bcb626f50a652fb1854a8b2f2c9c371687a11
  Bug not present: c3453a23f7905d24f2404787543e26ec7d02301c
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/156664/


  commit e19bcb626f50a652fb1854a8b2f2c9c371687a11
  Author: Juergen Gross <jgross@suse.com>
  Date:   Fri Nov 6 10:48:07 2020 +0100
  
      xen/rwlock: add check_lock() handling to rwlocks
      
      Checking whether a lock is consistently used regarding interrupts on
      or off is beneficial for rwlocks, too.
      
      So add check_lock() calls to rwlock functions. For this purpose make
      check_lock() globally accessible.
      
      Signed-off-by: Juergen Gross <jgross@suse.com>
      Reviewed-by: Julien Grall <jgrall@amazon.com>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>

Revision graph left in /home/logs/results/bisect/xen-unstable/test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm.debian-hvm-install.{dot,ps,png,html,svg}.
----------------------------------------
156664: tolerable ALL FAIL

flight 156664 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/156664/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 12 debian-hvm-install fail baseline untested


jobs:
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        fail    


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


