Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75ED128B4B3
	for <lists+xen-devel@lfdr.de>; Mon, 12 Oct 2020 14:35:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5921.15365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRx1x-0001Y3-Pk; Mon, 12 Oct 2020 12:34:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5921.15365; Mon, 12 Oct 2020 12:34:21 +0000
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
	id 1kRx1x-0001Xe-MV; Mon, 12 Oct 2020 12:34:21 +0000
Received: by outflank-mailman (input) for mailman id 5921;
 Mon, 12 Oct 2020 12:34:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FZzu=DT=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kRx1v-0001Wk-RD
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 12:34:19 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b64cee47-f5b5-4ad7-afe8-5131527c6d9d;
 Mon, 12 Oct 2020 12:34:11 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kRx1n-0005UI-BQ; Mon, 12 Oct 2020 12:34:11 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kRx1n-0004sI-2h; Mon, 12 Oct 2020 12:34:11 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kRx1n-00073n-2B; Mon, 12 Oct 2020 12:34:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=FZzu=DT=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kRx1v-0001Wk-RD
	for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 12:34:19 +0000
X-Inumbo-ID: b64cee47-f5b5-4ad7-afe8-5131527c6d9d
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b64cee47-f5b5-4ad7-afe8-5131527c6d9d;
	Mon, 12 Oct 2020 12:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
	bh=aPEIadeenY4MFMQX+oqEamPAp0NPYuwL14MmMy+l404=; b=a9PqFn6z+LzhxZ8RhEZGdOAjXi
	mWQdA3y7qdJ6Uq7o+Wfch78O6DypTBv3aWLw81av73mzNPeqJjpeTFSGGjJ0vgvNq9nMARz4wWb6l
	aknWiKuxm2JUFbJL1UyT6mKXvSEeh86dSTZgC82pfYoytvobp9wIPGZAHrB5M9W45YTc=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kRx1n-0005UI-BQ; Mon, 12 Oct 2020 12:34:11 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kRx1n-0004sI-2h; Mon, 12 Oct 2020 12:34:11 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kRx1n-00073n-2B; Mon, 12 Oct 2020 12:34:11 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [qemu-mainline bisection] complete test-amd64-i386-freebsd10-amd64
Message-Id: <E1kRx1n-00073n-2B@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 12 Oct 2020 12:34:11 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-i386-freebsd10-amd64
testid guest-start

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  1583a389885346208217e8170395624b3aa90480
  Bug not present: a77dabc33bcc36ec348854f23e89e0de22ca045b
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/155731/


  commit 1583a389885346208217e8170395624b3aa90480
  Author: Claudio Fontana <cfontana@suse.de>
  Date:   Tue Jul 7 10:21:10 2020 +0200
  
      cpus: extract out qtest-specific code to accel/qtest
      
      register a "CpusAccel" interface for qtest as well.
      
      Signed-off-by: Claudio Fontana <cfontana@suse.de>
      Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/test-amd64-i386-freebsd10-amd64.guest-start.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/test-amd64-i386-freebsd10-amd64.guest-start --summary-out=tmp/155731.bisection-summary --basis-template=152631 --blessings=real,real-bisect qemu-mainline test-amd64-i386-freebsd10-amd64 guest-start
Searching for failure / basis pass:
 155713 fail [host=huxelrebe0] / 155509 [host=albana0] 155483 [host=albana1] 155434 [host=huxelrebe1] 155318 [host=elbling0] 155184 [host=fiano0] 155098 [host=fiano1] 155018 [host=pinot0] 154629 [host=rimava1] 154607 [host=chardonnay0] 154583 [host=pinot1] 154566 [host=albana1] 154552 [host=albana0] 154544 [host=chardonnay1] 154526 [host=fiano0] 154508 [host=elbling1] 154496 [host=elbling0] 154485 [host=huxelrebe1] 154466 ok.
Failure / basis pass flights: 155713 / 154466
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ae511331e0fb1625ba649f377e81e487de3a5531 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 48a340d9b23ffcf7704f2de14d1e505481a84a1c 849c5e50b6f474df6cc113130575bcdccfafcd9e 25849c8b16f2a5b7fcd0a823e80a5f1b590291f9
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 698d3d7726232694018d437279dd4166e462deb7 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a6a0c8394c5b0ce4cee2a1597d235d9b2b9af3c2 155821a1990b6de78dde5f98fa5ab90e802021e0 1e2d3be2e516e6f415ca6029f651b76a8563a27c
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#698d3d7726232694018d437279dd4166e462deb7-ae511331e0fb1625ba649f377e81e487de3a5531 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c74\
 37ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://git.qemu.org/qemu.git#a6a0c8394c5b0ce4cee2a1597d235d9b2b9af3c2-48a340d9b23ffcf7704f2de14d1e505481a84a1c git://xenbits.xen.org/osstest/seabios.git#155821a1990b6de78dde5f98fa5ab90e802021e0-849c5e50b6f474df6cc113130575bcdccfafcd9e git://xenbits.xen.org/xen.git#1e2d3be2e516e6f415ca6029f651b76a8563a27c-25849c8b16f2a5b7fcd0a823e80a5f1b590291f9
Loaded 64470 nodes in revision graph
Searching for test results:
 154466 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 698d3d7726232694018d437279dd4166e462deb7 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a6a0c8394c5b0ce4cee2a1597d235d9b2b9af3c2 155821a1990b6de78dde5f98fa5ab90e802021e0 1e2d3be2e516e6f415ca6029f651b76a8563a27c
 154485 [host=huxelrebe1]
 154496 [host=elbling0]
 154508 [host=elbling1]
 154526 [host=fiano0]
 154544 [host=chardonnay1]
 154552 [host=albana0]
 154566 [host=albana1]
 154583 [host=pinot1]
 154607 [host=chardonnay0]
 154629 [host=rimava1]
 155018 [host=pinot0]
 155098 [host=fiano1]
 155184 [host=fiano0]
 155318 [host=elbling0]
 155434 [host=huxelrebe1]
 155483 [host=albana1]
 155509 [host=albana0]
 155518 fail irrelevant
 155544 fail irrelevant
 155585 fail irrelevant
 155613 fail irrelevant
 155659 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 698d3d7726232694018d437279dd4166e462deb7 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a6a0c8394c5b0ce4cee2a1597d235d9b2b9af3c2 155821a1990b6de78dde5f98fa5ab90e802021e0 1e2d3be2e516e6f415ca6029f651b76a8563a27c
 155661 fail irrelevant
 155663 fail irrelevant
 155645 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 70c2f10fde5b67b0d7d62ba7ea3271fc514ebcc4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4a7c0bd9dcb08798c6f82e55b5a3423f7ee669f1 849c5e50b6f474df6cc113130575bcdccfafcd9e 25849c8b16f2a5b7fcd0a823e80a5f1b590291f9
 155664 fail irrelevant
 155666 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 70c2f10fde5b67b0d7d62ba7ea3271fc514ebcc4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4a7c0bd9dcb08798c6f82e55b5a3423f7ee669f1 849c5e50b6f474df6cc113130575bcdccfafcd9e 25849c8b16f2a5b7fcd0a823e80a5f1b590291f9
 155669 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 70c2f10fde5b67b0d7d62ba7ea3271fc514ebcc4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 eb94b81a94bce112e6b206df846c1551aaf6cab6 849c5e50b6f474df6cc113130575bcdccfafcd9e 25849c8b16f2a5b7fcd0a823e80a5f1b590291f9
 155670 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 69e95b9efed520e643b9e5b0573180aa7c5ecaca 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a1d22c668a7662289b42624fe2aa92c9a23df1d2 849c5e50b6f474df6cc113130575bcdccfafcd9e 0241809bf838875615797f52af34222e5ab8e98f
 155672 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d8ca4f90eaeb61bd7e9903b56bf412f0d187137 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 f2687fdb7571a444b5af3509574b659d35ddd601 849c5e50b6f474df6cc113130575bcdccfafcd9e 93508595d588afe9dca087f95200effb7cedc81f
 155665 fail irrelevant
 155674 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d8ca4f90eaeb61bd7e9903b56bf412f0d187137 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 671ad7c4468f795b66b4cd8f376f1b1ce6701b63 849c5e50b6f474df6cc113130575bcdccfafcd9e 8ef6345ef557cc2c47298217635a3088eaa59893
 155677 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d8ca4f90eaeb61bd7e9903b56bf412f0d187137 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 36d9c2883e55c863b622b99f0ebb5143f0001401 849c5e50b6f474df6cc113130575bcdccfafcd9e 8ef6345ef557cc2c47298217635a3088eaa59893
 155679 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d8ca4f90eaeb61bd7e9903b56bf412f0d187137 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0d2a4545bf7e763984d3ee3e802617544cb7fc7a 849c5e50b6f474df6cc113130575bcdccfafcd9e 59b27f360e3d9dc0378c1288e67a91fa41a77158
 155680 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d8ca4f90eaeb61bd7e9903b56bf412f0d187137 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b23317eec4715aa62de9a6e5490a01122c8eef0e 849c5e50b6f474df6cc113130575bcdccfafcd9e bdb380e1dbdc6b76576ab6db0b8e946cc95edc1c
 155681 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d8ca4f90eaeb61bd7e9903b56bf412f0d187137 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625581c2602b5b43e115b779a9a782478e6f92e7 849c5e50b6f474df6cc113130575bcdccfafcd9e bdb380e1dbdc6b76576ab6db0b8e946cc95edc1c
 155684 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d8ab884fe9b4dd148980bf0d8673187f8fb25887 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 37aeb7a28ddbf52dd25dd53ae1b8391bc2287858 849c5e50b6f474df6cc113130575bcdccfafcd9e de16a8fa0db7f1879442cf9cfe865eb2e9d98e6d
 155685 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 52dbaaeace647961bae61634c4be49ea2ca3d5cd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7cd77fb02b9a2117a56fed172f09a1820fcd6b0b 41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 5dba8c2f23049aa68b777a9e7e9f76c12dd00012
 155686 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 52dbaaeace647961bae61634c4be49ea2ca3d5cd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 5663ac2aa0eafb40411ac4dff85e6ab529c4d199 41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 358d57d411ee759a5a9dbf367179a9ac37faf0b3
 155688 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d8ab884fe9b4dd148980bf0d8673187f8fb25887 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e344ffe73bd77e7067099155cfd8bf42b07ed631 41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 c73952831f0fc63a984e0d07dff1d20f8617b81f
 155690 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 52dbaaeace647961bae61634c4be49ea2ca3d5cd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1553d543ff4b9f91de4ed7743f0cd6e534528b9e 41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 358d57d411ee759a5a9dbf367179a9ac37faf0b3
 155691 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1d058c3e86b079a2e207bb022fd7a97814c9a04f 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 92d09502676678c8ebb1ad830666b323d3c88f9d 41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 4bdbf746ac9152e70f264f87db4472707da805ce
 155675 fail irrelevant
 155692 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 52dbaaeace647961bae61634c4be49ea2ca3d5cd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8138405528c29af2a850cd672a8f8a0b33b7ab40 41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 358d57d411ee759a5a9dbf367179a9ac37faf0b3
 155693 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1d058c3e86b079a2e207bb022fd7a97814c9a04f 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e12a0edafeb5019aac74114b62a4703f79c5c693 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 5bcac985498ed83d89666959175ca9c9ed561ae1
 155696 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 dd5c7e3c5282b084daa5bbf0ec229cec699b2c17 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c122bca9cd7b986be4d473240a4fec6315b7a2c2 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 5a37207df52066efefe419c677b089a654d37afc
 155697 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 dd5c7e3c5282b084daa5bbf0ec229cec699b2c17 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 5e626fa7364bc2d7db5f6c8e59150dee1689b98a 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 5a37207df52066efefe419c677b089a654d37afc
 155698 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3f3daf89308930e45f82ae67dd2a2d6e030bb091 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 edf6ea6fbe793b017a9765b493d7b1675a16a42f 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 2785b2a9e04abc148e1c5259f4faee708ea356f4
 155701 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea9af51479fe04955443f0d366376a1008f07c94 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 5df6c87e8080e0021e975c8387baa20cfe43c932 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 d4ed1d4132f5825a795d5a78505811ecd2717b5e
 155695 fail irrelevant
 155702 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 dd5c7e3c5282b084daa5bbf0ec229cec699b2c17 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1bd5556f6686365e76f7ff67fe67260c449e8345 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 5a37207df52066efefe419c677b089a654d37afc
 155705 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1d058c3e86b079a2e207bb022fd7a97814c9a04f 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8d16e72f2d4df2c9e631393adf1669a1da7efe8a 41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 4bdbf746ac9152e70f264f87db4472707da805ce
 155706 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d8ca4f90eaeb61bd7e9903b56bf412f0d187137 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 dd8c1e808f1ca311e1f50bff218c3ee3198b1f02 849c5e50b6f474df6cc113130575bcdccfafcd9e 59b27f360e3d9dc0378c1288e67a91fa41a77158
 155707 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d8ca4f90eaeb61bd7e9903b56bf412f0d187137 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 deb62371fe311cefd8a6f58e2da42b15d7e2a356 849c5e50b6f474df6cc113130575bcdccfafcd9e 8ef6345ef557cc2c47298217635a3088eaa59893
 155709 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d8ca4f90eaeb61bd7e9903b56bf412f0d187137 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 f51af04cce148e825a9f3c4f446e5cd3cfaff71d 849c5e50b6f474df6cc113130575bcdccfafcd9e 59b27f360e3d9dc0378c1288e67a91fa41a77158
 155710 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d8ca4f90eaeb61bd7e9903b56bf412f0d187137 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 5770e8afd629cc8a83dc41e2524258c73c1b301e 849c5e50b6f474df6cc113130575bcdccfafcd9e 8ef6345ef557cc2c47298217635a3088eaa59893
 155703 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ae511331e0fb1625ba649f377e81e487de3a5531 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 48a340d9b23ffcf7704f2de14d1e505481a84a1c 849c5e50b6f474df6cc113130575bcdccfafcd9e 25849c8b16f2a5b7fcd0a823e80a5f1b590291f9
 155711 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d8ca4f90eaeb61bd7e9903b56bf412f0d187137 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e92558e4bf8059ce4f0b310afe218802b72766bc 849c5e50b6f474df6cc113130575bcdccfafcd9e 8ef6345ef557cc2c47298217635a3088eaa59893
 155715 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 698d3d7726232694018d437279dd4166e462deb7 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a6a0c8394c5b0ce4cee2a1597d235d9b2b9af3c2 155821a1990b6de78dde5f98fa5ab90e802021e0 1e2d3be2e516e6f415ca6029f651b76a8563a27c
 155718 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ae511331e0fb1625ba649f377e81e487de3a5531 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 48a340d9b23ffcf7704f2de14d1e505481a84a1c 849c5e50b6f474df6cc113130575bcdccfafcd9e 25849c8b16f2a5b7fcd0a823e80a5f1b590291f9
 155719 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d8ca4f90eaeb61bd7e9903b56bf412f0d187137 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0ac0b47c44b4be6cbce26777a1a5968cc8f025a5 849c5e50b6f474df6cc113130575bcdccfafcd9e 8ef6345ef557cc2c47298217635a3088eaa59893
 155720 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d8ca4f90eaeb61bd7e9903b56bf412f0d187137 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 430065dab060f04a74f915ea1260dcc79701ca75 849c5e50b6f474df6cc113130575bcdccfafcd9e 8ef6345ef557cc2c47298217635a3088eaa59893
 155722 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d8ca4f90eaeb61bd7e9903b56bf412f0d187137 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1583a389885346208217e8170395624b3aa90480 849c5e50b6f474df6cc113130575bcdccfafcd9e 8ef6345ef557cc2c47298217635a3088eaa59893
 155723 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d8ca4f90eaeb61bd7e9903b56bf412f0d187137 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a77dabc33bcc36ec348854f23e89e0de22ca045b 849c5e50b6f474df6cc113130575bcdccfafcd9e 8ef6345ef557cc2c47298217635a3088eaa59893
 155725 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d8ca4f90eaeb61bd7e9903b56bf412f0d187137 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1583a389885346208217e8170395624b3aa90480 849c5e50b6f474df6cc113130575bcdccfafcd9e 8ef6345ef557cc2c47298217635a3088eaa59893
 155726 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d8ca4f90eaeb61bd7e9903b56bf412f0d187137 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a77dabc33bcc36ec348854f23e89e0de22ca045b 849c5e50b6f474df6cc113130575bcdccfafcd9e 8ef6345ef557cc2c47298217635a3088eaa59893
 155713 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ae511331e0fb1625ba649f377e81e487de3a5531 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 48a340d9b23ffcf7704f2de14d1e505481a84a1c 849c5e50b6f474df6cc113130575bcdccfafcd9e 25849c8b16f2a5b7fcd0a823e80a5f1b590291f9
 155727 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d8ca4f90eaeb61bd7e9903b56bf412f0d187137 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1583a389885346208217e8170395624b3aa90480 849c5e50b6f474df6cc113130575bcdccfafcd9e 8ef6345ef557cc2c47298217635a3088eaa59893
 155730 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d8ca4f90eaeb61bd7e9903b56bf412f0d187137 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a77dabc33bcc36ec348854f23e89e0de22ca045b 849c5e50b6f474df6cc113130575bcdccfafcd9e 8ef6345ef557cc2c47298217635a3088eaa59893
 155731 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d8ca4f90eaeb61bd7e9903b56bf412f0d187137 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1583a389885346208217e8170395624b3aa90480 849c5e50b6f474df6cc113130575bcdccfafcd9e 8ef6345ef557cc2c47298217635a3088eaa59893
Searching for interesting versions
 Result found: flight 154466 (pass), for basis pass
 Result found: flight 155703 (fail), for basis failure
 Repro found: flight 155715 (pass), for basis pass
 Repro found: flight 155718 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d8ca4f90eaeb61bd7e9903b56bf412f0d187137 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a77dabc33bcc36ec348854f23e89e0de22ca045b 849c5e50b6f474df6cc113130575bcdccfafcd9e 8ef6345ef557cc2c47298217635a3088eaa59893
No revisions left to test, checking graph state.
 Result found: flight 155723 (pass), for last pass
 Result found: flight 155725 (fail), for first failure
 Repro found: flight 155726 (pass), for last pass
 Repro found: flight 155727 (fail), for first failure
 Repro found: flight 155730 (pass), for last pass
 Repro found: flight 155731 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  1583a389885346208217e8170395624b3aa90480
  Bug not present: a77dabc33bcc36ec348854f23e89e0de22ca045b
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/155731/


  commit 1583a389885346208217e8170395624b3aa90480
  Author: Claudio Fontana <cfontana@suse.de>
  Date:   Tue Jul 7 10:21:10 2020 +0200
  
      cpus: extract out qtest-specific code to accel/qtest
      
      register a "CpusAccel" interface for qtest as well.
      
      Signed-off-by: Claudio Fontana <cfontana@suse.de>
      Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

neato: graph is too large for cairo-renderer bitmaps. Scaling by 0.890093 to fit
Revision graph left in /home/logs/results/bisect/qemu-mainline/test-amd64-i386-freebsd10-amd64.guest-start.{dot,ps,png,html,svg}.
----------------------------------------
155731: tolerable ALL FAIL

flight 155731 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/155731/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-i386-freebsd10-amd64 13 guest-start          fail baseline untested


jobs:
 test-amd64-i386-freebsd10-amd64                              fail    


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


