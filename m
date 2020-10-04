Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A20A5282947
	for <lists+xen-devel@lfdr.de>; Sun,  4 Oct 2020 08:55:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2686.7681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOxuA-0006k1-PL; Sun, 04 Oct 2020 06:53:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2686.7681; Sun, 04 Oct 2020 06:53:58 +0000
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
	id 1kOxuA-0006jM-Kr; Sun, 04 Oct 2020 06:53:58 +0000
Received: by outflank-mailman (input) for mailman id 2686;
 Sun, 04 Oct 2020 06:53:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vMX8=DL=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kOxu9-0006iN-5s
 for xen-devel@lists.xenproject.org; Sun, 04 Oct 2020 06:53:57 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cf64e334-6679-47cb-b5bc-76c2b605e746;
 Sun, 04 Oct 2020 06:53:49 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kOxu1-0006E2-2G; Sun, 04 Oct 2020 06:53:49 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kOxu0-0006nM-DL; Sun, 04 Oct 2020 06:53:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kOxu0-0004h6-Cs; Sun, 04 Oct 2020 06:53:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=vMX8=DL=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kOxu9-0006iN-5s
	for xen-devel@lists.xenproject.org; Sun, 04 Oct 2020 06:53:57 +0000
X-Inumbo-ID: cf64e334-6679-47cb-b5bc-76c2b605e746
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id cf64e334-6679-47cb-b5bc-76c2b605e746;
	Sun, 04 Oct 2020 06:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
	bh=luJQLK3azXx60x7cV1nMmwWqHN4aj0y27wCxOLBJPKg=; b=Qcd7eBmnvLQa4cObgA1xPGrpAY
	9PeKRaTp6tNbxXpu/DkLe6qQ7a1YShSb+d6j8hN5PwiQ62CxkzSZcDCAhffxDqlDRR4PzRdr7koLI
	rIHIJ5kvMHUExLwF9H5eo2hBRq7MPbnA+FX90GSS+/KEO1qf2htr5RXCFjdTFS5bzBOE=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kOxu1-0006E2-2G; Sun, 04 Oct 2020 06:53:49 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kOxu0-0006nM-DL; Sun, 04 Oct 2020 06:53:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kOxu0-0004h6-Cs; Sun, 04 Oct 2020 06:53:48 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-4.12-testing bisection] complete test-amd64-amd64-xl-xsm
Message-Id: <E1kOxu0-0004h6-Cs@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 04 Oct 2020 06:53:48 +0000

branch xen-4.12-testing
xenbranch xen-4.12-testing
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
  Bug introduced:  9c2a02740f7f91543caa8fab6d2ab2bbc7c40742
  Bug not present: 9dda47cb702ccb9663aec9c78ac3fdc3d4076b1c
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/155435/


  commit 9c2a02740f7f91543caa8fab6d2ab2bbc7c40742
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Tue Sep 22 17:10:32 2020 +0200
  
      evtchn: convert per-channel lock to be IRQ-safe
      
      ... in order for send_guest_{global,vcpu}_virq() to be able to make use
      of it.
      
      This is part of XSA-343.
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Acked-by: Julien Grall <jgrall@amazon.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.12-testing/test-amd64-amd64-xl-xsm.guest-start.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.12-testing/test-amd64-amd64-xl-xsm.guest-start --summary-out=tmp/155435.bisection-summary --basis-template=154601 --blessings=real,real-bisect xen-4.12-testing test-amd64-amd64-xl-xsm guest-start
Searching for failure / basis pass:
 155288 fail [host=chardonnay1] / 154601 [host=godello0] 154121 [host=pinot1] 152525 [host=godello0] 151715 [host=godello1] 151388 ok.
Failure / basis pass flights: 155288 / 151388
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d8ab884fe9b4dd148980bf0d8673187f8fb25887 d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 849c5e50b6f474df6cc113130575bcdccfafcd9e 0186e76a62f7409804c2e4785d5a11e7f82a7c52
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a4a2258a1fec66665481b0bd929b049921cb07a0 d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb d11c75185276ded944f2ea0277532b7fee849bbc 050fe48dc981e0488de1f6c6c07d8110f3b7523b
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#a4a2258a1fec66665481b0bd929b049921cb07a0-d8ab884fe9b4dd148980bf0d8673187f8fb25887 git://xenbits.xen.org/qemu-xen-traditional.git#d0d8ad39ecb51cd7497cd524484\
 fe09f50876798-d0d8ad39ecb51cd7497cd524484fe09f50876798 git://xenbits.xen.org/qemu-xen.git#8023a62081ffbe3f734019076ec1a2b4213142bb-8023a62081ffbe3f734019076ec1a2b4213142bb git://xenbits.xen.org/osstest/seabios.git#d11c75185276ded944f2ea0277532b7fee849bbc-849c5e50b6f474df6cc113130575bcdccfafcd9e git://xenbits.xen.org/xen.git#050fe48dc981e0488de1f6c6c07d8110f3b7523b-0186e76a62f7409804c2e4785d5a11e7f82a7c52
Loaded 2982 nodes in revision graph
Searching for test results:
 151367 [host=fiano0]
 151388 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a4a2258a1fec66665481b0bd929b049921cb07a0 d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb d11c75185276ded944f2ea0277532b7fee849bbc 050fe48dc981e0488de1f6c6c07d8110f3b7523b
 151715 [host=godello1]
 152525 [host=godello0]
 154121 [host=pinot1]
 154601 [host=godello0]
 154622 fail irrelevant
 154663 fail irrelevant
 155014 fail irrelevant
 155075 fail irrelevant
 155152 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2793a49565488e419d10ba029c838f4b7efdba38 d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 0186e76a62f7409804c2e4785d5a11e7f82a7c52
 155361 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a4a2258a1fec66665481b0bd929b049921cb07a0 d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb d11c75185276ded944f2ea0277532b7fee849bbc 050fe48dc981e0488de1f6c6c07d8110f3b7523b
 155376 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2793a49565488e419d10ba029c838f4b7efdba38 d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 0186e76a62f7409804c2e4785d5a11e7f82a7c52
 155379 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9275bb82caf95c31c2e58a5c14b3feabf46bdf0b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 1336ca17742471fc4a59879ae2f637a59530a933
 155381 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 53b40c9c6d108e8c0e1500a288638623fee92bca d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 1336ca17742471fc4a59879ae2f637a59530a933
 155384 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1b461403ee723dab01d5828714cca0b9396a6b3c d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 a81e6557b9864e4288a63cbbbd3a6f98d3a74862
 155386 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 320e7a7369245d4304ac822e67740a7ea147e7a2
 155390 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 cfd61e688f9f1736ff0311f49040669f04ac1ea6
 155395 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 3e039e12ecfdefbf3ecbc5a63052620a1fe51ad5
 155288 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d8ab884fe9b4dd148980bf0d8673187f8fb25887 d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 849c5e50b6f474df6cc113130575bcdccfafcd9e 0186e76a62f7409804c2e4785d5a11e7f82a7c52
 155400 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 9dda47cb702ccb9663aec9c78ac3fdc3d4076b1c
 155404 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d8ab884fe9b4dd148980bf0d8673187f8fb25887 d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 849c5e50b6f474df6cc113130575bcdccfafcd9e 0186e76a62f7409804c2e4785d5a11e7f82a7c52
 155407 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 8e25d522a3fc236c0c7a02541e8071afa031386b
 155411 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 9c2a02740f7f91543caa8fab6d2ab2bbc7c40742
 155414 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 9dda47cb702ccb9663aec9c78ac3fdc3d4076b1c
 155419 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 9c2a02740f7f91543caa8fab6d2ab2bbc7c40742
 155427 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 9dda47cb702ccb9663aec9c78ac3fdc3d4076b1c
 155435 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 9c2a02740f7f91543caa8fab6d2ab2bbc7c40742
Searching for interesting versions
 Result found: flight 151388 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 9dda47cb702ccb9663aec9c78ac3fdc3d4076b1c, results HASH(0x56277e795578) HASH(0x56277e361238) HASH(0x56277e710bf8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1\
 e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 3e039e12ecfdefbf3ecbc5a63052620a1fe51ad5, results HASH(0x56277e709690) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f73401907\
 6ec1a2b4213142bb 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 320e7a7369245d4304ac822e67740a7ea147e7a2, results HASH(0x56277e7915d0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1b461403ee723dab01d5828714cca0b9396a6b3c d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 a81e6557b9864e4288a63cbbbd3a6f98d3a74862, results HASH(0x56277e773140) For basis\
  failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 53b40c9c6d108e8c0e1500a288638623fee92bca d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 1336ca17742471fc4a59879ae2f637a59530a933, results HASH(0x56277e7912d0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9275bb82caf95c31c2e5\
 8a5c14b3feabf46bdf0b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 1336ca17742471fc4a59879ae2f637a59530a933, results HASH(0x56277e7502a8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a4a2258a1fec66665481b0bd929b049921cb07a0 d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb d11c75185276ded944f2ea0277532b7fee8\
 49bbc 050fe48dc981e0488de1f6c6c07d8110f3b7523b, results HASH(0x56277e714c08) HASH(0x56277e78abe8) Result found: flight 155152 (fail), for basis failure (at ancestor ~2981)
 Repro found: flight 155361 (pass), for basis pass
 Repro found: flight 155404 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 9dda47cb702ccb9663aec9c78ac3fdc3d4076b1c
No revisions left to test, checking graph state.
 Result found: flight 155400 (pass), for last pass
 Result found: flight 155411 (fail), for first failure
 Repro found: flight 155414 (pass), for last pass
 Repro found: flight 155419 (fail), for first failure
 Repro found: flight 155427 (pass), for last pass
 Repro found: flight 155435 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  9c2a02740f7f91543caa8fab6d2ab2bbc7c40742
  Bug not present: 9dda47cb702ccb9663aec9c78ac3fdc3d4076b1c
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/155435/


  commit 9c2a02740f7f91543caa8fab6d2ab2bbc7c40742
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Tue Sep 22 17:10:32 2020 +0200
  
      evtchn: convert per-channel lock to be IRQ-safe
      
      ... in order for send_guest_{global,vcpu}_virq() to be able to make use
      of it.
      
      This is part of XSA-343.
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Acked-by: Julien Grall <jgrall@amazon.com>

pnmtopng: 123 colors found
Revision graph left in /home/logs/results/bisect/xen-4.12-testing/test-amd64-amd64-xl-xsm.guest-start.{dot,ps,png,html,svg}.
----------------------------------------
155435: tolerable ALL FAIL

flight 155435 xen-4.12-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/155435/

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


