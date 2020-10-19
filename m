Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DF32920D3
	for <lists+xen-devel@lfdr.de>; Mon, 19 Oct 2020 03:03:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8582.22962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUJYa-0005Wv-UL; Mon, 19 Oct 2020 01:01:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8582.22962; Mon, 19 Oct 2020 01:01:48 +0000
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
	id 1kUJYa-0005PY-N7; Mon, 19 Oct 2020 01:01:48 +0000
Received: by outflank-mailman (input) for mailman id 8582;
 Mon, 19 Oct 2020 01:01:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zzxy=D2=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kUJYY-0002fQ-Gr
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 01:01:46 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a82899ac-d278-46e9-9f0f-6ee265777f43;
 Mon, 19 Oct 2020 01:01:38 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kUJYP-0003EC-SZ; Mon, 19 Oct 2020 01:01:37 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kUJYP-00056k-Kc; Mon, 19 Oct 2020 01:01:37 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kUJYP-0000zr-K8; Mon, 19 Oct 2020 01:01:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=zzxy=D2=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kUJYY-0002fQ-Gr
	for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 01:01:46 +0000
X-Inumbo-ID: a82899ac-d278-46e9-9f0f-6ee265777f43
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a82899ac-d278-46e9-9f0f-6ee265777f43;
	Mon, 19 Oct 2020 01:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
	bh=pYZjd0gbHbvUKoHcm/gFijeXp4y+oKW8EaKuTn36C/Q=; b=ppbX7cf4jm1+k+LTbIOPkeNfrW
	Qnr6tGfZd+jXi0vlG6/U+4u69rfYxRR8hEORTOJlnElmEFC+IsIYGGJAgu2Md1gWKQ9Y3Dxgt+4Zj
	/4ql3dFZDmDx3c35xhj65hXjcnXa9BLnoYG0f+QiQIWuFrgNCF5/AWJLB5dYu8C2NDIQ=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kUJYP-0003EC-SZ; Mon, 19 Oct 2020 01:01:37 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kUJYP-00056k-Kc; Mon, 19 Oct 2020 01:01:37 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kUJYP-0000zr-K8; Mon, 19 Oct 2020 01:01:37 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [qemu-mainline bisection] complete test-amd64-amd64-xl-qcow2
Message-Id: <E1kUJYP-0000zr-K8@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 19 Oct 2020 01:01:37 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-xl-qcow2
testid guest-start/debian.repeat

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  2d24a64661549732fc77f632928318dd52f5bce5
  Bug not present: 7bed89958bfbf40df9ca681cefbdca63abdde39d
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/155972/


  commit 2d24a64661549732fc77f632928318dd52f5bce5
  Author: Maxim Levitsky <mlevitsk@redhat.com>
  Date:   Tue Oct 6 15:38:59 2020 +0300
  
      device-core: use RCU for list of children of a bus
      
      This fixes the race between device emulation code that tries to find
      a child device to dispatch the request to (e.g a scsi disk),
      and hotplug of a new device to that bus.
      
      Note that this doesn't convert all the readers of the list
      but only these that might go over that list without BQL held.
      
      This is a very small first step to make this code thread safe.
      
      Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
      Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
      Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
      Message-Id: <20200913160259.32145-5-mlevitsk@redhat.com>
      [Use RCU_READ_LOCK_GUARD in more places, adjust testcase now that
       the delay in DEVICE_DELETED due to RCU is more consistent. - Paolo]
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
      Message-Id: <20201006123904.610658-9-mlevitsk@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/test-amd64-amd64-xl-qcow2.guest-start--debian.repeat.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/test-amd64-amd64-xl-qcow2.guest-start--debian.repeat --summary-out=tmp/155972.bisection-summary --basis-template=152631 --blessings=real,real-bisect,real-retry qemu-mainline test-amd64-amd64-xl-qcow2 guest-start/debian.repeat
Searching for failure / basis pass:
 155953 fail [host=fiano1] / 155769 [host=elbling1] 155743 [host=fiano0] 155729 [host=pinot0] 155713 [host=godello1] 155703 [host=chardonnay1] 155695 [host=huxelrebe0] 155675 [host=pinot1] 155665 [host=huxelrebe1] 155645 [host=albana0] 155613 [host=rimava1] 155585 [host=albana1] 155544 [host=godello1] 155518 [host=chardonnay0] 155509 [host=godello0] 152631 [host=godello1] 152615 [host=chardonnay0] 152573 [host=huxelrebe0] 152563 [host=huxelrebe1] 152497 [host=godello0] 152480 [host=rimava1] 1524\
 56 [host=elbling1] 152411 [host=pinot1] 152380 [host=albana1] 152337 ok.
Failure / basis pass flights: 155953 / 152337
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 30f0ec8d80072ae3ab58e08014e6b2ffe3ef97e1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e12ce85b2c79d83a340953291912875c30b3af06 58a44be024f69d2e4d2b58553529230abdd3935e 6ee2e66674f36b6d27a95f4ddf27226905cc63a4
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7f79b736b0a57da71d87c987357db0227cd16ac6 3c659044118e34603161457db9934a34f816d78b d74824cf7c8b352f9045e949dc636c7207a41eee d9c812dda519a1a73e8370e1b81ddf46eb22ed16 98bed5de1de3352c63cfe29a00f17e8d9ce72689
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#7f79b736b0a57da71d87c987357db0227cd16ac6-30f0ec8d80072ae3ab58e08014e6b2ffe3ef97e1 git://xenbits.xen.org/qemu-xen-traditional.git#3c659044118e34603161457db99\
 34a34f816d78b-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://git.qemu.org/qemu.git#d74824cf7c8b352f9045e949dc636c7207a41eee-e12ce85b2c79d83a340953291912875c30b3af06 git://xenbits.xen.org/osstest/seabios.git#d9c812dda519a1a73e8370e1b81ddf46eb22ed16-58a44be024f69d2e4d2b58553529230abdd3935e git://xenbits.xen.org/xen.git#98bed5de1de3352c63cfe29a00f17e8d9ce72689-6ee2e66674f36b6d27a95f4ddf27226905cc63a4
Loaded 43461 nodes in revision graph
Searching for test results:
 152337 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7f79b736b0a57da71d87c987357db0227cd16ac6 3c659044118e34603161457db9934a34f816d78b d74824cf7c8b352f9045e949dc636c7207a41eee d9c812dda519a1a73e8370e1b81ddf46eb22ed16 98bed5de1de3352c63cfe29a00f17e8d9ce72689
 152380 [host=albana1]
 152411 [host=pinot1]
 152480 [host=rimava1]
 152456 [host=elbling1]
 152497 [host=godello0]
 152563 [host=huxelrebe1]
 152573 [host=huxelrebe0]
 152615 [host=chardonnay0]
 152631 [host=godello1]
 152659 [host=godello0]
 152668 [host=godello0]
 152682 [host=godello0]
 152696 [host=godello0]
 152712 [host=godello0]
 152726 [host=godello0]
 152771 [host=godello0]
 152793 [host=godello0]
 152836 [host=godello0]
 152856 [host=godello0]
 152878 [host=godello0]
 152911 []
 152923 []
 152946 []
 152965 []
 152992 []
 153007 []
 153025 []
 153047 []
 153075 []
 153113 []
 153138 []
 153166 []
 153270 []
 153288 []
 153311 []
 153336 []
 153362 []
 153383 []
 153406 []
 153435 []
 153452 []
 153478 []
 153502 []
 153531 []
 153548 []
 153576 []
 153597 []
 153611 []
 153625 []
 153663 []
 153692 []
 153762 []
 153776 []
 153793 []
 153818 []
 153847 []
 153891 []
 153922 []
 153946 []
 153971 []
 153998 []
 154023 [host=godello0]
 154038 [host=godello0]
 154061 [host=godello0]
 154096 [host=godello0]
 154137 [host=godello0]
 154138 [host=godello0]
 154140 [host=godello0]
 154141 [host=godello0]
 154142 [host=godello0]
 154466 [host=godello0]
 154485 [host=godello0]
 154496 [host=godello0]
 154508 [host=godello0]
 154526 [host=godello0]
 154544 [host=godello0]
 154552 [host=godello0]
 154566 [host=godello0]
 154583 [host=godello0]
 154607 [host=godello0]
 154629 [host=godello0]
 155018 [host=godello0]
 155098 [host=godello0]
 155184 [host=godello0]
 155318 [host=godello0]
 155434 [host=godello0]
 155483 [host=godello0]
 155509 [host=godello0]
 155518 [host=chardonnay0]
 155544 [host=godello1]
 155585 [host=albana1]
 155613 [host=rimava1]
 155645 [host=albana0]
 155665 [host=huxelrebe1]
 155675 [host=pinot1]
 155695 [host=huxelrebe0]
 155703 [host=chardonnay1]
 155713 [host=godello1]
 155729 [host=pinot0]
 155743 [host=fiano0]
 155754 [host=elbling1]
 155769 [host=elbling1]
 155785 fail irrelevant
 155802 fail irrelevant
 155819 fail irrelevant
 155841 fail irrelevant
 155877 fail irrelevant
 155888 fail irrelevant
 155927 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7f79b736b0a57da71d87c987357db0227cd16ac6 3c659044118e34603161457db9934a34f816d78b d74824cf7c8b352f9045e949dc636c7207a41eee d9c812dda519a1a73e8370e1b81ddf46eb22ed16 98bed5de1de3352c63cfe29a00f17e8d9ce72689
 155928 fail irrelevant
 155911 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a7d977040bd82b89d1fe5ef32d488bfd10db2dbc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7daf8f8d011cdd5d3e86930ed2bde969425c790c 58a44be024f69d2e4d2b58553529230abdd3935e 6ee2e66674f36b6d27a95f4ddf27226905cc63a4
 155930 fail irrelevant
 155932 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a7d977040bd82b89d1fe5ef32d488bfd10db2dbc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7daf8f8d011cdd5d3e86930ed2bde969425c790c 58a44be024f69d2e4d2b58553529230abdd3935e 6ee2e66674f36b6d27a95f4ddf27226905cc63a4
 155933 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 19c87b7d446c3273e84b238cb02cd1c0ae69c43e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3e40748834923798aa57e3751db13a069e2c617b 58a44be024f69d2e4d2b58553529230abdd3935e 6ee2e66674f36b6d27a95f4ddf27226905cc63a4
 155934 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 19c87b7d446c3273e84b238cb02cd1c0ae69c43e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 57c98ea9acdcef5021f5671efa6475a5794a51c4 58a44be024f69d2e4d2b58553529230abdd3935e 6ee2e66674f36b6d27a95f4ddf27226905cc63a4
 155935 blocked c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5d0a827122cccd1f884faf75b2a065d88a58bce1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 96292515c07e3a99f5a29540ed2f257b1ff75111 c685fe3ff2d402caefc1487d99bb486c4a510b8b 884ef07f4f66b9d12fc4811047db95ba649db85c
 155939 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9380177354387f03c8ff9eadb7ae94aa453b9469 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b37da837630ca7cdbc45de4c5339bbfc6d21beed c685fe3ff2d402caefc1487d99bb486c4a510b8b 534b3d09958fdc4df64872c2ab19feb4b1eebc5a
 155940 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cc942105ede58a300ba46f3df0edfa86b3abd4dd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a0bdf866873467271eff9a92f179ab0f77d735cb 849c5e50b6f474df6cc113130575bcdccfafcd9e 534b3d09958fdc4df64872c2ab19feb4b1eebc5a
 155941 blocked c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cc942105ede58a300ba46f3df0edfa86b3abd4dd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c45a70d8c271056896a057fbcdc7743a2942d0ec 849c5e50b6f474df6cc113130575bcdccfafcd9e 534b3d09958fdc4df64872c2ab19feb4b1eebc5a
 155956 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7f79b736b0a57da71d87c987357db0227cd16ac6 3c659044118e34603161457db9934a34f816d78b d74824cf7c8b352f9045e949dc636c7207a41eee d9c812dda519a1a73e8370e1b81ddf46eb22ed16 98bed5de1de3352c63cfe29a00f17e8d9ce72689
 155943 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9380177354387f03c8ff9eadb7ae94aa453b9469 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a4339de2de4def4beb33e22e6f506bcc8b9d9326 c685fe3ff2d402caefc1487d99bb486c4a510b8b 534b3d09958fdc4df64872c2ab19feb4b1eebc5a
 155947 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cc942105ede58a300ba46f3df0edfa86b3abd4dd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 07a47d4a1879370009baab44f1f387610d88a299 849c5e50b6f474df6cc113130575bcdccfafcd9e 534b3d09958fdc4df64872c2ab19feb4b1eebc5a
 155949 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cc942105ede58a300ba46f3df0edfa86b3abd4dd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d9f24bf57241453e078dba28d16fe3a430f06da1 849c5e50b6f474df6cc113130575bcdccfafcd9e 534b3d09958fdc4df64872c2ab19feb4b1eebc5a
 155931 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 30f0ec8d80072ae3ab58e08014e6b2ffe3ef97e1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e12ce85b2c79d83a340953291912875c30b3af06 58a44be024f69d2e4d2b58553529230abdd3935e 6ee2e66674f36b6d27a95f4ddf27226905cc63a4
 155952 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cc942105ede58a300ba46f3df0edfa86b3abd4dd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 bab88ead6fcbc7097ed75981622cce7850da1cc7 849c5e50b6f474df6cc113130575bcdccfafcd9e 534b3d09958fdc4df64872c2ab19feb4b1eebc5a
 155958 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 30f0ec8d80072ae3ab58e08014e6b2ffe3ef97e1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e12ce85b2c79d83a340953291912875c30b3af06 58a44be024f69d2e4d2b58553529230abdd3935e 6ee2e66674f36b6d27a95f4ddf27226905cc63a4
 155959 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cc942105ede58a300ba46f3df0edfa86b3abd4dd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7bed89958bfbf40df9ca681cefbdca63abdde39d 849c5e50b6f474df6cc113130575bcdccfafcd9e 534b3d09958fdc4df64872c2ab19feb4b1eebc5a
 155961 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cc942105ede58a300ba46f3df0edfa86b3abd4dd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a23151e8cc8cc08546252dc9c7671171d9c44615 849c5e50b6f474df6cc113130575bcdccfafcd9e 534b3d09958fdc4df64872c2ab19feb4b1eebc5a
 155962 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cc942105ede58a300ba46f3df0edfa86b3abd4dd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 2d24a64661549732fc77f632928318dd52f5bce5 849c5e50b6f474df6cc113130575bcdccfafcd9e 534b3d09958fdc4df64872c2ab19feb4b1eebc5a
 155964 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cc942105ede58a300ba46f3df0edfa86b3abd4dd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7bed89958bfbf40df9ca681cefbdca63abdde39d 849c5e50b6f474df6cc113130575bcdccfafcd9e 534b3d09958fdc4df64872c2ab19feb4b1eebc5a
 155966 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cc942105ede58a300ba46f3df0edfa86b3abd4dd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 2d24a64661549732fc77f632928318dd52f5bce5 849c5e50b6f474df6cc113130575bcdccfafcd9e 534b3d09958fdc4df64872c2ab19feb4b1eebc5a
 155953 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 30f0ec8d80072ae3ab58e08014e6b2ffe3ef97e1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e12ce85b2c79d83a340953291912875c30b3af06 58a44be024f69d2e4d2b58553529230abdd3935e 6ee2e66674f36b6d27a95f4ddf27226905cc63a4
 155970 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cc942105ede58a300ba46f3df0edfa86b3abd4dd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7bed89958bfbf40df9ca681cefbdca63abdde39d 849c5e50b6f474df6cc113130575bcdccfafcd9e 534b3d09958fdc4df64872c2ab19feb4b1eebc5a
 155972 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cc942105ede58a300ba46f3df0edfa86b3abd4dd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 2d24a64661549732fc77f632928318dd52f5bce5 849c5e50b6f474df6cc113130575bcdccfafcd9e 534b3d09958fdc4df64872c2ab19feb4b1eebc5a
Searching for interesting versions
 Result found: flight 152337 (pass), for basis pass
 Result found: flight 155931 (fail), for basis failure
 Repro found: flight 155956 (pass), for basis pass
 Repro found: flight 155958 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 cc942105ede58a300ba46f3df0edfa86b3abd4dd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7bed89958bfbf40df9ca681cefbdca63abdde39d 849c5e50b6f474df6cc113130575bcdccfafcd9e 534b3d09958fdc4df64872c2ab19feb4b1eebc5a
No revisions left to test, checking graph state.
 Result found: flight 155959 (pass), for last pass
 Result found: flight 155962 (fail), for first failure
 Repro found: flight 155964 (pass), for last pass
 Repro found: flight 155966 (fail), for first failure
 Repro found: flight 155970 (pass), for last pass
 Repro found: flight 155972 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  2d24a64661549732fc77f632928318dd52f5bce5
  Bug not present: 7bed89958bfbf40df9ca681cefbdca63abdde39d
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/155972/


  commit 2d24a64661549732fc77f632928318dd52f5bce5
  Author: Maxim Levitsky <mlevitsk@redhat.com>
  Date:   Tue Oct 6 15:38:59 2020 +0300
  
      device-core: use RCU for list of children of a bus
      
      This fixes the race between device emulation code that tries to find
      a child device to dispatch the request to (e.g a scsi disk),
      and hotplug of a new device to that bus.
      
      Note that this doesn't convert all the readers of the list
      but only these that might go over that list without BQL held.
      
      This is a very small first step to make this code thread safe.
      
      Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
      Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
      Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
      Message-Id: <20200913160259.32145-5-mlevitsk@redhat.com>
      [Use RCU_READ_LOCK_GUARD in more places, adjust testcase now that
       the delay in DEVICE_DELETED due to RCU is more consistent. - Paolo]
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
      Message-Id: <20201006123904.610658-9-mlevitsk@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

neato: graph is too large for cairo-renderer bitmaps. Scaling by 0.316537 to fit
pnmtopng: 99 colors found
Revision graph left in /home/logs/results/bisect/qemu-mainline/test-amd64-amd64-xl-qcow2.guest-start--debian.repeat.{dot,ps,png,html,svg}.
----------------------------------------
155972: tolerable ALL FAIL

flight 155972 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/155972/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-xl-qcow2  21 guest-start/debian.repeat fail baseline untested


jobs:
 test-amd64-amd64-xl-qcow2                                    fail    


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


