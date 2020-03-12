Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0071D183DB2
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 01:01:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCXgt-0002Hx-7T; Thu, 12 Mar 2020 23:56:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X1u9=45=mail.xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1jCXgr-0002Hs-RP
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 23:56:37 +0000
X-Inumbo-ID: 1aea263a-64bd-11ea-b254-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1aea263a-64bd-11ea-b254-12813bfff9fa;
 Thu, 12 Mar 2020 23:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To:Sender:
 Reply-To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kB92qPh5XZIw0WpVmvf5kpuckNTm51/N0PQlpcBmSoE=; b=FEK2th9nDJtFYhWRHfbZu+vebD
 RxZR1T4yZMhiABoFOo+KrhFCALiKX8gSU35tmb5L7rlQLDNidrDiPMjXCljVMqLD4yRY6bkdlcDUN
 f4K4Me/MK3e1nieVtxMjxsq3OarjEDTp1hv1T2QusqP9YKelci2BlcRhJE7ZBKzNAnrw=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@mail.xenproject.org>)
 id 1jCXgo-00080I-UQ; Thu, 12 Mar 2020 23:56:34 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jCXgo-0003g1-MW; Thu, 12 Mar 2020 23:56:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jCXgo-0003eI-LY; Thu, 12 Mar 2020 23:56:34 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-Id: <E1jCXgo-0003eI-LY@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 12 Mar 2020 23:56:34 +0000
Subject: [Xen-devel] [linux-linus bisection] complete
 test-amd64-amd64-qemuu-nested-intel
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
Content-Type: multipart/mixed; boundary="===============0982350067208061584=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============0982350067208061584==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-qemuu-nested-intel
testid debian-hvm-install/l1/l2

Tree: linux git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  f96e1469ad06b61796c60193daaeb9f8a96d7458
  Bug not present: 0729830cc425a8ff27a3137e87b93768ae3c853c
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/148496/


  commit f96e1469ad06b61796c60193daaeb9f8a96d7458
  Author: Roger Pau Monné <roger.pau@citrix.com>
  Date:   Wed Feb 5 13:49:09 2020 +0100
  
      x86/vvmx: fix virtual interrupt injection when Ack on exit control is used
      
      When doing a virtual vmexit (ie: a vmexit handled by the L1 VMM)
      interrupts shouldn't be injected using the virtual interrupt delivery
      mechanism unless the Ack on exit vmexit control bit isn't set in the
      nested vmcs.
      
      Gate the call to nvmx_update_apicv helper on whether the nested vmcs
      has the Ack on exit bit set in the vmexit control field.
      
      Note that this fixes the usage of x2APIC by the L1 VMM, at least when
      the L1 VMM is Xen.
      
      Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
      Reviewed-by: Kevin Tian <kevin.tian@intel.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/linux-linus/test-amd64-amd64-qemuu-nested-intel.debian-hvm-install--l1--l2.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/linux-linus/test-amd64-amd64-qemuu-nested-intel.debian-hvm-install--l1--l2 --summary-out=tmp/148496.bisection-summary --basis-template=133580 --blessings=real,real-bisect linux-linus test-amd64-amd64-qemuu-nested-intel debian-hvm-install/l1/l2
Searching for failure / basis pass:
 148417 fail [host=chardonnay0] / 147082 [host=albana0] 147029 [host=godello0] 146972 [host=godello1] 146904 [host=italia0] 143848 [host=godello1] 143581 [host=godello0] 143450 [host=huxelrebe0] 143363 [host=albana0] 143277 [host=fiano0] 143242 [host=huxelrebe1] 143169 [host=elbling1] 143087 [host=godello1] 143060 [host=chardonnay1] 143006 ok.
Failure / basis pass flights: 148417 / 143006
(tree with no url: minios)
Tree: linux git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest f35111a946548e3b34a55abbad3e9bacce6cb10f c530a75c1e6a472b0eb9558310b518f0dfcd8860 a3e25cc8a1dd3d1ea24ed02f90c44221e015e965 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 24d3938ca96a6420ec1a5f1f8479f90f2e9fdd56 0d99c909d7e1cbe69329a00f7772946f10a7865b
Basis pass 7d194c2100ad2a6dded545887d02754948ca5241 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2bbbdeeea21113185912a6a3ec8cdcaf862d8568 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef fc92d092ea4f704bc4d283c3911ee9894733f4ce 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
Generating revisions with ./adhoc-revtuple-generator  git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git#7d194c2100ad2a6dded545887d02754948ca5241-f35111a946548e3b34a55abbad3e9bacce6cb10f git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#2bbbdeeea21113185912a6a3ec8cdcaf862d8568-a3e25cc8a1dd3d1ea24ed02f90c44221e015e965 git://xenbits.xen.org/qemu-xen-traditional.\
 git#d0d8ad39ecb51cd7497cd524484fe09f50876798-d0d8ad39ecb51cd7497cd524484fe09f50876798 git://xenbits.xen.org/qemu-xen.git#933ebad2470a169504799a1d95b8e410bd9847ef-933ebad2470a169504799a1d95b8e410bd9847ef git://xenbits.xen.org/osstest/seabios.git#fc92d092ea4f704bc4d283c3911ee9894733f4ce-24d3938ca96a6420ec1a5f1f8479f90f2e9fdd56 git://xenbits.xen.org/xen.git#518c935fac4d30b3ec35d4b6add82b17b7d7aca3-0d99c909d7e1cbe69329a00f7772946f10a7865b
From git://cache:9419/git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6
   3cc6e2c599cd..807f030b44cc  master     -> origin/master
adhoc-revtuple-generator: tree discontiguous: linux-2.6
Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Loaded 8274 nodes in revision graph
Searching for test results:
 143006 pass 7d194c2100ad2a6dded545887d02754948ca5241 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2bbbdeeea21113185912a6a3ec8cdcaf862d8568 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef fc92d092ea4f704bc4d283c3911ee9894733f4ce 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143087 [host=godello1]
 143060 [host=chardonnay1]
 143169 [host=elbling1]
 143202 [host=huxelrebe1]
 143242 [host=huxelrebe1]
 143277 [host=fiano0]
 143363 [host=albana0]
 143450 [host=huxelrebe0]
 143581 [host=godello0]
 143848 [host=godello1]
 146850 []
 146904 [host=italia0]
 146972 [host=godello1]
 147029 [host=godello0]
 147082 [host=albana0]
 147236 fail irrelevant
 147157 fail irrelevant
 147320 fail irrelevant
 147410 fail irrelevant
 147541 fail irrelevant
 147480 fail irrelevant
 147640 fail irrelevant
 147706 fail irrelevant
 147749 fail irrelevant
 147820 fail irrelevant
 147912 fail irrelevant
 148038 fail irrelevant
 148180 fail irrelevant
 148119 fail irrelevant
 148258 fail irrelevant
 148335 pass 7d194c2100ad2a6dded545887d02754948ca5241 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2bbbdeeea21113185912a6a3ec8cdcaf862d8568 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef fc92d092ea4f704bc4d283c3911ee9894733f4ce 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 148417 fail f35111a946548e3b34a55abbad3e9bacce6cb10f c530a75c1e6a472b0eb9558310b518f0dfcd8860 a3e25cc8a1dd3d1ea24ed02f90c44221e015e965 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 24d3938ca96a6420ec1a5f1f8479f90f2e9fdd56 0d99c909d7e1cbe69329a00f7772946f10a7865b
 148422 fail 7d194c2100ad2a6dded545887d02754948ca5241 c530a75c1e6a472b0eb9558310b518f0dfcd8860 93b8ed68ddad01e072d617b763aa613832d7416c d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 3dd724dff085e13ad520f8e35aea717db2ff07d0
 148418 pass 7d194c2100ad2a6dded545887d02754948ca5241 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1f0d8096291651e6c20dbbc57d108321c1443563 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 fae249d23413b2bf7d98a97d8f649cf7d102c1ae
 148405 fail irrelevant
 148410 blocked 7d194c2100ad2a6dded545887d02754948ca5241 c530a75c1e6a472b0eb9558310b518f0dfcd8860 665afccc52e1a02ee329147e02f04b8e9cf1d571 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 0cd791c499bdc698d14a24050ec56d60b45732e0
 148435 fail 7d194c2100ad2a6dded545887d02754948ca5241 c530a75c1e6a472b0eb9558310b518f0dfcd8860 75839f977d377eb24ab55f5245977412a82844d4 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d ac661ada11723182957dfe11e17b3ede4914d21e
 148427 pass 7d194c2100ad2a6dded545887d02754948ca5241 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c8b8157e126ae2fb6f65842677251d300ceff104 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 0b70b2ff8f5a61196d090cc70040a20178327347
 148440 pass 7d194c2100ad2a6dded545887d02754948ca5241 c530a75c1e6a472b0eb9558310b518f0dfcd8860 eafd990f2606431d45cf0bbdbfee6d5959628de7 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 957bd8e7e302f1a0d31c95fc9910429f10a04d54
 148452 fail 7d194c2100ad2a6dded545887d02754948ca5241 c530a75c1e6a472b0eb9558310b518f0dfcd8860 422da35375c6d95dae9d5c56530d255b672b1f59 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d f96e1469ad06b61796c60193daaeb9f8a96d7458
 148457 pass 7d194c2100ad2a6dded545887d02754948ca5241 c530a75c1e6a472b0eb9558310b518f0dfcd8860 eafd990f2606431d45cf0bbdbfee6d5959628de7 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d be8c70373bd157c7ec74eca511aa33b427075c39
 148482 pass 7d194c2100ad2a6dded545887d02754948ca5241 c530a75c1e6a472b0eb9558310b518f0dfcd8860 422da35375c6d95dae9d5c56530d255b672b1f59 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 0729830cc425a8ff27a3137e87b93768ae3c853c
 148460 pass 7d194c2100ad2a6dded545887d02754948ca5241 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3feea54eae33a6689bedf1e023edeb219faa76d6 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d f7fb9a0aa9fbb81292e1626ce40340d3f6d8d505
 148463 pass 7d194c2100ad2a6dded545887d02754948ca5241 c530a75c1e6a472b0eb9558310b518f0dfcd8860 422da35375c6d95dae9d5c56530d255b672b1f59 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d f7fb9a0aa9fbb81292e1626ce40340d3f6d8d505
 148464 pass 7d194c2100ad2a6dded545887d02754948ca5241 c530a75c1e6a472b0eb9558310b518f0dfcd8860 422da35375c6d95dae9d5c56530d255b672b1f59 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d d00377890a3c62e0e925d171b6b839406b6d134d
 148467 pass 7d194c2100ad2a6dded545887d02754948ca5241 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2bbbdeeea21113185912a6a3ec8cdcaf862d8568 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef fc92d092ea4f704bc4d283c3911ee9894733f4ce 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 148486 fail 7d194c2100ad2a6dded545887d02754948ca5241 c530a75c1e6a472b0eb9558310b518f0dfcd8860 422da35375c6d95dae9d5c56530d255b672b1f59 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d f96e1469ad06b61796c60193daaeb9f8a96d7458
 148470 fail f35111a946548e3b34a55abbad3e9bacce6cb10f c530a75c1e6a472b0eb9558310b518f0dfcd8860 a3e25cc8a1dd3d1ea24ed02f90c44221e015e965 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 24d3938ca96a6420ec1a5f1f8479f90f2e9fdd56 0d99c909d7e1cbe69329a00f7772946f10a7865b
 148474 pass 7d194c2100ad2a6dded545887d02754948ca5241 c530a75c1e6a472b0eb9558310b518f0dfcd8860 422da35375c6d95dae9d5c56530d255b672b1f59 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 0729830cc425a8ff27a3137e87b93768ae3c853c
 148492 pass 7d194c2100ad2a6dded545887d02754948ca5241 c530a75c1e6a472b0eb9558310b518f0dfcd8860 422da35375c6d95dae9d5c56530d255b672b1f59 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 0729830cc425a8ff27a3137e87b93768ae3c853c
 148476 fail 7d194c2100ad2a6dded545887d02754948ca5241 c530a75c1e6a472b0eb9558310b518f0dfcd8860 422da35375c6d95dae9d5c56530d255b672b1f59 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d f96e1469ad06b61796c60193daaeb9f8a96d7458
 148496 fail 7d194c2100ad2a6dded545887d02754948ca5241 c530a75c1e6a472b0eb9558310b518f0dfcd8860 422da35375c6d95dae9d5c56530d255b672b1f59 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d f96e1469ad06b61796c60193daaeb9f8a96d7458
Searching for interesting versions
 Result found: flight 143006 (pass), for basis pass
 Result found: flight 148417 (fail), for basis failure
 Repro found: flight 148467 (pass), for basis pass
 Repro found: flight 148470 (fail), for basis failure
 0 revisions at 7d194c2100ad2a6dded545887d02754948ca5241 c530a75c1e6a472b0eb9558310b518f0dfcd8860 422da35375c6d95dae9d5c56530d255b672b1f59 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 0729830cc425a8ff27a3137e87b93768ae3c853c
No revisions left to test, checking graph state.
 Result found: flight 148474 (pass), for last pass
 Result found: flight 148476 (fail), for first failure
 Repro found: flight 148482 (pass), for last pass
 Repro found: flight 148486 (fail), for first failure
 Repro found: flight 148492 (pass), for last pass
 Repro found: flight 148496 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  f96e1469ad06b61796c60193daaeb9f8a96d7458
  Bug not present: 0729830cc425a8ff27a3137e87b93768ae3c853c
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/148496/


  commit f96e1469ad06b61796c60193daaeb9f8a96d7458
  Author: Roger Pau Monné <roger.pau@citrix.com>
  Date:   Wed Feb 5 13:49:09 2020 +0100
  
      x86/vvmx: fix virtual interrupt injection when Ack on exit control is used
      
      When doing a virtual vmexit (ie: a vmexit handled by the L1 VMM)
      interrupts shouldn't be injected using the virtual interrupt delivery
      mechanism unless the Ack on exit vmexit control bit isn't set in the
      nested vmcs.
      
      Gate the call to nvmx_update_apicv helper on whether the nested vmcs
      has the Ack on exit bit set in the vmexit control field.
      
      Note that this fixes the usage of x2APIC by the L1 VMM, at least when
      the L1 VMM is Xen.
      
      Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
      Reviewed-by: Kevin Tian <kevin.tian@intel.com>

dot: graph is too large for cairo-renderer bitmaps. Scaling by 0.41573 to fit
pnmtopng: 65 colors found
Revision graph left in /home/logs/results/bisect/linux-linus/test-amd64-amd64-qemuu-nested-intel.debian-hvm-install--l1--l2.{dot,ps,png,html,svg}.
----------------------------------------
148496: tolerable ALL FAIL

flight 148496 linux-linus real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/148496/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-qemuu-nested-intel 17 debian-hvm-install/l1/l2 fail baseline untested


jobs:
 test-amd64-amd64-qemuu-nested-intel                          fail    


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



--===============0982350067208061584==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0982350067208061584==--
