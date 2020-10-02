Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F35A281A17
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 19:50:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2289.6841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOPBY-0002yF-FD; Fri, 02 Oct 2020 17:49:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2289.6841; Fri, 02 Oct 2020 17:49:36 +0000
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
	id 1kOPBY-0002xs-Bo; Fri, 02 Oct 2020 17:49:36 +0000
Received: by outflank-mailman (input) for mailman id 2289;
 Fri, 02 Oct 2020 17:49:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6tcj=DJ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kOPBW-0002xK-OU
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 17:49:34 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 47d46537-e3ff-49f7-9109-1f6a9e5c4344;
 Fri, 02 Oct 2020 17:49:26 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kOPBO-0005sS-Ae; Fri, 02 Oct 2020 17:49:26 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kOPBO-000304-4K; Fri, 02 Oct 2020 17:49:26 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kOPBO-0001rQ-3q; Fri, 02 Oct 2020 17:49:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=6tcj=DJ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kOPBW-0002xK-OU
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 17:49:34 +0000
X-Inumbo-ID: 47d46537-e3ff-49f7-9109-1f6a9e5c4344
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 47d46537-e3ff-49f7-9109-1f6a9e5c4344;
	Fri, 02 Oct 2020 17:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
	bh=PeV25iYY84fcI1ARdpMT8AQsObe/shS1MbapH8yCWNQ=; b=1cpu8ZmFunZ1Eat5w6dtBWJaYL
	R2GUNWfa7n3msZvaBM1F3KETSbcAqLIK19zLrtBMBYFtY5sCgw6k6r/FLe89POBZ3+EYa47dypsjv
	JTxOK9tKqXPYwFbIsw0/lwmYc4Bz0ZjT47aly3xDyO29SQGHbDPP16BOmlvJ+vWQ3P2A=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kOPBO-0005sS-Ae; Fri, 02 Oct 2020 17:49:26 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kOPBO-000304-4K; Fri, 02 Oct 2020 17:49:26 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kOPBO-0001rQ-3q; Fri, 02 Oct 2020 17:49:26 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-4.11-testing bisection] complete test-amd64-i386-xl-qemut-debianhvm-i386-xsm
Message-Id: <E1kOPBO-0001rQ-3q@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 02 Oct 2020 17:49:26 +0000

branch xen-4.11-testing
xenbranch xen-4.11-testing
job test-amd64-i386-xl-qemut-debianhvm-i386-xsm
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
  Bug introduced:  3def8466383ab5abd17f1436d085348c2994722b
  Bug not present: cc1561a3a4e6c1b4125953703338c545ba6d14fb
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/155344/


  commit 3def8466383ab5abd17f1436d085348c2994722b
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Tue Sep 22 17:21:27 2020 +0200
  
      evtchn: convert per-channel lock to be IRQ-safe
      
      ... in order for send_guest_{global,vcpu}_virq() to be able to make use
      of it.
      
      This is part of XSA-343.
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Acked-by: Julien Grall <jgrall@amazon.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.11-testing/test-amd64-i386-xl-qemut-debianhvm-i386-xsm.debian-hvm-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.11-testing/test-amd64-i386-xl-qemut-debianhvm-i386-xsm.debian-hvm-install --summary-out=tmp/155344.bisection-summary --basis-template=151714 --blessings=real,real-bisect xen-4.11-testing test-amd64-i386-xl-qemut-debianhvm-i386-xsm debian-hvm-install
Searching for failure / basis pass:
 155140 fail [host=albana1] / 151714 [host=fiano1] 151318 [host=fiano1] 151295 [host=chardonnay0] 151279 [host=elbling0] 151260 [host=fiano0] 151234 [host=pinot1] 151204 [host=pinot0] 151166 [host=huxelrebe0] 151140 [host=rimava1] 151093 [host=albana0] 151061 [host=chardonnay1] 151035 ok.
Failure / basis pass flights: 155140 / 151035
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2793a49565488e419d10ba029c838f4b7efdba38 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 3263f257caf8e4465e9dca84a88fa0e68be74280
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 dafce295e6f447ed8905db4e29241e2c6c2a4389 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 2e3de6253422112ae43e608661ba94ea6b345694 9be79927a6395f12c9e24afaccf6acbaf81d402e
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#dafce295e6f447ed8905db4e29241e2c6c2a4389-2793a49565488e419d10ba029c838f4b7efdba38 git://xenbits.xen.org/qemu-xen-traditional.git#c8ea0457495342c417c3dc033bb\
 a25148b279f60-c8ea0457495342c417c3dc033bba25148b279f60 git://xenbits.xen.org/qemu-xen.git#06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad-06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad git://xenbits.xen.org/osstest/seabios.git#2e3de6253422112ae43e608661ba94ea6b345694-41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 git://xenbits.xen.org/xen.git#9be79927a6395f12c9e24afaccf6acbaf81d402e-3263f257caf8e4465e9dca84a88fa0e68be74280
Loaded 12583 nodes in revision graph
Searching for test results:
 151035 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 dafce295e6f447ed8905db4e29241e2c6c2a4389 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 2e3de6253422112ae43e608661ba94ea6b345694 9be79927a6395f12c9e24afaccf6acbaf81d402e
 151012 []
 151061 [host=chardonnay1]
 151093 [host=albana0]
 151140 [host=rimava1]
 151166 [host=huxelrebe0]
 151204 [host=pinot0]
 151260 [host=fiano0]
 151234 [host=pinot1]
 151295 [host=chardonnay0]
 151279 [host=elbling0]
 151318 [host=fiano1]
 151714 [host=fiano1]
 154619 fail irrelevant
 154649 fail irrelevant
 154740 fail irrelevant
 155013 fail irrelevant
 155066 fail irrelevant
 155171 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 dafce295e6f447ed8905db4e29241e2c6c2a4389 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 2e3de6253422112ae43e608661ba94ea6b345694 9be79927a6395f12c9e24afaccf6acbaf81d402e
 155259 fail irrelevant
 155263 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2eea9c6fdf948902c7f2d3ce7f1a69a22ef48870 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad d9c812dda519a1a73e8370e1b81ddf46eb22ed16 ddaaccbbab6b19bf21ed2c097f3055a3c2544c8d
 155267 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 437eb3f7a8db7681afe0e6064d3a8edb12abb766 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 ddaaccbbab6b19bf21ed2c097f3055a3c2544c8d
 155274 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cbccf995920a28071f5403b847f29ebf8b732fa9 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 ddaaccbbab6b19bf21ed2c097f3055a3c2544c8d
 155140 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2793a49565488e419d10ba029c838f4b7efdba38 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 3263f257caf8e4465e9dca84a88fa0e68be74280
 155278 pass irrelevant
 155286 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2793a49565488e419d10ba029c838f4b7efdba38 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 3263f257caf8e4465e9dca84a88fa0e68be74280
 155292 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7faece69854cbcc593643182581b5d7f99b7dab6 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 ddaaccbbab6b19bf21ed2c097f3055a3c2544c8d
 155296 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 6e9de083d801104f50a78f5d8e872778a776c682
 155305 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 aec99d9bc3f7459e457e3346b493e534ccbdee8a c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 3263f257caf8e4465e9dca84a88fa0e68be74280
 155311 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 3e565a9c603daebcf50e067c07aed7f0c4b2a6e0
 155314 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 3def8466383ab5abd17f1436d085348c2994722b
 155317 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 cc1561a3a4e6c1b4125953703338c545ba6d14fb
 155324 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 3def8466383ab5abd17f1436d085348c2994722b
 155326 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 cc1561a3a4e6c1b4125953703338c545ba6d14fb
 155329 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 3def8466383ab5abd17f1436d085348c2994722b
 155332 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 cc1561a3a4e6c1b4125953703338c545ba6d14fb
 155344 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 3def8466383ab5abd17f1436d085348c2994722b
Searching for interesting versions
 Result found: flight 151035 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 cc1561a3a4e6c1b4125953703338c545ba6d14fb, results HASH(0x55dd946fca08) HASH(0x55dd946ea070) HASH(0x55dd939a38c0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1\
 e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 6e9de083d801104f50a78f5d8e872778a776c682, results HASH(0x55dd939b5928) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7faece69854cbcc593643182581b5d7f99b7dab6 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad7\
 4c77c9be84ae41ad 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 ddaaccbbab6b19bf21ed2c097f3055a3c2544c8d, results HASH(0x55dd946f83d0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cbccf995920a28071f5403b847f29ebf8b732fa9 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 ddaaccbbab6b19bf21ed2c097f3055a3c2544c8d, results HASH(0x55dd946e9148) For basis\
  failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 437eb3f7a8db7681afe0e6064d3a8edb12abb766 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 ddaaccbbab6b19bf21ed2c097f3055a3c2544c8d, results HASH(0x55dd946bf9c0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2eea9c6fdf948902c7f2\
 d3ce7f1a69a22ef48870 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad d9c812dda519a1a73e8370e1b81ddf46eb22ed16 ddaaccbbab6b19bf21ed2c097f3055a3c2544c8d, results HASH(0x55dd946d0170) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 dafce295e6f447ed8905db4e29241e2c6c2a4389 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 2e3de6253422112ae43e608661ba94ea6b3\
 45694 9be79927a6395f12c9e24afaccf6acbaf81d402e, results HASH(0x55dd946cde68) HASH(0x55dd946b9ca8) Result found: flight 155140 (fail), for basis failure (at ancestor ~927)
 Repro found: flight 155171 (pass), for basis pass
 Repro found: flight 155286 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 cc1561a3a4e6c1b4125953703338c545ba6d14fb
No revisions left to test, checking graph state.
 Result found: flight 155317 (pass), for last pass
 Result found: flight 155324 (fail), for first failure
 Repro found: flight 155326 (pass), for last pass
 Repro found: flight 155329 (fail), for first failure
 Repro found: flight 155332 (pass), for last pass
 Repro found: flight 155344 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  3def8466383ab5abd17f1436d085348c2994722b
  Bug not present: cc1561a3a4e6c1b4125953703338c545ba6d14fb
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/155344/


  commit 3def8466383ab5abd17f1436d085348c2994722b
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Tue Sep 22 17:21:27 2020 +0200
  
      evtchn: convert per-channel lock to be IRQ-safe
      
      ... in order for send_guest_{global,vcpu}_virq() to be able to make use
      of it.
      
      This is part of XSA-343.
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Acked-by: Julien Grall <jgrall@amazon.com>

pnmtopng: 129 colors found
Revision graph left in /home/logs/results/bisect/xen-4.11-testing/test-amd64-i386-xl-qemut-debianhvm-i386-xsm.debian-hvm-install.{dot,ps,png,html,svg}.
----------------------------------------
155344: tolerable ALL FAIL

flight 155344 xen-4.11-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/155344/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm 10 debian-hvm-install fail baseline untested


jobs:
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  fail    


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


