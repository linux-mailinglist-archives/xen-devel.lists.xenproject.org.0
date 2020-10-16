Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A2B2906A6
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 15:54:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8113.21604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTQB9-0001RZ-Hu; Fri, 16 Oct 2020 13:53:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8113.21604; Fri, 16 Oct 2020 13:53:55 +0000
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
	id 1kTQB9-0001RA-E1; Fri, 16 Oct 2020 13:53:55 +0000
Received: by outflank-mailman (input) for mailman id 8113;
 Fri, 16 Oct 2020 13:53:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VcLu=DX=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kTQB8-0001Qi-OF
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 13:53:54 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4151deba-641f-4f03-8836-a66359002be2;
 Fri, 16 Oct 2020 13:53:46 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kTQAz-0005gB-Sf; Fri, 16 Oct 2020 13:53:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kTQAz-0000Y1-JI; Fri, 16 Oct 2020 13:53:45 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kTQAz-0001gT-Io; Fri, 16 Oct 2020 13:53:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VcLu=DX=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kTQB8-0001Qi-OF
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 13:53:54 +0000
X-Inumbo-ID: 4151deba-641f-4f03-8836-a66359002be2
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4151deba-641f-4f03-8836-a66359002be2;
	Fri, 16 Oct 2020 13:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
	bh=15YDlMFwxq5N6+8TQ8n5wZ7exQRU7DRqfSrQ1/dO74E=; b=Xxvldl95t61IAvTYCT6O5leV8e
	3h8L+aHHFWvrm3s+1uwVZ6E3I5Yahyb+Xwz21k7myy+gR3UlPZ5+z07htdL9kmpA5JuyG1Uau0BRO
	hf2sY2seyvkQ+Ai4dxUAUTGEbZ8VvtwTohOddDzm/MUnRAGcqtdw4c0485CyJb4HvUQE=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kTQAz-0005gB-Sf; Fri, 16 Oct 2020 13:53:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kTQAz-0000Y1-JI; Fri, 16 Oct 2020 13:53:45 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kTQAz-0001gT-Io; Fri, 16 Oct 2020 13:53:45 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [qemu-mainline bisection] complete test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm
Message-Id: <E1kTQAz-0001gT-Io@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 16 Oct 2020 13:53:45 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/155896/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm.debian-hvm-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm.debian-hvm-install --summary-out=tmp/155896.bisection-summary --basis-template=152631 --blessings=real,real-bisect qemu-mainline test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm debian-hvm-install
Searching for failure / basis pass:
 155877 fail [host=albana1] / 155509 [host=fiano0] 155483 [host=rimava1] 155434 [host=chardonnay1] 155318 [host=huxelrebe0] 155184 [host=albana0] 155098 [host=elbling1] 155018 [host=chardonnay0] 154629 [host=fiano0] 154607 [host=rimava1] 154583 ok.
Failure / basis pass flights: 155877 / 154583
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
Latest 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 19c87b7d446c3273e84b238cb02cd1c0ae69c43e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e545512b5e26f1e69fcd4c88df3c12853946dcdb 58a44be024f69d2e4d2b58553529230abdd3935e 25849c8b16f2a5b7fcd0a823e80a5f1b590291f9
Basis pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea9af51479fe04955443f0d366376a1008f07c94 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 5df6c87e8080e0021e975c8387baa20cfe43c932 155821a1990b6de78dde5f98fa5ab90e802021e0 baa4d064e91b6d2bcfe400bdf71f83b961e4c28e
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/libvirt.git#2c846fa6bcc11929c9fb857a22430fb9945654ad-2c846fa6bcc11929c9fb857a22430fb9945654ad https://gitlab.com/keycodemap/keycodemapdb.git#27acf0ef828bf719b2053ba398b195829413dbdd-27acf0ef828bf719b2053ba398b195829413dbdd git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0\
 dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#ea9af51479fe04955443f0d366376a1008f07c94-19c87b7d446c3273e84b238cb02cd1c0ae69c43e git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://git.qemu.org/qemu.git#5df6c87e8080e0021e975c8387baa20cfe43c932-e545512b5e26f1e69fcd4c88df3c12853946dcdb git://xenbits.xen.org/osstest/seabios.git#155821a1990b6de78dde5f98fa5ab90e802021e0-58a44be\
 024f69d2e4d2b58553529230abdd3935e git://xenbits.xen.org/xen.git#baa4d064e91b6d2bcfe400bdf71f83b961e4c28e-25849c8b16f2a5b7fcd0a823e80a5f1b590291f9
From git://cache:9419/git://xenbits.xen.org/xen
   a7952a320c..0dfddb2116  staging    -> origin/staging
Loaded 43070 nodes in revision graph
Searching for test results:
 154583 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea9af51479fe04955443f0d366376a1008f07c94 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 5df6c87e8080e0021e975c8387baa20cfe43c932 155821a1990b6de78dde5f98fa5ab90e802021e0 baa4d064e91b6d2bcfe400bdf71f83b961e4c28e
 154607 [host=rimava1]
 154629 [host=fiano0]
 155018 [host=chardonnay0]
 155098 [host=elbling1]
 155184 [host=albana0]
 155318 [host=huxelrebe0]
 155434 [host=chardonnay1]
 155483 [host=rimava1]
 155509 [host=fiano0]
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
 155729 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ae511331e0fb1625ba649f377e81e487de3a5531 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 48a340d9b23ffcf7704f2de14d1e505481a84a1c 849c5e50b6f474df6cc113130575bcdccfafcd9e 25849c8b16f2a5b7fcd0a823e80a5f1b590291f9
 155743 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cc942105ede58a300ba46f3df0edfa86b3abd4dd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a0bdf866873467271eff9a92f179ab0f77d735cb 849c5e50b6f474df6cc113130575bcdccfafcd9e 25849c8b16f2a5b7fcd0a823e80a5f1b590291f9
 155754 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cc942105ede58a300ba46f3df0edfa86b3abd4dd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a0bdf866873467271eff9a92f179ab0f77d735cb 849c5e50b6f474df6cc113130575bcdccfafcd9e 25849c8b16f2a5b7fcd0a823e80a5f1b590291f9
 155769 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5d1af380d3e4bd840fa324db33ca4f739136e654 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a0bdf866873467271eff9a92f179ab0f77d735cb 849c5e50b6f474df6cc113130575bcdccfafcd9e 25849c8b16f2a5b7fcd0a823e80a5f1b590291f9
 155785 fail irrelevant
 155798 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea9af51479fe04955443f0d366376a1008f07c94 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 5df6c87e8080e0021e975c8387baa20cfe43c932 155821a1990b6de78dde5f98fa5ab90e802021e0 baa4d064e91b6d2bcfe400bdf71f83b961e4c28e
 155803 fail irrelevant
 155804 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 70c2f10fde5b67b0d7d62ba7ea3271fc514ebcc4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 eb94b81a94bce112e6b206df846c1551aaf6cab6 849c5e50b6f474df6cc113130575bcdccfafcd9e 25849c8b16f2a5b7fcd0a823e80a5f1b590291f9
 155808 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 69e95b9efed520e643b9e5b0573180aa7c5ecaca 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a1d22c668a7662289b42624fe2aa92c9a23df1d2 849c5e50b6f474df6cc113130575bcdccfafcd9e 0241809bf838875615797f52af34222e5ab8e98f
 155812 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d8ca4f90eaeb61bd7e9903b56bf412f0d187137 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 f2687fdb7571a444b5af3509574b659d35ddd601 849c5e50b6f474df6cc113130575bcdccfafcd9e 93508595d588afe9dca087f95200effb7cedc81f
 155813 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d8ca4f90eaeb61bd7e9903b56bf412f0d187137 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 671ad7c4468f795b66b4cd8f376f1b1ce6701b63 849c5e50b6f474df6cc113130575bcdccfafcd9e 8ef6345ef557cc2c47298217635a3088eaa59893
 155802 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9380177354387f03c8ff9eadb7ae94aa453b9469 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 96292515c07e3a99f5a29540ed2f257b1ff75111 c685fe3ff2d402caefc1487d99bb486c4a510b8b 25849c8b16f2a5b7fcd0a823e80a5f1b590291f9
 155817 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d8ca4f90eaeb61bd7e9903b56bf412f0d187137 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 36d9c2883e55c863b622b99f0ebb5143f0001401 849c5e50b6f474df6cc113130575bcdccfafcd9e 8ef6345ef557cc2c47298217635a3088eaa59893
 155820 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea9af51479fe04955443f0d366376a1008f07c94 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 5df6c87e8080e0021e975c8387baa20cfe43c932 155821a1990b6de78dde5f98fa5ab90e802021e0 baa4d064e91b6d2bcfe400bdf71f83b961e4c28e
 155824 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9380177354387f03c8ff9eadb7ae94aa453b9469 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 96292515c07e3a99f5a29540ed2f257b1ff75111 c685fe3ff2d402caefc1487d99bb486c4a510b8b 25849c8b16f2a5b7fcd0a823e80a5f1b590291f9
 155827 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d8ca4f90eaeb61bd7e9903b56bf412f0d187137 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0d2a4545bf7e763984d3ee3e802617544cb7fc7a 849c5e50b6f474df6cc113130575bcdccfafcd9e 59b27f360e3d9dc0378c1288e67a91fa41a77158
 155830 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d8ca4f90eaeb61bd7e9903b56bf412f0d187137 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b23317eec4715aa62de9a6e5490a01122c8eef0e 849c5e50b6f474df6cc113130575bcdccfafcd9e bdb380e1dbdc6b76576ab6db0b8e946cc95edc1c
 155835 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d8ab884fe9b4dd148980bf0d8673187f8fb25887 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d17f305a2649fccdc50956b3381456a8fd318903 849c5e50b6f474df6cc113130575bcdccfafcd9e 11852c7bb070a18c3708b4c001772a23e7d4fc27
 155836 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 52dbaaeace647961bae61634c4be49ea2ca3d5cd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7cd77fb02b9a2117a56fed172f09a1820fcd6b0b 41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 5dba8c2f23049aa68b777a9e7e9f76c12dd00012
 155819 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5d0a827122cccd1f884faf75b2a065d88a58bce1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 57c98ea9acdcef5021f5671efa6475a5794a51c4 c685fe3ff2d402caefc1487d99bb486c4a510b8b 25849c8b16f2a5b7fcd0a823e80a5f1b590291f9
 155838 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 52dbaaeace647961bae61634c4be49ea2ca3d5cd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 213057383c9f73a17cfe635b204d88e11f918df1 41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 358d57d411ee759a5a9dbf367179a9ac37faf0b3
 155840 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5d0a827122cccd1f884faf75b2a065d88a58bce1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 57c98ea9acdcef5021f5671efa6475a5794a51c4 c685fe3ff2d402caefc1487d99bb486c4a510b8b 25849c8b16f2a5b7fcd0a823e80a5f1b590291f9
 155843 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1d058c3e86b079a2e207bb022fd7a97814c9a04f 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 92d09502676678c8ebb1ad830666b323d3c88f9d 41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 4bdbf746ac9152e70f264f87db4472707da805ce
 155845 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1d058c3e86b079a2e207bb022fd7a97814c9a04f 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d8053e73fb2d295279b5cc4de7dc06bd581241ca 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 5bcac985498ed83d89666959175ca9c9ed561ae1
 155883 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea9af51479fe04955443f0d366376a1008f07c94 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4dad0a9aa818698e0735c8352bf7925a1660df6f 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 c0ddc8634845aba50774add6e4b73fdaffc82656
 155860 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 dd5c7e3c5282b084daa5bbf0ec229cec699b2c17 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 f7f1d916b22306c35ab9c090aab5233a91b4b7f9 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 5a37207df52066efefe419c677b089a654d37afc
 155864 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 dd5c7e3c5282b084daa5bbf0ec229cec699b2c17 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0fc0142828b5bc965790a1c5c6e241897d3387cb 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 a6732807d335239fc29bd953538affc458bcc197
 155866 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea9af51479fe04955443f0d366376a1008f07c94 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4dad0a9aa818698e0735c8352bf7925a1660df6f 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 910093d54fc758e7d69261b344fdc8da3a7bd81e
 155870 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 00b51fcb1ed7d2d5c2ea2f7dc598187d17c6f2e1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4dad0a9aa818698e0735c8352bf7925a1660df6f 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 2785b2a9e04abc148e1c5259f4faee708ea356f4
 155841 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b9b7406c43e9d29bde3e9679c1b039cb91109097 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 57c98ea9acdcef5021f5671efa6475a5794a51c4 c685fe3ff2d402caefc1487d99bb486c4a510b8b 25849c8b16f2a5b7fcd0a823e80a5f1b590291f9
 155876 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea9af51479fe04955443f0d366376a1008f07c94 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4dad0a9aa818698e0735c8352bf7925a1660df6f 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 e045199c7c9c5433d7f1461a741ed539a75cbfad
 155878 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea9af51479fe04955443f0d366376a1008f07c94 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4dad0a9aa818698e0735c8352bf7925a1660df6f 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 62bcdc4edbf6d8c6e8a25544d48de22ccf75310d
 155879 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea9af51479fe04955443f0d366376a1008f07c94 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4dad0a9aa818698e0735c8352bf7925a1660df6f 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 8d385b247bca40ece40c9279391054bc98934325
 155884 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea9af51479fe04955443f0d366376a1008f07c94 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4dad0a9aa818698e0735c8352bf7925a1660df6f 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 8d385b247bca40ece40c9279391054bc98934325
 155877 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 19c87b7d446c3273e84b238cb02cd1c0ae69c43e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e545512b5e26f1e69fcd4c88df3c12853946dcdb 58a44be024f69d2e4d2b58553529230abdd3935e 25849c8b16f2a5b7fcd0a823e80a5f1b590291f9
 155887 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea9af51479fe04955443f0d366376a1008f07c94 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4dad0a9aa818698e0735c8352bf7925a1660df6f 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 c0ddc8634845aba50774add6e4b73fdaffc82656
 155889 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea9af51479fe04955443f0d366376a1008f07c94 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 5df6c87e8080e0021e975c8387baa20cfe43c932 155821a1990b6de78dde5f98fa5ab90e802021e0 baa4d064e91b6d2bcfe400bdf71f83b961e4c28e
 155890 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 19c87b7d446c3273e84b238cb02cd1c0ae69c43e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e545512b5e26f1e69fcd4c88df3c12853946dcdb 58a44be024f69d2e4d2b58553529230abdd3935e 25849c8b16f2a5b7fcd0a823e80a5f1b590291f9
 155893 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea9af51479fe04955443f0d366376a1008f07c94 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4dad0a9aa818698e0735c8352bf7925a1660df6f 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 8d385b247bca40ece40c9279391054bc98934325
 155896 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea9af51479fe04955443f0d366376a1008f07c94 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4dad0a9aa818698e0735c8352bf7925a1660df6f 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 c0ddc8634845aba50774add6e4b73fdaffc82656
Searching for interesting versions
 Result found: flight 154583 (pass), for basis pass
 Result found: flight 155877 (fail), for basis failure
 Repro found: flight 155889 (pass), for basis pass
 Repro found: flight 155890 (fail), for basis failure
 0 revisions at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea9af51479fe04955443f0d366376a1008f07c94 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4dad0a9aa818698e0735c8352bf7925a1660df6f 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 8d385b247bca40ece40c9279391054bc98934325
No revisions left to test, checking graph state.
 Result found: flight 155879 (pass), for last pass
 Result found: flight 155883 (fail), for first failure
 Repro found: flight 155884 (pass), for last pass
 Repro found: flight 155887 (fail), for first failure
 Repro found: flight 155893 (pass), for last pass
 Repro found: flight 155896 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  c0ddc8634845aba50774add6e4b73fdaffc82656
  Bug not present: 8d385b247bca40ece40c9279391054bc98934325
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/155896/


  commit c0ddc8634845aba50774add6e4b73fdaffc82656
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Tue Sep 22 15:51:28 2020 +0200
  
      evtchn: convert per-channel lock to be IRQ-safe
      
      ... in order for send_guest_{global,vcpu}_virq() to be able to make use
      of it.
      
      This is part of XSA-343.
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Acked-by: Julien Grall <jgrall@amazon.com>

neato: graph is too large for cairo-renderer bitmaps. Scaling by 0.884447 to fit
Revision graph left in /home/logs/results/bisect/qemu-mainline/test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm.debian-hvm-install.{dot,ps,png,html,svg}.
----------------------------------------
155896: tolerable FAIL

flight 155896 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/155896/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 12 debian-hvm-install fail baseline untested


jobs:
 build-i386-libvirt                                           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            fail    


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


