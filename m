Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B9A282071
	for <lists+xen-devel@lfdr.de>; Sat,  3 Oct 2020 04:14:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2429.7138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOX3E-0007pL-I2; Sat, 03 Oct 2020 02:13:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2429.7138; Sat, 03 Oct 2020 02:13:32 +0000
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
	id 1kOX3E-0007oz-Ek; Sat, 03 Oct 2020 02:13:32 +0000
Received: by outflank-mailman (input) for mailman id 2429;
 Sat, 03 Oct 2020 02:13:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cIIx=DK=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kOX3C-0007ot-5a
 for xen-devel@lists.xenproject.org; Sat, 03 Oct 2020 02:13:30 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 60c3857c-f2db-4abb-9c00-4813df220fe2;
 Sat, 03 Oct 2020 02:13:22 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kOX34-0000zW-BJ; Sat, 03 Oct 2020 02:13:22 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kOX34-0000Sf-2t; Sat, 03 Oct 2020 02:13:22 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kOX34-0006kw-2Q; Sat, 03 Oct 2020 02:13:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=cIIx=DK=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kOX3C-0007ot-5a
	for xen-devel@lists.xenproject.org; Sat, 03 Oct 2020 02:13:30 +0000
X-Inumbo-ID: 60c3857c-f2db-4abb-9c00-4813df220fe2
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 60c3857c-f2db-4abb-9c00-4813df220fe2;
	Sat, 03 Oct 2020 02:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
	bh=qOy58dXuzXsYnISBtAqPESuThWlvttHf06DAH0XGIZs=; b=uK3d2/thYZE7/eZesbjjRLF0Mh
	bpqZGsQr24Uwz9tsksrTqhbSZsSmWSd+aij/l0N7DpPseXhskpQcqf117uhf6L2TDlBeAqHPMlp/L
	s5xx5uYfU0/vv4BowQPaJVOgCb+BOaf7X2p95V/5qx3+kU/VjhrT80Aeu3NK17/xAEh4=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kOX34-0000zW-BJ; Sat, 03 Oct 2020 02:13:22 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kOX34-0000Sf-2t; Sat, 03 Oct 2020 02:13:22 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kOX34-0006kw-2Q; Sat, 03 Oct 2020 02:13:22 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-4.14-testing bisection] complete test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm
Message-Id: <E1kOX34-0006kw-2Q@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 03 Oct 2020 02:13:22 +0000

branch xen-4.14-testing
xenbranch xen-4.14-testing
job test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/155359/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.14-testing/test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm.debian-hvm-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.14-testing/test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm.debian-hvm-install --summary-out=tmp/155359.bisection-summary --basis-template=154350 --blessings=real,real-bisect xen-4.14-testing test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm debian-hvm-install
Searching for failure / basis pass:
 155173 fail [host=huxelrebe0] / 154350 [host=chardonnay0] 154148 [host=albana1] 154116 [host=elbling0] 152545 [host=albana1] 152537 [host=huxelrebe1] 152531 [host=godello0] 152153 [host=albana0] 152124 [host=huxelrebe1] 152081 [host=pinot0] 152061 [host=godello1] 152043 [host=elbling1] 151922 [host=godello0] 151899 [host=fiano1] 151892 ok.
Failure / basis pass flights: 155173 / 151892
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2793a49565488e419d10ba029c838f4b7efdba38 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 f37a1cf023b277d0d49323bf322ce3ff0c92262d
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d9a4084544134eea50f62e88d79c466ae91f0455 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 88ab0c15525ced2eefe39220742efe4769089ad8 02d69864b51a4302a148c28d6d391238a6778b4b
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#d9a4084544134eea50f62e88d79c466ae91f0455-2793a49565488e419d10ba029c838f4b7efdba38 git://xenbits.xen.org/qemu-xen-traditional.git#3c659044118e34603161457db99\
 34a34f816d78b-3c659044118e34603161457db9934a34f816d78b git://xenbits.xen.org/qemu-xen.git#ea6d3cd1ed79d824e605a70c3626bc437c386260-ea6d3cd1ed79d824e605a70c3626bc437c386260 git://xenbits.xen.org/osstest/seabios.git#88ab0c15525ced2eefe39220742efe4769089ad8-41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 git://xenbits.xen.org/xen.git#02d69864b51a4302a148c28d6d391238a6778b4b-f37a1cf023b277d0d49323bf322ce3ff0c92262d
Loaded 12583 nodes in revision graph
Searching for test results:
 151892 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d9a4084544134eea50f62e88d79c466ae91f0455 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 88ab0c15525ced2eefe39220742efe4769089ad8 02d69864b51a4302a148c28d6d391238a6778b4b
 151899 [host=fiano1]
 151922 [host=godello0]
 152061 [host=godello1]
 152043 [host=elbling1]
 152081 [host=pinot0]
 152124 [host=huxelrebe1]
 152153 [host=albana0]
 152531 [host=godello0]
 152537 [host=huxelrebe1]
 152545 [host=albana1]
 154116 [host=elbling0]
 154148 [host=albana1]
 154350 [host=chardonnay0]
 154617 fail irrelevant
 154641 fail irrelevant
 155016 fail irrelevant
 155087 fail irrelevant
 155219 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d9a4084544134eea50f62e88d79c466ae91f0455 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 88ab0c15525ced2eefe39220742efe4769089ad8 02d69864b51a4302a148c28d6d391238a6778b4b
 155280 fail irrelevant
 155285 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 422e93e1de6f265ff48eaacc8cf7c44d6401062e 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 c3a0fc22af90ef28e68b116c6a49d9cec57f71cf
 155289 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a048af3c9073e4b8108e6cf920bbb35574059639 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 c3a0fc22af90ef28e68b116c6a49d9cec57f71cf
 155293 pass irrelevant
 155173 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2793a49565488e419d10ba029c838f4b7efdba38 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 f37a1cf023b277d0d49323bf322ce3ff0c92262d
 155298 pass irrelevant
 155304 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2793a49565488e419d10ba029c838f4b7efdba38 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 f37a1cf023b277d0d49323bf322ce3ff0c92262d
 155307 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1b461403ee723dab01d5828714cca0b9396a6b3c 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 28855ebcdbfa437e60bc16c761405476fe16bc39
 155312 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 5eab5f0543e4f5fc52f7e2d823a29a6b1567fc16
 155315 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 43eceee913cc76e533233568ca9390be3d080578
 155319 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 f5469067ee0260673ca1e554ff8888512a55ccfc
 155322 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 2ee270e126458471b178ca1e5d7d8d0afc48be39
 155328 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 b8c2efbe7b3e8fa5f0b0a3679afccd1204949070
 155333 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 9b9fc8e391b6d5afa83f90271fdbd0e13871e841
 155343 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 2ee270e126458471b178ca1e5d7d8d0afc48be39
 155350 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 9b9fc8e391b6d5afa83f90271fdbd0e13871e841
 155353 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 2ee270e126458471b178ca1e5d7d8d0afc48be39
 155355 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 9b9fc8e391b6d5afa83f90271fdbd0e13871e841
 155359 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 2ee270e126458471b178ca1e5d7d8d0afc48be39
Searching for interesting versions
 Result found: flight 151892 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 9b9fc8e391b6d5afa83f90271fdbd0e13871e841, results HASH(0x559809207f90) HASH(0x55980921d858) HASH(0x5598091fcd18) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1\
 e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 b8c2efbe7b3e8fa5f0b0a3679afccd1204949070, results HASH(0x5598091f0098) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c\
 3626bc437c386260 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 f5469067ee0260673ca1e554ff8888512a55ccfc, results HASH(0x55980921fb60) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 5eab5f0543e4f5fc52f7e2d823a29a6b1567fc16, results HASH(0x559809207968) For basis\
  failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1b461403ee723dab01d5828714cca0b9396a6b3c 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 28855ebcdbfa437e60bc16c761405476fe16bc39, results HASH(0x5598077939a0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a048af3c9073e4b8108e\
 6cf920bbb35574059639 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 c3a0fc22af90ef28e68b116c6a49d9cec57f71cf, results HASH(0x559809207068) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 422e93e1de6f265ff48eaacc8cf7c44d6401062e 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802\
 021e0 c3a0fc22af90ef28e68b116c6a49d9cec57f71cf, results HASH(0x559809205960) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d9a4084544134eea50f62e88d79c466ae91f0455 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 88ab0c15525ced2eefe39220742efe4769089ad8 02d69864b51a4302a148c28d6d391238a6778b4b, results HASH(0x5598091f83e0) HASH(0x5598091eb460) Result found: flight 155173 (fail), for \
 basis failure (at ancestor ~5143)
 Repro found: flight 155219 (pass), for basis pass
 Repro found: flight 155304 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 9b9fc8e391b6d5afa83f90271fdbd0e13871e841
No revisions left to test, checking graph state.
 Result found: flight 155333 (pass), for last pass
 Result found: flight 155343 (fail), for first failure
 Repro found: flight 155350 (pass), for last pass
 Repro found: flight 155353 (fail), for first failure
 Repro found: flight 155355 (pass), for last pass
 Repro found: flight 155359 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  2ee270e126458471b178ca1e5d7d8d0afc48be39
  Bug not present: 9b9fc8e391b6d5afa83f90271fdbd0e13871e841
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/155359/


  commit 2ee270e126458471b178ca1e5d7d8d0afc48be39
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Tue Sep 22 16:14:56 2020 +0200
  
      evtchn: convert per-channel lock to be IRQ-safe
      
      ... in order for send_guest_{global,vcpu}_virq() to be able to make use
      of it.
      
      This is part of XSA-343.
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Acked-by: Julien Grall <jgrall@amazon.com>

pnmtopng: 117 colors found
Revision graph left in /home/logs/results/bisect/xen-4.14-testing/test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm.debian-hvm-install.{dot,ps,png,html,svg}.
----------------------------------------
155359: tolerable ALL FAIL

flight 155359 xen-4.14-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/155359/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 10 debian-hvm-install fail baseline untested


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


