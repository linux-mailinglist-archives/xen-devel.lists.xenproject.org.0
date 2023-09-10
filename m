Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C753C79A083
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 00:04:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.598815.933939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfSWA-0004Rp-6J; Sun, 10 Sep 2023 22:02:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 598815.933939; Sun, 10 Sep 2023 22:02:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfSWA-0004Pp-2R; Sun, 10 Sep 2023 22:02:58 +0000
Received: by outflank-mailman (input) for mailman id 598815;
 Sun, 10 Sep 2023 22:02:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qfSW8-0004Pf-UO; Sun, 10 Sep 2023 22:02:56 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qfSW8-0004zo-NO; Sun, 10 Sep 2023 22:02:56 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qfSW8-0004NN-Fr; Sun, 10 Sep 2023 22:02:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qfSW8-0006jG-FQ; Sun, 10 Sep 2023 22:02:56 +0000
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
	bh=tpXSysJQnBWGSQhuQWnBaJbRG41drMJ/s12rB1WtvkU=; b=DOXGDzdRZL/3JrbiYkm9ChP9/Q
	SoOHVOU+aXeQwYOV/bnPHZbiZjQS1gh5SgK7qMqtC8d5l+zPmIy7FyLKc1gJhtCfSOR8D6kBW4ySV
	r7FwwGgZE7gpsW4raKfoSe2LZJoVkc+HvHWoW2dH5SJQuFqq1hMx+/enHWrsKJwPWNmY=;
To: xen-devel@lists.xenproject.org
Subject: [qemu-mainline bisection] complete build-amd64
Message-Id: <E1qfSW8-0006jG-FQ@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 10 Sep 2023 22:02:56 +0000

branch xen-unstable
xenbranch xen-unstable
job build-amd64
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/182896/


  (Revision log too long, omitted.)


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/build-amd64.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/build-amd64.xen-build --summary-out=tmp/182896.bisection-summary --basis-template=182707 --blessings=real,real-bisect,real-retry qemu-mainline build-amd64 xen-build
Searching for failure / basis pass:
 182879 fail [host=nobling0] / 182707 [host=pinot0] 182638 [host=pinot0] 182606 [host=nobling1] 182588 [host=himrod2] 182584 [host=nobling1] 182570 [host=himrod2] 182555 [host=nobling1] 182543 [host=himrod0] 182520 [host=himrod2] 182508 [host=himrod2] 182422 [host=himrod2] 182355 [host=himrod2] 182338 [host=himrod0] 182310 [host=himrod0] 182298 [host=himrod2] 182276 [host=himrod2] 182263 [host=himrod0] 182242 [host=himrod2] 182231 [host=himrod2] 182222 [host=himrod2] 182208 [host=himrod0] 182202\
  [host=himrod2] 182194 [host=himrod0] 182185 [host=pinot0] 182171 [host=himrod2] 182114 [host=himrod2] 182096 [host=himrod2] 182067 [host=himrod2] 182029 [host=himrod2] 182023 [host=himrod2] 182006 [host=himrod2] 181993 [host=himrod2] 181952 [host=godello0] 181918 [host=godello0] 181901 [host=himrod0] 181212 [host=himrod2] 181201 [host=albana0] 181177 [host=albana0] 181168 [host=himrod2] 181159 [host=albana0] 181151 [host=himrod2] 181140 [host=godello0] 181131 [host=himrod2] 181119 [host=huxelre\
 be0] 181103 [host=himrod2] 181089 [host=himrod0] 181068 [host=godello0] 181057 [host=himrod2] 181041 [host=himrod2] 181021 [host=himrod2] 181013 [host=himrod2] 181006 [host=himrod0] 181003 [host=himrod2] 180996 [host=himrod0] 180990 [host=himrod0] 180987 [host=himrod2] 180983 [host=huxelrebe0] 180981 [host=himrod2] 180977 [host=himrod0] 180691 [host=himrod2] 180686 [host=himrod2] 180673 [host=nobling1] 180659 [host=nobling1] 180643 [host=godello0] 180637 [host=albana0] 180626 [host=himrod2] 1806\
 21 [host=himrod2] 180610 [host=albana0] 180600 [host=himrod2] 180586 [host=himrod0] 180559 [host=himrod0] 180553 [host=himrod0] 180546 [host=himrod0] 180536 [host=elbling0] 180530 [host=nobling1] 180522 [host=himrod2] 180514 [host=himrod2] 180507 [host=himrod2] 180487 [host=himrod2] 180480 [host=himrod2] 180469 [host=himrod2] 180449 [host=himrod2] 180431 [host=himrod2] 180412 [host=debina0] 180398 [host=himrod2] 180394 [host=himrod2] 180389 [host=himrod2] 180386 [host=nobling1] 180382 [host=himr\
 od2] 180373 [host=himrod0] 180361 [host=himrod0] 180334 [host=himrod2] 180258 [host=himrod0] 180251 [host=himrod2] 180231 [host=nobling1] 180220 [host=himrod2] 180207 [host=himrod2] 180204 [host=himrod0] 180198 [host=himrod0] 180195 [host=himrod0] 180168 [host=himrod0] 180153 [host=himrod2] 180146 [host=himrod0] 180136 [host=himrod2] 180088 [host=himrod2] 180057 [host=himrod0] 180047 [host=himrod2] 180043 [host=himrod2] 179993 [host=himrod0] 179971 [host=godello0] 179955 [host=himrod2] 179915 [h\
 ost=himrod0] 179874 [host=himrod2] 179847 [host=himrod2] 179824 [host=himrod2] 179816 [host=godello0] 179802 [host=himrod0] 179795 [host=himrod2] 179776 [host=himrod2] 179756 [host=himrod2] 179733 [host=himrod2] 179708 [host=himrod0] 179682 [host=himrod0] 179657 [host=himrod2] 179644 [host=himrod2] 179628 [host=himrod2] 179609 [host=himrod2] 179596 [host=himrod2] 179588 [host=himrod2] 179574 [host=himrod2] 179561 [host=himrod2] 179548 [host=himrod2] 179534 [host=himrod2] 179526 [host=himrod2] 17\
 9518 [host=himrod2] 179501 [host=himrod2] 179497 [host=godello0] 179449 [host=godello0] 176449 [host=pinot0] 176423 [host=sabro0] 176407 [host=nobling1] 176392 [host=godello0] 176367 [host=sabro0] 176352 [host=himrod2] 176342 [host=himrod2] 176096 [host=himrod2] 176080 [host=himrod2] 176069 [host=sabro0] 176022 [host=nobling1] 176008 [host=nobling1] 175998 [host=sabro0] 175991 [host=himrod0] 175977 [host=himrod2] 175962 [host=himrod0] 175743 [host=himrod0] 175735 [host=himrod2] 175637 [host=himr\
 od2] 175627 [host=himrod0] 175623 [host=himrod2] 175619 [host=himrod2] 175614 [host=himrod2] 175603 [host=himrod2] 175595 [host=himrod2] 175590 [host=himrod2] 175583 [host=himrod2] 175571 [host=himrod2] 175457 [host=himrod2] 175443 [host=himrod2] 175394 [host=sabro1] 175377 [host=himrod2] 175344 [host=himrod2] 175321 [host=himrod2] 175297 [host=himrod2] 175267 [host=nobling1] 175186 [host=himrod2] 175068 [host=huxelrebe0] 175051 [host=himrod2] 175043 [host=nobling1] 174993 [host=godello0] 174989\
  [host=himrod2] 174976 [host=sabro0] 174963 [host=sabro1] 174949 [host=himrod2] 174935 [host=himrod2] 174923 [host=sabro1] 174899 [host=himrod2] 174807 [host=himrod2] 174788 [host=himrod2] 174780 [host=sabro0] 174777 [host=himrod2] 174761 ok.
Failure / basis pass flights: 182879 / 174761
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
 175609 [host=himrod2]
 175611 [host=himrod2]
 175614 [host=himrod2]
 175618 [host=himrod2]
 175620 [host=himrod2]
 175619 [host=himrod2]
 175621 [host=himrod2]
 175623 [host=himrod2]
 175627 [host=himrod0]
 175631 [host=himrod2]
 175640 [host=himrod2]
 175637 [host=himrod2]
 175643 [host=himrod0]
 175647 [host=himrod0]
 175652 [host=himrod0]
 175656 [host=himrod0]
 175657 [host=himrod0]
 175654 [host=himrod0]
 175658 [host=himrod0]
 175659 [host=himrod0]
 175664 [host=himrod0]
 175672 [host=himrod2]
 175681 [host=himrod2]
 175691 [host=himrod0]
 175703 [host=himrod0]
 175709 [host=himrod0]
 175716 [host=himrod0]
 175719 [host=himrod2]
 175722 [host=himrod0]
 175725 [host=himrod0]
 175727 [host=himrod0]
 175729 [host=himrod0]
 175733 [host=himrod0]
 175735 [host=himrod2]
 175745 [host=himrod0]
 175743 [host=himrod0]
 175750 [host=himrod2]
 175832 [host=himrod2]
 175835 [host=himrod2]
 175837 [host=himrod2]
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
 176079 [host=himrod2]
 176083 [host=himrod2]
 176080 [host=himrod2]
 176087 [host=nobling1]
 176096 [host=himrod2]
 174743 [host=sabro0]
 174749 [host=sabro0]
 174752 [host=himrod0]
 174756 [host=himrod0]
 174760 pass irrelevant
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
 175068 [host=huxelrebe0]
 176342 [host=himrod2]
 176352 [host=himrod2]
 176368 [host=sabro0]
 176369 [host=himrod2]
 176372 [host=himrod2]
 176374 [host=godello0]
 176377 [host=godello0]
 176367 [host=sabro0]
 176379 [host=himrod2]
 175186 [host=himrod2]
 176380 [host=himrod2]
 176381 [host=himrod2]
 176383 [host=himrod2]
 176384 [host=himrod2]
 176389 [host=pinot0]
 176391 [host=godello0]
 176393 [host=pinot0]
 176394 [host=himrod0]
 176396 [host=sabro0]
 176397 [host=sabro0]
 176398 [host=sabro0]
 176399 [host=sabro0]
 176400 [host=sabro0]
 176401 [host=sabro0]
 176402 [host=sabro0]
 176392 [host=godello0]
 176404 [host=nobling1]
 176408 [host=himrod2]
 176410 [host=himrod2]
 176412 [host=sabro0]
 176415 [host=debina0]
 176416 [host=sabro0]
 176418 [host=sabro0]
 176419 [host=sabro0]
 176407 [host=nobling1]
 176420 [host=sabro0]
 176423 [host=sabro0]
 176387 [host=sabro0]
 176427 [host=himrod2]
 175267 [host=nobling1]
 176429 [host=godello0]
 176431 [host=godello0]
 176432 [host=godello0]
 176436 [host=godello0]
 176433 [host=godello0]
 176440 [host=himrod2]
 176444 [host=himrod2]
 176446 [host=himrod2]
 176450 [host=pinot0]
 176454 [host=godello0]
 176456 [host=himrod2]
 176449 [host=pinot0]
 175297 [host=himrod2]
 175321 [host=himrod2]
 175344 [host=himrod2]
 175377 [host=himrod2]
 175394 [host=sabro1]
 175443 [host=himrod2]
 175457 [host=himrod2]
 175571 [host=himrod2]
 175583 [host=himrod2]
 179449 [host=godello0]
 179497 [host=godello0]
 179501 [host=himrod2]
 179518 [host=himrod2]
 179526 [host=himrod2]
 179534 [host=himrod2]
 179548 [host=himrod2]
 179561 [host=himrod2]
 179574 [host=himrod2]
 179588 [host=himrod2]
 179596 [host=himrod2]
 179609 [host=himrod2]
 179628 [host=himrod2]
 179644 [host=himrod2]
 179666 [host=himrod2]
 179669 [host=himrod2]
 179671 [host=himrod2]
 179673 [host=himrod2]
 179676 [host=himrod2]
 179657 [host=himrod2]
 179679 [host=godello0]
 179683 [host=himrod0]
 179686 [host=himrod0]
 179689 [host=himrod0]
 179691 [host=himrod0]
 179692 [host=himrod0]
 179693 [host=himrod0]
 179695 [host=himrod0]
 179696 [host=himrod2]
 179699 [host=himrod2]
 179700 [host=himrod2]
 179701 [host=himrod2]
 179703 [host=himrod2]
 179704 [host=himrod2]
 179682 [host=himrod0]
 179707 [host=himrod0]
 179710 [host=himrod0]
 179712 [host=himrod0]
 179715 [host=himrod2]
 179718 [host=himrod2]
 179719 [host=godello0]
 179721 [host=himrod0]
 179723 [host=himrod0]
 179726 [host=himrod0]
 179729 [host=himrod0]
 179708 [host=himrod0]
 179732 [host=himrod2]
 179734 [host=himrod2]
 179736 [host=himrod0]
 179737 [host=himrod0]
 179739 [host=himrod0]
 179740 [host=himrod0]
 179743 [host=himrod0]
 179745 [host=himrod2]
 179748 [host=himrod2]
 179750 [host=himrod2]
 179751 [host=himrod2]
 179753 [host=himrod2]
 179754 [host=himrod0]
 179733 [host=himrod2]
 179755 [host=himrod2]
 179758 [host=himrod2]
 179759 [host=himrod2]
 179760 [host=himrod2]
 179761 [host=himrod2]
 179763 [host=himrod0]
 179764 [host=himrod0]
 179765 [host=himrod0]
 179766 [host=himrod0]
 179767 [host=himrod0]
 179768 [host=himrod0]
 179771 [host=himrod2]
 179772 [host=himrod2]
 179773 [host=himrod2]
 179756 [host=himrod2]
 179775 [host=himrod2]
 179777 [host=himrod0]
 179778 [host=himrod0]
 179784 [host=himrod0]
 179790 [host=himrod0]
 179776 [host=himrod2]
 179794 [host=himrod2]
 179795 [host=himrod2]
 179802 [host=himrod0]
 179816 [host=godello0]
 179828 [host=himrod2]
 179831 [host=himrod2]
 179844 [host=himrod2]
 179824 [host=himrod2]
 179850 [host=himrod2]
 179847 [host=himrod2]
 179875 [host=himrod2]
 179881 [host=elbling0]
 179884 [host=himrod2]
 179887 [host=himrod2]
 179874 [host=himrod2]
 179914 [host=himrod2]
 179916 [host=himrod2]
 179925 [host=himrod2]
 179933 [host=himrod2]
 179938 [host=himrod2]
 179943 [host=himrod2]
 179946 [host=himrod2]
 179948 [host=himrod2]
 179952 [host=himrod2]
 179915 [host=himrod0]
 179954 [host=himrod2]
 179957 [host=himrod2]
 179958 [host=himrod2]
 179959 [host=godello0]
 179961 [host=godello0]
 179963 [host=himrod2]
 179964 [host=himrod2]
 179965 [host=himrod2]
 179967 [host=himrod2]
 179968 [host=himrod2]
 179955 [host=himrod2]
 179970 [host=himrod0]
 179972 [host=godello0]
 179973 [host=himrod2]
 179974 [host=himrod2]
 179975 [host=himrod2]
 179977 [host=himrod2]
 179980 [host=himrod2]
 179982 [host=himrod0]
 179971 [host=godello0]
 179996 [host=huxelrebe0]
 180002 [host=godello0]
 180004 [host=himrod2]
 180005 [host=himrod2]
 180008 [host=himrod0]
 179993 [host=himrod0]
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
 180259 [host=himrod0]
 180260 [host=pinot0]
 180334 [host=himrod2]
 180361 [host=himrod0]
 180374 [host=himrod0]
 180375 [host=himrod0]
 180373 [host=himrod0]
 180382 [host=himrod2]
 180394 [host=himrod2]
 180386 [host=nobling1]
 180388 [host=himrod2]
 180392 [host=himrod2]
 180389 [host=himrod2]
 180398 [host=himrod2]
 180414 [host=debina0]
 180417 [host=godello0]
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
 180558 [host=himrod2]
 180560 [host=himrod2]
 180562 [host=himrod2]
 180559 [host=himrod0]
 180586 [host=himrod0]
 180600 [host=himrod2]
 180610 [host=albana0]
 180621 [host=himrod2]
 180626 [host=himrod2]
 180636 [host=albana0]
 180638 [host=nobling1]
 180637 [host=albana0]
 180643 [host=godello0]
 180659 [host=nobling1]
 180673 [host=nobling1]
 180686 [host=himrod2]
 180702 [host=himrod0]
 180691 [host=himrod2]
 180704 [host=himrod2]
 180721 [host=himrod2]
 180742 [host=himrod2]
 180759 [host=himrod2]
 180760 [host=himrod2]
 180761 [host=himrod2]
 180762 [host=himrod2]
 180764 [host=himrod2]
 180765 [host=himrod2]
 180767 [host=himrod2]
 180769 [host=himrod2]
 180770 [host=himrod2]
 180771 [host=himrod2]
 180772 [host=himrod2]
 180773 [host=himrod2]
 180774 [host=himrod2]
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
 180878 [host=himrod2]
 180881 [host=himrod2]
 180887 [host=himrod2]
 180894 [host=himrod2]
 180902 [host=himrod2]
 180906 [host=himrod2]
 180909 [host=himrod2]
 180912 [host=himrod2]
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
 180975 [host=himrod0]
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
 181042 [host=himrod2]
 181051 [host=himrod2]
 181041 [host=himrod2]
 181055 [host=himrod2]
 181058 [host=himrod2]
 181060 [host=himrod2]
 181062 [host=himrod0]
 181064 [host=himrod2]
 181057 [host=himrod2]
 181065 [host=himrod2]
 181069 [host=godello0]
 181070 [host=himrod2]
 181073 [host=himrod2]
 181075 [host=himrod0]
 181080 [host=himrod0]
 181083 [host=himrod2]
 181085 [host=himrod2]
 181086 [host=himrod0]
 181068 [host=godello0]
 181088 [host=himrod0]
 181092 [host=himrod0]
 181094 [host=himrod0]
 181096 [host=himrod0]
 181097 [host=himrod0]
 181099 [host=himrod0]
 181089 [host=himrod0]
 181101 [host=godello0]
 181104 [host=himrod2]
 181105 [host=himrod2]
 181108 [host=himrod0]
 181110 [host=himrod2]
 181112 [host=himrod2]
 181114 [host=himrod2]
 181103 [host=himrod2]
 181116 [host=huxelrebe0]
 181120 [host=godello0]
 181121 [host=godello0]
 181123 [host=godello0]
 181124 [host=godello0]
 181119 [host=huxelrebe0]
 181135 [host=godello0]
 181131 [host=himrod2]
 181141 [host=godello0]
 181142 [host=godello0]
 181145 [host=godello0]
 181146 [host=godello0]
 181148 [host=himrod2]
 181149 [host=himrod2]
 181140 [host=godello0]
 181152 [host=himrod2]
 181151 [host=himrod2]
 181159 [host=albana0]
 181168 [host=himrod2]
 181174 [host=himrod2]
 181176 [host=albana0]
 181179 [host=albana0]
 181180 [host=himrod2]
 181181 [host=himrod2]
 181177 [host=albana0]
 181188 [host=himrod2]
 181200 [host=albana0]
 181203 [host=godello0]
 181201 [host=albana0]
 181215 [host=himrod0]
 181212 [host=himrod2]
 181232 [host=himrod2]
 181231 [host=himrod2]
 181236 [host=himrod0]
 181244 [host=himrod2]
 181271 [host=himrod2]
 181281 [host=himrod0]
 181299 [host=himrod0]
 181305 [host=himrod0]
 181312 [host=himrod0]
 181322 [host=himrod0]
 181327 [host=himrod2]
 181335 [host=himrod2]
 181345 [host=himrod2]
 181356 [host=himrod0]
 181361 [host=himrod2]
 181372 [host=himrod2]
 181375 [host=himrod0]
 181376 [host=himrod0]
 181379 [host=himrod0]
 181380 [host=himrod0]
 181382 [host=himrod0]
 181384 [host=himrod0]
 181386 [host=himrod0]
 181388 [host=himrod0]
 181389 [host=himrod0]
 181390 [host=himrod0]
 181391 [host=himrod0]
 181393 [host=himrod2]
 181394 [host=himrod2]
 181403 [host=himrod2]
 181409 [host=himrod2]
 181416 [host=himrod0]
 181419 [host=himrod0]
 181424 [host=himrod0]
 181428 [host=himrod2]
 181430 [host=himrod2]
 181436 [host=himrod0]
 181443 [host=himrod0]
 181446 [host=himrod2]
 181461 [host=himrod2]
 181463 [host=himrod2]
 181472 [host=himrod0]
 181478 [host=himrod0]
 181483 [host=himrod2]
 181485 [host=himrod0]
 181492 [host=himrod2]
 181493 [host=himrod2]
 181496 [host=himrod2]
 181544 [host=himrod2]
 181549 [host=himrod2]
 181901 [host=himrod0]
 181919 [host=godello0]
 181924 [host=himrod0]
 181928 [host=godello0]
 181918 [host=godello0]
 181952 [host=godello0]
 181993 [host=himrod2]
 182007 [host=himrod2]
 182006 [host=himrod2]
 182023 [host=himrod2]
 182029 [host=himrod2]
 182067 [host=himrod2]
 182096 [host=himrod2]
 182115 [host=himrod2]
 182116 [host=himrod2]
 182114 [host=himrod2]
 182171 [host=himrod2]
 182185 [host=pinot0]
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
 182543 [host=himrod0]
 182555 [host=nobling1]
 182570 [host=himrod2]
 182584 [host=nobling1]
 182588 [host=himrod2]
 182606 [host=nobling1]
 182638 [host=pinot0]
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
 182854 fail b240eab03530f063ef5438497d70a731b19a201e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c5ea91da443b458352c1b629b490ee6631775cb4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 49b2d6a529122f10e17a17f807d8d51154b5ba14
 182865 fail b240eab03530f063ef5438497d70a731b19a201e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c5ea91da443b458352c1b629b490ee6631775cb4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 49b2d6a529122f10e17a17f807d8d51154b5ba14
 182877 pass b9e702c3c9bfe7bfb6bbcff44603add64e1787bf 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e 46de2eec93bffa0706e6229c0da2919763c8eb04 17dfc79ce9fd6cf508ee84a7d0d972d6abe268c2
 182878 fail b240eab03530f063ef5438497d70a731b19a201e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c5ea91da443b458352c1b629b490ee6631775cb4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 49b2d6a529122f10e17a17f807d8d51154b5ba14
 182880 pass 6ded9f50c3aa123fe581c42ff6c03789b9b593c1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e ea1b7a0733906b8425d948ae94fba63c32b1d425 5eb6bd7454e253f4907dbeb7aa982967b21698bc
 182881 pass f5c987fcac567b1f84a418826f30d8ef2b46860e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e 1281e340ad1d90c0cc8e8d902bb34f1871eb48cf aab4b38b5d77e3c65f44bacd56427a85b7392a11
 182879 fail b240eab03530f063ef5438497d70a731b19a201e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c5ea91da443b458352c1b629b490ee6631775cb4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 49b2d6a529122f10e17a17f807d8d51154b5ba14
 182882 pass 2d8c17a9b61ad298986daffe5373026c3b88c741 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e 1281e340ad1d90c0cc8e8d902bb34f1871eb48cf d3be806dae9c122fe94702cd9fa2e358a60828cd
 182883 pass 00b51e0d78a547dd78119ec44fcc74a01b6f79c8 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e 1281e340ad1d90c0cc8e8d902bb34f1871eb48cf db75dfdb11dc4e837585bf61cc25dc0c8f048288
 182885 pass beafabdae49c873adecdb7511dbebe9d4ff5c8f0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 f805cf3e9b87584e16b03b5059b1163fd22bf5a0
 182886 pass bbf182229587958b17336c114e0a1525c4f90f3d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 b2dd946ece74e2b6e0601f28caef72f4f9950102
 182887 pass 48de494bb4befce3b1c466c4ec132540d504047f 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 cba6d44a13d5e25334d164e27cb1b1d7674aa05e
 182888 pass 5443c2dc310d2c8eb15fb8eefd5057342e78cd0d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 cba6d44a13d5e25334d164e27cb1b1d7674aa05e
 182889 fail 60d0f5802bceab3482c6be6dfde73a2af8373f9f 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c5ea91da443b458352c1b629b490ee6631775cb4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 cba6d44a13d5e25334d164e27cb1b1d7674aa05e
 182890 pass ff7ddc02b273f9159ef46fdb67d99062f8e598d9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 cba6d44a13d5e25334d164e27cb1b1d7674aa05e
 182891 pass b74f1f7ab5e956f58ae1771dc4e2a4b92bc51430 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 cba6d44a13d5e25334d164e27cb1b1d7674aa05e
 182892 fail b74f1f7ab5e956f58ae1771dc4e2a4b92bc51430 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c5ea91da443b458352c1b629b490ee6631775cb4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 cba6d44a13d5e25334d164e27cb1b1d7674aa05e
 182893 pass b74f1f7ab5e956f58ae1771dc4e2a4b92bc51430 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 cba6d44a13d5e25334d164e27cb1b1d7674aa05e
 182894 fail b74f1f7ab5e956f58ae1771dc4e2a4b92bc51430 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c5ea91da443b458352c1b629b490ee6631775cb4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 cba6d44a13d5e25334d164e27cb1b1d7674aa05e
 182895 pass b74f1f7ab5e956f58ae1771dc4e2a4b92bc51430 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 cba6d44a13d5e25334d164e27cb1b1d7674aa05e
 182896 fail b74f1f7ab5e956f58ae1771dc4e2a4b92bc51430 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c5ea91da443b458352c1b629b490ee6631775cb4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 cba6d44a13d5e25334d164e27cb1b1d7674aa05e
Searching for interesting versions
 Result found: flight 174761 (pass), for basis pass
 For basis failure, parent search stopping at b74f1f7ab5e956f58ae1771dc4e2a4b92bc51430 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 cba6d44a13d5e25334d164e27cb1b1d7674aa05e, results HASH(0x5645aa41dc68) HASH(0x5645aa4265b0) HASH(0x5645aa41e868) For basis failure, parent search stopping at ff7ddc02b273f9159ef46fdb67d99062f8e598d9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e 7a4003be2\
 5eae462f3c3d8aad96b57e34dc0c2b8 cba6d44a13d5e25334d164e27cb1b1d7674aa05e, results HASH(0x5645aa419c30) For basis failure, parent search stopping at 5443c2dc310d2c8eb15fb8eefd5057342e78cd0d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 cba6d44a13d5e25334d164e27cb1b1d7674aa05e, results HASH(0x5645aa40f9f8) For basis failure, parent search stopping at 48de494bb4befce3b1c466c4ec132540d504047f 3d273dd05e51e5a1ffba3d98c7437ee\
 84e8f8764 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 cba6d44a13d5e25334d164e27cb1b1d7674aa05e, results HASH(0x5645aa4099b8) For basis failure, parent search stopping at bbf182229587958b17336c114e0a1525c4f90f3d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 b2dd946ece74e2b6e0601f28caef72f4f9950102, results HASH(0x5645aa402d78) For basis failure, parent search stopping at beafabdae49c\
 873adecdb7511dbebe9d4ff5c8f0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 f805cf3e9b87584e16b03b5059b1163fd22bf5a0, results HASH(0x5645a97aa110) For basis failure, parent search stopping at 00b51e0d78a547dd78119ec44fcc74a01b6f79c8 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e 1281e340ad1d90c0cc8e8d902bb34f1871eb48cf db75dfdb11dc4e837585bf61cc25dc0c8f048288, results HASH(0x5645aa4093b\
 8) For basis failure, parent search stopping at 2d8c17a9b61ad298986daffe5373026c3b88c741 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e 1281e340ad1d90c0cc8e8d902bb34f1871eb48cf d3be806dae9c122fe94702cd9fa2e358a60828cd, results HASH(0x5645aa3eaba8) For basis failure, parent search stopping at f5c987fcac567b1f84a418826f30d8ef2b46860e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e 1281e340ad1d90c0cc8e8d902bb34f1871eb48cf aab4b38b\
 5d77e3c65f44bacd56427a85b7392a11, results HASH(0x5645a97a1908) For basis failure, parent search stopping at 6ded9f50c3aa123fe581c42ff6c03789b9b593c1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e ea1b7a0733906b8425d948ae94fba63c32b1d425 5eb6bd7454e253f4907dbeb7aa982967b21698bc, results HASH(0x5645a97a9ea0) For basis failure, parent search stopping at b9e702c3c9bfe7bfb6bbcff44603add64e1787bf 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 305f6f62d9d250a32cdf090ddcb7e3\
 a5b26a342e 46de2eec93bffa0706e6229c0da2919763c8eb04 17dfc79ce9fd6cf508ee84a7d0d972d6abe268c2, results HASH(0x5645a97c9080) HASH(0x5645a9844c38) Result found: flight 182801 (fail), for basis failure (at ancestor ~3092)
 Repro found: flight 182877 (pass), for basis pass
 Repro found: flight 182878 (fail), for basis failure
 0 revisions at b74f1f7ab5e956f58ae1771dc4e2a4b92bc51430 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 cba6d44a13d5e25334d164e27cb1b1d7674aa05e
No revisions left to test, checking graph state.
 Result found: flight 182891 (pass), for last pass
 Result found: flight 182892 (fail), for first failure
 Repro found: flight 182893 (pass), for last pass
 Repro found: flight 182894 (fail), for first failure
 Repro found: flight 182895 (pass), for last pass
 Repro found: flight 182896 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu https://gitlab.com/qemu-project/qemu.git
  Bug introduced:  c5ea91da443b458352c1b629b490ee6631775cb4
  Bug not present: 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/182896/


  (Revision log too long, omitted.)

neato: graph is too large for cairo-renderer bitmaps. Scaling by 0.234726 to fit
pnmtopng: 13 colors found
Revision graph left in /home/logs/results/bisect/qemu-mainline/build-amd64.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
182896: tolerable ALL FAIL

flight 182896 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/182896/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-amd64                   6 xen-build               fail baseline untested


jobs:
 build-amd64                                                  fail    


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


