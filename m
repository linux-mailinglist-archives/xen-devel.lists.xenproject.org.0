Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA98280E3F
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 09:52:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1716.5226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOFr4-0004Rl-7Y; Fri, 02 Oct 2020 07:51:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1716.5226; Fri, 02 Oct 2020 07:51:50 +0000
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
	id 1kOFr4-0004RP-3s; Fri, 02 Oct 2020 07:51:50 +0000
Received: by outflank-mailman (input) for mailman id 1716;
 Fri, 02 Oct 2020 07:51:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6tcj=DJ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kOFr2-0004RK-O1
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 07:51:48 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f758e9c4-58ec-42d6-9a49-d1918a675825;
 Fri, 02 Oct 2020 07:51:46 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kOFqz-0000R8-V9; Fri, 02 Oct 2020 07:51:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kOFqz-0006Mg-OO; Fri, 02 Oct 2020 07:51:45 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kOFqz-0006mg-Nu; Fri, 02 Oct 2020 07:51:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=6tcj=DJ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kOFr2-0004RK-O1
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 07:51:48 +0000
X-Inumbo-ID: f758e9c4-58ec-42d6-9a49-d1918a675825
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f758e9c4-58ec-42d6-9a49-d1918a675825;
	Fri, 02 Oct 2020 07:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
	bh=yVOXgfQiPkTjcqX0202x8ue26jBgTY+17IWpX6HcTv0=; b=xKHlUmGR5xo5xA9qqGnhDvxiYl
	1Iv9CjPGbiqKcThY3TRw6mixkYCMZ6IYP5tQEsPvKoZp8eBxwhyJ/oy4D3C1P2rGmR4zxhs+pE9Oi
	NakVKXwsiJYf48HukjZHVo5vK+UOsEBzfPeB35sEAVT4rrx8PRbxTBM/8L+kTYMZJ87w=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kOFqz-0000R8-V9; Fri, 02 Oct 2020 07:51:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kOFqz-0006Mg-OO; Fri, 02 Oct 2020 07:51:45 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kOFqz-0006mg-Nu; Fri, 02 Oct 2020 07:51:45 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-4.13-testing bisection] complete test-amd64-amd64-xl-xsm
Message-Id: <E1kOFqz-0006mg-Nu@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 02 Oct 2020 07:51:45 +0000

branch xen-4.13-testing
xenbranch xen-4.13-testing
job test-amd64-amd64-xl-xsm
testid guest-start

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  21054297bf832d8eacd73dc428f55168522b0d86
  Bug not present: a8122e991da70ac1ee9f88e34e003d2169a5b114
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/155306/


  commit 21054297bf832d8eacd73dc428f55168522b0d86
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Tue Sep 22 16:26:01 2020 +0200
  
      evtchn: convert per-channel lock to be IRQ-safe
      
      ... in order for send_guest_{global,vcpu}_virq() to be able to make use
      of it.
      
      This is part of XSA-343.
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Acked-by: Julien Grall <jgrall@amazon.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.13-testing/test-amd64-amd64-xl-xsm.guest-start.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.13-testing/test-amd64-amd64-xl-xsm.guest-start --summary-out=tmp/155306.bisection-summary --basis-template=154358 --blessings=real,real-bisect xen-4.13-testing test-amd64-amd64-xl-xsm guest-start
Searching for failure / basis pass:
 155132 fail [host=albana1] / 154602 [host=rimava1] 154358 [host=godello1] 152528 ok.
Failure / basis pass flights: 155132 / 152528
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2793a49565488e419d10ba029c838f4b7efdba38 d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 88f5b414ac0f8008c1e2b26f93c3d980120941f7
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8834e10b30125daa47da9f6c5c1a41b4eafbae7f d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed d9c812dda519a1a73e8370e1b81ddf46eb22ed16 9b367b2b0b714f3ffb69ed6be0a118e8d3eac07f
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#8834e10b30125daa47da9f6c5c1a41b4eafbae7f-2793a49565488e419d10ba029c838f4b7efdba38 git://xenbits.xen.org/qemu-xen-traditional.git#d0d8ad39ecb51cd7497cd524484\
 fe09f50876798-d0d8ad39ecb51cd7497cd524484fe09f50876798 git://xenbits.xen.org/qemu-xen.git#730e2b1927e7d911bbd5350714054ddd5912f4ed-730e2b1927e7d911bbd5350714054ddd5912f4ed git://xenbits.xen.org/osstest/seabios.git#d9c812dda519a1a73e8370e1b81ddf46eb22ed16-41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 git://xenbits.xen.org/xen.git#9b367b2b0b714f3ffb69ed6be0a118e8d3eac07f-88f5b414ac0f8008c1e2b26f93c3d980120941f7
Loaded 12583 nodes in revision graph
Searching for test results:
 152528 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8834e10b30125daa47da9f6c5c1a41b4eafbae7f d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed d9c812dda519a1a73e8370e1b81ddf46eb22ed16 9b367b2b0b714f3ffb69ed6be0a118e8d3eac07f
 154358 [host=godello1]
 154602 [host=rimava1]
 154625 fail irrelevant
 154667 fail irrelevant
 155015 []
 155062 fail irrelevant
 155133 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8834e10b30125daa47da9f6c5c1a41b4eafbae7f d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed d9c812dda519a1a73e8370e1b81ddf46eb22ed16 9b367b2b0b714f3ffb69ed6be0a118e8d3eac07f
 155218 fail irrelevant
 155224 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7f0b28415cb464832155d5b3ff6eb63612f58645 d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 155821a1990b6de78dde5f98fa5ab90e802021e0 9b367b2b0b714f3ffb69ed6be0a118e8d3eac07f
 155229 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cdfc7ed34fd1ddfc9cb1dfbc339f940950638f8d d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 155821a1990b6de78dde5f98fa5ab90e802021e0 9b367b2b0b714f3ffb69ed6be0a118e8d3eac07f
 155242 pass irrelevant
 155247 pass irrelevant
 155132 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2793a49565488e419d10ba029c838f4b7efdba38 d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 88f5b414ac0f8008c1e2b26f93c3d980120941f7
 155256 pass irrelevant
 155261 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2793a49565488e419d10ba029c838f4b7efdba38 d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 88f5b414ac0f8008c1e2b26f93c3d980120941f7
 155266 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea9af51479fe04955443f0d366376a1008f07c94 d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 aa1d9a7dbfe07905f0b7218bcd433a513f762eb9
 155268 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 a8122e991da70ac1ee9f88e34e003d2169a5b114
 155272 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 dd5c7e3c5282b084daa5bbf0ec229cec699b2c17 d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 88f5b414ac0f8008c1e2b26f93c3d980120941f7
 155277 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 b015fbe509188dca47b6c7102a934a7b9ced2a9e
 155283 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 43572a4cd97902ba0155b922a4d2e99fb945ec2b
 155290 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 21054297bf832d8eacd73dc428f55168522b0d86
 155294 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 a8122e991da70ac1ee9f88e34e003d2169a5b114
 155297 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 21054297bf832d8eacd73dc428f55168522b0d86
 155302 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 a8122e991da70ac1ee9f88e34e003d2169a5b114
 155306 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 21054297bf832d8eacd73dc428f55168522b0d86
Searching for interesting versions
 Result found: flight 152528 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 a8122e991da70ac1ee9f88e34e003d2169a5b114, results HASH(0x56474c5b0d78) HASH(0x56474c5a9b38) HASH(0x56474c5b1e80) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1\
 e6a472b0eb9558310b518f0dfcd8860 ea9af51479fe04955443f0d366376a1008f07c94 d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 aa1d9a7dbfe07905f0b7218bcd433a513f762eb9, results HASH(0x56474c5aed70) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cdfc7ed34fd1ddfc9cb1dfbc339f940950638f8d d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd53507\
 14054ddd5912f4ed 155821a1990b6de78dde5f98fa5ab90e802021e0 9b367b2b0b714f3ffb69ed6be0a118e8d3eac07f, results HASH(0x56474c5a5680) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7f0b28415cb464832155d5b3ff6eb63612f58645 d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 155821a1990b6de78dde5f98fa5ab90e802021e0 9b367b2b0b714f3ffb69ed6be0a118e8d3eac07f, results HASH(0x56474c5a1670) For basis\
  failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8834e10b30125daa47da9f6c5c1a41b4eafbae7f d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed d9c812dda519a1a73e8370e1b81ddf46eb22ed16 9b367b2b0b714f3ffb69ed6be0a118e8d3eac07f, results HASH(0x56474c58f7b8) HASH(0x56474c589478) Result found: flight 155132 (fail), for basis failure (at ancestor ~1648)
 Repro found: flight 155133 (pass), for basis pass
 Repro found: flight 155261 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 a8122e991da70ac1ee9f88e34e003d2169a5b114
No revisions left to test, checking graph state.
 Result found: flight 155268 (pass), for last pass
 Result found: flight 155290 (fail), for first failure
 Repro found: flight 155294 (pass), for last pass
 Repro found: flight 155297 (fail), for first failure
 Repro found: flight 155302 (pass), for last pass
 Repro found: flight 155306 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  21054297bf832d8eacd73dc428f55168522b0d86
  Bug not present: a8122e991da70ac1ee9f88e34e003d2169a5b114
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/155306/


  commit 21054297bf832d8eacd73dc428f55168522b0d86
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Tue Sep 22 16:26:01 2020 +0200
  
      evtchn: convert per-channel lock to be IRQ-safe
      
      ... in order for send_guest_{global,vcpu}_virq() to be able to make use
      of it.
      
      This is part of XSA-343.
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Acked-by: Julien Grall <jgrall@amazon.com>

pnmtopng: 204 colors found
Revision graph left in /home/logs/results/bisect/xen-4.13-testing/test-amd64-amd64-xl-xsm.guest-start.{dot,ps,png,html,svg}.
----------------------------------------
155306: tolerable ALL FAIL

flight 155306 xen-4.13-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/155306/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-xl-xsm      12 guest-start             fail baseline untested


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


