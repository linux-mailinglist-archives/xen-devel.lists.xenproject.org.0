Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDF327F278
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 21:18:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.911.3129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNhcf-0005oj-TE; Wed, 30 Sep 2020 19:18:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911.3129; Wed, 30 Sep 2020 19:18:41 +0000
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
	id 1kNhcf-0005oL-Os; Wed, 30 Sep 2020 19:18:41 +0000
Received: by outflank-mailman (input) for mailman id 911;
 Wed, 30 Sep 2020 19:18:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZS8s=DH=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kNhce-0005nl-LI
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 19:18:40 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c592afe0-28bc-4947-baee-6e3f078cbfe4;
 Wed, 30 Sep 2020 19:18:33 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kNhcW-0001vL-S0; Wed, 30 Sep 2020 19:18:32 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kNhcW-0000RL-L6; Wed, 30 Sep 2020 19:18:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kNhcW-0005gx-Kb; Wed, 30 Sep 2020 19:18:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ZS8s=DH=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kNhce-0005nl-LI
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 19:18:40 +0000
X-Inumbo-ID: c592afe0-28bc-4947-baee-6e3f078cbfe4
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c592afe0-28bc-4947-baee-6e3f078cbfe4;
	Wed, 30 Sep 2020 19:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
	bh=O0VJBd4r0CNrx04+ko0/eG8WmSX8PxWcivr32Eky17I=; b=H1UuM5v178pLwQ2GOTUEofdEOm
	XAdLrfQTj2szxuOdCUAr258rSeE8LDVu1G2ZaiioUNac7GSjnbLMrgaHSiCe0U9utOiZXYGSX0k5k
	M5yCJ5QKTnDG6ZyzHpjL6WNBMBZsq61USlFRtAFj73MS1r1Y7hm4KP0uB7A+S+YuAXY8=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kNhcW-0001vL-S0; Wed, 30 Sep 2020 19:18:32 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kNhcW-0000RL-L6; Wed, 30 Sep 2020 19:18:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kNhcW-0005gx-Kb; Wed, 30 Sep 2020 19:18:32 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-4.11-testing bisection] complete test-amd64-amd64-xl-xsm
Message-Id: <E1kNhcW-0005gx-Kb@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 30 Sep 2020 19:18:32 +0000

branch xen-4.11-testing
xenbranch xen-4.11-testing
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
  Bug introduced:  3def8466383ab5abd17f1436d085348c2994722b
  Bug not present: cc1561a3a4e6c1b4125953703338c545ba6d14fb
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/155151/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.11-testing/test-amd64-amd64-xl-xsm.guest-start.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.11-testing/test-amd64-amd64-xl-xsm.guest-start --summary-out=tmp/155151.bisection-summary --basis-template=151714 --blessings=real,real-bisect xen-4.11-testing test-amd64-amd64-xl-xsm guest-start
Searching for failure / basis pass:
 155066 fail [host=huxelrebe0] / 151714 [host=elbling1] 151318 [host=rimava1] 151295 [host=chardonnay1] 151279 [host=huxelrebe1] 151260 [host=elbling0] 151234 [host=albana1] 151204 [host=fiano0] 151166 [host=godello1] 151140 [host=albana0] 151093 ok.
Failure / basis pass flights: 155066 / 151093
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 dd5c7e3c5282b084daa5bbf0ec229cec699b2c17 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 3263f257caf8e4465e9dca84a88fa0e68be74280
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3ee4f6cb360a877d171f2f9bb76b0d46d2cfa985 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 2e3de6253422112ae43e608661ba94ea6b345694 2b77729888fb851ab96e7f77bc854122626b4861
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#3ee4f6cb360a877d171f2f9bb76b0d46d2cfa985-dd5c7e3c5282b084daa5bbf0ec229cec699b2c17 git://xenbits.xen.org/qemu-xen-traditional.git#c8ea0457495342c417c3dc033bb\
 a25148b279f60-c8ea0457495342c417c3dc033bba25148b279f60 git://xenbits.xen.org/qemu-xen.git#06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad-06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad git://xenbits.xen.org/osstest/seabios.git#2e3de6253422112ae43e608661ba94ea6b345694-155821a1990b6de78dde5f98fa5ab90e802021e0 git://xenbits.xen.org/xen.git#2b77729888fb851ab96e7f77bc854122626b4861-3263f257caf8e4465e9dca84a88fa0e68be74280
Loaded 12581 nodes in revision graph
Searching for test results:
 151061 [host=pinot0]
 151093 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3ee4f6cb360a877d171f2f9bb76b0d46d2cfa985 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 2e3de6253422112ae43e608661ba94ea6b345694 2b77729888fb851ab96e7f77bc854122626b4861
 151140 [host=albana0]
 151166 [host=godello1]
 151204 [host=fiano0]
 151260 [host=elbling0]
 151234 [host=albana1]
 151295 [host=chardonnay1]
 151279 [host=huxelrebe1]
 151318 [host=rimava1]
 151714 [host=elbling1]
 154619 fail irrelevant
 154649 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 3263f257caf8e4465e9dca84a88fa0e68be74280
 154740 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 dd5c7e3c5282b084daa5bbf0ec229cec699b2c17 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 3263f257caf8e4465e9dca84a88fa0e68be74280
 155013 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 dd5c7e3c5282b084daa5bbf0ec229cec699b2c17 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 3263f257caf8e4465e9dca84a88fa0e68be74280
 155119 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3ee4f6cb360a877d171f2f9bb76b0d46d2cfa985 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 2e3de6253422112ae43e608661ba94ea6b345694 2b77729888fb851ab96e7f77bc854122626b4861
 155122 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 dd5c7e3c5282b084daa5bbf0ec229cec699b2c17 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 3263f257caf8e4465e9dca84a88fa0e68be74280
 155124 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c2db6a86a25508725db8018c62dd39f92ae6ee79 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad d9c812dda519a1a73e8370e1b81ddf46eb22ed16 ddaaccbbab6b19bf21ed2c097f3055a3c2544c8d
 155127 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b7508ad784d16a5208c8d12dff43aef6df0835b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 ddaaccbbab6b19bf21ed2c097f3055a3c2544c8d
 155129 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0c5c45a1337f82569aa9e60323e1a05a0cbbad74 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 ddaaccbbab6b19bf21ed2c097f3055a3c2544c8d
 155130 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a09df5d2e1a7126e45198200628e388564f74668 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 ddaaccbbab6b19bf21ed2c097f3055a3c2544c8d
 155134 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 ddaaccbbab6b19bf21ed2c097f3055a3c2544c8d
 155135 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 9703a2fd74d91e29f6f913115a98c78426854305
 155137 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 cc1561a3a4e6c1b4125953703338c545ba6d14fb
 155066 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 dd5c7e3c5282b084daa5bbf0ec229cec699b2c17 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 3263f257caf8e4465e9dca84a88fa0e68be74280
 155139 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 30b3f297603eebd7874ca3b5f9cbf7268b040046
 155141 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 3def8466383ab5abd17f1436d085348c2994722b
 155143 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 cc1561a3a4e6c1b4125953703338c545ba6d14fb
 155146 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 3def8466383ab5abd17f1436d085348c2994722b
 155148 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 cc1561a3a4e6c1b4125953703338c545ba6d14fb
 155151 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 3def8466383ab5abd17f1436d085348c2994722b
Searching for interesting versions
 Result found: flight 151093 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 cc1561a3a4e6c1b4125953703338c545ba6d14fb, results HASH(0x560f31f1f578) HASH(0x560f311b5f40) HASH(0x560f31edc818) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1\
 e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 9703a2fd74d91e29f6f913115a98c78426854305, results HASH(0x560f31ed58d8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad7\
 4c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 ddaaccbbab6b19bf21ed2c097f3055a3c2544c8d, results HASH(0x560f31f17530) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a09df5d2e1a7126e45198200628e388564f74668 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 ddaaccbbab6b19bf21ed2c097f3055a3c2544c8d, results HASH(0x560f31f1d570) For basis\
  failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0c5c45a1337f82569aa9e60323e1a05a0cbbad74 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 ddaaccbbab6b19bf21ed2c097f3055a3c2544c8d, results HASH(0x560f31ef7318) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b7508ad784d16a5208c\
 8d12dff43aef6df0835b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 ddaaccbbab6b19bf21ed2c097f3055a3c2544c8d, results HASH(0x560f31f15528) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c2db6a86a25508725db8018c62dd39f92ae6ee79 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad d9c812dda519a1a73e8370e1b81ddf46eb2\
 2ed16 ddaaccbbab6b19bf21ed2c097f3055a3c2544c8d, results HASH(0x560f31f11518) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3ee4f6cb360a877d171f2f9bb76b0d46d2cfa985 c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 2e3de6253422112ae43e608661ba94ea6b345694 2b77729888fb851ab96e7f77bc854122626b4861, results HASH(0x560f31ef26e0) HASH(0x560f31f062a0) Result found: flight 154649 (fail), for \
 basis failure (at ancestor ~907)
 Repro found: flight 155119 (pass), for basis pass
 Repro found: flight 155122 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b c8ea0457495342c417c3dc033bba25148b279f60 06fbdaf7d6c43b55339d4ad74c77c9be84ae41ad 155821a1990b6de78dde5f98fa5ab90e802021e0 cc1561a3a4e6c1b4125953703338c545ba6d14fb
No revisions left to test, checking graph state.
 Result found: flight 155137 (pass), for last pass
 Result found: flight 155141 (fail), for first failure
 Repro found: flight 155143 (pass), for last pass
 Repro found: flight 155146 (fail), for first failure
 Repro found: flight 155148 (pass), for last pass
 Repro found: flight 155151 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  3def8466383ab5abd17f1436d085348c2994722b
  Bug not present: cc1561a3a4e6c1b4125953703338c545ba6d14fb
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/155151/


  commit 3def8466383ab5abd17f1436d085348c2994722b
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Tue Sep 22 17:21:27 2020 +0200
  
      evtchn: convert per-channel lock to be IRQ-safe
      
      ... in order for send_guest_{global,vcpu}_virq() to be able to make use
      of it.
      
      This is part of XSA-343.
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Acked-by: Julien Grall <jgrall@amazon.com>

pnmtopng: 121 colors found
Revision graph left in /home/logs/results/bisect/xen-4.11-testing/test-amd64-amd64-xl-xsm.guest-start.{dot,ps,png,html,svg}.
----------------------------------------
155151: tolerable ALL FAIL

flight 155151 xen-4.11-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/155151/

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


