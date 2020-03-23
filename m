Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB05618F60A
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 14:44:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGNKe-0001oK-M8; Mon, 23 Mar 2020 13:41:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zrun=5I=mail.xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1jGNKd-0001oD-By
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 13:41:31 +0000
X-Inumbo-ID: ffb10846-6d0b-11ea-82d5-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ffb10846-6d0b-11ea-82d5-12813bfff9fa;
 Mon, 23 Mar 2020 13:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To:Sender:
 Reply-To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o0UQpxcRIGeW7JVnHTXngx4zMhpSO0lv8Pt/oyDgzsM=; b=Xv0ENclNTNsblfDtEKqxCN1FCU
 s77GQZwQPf6C/4YN+g5idB6OvWQtcjIeBx42xKyefY/k8sj9skxoqGhFxhfp7iejInnFyoQNorqyc
 PJizvQptubdDUYnRsqgrB7WmwnoGpxTnEqHZthZHoLrt67G6AWkn94aDZ2lgkE/PXzEE=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@mail.xenproject.org>)
 id 1jGNKa-0004sR-Qs; Mon, 23 Mar 2020 13:41:28 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jGNKa-0004dG-JD; Mon, 23 Mar 2020 13:41:28 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jGNKa-0006uw-IW; Mon, 23 Mar 2020 13:41:28 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-Id: <E1jGNKa-0006uw-IW@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 23 Mar 2020 13:41:28 +0000
Subject: [Xen-devel] [libvirt bisection] complete build-i386-libvirt
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1231440863510824245=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============1231440863510824245==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job build-i386-libvirt
testid libvirt-build

Tree: libvirt git://libvirt.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt git://libvirt.org/libvirt.git
  Bug introduced:  4d5f50d86b760864240c695adc341379fb47a796
  Bug not present: a1a18c6ab55869d3b00cf8c32e0e2262a10c8ce7
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/148912/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/libvirt/build-i386-libvirt.libvirt-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/libvirt/build-i386-libvirt.libvirt-build --summary-out=tmp/148912.bisection-summary --basis-template=146182 --blessings=real,real-bisect libvirt build-i386-libvirt libvirt-build
Searching for failure / basis pass:
 148887 fail [host=italia0] / 146182 [host=pinot1] 146156 [host=huxelrebe0] 146103 [host=pinot1] 146061 ok.
Failure / basis pass flights: 148887 / 146061
(tree with no url: minios)
(tree in basispass but not in latest: libvirt_gnulib)
Tree: libvirt git://libvirt.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest ea903036fa8d2333edb74b617416416dd75be533 317d3eeb963a515e15a63fa356d8ebcda7041a51 0c8ea9fe1adbbee230ee0c68f28b68ca2b0534bc d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 066a9956097b54530888b88ab9aa1ea02e42af5a d094e95fb7c61c5f46d8e446b4bdc028438dea1c
Basis pass 7d608469621a3fda72dff2a89308e68cc9fb4c9a 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 03bfe526ecadc86f31eda433b91dc90be0563919
Generating revisions with ./adhoc-revtuple-generator  git://libvirt.org/libvirt.git#7d608469621a3fda72dff2a89308e68cc9fb4c9a-ea903036fa8d2333edb74b617416416dd75be533 https://gitlab.com/keycodemap/keycodemapdb.git#317d3eeb963a515e15a63fa356d8ebcda7041a51-317d3eeb963a515e15a63fa356d8ebcda7041a51 git://xenbits.xen.org/osstest/ovmf.git#70911f1f4aee0366b6122f2b90d367ec0f066beb-0c8ea9fe1adbbee230ee0c68f28b68ca2b0534bc git://xenbits.xen.org/qemu-xen-traditional.git#d0d8ad39ecb51cd7497cd524484fe09f50876\
 798-d0d8ad39ecb51cd7497cd524484fe09f50876798 git://xenbits.xen.org/qemu-xen.git#933ebad2470a169504799a1d95b8e410bd9847ef-933ebad2470a169504799a1d95b8e410bd9847ef git://xenbits.xen.org/osstest/seabios.git#f21b5a4aeb020f2a5e2c6503f906a9349dd2f069-066a9956097b54530888b88ab9aa1ea02e42af5a git://xenbits.xen.org/xen.git#03bfe526ecadc86f31eda433b91dc90be0563919-d094e95fb7c61c5f46d8e446b4bdc028438dea1c
From git://cache:9419/git://libvirt.org/libvirt
   ea903036fa..b66744e466  master     -> origin/master
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
Loaded 17544 nodes in revision graph
Searching for test results:
 146061 pass 7d608469621a3fda72dff2a89308e68cc9fb4c9a 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 03bfe526ecadc86f31eda433b91dc90be0563919
 146103 [host=pinot1]
 146182 [host=pinot1]
 146156 [host=huxelrebe0]
 146270 pass 7d608469621a3fda72dff2a89308e68cc9fb4c9a 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 03bfe526ecadc86f31eda433b91dc90be0563919
 146289 pass irrelevant
 146240 fail irrelevant
 146211 fail irrelevant
 146272 fail irrelevant
 146290 fail irrelevant
 146275 pass irrelevant
 146276 pass irrelevant
 146291 pass irrelevant
 146278 pass irrelevant
 146282 fail irrelevant
 146279 pass irrelevant
 146280 pass irrelevant
 146292 fail irrelevant
 146287 fail irrelevant
 146299 fail irrelevant
 146344 fail irrelevant
 146374 fail irrelevant
 146410 fail irrelevant
 146455 fail irrelevant
 146509 fail irrelevant
 146489 fail irrelevant
 146528 fail irrelevant
 146546 fail irrelevant
 146565 fail irrelevant
 146586 fail irrelevant
 146616 fail irrelevant
 146636 fail irrelevant
 146660 fail irrelevant
 146689 fail irrelevant
 146737 fail irrelevant
 146756 []
 146714 []
 146775 fail irrelevant
 146799 fail irrelevant
 146843 fail irrelevant
 146921 fail irrelevant
 146995 fail irrelevant
 147040 fail irrelevant
 147084 fail irrelevant
 147141 fail irrelevant
 147195 fail irrelevant
 147265 fail irrelevant
 147340 fail irrelevant
 147419 fail irrelevant
 147477 fail irrelevant
 147520 fail irrelevant
 147583 fail irrelevant
 147649 fail irrelevant
 147703 fail irrelevant
 147784 fail irrelevant
 147736 fail irrelevant
 147885 fail irrelevant
 147831 fail irrelevant
 147981 fail irrelevant
 148068 fail irrelevant
 148144 fail irrelevant
 148196 fail irrelevant
 148269 fail irrelevant
 148331 fail irrelevant
 148406 fail irrelevant
 148459 fail irrelevant
 148503 fail irrelevant
 148547 fail irrelevant
 148615 fail c43969e1646b39bf4dc07b585de7e2720b83519f 317d3eeb963a515e15a63fa356d8ebcda7041a51 799d88c1bae7978da23727df94b16f37bd1521f4 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 24d3938ca96a6420ec1a5f1f8479f90f2e9fdd56 d094e95fb7c61c5f46d8e446b4bdc028438dea1c
 148583 fail c43969e1646b39bf4dc07b585de7e2720b83519f 317d3eeb963a515e15a63fa356d8ebcda7041a51 799d88c1bae7978da23727df94b16f37bd1521f4 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 24d3938ca96a6420ec1a5f1f8479f90f2e9fdd56 d094e95fb7c61c5f46d8e446b4bdc028438dea1c
 148651 fail irrelevant
 148688 fail irrelevant
 148729 fail c9bd08ee352373ed121c10f0adf11a4a0a29c857 317d3eeb963a515e15a63fa356d8ebcda7041a51 01ce872739d2f0cd3a8917be2180381db5f0391e d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 066a9956097b54530888b88ab9aa1ea02e42af5a d094e95fb7c61c5f46d8e446b4bdc028438dea1c
 148775 fail irrelevant
 148799 fail ea903036fa8d2333edb74b617416416dd75be533 317d3eeb963a515e15a63fa356d8ebcda7041a51 0c8ea9fe1adbbee230ee0c68f28b68ca2b0534bc d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 066a9956097b54530888b88ab9aa1ea02e42af5a d094e95fb7c61c5f46d8e446b4bdc028438dea1c
 148871 fail 0d0d60ddc5e58359cff5be8dfd6dd27e98da0282 317d3eeb963a515e15a63fa356d8ebcda7041a51 957ca63190bc2770d0383408bf87587112e84881 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 3dd724dff085e13ad520f8e35aea717db2ff07d0
 148830 fail ea903036fa8d2333edb74b617416416dd75be533 317d3eeb963a515e15a63fa356d8ebcda7041a51 0c8ea9fe1adbbee230ee0c68f28b68ca2b0534bc d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 066a9956097b54530888b88ab9aa1ea02e42af5a d094e95fb7c61c5f46d8e446b4bdc028438dea1c
 148861 pass 7d608469621a3fda72dff2a89308e68cc9fb4c9a 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 03bfe526ecadc86f31eda433b91dc90be0563919
 148875 fail 4ed55c0be11da3e7e29986a8b3b4b0a32b58be47 317d3eeb963a515e15a63fa356d8ebcda7041a51 c8b8157e126ae2fb6f65842677251d300ceff104 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d f910c3ebc6a178c5cbbc0868134be536fae7f7cf
 148883 pass 6b4140dafb6b3db9ead2e260757f1c3583936f19 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5235562444021e9c5aff08f45daa6b5b7952c7a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 97f10daf5f4bac91db732ef45c562839686f2c04
 148867 fail ea903036fa8d2333edb74b617416416dd75be533 317d3eeb963a515e15a63fa356d8ebcda7041a51 0c8ea9fe1adbbee230ee0c68f28b68ca2b0534bc d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 066a9956097b54530888b88ab9aa1ea02e42af5a d094e95fb7c61c5f46d8e446b4bdc028438dea1c
 148888 fail 2feaa925bba06e77be918bcbfab63bc8201c8f19 317d3eeb963a515e15a63fa356d8ebcda7041a51 d9c919744b9b6272cdf1c81f33a09539a4bd031b d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 1eeedaf5a0d9ed6324f3bd5b700bb22eb4355341
 148876 fail 6c1dddaf97b4ef70e27961c9f79b15c79a863ac5 317d3eeb963a515e15a63fa356d8ebcda7041a51 9a1f14ad721bbcd833ec5108944c44a502392f03 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d f44a192d22a37dcb9171b95978b43637bc09718d
 148880 pass 0169f5ecdeefb91463b07a2e6f3f3b40c84323e9 317d3eeb963a515e15a63fa356d8ebcda7041a51 710ff7490ad897383eb35d1becadabd21a733f24 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 321b658847a06417b6a0b6964e939ed0ecf16551
 148894 fail d0236e2a554f2321512276b897e8a8a44f68e969 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5235562444021e9c5aff08f45daa6b5b7952c7a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 97f10daf5f4bac91db732ef45c562839686f2c04
 148892 fail d0236e2a554f2321512276b897e8a8a44f68e969 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5235562444021e9c5aff08f45daa6b5b7952c7a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d b05ec9263e56ef0784da766e829cfe08569d1d88
 148898 pass a1a18c6ab55869d3b00cf8c32e0e2262a10c8ce7 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5235562444021e9c5aff08f45daa6b5b7952c7a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 97f10daf5f4bac91db732ef45c562839686f2c04
 148899 fail 4d5f50d86b760864240c695adc341379fb47a796 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5235562444021e9c5aff08f45daa6b5b7952c7a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 97f10daf5f4bac91db732ef45c562839686f2c04
 148904 pass a1a18c6ab55869d3b00cf8c32e0e2262a10c8ce7 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5235562444021e9c5aff08f45daa6b5b7952c7a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 97f10daf5f4bac91db732ef45c562839686f2c04
 148907 fail 4d5f50d86b760864240c695adc341379fb47a796 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5235562444021e9c5aff08f45daa6b5b7952c7a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 97f10daf5f4bac91db732ef45c562839686f2c04
 148887 fail ea903036fa8d2333edb74b617416416dd75be533 317d3eeb963a515e15a63fa356d8ebcda7041a51 0c8ea9fe1adbbee230ee0c68f28b68ca2b0534bc d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 066a9956097b54530888b88ab9aa1ea02e42af5a d094e95fb7c61c5f46d8e446b4bdc028438dea1c
 148909 pass a1a18c6ab55869d3b00cf8c32e0e2262a10c8ce7 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5235562444021e9c5aff08f45daa6b5b7952c7a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 97f10daf5f4bac91db732ef45c562839686f2c04
 148912 fail 4d5f50d86b760864240c695adc341379fb47a796 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5235562444021e9c5aff08f45daa6b5b7952c7a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 97f10daf5f4bac91db732ef45c562839686f2c04
Searching for interesting versions
 Result found: flight 146061 (pass), for basis pass
 Result found: flight 148799 (fail), for basis failure
 Repro found: flight 148861 (pass), for basis pass
 Repro found: flight 148867 (fail), for basis failure
 0 revisions at a1a18c6ab55869d3b00cf8c32e0e2262a10c8ce7 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5235562444021e9c5aff08f45daa6b5b7952c7a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 97f10daf5f4bac91db732ef45c562839686f2c04
No revisions left to test, checking graph state.
 Result found: flight 148898 (pass), for last pass
 Result found: flight 148899 (fail), for first failure
 Repro found: flight 148904 (pass), for last pass
 Repro found: flight 148907 (fail), for first failure
 Repro found: flight 148909 (pass), for last pass
 Repro found: flight 148912 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt git://libvirt.org/libvirt.git
  Bug introduced:  4d5f50d86b760864240c695adc341379fb47a796
  Bug not present: a1a18c6ab55869d3b00cf8c32e0e2262a10c8ce7
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/148912/

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

dot: graph is too large for cairo-renderer bitmaps. Scaling by 0.37448 to fit
pnmtopng: 21 colors found
Revision graph left in /home/logs/results/bisect/libvirt/build-i386-libvirt.libvirt-build.{dot,ps,png,html,svg}.
----------------------------------------
148912: tolerable ALL FAIL

flight 148912 libvirt real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/148912/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-i386-libvirt            6 libvirt-build           fail baseline untested


jobs:
 build-i386-libvirt                                           fail    


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



--===============1231440863510824245==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1231440863510824245==--
