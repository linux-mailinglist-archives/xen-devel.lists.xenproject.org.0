Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D89232829B7
	for <lists+xen-devel@lfdr.de>; Sun,  4 Oct 2020 10:57:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2714.7748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOzoD-0000vB-8V; Sun, 04 Oct 2020 08:55:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2714.7748; Sun, 04 Oct 2020 08:55:57 +0000
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
	id 1kOzoD-0000uk-4a; Sun, 04 Oct 2020 08:55:57 +0000
Received: by outflank-mailman (input) for mailman id 2714;
 Sun, 04 Oct 2020 08:55:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vMX8=DL=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kOzoB-0000uc-Nd
 for xen-devel@lists.xenproject.org; Sun, 04 Oct 2020 08:55:55 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a6e54246-e83a-4df2-89c2-e6b4ed23ce91;
 Sun, 04 Oct 2020 08:55:52 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kOzo8-0000nR-GN; Sun, 04 Oct 2020 08:55:52 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kOzo8-0005Qz-8Z; Sun, 04 Oct 2020 08:55:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kOzo8-0005qK-85; Sun, 04 Oct 2020 08:55:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=vMX8=DL=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kOzoB-0000uc-Nd
	for xen-devel@lists.xenproject.org; Sun, 04 Oct 2020 08:55:55 +0000
X-Inumbo-ID: a6e54246-e83a-4df2-89c2-e6b4ed23ce91
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a6e54246-e83a-4df2-89c2-e6b4ed23ce91;
	Sun, 04 Oct 2020 08:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
	bh=DyFXYlhgrHzMynMjPRP65FAD4rOzFOXYUGxRST5Pcpo=; b=KhddgY8AuoptCjbDTTtBs3mtCm
	+NJU5S3U/GVOiGM3VcwrCkZw1133Dh9sFAUSf22BQW40HD/22fUZGRTSWiwr83zXVEAgQLl397akA
	L5YFmMRucbRo/bOygnnSNJtaqe5ny4qfcglVp7SSKfNhmZKYrR92229CTW220sk7QDTg=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kOzo8-0000nR-GN; Sun, 04 Oct 2020 08:55:52 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kOzo8-0005Qz-8Z; Sun, 04 Oct 2020 08:55:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kOzo8-0005qK-85; Sun, 04 Oct 2020 08:55:52 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-4.14-testing bisection] complete test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm
Message-Id: <E1kOzo8-0005qK-85@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 04 Oct 2020 08:55:52 +0000

branch xen-4.14-testing
xenbranch xen-4.14-testing
job test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm
testid debian-hvm-install

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  2ee270e126458471b178ca1e5d7d8d0afc48be39
  Bug not present: 9b9fc8e391b6d5afa83f90271fdbd0e13871e841
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/155444/


  commit 2ee270e126458471b178ca1e5d7d8d0afc48be39
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Tue Sep 22 16:14:56 2020 +0200
  
      evtchn: convert per-channel lock to be IRQ-safe
      
      ... in order for send_guest_{global,vcpu}_virq() to be able to make use
      of it.
      
      This is part of XSA-343.
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Acked-by: Julien Grall <jgrall@amazon.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.14-testing/test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm.debian-hvm-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.14-testing/test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm.debian-hvm-install --summary-out=tmp/155444.bisection-summary --basis-template=154350 --blessings=real,real-bisect xen-4.14-testing test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm debian-hvm-install
Searching for failure / basis pass:
 155303 fail [host=godello1] / 154350 [host=albana1] 154148 [host=rimava1] 154116 [host=fiano1] 152545 [host=huxelrebe1] 152537 [host=rimava1] 152531 ok.
Failure / basis pass flights: 155303 / 152531
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d8ab884fe9b4dd148980bf0d8673187f8fb25887 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 849c5e50b6f474df6cc113130575bcdccfafcd9e f37a1cf023b277d0d49323bf322ce3ff0c92262d
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8834e10b30125daa47da9f6c5c1a41b4eafbae7f 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 d9c812dda519a1a73e8370e1b81ddf46eb22ed16 c3a0fc22af90ef28e68b116c6a49d9cec57f71cf
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#8834e10b30125daa47da9f6c5c1a41b4eafbae7f-d8ab884fe9b4dd148980bf0d8673187f8fb25887 git://xenbits.xen.org/qemu-xen-traditional.git#3c659044118e34603161457db99\
 34a34f816d78b-3c659044118e34603161457db9934a34f816d78b git://xenbits.xen.org/qemu-xen.git#ea6d3cd1ed79d824e605a70c3626bc437c386260-ea6d3cd1ed79d824e605a70c3626bc437c386260 git://xenbits.xen.org/osstest/seabios.git#d9c812dda519a1a73e8370e1b81ddf46eb22ed16-849c5e50b6f474df6cc113130575bcdccfafcd9e git://xenbits.xen.org/xen.git#c3a0fc22af90ef28e68b116c6a49d9cec57f71cf-f37a1cf023b277d0d49323bf322ce3ff0c92262d
Loaded 12584 nodes in revision graph
Searching for test results:
 152531 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8834e10b30125daa47da9f6c5c1a41b4eafbae7f 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 d9c812dda519a1a73e8370e1b81ddf46eb22ed16 c3a0fc22af90ef28e68b116c6a49d9cec57f71cf
 152537 [host=rimava1]
 152545 [host=huxelrebe1]
 154116 [host=fiano1]
 154148 [host=rimava1]
 154350 [host=albana1]
 154617 fail irrelevant
 154641 fail irrelevant
 155016 fail irrelevant
 155087 fail irrelevant
 155173 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2793a49565488e419d10ba029c838f4b7efdba38 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 f37a1cf023b277d0d49323bf322ce3ff0c92262d
 155360 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8834e10b30125daa47da9f6c5c1a41b4eafbae7f 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 d9c812dda519a1a73e8370e1b81ddf46eb22ed16 c3a0fc22af90ef28e68b116c6a49d9cec57f71cf
 155389 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2793a49565488e419d10ba029c838f4b7efdba38 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 f37a1cf023b277d0d49323bf322ce3ff0c92262d
 155392 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 56aa9d19d81451bbecf57a97b9aab27243083c12 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 c3a0fc22af90ef28e68b116c6a49d9cec57f71cf
 155394 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 317d84abe3bfbdff10ae1cc4f38b49307838c6c4 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 ceafff707c96ca5cf01a435e4cf6f64c2dfc9a4d
 155399 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e97c78c546b04247191490bb1a59db471cd0368d 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 28855ebcdbfa437e60bc16c761405476fe16bc39
 155401 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 66cdf341428ae38f6426408a95de9830b5c9c83c
 155406 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 0bc4177e6b0d7a98464913af95d3bfe4b59b7a2c
 155410 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 b8c2efbe7b3e8fa5f0b0a3679afccd1204949070
 155303 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d8ab884fe9b4dd148980bf0d8673187f8fb25887 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 849c5e50b6f474df6cc113130575bcdccfafcd9e f37a1cf023b277d0d49323bf322ce3ff0c92262d
 155415 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 2ee270e126458471b178ca1e5d7d8d0afc48be39
 155418 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d8ab884fe9b4dd148980bf0d8673187f8fb25887 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 849c5e50b6f474df6cc113130575bcdccfafcd9e f37a1cf023b277d0d49323bf322ce3ff0c92262d
 155422 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 9b9fc8e391b6d5afa83f90271fdbd0e13871e841
 155428 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 2ee270e126458471b178ca1e5d7d8d0afc48be39
 155431 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 9b9fc8e391b6d5afa83f90271fdbd0e13871e841
 155438 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 2ee270e126458471b178ca1e5d7d8d0afc48be39
 155440 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 9b9fc8e391b6d5afa83f90271fdbd0e13871e841
 155444 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 2ee270e126458471b178ca1e5d7d8d0afc48be39
Searching for interesting versions
 Result found: flight 152531 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 9b9fc8e391b6d5afa83f90271fdbd0e13871e841, results HASH(0x5579710e4908) HASH(0x5579710e7b38) HASH(0x5579710cd938) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1\
 e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 b8c2efbe7b3e8fa5f0b0a3679afccd1204949070, results HASH(0x557971110b40) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c\
 3626bc437c386260 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 0bc4177e6b0d7a98464913af95d3bfe4b59b7a2c, results HASH(0x557971110398) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e97c78c546b04247191490bb1a59db471cd0368d 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 28855ebcdbfa437e60bc16c761405476fe16bc39, results HASH(0x5579710c43f0) For basis\
  failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 317d84abe3bfbdff10ae1cc4f38b49307838c6c4 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 ceafff707c96ca5cf01a435e4cf6f64c2dfc9a4d, results HASH(0x5579710d1f70) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 56aa9d19d81451bbecf5\
 7a97b9aab27243083c12 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 c3a0fc22af90ef28e68b116c6a49d9cec57f71cf, results HASH(0x5579710f6dc0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8834e10b30125daa47da9f6c5c1a41b4eafbae7f 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 d9c812dda519a1a73e8370e1b81ddf46eb2\
 2ed16 c3a0fc22af90ef28e68b116c6a49d9cec57f71cf, results HASH(0x5579710e7538) HASH(0x5579710f0780) Result found: flight 155173 (fail), for basis failure (at ancestor ~347)
 Repro found: flight 155360 (pass), for basis pass
 Repro found: flight 155418 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 9b9fc8e391b6d5afa83f90271fdbd0e13871e841
No revisions left to test, checking graph state.
 Result found: flight 155422 (pass), for last pass
 Result found: flight 155428 (fail), for first failure
 Repro found: flight 155431 (pass), for last pass
 Repro found: flight 155438 (fail), for first failure
 Repro found: flight 155440 (pass), for last pass
 Repro found: flight 155444 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  2ee270e126458471b178ca1e5d7d8d0afc48be39
  Bug not present: 9b9fc8e391b6d5afa83f90271fdbd0e13871e841
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/155444/


  commit 2ee270e126458471b178ca1e5d7d8d0afc48be39
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Tue Sep 22 16:14:56 2020 +0200
  
      evtchn: convert per-channel lock to be IRQ-safe
      
      ... in order for send_guest_{global,vcpu}_virq() to be able to make use
      of it.
      
      This is part of XSA-343.
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Acked-by: Julien Grall <jgrall@amazon.com>

pnmtopng: 213 colors found
Revision graph left in /home/logs/results/bisect/xen-4.14-testing/test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm.debian-hvm-install.{dot,ps,png,html,svg}.
----------------------------------------
155444: tolerable ALL FAIL

flight 155444 xen-4.14-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/155444/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 10 debian-hvm-install fail baseline untested


jobs:
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 fail    


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


