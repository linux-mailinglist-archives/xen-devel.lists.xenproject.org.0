Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85564190559
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 06:55:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGcTd-0003ns-Vh; Tue, 24 Mar 2020 05:51:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=H+Hk=5J=mail.xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1jGcTc-0003mz-44
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 05:51:48 +0000
X-Inumbo-ID: 8c8f36c0-6d93-11ea-8381-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8c8f36c0-6d93-11ea-8381-12813bfff9fa;
 Tue, 24 Mar 2020 05:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To:Sender:
 Reply-To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T1fa2PgiiynCdgtMZsOdHfS5kq7u35+c4mkpoQfKV9s=; b=p87X6HjgYMSsO/+Sz8IAm9KZcg
 CJlj/cK9hiLPx7NltVhYSHNoamWwBFufxbUYPOKeSehaO9FmwEKPMOYsFDnH8cQLO96moV3+J3od4
 84BWVigTf74Ndmv8h7a7gRbVlSXWa3zTGx9pLH/TTbMIko0ldVZ3pvOYbcJiZaKM5NvU=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@mail.xenproject.org>)
 id 1jGcTb-0004Y8-61; Tue, 24 Mar 2020 05:51:47 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jGcTa-0004Dc-TX; Tue, 24 Mar 2020 05:51:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jGcTa-0003Q1-St; Tue, 24 Mar 2020 05:51:46 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-Id: <E1jGcTa-0003Q1-St@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 24 Mar 2020 05:51:46 +0000
Subject: [Xen-devel] [libvirt bisection] complete build-arm64-libvirt
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

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
  Bug introduced:  4d5f50d86b760864240c695adc341379fb47a796
  Bug not present: a1a18c6ab55869d3b00cf8c32e0e2262a10c8ce7
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/148958/


  commit 4d5f50d86b760864240c695adc341379fb47a796
  Author: Pavel Hrdina <phrdina@redhat.com>
  Date:   Wed Jan 8 22:54:31 2020 +0100
  
      bootstrap.conf: stop creating AUTHORS file
      
      The existence of AUTHORS file is required for GNU projects but since
      commit <8bfb36db40f38e92823b657b5a342652064b5adc> we do not require
      these files to exist.
      
      Signed-off-by: Pavel Hrdina <phrdina@redhat.com>
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/libvirt/build-arm64-libvirt.libvirt-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/libvirt/build-arm64-libvirt.libvirt-build --summary-out=tmp/148958.bisection-summary --basis-template=146182 --blessings=real,real-bisect libvirt build-arm64-libvirt libvirt-build
Searching for failure / basis pass:
 148887 fail [host=rochester0] / 146182 [host=laxton0] 146156 ok.
Failure / basis pass flights: 148887 / 146156
(tree in basispass but not in latest: libvirt_gnulib)
Tree: libvirt git://libvirt.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest ea903036fa8d2333edb74b617416416dd75be533 317d3eeb963a515e15a63fa356d8ebcda7041a51 0c8ea9fe1adbbee230ee0c68f28b68ca2b0534bc 933ebad2470a169504799a1d95b8e410bd9847ef 066a9956097b54530888b88ab9aa1ea02e42af5a d094e95fb7c61c5f46d8e446b4bdc028438dea1c
Basis pass 0f814c0fed420209ccb881325b854beaa7c70fcf 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb 933ebad2470a169504799a1d95b8e410bd9847ef 2f4d068645c211e309812372cd0ac58c9024e93b 03bfe526ecadc86f31eda433b91dc90be0563919
Generating revisions with ./adhoc-revtuple-generator  git://libvirt.org/libvirt.git#0f814c0fed420209ccb881325b854beaa7c70fcf-ea903036fa8d2333edb74b617416416dd75be533 https://gitlab.com/keycodemap/keycodemapdb.git#317d3eeb963a515e15a63fa356d8ebcda7041a51-317d3eeb963a515e15a63fa356d8ebcda7041a51 git://xenbits.xen.org/osstest/ovmf.git#70911f1f4aee0366b6122f2b90d367ec0f066beb-0c8ea9fe1adbbee230ee0c68f28b68ca2b0534bc git://xenbits.xen.org/qemu-xen.git#933ebad2470a169504799a1d95b8e410bd9847ef-933ebad2\
 470a169504799a1d95b8e410bd9847ef git://xenbits.xen.org/osstest/seabios.git#2f4d068645c211e309812372cd0ac58c9024e93b-066a9956097b54530888b88ab9aa1ea02e42af5a git://xenbits.xen.org/xen.git#03bfe526ecadc86f31eda433b91dc90be0563919-d094e95fb7c61c5f46d8e446b4bdc028438dea1c
Auto packing the repository in background for optimum performance.
See "git help gc" for manual housekeeping.
error: The last gc run reported the following. Please correct the root cause
and remove gc.log.
Automatic cleanup will not be performed until the file is removed.

warning: There are too many unreachable loose objects; run 'git prune' to remove them.

Auto packing the repository in background for optimum performance.
See "git help gc" for manual housekeeping.
error: The last gc run reported the following. Please correct the root cause
and remove gc.log.
Automatic cleanup will not be performed until the file is removed.

warning: There are too many unreachable loose objects; run 'git prune' to remove them.

Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Loaded 8271 nodes in revision graph
Searching for test results:
 146182 [host=laxton0]
 146156 pass 0f814c0fed420209ccb881325b854beaa7c70fcf 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb 933ebad2470a169504799a1d95b8e410bd9847ef 2f4d068645c211e309812372cd0ac58c9024e93b 03bfe526ecadc86f31eda433b91dc90be0563919
 146240 [host=rochester1]
 146211 [host=rochester1]
 146298 [host=rochester1]
 146314 [host=rochester1]
 146293 [host=rochester1]
 146303 [host=rochester1]
 146305 [host=rochester1]
 146301 [host=rochester1]
 146299 [host=rochester1]
 146304 [host=rochester1]
 146311 [host=rochester1]
 146309 [host=rochester1]
 146310 [host=rochester1]
 146312 [host=rochester1]
 146313 [host=rochester1]
 146316 [host=rochester1]
 146318 [host=rochester1]
 146344 fail irrelevant
 146320 [host=rochester1]
 146325 [host=rochester1]
 146327 [host=rochester1]
 146329 [host=rochester1]
 146332 [host=rochester1]
 146374 fail irrelevant
 146410 fail irrelevant
 146455 fail irrelevant
 146509 [host=rochester1]
 146489 [host=rochester1]
 146528 fail irrelevant
 146546 [host=rochester1]
 146565 [host=rochester1]
 146586 [host=rochester1]
 146616 fail irrelevant
 146636 [host=rochester1]
 146660 [host=rochester1]
 146689 fail irrelevant
 146737 fail irrelevant
 146756 fail irrelevant
 146714 fail irrelevant
 146775 fail irrelevant
 146799 fail irrelevant
 146843 fail irrelevant
 146921 fail irrelevant
 146995 [host=rochester1]
 147040 [host=rochester1]
 147084 [host=rochester1]
 147141 [host=rochester1]
 147195 [host=rochester1]
 147265 [host=rochester1]
 147340 [host=rochester1]
 147419 fail irrelevant
 147477 [host=rochester1]
 147520 fail irrelevant
 147583 fail irrelevant
 147649 [host=rochester1]
 147703 fail irrelevant
 147784 fail irrelevant
 147736 fail irrelevant
 147885 fail irrelevant
 147831 fail irrelevant
 147981 fail irrelevant
 148068 fail irrelevant
 148144 fail irrelevant
 148196 [host=rochester1]
 148269 [host=rochester1]
 148331 fail irrelevant
 148406 fail irrelevant
 148459 [host=rochester1]
 148503 [host=rochester1]
 148547 !! flight 148547 missing revision for libvirt_keycodemapdb
 148615 fail c43969e1646b39bf4dc07b585de7e2720b83519f 317d3eeb963a515e15a63fa356d8ebcda7041a51 799d88c1bae7978da23727df94b16f37bd1521f4 933ebad2470a169504799a1d95b8e410bd9847ef 24d3938ca96a6420ec1a5f1f8479f90f2e9fdd56 d094e95fb7c61c5f46d8e446b4bdc028438dea1c
 148583 fail c43969e1646b39bf4dc07b585de7e2720b83519f 317d3eeb963a515e15a63fa356d8ebcda7041a51 799d88c1bae7978da23727df94b16f37bd1521f4 933ebad2470a169504799a1d95b8e410bd9847ef 24d3938ca96a6420ec1a5f1f8479f90f2e9fdd56 d094e95fb7c61c5f46d8e446b4bdc028438dea1c
 148651 [host=rochester1]
 148688 fail irrelevant
 148729 fail c9bd08ee352373ed121c10f0adf11a4a0a29c857 317d3eeb963a515e15a63fa356d8ebcda7041a51 01ce872739d2f0cd3a8917be2180381db5f0391e 933ebad2470a169504799a1d95b8e410bd9847ef 066a9956097b54530888b88ab9aa1ea02e42af5a d094e95fb7c61c5f46d8e446b4bdc028438dea1c
 148775 fail irrelevant
 148799 [host=rochester1]
 148830 fail ea903036fa8d2333edb74b617416416dd75be533 317d3eeb963a515e15a63fa356d8ebcda7041a51 0c8ea9fe1adbbee230ee0c68f28b68ca2b0534bc 933ebad2470a169504799a1d95b8e410bd9847ef 066a9956097b54530888b88ab9aa1ea02e42af5a d094e95fb7c61c5f46d8e446b4bdc028438dea1c
 148887 fail ea903036fa8d2333edb74b617416416dd75be533 317d3eeb963a515e15a63fa356d8ebcda7041a51 0c8ea9fe1adbbee230ee0c68f28b68ca2b0534bc 933ebad2470a169504799a1d95b8e410bd9847ef 066a9956097b54530888b88ab9aa1ea02e42af5a d094e95fb7c61c5f46d8e446b4bdc028438dea1c
 148940 pass a1cd25b919509be2645dbe6f952d5263e0d4e4e5 317d3eeb963a515e15a63fa356d8ebcda7041a51 710ff7490ad897383eb35d1becadabd21a733f24 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 97f10daf5f4bac91db732ef45c562839686f2c04
 148941 fail 2feaa925bba06e77be918bcbfab63bc8201c8f19 317d3eeb963a515e15a63fa356d8ebcda7041a51 4e2ac8062cbe907be9fbf6b2e6f1fc947690c4de 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 1eeedaf5a0d9ed6324f3bd5b700bb22eb4355341
 148943 pass a7f3b901aacadef269bf335c1714b45e444e78e8 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5235562444021e9c5aff08f45daa6b5b7952c7a 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 97f10daf5f4bac91db732ef45c562839686f2c04
 148944 fail d0236e2a554f2321512276b897e8a8a44f68e969 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5235562444021e9c5aff08f45daa6b5b7952c7a 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 97f10daf5f4bac91db732ef45c562839686f2c04
 148947 pass 6b4140dafb6b3db9ead2e260757f1c3583936f19 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5235562444021e9c5aff08f45daa6b5b7952c7a 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 97f10daf5f4bac91db732ef45c562839686f2c04
 148915 pass 0f814c0fed420209ccb881325b854beaa7c70fcf 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb 933ebad2470a169504799a1d95b8e410bd9847ef 2f4d068645c211e309812372cd0ac58c9024e93b 03bfe526ecadc86f31eda433b91dc90be0563919
 148948 pass a1a18c6ab55869d3b00cf8c32e0e2262a10c8ce7 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5235562444021e9c5aff08f45daa6b5b7952c7a 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 97f10daf5f4bac91db732ef45c562839686f2c04
 148929 fail ea903036fa8d2333edb74b617416416dd75be533 317d3eeb963a515e15a63fa356d8ebcda7041a51 0c8ea9fe1adbbee230ee0c68f28b68ca2b0534bc 933ebad2470a169504799a1d95b8e410bd9847ef 066a9956097b54530888b88ab9aa1ea02e42af5a d094e95fb7c61c5f46d8e446b4bdc028438dea1c
 148950 fail 4d5f50d86b760864240c695adc341379fb47a796 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5235562444021e9c5aff08f45daa6b5b7952c7a 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 97f10daf5f4bac91db732ef45c562839686f2c04
 148931 fail 0d0d60ddc5e58359cff5be8dfd6dd27e98da0282 317d3eeb963a515e15a63fa356d8ebcda7041a51 788421d5a766a4ce216e99e2277bb11c54e7d0f6 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 3dd724dff085e13ad520f8e35aea717db2ff07d0
 148934 fail 27a6edf50f121ad663ad31dbc2ebf9936fa8ead5 317d3eeb963a515e15a63fa356d8ebcda7041a51 c8b8157e126ae2fb6f65842677251d300ceff104 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 9b71d6a759a6835c7723afa3d79e1e7f10da4396
 148936 fail 153fd683681be13f380378acfc531cc3df206fd1 317d3eeb963a515e15a63fa356d8ebcda7041a51 9a1f14ad721bbcd833ec5108944c44a502392f03 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 9f27372677a68206d511de88ede22c53369a4ff7
 148951 pass a1a18c6ab55869d3b00cf8c32e0e2262a10c8ce7 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5235562444021e9c5aff08f45daa6b5b7952c7a 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 97f10daf5f4bac91db732ef45c562839686f2c04
 148955 fail 4d5f50d86b760864240c695adc341379fb47a796 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5235562444021e9c5aff08f45daa6b5b7952c7a 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 97f10daf5f4bac91db732ef45c562839686f2c04
 148956 pass a1a18c6ab55869d3b00cf8c32e0e2262a10c8ce7 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5235562444021e9c5aff08f45daa6b5b7952c7a 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 97f10daf5f4bac91db732ef45c562839686f2c04
 148958 fail 4d5f50d86b760864240c695adc341379fb47a796 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5235562444021e9c5aff08f45daa6b5b7952c7a 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 97f10daf5f4bac91db732ef45c562839686f2c04
Searching for interesting versions
 Result found: flight 146156 (pass), for basis pass
 Result found: flight 148830 (fail), for basis failure
 Repro found: flight 148915 (pass), for basis pass
 Repro found: flight 148929 (fail), for basis failure
 0 revisions at a1a18c6ab55869d3b00cf8c32e0e2262a10c8ce7 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5235562444021e9c5aff08f45daa6b5b7952c7a 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 97f10daf5f4bac91db732ef45c562839686f2c04
No revisions left to test, checking graph state.
 Result found: flight 148948 (pass), for last pass
 Result found: flight 148950 (fail), for first failure
 Repro found: flight 148951 (pass), for last pass
 Repro found: flight 148955 (fail), for first failure
 Repro found: flight 148956 (pass), for last pass
 Repro found: flight 148958 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt git://libvirt.org/libvirt.git
  Bug introduced:  4d5f50d86b760864240c695adc341379fb47a796
  Bug not present: a1a18c6ab55869d3b00cf8c32e0e2262a10c8ce7
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/148958/

Auto packing the repository in background for optimum performance.
See "git help gc" for manual housekeeping.
error: The last gc run reported the following. Please correct the root cause
and remove gc.log.
Automatic cleanup will not be performed until the file is removed.

warning: There are too many unreachable loose objects; run 'git prune' to remove them.


  commit 4d5f50d86b760864240c695adc341379fb47a796
  Author: Pavel Hrdina <phrdina@redhat.com>
  Date:   Wed Jan 8 22:54:31 2020 +0100
  
      bootstrap.conf: stop creating AUTHORS file
      
      The existence of AUTHORS file is required for GNU projects but since
      commit <8bfb36db40f38e92823b657b5a342652064b5adc> we do not require
      these files to exist.
      
      Signed-off-by: Pavel Hrdina <phrdina@redhat.com>
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

dot: graph is too large for cairo-renderer bitmaps. Scaling by 0.379055 to fit
pnmtopng: 32 colors found
Revision graph left in /home/logs/results/bisect/libvirt/build-arm64-libvirt.libvirt-build.{dot,ps,png,html,svg}.
----------------------------------------
148958: tolerable ALL FAIL

flight 148958 libvirt real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/148958/

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


