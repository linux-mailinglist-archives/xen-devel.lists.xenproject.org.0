Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A252829E0
	for <lists+xen-devel@lfdr.de>; Sun,  4 Oct 2020 11:46:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2724.7768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kP0aq-0005FA-81; Sun, 04 Oct 2020 09:46:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2724.7768; Sun, 04 Oct 2020 09:46:12 +0000
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
	id 1kP0aq-0005El-4s; Sun, 04 Oct 2020 09:46:12 +0000
Received: by outflank-mailman (input) for mailman id 2724;
 Sun, 04 Oct 2020 09:46:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vMX8=DL=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kP0ao-0005Eg-Ez
 for xen-devel@lists.xenproject.org; Sun, 04 Oct 2020 09:46:10 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ba9cd145-ab77-41cb-a2d0-b63701a99f0c;
 Sun, 04 Oct 2020 09:46:07 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kP0ak-0001nf-Vh; Sun, 04 Oct 2020 09:46:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kP0ak-0008DX-Nd; Sun, 04 Oct 2020 09:46:06 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kP0ak-0008By-NC; Sun, 04 Oct 2020 09:46:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=vMX8=DL=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kP0ao-0005Eg-Ez
	for xen-devel@lists.xenproject.org; Sun, 04 Oct 2020 09:46:10 +0000
X-Inumbo-ID: ba9cd145-ab77-41cb-a2d0-b63701a99f0c
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ba9cd145-ab77-41cb-a2d0-b63701a99f0c;
	Sun, 04 Oct 2020 09:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
	bh=daLi4lNdYNPhqL1tYp8AgUy+dvDI4YGY2F9BtQHr5Fo=; b=SB3bR3z1L3Vz+Bc+rHt37exBg4
	/O8COo1vsKWRh27/4c7nApgHSw/XZbzVvxbGjR7iMoJ8CwHO9eqSltn5ItWPUbkG8UGgiFnGIlpqG
	ZlaKERSpZj98TfSCVL1ddHl8GGQigffYsTLsnhYq9lEq0FbLro0vtW9/2f/L0Iur6gIQ=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kP0ak-0001nf-Vh; Sun, 04 Oct 2020 09:46:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kP0ak-0008DX-Nd; Sun, 04 Oct 2020 09:46:06 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kP0ak-0008By-NC; Sun, 04 Oct 2020 09:46:06 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-4.11-testing bisection] complete test-amd64-i386-xl-qemuu-debianhvm-i386-xsm
Message-Id: <E1kP0ak-0008By-NC@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 04 Oct 2020 09:46:06 +0000

branch xen-4.11-testing
xenbranch xen-4.11-testing
job test-amd64-i386-xl-qemuu-debianhvm-i386-xsm
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/155446/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.11-testing/test-amd64-i386-xl-qemuu-debianhvm-i386-xsm.debian-hvm-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.11-testing/test-amd64-i386-xl-qemuu-debianhvm-i386-xsm.debian-hvm-install --summary-out=tmp/155446.bisection-summary --basis-template=151714 --blessings=real,real-bisect xen-4.11-testing test-amd64-i386-xl-qemuu-debianhvm-i386-xsm debian-hvm-install
Searching for failure / basis pass:
 155281 fail [host=albana1] / 151714 [host=elbling0] 151318 [host=chardonnay0] 151295 [host=huxelrebe1] 151279 [host=fiano0] 151260 [host=elbling0] 151234 [host=elbling1] 151204 [host=huxelrebe0] 151166 [host=pinot0] 151140 ok.
Failure / basis pass flights: 155281 / 151140
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d8ab884fe9b4dd148980bf0d8673187f8fb25887 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 849c5e50b6f474df6cc113130575bcdccfafcd9e 3263f257caf8e4465e9dca84a88fa0e68be74280
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9af1064995d479df92e399a682ba7e4b2fc78415 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 2e3de6253422112ae43e608661ba94ea6b345694 2b77729888fb851ab96e7f77bc854122626b4861
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#9af1064995d479df92e399a682ba7e4b2fc78415-d8ab884fe9b4dd148980bf0d8673187f8fb25887 git://xenbits.xen.org/qemu-xen-traditional.git#c8ea0457495342c417c3dc033bb\
 a25148b279f60-c8ea0457495342c417c3dc033bba25148b279f60 git://xenbits.xen.org/qemu-xen.git#06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad-06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad git://xenbits.xen.org/osstest/seabios.git#2e3de6253422112ae43e608661ba94ea6b345694-849c5e50b6f474df6cc113130575bcdccfafcd9e git://xenbits.xen.org/xen.git#2b77729888fb851ab96e7f77bc854122626b4861-3263f257caf8e4465e9dca84a88fa0e68be74280
Loaded 12584 nodes in revision graph
Searching for test results:
 151093 [host=chardonnay1]
 151140 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9af1064995d479df92e399a682ba7e4b2fc78415 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 2e3de6253422112ae43e608661ba94ea6b345694 2b77729888fb851ab96e7f77bc854122626b4861
 151166 [host=pinot0]
 151204 [host=huxelrebe0]
 151260 [host=elbling0]
 151234 [host=elbling1]
 151295 [host=huxelrebe1]
 151279 [host=fiano0]
 151318 [host=chardonnay0]
 151714 [host=elbling0]
 154619 fail irrelevant
 154649 fail irrelevant
 154740 fail irrelevant
 155013 fail irrelevant
 155066 fail irrelevant
 155140 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2793a49565488e419d10ba029c838f4b7efdba38 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 3263f257caf8e4465e9dca84a88fa0e68be74280
 155348 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9af1064995d479df92e399a682ba7e4b2fc78415 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 2e3de6253422112ae43e608661ba94ea6b345694 2b77729888fb851ab96e7f77bc854122626b4861
 155380 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2793a49565488e419d10ba029c838f4b7efdba38 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 3263f257caf8e4465e9dca84a88fa0e68be74280
 155383 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d0c42fdf2cf1855b0a042ef82d848c7716adefe c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad d9c812dda519a1a73e8370e1b81ddf46eb22ed16 ddaaccbbab6b19bf21ed2c097f3055a3c2544c8d
 155281 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d8ab884fe9b4dd148980bf0d8673187f8fb25887 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 849c5e50b6f474df6cc113130575bcdccfafcd9e 3263f257caf8e4465e9dca84a88fa0e68be74280
 155385 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 647aa7110f9c744dd0d27b01a50b581eb3de2a57 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 ddaaccbbab6b19bf21ed2c097f3055a3c2544c8d
 155391 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d8ab884fe9b4dd148980bf0d8673187f8fb25887 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 849c5e50b6f474df6cc113130575bcdccfafcd9e 3263f257caf8e4465e9dca84a88fa0e68be74280
 155396 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f94345d9eae1b359c01761be975086870a4a9de9 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 ddaaccbbab6b19bf21ed2c097f3055a3c2544c8d
 155405 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e97c78c546b04247191490bb1a59db471cd0368d c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 ddaaccbbab6b19bf21ed2c097f3055a3c2544c8d
 155409 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 30b3f297603eebd7874ca3b5f9cbf7268b040046
 155413 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 2fe163d70f3ae88c10f50d70a50513e395326a77
 155420 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 13f60bf98fcb3b5c5c216ee2ce536897d3a925d4
 155424 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 cc1561a3a4e6c1b4125953703338c545ba6d14fb
 155432 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 3def8466383ab5abd17f1436d085348c2994722b
 155436 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 cc1561a3a4e6c1b4125953703338c545ba6d14fb
 155441 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 3def8466383ab5abd17f1436d085348c2994722b
 155443 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 cc1561a3a4e6c1b4125953703338c545ba6d14fb
 155446 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 3def8466383ab5abd17f1436d085348c2994722b
Searching for interesting versions
 Result found: flight 151140 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 cc1561a3a4e6c1b4125953703338c545ba6d14fb, results HASH(0x559340221828) HASH(0x559340220300) HASH(0x55934022e7a8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1\
 e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 13f60bf98fcb3b5c5c216ee2ce536897d3a925d4, results HASH(0x559340219cc0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad7\
 4c77c9be84ae41ad 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 2fe163d70f3ae88c10f50d70a50513e395326a77, results HASH(0x55933f50f310) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e97c78c546b04247191490bb1a59db471cd0368d c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 ddaaccbbab6b19bf21ed2c097f3055a3c2544c8d, results HASH(0x55933e7ce508) For basis\
  failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f94345d9eae1b359c01761be975086870a4a9de9 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 ddaaccbbab6b19bf21ed2c097f3055a3c2544c8d, results HASH(0x559340229570) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 647aa7110f9c744dd0d2\
 7b01a50b581eb3de2a57 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 ddaaccbbab6b19bf21ed2c097f3055a3c2544c8d, results HASH(0x559340258d10) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2d0c42fdf2cf1855b0a042ef82d848c7716adefe c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad d9c812dda519a1a73e8370e1b81ddf46eb2\
 2ed16 ddaaccbbab6b19bf21ed2c097f3055a3c2544c8d, results HASH(0x55934024a3b0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9af1064995d479df92e399a682ba7e4b2fc78415 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 2e3de6253422112ae43e608661ba94ea6b345694 2b77729888fb851ab96e7f77bc854122626b4861, results HASH(0x5593402361c8) HASH(0x55934024a6b0) Result found: flight 155140 (fail), for \
 basis failure (at ancestor ~5542)
 Repro found: flight 155348 (pass), for basis pass
 Repro found: flight 155391 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 cc1561a3a4e6c1b4125953703338c545ba6d14fb
No revisions left to test, checking graph state.
 Result found: flight 155424 (pass), for last pass
 Result found: flight 155432 (fail), for first failure
 Repro found: flight 155436 (pass), for last pass
 Repro found: flight 155441 (fail), for first failure
 Repro found: flight 155443 (pass), for last pass
 Repro found: flight 155446 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  3def8466383ab5abd17f1436d085348c2994722b
  Bug not present: cc1561a3a4e6c1b4125953703338c545ba6d14fb
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/155446/


  commit 3def8466383ab5abd17f1436d085348c2994722b
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Tue Sep 22 17:21:27 2020 +0200
  
      evtchn: convert per-channel lock to be IRQ-safe
      
      ... in order for send_guest_{global,vcpu}_virq() to be able to make use
      of it.
      
      This is part of XSA-343.
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Acked-by: Julien Grall <jgrall@amazon.com>

pnmtopng: 127 colors found
Revision graph left in /home/logs/results/bisect/xen-4.11-testing/test-amd64-i386-xl-qemuu-debianhvm-i386-xsm.debian-hvm-install.{dot,ps,png,html,svg}.
----------------------------------------
155446: tolerable ALL FAIL

flight 155446 xen-4.11-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/155446/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 10 debian-hvm-install fail baseline untested


jobs:
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  fail    


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


