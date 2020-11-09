Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8282AC825
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 23:16:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22931.49458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcFRs-0006ug-8Q; Mon, 09 Nov 2020 22:15:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22931.49458; Mon, 09 Nov 2020 22:15:40 +0000
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
	id 1kcFRs-0006uH-5K; Mon, 09 Nov 2020 22:15:40 +0000
Received: by outflank-mailman (input) for mailman id 22931;
 Mon, 09 Nov 2020 22:15:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=47vU=EP=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kcFRp-0006td-VS
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 22:15:37 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9cf0d240-05ae-4469-82a2-183f59073b7e;
 Mon, 09 Nov 2020 22:15:33 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kcFRl-0000U7-47; Mon, 09 Nov 2020 22:15:33 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kcFRk-0001ak-U3; Mon, 09 Nov 2020 22:15:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kcFRk-00085M-TY; Mon, 09 Nov 2020 22:15:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=47vU=EP=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kcFRp-0006td-VS
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 22:15:37 +0000
X-Inumbo-ID: 9cf0d240-05ae-4469-82a2-183f59073b7e
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 9cf0d240-05ae-4469-82a2-183f59073b7e;
	Mon, 09 Nov 2020 22:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
	bh=fMmWneM6nFvqAHlp41GqrknYVPZT8aF8Mo8bxYb1h1A=; b=19/o28MRhFbUsmp6bp72+M7syF
	oBUaXfIvi9fU10bgaQDtEXt7YsCTgpmpy0OiKm53uYieX/AHVWN41HQ7ZZSXs6kz1CaViqNFoMxfm
	T0nu4uu92c4aRP6ypWId95/Eai/3UX4uAElaO0rqAc9Zb0+PXNsR0Q7lEU3tijxWDaqA=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kcFRl-0000U7-47; Mon, 09 Nov 2020 22:15:33 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kcFRk-0001ak-U3; Mon, 09 Nov 2020 22:15:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kcFRk-00085M-TY; Mon, 09 Nov 2020 22:15:32 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable bisection] complete test-amd64-amd64-xl-xsm
Message-Id: <E1kcFRk-00085M-TY@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 09 Nov 2020 22:15:32 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-xl-xsm
testid guest-start

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  e19bcb626f50a652fb1854a8b2f2c9c371687a11
  Bug not present: c3453a23f7905d24f2404787543e26ec7d02301c
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/156601/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-amd64-amd64-xl-xsm.guest-start.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-amd64-amd64-xl-xsm.guest-start --summary-out=tmp/156601.bisection-summary --basis-template=156443 --blessings=real,real-bisect,real-retry xen-unstable test-amd64-amd64-xl-xsm guest-start
Searching for failure / basis pass:
 156577 fail [host=godello0] / 156443 [host=pinot1] 156401 [host=huxelrebe1] 156389 [host=fiano0] 156373 [host=albana1] 156354 [host=godello1] 156339 ok.
Failure / basis pass flights: 156577 / 156339
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd 0a5e0ce0fb7e5a3b5dfdc936058d2c0e04e5e258
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd 7056f2f89f03f2f804ac7e776c7b2b000cd716cd
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#677cbe1324c29294bb1d1b8454b3f21\
 4725e40fd-677cbe1324c29294bb1d1b8454b3f214725e40fd git://xenbits.xen.org/xen.git#7056f2f89f03f2f804ac7e776c7b2b000cd716cd-0a5e0ce0fb7e5a3b5dfdc936058d2c0e04e5e258
Loaded 5001 nodes in revision graph
Searching for test results:
 156331 [host=elbling0]
 156339 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd 7056f2f89f03f2f804ac7e776c7b2b000cd716cd
 156354 [host=godello1]
 156373 [host=albana1]
 156389 [host=fiano0]
 156401 [host=huxelrebe1]
 156443 [host=pinot1]
 156524 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd 2a5f9f6a6932214fda76b9b3c03e024772882d34
 156538 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd 0a5e0ce0fb7e5a3b5dfdc936058d2c0e04e5e258
 156556 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd 0a5e0ce0fb7e5a3b5dfdc936058d2c0e04e5e258
 156577 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd 0a5e0ce0fb7e5a3b5dfdc936058d2c0e04e5e258
 156587 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd 7056f2f89f03f2f804ac7e776c7b2b000cd716cd
 156589 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd 0a5e0ce0fb7e5a3b5dfdc936058d2c0e04e5e258
 156590 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd 2b8314a3c354d04545700c80ff5a5f86799b79c7
 156591 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd 957708c2d1ae25d7375abd5e5e70c3043d64f1f1
 156596 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd c3453a23f7905d24f2404787543e26ec7d02301c
 156597 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd e19bcb626f50a652fb1854a8b2f2c9c371687a11
 156598 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd c3453a23f7905d24f2404787543e26ec7d02301c
 156599 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd e19bcb626f50a652fb1854a8b2f2c9c371687a11
 156600 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd c3453a23f7905d24f2404787543e26ec7d02301c
 156601 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd e19bcb626f50a652fb1854a8b2f2c9c371687a11
Searching for interesting versions
 Result found: flight 156339 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd c3453a23f7905d24f2404787543e26ec7d02301c, results HASH(0x5654388d1fe0) HASH(0x5654388bee38) HASH(0x5654388e4f78) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe132\
 4c29294bb1d1b8454b3f214725e40fd 957708c2d1ae25d7375abd5e5e70c3043d64f1f1, results HASH(0x5654388e0ae8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd 2b8314a3c354d04545700c80ff5a5f86799b79c7, results HASH(0x5654388c1440) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f\
 0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd 7056f2f89f03f2f804ac7e776c7b2b000cd716cd, results HASH(0x5654388cedb0) HASH(0x5654388cbb20) Result found: flight 156524 (fail), for basis failure (at ancestor ~523)
 Repro found: flight 156587 (pass), for basis pass
 Repro found: flight 156589 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd c3453a23f7905d24f2404787543e26ec7d02301c
No revisions left to test, checking graph state.
 Result found: flight 156596 (pass), for last pass
 Result found: flight 156597 (fail), for first failure
 Repro found: flight 156598 (pass), for last pass
 Repro found: flight 156599 (fail), for first failure
 Repro found: flight 156600 (pass), for last pass
 Repro found: flight 156601 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  e19bcb626f50a652fb1854a8b2f2c9c371687a11
  Bug not present: c3453a23f7905d24f2404787543e26ec7d02301c
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/156601/


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

Revision graph left in /home/logs/results/bisect/xen-unstable/test-amd64-amd64-xl-xsm.guest-start.{dot,ps,png,html,svg}.
----------------------------------------
156601: tolerable ALL FAIL

flight 156601 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/156601/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-xl-xsm      14 guest-start             fail baseline untested


jobs:
 test-amd64-amd64-xl-xsm                                      fail    


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


