Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAA928DB04
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 10:20:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6496.17332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSc1B-0008Qf-BD; Wed, 14 Oct 2020 08:20:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6496.17332; Wed, 14 Oct 2020 08:20:17 +0000
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
	id 1kSc1B-0008QG-7p; Wed, 14 Oct 2020 08:20:17 +0000
Received: by outflank-mailman (input) for mailman id 6496;
 Wed, 14 Oct 2020 08:20:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mg0A=DV=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kSc1A-0008PY-7F
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 08:20:16 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0daa6452-db51-4387-822e-75ba7ada142e;
 Wed, 14 Oct 2020 08:20:08 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kSc11-0007En-LV; Wed, 14 Oct 2020 08:20:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kSc11-0006wO-E4; Wed, 14 Oct 2020 08:20:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kSc11-0001W5-Dc; Wed, 14 Oct 2020 08:20:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=mg0A=DV=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kSc1A-0008PY-7F
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 08:20:16 +0000
X-Inumbo-ID: 0daa6452-db51-4387-822e-75ba7ada142e
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0daa6452-db51-4387-822e-75ba7ada142e;
	Wed, 14 Oct 2020 08:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
	bh=WzJQ33+E7/n4t96AwyAi1dQagpjDh/T02/jVVZxmMZM=; b=Zy3VTdFaAe/AoHc+s/WqtYQQFE
	3EezaPiDnbvCAt1idGXPtBM1VMvjNPYzSGX1d4eb8De/1fvBkz1qdeH5haYcr0yocf3aLJRdtHpum
	LQv+0A0co/4dyMTTDR8QbcKPkAGQYGlCMhucK5nfZ1+wUjo16WXupIhDkj3PLWP/pmg8=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kSc11-0007En-LV; Wed, 14 Oct 2020 08:20:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kSc11-0006wO-E4; Wed, 14 Oct 2020 08:20:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kSc11-0001W5-Dc; Wed, 14 Oct 2020 08:20:07 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [qemu-mainline bisection] complete test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm
Message-Id: <E1kSc11-0001W5-Dc@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 14 Oct 2020 08:20:07 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm
testid debian-hvm-install

Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  c0ddc8634845aba50774add6e4b73fdaffc82656
  Bug not present: 8d385b247bca40ece40c9279391054bc98934325
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/155797/


  commit c0ddc8634845aba50774add6e4b73fdaffc82656
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Tue Sep 22 15:51:28 2020 +0200
  
      evtchn: convert per-channel lock to be IRQ-safe
      
      ... in order for send_guest_{global,vcpu}_virq() to be able to make use
      of it.
      
      This is part of XSA-343.
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Acked-by: Julien Grall <jgrall@amazon.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm.debian-hvm-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm.debian-hvm-install --summary-out=tmp/155797.bisection-summary --basis-template=152631 --blessings=real,real-bisect qemu-mainline test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm debian-hvm-install
Searching for failure / basis pass:
 155769 fail [host=elbling0] / 155509 [host=huxelrebe0] 155483 [host=albana0] 155434 [host=godello1] 155318 [host=godello0] 155184 [host=albana1] 155098 [host=rimava1] 155018 [host=fiano1] 154629 [host=elbling1] 154607 [host=pinot0] 154583 ok.
Failure / basis pass flights: 155769 / 154583
(tree with no url: minios)
Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5d1af380d3e4bd840fa324db33ca4f739136e654 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a0bdf866873467271eff9a92f179ab0f77d735cb 849c5e50b6f474df6cc113130575bcdccfafcd9e 25849c8b16f2a5b7fcd0a823e80a5f1b590291f9
Basis pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea9af51479fe04955443f0d366376a1008f07c94 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 5df6c87e8080e0021e975c8387baa20cfe43c932 155821a1990b6de78dde5f98fa5ab90e802021e0 baa4d064e91b6d2bcfe400bdf71f83b961e4c28e
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/libvirt.git#2c846fa6bcc11929c9fb857a22430fb9945654ad-2c846fa6bcc11929c9fb857a22430fb9945654ad https://gitlab.com/keycodemap/keycodemapdb.git#27acf0ef828bf719b2053ba398b195829413dbdd-27acf0ef828bf719b2053ba398b195829413dbdd git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0\
 dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#ea9af51479fe04955443f0d366376a1008f07c94-5d1af380d3e4bd840fa324db33ca4f739136e654 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://git.qemu.org/qemu.git#5df6c87e8080e0021e975c8387baa20cfe43c932-a0bdf866873467271eff9a92f179ab0f77d735cb git://xenbits.xen.org/osstest/seabios.git#155821a1990b6de78dde5f98fa5ab90e802021e0-849c5e5\
 0b6f474df6cc113130575bcdccfafcd9e git://xenbits.xen.org/xen.git#baa4d064e91b6d2bcfe400bdf71f83b961e4c28e-25849c8b16f2a5b7fcd0a823e80a5f1b590291f9
Loaded 43053 nodes in revision graph
Searching for test results:
 154583 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea9af51479fe04955443f0d366376a1008f07c94 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 5df6c87e8080e0021e975c8387baa20cfe43c932 155821a1990b6de78dde5f98fa5ab90e802021e0 baa4d064e91b6d2bcfe400bdf71f83b961e4c28e
 154607 [host=pinot0]
 154629 [host=elbling1]
 155018 [host=fiano1]
 155098 [host=rimava1]
 155184 [host=albana1]
 155318 [host=godello0]
 155434 [host=godello1]
 155483 [host=albana0]
 155509 [host=huxelrebe0]
 155518 fail irrelevant
 155544 fail irrelevant
 155585 fail irrelevant
 155613 fail irrelevant
 155645 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 70c2f10fde5b67b0d7d62ba7ea3271fc514ebcc4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4a7c0bd9dcb08798c6f82e55b5a3423f7ee669f1 849c5e50b6f474df6cc113130575bcdccfafcd9e 25849c8b16f2a5b7fcd0a823e80a5f1b590291f9
 155665 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ae511331e0fb1625ba649f377e81e487de3a5531 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4a7c0bd9dcb08798c6f82e55b5a3423f7ee669f1 849c5e50b6f474df6cc113130575bcdccfafcd9e 25849c8b16f2a5b7fcd0a823e80a5f1b590291f9
 155675 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ae511331e0fb1625ba649f377e81e487de3a5531 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4a7c0bd9dcb08798c6f82e55b5a3423f7ee669f1 849c5e50b6f474df6cc113130575bcdccfafcd9e 25849c8b16f2a5b7fcd0a823e80a5f1b590291f9
 155695 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ae511331e0fb1625ba649f377e81e487de3a5531 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4a7c0bd9dcb08798c6f82e55b5a3423f7ee669f1 849c5e50b6f474df6cc113130575bcdccfafcd9e 25849c8b16f2a5b7fcd0a823e80a5f1b590291f9
 155703 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ae511331e0fb1625ba649f377e81e487de3a5531 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 48a340d9b23ffcf7704f2de14d1e505481a84a1c 849c5e50b6f474df6cc113130575bcdccfafcd9e 25849c8b16f2a5b7fcd0a823e80a5f1b590291f9
 155713 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ae511331e0fb1625ba649f377e81e487de3a5531 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 48a340d9b23ffcf7704f2de14d1e505481a84a1c 849c5e50b6f474df6cc113130575bcdccfafcd9e 25849c8b16f2a5b7fcd0a823e80a5f1b590291f9
 155732 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea9af51479fe04955443f0d366376a1008f07c94 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 5df6c87e8080e0021e975c8387baa20cfe43c932 155821a1990b6de78dde5f98fa5ab90e802021e0 baa4d064e91b6d2bcfe400bdf71f83b961e4c28e
 155733 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ae511331e0fb1625ba649f377e81e487de3a5531 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 48a340d9b23ffcf7704f2de14d1e505481a84a1c 849c5e50b6f474df6cc113130575bcdccfafcd9e 25849c8b16f2a5b7fcd0a823e80a5f1b590291f9
 155735 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 70c2f10fde5b67b0d7d62ba7ea3271fc514ebcc4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 eb94b81a94bce112e6b206df846c1551aaf6cab6 849c5e50b6f474df6cc113130575bcdccfafcd9e 25849c8b16f2a5b7fcd0a823e80a5f1b590291f9
 155729 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ae511331e0fb1625ba649f377e81e487de3a5531 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 48a340d9b23ffcf7704f2de14d1e505481a84a1c 849c5e50b6f474df6cc113130575bcdccfafcd9e 25849c8b16f2a5b7fcd0a823e80a5f1b590291f9
 155738 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 69e95b9efed520e643b9e5b0573180aa7c5ecaca 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a1d22c668a7662289b42624fe2aa92c9a23df1d2 849c5e50b6f474df6cc113130575bcdccfafcd9e 0241809bf838875615797f52af34222e5ab8e98f
 155742 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d8ca4f90eaeb61bd7e9903b56bf412f0d187137 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 f2687fdb7571a444b5af3509574b659d35ddd601 849c5e50b6f474df6cc113130575bcdccfafcd9e 93508595d588afe9dca087f95200effb7cedc81f
 155746 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d8ca4f90eaeb61bd7e9903b56bf412f0d187137 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 671ad7c4468f795b66b4cd8f376f1b1ce6701b63 849c5e50b6f474df6cc113130575bcdccfafcd9e 8ef6345ef557cc2c47298217635a3088eaa59893
 155747 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d8ca4f90eaeb61bd7e9903b56bf412f0d187137 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 36d9c2883e55c863b622b99f0ebb5143f0001401 849c5e50b6f474df6cc113130575bcdccfafcd9e 8ef6345ef557cc2c47298217635a3088eaa59893
 155749 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d8ca4f90eaeb61bd7e9903b56bf412f0d187137 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0d2a4545bf7e763984d3ee3e802617544cb7fc7a 849c5e50b6f474df6cc113130575bcdccfafcd9e 59b27f360e3d9dc0378c1288e67a91fa41a77158
 155750 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d8ca4f90eaeb61bd7e9903b56bf412f0d187137 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b23317eec4715aa62de9a6e5490a01122c8eef0e 849c5e50b6f474df6cc113130575bcdccfafcd9e bdb380e1dbdc6b76576ab6db0b8e946cc95edc1c
 155752 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d8ab884fe9b4dd148980bf0d8673187f8fb25887 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d17f305a2649fccdc50956b3381456a8fd318903 849c5e50b6f474df6cc113130575bcdccfafcd9e 11852c7bb070a18c3708b4c001772a23e7d4fc27
 155743 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cc942105ede58a300ba46f3df0edfa86b3abd4dd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a0bdf866873467271eff9a92f179ab0f77d735cb 849c5e50b6f474df6cc113130575bcdccfafcd9e 25849c8b16f2a5b7fcd0a823e80a5f1b590291f9
 155753 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 52dbaaeace647961bae61634c4be49ea2ca3d5cd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7cd77fb02b9a2117a56fed172f09a1820fcd6b0b 41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 5dba8c2f23049aa68b777a9e7e9f76c12dd00012
 155755 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea9af51479fe04955443f0d366376a1008f07c94 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 5df6c87e8080e0021e975c8387baa20cfe43c932 155821a1990b6de78dde5f98fa5ab90e802021e0 baa4d064e91b6d2bcfe400bdf71f83b961e4c28e
 155761 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cc942105ede58a300ba46f3df0edfa86b3abd4dd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a0bdf866873467271eff9a92f179ab0f77d735cb 849c5e50b6f474df6cc113130575bcdccfafcd9e 25849c8b16f2a5b7fcd0a823e80a5f1b590291f9
 155764 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 52dbaaeace647961bae61634c4be49ea2ca3d5cd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 213057383c9f73a17cfe635b204d88e11f918df1 41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 358d57d411ee759a5a9dbf367179a9ac37faf0b3
 155766 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1d058c3e86b079a2e207bb022fd7a97814c9a04f 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 92d09502676678c8ebb1ad830666b323d3c88f9d 41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 4bdbf746ac9152e70f264f87db4472707da805ce
 155754 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cc942105ede58a300ba46f3df0edfa86b3abd4dd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a0bdf866873467271eff9a92f179ab0f77d735cb 849c5e50b6f474df6cc113130575bcdccfafcd9e 25849c8b16f2a5b7fcd0a823e80a5f1b590291f9
 155767 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1d058c3e86b079a2e207bb022fd7a97814c9a04f 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d8053e73fb2d295279b5cc4de7dc06bd581241ca 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 5bcac985498ed83d89666959175ca9c9ed561ae1
 155771 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 dd5c7e3c5282b084daa5bbf0ec229cec699b2c17 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 f7f1d916b22306c35ab9c090aab5233a91b4b7f9 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 5a37207df52066efefe419c677b089a654d37afc
 155776 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 dd5c7e3c5282b084daa5bbf0ec229cec699b2c17 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0fc0142828b5bc965790a1c5c6e241897d3387cb 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 a6732807d335239fc29bd953538affc458bcc197
 155780 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea9af51479fe04955443f0d366376a1008f07c94 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4dad0a9aa818698e0735c8352bf7925a1660df6f 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 910093d54fc758e7d69261b344fdc8da3a7bd81e
 155781 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 00b51fcb1ed7d2d5c2ea2f7dc598187d17c6f2e1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4dad0a9aa818698e0735c8352bf7925a1660df6f 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 2785b2a9e04abc148e1c5259f4faee708ea356f4
 155783 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea9af51479fe04955443f0d366376a1008f07c94 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4dad0a9aa818698e0735c8352bf7925a1660df6f 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 e045199c7c9c5433d7f1461a741ed539a75cbfad
 155769 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5d1af380d3e4bd840fa324db33ca4f739136e654 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a0bdf866873467271eff9a92f179ab0f77d735cb 849c5e50b6f474df6cc113130575bcdccfafcd9e 25849c8b16f2a5b7fcd0a823e80a5f1b590291f9
 155784 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea9af51479fe04955443f0d366376a1008f07c94 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4dad0a9aa818698e0735c8352bf7925a1660df6f 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 62bcdc4edbf6d8c6e8a25544d48de22ccf75310d
 155787 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea9af51479fe04955443f0d366376a1008f07c94 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4dad0a9aa818698e0735c8352bf7925a1660df6f 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 8d385b247bca40ece40c9279391054bc98934325
 155789 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea9af51479fe04955443f0d366376a1008f07c94 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4dad0a9aa818698e0735c8352bf7925a1660df6f 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 c0ddc8634845aba50774add6e4b73fdaffc82656
 155792 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea9af51479fe04955443f0d366376a1008f07c94 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4dad0a9aa818698e0735c8352bf7925a1660df6f 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 8d385b247bca40ece40c9279391054bc98934325
 155794 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea9af51479fe04955443f0d366376a1008f07c94 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4dad0a9aa818698e0735c8352bf7925a1660df6f 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 c0ddc8634845aba50774add6e4b73fdaffc82656
 155795 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea9af51479fe04955443f0d366376a1008f07c94 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4dad0a9aa818698e0735c8352bf7925a1660df6f 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 8d385b247bca40ece40c9279391054bc98934325
 155797 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea9af51479fe04955443f0d366376a1008f07c94 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4dad0a9aa818698e0735c8352bf7925a1660df6f 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 c0ddc8634845aba50774add6e4b73fdaffc82656
Searching for interesting versions
 Result found: flight 154583 (pass), for basis pass
 Result found: flight 155743 (fail), for basis failure (at ancestor ~2)
 Repro found: flight 155755 (pass), for basis pass
 Repro found: flight 155769 (fail), for basis failure
 0 revisions at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea9af51479fe04955443f0d366376a1008f07c94 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4dad0a9aa818698e0735c8352bf7925a1660df6f 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 8d385b247bca40ece40c9279391054bc98934325
No revisions left to test, checking graph state.
 Result found: flight 155787 (pass), for last pass
 Result found: flight 155789 (fail), for first failure
 Repro found: flight 155792 (pass), for last pass
 Repro found: flight 155794 (fail), for first failure
 Repro found: flight 155795 (pass), for last pass
 Repro found: flight 155797 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  c0ddc8634845aba50774add6e4b73fdaffc82656
  Bug not present: 8d385b247bca40ece40c9279391054bc98934325
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/155797/


  commit c0ddc8634845aba50774add6e4b73fdaffc82656
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Tue Sep 22 15:51:28 2020 +0200
  
      evtchn: convert per-channel lock to be IRQ-safe
      
      ... in order for send_guest_{global,vcpu}_virq() to be able to make use
      of it.
      
      This is part of XSA-343.
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Acked-by: Julien Grall <jgrall@amazon.com>

neato: graph is too large for cairo-renderer bitmaps. Scaling by 0.985918 to fit
Revision graph left in /home/logs/results/bisect/qemu-mainline/test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm.debian-hvm-install.{dot,ps,png,html,svg}.
----------------------------------------
155797: tolerable FAIL

flight 155797 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/155797/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 12 debian-hvm-install fail baseline untested


jobs:
 build-amd64-libvirt                                          pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           fail    


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


