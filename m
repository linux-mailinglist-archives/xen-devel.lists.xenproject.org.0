Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7182118E9FF
	for <lists+xen-devel@lfdr.de>; Sun, 22 Mar 2020 17:04:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jG30f-0002MV-VW; Sun, 22 Mar 2020 15:59:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JmTP=5H=mail.xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1jG30e-0002MQ-4g
 for xen-devel@lists.xenproject.org; Sun, 22 Mar 2020 15:59:32 +0000
X-Inumbo-ID: 1a12773a-6c56-11ea-bec1-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1a12773a-6c56-11ea-bec1-bc764e2007e4;
 Sun, 22 Mar 2020 15:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To:Sender:
 Reply-To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qcmBhNtA4OaRiJJai0+BrspJYpyqDz7Go3sJIOKwFx4=; b=dTmNvmnCycHjgJG/CvcKy2GfQz
 evLGlgjb7vvFPLaHMLRv4+mHkyIpwocxSkdDHEWR4p6P6p9jM0DXPxZ/O6bY0R29CBZtvrk4ilJZq
 eiFf1YOehSiAWNvgnol/ohAXVn3nGCtzkv1jviCn5iLEsmxrmTXQGnWMIfuFSNhdLx2U=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@mail.xenproject.org>)
 id 1jG30W-0005wt-Kw; Sun, 22 Mar 2020 15:59:24 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jG30W-0003nC-8P; Sun, 22 Mar 2020 15:59:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jG30W-0007uz-7h; Sun, 22 Mar 2020 15:59:24 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-Id: <E1jG30W-0007uz-7h@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 22 Mar 2020 15:59:24 +0000
Subject: [Xen-devel] [libvirt bisection] complete build-amd64-libvirt
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
Content-Type: multipart/mixed; boundary="===============6587759806697264986=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============6587759806697264986==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job build-amd64-libvirt
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/148859/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/libvirt/build-amd64-libvirt.libvirt-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/libvirt/build-amd64-libvirt.libvirt-build --summary-out=tmp/148859.bisection-summary --basis-template=146182 --blessings=real,real-bisect libvirt build-amd64-libvirt libvirt-build
Searching for failure / basis pass:
 148830 fail [host=albana1] / 146182 [host=rimava1] 146156 [host=huxelrebe1] 146103 [host=fiano0] 146061 [host=chardonnay1] 145969 [host=godello1] 145906 [host=godello1] 145842 [host=godello1] 145779 [host=godello0] 145511 [host=huxelrebe1] 145212 [host=godello0] 145173 [host=godello0] 145133 [host=godello1] 145054 [host=godello0] 144995 [host=godello1] 144958 [host=albana0] 144920 [host=godello0] 144885 ok.
Failure / basis pass flights: 148830 / 144885
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
Basis pass 6f894a29d812381ffaf8e321f710ceb4bef8f944 317d3eeb963a515e15a63fa356d8ebcda7041a51 804666c86e7b6f04fe5c5cfdb13199c19e0e99b0 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 c9115affa6f83aebe29ae9cbf503aa163911a5bb
Generating revisions with ./adhoc-revtuple-generator  git://libvirt.org/libvirt.git#6f894a29d812381ffaf8e321f710ceb4bef8f944-ea903036fa8d2333edb74b617416416dd75be533 https://gitlab.com/keycodemap/keycodemapdb.git#317d3eeb963a515e15a63fa356d8ebcda7041a51-317d3eeb963a515e15a63fa356d8ebcda7041a51 git://xenbits.xen.org/osstest/ovmf.git#804666c86e7b6f04fe5c5cfdb13199c19e0e99b0-0c8ea9fe1adbbee230ee0c68f28b68ca2b0534bc git://xenbits.xen.org/qemu-xen-traditional.git#d0d8ad39ecb51cd7497cd524484fe09f50876\
 798-d0d8ad39ecb51cd7497cd524484fe09f50876798 git://xenbits.xen.org/qemu-xen.git#933ebad2470a169504799a1d95b8e410bd9847ef-933ebad2470a169504799a1d95b8e410bd9847ef git://xenbits.xen.org/osstest/seabios.git#f21b5a4aeb020f2a5e2c6503f906a9349dd2f069-066a9956097b54530888b88ab9aa1ea02e42af5a git://xenbits.xen.org/xen.git#c9115affa6f83aebe29ae9cbf503aa163911a5bb-d094e95fb7c61c5f46d8e446b4bdc028438dea1c
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
Loaded 21537 nodes in revision graph
Searching for test results:
 144885 pass 6f894a29d812381ffaf8e321f710ceb4bef8f944 317d3eeb963a515e15a63fa356d8ebcda7041a51 804666c86e7b6f04fe5c5cfdb13199c19e0e99b0 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 c9115affa6f83aebe29ae9cbf503aa163911a5bb
 144958 [host=albana0]
 144920 [host=godello0]
 144995 [host=godello1]
 145054 [host=godello0]
 145173 [host=godello0]
 145133 [host=godello1]
 145212 [host=godello0]
 145511 [host=huxelrebe1]
 145542 [host=godello1]
 145589 [host=godello1]
 145621 [host=godello1]
 145639 [host=godello1]
 145626 [host=godello1]
 145632 [host=godello1]
 145627 [host=godello1]
 145623 [host=godello1]
 145636 [host=godello1]
 145630 [host=godello1]
 145633 [host=godello1]
 145637 [host=godello1]
 145638 [host=godello1]
 145640 [host=godello1]
 145642 [host=godello1]
 145643 [host=godello1]
 145644 [host=godello1]
 145656 [host=godello1]
 145710 [host=godello0]
 145779 [host=godello0]
 145842 [host=godello1]
 145906 [host=godello1]
 145969 [host=godello1]
 146061 [host=chardonnay1]
 146103 [host=fiano0]
 146182 [host=rimava1]
 146156 [host=huxelrebe1]
 146223 [host=albana0]
 146238 [host=albana0]
 146239 [host=albana0]
 146256 [host=albana0]
 146241 [host=albana0]
 146240 [host=albana0]
 146211 [host=albana0]
 146243 [host=albana0]
 146245 [host=albana0]
 146260 [host=albana0]
 146249 [host=albana0]
 146250 [host=albana0]
 146264 [host=albana0]
 146252 [host=albana0]
 146253 [host=albana0]
 146265 [host=albana0]
 146255 [host=albana0]
 146266 [host=albana0]
 146269 [host=albana0]
 146299 fail irrelevant
 146344 [host=albana0]
 146374 [host=albana0]
 146410 fail irrelevant
 146455 fail irrelevant
 146509 [host=albana0]
 146489 [host=albana0]
 146528 [host=albana0]
 146546 [host=albana0]
 146565 [host=albana0]
 146586 [host=albana0]
 146616 [host=albana0]
 146636 fail irrelevant
 146660 [host=albana0]
 146689 [host=albana0]
 146737 [host=albana0]
 146756 fail irrelevant
 146714 fail irrelevant
 146775 [host=albana0]
 146799 fail irrelevant
 146843 []
 146921 [host=albana0]
 146995 fail irrelevant
 147040 [host=albana0]
 147084 fail irrelevant
 147141 [host=albana0]
 147195 [host=albana0]
 147265 fail irrelevant
 147340 [host=albana0]
 147419 [host=albana0]
 147477 fail irrelevant
 147520 [host=albana0]
 147583 [host=albana0]
 147649 [host=albana0]
 147703 fail irrelevant
 147784 [host=albana0]
 147736 [host=albana0]
 147885 [host=albana0]
 147831 [host=albana0]
 147981 [host=albana0]
 148068 []
 148144 [host=albana0]
 148196 [host=albana0]
 148269 fail irrelevant
 148331 fail irrelevant
 148406 [host=albana0]
 148459 [host=albana0]
 148503 [host=albana0]
 148547 [host=albana0]
 148615 [host=albana0]
 148583 [host=albana0]
 148651 [host=albana0]
 148688 []
 148729 fail c9bd08ee352373ed121c10f0adf11a4a0a29c857 317d3eeb963a515e15a63fa356d8ebcda7041a51 01ce872739d2f0cd3a8917be2180381db5f0391e d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 066a9956097b54530888b88ab9aa1ea02e42af5a d094e95fb7c61c5f46d8e446b4bdc028438dea1c
 148775 fail irrelevant
 148828 pass a1cd25b919509be2645dbe6f952d5263e0d4e4e5 317d3eeb963a515e15a63fa356d8ebcda7041a51 710ff7490ad897383eb35d1becadabd21a733f24 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d dda31ce9521c3b6a7750076f79427be77dea9b5b
 148847 fail 4d5f50d86b760864240c695adc341379fb47a796 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5235562444021e9c5aff08f45daa6b5b7952c7a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 97f10daf5f4bac91db732ef45c562839686f2c04
 148799 fail ea903036fa8d2333edb74b617416416dd75be533 317d3eeb963a515e15a63fa356d8ebcda7041a51 0c8ea9fe1adbbee230ee0c68f28b68ca2b0534bc d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 066a9956097b54530888b88ab9aa1ea02e42af5a d094e95fb7c61c5f46d8e446b4bdc028438dea1c
 148831 fail d61f95cf6a6fbd564e104c168d325581acd9cd8d 317d3eeb963a515e15a63fa356d8ebcda7041a51 9a1f14ad721bbcd833ec5108944c44a502392f03 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d e0fbb9121a684b5604a4e572c9c7e4016ad5505c
 148834 pass 4aeb0cc4d7876f9a2c6a024a32d883808096da77 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5235562444021e9c5aff08f45daa6b5b7952c7a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 97f10daf5f4bac91db732ef45c562839686f2c04
 148849 pass a1a18c6ab55869d3b00cf8c32e0e2262a10c8ce7 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5235562444021e9c5aff08f45daa6b5b7952c7a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 97f10daf5f4bac91db732ef45c562839686f2c04
 148811 pass 6f894a29d812381ffaf8e321f710ceb4bef8f944 317d3eeb963a515e15a63fa356d8ebcda7041a51 804666c86e7b6f04fe5c5cfdb13199c19e0e99b0 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 c9115affa6f83aebe29ae9cbf503aa163911a5bb
 148819 fail ea903036fa8d2333edb74b617416416dd75be533 317d3eeb963a515e15a63fa356d8ebcda7041a51 0c8ea9fe1adbbee230ee0c68f28b68ca2b0534bc d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 066a9956097b54530888b88ab9aa1ea02e42af5a d094e95fb7c61c5f46d8e446b4bdc028438dea1c
 148821 fail 79ebc31a1b671577f413a4fed4addca8ae3423c9 317d3eeb963a515e15a63fa356d8ebcda7041a51 eafd990f2606431d45cf0bbdbfee6d5959628de7 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d ef4666f63c9677b22a05b204e85fef5f207c0a5c
 148836 fail 2feaa925bba06e77be918bcbfab63bc8201c8f19 317d3eeb963a515e15a63fa356d8ebcda7041a51 4e2ac8062cbe907be9fbf6b2e6f1fc947690c4de d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 1eeedaf5a0d9ed6324f3bd5b700bb22eb4355341
 148822 pass 8b58b5ee03c6d4b7916d9ee6cdf40571e1e12919 317d3eeb963a515e15a63fa356d8ebcda7041a51 cf3ad972a2105ffa3795ddb1d9c149c7fc369f9b d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 09488b2bb76da2c78b9e25c7041e004baba1ca6a
 148824 fail 29d43bf96a3e5886f1b32c78bbb16d1507bd0d9e 317d3eeb963a515e15a63fa356d8ebcda7041a51 9a1f14ad721bbcd833ec5108944c44a502392f03 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 4345dff75a7838649c75a85aeb0e0de93853201d
 148852 fail 4d5f50d86b760864240c695adc341379fb47a796 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5235562444021e9c5aff08f45daa6b5b7952c7a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 97f10daf5f4bac91db732ef45c562839686f2c04
 148839 fail d0236e2a554f2321512276b897e8a8a44f68e969 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5235562444021e9c5aff08f45daa6b5b7952c7a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 3c4b2eef4941c8a81d04337c6df31175a881635f
 148843 fail c02e9621b950f9af024c7abed2eef1f70bdb47aa 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5235562444021e9c5aff08f45daa6b5b7952c7a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 97f10daf5f4bac91db732ef45c562839686f2c04
 148830 fail ea903036fa8d2333edb74b617416416dd75be533 317d3eeb963a515e15a63fa356d8ebcda7041a51 0c8ea9fe1adbbee230ee0c68f28b68ca2b0534bc d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 066a9956097b54530888b88ab9aa1ea02e42af5a d094e95fb7c61c5f46d8e446b4bdc028438dea1c
 148845 pass a1a18c6ab55869d3b00cf8c32e0e2262a10c8ce7 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5235562444021e9c5aff08f45daa6b5b7952c7a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 97f10daf5f4bac91db732ef45c562839686f2c04
 148856 pass a1a18c6ab55869d3b00cf8c32e0e2262a10c8ce7 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5235562444021e9c5aff08f45daa6b5b7952c7a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 97f10daf5f4bac91db732ef45c562839686f2c04
 148859 fail 4d5f50d86b760864240c695adc341379fb47a796 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5235562444021e9c5aff08f45daa6b5b7952c7a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 97f10daf5f4bac91db732ef45c562839686f2c04
Searching for interesting versions
 Result found: flight 144885 (pass), for basis pass
 Result found: flight 148799 (fail), for basis failure
 Repro found: flight 148811 (pass), for basis pass
 Repro found: flight 148819 (fail), for basis failure
 0 revisions at a1a18c6ab55869d3b00cf8c32e0e2262a10c8ce7 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5235562444021e9c5aff08f45daa6b5b7952c7a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 97f10daf5f4bac91db732ef45c562839686f2c04
No revisions left to test, checking graph state.
 Result found: flight 148845 (pass), for last pass
 Result found: flight 148847 (fail), for first failure
 Repro found: flight 148849 (pass), for last pass
 Repro found: flight 148852 (fail), for first failure
 Repro found: flight 148856 (pass), for last pass
 Repro found: flight 148859 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt git://libvirt.org/libvirt.git
  Bug introduced:  4d5f50d86b760864240c695adc341379fb47a796
  Bug not present: a1a18c6ab55869d3b00cf8c32e0e2262a10c8ce7
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/148859/

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

dot: graph is too large for cairo-renderer bitmaps. Scaling by 0.277946 to fit
pnmtopng: 43 colors found
Revision graph left in /home/logs/results/bisect/libvirt/build-amd64-libvirt.libvirt-build.{dot,ps,png,html,svg}.
----------------------------------------
148859: tolerable ALL FAIL

flight 148859 libvirt real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/148859/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-amd64-libvirt           6 libvirt-build           fail baseline untested


jobs:
 build-amd64-libvirt                                          fail    


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



--===============6587759806697264986==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6587759806697264986==--
