Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5A7799EF0
	for <lists+xen-devel@lfdr.de>; Sun, 10 Sep 2023 18:16:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.598751.933804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfN6F-00024t-9V; Sun, 10 Sep 2023 16:15:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 598751.933804; Sun, 10 Sep 2023 16:15:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfN6F-00022Y-6B; Sun, 10 Sep 2023 16:15:51 +0000
Received: by outflank-mailman (input) for mailman id 598751;
 Sun, 10 Sep 2023 16:15:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qfN6D-00022O-7P; Sun, 10 Sep 2023 16:15:49 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qfN6D-0005kb-2A; Sun, 10 Sep 2023 16:15:49 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qfN6C-0004vY-SS; Sun, 10 Sep 2023 16:15:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qfN6C-0000qC-Rz; Sun, 10 Sep 2023 16:15:48 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
	bh=QEvNqluMiv64TuleluqDVIXD8pTHmDc1bYwf6oV0lEo=; b=EAMGvR9PpnygjucebZ4W1QZxI2
	pNiOJFVgtUW7KVs3KQts4CNtkUO/vfLpmSCXKKtkHriGemF12sE0nm6ZHDQ6jkxQSHkA3rBNCbq+2
	Vx9Sg/tNdcNz9y2zSLLOezERvFB1uRANZxLSWwxXE334e9oRe+ZExDxPN0dc7lAbrDuI=;
To: xen-devel@lists.xenproject.org
Subject: [qemu-mainline bisection] complete build-amd64-xsm
Message-Id: <E1qfN6C-0000qC-Rz@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 10 Sep 2023 16:15:48 +0000

branch xen-unstable
xenbranch xen-unstable
job build-amd64-xsm
testid xen-build

Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu https://gitlab.com/qemu-project/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu https://gitlab.com/qemu-project/qemu.git
  Bug introduced:  c5ea91da443b458352c1b629b490ee6631775cb4
  Bug not present: 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/182876/


  (Revision log too long, omitted.)


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/build-amd64-xsm.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/build-amd64-xsm.xen-build --summary-out=tmp/182876.bisection-summary --basis-template=182707 --blessings=real,real-bisect,real-retry qemu-mainline build-amd64-xsm xen-build
Searching for failure / basis pass:
 182854 fail [host=nobling0] / 182707 [host=pinot0] 182638 [host=himrod2] 182606 [host=nobling1] 182588 [host=nobling1] 182584 [host=nobling1] 182570 [host=himrod2] 182555 [host=nobling1] 182543 [host=himrod2] 182520 [host=himrod2] 182508 [host=himrod2] 182422 [host=himrod2] 182355 [host=himrod2] 182338 [host=himrod0] 182310 [host=himrod0] 182298 [host=himrod2] 182276 [host=himrod2] 182263 [host=himrod0] 182242 [host=himrod2] 182231 [host=himrod2] 182222 [host=himrod2] 182208 [host=himrod0] 1822\
 02 [host=himrod2] 182194 [host=himrod0] 182185 [host=nobling1] 182171 [host=himrod2] 182114 [host=himrod2] 182096 [host=himrod2] 182067 [host=himrod2] 182029 [host=himrod2] 182023 [host=himrod2] 182006 [host=himrod2] 181993 [host=himrod2] 181952 [host=godello0] 181918 [host=godello0] 181901 [host=huxelrebe0] 181212 [host=himrod2] 181201 [host=albana0] 181177 [host=albana0] 181168 [host=himrod2] 181159 [host=albana0] 181151 [host=himrod2] 181140 [host=godello0] 181131 [host=himrod2] 181119 [host=\
 huxelrebe0] 181103 [host=godello0] 181089 [host=himrod0] 181068 [host=godello0] 181057 [host=himrod2] 181041 [host=himrod2] 181021 [host=himrod2] 181013 [host=himrod2] 181006 [host=himrod0] 181003 [host=himrod2] 180996 [host=himrod0] 180990 [host=himrod0] 180987 [host=himrod2] 180983 [host=huxelrebe0] 180981 [host=himrod2] 180977 [host=himrod0] 180691 [host=himrod2] 180686 [host=himrod2] 180673 [host=nobling1] 180659 [host=nobling1] 180643 [host=godello0] 180637 [host=albana0] 180626 [host=himro\
 d2] 180621 [host=himrod2] 180610 [host=albana0] 180600 [host=himrod2] 180586 [host=himrod0] 180559 [host=himrod0] 180553 [host=himrod0] 180546 [host=himrod0] 180536 [host=elbling0] 180530 [host=nobling1] 180522 [host=himrod2] 180514 [host=himrod2] 180507 [host=himrod2] 180487 [host=himrod2] 180480 [host=himrod2] 180469 [host=himrod2] 180449 [host=himrod2] 180431 [host=himrod2] 180412 [host=debina0] 180398 [host=himrod2] 180394 [host=himrod2] 180389 [host=himrod2] 180386 [host=nobling1] 180382 [h\
 ost=himrod2] 180373 [host=himrod0] 180361 [host=himrod0] 180334 [host=himrod2] 180258 [host=himrod0] 180251 [host=himrod2] 180231 [host=nobling1] 180220 [host=himrod2] 180207 [host=himrod2] 180204 [host=himrod0] 180198 [host=himrod0] 180195 [host=himrod0] 180168 [host=himrod0] 180153 [host=himrod2] 180146 [host=himrod0] 180136 [host=himrod2] 180088 [host=himrod2] 180057 [host=himrod0] 180047 [host=himrod2] 180043 [host=himrod2] 179993 [host=godello0] 179971 [host=godello0] 179955 [host=himrod2] \
 179915 [host=himrod0] 179874 [host=himrod2] 179847 [host=himrod2] 179824 [host=himrod2] 179816 [host=godello0] 179802 [host=himrod0] 179795 [host=himrod2] 179776 [host=himrod2] 179756 [host=himrod2] 179733 [host=himrod2] 179708 [host=himrod0] 179682 [host=himrod0] 179657 [host=himrod2] 179644 [host=himrod2] 179628 [host=himrod2] 179609 [host=himrod2] 179596 [host=himrod2] 179588 [host=himrod2] 179574 [host=himrod2] 179561 [host=himrod2] 179548 [host=himrod2] 179534 [host=himrod2] 179526 [host=hi\
 mrod2] 179518 [host=himrod2] 179501 [host=pinot0] 179497 [host=godello0] 179449 [host=godello0] 176449 [host=pinot0] 176423 [host=sabro0] 176407 [host=himrod2] 176392 [host=godello0] 176367 [host=himrod2] 176352 [host=himrod2] 176342 [host=himrod2] 176096 [host=himrod2] 176080 [host=himrod2] 176069 [host=sabro0] 176022 [host=nobling1] 176008 [host=nobling1] 175998 [host=sabro0] 175991 [host=himrod0] 175977 [host=himrod2] 175962 [host=himrod0] 175743 [host=himrod0] 175735 [host=himrod2] 175637 [h\
 ost=himrod2] 175627 [host=himrod0] 175623 [host=himrod2] 175619 [host=himrod2] 175614 [host=himrod2] 175603 [host=himrod2] 175595 [host=himrod2] 175590 [host=himrod2] 175583 [host=himrod2] 175571 [host=huxelrebe0] 175457 [host=himrod2] 175443 [host=italia0] 175394 [host=sabro1] 175377 [host=himrod2] 175344 [host=himrod2] 175321 [host=himrod2] 175297 [host=himrod2] 175267 [host=nobling1] 175186 [host=himrod2] 175068 [host=elbling0] 175051 [host=himrod2] 175043 [host=nobling1] 174993 [host=godello\
 0] 174989 [host=himrod2] 174976 [host=sabro0] 174963 [host=sabro1] 174949 [host=himrod2] 174935 [host=himrod2] 174923 [host=sabro1] 174899 [host=himrod2] 174807 [host=himrod2] 174788 [host=himrod2] 174780 [host=sabro0] 174777 [host=himrod2] 174761 ok.
Failure / basis pass flights: 182854 / 174761
(tree with no url: minios)
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu https://gitlab.com/qemu-project/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest b240eab03530f063ef5438497d70a731b19a201e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c5ea91da443b458352c1b629b490ee6631775cb4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 49b2d6a529122f10e17a17f807d8d51154b5ba14
Basis pass b9e702c3c9bfe7bfb6bbcff44603add64e1787bf 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e 46de2eec93bffa0706e6229c0da2919763c8eb04 17dfc79ce9fd6cf508ee84a7d0d972d6abe268c2
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/osstest/ovmf.git#b9e702c3c9bfe7bfb6bbcff44603add64e1787bf-b240eab03530f063ef5438497d70a731b19a201e git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 https://gitlab.com/qemu-project/qemu.git#305f6f62d9d250a32cdf090ddcb7e3a5b26a342e-c5ea91da443b458352c1b629b490ee6631775cb4 git://xenbits.xen.org/osstest/seabios.git#46de2eec93bffa0706e6229c0da2919\
 763c8eb04-7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 git://xenbits.xen.org/xen.git#17dfc79ce9fd6cf508ee84a7d0d972d6abe268c2-49b2d6a529122f10e17a17f807d8d51154b5ba14
adhoc-revtuple-generator: tree discontiguous: qemu
Loaded 12669 nodes in revision graph
Searching for test results:
 175590 [host=himrod2]
 175595 [host=himrod2]
 175603 [host=himrod2]
 175614 [host=himrod2]
 175619 [host=himrod2]
 175623 [host=himrod2]
 175627 [host=himrod0]
 175637 [host=himrod2]
 175643 [host=himrod0]
 175646 [host=himrod0]
 175648 [host=himrod0]
 175649 [host=himrod0]
 175650 [host=himrod0]
 175647 [host=himrod0]
 175654 [host=himrod2]
 175664 [host=himrod2]
 175672 [host=himrod2]
 175681 [host=himrod2]
 175691 [host=himrod0]
 175703 [host=himrod0]
 175709 [host=himrod0]
 175716 [host=himrod0]
 175719 [host=himrod2]
 175722 [host=himrod2]
 175725 [host=himrod2]
 175727 [host=himrod0]
 175729 [host=himrod0]
 175733 [host=himrod0]
 175735 [host=himrod2]
 175743 [host=himrod0]
 175750 [host=himrod2]
 175835 [host=himrod2]
 175838 [host=himrod2]
 175858 [host=himrod2]
 175911 [host=himrod2]
 175908 [host=himrod2]
 175952 [host=himrod2]
 175962 [host=himrod0]
 175977 [host=himrod2]
 175991 [host=himrod0]
 175998 [host=sabro0]
 176008 [host=nobling1]
 176022 [host=nobling1]
 176069 [host=sabro0]
 176080 [host=himrod2]
 176096 [host=himrod2]
 174743 [host=sabro0]
 174749 [host=sabro0]
 174752 [host=himrod0]
 174756 [host=himrod0]
 174761 pass b9e702c3c9bfe7bfb6bbcff44603add64e1787bf 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e 46de2eec93bffa0706e6229c0da2919763c8eb04 17dfc79ce9fd6cf508ee84a7d0d972d6abe268c2
 174777 [host=himrod2]
 174780 [host=sabro0]
 174788 [host=himrod2]
 174807 [host=himrod2]
 174899 [host=himrod2]
 174923 [host=sabro1]
 174935 [host=himrod2]
 174949 [host=himrod2]
 174963 [host=sabro1]
 174976 [host=sabro0]
 174989 [host=himrod2]
 174993 [host=godello0]
 175043 [host=nobling1]
 175051 [host=himrod2]
 175068 [host=elbling0]
 176342 [host=himrod2]
 176352 [host=himrod2]
 176367 [host=himrod2]
 175186 [host=himrod2]
 176392 [host=godello0]
 176407 [host=himrod2]
 176423 [host=sabro0]
 175267 [host=nobling1]
 176449 [host=pinot0]
 175297 [host=himrod2]
 175321 [host=himrod2]
 175344 [host=himrod2]
 175377 [host=himrod2]
 175394 [host=sabro1]
 175443 [host=italia0]
 175457 [host=himrod2]
 175571 [host=huxelrebe0]
 175583 [host=himrod2]
 179449 [host=godello0]
 179497 [host=godello0]
 179501 [host=pinot0]
 179518 [host=himrod2]
 179526 [host=himrod2]
 179533 [host=himrod2]
 179535 [host=himrod2]
 179534 [host=himrod2]
 179538 [host=debina0]
 179539 [host=debina0]
 179540 [host=debina0]
 179541 [host=debina0]
 179542 [host=debina0]
 179543 [host=debina0]
 179544 [host=himrod2]
 179547 [host=himrod2]
 179551 [host=himrod2]
 179553 [host=himrod2]
 179555 [host=godello0]
 179556 [host=himrod2]
 179557 [host=himrod2]
 179548 [host=himrod2]
 179559 [host=himrod2]
 179560 [host=himrod2]
 179562 [host=himrod2]
 179563 [host=himrod2]
 179564 [host=himrod2]
 179566 [host=himrod2]
 179569 [host=himrod0]
 179561 [host=himrod2]
 179572 [host=himrod2]
 179576 [host=himrod2]
 179578 [host=himrod2]
 179580 [host=himrod2]
 179581 [host=himrod2]
 179582 [host=himrod2]
 179584 [host=himrod2]
 179585 [host=himrod2]
 179586 [host=himrod2]
 179574 [host=himrod2]
 179589 [host=himrod2]
 179590 [host=himrod2]
 179592 [host=elbling0]
 179594 [host=himrod2]
 179588 [host=himrod2]
 179595 [host=himrod2]
 179599 [host=himrod2]
 179600 [host=himrod2]
 179602 [host=himrod2]
 179603 [host=himrod2]
 179605 [host=himrod0]
 179606 [host=himrod0]
 179596 [host=himrod2]
 179608 [host=himrod2]
 179611 [host=himrod2]
 179614 [host=himrod2]
 179615 [host=himrod2]
 179617 [host=himrod0]
 179618 [host=himrod0]
 179620 [host=himrod0]
 179622 [host=himrod2]
 179623 [host=himrod2]
 179609 [host=himrod2]
 179626 [host=himrod2]
 179630 [host=himrod2]
 179631 [host=himrod2]
 179632 [host=himrod2]
 179634 [host=himrod2]
 179635 [host=himrod0]
 179637 [host=himrod0]
 179638 [host=himrod0]
 179639 [host=himrod0]
 179642 [host=himrod0]
 179628 [host=himrod2]
 179645 [host=himrod2]
 179646 [host=himrod2]
 179648 [host=himrod2]
 179650 [host=nobling1]
 179652 [host=himrod2]
 179644 [host=himrod2]
 179659 [host=himrod2]
 179657 [host=himrod2]
 179682 [host=himrod0]
 179708 [host=himrod0]
 179733 [host=himrod2]
 179756 [host=himrod2]
 179776 [host=himrod2]
 179795 [host=himrod2]
 179802 [host=himrod0]
 179816 [host=godello0]
 179824 [host=himrod2]
 179847 [host=himrod2]
 179874 [host=himrod2]
 179915 [host=himrod0]
 179955 [host=himrod2]
 179971 [host=godello0]
 179993 [host=godello0]
 180043 [host=himrod2]
 180047 [host=himrod2]
 180057 [host=himrod0]
 180088 [host=himrod2]
 180136 [host=himrod2]
 180146 [host=himrod0]
 180168 [host=himrod0]
 180153 [host=himrod2]
 180195 [host=himrod0]
 180198 [host=himrod0]
 180204 [host=himrod0]
 180207 [host=himrod2]
 180220 [host=himrod2]
 180231 [host=nobling1]
 180251 [host=himrod2]
 180258 [host=himrod0]
 180334 [host=himrod2]
 180361 [host=himrod0]
 180373 [host=himrod0]
 180382 [host=himrod2]
 180394 [host=himrod2]
 180386 [host=nobling1]
 180389 [host=himrod2]
 180398 [host=himrod2]
 180412 [host=debina0]
 180431 [host=himrod2]
 180449 [host=himrod2]
 180469 [host=himrod2]
 180480 [host=himrod2]
 180487 [host=himrod2]
 180507 [host=himrod2]
 180514 [host=himrod2]
 180522 [host=himrod2]
 180530 [host=nobling1]
 180536 [host=elbling0]
 180546 [host=himrod0]
 180553 [host=himrod0]
 180559 [host=himrod0]
 180586 [host=himrod0]
 180600 [host=himrod2]
 180610 [host=albana0]
 180621 [host=himrod2]
 180626 [host=himrod2]
 180637 [host=albana0]
 180643 [host=godello0]
 180659 [host=nobling1]
 180673 [host=nobling1]
 180686 [host=himrod2]
 180702 [host=himrod0]
 180691 [host=himrod2]
 180705 [host=himrod0]
 180707 [host=himrod0]
 180708 [host=himrod0]
 180709 [host=himrod0]
 180710 [host=himrod0]
 180711 [host=himrod0]
 180712 [host=himrod0]
 180713 [host=himrod0]
 180715 [host=himrod0]
 180716 [host=himrod0]
 180717 [host=himrod0]
 180718 [host=himrod0]
 180704 [host=himrod0]
 180720 [host=himrod0]
 180722 [host=himrod0]
 180723 [host=himrod0]
 180724 [host=himrod0]
 180727 [host=himrod0]
 180728 [host=himrod0]
 180730 [host=himrod0]
 180731 [host=himrod0]
 180733 [host=himrod0]
 180736 [host=himrod0]
 180737 [host=himrod0]
 180721 [host=himrod2]
 180739 [host=himrod0]
 180741 [host=himrod2]
 180743 [host=himrod2]
 180744 [host=himrod2]
 180745 [host=himrod2]
 180747 [host=himrod2]
 180748 [host=himrod2]
 180749 [host=himrod2]
 180742 [host=himrod2]
 180750 [host=himrod2]
 180752 [host=himrod2]
 180754 [host=himrod2]
 180755 [host=himrod2]
 180757 [host=himrod2]
 180758 [host=himrod2]
 180753 [host=himrod2]
 180785 [host=himrod2]
 180807 [host=himrod2]
 180815 [host=himrod2]
 180825 [host=himrod2]
 180835 [host=himrod2]
 180843 [host=himrod2]
 180853 [host=himrod2]
 180860 [host=himrod2]
 180866 [host=himrod2]
 180873 [host=himrod2]
 180878 [host=himrod0]
 180881 [host=himrod2]
 180887 [host=himrod2]
 180894 [host=himrod2]
 180902 [host=himrod2]
 180906 [host=himrod2]
 180909 [host=himrod2]
 180912 [host=himrod0]
 180916 [host=himrod2]
 180927 [host=himrod0]
 180921 [host=himrod2]
 180933 [host=himrod0]
 180937 [host=himrod0]
 180942 [host=himrod2]
 180947 [host=himrod0]
 180949 [host=himrod0]
 180952 [host=himrod0]
 180954 [host=himrod0]
 180958 [host=himrod2]
 180962 [host=himrod2]
 180966 [host=himrod2]
 180968 [host=himrod2]
 180972 [host=himrod2]
 180975 [host=himrod2]
 180977 [host=himrod0]
 180981 [host=himrod2]
 180983 [host=huxelrebe0]
 180990 [host=himrod0]
 180987 [host=himrod2]
 181003 [host=himrod2]
 180996 [host=himrod0]
 181006 [host=himrod0]
 181013 [host=himrod2]
 181021 [host=himrod2]
 181041 [host=himrod2]
 181057 [host=himrod2]
 181068 [host=godello0]
 181089 [host=himrod0]
 181103 [host=godello0]
 181119 [host=huxelrebe0]
 181131 [host=himrod2]
 181140 [host=godello0]
 181151 [host=himrod2]
 181159 [host=albana0]
 181168 [host=himrod2]
 181177 [host=albana0]
 181200 [host=himrod2]
 181202 [host=albana0]
 181203 [host=godello0]
 181206 [host=himrod2]
 181207 [host=himrod2]
 181209 [host=himrod2]
 181201 [host=albana0]
 181211 [host=huxelrebe0]
 181215 [host=himrod0]
 181220 [host=himrod2]
 181223 [host=albana0]
 181227 [host=albana0]
 181212 [host=himrod2]
 181229 [host=himrod2]
 181232 [host=himrod2]
 181231 [host=huxelrebe0]
 181235 [host=huxelrebe0]
 181236 [host=huxelrebe0]
 181244 [host=huxelrebe0]
 181271 [host=huxelrebe0]
 181281 [host=huxelrebe0]
 181299 [host=huxelrebe0]
 181305 [host=huxelrebe1]
 181312 [host=huxelrebe1]
 181322 [host=huxelrebe1]
 181327 [host=huxelrebe1]
 181335 [host=huxelrebe1]
 181345 [host=huxelrebe1]
 181356 [host=huxelrebe0]
 181361 [host=huxelrebe1]
 181372 [host=huxelrebe0]
 181375 [host=huxelrebe1]
 181376 [host=huxelrebe1]
 181379 [host=huxelrebe1]
 181380 [host=huxelrebe1]
 181382 [host=huxelrebe1]
 181384 [host=huxelrebe1]
 181386 [host=huxelrebe1]
 181388 [host=huxelrebe1]
 181389 [host=huxelrebe1]
 181390 [host=huxelrebe1]
 181391 [host=huxelrebe1]
 181393 [host=huxelrebe1]
 181394 [host=huxelrebe1]
 181403 [host=huxelrebe0]
 181409 [host=huxelrebe0]
 181416 [host=huxelrebe1]
 181419 [host=huxelrebe0]
 181424 [host=huxelrebe1]
 181428 [host=huxelrebe1]
 181430 [host=huxelrebe1]
 181436 [host=huxelrebe0]
 181443 [host=huxelrebe0]
 181446 [host=huxelrebe1]
 181461 [host=huxelrebe0]
 181463 [host=huxelrebe0]
 181472 [host=huxelrebe1]
 181478 [host=huxelrebe0]
 181483 [host=huxelrebe0]
 181485 [host=huxelrebe0]
 181492 [host=huxelrebe1]
 181493 [host=huxelrebe1]
 181496 [host=huxelrebe0]
 181544 [host=huxelrebe0]
 181549 [host=huxelrebe1]
 181901 [host=huxelrebe0]
 181918 [host=godello0]
 181952 [host=godello0]
 181993 [host=himrod2]
 182006 [host=himrod2]
 182023 [host=himrod2]
 182029 [host=himrod2]
 182067 [host=himrod2]
 182096 [host=himrod2]
 182114 [host=himrod2]
 182171 [host=himrod2]
 182185 [host=nobling1]
 182194 [host=himrod0]
 182202 [host=himrod2]
 182208 [host=himrod0]
 182222 [host=himrod2]
 182231 [host=himrod2]
 182242 [host=himrod2]
 182263 [host=himrod0]
 182276 [host=himrod2]
 182298 [host=himrod2]
 182310 [host=himrod0]
 182338 [host=himrod0]
 182355 [host=himrod2]
 182422 [host=himrod2]
 182508 [host=himrod2]
 182520 [host=himrod2]
 182543 [host=himrod2]
 182555 [host=nobling1]
 182570 [host=himrod2]
 182584 [host=nobling1]
 182588 [host=nobling1]
 182606 [host=nobling1]
 182638 [host=himrod2]
 182707 [host=pinot0]
 182723 [host=nobling1]
 182730 [host=nobling1]
 182739 fail irrelevant
 182770 [host=nobling1]
 182796 fail irrelevant
 182801 fail b240eab03530f063ef5438497d70a731b19a201e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c5ea91da443b458352c1b629b490ee6631775cb4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 cba6d44a13d5e25334d164e27cb1b1d7674aa05e
 182814 fail b240eab03530f063ef5438497d70a731b19a201e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c5ea91da443b458352c1b629b490ee6631775cb4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 cba6d44a13d5e25334d164e27cb1b1d7674aa05e
 182835 fail b240eab03530f063ef5438497d70a731b19a201e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c5ea91da443b458352c1b629b490ee6631775cb4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 49b2d6a529122f10e17a17f807d8d51154b5ba14
 182845 fail b240eab03530f063ef5438497d70a731b19a201e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c5ea91da443b458352c1b629b490ee6631775cb4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 49b2d6a529122f10e17a17f807d8d51154b5ba14
 182857 pass b9e702c3c9bfe7bfb6bbcff44603add64e1787bf 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e 46de2eec93bffa0706e6229c0da2919763c8eb04 17dfc79ce9fd6cf508ee84a7d0d972d6abe268c2
 182858 fail b240eab03530f063ef5438497d70a731b19a201e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c5ea91da443b458352c1b629b490ee6631775cb4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 49b2d6a529122f10e17a17f807d8d51154b5ba14
 182859 pass 6ded9f50c3aa123fe581c42ff6c03789b9b593c1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e ea1b7a0733906b8425d948ae94fba63c32b1d425 5eb6bd7454e253f4907dbeb7aa982967b21698bc
 182860 pass f5c987fcac567b1f84a418826f30d8ef2b46860e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e 1281e340ad1d90c0cc8e8d902bb34f1871eb48cf aab4b38b5d77e3c65f44bacd56427a85b7392a11
 182862 pass 2d8c17a9b61ad298986daffe5373026c3b88c741 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e 1281e340ad1d90c0cc8e8d902bb34f1871eb48cf d3be806dae9c122fe94702cd9fa2e358a60828cd
 182863 pass 00b51e0d78a547dd78119ec44fcc74a01b6f79c8 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e 1281e340ad1d90c0cc8e8d902bb34f1871eb48cf db75dfdb11dc4e837585bf61cc25dc0c8f048288
 182854 fail b240eab03530f063ef5438497d70a731b19a201e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c5ea91da443b458352c1b629b490ee6631775cb4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 49b2d6a529122f10e17a17f807d8d51154b5ba14
 182864 pass beafabdae49c873adecdb7511dbebe9d4ff5c8f0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 f805cf3e9b87584e16b03b5059b1163fd22bf5a0
 182866 pass bbf182229587958b17336c114e0a1525c4f90f3d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 b2dd946ece74e2b6e0601f28caef72f4f9950102
 182867 pass 48de494bb4befce3b1c466c4ec132540d504047f 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 cba6d44a13d5e25334d164e27cb1b1d7674aa05e
 182868 pass 5443c2dc310d2c8eb15fb8eefd5057342e78cd0d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 cba6d44a13d5e25334d164e27cb1b1d7674aa05e
 182869 fail 60d0f5802bceab3482c6be6dfde73a2af8373f9f 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c5ea91da443b458352c1b629b490ee6631775cb4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 cba6d44a13d5e25334d164e27cb1b1d7674aa05e
 182870 pass ff7ddc02b273f9159ef46fdb67d99062f8e598d9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 cba6d44a13d5e25334d164e27cb1b1d7674aa05e
 182871 pass b74f1f7ab5e956f58ae1771dc4e2a4b92bc51430 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 cba6d44a13d5e25334d164e27cb1b1d7674aa05e
 182872 fail b74f1f7ab5e956f58ae1771dc4e2a4b92bc51430 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c5ea91da443b458352c1b629b490ee6631775cb4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 cba6d44a13d5e25334d164e27cb1b1d7674aa05e
 182873 pass b74f1f7ab5e956f58ae1771dc4e2a4b92bc51430 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 cba6d44a13d5e25334d164e27cb1b1d7674aa05e
 182874 fail b74f1f7ab5e956f58ae1771dc4e2a4b92bc51430 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c5ea91da443b458352c1b629b490ee6631775cb4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 cba6d44a13d5e25334d164e27cb1b1d7674aa05e
 182875 pass b74f1f7ab5e956f58ae1771dc4e2a4b92bc51430 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 cba6d44a13d5e25334d164e27cb1b1d7674aa05e
 182876 fail b74f1f7ab5e956f58ae1771dc4e2a4b92bc51430 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c5ea91da443b458352c1b629b490ee6631775cb4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 cba6d44a13d5e25334d164e27cb1b1d7674aa05e
Searching for interesting versions
 Result found: flight 174761 (pass), for basis pass
 For basis failure, parent search stopping at b74f1f7ab5e956f58ae1771dc4e2a4b92bc51430 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 cba6d44a13d5e25334d164e27cb1b1d7674aa05e, results HASH(0x55566bff2f48) HASH(0x55566cc64220) HASH(0x55566cc6ab60) For basis failure, parent search stopping at ff7ddc02b273f9159ef46fdb67d99062f8e598d9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e 7a4003be2\
 5eae462f3c3d8aad96b57e34dc0c2b8 cba6d44a13d5e25334d164e27cb1b1d7674aa05e, results HASH(0x55566cc5acb0) For basis failure, parent search stopping at 5443c2dc310d2c8eb15fb8eefd5057342e78cd0d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 cba6d44a13d5e25334d164e27cb1b1d7674aa05e, results HASH(0x55566bff3818) For basis failure, parent search stopping at 48de494bb4befce3b1c466c4ec132540d504047f 3d273dd05e51e5a1ffba3d98c7437ee\
 84e8f8764 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 cba6d44a13d5e25334d164e27cb1b1d7674aa05e, results HASH(0x55566cc27ef0) For basis failure, parent search stopping at bbf182229587958b17336c114e0a1525c4f90f3d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 b2dd946ece74e2b6e0601f28caef72f4f9950102, results HASH(0x55566bff2eb8) For basis failure, parent search stopping at beafabdae49c\
 873adecdb7511dbebe9d4ff5c8f0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 f805cf3e9b87584e16b03b5059b1163fd22bf5a0, results HASH(0x55566bff38d8) For basis failure, parent search stopping at 00b51e0d78a547dd78119ec44fcc74a01b6f79c8 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e 1281e340ad1d90c0cc8e8d902bb34f1871eb48cf db75dfdb11dc4e837585bf61cc25dc0c8f048288, results HASH(0x55566cc2a4f\
 8) For basis failure, parent search stopping at 2d8c17a9b61ad298986daffe5373026c3b88c741 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e 1281e340ad1d90c0cc8e8d902bb34f1871eb48cf d3be806dae9c122fe94702cd9fa2e358a60828cd, results HASH(0x55566bff2c48) For basis failure, parent search stopping at f5c987fcac567b1f84a418826f30d8ef2b46860e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e 1281e340ad1d90c0cc8e8d902bb34f1871eb48cf aab4b38b\
 5d77e3c65f44bacd56427a85b7392a11, results HASH(0x55566cc53f80) For basis failure, parent search stopping at 6ded9f50c3aa123fe581c42ff6c03789b9b593c1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e ea1b7a0733906b8425d948ae94fba63c32b1d425 5eb6bd7454e253f4907dbeb7aa982967b21698bc, results HASH(0x55566cc33a68) For basis failure, parent search stopping at b9e702c3c9bfe7bfb6bbcff44603add64e1787bf 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 305f6f62d9d250a32cdf090ddcb7e3\
 a5b26a342e 46de2eec93bffa0706e6229c0da2919763c8eb04 17dfc79ce9fd6cf508ee84a7d0d972d6abe268c2, results HASH(0x55566bff37e8) HASH(0x55566cc4df68) Result found: flight 182801 (fail), for basis failure (at ancestor ~3092)
 Repro found: flight 182857 (pass), for basis pass
 Repro found: flight 182858 (fail), for basis failure
 0 revisions at b74f1f7ab5e956f58ae1771dc4e2a4b92bc51430 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 cba6d44a13d5e25334d164e27cb1b1d7674aa05e
No revisions left to test, checking graph state.
 Result found: flight 182871 (pass), for last pass
 Result found: flight 182872 (fail), for first failure
 Repro found: flight 182873 (pass), for last pass
 Repro found: flight 182874 (fail), for first failure
 Repro found: flight 182875 (pass), for last pass
 Repro found: flight 182876 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu https://gitlab.com/qemu-project/qemu.git
  Bug introduced:  c5ea91da443b458352c1b629b490ee6631775cb4
  Bug not present: 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/182876/


  (Revision log too long, omitted.)

neato: graph is too large for cairo-renderer bitmaps. Scaling by 0.234726 to fit
pnmtopng: 13 colors found
Revision graph left in /home/logs/results/bisect/qemu-mainline/build-amd64-xsm.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
182876: tolerable ALL FAIL

flight 182876 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/182876/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-amd64-xsm               6 xen-build               fail baseline untested


jobs:
 build-amd64-xsm                                              fail    


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


