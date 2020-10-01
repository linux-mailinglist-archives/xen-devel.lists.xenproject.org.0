Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF095280444
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 18:50:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1522.4705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kO1mn-00056w-OO; Thu, 01 Oct 2020 16:50:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1522.4705; Thu, 01 Oct 2020 16:50:29 +0000
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
	id 1kO1mn-00056X-Kq; Thu, 01 Oct 2020 16:50:29 +0000
Received: by outflank-mailman (input) for mailman id 1522;
 Thu, 01 Oct 2020 16:50:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GG2I=DI=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kO1mm-00056Q-Hp
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 16:50:28 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 960b719c-02ea-41ad-bdbd-6cf5a7cf68b8;
 Thu, 01 Oct 2020 16:50:26 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kO1mj-00031L-NM; Thu, 01 Oct 2020 16:50:25 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kO1mj-00083V-D7; Thu, 01 Oct 2020 16:50:25 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kO1mj-0005Dq-7P; Thu, 01 Oct 2020 16:50:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=GG2I=DI=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kO1mm-00056Q-Hp
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 16:50:28 +0000
X-Inumbo-ID: 960b719c-02ea-41ad-bdbd-6cf5a7cf68b8
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 960b719c-02ea-41ad-bdbd-6cf5a7cf68b8;
	Thu, 01 Oct 2020 16:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
	bh=fPQv49KslP/3k5egov6VpXy3gz/ZeyqQOWkjxqvWO6I=; b=h8MDKSvkPOY2Wzud5fhjjfzlPx
	7oHtsfv33Eytr+anFxipyQXdjtRQj1PzAghkpnUIDAzEGUrURMme+81WVTWvQ3qnHLbobTGTTDM+A
	8aQkZvvegwI3vRpl+JbMgtVoZ214ZksUw1iCbEma/MaotGdCRytLyPg7D9eyiTJ5I8DY=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kO1mj-00031L-NM; Thu, 01 Oct 2020 16:50:25 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kO1mj-00083V-D7; Thu, 01 Oct 2020 16:50:25 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kO1mj-0005Dq-7P; Thu, 01 Oct 2020 16:50:25 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable bisection] complete test-amd64-amd64-xl-xsm
Message-Id: <E1kO1mj-0005Dq-7P@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 01 Oct 2020 16:50:25 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-xl-xsm
testid guest-start

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  c0ddc8634845aba50774add6e4b73fdaffc82656
  Bug not present: 8d385b247bca40ece40c9279391054bc98934325
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/155250/


  commit c0ddc8634845aba50774add6e4b73fdaffc82656
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Tue Sep 22 15:51:28 2020 +0200
  
      evtchn: convert per-channel lock to be IRQ-safe
      
      ... in order for send_guest_{global,vcpu}_virq() to be able to make use
      of it.
      
      This is part of XSA-343.
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Acked-by: Julien Grall <jgrall@amazon.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-amd64-amd64-xl-xsm.guest-start.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-amd64-amd64-xl-xsm.guest-start --summary-out=tmp/155250.bisection-summary --basis-template=154611 --blessings=real,real-bisect xen-unstable test-amd64-amd64-xl-xsm guest-start
Searching for failure / basis pass:
 155113 fail [host=albana1] / 154611 [host=elbling0] 154592 [host=chardonnay0] 154576 [host=albana0] 154556 [host=godello0] 154521 [host=fiano0] 154504 [host=fiano1] 154494 [host=huxelrebe1] 154481 [host=godello1] 154465 [host=pinot0] 154090 [host=chardonnay1] 154058 [host=pinot1] 154036 [host=huxelrebe0] 154016 [host=huxelrebe1] 153983 ok.
Failure / basis pass flights: 155113 / 153983
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 5dba8c2f23049aa68b777a9e7e9f76c12dd00012
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 1e2d3be2e516e6f415ca6029f651b76a8563a27c
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#ea6d3cd1ed79d824e605a70c3626bc4\
 37c386260-ea6d3cd1ed79d824e605a70c3626bc437c386260 git://xenbits.xen.org/xen.git#1e2d3be2e516e6f415ca6029f651b76a8563a27c-5dba8c2f23049aa68b777a9e7e9f76c12dd00012
Loaded 5001 nodes in revision graph
Searching for test results:
 153983 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 1e2d3be2e516e6f415ca6029f651b76a8563a27c
 154016 [host=huxelrebe1]
 154036 [host=huxelrebe0]
 154058 [host=pinot1]
 154090 [host=chardonnay1]
 154465 [host=pinot0]
 154481 [host=godello1]
 154494 [host=huxelrebe1]
 154504 [host=fiano1]
 154521 [host=fiano0]
 154556 [host=godello0]
 154576 [host=albana0]
 154592 [host=chardonnay0]
 154611 [host=elbling0]
 154634 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 2785b2a9e04abc148e1c5259f4faee708ea356f4
 155017 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 5bcac985498ed83d89666959175ca9c9ed561ae1
 155120 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 1e2d3be2e516e6f415ca6029f651b76a8563a27c
 155175 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 5bcac985498ed83d89666959175ca9c9ed561ae1
 155179 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 b4e41b1750d550bf2b1ccf97ee46f4f682bdbb62
 155183 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 c7e3021a71fdb4f2d5dbad90ba83ce35bc21cda6
 155188 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 8e76aef72820435e766c7f339ed36da33da90c40
 155197 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 112992b05b2d2ca63f3c78eefe1cf8d192d7303a
 155202 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 c0ddc8634845aba50774add6e4b73fdaffc82656
 155113 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 5dba8c2f23049aa68b777a9e7e9f76c12dd00012
 155208 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 62bcdc4edbf6d8c6e8a25544d48de22ccf75310d
 155215 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 5dba8c2f23049aa68b777a9e7e9f76c12dd00012
 155221 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 8d385b247bca40ece40c9279391054bc98934325
 155227 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 c0ddc8634845aba50774add6e4b73fdaffc82656
 155230 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 8d385b247bca40ece40c9279391054bc98934325
 155233 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 c0ddc8634845aba50774add6e4b73fdaffc82656
 155245 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 8d385b247bca40ece40c9279391054bc98934325
 155250 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 c0ddc8634845aba50774add6e4b73fdaffc82656
Searching for interesting versions
 Result found: flight 153983 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 8d385b247bca40ece40c9279391054bc98934325, results HASH(0x55a9ee49e840) HASH(0x55a9ee9edbf8) HASH(0x55a9ee4b04b8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1e\
 d79d824e605a70c3626bc437c386260 62bcdc4edbf6d8c6e8a25544d48de22ccf75310d, results HASH(0x55a9eea9a3c0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 112992b05b2d2ca63f3c78eefe1cf8d192d7303a, results HASH(0x55a9eea934b0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f\
 0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 8e76aef72820435e766c7f339ed36da33da90c40, results HASH(0x55a9eea90a48) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 c7e3021a71fdb4f2d5dbad90ba83ce35bc21cda6, results HASH(0x55a9eea8f340) For basis failure, parent search stopping at c3038e718a19\
 fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 b4e41b1750d550bf2b1ccf97ee46f4f682bdbb62, results HASH(0x55a9eea8ca30) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 1e2d3be2e516e6f415ca6029f651b76a8563a27c, results HASH(0x55a9eea02aa\
 8) HASH(0x55a9eea0a7f0) Result found: flight 154634 (fail), for basis failure (at ancestor ~366)
 Repro found: flight 155120 (pass), for basis pass
 Repro found: flight 155215 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 8d385b247bca40ece40c9279391054bc98934325
No revisions left to test, checking graph state.
 Result found: flight 155221 (pass), for last pass
 Result found: flight 155227 (fail), for first failure
 Repro found: flight 155230 (pass), for last pass
 Repro found: flight 155233 (fail), for first failure
 Repro found: flight 155245 (pass), for last pass
 Repro found: flight 155250 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  c0ddc8634845aba50774add6e4b73fdaffc82656
  Bug not present: 8d385b247bca40ece40c9279391054bc98934325
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/155250/


  commit c0ddc8634845aba50774add6e4b73fdaffc82656
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Tue Sep 22 15:51:28 2020 +0200
  
      evtchn: convert per-channel lock to be IRQ-safe
      
      ... in order for send_guest_{global,vcpu}_virq() to be able to make use
      of it.
      
      This is part of XSA-343.
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Acked-by: Julien Grall <jgrall@amazon.com>

Revision graph left in /home/logs/results/bisect/xen-unstable/test-amd64-amd64-xl-xsm.guest-start.{dot,ps,png,html,svg}.
----------------------------------------
155250: tolerable ALL FAIL

flight 155250 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/155250/

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


