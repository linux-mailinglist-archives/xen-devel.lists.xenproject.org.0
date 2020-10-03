Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1906B282072
	for <lists+xen-devel@lfdr.de>; Sat,  3 Oct 2020 04:16:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2432.7154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOX5b-000803-23; Sat, 03 Oct 2020 02:15:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2432.7154; Sat, 03 Oct 2020 02:15:59 +0000
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
	id 1kOX5a-0007ze-TG; Sat, 03 Oct 2020 02:15:58 +0000
Received: by outflank-mailman (input) for mailman id 2432;
 Sat, 03 Oct 2020 02:15:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cIIx=DK=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kOX5Z-0007zZ-Em
 for xen-devel@lists.xenproject.org; Sat, 03 Oct 2020 02:15:57 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 379ef434-0200-482e-92f2-4b6b20cdba5b;
 Sat, 03 Oct 2020 02:15:54 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kOX5W-00012S-3Q; Sat, 03 Oct 2020 02:15:54 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kOX5V-0000Yc-Se; Sat, 03 Oct 2020 02:15:53 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kOX5V-0000DK-SB; Sat, 03 Oct 2020 02:15:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=cIIx=DK=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kOX5Z-0007zZ-Em
	for xen-devel@lists.xenproject.org; Sat, 03 Oct 2020 02:15:57 +0000
X-Inumbo-ID: 379ef434-0200-482e-92f2-4b6b20cdba5b
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 379ef434-0200-482e-92f2-4b6b20cdba5b;
	Sat, 03 Oct 2020 02:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
	bh=Vml/OXjE2eKGjV3FSJX8Be4t/2vkqAJqjZNxg9ZcEBA=; b=AJSwPfV+IryH8IypwAIMcxjtm3
	R6mu7r7fxFTQXK9mMKitdo3jyPPz8f/+ZTagi2owRofANiQj9ZUFlQGdxzPeDNIprc766l9fspRCE
	qwac6qjnZ23nuKsX06erRAsV6ccmMCFzKtGVy82oBdZGirzxgx/bzchtpOzwNcZZRjA4=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kOX5W-00012S-3Q; Sat, 03 Oct 2020 02:15:54 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kOX5V-0000Yc-Se; Sat, 03 Oct 2020 02:15:53 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kOX5V-0000DK-SB; Sat, 03 Oct 2020 02:15:53 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-4.12-testing bisection] complete test-amd64-amd64-libvirt-xsm
Message-Id: <E1kOX5V-0000DK-SB@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 03 Oct 2020 02:15:53 +0000

branch xen-4.12-testing
xenbranch xen-4.12-testing
job test-amd64-amd64-libvirt-xsm
testid guest-start

Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_gnulib https://git.savannah.gnu.org/git/gnulib.git/
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/155357/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.12-testing/test-amd64-amd64-libvirt-xsm.guest-start.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.12-testing/test-amd64-amd64-libvirt-xsm.guest-start --summary-out=tmp/155357.bisection-summary --basis-template=154601 --blessings=real,real-bisect xen-4.12-testing test-amd64-amd64-libvirt-xsm guest-start
Searching for failure / basis pass:
 155152 fail [host=fiano0] / 154601 [host=godello0] 154121 [host=godello1] 152525 [host=chardonnay0] 151715 [host=pinot0] 151388 [host=elbling1] 151367 [host=albana0] 151341 [host=fiano1] 151316 [host=huxelrebe0] 151292 [host=godello0] 151276 [host=huxelrebe1] 151248 [host=elbling0] 151227 ok.
Failure / basis pass flights: 155152 / 151227
(tree with no url: minios)
Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_gnulib https://git.savannah.gnu.org/git/gnulib.git/
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 7a05c739c26decb8ff0eef4f6c75ce3ef729532d 8089c00979a5b089cff592c6b91420e595657167 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2793a49565488e419d10ba029c838f4b7efdba38 d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 0186e76a62f7409804c2e4785d5a11e7f82a7c52
Basis pass 7a05c739c26decb8ff0eef4f6c75ce3ef729532d 8089c00979a5b089cff592c6b91420e595657167 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 2e3de6253422112ae43e608661ba94ea6b345694 06760c2bf322cef4622b56bafee74fe93ae01630
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/libvirt.git#7a05c739c26decb8ff0eef4f6c75ce3ef729532d-7a05c739c26decb8ff0eef4f6c75ce3ef729532d https://git.savannah.gnu.org/git/gnulib.git/#8089c00979a5b089cff592c6b91420e595657167-8089c00979a5b089cff592c6b91420e595657167 https://gitlab.com/keycodemap/keycodemapdb.git#16e5b0787687d8904dad2c026107409eb9bfcb95-16e5b0787687d8904dad2c026107409eb9bfcb95 git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc\
 7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#8927e2777786a43cddfaa328b0f4c41a09c629c9-2793a49565488e419d10ba029c838f4b7efdba38 git://xenbits.xen.org/qemu-xen-traditional.git#d0d8ad39ecb51cd7497cd524484fe09f50876798-d0d8ad39ecb51cd7497cd524484fe09f50876798 git://xenbits.xen.org/qemu-xen.git#8023a62081ffbe3f734019076ec1a2b4213142\
 bb-8023a62081ffbe3f734019076ec1a2b4213142bb git://xenbits.xen.org/osstest/seabios.git#2e3de6253422112ae43e608661ba94ea6b345694-41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 git://xenbits.xen.org/xen.git#06760c2bf322cef4622b56bafee74fe93ae01630-0186e76a62f7409804c2e4785d5a11e7f82a7c52
Loaded 12583 nodes in revision graph
Searching for test results:
 151161 [host=albana1]
 151227 pass 7a05c739c26decb8ff0eef4f6c75ce3ef729532d 8089c00979a5b089cff592c6b91420e595657167 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 2e3de6253422112ae43e608661ba94ea6b345694 06760c2bf322cef4622b56bafee74fe93ae01630
 151184 [host=godello1]
 151248 [host=elbling0]
 151276 [host=huxelrebe1]
 151292 [host=godello0]
 151341 [host=fiano1]
 151316 [host=huxelrebe0]
 151367 [host=albana0]
 151388 [host=elbling1]
 151715 [host=pinot0]
 152525 [host=chardonnay0]
 154121 [host=godello1]
 154601 [host=godello0]
 154622 fail irrelevant
 154663 fail irrelevant
 155014 fail irrelevant
 155075 fail irrelevant
 155210 pass 7a05c739c26decb8ff0eef4f6c75ce3ef729532d 8089c00979a5b089cff592c6b91420e595657167 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 2e3de6253422112ae43e608661ba94ea6b345694 06760c2bf322cef4622b56bafee74fe93ae01630
 155265 fail irrelevant
 155270 pass 7a05c739c26decb8ff0eef4f6c75ce3ef729532d 8089c00979a5b089cff592c6b91420e595657167 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b4b9496b3c17c76fab3ebb5a59d4c8d9b6b5c505 d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb d9c812dda519a1a73e8370e1b81ddf46eb22ed16 19e0bbb4eba8d781b972448ec01ede6ca7fa22cb
 155276 pass 7a05c739c26decb8ff0eef4f6c75ce3ef729532d 8089c00979a5b089cff592c6b91420e595657167 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fbc9cb4c8b4fc7c6aa63f47eae33d7c9849bf6e0 d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 1336ca17742471fc4a59879ae2f637a59530a933
 155152 fail 7a05c739c26decb8ff0eef4f6c75ce3ef729532d 8089c00979a5b089cff592c6b91420e595657167 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2793a49565488e419d10ba029c838f4b7efdba38 d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 0186e76a62f7409804c2e4785d5a11e7f82a7c52
 155284 pass 7a05c739c26decb8ff0eef4f6c75ce3ef729532d 8089c00979a5b089cff592c6b91420e595657167 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f94345d9eae1b359c01761be975086870a4a9de9 d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 1336ca17742471fc4a59879ae2f637a59530a933
 155291 fail 7a05c739c26decb8ff0eef4f6c75ce3ef729532d 8089c00979a5b089cff592c6b91420e595657167 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2793a49565488e419d10ba029c838f4b7efdba38 d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 41289b83ed3847dc45e7af3f1b7cb3cec6b6e7a5 0186e76a62f7409804c2e4785d5a11e7f82a7c52
 155299 pass 7a05c739c26decb8ff0eef4f6c75ce3ef729532d 8089c00979a5b089cff592c6b91420e595657167 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea9af51479fe04955443f0d366376a1008f07c94 d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 0446e3db13671032b05d19f6117d902f5c5c76fa
 155308 pass 7a05c739c26decb8ff0eef4f6c75ce3ef729532d 8089c00979a5b089cff592c6b91420e595657167 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 9dda47cb702ccb9663aec9c78ac3fdc3d4076b1c
 155313 fail 7a05c739c26decb8ff0eef4f6c75ce3ef729532d 8089c00979a5b089cff592c6b91420e595657167 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 dd5c7e3c5282b084daa5bbf0ec229cec699b2c17 d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 0186e76a62f7409804c2e4785d5a11e7f82a7c52
 155320 fail 7a05c739c26decb8ff0eef4f6c75ce3ef729532d 8089c00979a5b089cff592c6b91420e595657167 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 cfd61e688f9f1736ff0311f49040669f04ac1ea6
 155323 fail 7a05c739c26decb8ff0eef4f6c75ce3ef729532d 8089c00979a5b089cff592c6b91420e595657167 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 8e25d522a3fc236c0c7a02541e8071afa031386b
 155331 fail 7a05c739c26decb8ff0eef4f6c75ce3ef729532d 8089c00979a5b089cff592c6b91420e595657167 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 9c2a02740f7f91543caa8fab6d2ab2bbc7c40742
 155346 pass 7a05c739c26decb8ff0eef4f6c75ce3ef729532d 8089c00979a5b089cff592c6b91420e595657167 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 9dda47cb702ccb9663aec9c78ac3fdc3d4076b1c
 155351 fail 7a05c739c26decb8ff0eef4f6c75ce3ef729532d 8089c00979a5b089cff592c6b91420e595657167 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 9c2a02740f7f91543caa8fab6d2ab2bbc7c40742
 155354 pass 7a05c739c26decb8ff0eef4f6c75ce3ef729532d 8089c00979a5b089cff592c6b91420e595657167 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 9dda47cb702ccb9663aec9c78ac3fdc3d4076b1c
 155357 fail 7a05c739c26decb8ff0eef4f6c75ce3ef729532d 8089c00979a5b089cff592c6b91420e595657167 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 9c2a02740f7f91543caa8fab6d2ab2bbc7c40742
Searching for interesting versions
 Result found: flight 151227 (pass), for basis pass
 For basis failure, parent search stopping at 7a05c739c26decb8ff0eef4f6c75ce3ef729532d 8089c00979a5b089cff592c6b91420e595657167 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 9dda47cb702ccb9663aec9c78ac3fdc3d4076b1c, results HASH(0x5581412e3f68) HASH(0x5581412\
 c5130) HASH(0x5581412afb68) For basis failure, parent search stopping at 7a05c739c26decb8ff0eef4f6c75ce3ef729532d 8089c00979a5b089cff592c6b91420e595657167 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea9af51479fe04955443f0d366376a1008f07c94 d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 0446e3db13671032b05d19f6117d902f5c5c76fa, results HASH(0x5\
 581412dff30) For basis failure, parent search stopping at 7a05c739c26decb8ff0eef4f6c75ce3ef729532d 8089c00979a5b089cff592c6b91420e595657167 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f94345d9eae1b359c01761be975086870a4a9de9 d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 1336ca17742471fc4a59879ae2f637a59530a933, results HASH(0x5581412e1c38) Fo\
 r basis failure, parent search stopping at 7a05c739c26decb8ff0eef4f6c75ce3ef729532d 8089c00979a5b089cff592c6b91420e595657167 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fbc9cb4c8b4fc7c6aa63f47eae33d7c9849bf6e0 d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 1336ca17742471fc4a59879ae2f637a59530a933, results HASH(0x5581412beaf0) For basis failure\
 , parent search stopping at 7a05c739c26decb8ff0eef4f6c75ce3ef729532d 8089c00979a5b089cff592c6b91420e595657167 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b4b9496b3c17c76fab3ebb5a59d4c8d9b6b5c505 d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb d9c812dda519a1a73e8370e1b81ddf46eb22ed16 19e0bbb4eba8d781b972448ec01ede6ca7fa22cb, results HASH(0x5581412dfc30) For basis failure, parent search\
  stopping at 7a05c739c26decb8ff0eef4f6c75ce3ef729532d 8089c00979a5b089cff592c6b91420e595657167 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 2e3de6253422112ae43e608661ba94ea6b345694 06760c2bf322cef4622b56bafee74fe93ae01630, results HASH(0x5581412c8360) HASH(0x5581412af268) Result found: flight 15515\
 2 (fail), for basis failure (at ancestor ~875)
 Repro found: flight 155210 (pass), for basis pass
 Repro found: flight 155291 (fail), for basis failure
 0 revisions at 7a05c739c26decb8ff0eef4f6c75ce3ef729532d 8089c00979a5b089cff592c6b91420e595657167 16e5b0787687d8904dad2c026107409eb9bfcb95 c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 4ea6aa9471f79cc81f957d6c0e2bb238d24675e5 9dda47cb702ccb9663aec9c78ac3fdc3d4076b1c
No revisions left to test, checking graph state.
 Result found: flight 155308 (pass), for last pass
 Result found: flight 155331 (fail), for first failure
 Repro found: flight 155346 (pass), for last pass
 Repro found: flight 155351 (fail), for first failure
 Repro found: flight 155354 (pass), for last pass
 Repro found: flight 155357 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  9c2a02740f7f91543caa8fab6d2ab2bbc7c40742
  Bug not present: 9dda47cb702ccb9663aec9c78ac3fdc3d4076b1c
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/155357/


  commit 9c2a02740f7f91543caa8fab6d2ab2bbc7c40742
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Tue Sep 22 17:10:32 2020 +0200
  
      evtchn: convert per-channel lock to be IRQ-safe
      
      ... in order for send_guest_{global,vcpu}_virq() to be able to make use
      of it.
      
      This is part of XSA-343.
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Acked-by: Julien Grall <jgrall@amazon.com>

pnmtopng: 110 colors found
Revision graph left in /home/logs/results/bisect/xen-4.12-testing/test-amd64-amd64-libvirt-xsm.guest-start.{dot,ps,png,html,svg}.
----------------------------------------
155357: tolerable FAIL

flight 155357 xen-4.12-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/155357/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-libvirt-xsm 12 guest-start             fail baseline untested


jobs:
 build-amd64-libvirt                                          pass    
 test-amd64-amd64-libvirt-xsm                                 fail    


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


