Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E2F18FE62
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 21:01:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGTCQ-00019B-0v; Mon, 23 Mar 2020 19:57:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zrun=5I=mail.xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1jGTCO-000196-5q
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 19:57:24 +0000
X-Inumbo-ID: 81e3b834-6d40-11ea-a6c1-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 81e3b834-6d40-11ea-a6c1-bc764e2007e4;
 Mon, 23 Mar 2020 19:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To:Sender:
 Reply-To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1IoveARWtvDtNLRZ7+r119/6Mw4wQtArVDbIepVTQ04=; b=4fOpOtHp2PhqdV0TNQqBDN5O8Q
 V2xAc1e/rX09PRLpeUHTx4SrbH4WPOEKpFQlGzIcZooU0VtONy1iyCnSmLH+Qa4iWZyBXiXdSO5eG
 g3kepHv9GL5m5tJZ+dHGHC8PEwUsFAt4XgqJrsuM9nwghJfGZLDiXsgYbuLkLIcwGdmQ=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@mail.xenproject.org>)
 id 1jGTCL-0004Jd-2F; Mon, 23 Mar 2020 19:57:21 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jGTCK-0001qP-SB; Mon, 23 Mar 2020 19:57:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jGTCK-0000x5-RY; Mon, 23 Mar 2020 19:57:20 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-Id: <E1jGTCK-0000x5-RY@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 23 Mar 2020 19:57:20 +0000
Subject: [Xen-devel] [seabios bisection] complete
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-qemuu-nested-intel
testid debian-hvm-install/l1/l2

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios https://git.seabios.org/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  59e89cdabc71b5c3a956028ef1c439e6bae947f0
  Bug not present: 6dacdcd439c1ddd32110d4a008de346e367409ec
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/148928/


  commit 59e89cdabc71b5c3a956028ef1c439e6bae947f0
  Author: Andrew Cooper <andrew.cooper3@citrix.com>
  Date:   Thu Dec 20 17:25:29 2018 +0000
  
      x86/vtx: Disable executable EPT superpages to work around CVE-2018-12207
      
      CVE-2018-12207 covers a set of errata on various Intel processors, whereby a
      machine check exception can be generated in a corner case when an executable
      mapping changes size or cacheability without TLB invalidation.  HVM guest
      kernels can trigger this to DoS the host.
      
      To mitigate, in affected hardware, all EPT superpages are marked NX.  When an
      instruction fetch violation is observed against the superpage, the superpage
      is shattered to 4k and has execute permissions restored.  This prevents the
      guest kernel from being able to create the necessary preconditions in the iTLB
      to exploit the vulnerability.
      
      This does come with a workload-dependent performance overhead, caused by
      increased TLB pressure.  Performance can be restored, if guest kernels are
      trusted not to mount an attack, by specifying ept=exec-sp on the command line.
      
      This is part of XSA-304 / CVE-2018-12207
      
      Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Acked-by: George Dunlap <george.dunlap@citrix.com>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/seabios/test-amd64-amd64-qemuu-nested-intel.debian-hvm-install--l1--l2.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/seabios/test-amd64-amd64-qemuu-nested-intel.debian-hvm-install--l1--l2 --summary-out=tmp/148928.bisection-summary --basis-template=148666 --blessings=real,real-bisect seabios test-amd64-amd64-qemuu-nested-intel debian-hvm-install/l1/l2
Searching for failure / basis pass:
 148853 fail [host=debina1] / 148690 [host=huxelrebe0] 148666 [host=godello1] 148646 [host=godello0] 148176 [host=italia0] 146357 [host=godello0] 146064 [host=godello1] 144665 [host=albana1] 144198 [host=elbling0] 144105 [host=godello0] 144081 [host=godello1] 143876 ok.
Failure / basis pass flights: 148853 / 143876
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios https://git.seabios.org/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0c8ea9fe1adbbee230ee0c68f28b68ca2b0534bc d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef de88a9628426e82f1cee4b61b06e67e6787301b1 d094e95fb7c61c5f46d8e446b4bdc028438dea1c
Basis pass b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8d3f428109623096cb8845779cdf9dc44949b8e9 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 9caa19be0e534c687081fbdfcd301406e728c98c 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#b98aebd298246df37b472c52a2ee1023256d02e3-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#8d3f428109623096cb8845779cdf9dc44949b8e9-0c8ea9fe1adbbee230ee0c68f28b68ca2b0534bc git://xenbits.xen.org/qemu-xen-traditional.git#d0d8ad39ecb51cd7497cd524484\
 fe09f50876798-d0d8ad39ecb51cd7497cd524484fe09f50876798 git://xenbits.xen.org/qemu-xen.git#933ebad2470a169504799a1d95b8e410bd9847ef-933ebad2470a169504799a1d95b8e410bd9847ef https://git.seabios.org/seabios.git#9caa19be0e534c687081fbdfcd301406e728c98c-de88a9628426e82f1cee4b61b06e67e6787301b1 git://xenbits.xen.org/xen.git#518c935fac4d30b3ec35d4b6add82b17b7d7aca3-d094e95fb7c61c5f46d8e446b4bdc028438dea1c
adhoc-revtuple-generator: tree discontiguous: linux-pvops
From git://cache:9419/https://git.seabios.org/seabios
 - [deleted]         (none)     -> origin/xen-tested-master
 * [new branch]      0.5.1-stable -> origin/0.5.1-stable
 * [new branch]      0.6.1-stable -> origin/0.6.1-stable
 * [new branch]      1.10-stable  -> origin/1.10-stable
 * [new branch]      1.11-stable  -> origin/1.11-stable
 * [new branch]      1.12-stable  -> origin/1.12-stable
 * [new branch]      1.6.3-stable -> origin/1.6.3-stable
 * [new branch]      1.7.2-stable -> origin/1.7.2-stable
 * [new branch]      1.7.3-stable -> origin/1.7.3-stable
 * [new branch]      1.7.5-stable -> origin/1.7.5-stable
 * [new branch]      1.8-stable   -> origin/1.8-stable
 * [new branch]      1.9-stable   -> origin/1.9-stable
 * [new branch]      master       -> origin/master
Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Loaded 3878 nodes in revision graph
Searching for test results:
 143876 pass b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8d3f428109623096cb8845779cdf9dc44949b8e9 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 9caa19be0e534c687081fbdfcd301406e728c98c 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 144081 [host=godello1]
 144105 [host=godello0]
 144198 [host=elbling0]
 144665 [host=albana1]
 146064 [host=godello1]
 146357 [host=godello0]
 148176 [host=italia0]
 148629 [host=godello0]
 148659 [host=godello0]
 148646 [host=godello0]
 148645 [host=godello0]
 148666 [host=godello1]
 148711 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 01ce872739d2f0cd3a8917be2180381db5f0391e d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef bfdb3f86e9116fc79ce63c231373b084aad11218 d094e95fb7c61c5f46d8e446b4bdc028438dea1c
 148690 [host=huxelrebe0]
 148738 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 01ce872739d2f0cd3a8917be2180381db5f0391e d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef bfdb3f86e9116fc79ce63c231373b084aad11218 d094e95fb7c61c5f46d8e446b4bdc028438dea1c
 148773 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1b6b4a83e1d85e48837068dfe409f5557b50d71d d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef bfdb3f86e9116fc79ce63c231373b084aad11218 d094e95fb7c61c5f46d8e446b4bdc028438dea1c
 148794 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0c8ea9fe1adbbee230ee0c68f28b68ca2b0534bc d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef de88a9628426e82f1cee4b61b06e67e6787301b1 d094e95fb7c61c5f46d8e446b4bdc028438dea1c
 148858 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 044010234e481e2d6167ff0d19f82a7ac863926c d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 9caa19be0e534c687081fbdfcd301406e728c98c a458d3bd0d2585275c128556ec0cbd818c6a7b0d
 148815 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0c8ea9fe1adbbee230ee0c68f28b68ca2b0534bc d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef de88a9628426e82f1cee4b61b06e67e6787301b1 d094e95fb7c61c5f46d8e446b4bdc028438dea1c
 148816 pass b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8d3f428109623096cb8845779cdf9dc44949b8e9 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 9caa19be0e534c687081fbdfcd301406e728c98c 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 148848 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 665afccc52e1a02ee329147e02f04b8e9cf1d571 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 0cd791c499bdc698d14a24050ec56d60b45732e0
 148863 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e92b155740cdbf10a85ed8f37f69da0991fc8275 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 9caa19be0e534c687081fbdfcd301406e728c98c 8f1d6c049c0439d8c5b175a0f8369cfde57ba08c
 148837 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0c8ea9fe1adbbee230ee0c68f28b68ca2b0534bc d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef de88a9628426e82f1cee4b61b06e67e6787301b1 d094e95fb7c61c5f46d8e446b4bdc028438dea1c
 148842 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a5abd9cc2cebe7fac001f7bb7b647c47cf54af1a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 279521aed9ad0f31d157450e66487665cfbe525f
 148854 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0b9ad0bc030bbd79073a26fc9b3527ff9128b9da d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef c9ba5276e3217ac6a1ec772dbebf568ba3a8a55d e28eed55a41e4d70c3bd7b0efb1668dd93d8bed6
 148866 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6fe77f347ed820c5924f2ac6ddc43aa869cdbd5e d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 0594486b639849b47d762c76f28730edbf648dc7 09242da55b32e2d1c3728c23cd43d0377b74bed6
 148877 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e92b155740cdbf10a85ed8f37f69da0991fc8275 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 9caa19be0e534c687081fbdfcd301406e728c98c 8c4330818f6ee70cbf7428a40a28a73df1272d10
 148870 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c801f33d818b8010fabb93092c661c6f30d42b13 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 3bdd2b77656124e3fa7693fbfd7a06f74c38eb87 c67c43ce4a63e7ea314525ba178ce7ab955c9292
 148853 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0c8ea9fe1adbbee230ee0c68f28b68ca2b0534bc d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef de88a9628426e82f1cee4b61b06e67e6787301b1 d094e95fb7c61c5f46d8e446b4bdc028438dea1c
 148889 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e92b155740cdbf10a85ed8f37f69da0991fc8275 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 9caa19be0e534c687081fbdfcd301406e728c98c d13dfb02aafaba376b24ff0dc64e19ba1c360803
 148882 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e92b155740cdbf10a85ed8f37f69da0991fc8275 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 9caa19be0e534c687081fbdfcd301406e728c98c 59e89cdabc71b5c3a956028ef1c439e6bae947f0
 148897 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e92b155740cdbf10a85ed8f37f69da0991fc8275 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 9caa19be0e534c687081fbdfcd301406e728c98c 6dacdcd439c1ddd32110d4a008de346e367409ec
 148905 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e92b155740cdbf10a85ed8f37f69da0991fc8275 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 9caa19be0e534c687081fbdfcd301406e728c98c 59e89cdabc71b5c3a956028ef1c439e6bae947f0
 148914 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e92b155740cdbf10a85ed8f37f69da0991fc8275 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 9caa19be0e534c687081fbdfcd301406e728c98c 6dacdcd439c1ddd32110d4a008de346e367409ec
 148920 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e92b155740cdbf10a85ed8f37f69da0991fc8275 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 9caa19be0e534c687081fbdfcd301406e728c98c 59e89cdabc71b5c3a956028ef1c439e6bae947f0
 148924 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e92b155740cdbf10a85ed8f37f69da0991fc8275 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 9caa19be0e534c687081fbdfcd301406e728c98c 6dacdcd439c1ddd32110d4a008de346e367409ec
 148928 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e92b155740cdbf10a85ed8f37f69da0991fc8275 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 9caa19be0e534c687081fbdfcd301406e728c98c 59e89cdabc71b5c3a956028ef1c439e6bae947f0
Searching for interesting versions
 Result found: flight 143876 (pass), for basis pass
 Result found: flight 148794 (fail), for basis failure
 Repro found: flight 148816 (pass), for basis pass
 Repro found: flight 148837 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e92b155740cdbf10a85ed8f37f69da0991fc8275 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 9caa19be0e534c687081fbdfcd301406e728c98c 6dacdcd439c1ddd32110d4a008de346e367409ec
No revisions left to test, checking graph state.
 Result found: flight 148897 (pass), for last pass
 Result found: flight 148905 (fail), for first failure
 Repro found: flight 148914 (pass), for last pass
 Repro found: flight 148920 (fail), for first failure
 Repro found: flight 148924 (pass), for last pass
 Repro found: flight 148928 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  59e89cdabc71b5c3a956028ef1c439e6bae947f0
  Bug not present: 6dacdcd439c1ddd32110d4a008de346e367409ec
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/148928/


  commit 59e89cdabc71b5c3a956028ef1c439e6bae947f0
  Author: Andrew Cooper <andrew.cooper3@citrix.com>
  Date:   Thu Dec 20 17:25:29 2018 +0000
  
      x86/vtx: Disable executable EPT superpages to work around CVE-2018-12207
      
      CVE-2018-12207 covers a set of errata on various Intel processors, whereby a
      machine check exception can be generated in a corner case when an executable
      mapping changes size or cacheability without TLB invalidation.  HVM guest
      kernels can trigger this to DoS the host.
      
      To mitigate, in affected hardware, all EPT superpages are marked NX.  When an
      instruction fetch violation is observed against the superpage, the superpage
      is shattered to 4k and has execute permissions restored.  This prevents the
      guest kernel from being able to create the necessary preconditions in the iTLB
      to exploit the vulnerability.
      
      This does come with a workload-dependent performance overhead, caused by
      increased TLB pressure.  Performance can be restored, if guest kernels are
      trusted not to mount an attack, by specifying ept=exec-sp on the command line.
      
      This is part of XSA-304 / CVE-2018-12207
      
      Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Acked-by: George Dunlap <george.dunlap@citrix.com>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>

dot: graph is too large for cairo-renderer bitmaps. Scaling by 0.416041 to fit
pnmtopng: 59 colors found
Revision graph left in /home/logs/results/bisect/seabios/test-amd64-amd64-qemuu-nested-intel.debian-hvm-install--l1--l2.{dot,ps,png,html,svg}.
----------------------------------------
148928: tolerable ALL FAIL

flight 148928 seabios real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/148928/

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


