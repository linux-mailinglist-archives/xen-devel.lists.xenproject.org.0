Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 467BC57F478
	for <lists+xen-devel@lfdr.de>; Sun, 24 Jul 2022 11:37:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.373951.606184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFY2X-0003Ps-8E; Sun, 24 Jul 2022 09:36:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 373951.606184; Sun, 24 Jul 2022 09:36:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFY2X-0003NO-5K; Sun, 24 Jul 2022 09:36:45 +0000
Received: by outflank-mailman (input) for mailman id 373951;
 Sun, 24 Jul 2022 09:36:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oFY2U-0003NE-Qr; Sun, 24 Jul 2022 09:36:42 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oFY2U-0003B1-ML; Sun, 24 Jul 2022 09:36:42 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oFY2U-0005rU-BY; Sun, 24 Jul 2022 09:36:42 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oFY2U-0007xG-Ax; Sun, 24 Jul 2022 09:36:42 +0000
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
	bh=1ZVUrSuD5QdGX2n8kUbX7TWU0tkt2fT3iIi8tEkhIkg=; b=BoL+pRvxgEFzlObVQJvqOw4Eyz
	jaAMXXqGwXiyqgZ4SkIIYZPW37Lrx8x8mwMe5+jmIor8DyehwN7PnqFA8+hUJe/LfaPbDxFitJE7Q
	IRQg7j8rcWWAUDJXzO469KIWBuvXokZqQYEUFBD0TBXRJEUa/8X1xxelYQ0JLUmsqQXA=;
To: xen-devel@lists.xenproject.org
Subject: [libvirt bisection] complete build-arm64-libvirt
Message-Id: <E1oFY2U-0007xG-Ax@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 24 Jul 2022 09:36:42 +0000

branch xen-unstable
xenbranch xen-unstable
job build-arm64-libvirt
testid libvirt-build

Tree: libvirt git://libvirt.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt git://libvirt.org/libvirt.git
  Bug introduced:  510540961417288a24d0870f0226f8255420c463
  Bug not present: a4d97f0c199e980bb55d3b659214308c1b371b73
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/171838/


  (Revision log too long, omitted.)


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/libvirt/build-arm64-libvirt.libvirt-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/libvirt/build-arm64-libvirt.libvirt-build --summary-out=tmp/171838.bisection-summary --basis-template=151777 --blessings=real,real-bisect,real-retry libvirt build-arm64-libvirt libvirt-build
Searching for failure / basis pass:
 171828 fail [host=rochester0] / 151777 [host=laxton0] 151754 ok.
Failure / basis pass flights: 171828 / 151754
Tree: libvirt git://libvirt.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 510540961417288a24d0870f0226f8255420c463 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae 6964b5c48c69e4961bad2dd9d6c02918f23c3be0 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 fcd27b3c759995775afb66be6bb7ba1e85da0506
Basis pass a4d97f0c199e980bb55d3b659214308c1b371b73 27acf0ef828bf719b2053ba398b195829413dbdd bdafda8c457eb90c65f37026589b54258300f05c ea6d3cd1ed79d824e605a70c3626bc437c386260 88ab0c15525ced2eefe39220742efe4769089ad8 3fdc211b01b29f252166937238efe02d15cb5780
Generating revisions with ./adhoc-revtuple-generator  git://libvirt.org/libvirt.git#a4d97f0c199e980bb55d3b659214308c1b371b73-510540961417288a24d0870f0226f8255420c463 https://gitlab.com/keycodemap/keycodemapdb.git#27acf0ef828bf719b2053ba398b195829413dbdd-57ba70da5312170883a3d622cd2aa3fd0e2ec7ae git://xenbits.xen.org/osstest/ovmf.git#bdafda8c457eb90c65f37026589b54258300f05c-6964b5c48c69e4961bad2dd9d6c02918f23c3be0 git://xenbits.xen.org/qemu-xen.git#ea6d3cd1ed79d824e605a70c3626bc437c386260-b746458e\
 1ce1bec85e58b458386f8b7a0bedfaa6 git://xenbits.xen.org/osstest/seabios.git#88ab0c15525ced2eefe39220742efe4769089ad8-46de2eec93bffa0706e6229c0da2919763c8eb04 git://xenbits.xen.org/xen.git#3fdc211b01b29f252166937238efe02d15cb5780-fcd27b3c759995775afb66be6bb7ba1e85da0506
adhoc-revtuple-generator: tree discontiguous: libvirt
adhoc-revtuple-generator: tree discontiguous: qemu-xen
Loaded 12667 nodes in revision graph
Searching for test results:
 151729 [host=laxton1]
 151754 pass a4d97f0c199e980bb55d3b659214308c1b371b73 27acf0ef828bf719b2053ba398b195829413dbdd bdafda8c457eb90c65f37026589b54258300f05c ea6d3cd1ed79d824e605a70c3626bc437c386260 88ab0c15525ced2eefe39220742efe4769089ad8 3fdc211b01b29f252166937238efe02d15cb5780
 151777 [host=laxton0]
 151818 [host=laxton1]
 151827 [host=laxton1]
 151842 [host=laxton0]
 151858 [host=laxton1]
 151883 [host=laxton1]
 151910 [host=laxton0]
 151935 [host=laxton0]
 151956 [host=laxton0]
 151984 [host=laxton1]
 152006 [host=laxton0]
 152034 [host=laxton0]
 152064 [host=laxton1]
 152094 [host=laxton1]
 152135 [host=laxton1]
 152167 [host=laxton0]
 152226 [host=laxton1]
 152209 [host=laxton0]
 152278 [host=laxton1]
 152193 [host=laxton0]
 152247 [host=laxton1]
 152317 [host=laxton0]
 152296 [host=laxton1]
 152339 [host=laxton0]
 152377 [host=laxton0]
 152408 [host=laxton1]
 152454 [host=laxton0]
 152482 [host=laxton0]
 152502 [host=laxton1]
 152512 [host=laxton0]
 152569 [host=laxton1]
 152558 [host=laxton0]
 152535 [host=laxton1]
 152595 [host=laxton1]
 152539 [host=laxton0]
 152549 [host=laxton0]
 152585 [host=laxton1]
 152628 [host=laxton1]
 152651 [host=laxton1]
 152666 [host=laxton0]
 152686 [host=laxton0]
 152720 [host=laxton1]
 162794 [host=laxton0]
 152784 [host=laxton1]
 152845 [host=laxton1]
 167361 [host=laxton0]
 152881 [host=laxton0]
 162829 [host=laxton0]
 152955 [host=laxton0]
 165325 [host=laxton1]
 153032 [host=laxton1]
 162852 [host=laxton0]
 162870 [host=laxton0]
 162888 [host=laxton1]
 153144 [host=laxton1]
 165373 [host=laxton1]
 165395 [host=laxton1]
 153338 [host=laxton0]
 153440 [host=laxton1]
 166965 [host=laxton0]
 153534 [host=laxton1]
 153608 [host=laxton0]
 165412 [host=laxton1]
 165424 [host=laxton0]
 165441 [host=laxton0]
 162985 [host=laxton1]
 153678 [host=laxton0]
 163011 [host=laxton1]
 163026 [host=laxton1]
 153853 [host=laxton0]
 165451 [host=laxton0]
 165461 [host=laxton1]
 165473 [host=laxton1]
 153928 [host=laxton0]
 153783 [host=laxton0]
 153999 [host=laxton1]
 163139 [host=laxton0]
 166997 [host=laxton1]
 167224 [host=laxton1]
 163111 [host=laxton1]
 167226 [host=laxton1]
 165489 [host=laxton0]
 154043 [host=laxton1]
 154154 [host=laxton1]
 167238 [host=laxton1]
 165504 [host=laxton0]
 154238 [host=laxton1]
 154097 [host=laxton1]
 154353 [host=laxton0]
 163164 [host=laxton0]
 154374 [host=laxton1]
 163178 [host=laxton0]
 154415 [host=laxton0]
 154313 [host=laxton1]
 163191 [host=laxton1]
 163208 [host=laxton0]
 154489 [host=laxton0]
 154454 [host=laxton0]
 163223 [host=laxton1]
 165516 [host=laxton0]
 154561 [host=laxton0]
 165533 [host=laxton0]
 163236 [host=laxton1]
 154520 [host=laxton1]
 154605 [host=laxton0]
 163295 [host=laxton0]
 154632 [host=laxton1]
 154675 [host=laxton0]
 163308 [host=laxton0]
 155123 [host=laxton0]
 163322 [host=laxton0]
 163382 [host=laxton0]
 155067 [host=laxton0]
 167499 [host=laxton0]
 165595 [host=laxton0]
 155193 [host=laxton0]
 155429 [host=laxton0]
 155301 [host=laxton1]
 163431 [host=laxton1]
 155397 [host=laxton0]
 155475 [host=laxton1]
 165633 [host=laxton1]
 155500 [host=laxton1]
 155511 [host=laxton0]
 163466 [host=laxton0]
 155543 [host=laxton0]
 155634 [host=laxton1]
 155588 [host=laxton1]
 155678 [host=laxton1]
 155793 [host=laxton0]
 155721 [host=laxton1]
 163510 [host=laxton0]
 165658 [host=laxton1]
 155831 [host=laxton0]
 155762 [host=laxton0]
 155948 [host=laxton0]
 163555 [host=laxton0]
 155885 [host=laxton0]
 155974 [host=laxton1]
 155920 [host=laxton1]
 156059 [host=laxton1]
 156012 [host=laxton0]
 156082 [host=laxton0]
 165683 [host=laxton1]
 163588 [host=laxton0]
 165702 [host=laxton1]
 156114 [host=laxton1]
 156233 [host=laxton0]
 156163 [host=laxton1]
 156253 [host=laxton0]
 156201 [host=laxton0]
 156290 [host=laxton1]
 163630 [host=laxton0]
 156314 [host=laxton0]
 156273 [host=laxton0]
 156376 [host=laxton0]
 156328 [host=laxton1]
 156391 [host=laxton0]
 165735 [host=laxton0]
 163669 [host=laxton1]
 156340 [host=laxton1]
 156405 [host=laxton0]
 156357 [host=laxton0]
 156611 [host=laxton1]
 156509 [host=laxton0]
 156537 [host=laxton1]
 163728 [host=laxton1]
 163704 [host=laxton1]
 156549 [host=laxton0]
 156671 [host=laxton0]
 156702 [host=laxton1]
 156579 [host=laxton0]
 156731 [host=laxton0]
 156817 [host=laxton1]
 167066 [host=laxton1]
 163760 [host=laxton0]
 156800 [host=laxton1]
 156828 [host=laxton0]
 163773 [host=laxton1]
 156808 [host=laxton1]
 156870 [host=laxton1]
 156847 [host=laxton1]
 156892 [host=laxton1]
 163796 [host=laxton0]
 156915 [host=laxton1]
 156977 [host=laxton0]
 165803 [host=laxton0]
 163829 [host=laxton0]
 156938 [host=laxton0]
 157000 [host=laxton0]
 157022 [host=laxton1]
 156958 [host=laxton0]
 157106 [host=laxton0]
 157045 [host=laxton1]
 157125 [host=laxton1]
 163862 [host=laxton0]
 157067 [host=laxton1]
 157150 [host=laxton1]
 157084 [host=laxton0]
 157171 [host=laxton0]
 157251 [host=laxton0]
 165829 [host=laxton1]
 163893 [host=laxton1]
 157195 [host=laxton0]
 157274 [host=laxton0]
 157216 [host=laxton1]
 167382 [host=laxton1]
 165852 [host=laxton0]
 157339 [host=laxton1]
 167390 [host=laxton0]
 157235 [host=laxton1]
 167405 [host=laxton1]
 157369 [host=laxton0]
 163933 [host=laxton0]
 157481 [host=laxton1]
 157404 [host=laxton1]
 165871 [host=laxton0]
 157516 [host=laxton0]
 157453 [host=laxton1]
 165890 [host=laxton0]
 157624 [host=laxton0]
 157543 [host=laxton0]
 157661 [host=laxton0]
 163973 [host=laxton0]
 164017 [host=laxton1]
 163982 [host=laxton0]
 157715 [host=laxton0]
 163994 [host=laxton1]
 164004 [host=laxton0]
 157593 [host=laxton0]
 164032 [host=laxton0]
 165922 [host=laxton1]
 157735 [host=laxton0]
 157750 [host=laxton1]
 165931 [host=laxton1]
 164050 [host=laxton1]
 165944 [host=laxton0]
 157867 [host=laxton0]
 157844 [host=laxton0]
 157781 [host=laxton0]
 164063 [host=laxton0]
 164070 [host=laxton0]
 165955 [host=laxton0]
 164080 [host=laxton1]
 157885 [host=laxton1]
 164088 [host=laxton1]
 157904 [host=laxton1]
 164099 [host=laxton1]
 157933 [host=laxton0]
 164108 [host=laxton1]
 164118 [host=laxton1]
 157953 [host=laxton0]
 164124 [host=laxton0]
 157970 [host=laxton0]
 158023 [host=laxton0]
 164130 [host=laxton1]
 158065 [host=laxton1]
 164140 [host=laxton0]
 165968 [host=laxton0]
 164147 [host=laxton1]
 158083 [host=laxton0]
 158147 [host=laxton0]
 158099 [host=laxton1]
 164156 [host=laxton0]
 165985 [host=laxton0]
 164165 [host=laxton1]
 158188 [host=laxton0]
 158118 [host=laxton1]
 166764 [host=laxton1]
 158274 [host=laxton1]
 158238 [host=laxton1]
 158374 [host=laxton1]
 164175 [host=laxton0]
 164184 [host=laxton0]
 166024 [host=laxton1]
 158294 [host=laxton1]
 158397 [host=laxton0]
 164190 [host=laxton1]
 158415 [host=laxton0]
 164201 [host=laxton1]
 158431 [host=laxton0]
 158310 [host=laxton1]
 164223 [host=laxton0]
 158344 [host=laxton1]
 164236 [host=laxton1]
 158460 [host=laxton0]
 158469 [host=laxton1]
 158509 [host=laxton1]
 164249 [host=laxton1]
 158535 [host=laxton0]
 158485 [host=laxton1]
 158569 [host=laxton0]
 158551 [host=laxton0]
 158587 [host=laxton0]
 166040 [host=laxton0]
 158597 [host=laxton0]
 166050 [host=laxton0]
 158610 [host=laxton1]
 164268 [host=laxton1]
 166067 [host=laxton0]
 158623 [host=laxton1]
 164311 [host=laxton1]
 158700 [host=laxton1]
 158717 [host=laxton0]
 158761 [host=laxton0]
 158805 [host=laxton0]
 158842 [host=laxton0]
 158935 [host=laxton0]
 158878 [host=laxton0]
 166076 [host=laxton0]
 166082 [host=laxton1]
 166091 [host=laxton1]
 159031 [host=laxton0]
 158973 [host=laxton1]
 166103 [host=laxton1]
 164374 [host=laxton0]
 159152 [host=laxton1]
 164423 [host=laxton1]
 166112 [host=laxton1]
 166121 [host=laxton1]
 167130 [host=laxton0]
 166137 [host=laxton0]
 159239 [host=laxton0]
 159284 [host=laxton1]
 166143 [host=laxton0]
 159318 [host=laxton0]
 166148 [host=laxton0]
 159338 [host=laxton0]
 159401 [host=laxton0]
 159366 [host=laxton0]
 166153 [host=laxton0]
 159537 [host=laxton1]
 159437 [host=laxton1]
 166161 [host=laxton0]
 159454 [host=laxton0]
 166182 [host=laxton1]
 166191 [host=laxton0]
 159471 [host=laxton0]
 159570 [host=laxton0]
 159486 [host=laxton0]
 164498 [host=laxton1]
 164470 [host=laxton0]
 159613 [host=laxton1]
 159507 [host=laxton0]
 164514 [host=laxton1]
 159656 [host=laxton0]
 167423 [host=laxton1]
 159782 [host=laxton1]
 167473 [host=laxton1]
 164539 [host=laxton1]
 159693 [host=laxton0]
 159790 [host=laxton0]
 167481 [host=laxton1]
 159799 [host=laxton0]
 167488 [host=laxton1]
 159812 [host=laxton1]
 159723 [host=laxton1]
 159885 [host=laxton1]
 159903 [host=laxton0]
 159824 [host=laxton1]
 159928 [host=laxton1]
 159832 [host=laxton1]
 164603 [host=laxton0]
 166203 [host=laxton0]
 167178 [host=laxton0]
 159845 [host=laxton0]
 159969 [host=laxton0]
 159854 [host=laxton0]
 160053 [host=laxton0]
 159865 [host=laxton0]
 160071 [host=laxton0]
 160075 [host=laxton0]
 160085 [host=laxton1]
 160122 [host=laxton1]
 160093 [host=laxton1]
 166236 [host=laxton0]
 160107 [host=laxton0]
 160135 [host=laxton1]
 164641 [host=laxton0]
 166264 [host=laxton1]
 160151 [host=laxton0]
 160262 [host=laxton1]
 160164 [host=laxton0]
 160406 [host=laxton1]
 164677 [host=laxton0]
 166305 [host=laxton1]
 160350 [host=laxton1]
 160434 [host=laxton0]
 164688 [host=laxton0]
 160379 [host=laxton1]
 160464 [host=laxton0]
 160546 [host=laxton1]
 160490 [host=laxton0]
 160576 [host=laxton0]
 160519 [host=laxton0]
 160634 [host=laxton1]
 160740 [host=laxton0]
 164745 [host=laxton1]
 160661 [host=laxton0]
 166340 [host=laxton0]
 160690 [host=laxton1]
 160761 [host=laxton1]
 160783 [host=laxton1]
 164789 [host=laxton0]
 167325 [host=laxton0]
 164803 [host=laxton1]
 160890 [host=laxton0]
 160813 [host=laxton1]
 164852 [host=laxton0]
 164822 [host=laxton1]
 164870 [host=laxton0]
 160845 [host=laxton1]
 160937 [host=laxton0]
 164880 [host=laxton1]
 161037 [host=laxton0]
 161119 [host=laxton1]
 166374 [host=laxton0]
 164895 [host=laxton1]
 161157 [host=laxton0]
 161078 [host=laxton0]
 161192 [host=laxton0]
 161251 [host=laxton1]
 161223 [host=laxton1]
 164935 [host=laxton1]
 161311 [host=laxton0]
 164947 [host=laxton1]
 161345 [host=laxton0]
 164953 [host=laxton1]
 161369 [host=laxton1]
 161282 [host=laxton1]
 164964 [host=laxton1]
 161459 [host=laxton1]
 161398 [host=laxton1]
 161475 [host=laxton1]
 164978 [host=laxton1]
 164990 [host=laxton0]
 161496 [host=laxton1]
 161423 [host=laxton0]
 161516 [host=laxton1]
 161443 [host=laxton0]
 165005 [host=laxton0]
 161596 [host=laxton1]
 161542 [host=laxton1]
 161615 [host=laxton1]
 165028 [host=laxton0]
 161698 [host=laxton0]
 161570 [host=laxton0]
 161783 [host=laxton0]
 161804 [host=laxton0]
 161827 [host=laxton0]
 161889 [host=laxton0]
 161848 [host=laxton1]
 161871 [host=laxton1]
 161913 [host=laxton1]
 161956 [host=laxton0]
 161927 [host=laxton1]
 161944 [host=laxton0]
 161966 [host=laxton1]
 165104 [host=laxton0]
 161975 [host=laxton0]
 161988 [host=laxton1]
 162110 [host=laxton0]
 162076 [host=laxton1]
 162120 [host=laxton1]
 162128 [host=laxton1]
 162138 [host=laxton0]
 162100 [host=laxton0]
 167444 [host=laxton0]
 165126 [host=laxton1]
 162147 [host=laxton1]
 165137 [host=laxton1]
 167457 [host=laxton1]
 165148 [host=laxton1]
 162159 [host=laxton1]
 162191 [host=laxton1]
 162254 [host=laxton1]
 162263 [host=laxton0]
 162243 [host=laxton1]
 162272 [host=laxton1]
 162332 [host=laxton0]
 165162 [host=laxton0]
 162295 [host=laxton1]
 162345 [host=laxton1]
 162360 [host=laxton0]
 162390 [host=laxton1]
 165177 [host=laxton0]
 162427 [host=laxton1]
 165189 [host=laxton0]
 165201 [host=laxton0]
 166956 [host=laxton1]
 162481 [host=laxton1]
 165228 [host=laxton1]
 165214 [host=laxton0]
 162535 [host=laxton1]
 162563 [host=laxton1]
 162632 [host=laxton1]
 162598 [host=laxton1]
 162681 [host=laxton0]
 167511 [host=laxton0]
 162760 [host=laxton0]
 167525 [host=laxton1]
 167533 [host=laxton1]
 167582 [host=laxton0]
 167538 [host=laxton1]
 167542 [host=laxton0]
 167607 [host=laxton0]
 167546 [host=laxton1]
 167589 [host=laxton0]
 167551 [host=laxton0]
 167594 [host=laxton1]
 167556 [host=laxton0]
 167600 [host=laxton1]
 167568 [host=laxton0]
 167617 [host=laxton0]
 167574 [host=laxton0]
 167657 [host=laxton0]
 167625 [host=laxton0]
 167669 [host=laxton0]
 167637 [host=laxton1]
 167682 [host=laxton1]
 167645 [host=laxton1]
 167694 [host=laxton0]
 167650 [host=laxton1]
 167703 [host=laxton1]
 167710 [host=laxton1]
 167732 [host=laxton0]
 167721 [host=laxton1]
 167744 [host=laxton0]
 167804 [host=laxton1]
 167756 [host=laxton0]
 167809 [host=laxton1]
 167846 [host=laxton1]
 167779 [host=laxton0]
 167791 [host=laxton0]
 167911 [host=laxton1]
 167930 [host=laxton0]
 167797 [host=laxton0]
 167952 [host=laxton1]
 167962 [host=laxton1]
 167942 [host=laxton1]
 167971 [host=laxton0]
 168021 [host=laxton1]
 167982 [host=laxton0]
 168031 [host=laxton1]
 167992 [host=laxton0]
 168040 [host=laxton0]
 168053 [host=laxton0]
 168006 [host=laxton0]
 168067 [host=laxton1]
 168076 [host=laxton0]
 168082 [host=laxton1]
 168171 [host=laxton1]
 168176 [host=laxton1]
 168117 [host=laxton1]
 168184 [host=laxton1]
 168125 [host=laxton1]
 168191 [host=laxton1]
 168202 [host=laxton1]
 168146 [host=laxton1]
 168212 [host=laxton1]
 168225 [host=laxton1]
 168159 [host=laxton1]
 168237 [host=laxton1]
 168321 [host=laxton1]
 168242 [host=laxton1]
 168354 [host=laxton1]
 168251 [host=laxton1]
 168393 [host=laxton1]
 168264 [host=laxton1]
 168413 [host=laxton1]
 168432 [host=laxton1]
 168473 [host=laxton1]
 168452 [host=laxton1]
 168549 [host=laxton1]
 168492 [host=laxton1]
 168577 [host=laxton1]
 168500 [host=laxton1]
 168608 [host=laxton1]
 168511 [host=laxton1]
 168630 [host=laxton1]
 168522 [host=laxton1]
 168649 [host=laxton1]
 168671 [host=laxton1]
 168699 [host=laxton1]
 168769 [host=laxton1]
 168719 [host=laxton1]
 168796 [host=laxton1]
 168740 [host=laxton1]
 168818 [host=laxton1]
 168969 [host=laxton1]
 168836 [host=laxton1]
 169009 [host=laxton1]
 169126 [host=laxton1]
 169058 [host=laxton1]
 169139 [host=laxton1]
 169154 [host=laxton1]
 169098 [host=laxton1]
 169171 [host=laxton1]
 169270 [host=laxton1]
 169192 [host=laxton1]
 169296 [host=laxton1]
 169207 [host=laxton1]
 169322 [host=laxton1]
 169224 [host=laxton1]
 169351 [host=laxton1]
 169254 [host=laxton1]
 169386 [host=laxton1]
 169502 [host=laxton1]
 169415 [host=laxton1]
 169531 [host=laxton1]
 169447 [host=laxton1]
 169555 [host=laxton1]
 169477 [host=laxton1]
 169581 [host=laxton1]
 169611 [host=laxton1]
 169640 [host=laxton1]
 169669 [host=laxton1]
 169768 [host=laxton1]
 169699 [host=laxton1]
 169805 [host=laxton1]
 169727 [host=laxton1]
 169932 [host=laxton1]
 169850 [host=laxton1]
 169980 [host=laxton1]
 169897 [host=laxton1]
 170078 [host=laxton1]
 170138 [host=laxton1]
 170020 [host=laxton1]
 170231 [host=laxton1]
 170168 [host=laxton1]
 170261 [host=laxton1]
 170287 [host=laxton1]
 170201 [host=laxton1]
 170317 [host=laxton1]
 170346 [host=laxton1]
 170379 [host=laxton1]
 170437 [host=laxton1]
 170408 [host=laxton1]
 170470 [host=laxton1]
 170500 [host=laxton1]
 170527 [host=laxton1]
 170589 [host=laxton1]
 170560 [host=laxton1]
 170624 [host=laxton1]
 170744 [host=laxton1]
 170660 [host=laxton1]
 170752 [host=laxton1]
 170690 [host=laxton1]
 170760 [host=laxton1]
 170715 [host=laxton1]
 170768 [host=laxton1]
 170722 [host=laxton1]
 170774 [host=laxton1]
 170784 [host=laxton1]
 170803 [host=laxton1]
 170793 [host=laxton1]
 170881 [host=rochester1]
 170814 []
 170892 [host=laxton1]
 170825 [host=laxton1]
 170911 fail irrelevant
 170835 [host=laxton1]
 170990 fail irrelevant
 170842 [host=laxton1]
 171143 fail irrelevant
 170857 [host=laxton1]
 171230 fail irrelevant
 171153 fail irrelevant
 171266 [host=rochester1]
 171159 [host=rochester1]
 171279 fail irrelevant
 171285 [host=laxton1]
 171175 [host=rochester1]
 171297 [host=laxton1]
 171189 [host=rochester1]
 171306 [host=rochester1]
 171323 [host=laxton1]
 171338 [host=rochester1]
 171351 [host=laxton1]
 171366 [host=laxton1]
 171358 [host=laxton1]
 171379 [host=rochester1]
 171436 fail irrelevant
 171396 [host=rochester1]
 171451 [host=laxton1]
 171419 [host=laxton1]
 171467 [host=laxton1]
 171479 [host=laxton1]
 171497 fail irrelevant
 171520 fail irrelevant
 171589 [host=rochester1]
 171541 fail irrelevant
 171555 fail irrelevant
 171565 [host=rochester1]
 171611 [host=rochester1]
 171573 fail irrelevant
 171625 [host=rochester1]
 171579 [host=laxton1]
 171638 fail irrelevant
 171649 [host=laxton1]
 171658 [host=laxton1]
 171751 [host=rochester1]
 171667 [host=laxton1]
 171680 [host=rochester1]
 171700 fail irrelevant
 171752 [host=rochester1]
 171754 [host=rochester1]
 171713 [host=rochester1]
 171755 [host=rochester1]
 171775 [host=rochester1]
 171757 [host=rochester1]
 171761 [host=rochester1]
 171762 [host=rochester1]
 171804 pass a4d97f0c199e980bb55d3b659214308c1b371b73 27acf0ef828bf719b2053ba398b195829413dbdd bdafda8c457eb90c65f37026589b54258300f05c ea6d3cd1ed79d824e605a70c3626bc437c386260 88ab0c15525ced2eefe39220742efe4769089ad8 3fdc211b01b29f252166937238efe02d15cb5780
 171763 [host=rochester1]
 171805 fail 510540961417288a24d0870f0226f8255420c463 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae 5a3641bfcdcf99fd76817833488f2af8abb69383 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 fcd27b3c759995775afb66be6bb7ba1e85da0506
 171767 [host=rochester1]
 171768 [host=rochester1]
 171808 pass a4d97f0c199e980bb55d3b659214308c1b371b73 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae dab96cf02e3be378310dd1bce119b0fac6fac958 ea6d3cd1ed79d824e605a70c3626bc437c386260 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 0faf37e7434ea08ed99d804aad98fcddf74852e7
 171769 [host=rochester1]
 171758 [host=rochester1]
 171770 [host=rochester1]
 171810 pass a4d97f0c199e980bb55d3b659214308c1b371b73 da30b01ffaf702db082cd01ba594dd4fb4143e58 5801910013757bd626f67ed77eea6c16a176eebf ea6d3cd1ed79d824e605a70c3626bc437c386260 6a62e0cb0dfe9cd28b70547dbea5caf76847c3a9 d05c67efd94f301b48bc486246161b05acaa8df2
 171811 pass a4d97f0c199e980bb55d3b659214308c1b371b73 d21009b1c9f94b740ea66be8e48a1d8ad8124023 46b4606ba23498d3d0e66b53e498eb3d5d592586 ea6d3cd1ed79d824e605a70c3626bc437c386260 64f37cc530f144e53c190c9e8209a51b58fd5c43 1c3ed9c908732d19660fbe83580674d585464d4c
 171773 [host=rochester1]
 171812 pass a4d97f0c199e980bb55d3b659214308c1b371b73 6119e6e19a050df847418de7babe5166779955e4 3f90ac3ec03512e2374cd2968c047a7e856a8965 ea6d3cd1ed79d824e605a70c3626bc437c386260 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 119c98972c4e737508df827bbbc8453cc93292c7
 171779 [host=rochester1]
 171814 pass a4d97f0c199e980bb55d3b659214308c1b371b73 320f92c36a80bfafc5d57834592a7be5fd79f104 558d83ab1a5179e146a56dd5f3cb16e1ca44ff46 ea6d3cd1ed79d824e605a70c3626bc437c386260 7292e4a0a8f58333ccbd2d0d47242f9865083c9c cbfa62bb140c8f10a0ae96db3ce06e22b3b9d302
 171782 [host=rochester1]
 171784 [host=rochester1]
 171815 pass a4d97f0c199e980bb55d3b659214308c1b371b73 da30b01ffaf702db082cd01ba594dd4fb4143e58 9ec2cc1f3138ef9314314df29fc6ce0aa5e120b9 ea6d3cd1ed79d824e605a70c3626bc437c386260 6a62e0cb0dfe9cd28b70547dbea5caf76847c3a9 f1e268b9fd13647e1f69c8ce0ae7be401d319fc8
 171816 pass a4d97f0c199e980bb55d3b659214308c1b371b73 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae 88f3d734f5a066491d6da3cddcacc6cd7f07d184 ea6d3cd1ed79d824e605a70c3626bc437c386260 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 e270af94280e6a9610705ebc1fdd1d7a9b1f8a98
 171785 [host=rochester1]
 171818 pass a4d97f0c199e980bb55d3b659214308c1b371b73 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae df1c7e91b46db364ba1ce5e21660987c29c35334 ea6d3cd1ed79d824e605a70c3626bc437c386260 dc88f9b72df52b22c35b127b80c487e0b6fca4af 49dd52fb1311dadab29f6634d0bc1f4c022c357a
 171787 [host=rochester1]
 171791 [host=rochester1]
 171820 pass a4d97f0c199e980bb55d3b659214308c1b371b73 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae b600f253b3077943908431cd780dbc1a9ed1bc81 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 dc88f9b72df52b22c35b127b80c487e0b6fca4af 0544c4ee4b48f7e2715e69ff3e73c3d5545b0526
 171793 [host=rochester1]
 171821 pass a4d97f0c199e980bb55d3b659214308c1b371b73 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae 12dd064a1804536518eb12229836fa572c232502 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 ee3810899181170d21ab2c4e1aeba8dcdcd6f2b6
 171801 [host=rochester1]
 171822 pass a4d97f0c199e980bb55d3b659214308c1b371b73 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae fc4a132c0e9d108d30115cb8729f8fcd5564b855 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 4f67f1cbb66e96769557863e1734fa465b73b6db
 171802 [host=rochester1]
 171795 fail 510540961417288a24d0870f0226f8255420c463 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae 5a3641bfcdcf99fd76817833488f2af8abb69383 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 fcd27b3c759995775afb66be6bb7ba1e85da0506
 171825 pass a4d97f0c199e980bb55d3b659214308c1b371b73 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae 24eac4caf31afae48349af44588a52783c1819b8 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 c16a9eda77b2089206d5bc39ab6488c3793e11bf
 171826 pass a4d97f0c199e980bb55d3b659214308c1b371b73 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae 48249243777882d7d89ca0b86c89e355b5f941f3 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 d2cc5633e2800e698c6a64554de7fa19d9627a24
 171803 [host=rochester1]
 171827 pass a4d97f0c199e980bb55d3b659214308c1b371b73 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae 7ef91af84c04b1e5a17631bd1811c9bc1945dfdc b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 aa45ffc115e6e2b31baff81a5294c5ac7b8c6b9d
 171829 pass a4d97f0c199e980bb55d3b659214308c1b371b73 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae 343f37b5c07fd261b0fe8f3236459c9071be38b7 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 fcd27b3c759995775afb66be6bb7ba1e85da0506
 171828 fail 510540961417288a24d0870f0226f8255420c463 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae 6964b5c48c69e4961bad2dd9d6c02918f23c3be0 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 fcd27b3c759995775afb66be6bb7ba1e85da0506
 171833 fail 510540961417288a24d0870f0226f8255420c463 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae 343f37b5c07fd261b0fe8f3236459c9071be38b7 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 fcd27b3c759995775afb66be6bb7ba1e85da0506
 171835 pass a4d97f0c199e980bb55d3b659214308c1b371b73 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae 343f37b5c07fd261b0fe8f3236459c9071be38b7 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 fcd27b3c759995775afb66be6bb7ba1e85da0506
 171836 fail 510540961417288a24d0870f0226f8255420c463 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae 343f37b5c07fd261b0fe8f3236459c9071be38b7 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 fcd27b3c759995775afb66be6bb7ba1e85da0506
 171837 pass a4d97f0c199e980bb55d3b659214308c1b371b73 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae 343f37b5c07fd261b0fe8f3236459c9071be38b7 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 fcd27b3c759995775afb66be6bb7ba1e85da0506
 171838 fail 510540961417288a24d0870f0226f8255420c463 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae 343f37b5c07fd261b0fe8f3236459c9071be38b7 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 fcd27b3c759995775afb66be6bb7ba1e85da0506
Searching for interesting versions
 Result found: flight 151754 (pass), for basis pass
 For basis failure, parent search stopping at a4d97f0c199e980bb55d3b659214308c1b371b73 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae 343f37b5c07fd261b0fe8f3236459c9071be38b7 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 fcd27b3c759995775afb66be6bb7ba1e85da0506, results HASH(0x55a037880cd8) HASH(0x55a03784a9e8) HASH(0x55a03788c850) For basis failure, parent search stopping at a4d97f0c199e980bb55d3b659214308c1b371b73 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae 7ef91af84\
 c04b1e5a17631bd1811c9bc1945dfdc b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 aa45ffc115e6e2b31baff81a5294c5ac7b8c6b9d, results HASH(0x55a03787ccc8) For basis failure, parent search stopping at a4d97f0c199e980bb55d3b659214308c1b371b73 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae 48249243777882d7d89ca0b86c89e355b5f941f3 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 d2cc5633e2800e698c6a64554de7fa19d9627a24, results HASH(0x55a03787\
 8690) For basis failure, parent search stopping at a4d97f0c199e980bb55d3b659214308c1b371b73 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae 24eac4caf31afae48349af44588a52783c1819b8 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 c16a9eda77b2089206d5bc39ab6488c3793e11bf, results HASH(0x55a037875460) For basis failure, parent search stopping at a4d97f0c199e980bb55d3b659214308c1b371b73 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae fc4a132c0e9d108d30115cb8729f8fcd5564b855 b7464\
 58e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 4f67f1cbb66e96769557863e1734fa465b73b6db, results HASH(0x55a03786d418) For basis failure, parent search stopping at a4d97f0c199e980bb55d3b659214308c1b371b73 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae 12dd064a1804536518eb12229836fa572c232502 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 ee3810899181170d21ab2c4e1aeba8dcdcd6f2b6, results HASH(0x55a037866ad8) For basis failure, parent searc\
 h stopping at a4d97f0c199e980bb55d3b659214308c1b371b73 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae b600f253b3077943908431cd780dbc1a9ed1bc81 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 dc88f9b72df52b22c35b127b80c487e0b6fca4af 0544c4ee4b48f7e2715e69ff3e73c3d5545b0526, results HASH(0x55a037840c98) For basis failure, parent search stopping at a4d97f0c199e980bb55d3b659214308c1b371b73 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae df1c7e91b46db364ba1ce5e21660987c29c35334 ea6d3cd1ed79d824e605a70c3626bc437c386260 d\
 c88f9b72df52b22c35b127b80c487e0b6fca4af 49dd52fb1311dadab29f6634d0bc1f4c022c357a, results HASH(0x55a037831710) Result found: flight 171795 (fail), for basis failure (at ancestor ~589)
 Repro found: flight 171804 (pass), for basis pass
 Repro found: flight 171828 (fail), for basis failure
 0 revisions at a4d97f0c199e980bb55d3b659214308c1b371b73 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae 343f37b5c07fd261b0fe8f3236459c9071be38b7 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 46de2eec93bffa0706e6229c0da2919763c8eb04 fcd27b3c759995775afb66be6bb7ba1e85da0506
No revisions left to test, checking graph state.
 Result found: flight 171829 (pass), for last pass
 Result found: flight 171833 (fail), for first failure
 Repro found: flight 171835 (pass), for last pass
 Repro found: flight 171836 (fail), for first failure
 Repro found: flight 171837 (pass), for last pass
 Repro found: flight 171838 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt git://libvirt.org/libvirt.git
  Bug introduced:  510540961417288a24d0870f0226f8255420c463
  Bug not present: a4d97f0c199e980bb55d3b659214308c1b371b73
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/171838/


  (Revision log too long, omitted.)

neato: graph is too large for cairo-renderer bitmaps. Scaling by 0.106438 to fit
pnmtopng: 10 colors found
Revision graph left in /home/logs/results/bisect/libvirt/build-arm64-libvirt.libvirt-build.{dot,ps,png,html,svg}.
----------------------------------------
171838: tolerable ALL FAIL

flight 171838 libvirt real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/171838/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-arm64-libvirt           6 libvirt-build           fail baseline untested


jobs:
 build-arm64-libvirt                                          fail    


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


