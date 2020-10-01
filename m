Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 193F227FB6F
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 10:24:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1108.3652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNtt0-0001pT-JH; Thu, 01 Oct 2020 08:24:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1108.3652; Thu, 01 Oct 2020 08:24:22 +0000
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
	id 1kNtt0-0001os-F6; Thu, 01 Oct 2020 08:24:22 +0000
Received: by outflank-mailman (input) for mailman id 1108;
 Thu, 01 Oct 2020 08:24:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GG2I=DI=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kNtsz-0001mK-JU
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 08:24:21 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fb4d1723-1e22-4c65-8089-b457b6e5fc58;
 Thu, 01 Oct 2020 08:24:15 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kNtst-00007p-DJ; Thu, 01 Oct 2020 08:24:15 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kNtst-0005XZ-2B; Thu, 01 Oct 2020 08:24:15 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kNtst-0001MU-1Y; Thu, 01 Oct 2020 08:24:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=GG2I=DI=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kNtsz-0001mK-JU
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 08:24:21 +0000
X-Inumbo-ID: fb4d1723-1e22-4c65-8089-b457b6e5fc58
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id fb4d1723-1e22-4c65-8089-b457b6e5fc58;
	Thu, 01 Oct 2020 08:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
	bh=IpY0NU6HeH5TDFRT8EP21uCUj7HfyYGEad5EmyhsYig=; b=T8kz79ezQkzbSlIlyrJWflUMl7
	clTBII7aFLKH8tfTHe4RK84h2TOe2JWiqhOblxCvJEwSwtUnT9A/J8XBzDUpx6ZGFja+xBnfjryRN
	K9DPeb6dRucIGLHn7VSmrD5SBzG6PkYJ3O8NQgUOo/X3jue8+crdhqwxQXvvMm1mXtTU=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kNtst-00007p-DJ; Thu, 01 Oct 2020 08:24:15 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kNtst-0005XZ-2B; Thu, 01 Oct 2020 08:24:15 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kNtst-0001MU-1Y; Thu, 01 Oct 2020 08:24:15 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-4.12-testing bisection] complete test-amd64-i386-xl-xsm
Message-Id: <E1kNtst-0001MU-1Y@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 01 Oct 2020 08:24:15 +0000

branch xen-4.12-testing
xenbranch xen-4.12-testing
job test-amd64-i386-xl-xsm
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/155205/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.12-testing/test-amd64-i386-xl-xsm.guest-start.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.12-testing/test-amd64-i386-xl-xsm.guest-start --summary-out=tmp/155205.bisection-summary --basis-template=154601 --blessings=real,real-bisect xen-4.12-testing test-amd64-i386-xl-xsm guest-start
Searching for failure / basis pass:
 155075 fail [host=pinot1] / 154601 [host=fiano1] 154121 [host=chardonnay0] 152525 [host=fiano1] 151715 [host=albana0] 151388 [host=rimava1] 151367 [host=huxelrebe1] 151341 [host=chardonnay1] 151316 [host=chardonnay0] 151292 [host=pinot0] 151276 [host=fiano1] 151248 [host=albana0] 151227 [host=huxelrebe0] 151184 [host=fiano0] 151161 [host=elbling0] 151128 [host=albana1] 151082 ok.
Failure / basis pass flights: 155075 / 151082
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 dd5c7e3c5282b084daa5bbf0ec229cec699b2c17 d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 0186e76a62f7409804c2e4785d5a11e7f82a7c52
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3ee4f6cb360a877d171f2f9bb76b0d46d2cfa985 d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 2e3de6253422112ae43e608661ba94ea6b345694 d58c48df8c6ca819f5e6e6f1740bb114f24f024f
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#3ee4f6cb360a877d171f2f9bb76b0d46d2cfa985-dd5c7e3c5282b084daa5bbf0ec229cec699b2c17 git://xenbits.xen.org/qemu-xen-traditional.git#d0d8ad39ecb51cd7497cd524484\
 fe09f50876798-d0d8ad39ecb51cd7497cd524484fe09f50876798 git://xenbits.xen.org/qemu-xen.git#8023a62081ffbe3f734019076ec1a2b4213142bb-8023a62081ffbe3f734019076ec1a2b4213142bb git://xenbits.xen.org/osstest/seabios.git#2e3de6253422112ae43e608661ba94ea6b345694-155821a1990b6de78dde5f98fa5ab90e802021e0 git://xenbits.xen.org/xen.git#d58c48df8c6ca819f5e6e6f1740bb114f24f024f-0186e76a62f7409804c2e4785d5a11e7f82a7c52
Loaded 12581 nodes in revision graph
Searching for test results:
 151058 [host=elbling1]
 151082 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3ee4f6cb360a877d171f2f9bb76b0d46d2cfa985 d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 2e3de6253422112ae43e608661ba94ea6b345694 d58c48df8c6ca819f5e6e6f1740bb114f24f024f
 151161 [host=elbling0]
 151128 [host=albana1]
 151227 [host=huxelrebe0]
 151184 [host=fiano0]
 151248 [host=albana0]
 151276 [host=fiano1]
 151292 [host=pinot0]
 151341 [host=chardonnay1]
 151316 [host=chardonnay0]
 151367 [host=huxelrebe1]
 151388 [host=rimava1]
 151715 [host=albana0]
 152525 [host=fiano1]
 154121 [host=chardonnay0]
 154601 [host=fiano1]
 154622 fail irrelevant
 154663 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 0186e76a62f7409804c2e4785d5a11e7f82a7c52
 155014 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 dd5c7e3c5282b084daa5bbf0ec229cec699b2c17 d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 0186e76a62f7409804c2e4785d5a11e7f82a7c52
 155077 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3ee4f6cb360a877d171f2f9bb76b0d46d2cfa985 d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 2e3de6253422112ae43e608661ba94ea6b345694 d58c48df8c6ca819f5e6e6f1740bb114f24f024f
 155138 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 dd5c7e3c5282b084daa5bbf0ec229cec699b2c17 d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 0186e76a62f7409804c2e4785d5a11e7f82a7c52
 155142 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c2db6a86a25508725db8018c62dd39f92ae6ee79 d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb d9c812dda519a1a73e8370e1b81ddf46eb22ed16 19e0bbb4eba8d781b972448ec01ede6ca7fa22cb
 155145 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 20da7ca42a33d3ef767ce4129f11496af7f67c9f d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 1336ca17742471fc4a59879ae2f637a59530a933
 155075 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 dd5c7e3c5282b084daa5bbf0ec229cec699b2c17 d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 0186e76a62f7409804c2e4785d5a11e7f82a7c52
 155149 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cdfc7ed34fd1ddfc9cb1dfbc339f940950638f8d d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 1336ca17742471fc4a59879ae2f637a59530a933
 155154 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ed0dce7d5466b6b22ff9e0923f3a3e885540bbfc d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 0446e3db13671032b05d19f6117d902f5c5c76fa
 155163 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 320e7a7369245d4304ac822e67740a7ea147e7a2
 155172 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 253a1e64d30e09ae089a060e364a01b4d442d550
 155178 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 8e25d522a3fc236c0c7a02541e8071afa031386b
 155181 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 9dda47cb702ccb9663aec9c78ac3fdc3d4076b1c
 155186 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 9c2a02740f7f91543caa8fab6d2ab2bbc7c40742
 155191 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 9dda47cb702ccb9663aec9c78ac3fdc3d4076b1c
 155195 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 9c2a02740f7f91543caa8fab6d2ab2bbc7c40742
 155201 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 9dda47cb702ccb9663aec9c78ac3fdc3d4076b1c
 155205 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 9c2a02740f7f91543caa8fab6d2ab2bbc7c40742
Searching for interesting versions
 Result found: flight 151082 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 9dda47cb702ccb9663aec9c78ac3fdc3d4076b1c, results HASH(0x55d81ddbf088) HASH(0x55d81eb1ca80) HASH(0x55d81eb091c0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1\
 e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 253a1e64d30e09ae089a060e364a01b4d442d550, results HASH(0x55d81eae5778) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f73401907\
 6ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 320e7a7369245d4304ac822e67740a7ea147e7a2, results HASH(0x55d81eaf5300) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ed0dce7d5466b6b22ff9e0923f3a3e885540bbfc d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 0446e3db13671032b05d19f6117d902f5c5c76fa, results HASH(0x55d81eaf03c8) For basis\
  failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cdfc7ed34fd1ddfc9cb1dfbc339f940950638f8d d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 1336ca17742471fc4a59879ae2f637a59530a933, results HASH(0x55d81eae7780) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 20da7ca42a33d3ef767c\
 e4129f11496af7f67c9f d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 1336ca17742471fc4a59879ae2f637a59530a933, results HASH(0x55d81eae6078) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c2db6a86a25508725db8018c62dd39f92ae6ee79 d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb d9c812dda519a1a73e8370e1b81ddf46eb2\
 2ed16 19e0bbb4eba8d781b972448ec01ede6ca7fa22cb, results HASH(0x55d81eaea6b0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3ee4f6cb360a877d171f2f9bb76b0d46d2cfa985 d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 2e3de6253422112ae43e608661ba94ea6b345694 d58c48df8c6ca819f5e6e6f1740bb114f24f024f, results HASH(0x55d81eaf6a08) HASH(0x55d81eafd948) Result found: flight 154663 (fail), for \
 basis failure (at ancestor ~874)
 Repro found: flight 155077 (pass), for basis pass
 Repro found: flight 155138 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 9dda47cb702ccb9663aec9c78ac3fdc3d4076b1c
No revisions left to test, checking graph state.
 Result found: flight 155181 (pass), for last pass
 Result found: flight 155186 (fail), for first failure
 Repro found: flight 155191 (pass), for last pass
 Repro found: flight 155195 (fail), for first failure
 Repro found: flight 155201 (pass), for last pass
 Repro found: flight 155205 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  9c2a02740f7f91543caa8fab6d2ab2bbc7c40742
  Bug not present: 9dda47cb702ccb9663aec9c78ac3fdc3d4076b1c
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/155205/


  commit 9c2a02740f7f91543caa8fab6d2ab2bbc7c40742
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Tue Sep 22 17:10:32 2020 +0200
  
      evtchn: convert per-channel lock to be IRQ-safe
      
      ... in order for send_guest_{global,vcpu}_virq() to be able to make use
      of it.
      
      This is part of XSA-343.
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Acked-by: Julien Grall <jgrall@amazon.com>

pnmtopng: 97 colors found
Revision graph left in /home/logs/results/bisect/xen-4.12-testing/test-amd64-i386-xl-xsm.guest-start.{dot,ps,png,html,svg}.
----------------------------------------
155205: tolerable ALL FAIL

flight 155205 xen-4.12-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/155205/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-i386-xl-xsm       12 guest-start             fail baseline untested


jobs:
 test-amd64-i386-xl-xsm                                       fail    


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


