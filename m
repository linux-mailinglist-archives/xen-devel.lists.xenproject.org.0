Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A715528A0EF
	for <lists+xen-devel@lfdr.de>; Sat, 10 Oct 2020 19:00:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5476.14278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRIDB-0005ph-OH; Sat, 10 Oct 2020 16:59:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5476.14278; Sat, 10 Oct 2020 16:59:13 +0000
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
	id 1kRIDB-0005pK-Kp; Sat, 10 Oct 2020 16:59:13 +0000
Received: by outflank-mailman (input) for mailman id 5476;
 Sat, 10 Oct 2020 16:59:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cL7A=DR=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kRID9-0005om-N0
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2020 16:59:11 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5e2fe768-d461-4e30-9105-918352d25e49;
 Sat, 10 Oct 2020 16:59:04 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kRID1-0000Yj-NA; Sat, 10 Oct 2020 16:59:03 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kRID1-0001S0-F1; Sat, 10 Oct 2020 16:59:03 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kRID1-0006o8-EZ; Sat, 10 Oct 2020 16:59:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=cL7A=DR=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kRID9-0005om-N0
	for xen-devel@lists.xenproject.org; Sat, 10 Oct 2020 16:59:11 +0000
X-Inumbo-ID: 5e2fe768-d461-4e30-9105-918352d25e49
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 5e2fe768-d461-4e30-9105-918352d25e49;
	Sat, 10 Oct 2020 16:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
	bh=V0sitg0AsjzQkitZWLR5j39xCLqpG7iH0rCEQy5+NT0=; b=1LX6X2oif8jPKs7GZnPvW5Vsj6
	y91k2K/bWjIVJ/MDCOj+as380lltVxoDa9vWowe2ldQNmCUnzWPVMWGt64ydx2yZnuPtJqz84S/RZ
	qJKdcqT4Ks+ehLrTaCyLp81dAZL4tykmQZGrVSOsYtIYKYEnWB7hIcet1tykgxjJTNZI=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kRID1-0000Yj-NA; Sat, 10 Oct 2020 16:59:03 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kRID1-0001S0-F1; Sat, 10 Oct 2020 16:59:03 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kRID1-0006o8-EZ; Sat, 10 Oct 2020 16:59:03 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [qemu-mainline bisection] complete test-amd64-i386-freebsd10-i386
Message-Id: <E1kRID1-0006o8-EZ@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 10 Oct 2020 16:59:03 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-i386-freebsd10-i386
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/155658/


  commit 1583a389885346208217e8170395624b3aa90480
  Author: Claudio Fontana <cfontana@suse.de>
  Date:   Tue Jul 7 10:21:10 2020 +0200
  
      cpus: extract out qtest-specific code to accel/qtest
      
      register a "CpusAccel" interface for qtest as well.
      
      Signed-off-by: Claudio Fontana <cfontana@suse.de>
      Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/test-amd64-i386-freebsd10-i386.guest-start.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/test-amd64-i386-freebsd10-i386.guest-start --summary-out=tmp/155658.bisection-summary --basis-template=152631 --blessings=real,real-bisect qemu-mainline test-amd64-i386-freebsd10-i386 guest-start
Searching for failure / basis pass:
 155613 fail [host=huxelrebe0] / 155509 [host=elbling0] 155483 [host=chardonnay1] 155434 [host=rimava1] 155318 [host=fiano1] 155184 [host=albana0] 155098 [host=pinot1] 155018 [host=chardonnay0] 154629 [host=elbling0] 154607 [host=huxelrebe1] 154583 [host=pinot0] 154566 [host=elbling1] 154552 [host=rimava1] 154544 [host=fiano0] 154526 ok.
Failure / basis pass flights: 155613 / 154526
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 69e95b9efed520e643b9e5b0573180aa7c5ecaca 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4a7c0bd9dcb08798c6f82e55b5a3423f7ee669f1 849c5e50b6f474df6cc113130575bcdccfafcd9e 7a519f8bda6f3505a4c1fbf277f002aa0c12ab9a
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7faece69854cbcc593643182581b5d7f99b7dab6 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 053a4177817db307ec854356e95b5b350800a216 155821a1990b6de78dde5f98fa5ab90e802021e0 baa4d064e91b6d2bcfe400bdf71f83b961e4c28e
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#7faece69854cbcc593643182581b5d7f99b7dab6-69e95b9efed520e643b9e5b0573180aa7c5ecaca git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c74\
 37ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://git.qemu.org/qemu.git#053a4177817db307ec854356e95b5b350800a216-4a7c0bd9dcb08798c6f82e55b5a3423f7ee669f1 git://xenbits.xen.org/osstest/seabios.git#155821a1990b6de78dde5f98fa5ab90e802021e0-849c5e50b6f474df6cc113130575bcdccfafcd9e git://xenbits.xen.org/xen.git#baa4d064e91b6d2bcfe400bdf71f83b961e4c28e-7a519f8bda6f3505a4c1fbf277f002aa0c12ab9a
Loaded 51989 nodes in revision graph
Searching for test results:
 154485 [host=fiano1]
 154496 [host=albana0]
 154508 [host=chardonnay1]
 154526 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7faece69854cbcc593643182581b5d7f99b7dab6 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 053a4177817db307ec854356e95b5b350800a216 155821a1990b6de78dde5f98fa5ab90e802021e0 baa4d064e91b6d2bcfe400bdf71f83b961e4c28e
 154544 [host=fiano0]
 154552 [host=rimava1]
 154566 [host=elbling1]
 154583 [host=pinot0]
 154607 [host=huxelrebe1]
 154629 [host=elbling0]
 155018 [host=chardonnay0]
 155098 [host=pinot1]
 155184 [host=albana0]
 155318 [host=fiano1]
 155434 [host=rimava1]
 155483 [host=chardonnay1]
 155509 [host=elbling0]
 155518 fail irrelevant
 155545 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7faece69854cbcc593643182581b5d7f99b7dab6 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 053a4177817db307ec854356e95b5b350800a216 155821a1990b6de78dde5f98fa5ab90e802021e0 baa4d064e91b6d2bcfe400bdf71f83b961e4c28e
 155580 fail irrelevant
 155581 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d8ca4f90eaeb61bd7e9903b56bf412f0d187137 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 671ad7c4468f795b66b4cd8f376f1b1ce6701b63 849c5e50b6f474df6cc113130575bcdccfafcd9e 8ef6345ef557cc2c47298217635a3088eaa59893
 155544 fail irrelevant
 155583 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d8ca4f90eaeb61bd7e9903b56bf412f0d187137 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0ac0b47c44b4be6cbce26777a1a5968cc8f025a5 849c5e50b6f474df6cc113130575bcdccfafcd9e 8ef6345ef557cc2c47298217635a3088eaa59893
 155586 fail irrelevant
 155587 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d8ca4f90eaeb61bd7e9903b56bf412f0d187137 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0d2a4545bf7e763984d3ee3e802617544cb7fc7a 849c5e50b6f474df6cc113130575bcdccfafcd9e 59b27f360e3d9dc0378c1288e67a91fa41a77158
 155589 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d8ca4f90eaeb61bd7e9903b56bf412f0d187137 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b23317eec4715aa62de9a6e5490a01122c8eef0e 849c5e50b6f474df6cc113130575bcdccfafcd9e bdb380e1dbdc6b76576ab6db0b8e946cc95edc1c
 155591 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d8ca4f90eaeb61bd7e9903b56bf412f0d187137 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 625581c2602b5b43e115b779a9a782478e6f92e7 849c5e50b6f474df6cc113130575bcdccfafcd9e bdb380e1dbdc6b76576ab6db0b8e946cc95edc1c
 155592 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d8ab884fe9b4dd148980bf0d8673187f8fb25887 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 37aeb7a28ddbf52dd25dd53ae1b8391bc2287858 849c5e50b6f474df6cc113130575bcdccfafcd9e de16a8fa0db7f1879442cf9cfe865eb2e9d98e6d
 155595 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 52dbaaeace647961bae61634c4be49ea2ca3d5cd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7cd77fb02b9a2117a56fed172f09a1820fcd6b0b 41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 5dba8c2f23049aa68b777a9e7e9f76c12dd00012
 155597 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 52dbaaeace647961bae61634c4be49ea2ca3d5cd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 5663ac2aa0eafb40411ac4dff85e6ab529c4d199 41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 358d57d411ee759a5a9dbf367179a9ac37faf0b3
 155598 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d8ab884fe9b4dd148980bf0d8673187f8fb25887 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e344ffe73bd77e7067099155cfd8bf42b07ed631 41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 c73952831f0fc63a984e0d07dff1d20f8617b81f
 155599 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 52dbaaeace647961bae61634c4be49ea2ca3d5cd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1553d543ff4b9f91de4ed7743f0cd6e534528b9e 41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 358d57d411ee759a5a9dbf367179a9ac37faf0b3
 155601 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1d058c3e86b079a2e207bb022fd7a97814c9a04f 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 92d09502676678c8ebb1ad830666b323d3c88f9d 41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 4bdbf746ac9152e70f264f87db4472707da805ce
 155603 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 52dbaaeace647961bae61634c4be49ea2ca3d5cd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8138405528c29af2a850cd672a8f8a0b33b7ab40 41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 358d57d411ee759a5a9dbf367179a9ac37faf0b3
 155585 fail irrelevant
 155611 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1d058c3e86b079a2e207bb022fd7a97814c9a04f 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e12a0edafeb5019aac74114b62a4703f79c5c693 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 5bcac985498ed83d89666959175ca9c9ed561ae1
 155619 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7faece69854cbcc593643182581b5d7f99b7dab6 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 053a4177817db307ec854356e95b5b350800a216 155821a1990b6de78dde5f98fa5ab90e802021e0 baa4d064e91b6d2bcfe400bdf71f83b961e4c28e
 155621 fail irrelevant
 155625 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c640186ec8aae6164123ee38de6409aed69eab12 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6eeea6725a70e6fcb5abba0764496bdab07ddfb3 849c5e50b6f474df6cc113130575bcdccfafcd9e 93508595d588afe9dca087f95200effb7cedc81f
 155627 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d8ca4f90eaeb61bd7e9903b56bf412f0d187137 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d7c5b788295426c1ef48a9ffc3432c51220f69ba 849c5e50b6f474df6cc113130575bcdccfafcd9e 93508595d588afe9dca087f95200effb7cedc81f
 155631 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d8ca4f90eaeb61bd7e9903b56bf412f0d187137 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 fda8458bd3a9cb3108ba2f09921b6e3eee0d1bf3 849c5e50b6f474df6cc113130575bcdccfafcd9e 8ef6345ef557cc2c47298217635a3088eaa59893
 155636 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d8ca4f90eaeb61bd7e9903b56bf412f0d187137 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e0715f6abce0c04f68d35c4f6df2976ac57379c9 849c5e50b6f474df6cc113130575bcdccfafcd9e 8ef6345ef557cc2c47298217635a3088eaa59893
 155637 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d8ca4f90eaeb61bd7e9903b56bf412f0d187137 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8ef39ecfa69f758680280577077e25f4b5be9844 849c5e50b6f474df6cc113130575bcdccfafcd9e 8ef6345ef557cc2c47298217635a3088eaa59893
 155613 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 69e95b9efed520e643b9e5b0573180aa7c5ecaca 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4a7c0bd9dcb08798c6f82e55b5a3423f7ee669f1 849c5e50b6f474df6cc113130575bcdccfafcd9e 7a519f8bda6f3505a4c1fbf277f002aa0c12ab9a
 155644 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d8ca4f90eaeb61bd7e9903b56bf412f0d187137 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a77dabc33bcc36ec348854f23e89e0de22ca045b 849c5e50b6f474df6cc113130575bcdccfafcd9e 8ef6345ef557cc2c47298217635a3088eaa59893
 155647 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 69e95b9efed520e643b9e5b0573180aa7c5ecaca 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4a7c0bd9dcb08798c6f82e55b5a3423f7ee669f1 849c5e50b6f474df6cc113130575bcdccfafcd9e 7a519f8bda6f3505a4c1fbf277f002aa0c12ab9a
 155650 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d8ca4f90eaeb61bd7e9903b56bf412f0d187137 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 57038a92bb06111fbee57f56c0231359573e805d 849c5e50b6f474df6cc113130575bcdccfafcd9e 8ef6345ef557cc2c47298217635a3088eaa59893
 155653 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d8ca4f90eaeb61bd7e9903b56bf412f0d187137 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1583a389885346208217e8170395624b3aa90480 849c5e50b6f474df6cc113130575bcdccfafcd9e 8ef6345ef557cc2c47298217635a3088eaa59893
 155655 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d8ca4f90eaeb61bd7e9903b56bf412f0d187137 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a77dabc33bcc36ec348854f23e89e0de22ca045b 849c5e50b6f474df6cc113130575bcdccfafcd9e 8ef6345ef557cc2c47298217635a3088eaa59893
 155656 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d8ca4f90eaeb61bd7e9903b56bf412f0d187137 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1583a389885346208217e8170395624b3aa90480 849c5e50b6f474df6cc113130575bcdccfafcd9e 8ef6345ef557cc2c47298217635a3088eaa59893
 155657 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d8ca4f90eaeb61bd7e9903b56bf412f0d187137 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a77dabc33bcc36ec348854f23e89e0de22ca045b 849c5e50b6f474df6cc113130575bcdccfafcd9e 8ef6345ef557cc2c47298217635a3088eaa59893
 155658 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d8ca4f90eaeb61bd7e9903b56bf412f0d187137 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1583a389885346208217e8170395624b3aa90480 849c5e50b6f474df6cc113130575bcdccfafcd9e 8ef6345ef557cc2c47298217635a3088eaa59893
Searching for interesting versions
 Result found: flight 154526 (pass), for basis pass
 Result found: flight 155613 (fail), for basis failure
 Repro found: flight 155619 (pass), for basis pass
 Repro found: flight 155647 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d8ca4f90eaeb61bd7e9903b56bf412f0d187137 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a77dabc33bcc36ec348854f23e89e0de22ca045b 849c5e50b6f474df6cc113130575bcdccfafcd9e 8ef6345ef557cc2c47298217635a3088eaa59893
No revisions left to test, checking graph state.
 Result found: flight 155644 (pass), for last pass
 Result found: flight 155653 (fail), for first failure
 Repro found: flight 155655 (pass), for last pass
 Repro found: flight 155656 (fail), for first failure
 Repro found: flight 155657 (pass), for last pass
 Repro found: flight 155658 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  1583a389885346208217e8170395624b3aa90480
  Bug not present: a77dabc33bcc36ec348854f23e89e0de22ca045b
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/155658/


  commit 1583a389885346208217e8170395624b3aa90480
  Author: Claudio Fontana <cfontana@suse.de>
  Date:   Tue Jul 7 10:21:10 2020 +0200
  
      cpus: extract out qtest-specific code to accel/qtest
      
      register a "CpusAccel" interface for qtest as well.
      
      Signed-off-by: Claudio Fontana <cfontana@suse.de>
      Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

pnmtopng: 244 colors found
Revision graph left in /home/logs/results/bisect/qemu-mainline/test-amd64-i386-freebsd10-i386.guest-start.{dot,ps,png,html,svg}.
----------------------------------------
155658: tolerable ALL FAIL

flight 155658 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/155658/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-i386-freebsd10-i386 13 guest-start           fail baseline untested


jobs:
 test-amd64-i386-freebsd10-i386                               fail    


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


