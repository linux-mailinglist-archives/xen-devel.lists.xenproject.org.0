Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 974231A2DD8
	for <lists+xen-devel@lfdr.de>; Thu,  9 Apr 2020 05:14:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMNdX-0004dR-Nd; Thu, 09 Apr 2020 03:13:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Jqn0=5Z=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jMNdW-0004dM-Tc
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2020 03:13:50 +0000
X-Inumbo-ID: 20e806ca-7a10-11ea-b4f4-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 20e806ca-7a10-11ea-b4f4-bc764e2007e4;
 Thu, 09 Apr 2020 03:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To:Sender:
 Reply-To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bMbmW2CtEZNJ/q4HXbs2j3iEtrCdPx60GPua4ozWe4Q=; b=QzcGfpm1RU1JK/WI3fSp1di5pU
 /C9W7V+qQFTnRl61nzdWnYrFIb1IL3iU+L8x6BHhzFSDwZG6C5c60rPOU2clipazexDS4d/n/qWlS
 evIaOnDcm/ulmoYm1MDxzrcMHq5iyQBb0r1pRlkWyR0tCq1sTzyd7wf8opn+YFc8YxkM=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jMNdT-0001Sj-I5; Thu, 09 Apr 2020 03:13:47 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jMNdT-0007i4-5t; Thu, 09 Apr 2020 03:13:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jMNdT-00020X-5L; Thu, 09 Apr 2020 03:13:47 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [linux-linus bisection] complete test-amd64-i386-xl-pvshim
Message-Id: <E1jMNdT-00020X-5L@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 09 Apr 2020 03:13:47 +0000
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
job test-amd64-i386-xl-pvshim
testid xen-boot

Tree: linux git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  linux git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
  Bug introduced:  6cd3d4019ba3f45aa1a87e4e914e81d367b59937
  Bug not present: 0adb8bc0391f1fa7820529c0200fb0c4912fe365
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/149546/


  commit 6cd3d4019ba3f45aa1a87e4e914e81d367b59937
  Merge: 0adb8bc0391f c3881eb58d56
  Author: Linus Torvalds <torvalds@linux-foundation.org>
  Date:   Fri Apr 3 12:51:46 2020 -0700
  
      Merge tag 'for-linus-5.7-rc1-tag' of git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip
      
      Pull xen updates from Juergen Gross:
      
       - a cleanup patch removing an unused function
      
       - a small fix for the xen pciback driver
      
       - a series for making the unwinder hyppay with the Xen PV guest idle
         task stacks
      
      * tag 'for-linus-5.7-rc1-tag' of git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip:
        x86/xen: Make the secondary CPU idle tasks reliable
        x86/xen: Make the boot CPU idle task reliable
        xen-pciback: fix INTERRUPT_TYPE_* defines
        xen/xenbus: remove unused xenbus_map_ring()
  
  commit c3881eb58d56116c79ac4ee4f40fd15ead124c4b
  Author: Miroslav Benes <mbenes@suse.cz>
  Date:   Thu Mar 26 10:26:03 2020 +0100
  
      x86/xen: Make the secondary CPU idle tasks reliable
      
      The unwinder reports the secondary CPU idle tasks' stack on XEN PV as
      unreliable, which affects at least live patching.
      cpu_initialize_context() sets up the context of the CPU through
      VCPUOP_initialise hypercall. After it is woken up, the idle task starts
      in cpu_bringup_and_idle() function and its stack starts at the offset
      right below pt_regs. The unwinder correctly detects the end of stack
      there but it is confused by NULL return address in the last frame.
      
      Introduce a wrapper in assembly, which just calls
      cpu_bringup_and_idle(). The return address is thus pushed on the stack
      and the wrapper contains the annotation hint for the unwinder regarding
      the stack state.
      
      Signed-off-by: Miroslav Benes <mbenes@suse.cz>
      Reviewed-by: Juergen Gross <jgross@suse.com>
      Signed-off-by: Juergen Gross <jgross@suse.com>
  
  commit 2f62f36e62daec43aa7b9633ef7f18e042a80bed
  Author: Miroslav Benes <mbenes@suse.cz>
  Date:   Thu Mar 26 10:26:02 2020 +0100
  
      x86/xen: Make the boot CPU idle task reliable
      
      The unwinder reports the boot CPU idle task's stack on XEN PV as
      unreliable, which affects at least live patching. There are two reasons
      for this. First, the task does not follow the x86 convention that its
      stack starts at the offset right below saved pt_regs. It allows the
      unwinder to easily detect the end of the stack and verify it. Second,
      startup_xen() function does not store the return address before jumping
      to xen_start_kernel() which confuses the unwinder.
      
      Amend both issues by moving the starting point of initial stack in
      startup_xen() and storing the return address before the jump, which is
      exactly what call instruction does.
      
      Signed-off-by: Miroslav Benes <mbenes@suse.cz>
      Reviewed-by: Juergen Gross <jgross@suse.com>
      Signed-off-by: Juergen Gross <jgross@suse.com>
  
  commit 69086bd698574501a59073b07b629f2a00b82552
  Author: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Date:   Fri Mar 20 04:09:18 2020 +0100
  
      xen-pciback: fix INTERRUPT_TYPE_* defines
      
      xen_pcibk_get_interrupt_type() assumes INTERRUPT_TYPE_NONE being 0
      (initialize ret to 0 and return as INTERRUPT_TYPE_NONE).
      Fix the definition to make INTERRUPT_TYPE_NONE really 0, and also shift
      other values to not leave holes.
      But also, do not assume INTERRUPT_TYPE_NONE being 0 anymore to avoid
      similar confusions in the future.
      
      Fixes: 476878e4b2be ("xen-pciback: optionally allow interrupt enable flag writes")
      Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
      Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
      Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
      Signed-off-by: Juergen Gross <jgross@suse.com>
  
  commit b28089a7ad9d07b1b35e2b781a66a200f8b8e20d
  Author: Juergen Gross <jgross@suse.com>
  Date:   Mon Mar 9 16:54:41 2020 +0100
  
      xen/xenbus: remove unused xenbus_map_ring()
      
      xenbus_map_ring() is used nowhere in the tree, remove it.
      xenbus_unmap_ring() is used only locally, so make it static and move it
      up.
      
      Signed-off-by: Juergen Gross <jgross@suse.com>
      Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
      Signed-off-by: Juergen Gross <jgross@suse.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/linux-linus/test-amd64-i386-xl-pvshim.xen-boot.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/linux-linus/test-amd64-i386-xl-pvshim.xen-boot --summary-out=tmp/149546.bisection-summary --basis-template=149238 --blessings=real,real-bisect linux-linus test-amd64-i386-xl-pvshim xen-boot
Searching for failure / basis pass:
 149505 fail [host=huxelrebe0] / 149386 ok.
Failure / basis pass flights: 149505 / 149386
(tree with no url: minios)
Tree: linux git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 63bef48fd6c9d3f1ba4f0e23b4da1e007db6a3c0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9bb1f080c45f7253f9270662d55865a8718cebc8 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 6a3b59ab9c7dc00331c21346052dfa6a0df45aa3 990b6e38d93c6e60f9d81e8b71ddfd209fca00bd
Basis pass bef7b2a7be28638770972ab2709adf11d601c11a c530a75c1e6a472b0eb9558310b518f0dfcd8860 4deef2d865efdc61d1a53ad7bd48f9dd42560b45 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 6a3b59ab9c7dc00331c21346052dfa6a0df45aa3 e19b4b3b55f84e0cfcc02fe5d66965969a81c965
Generating revisions with ./adhoc-revtuple-generator  git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git#bef7b2a7be28638770972ab2709adf11d601c11a-63bef48fd6c9d3f1ba4f0e23b4da1e007db6a3c0 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#4deef2d865efdc61d1a53ad7bd48f9dd42560b45-9bb1f080c45f7253f9270662d55865a8718cebc8 git://xenbits.xen.org/qemu-xen-traditional.\
 git#d0d8ad39ecb51cd7497cd524484fe09f50876798-d0d8ad39ecb51cd7497cd524484fe09f50876798 git://xenbits.xen.org/qemu-xen.git#933ebad2470a169504799a1d95b8e410bd9847ef-933ebad2470a169504799a1d95b8e410bd9847ef git://xenbits.xen.org/osstest/seabios.git#6a3b59ab9c7dc00331c21346052dfa6a0df45aa3-6a3b59ab9c7dc00331c21346052dfa6a0df45aa3 git://xenbits.xen.org/xen.git#e19b4b3b55f84e0cfcc02fe5d66965969a81c965-990b6e38d93c6e60f9d81e8b71ddfd209fca00bd
Loaded 3077437 nodes in revision graph
Searching for test results:
 149386 pass bef7b2a7be28638770972ab2709adf11d601c11a c530a75c1e6a472b0eb9558310b518f0dfcd8860 4deef2d865efdc61d1a53ad7bd48f9dd42560b45 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 6a3b59ab9c7dc00331c21346052dfa6a0df45aa3 e19b4b3b55f84e0cfcc02fe5d66965969a81c965
 149480 fail 7e63420847ae5f1036e4f7c42f0b3282e73efbc2 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ee026ea78b0e32a9ffbaf0040afe91de8ae2179c d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 6a3b59ab9c7dc00331c21346052dfa6a0df45aa3 990b6e38d93c6e60f9d81e8b71ddfd209fca00bd
 149516 pass bef7b2a7be28638770972ab2709adf11d601c11a c530a75c1e6a472b0eb9558310b518f0dfcd8860 0a44fd316537573247a7576101e5ae5e8dc5e73c d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 6a3b59ab9c7dc00331c21346052dfa6a0df45aa3 bb2a34fd740e9a26be9e2244f1a5b4cef439e5a8
 149536 pass d8836005236425cf3cfcc8967abd1d5c21f607f8 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef5dcba975ee3b4c29b19ad0b23d371a2cd9d60a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 6a3b59ab9c7dc00331c21346052dfa6a0df45aa3 6b8836aa65947e58ba2b58573cece03754ad68f6
 149505 fail 63bef48fd6c9d3f1ba4f0e23b4da1e007db6a3c0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9bb1f080c45f7253f9270662d55865a8718cebc8 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 6a3b59ab9c7dc00331c21346052dfa6a0df45aa3 990b6e38d93c6e60f9d81e8b71ddfd209fca00bd
 149538 pass 0adb8bc0391f1fa7820529c0200fb0c4912fe365 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef5dcba975ee3b4c29b19ad0b23d371a2cd9d60a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 6a3b59ab9c7dc00331c21346052dfa6a0df45aa3 990b6e38d93c6e60f9d81e8b71ddfd209fca00bd
 149518 fail 854e80bcfdafb8d99d308e21798cd0116338783d c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef5dcba975ee3b4c29b19ad0b23d371a2cd9d60a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 6a3b59ab9c7dc00331c21346052dfa6a0df45aa3 990b6e38d93c6e60f9d81e8b71ddfd209fca00bd
 149540 fail 6cd3d4019ba3f45aa1a87e4e914e81d367b59937 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef5dcba975ee3b4c29b19ad0b23d371a2cd9d60a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 6a3b59ab9c7dc00331c21346052dfa6a0df45aa3 990b6e38d93c6e60f9d81e8b71ddfd209fca00bd
 149524 fail 63bef48fd6c9d3f1ba4f0e23b4da1e007db6a3c0 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9bb1f080c45f7253f9270662d55865a8718cebc8 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 6a3b59ab9c7dc00331c21346052dfa6a0df45aa3 990b6e38d93c6e60f9d81e8b71ddfd209fca00bd
 149506 pass bef7b2a7be28638770972ab2709adf11d601c11a c530a75c1e6a472b0eb9558310b518f0dfcd8860 4deef2d865efdc61d1a53ad7bd48f9dd42560b45 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 6a3b59ab9c7dc00331c21346052dfa6a0df45aa3 e19b4b3b55f84e0cfcc02fe5d66965969a81c965
 149511 fail 7e63420847ae5f1036e4f7c42f0b3282e73efbc2 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ee026ea78b0e32a9ffbaf0040afe91de8ae2179c d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 6a3b59ab9c7dc00331c21346052dfa6a0df45aa3 990b6e38d93c6e60f9d81e8b71ddfd209fca00bd
 149542 pass 0adb8bc0391f1fa7820529c0200fb0c4912fe365 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef5dcba975ee3b4c29b19ad0b23d371a2cd9d60a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 6a3b59ab9c7dc00331c21346052dfa6a0df45aa3 990b6e38d93c6e60f9d81e8b71ddfd209fca00bd
 149526 pass d8836005236425cf3cfcc8967abd1d5c21f607f8 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef5dcba975ee3b4c29b19ad0b23d371a2cd9d60a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 6a3b59ab9c7dc00331c21346052dfa6a0df45aa3 c81fb4e4a35cbee4f373387c4ed527676f6dc4b1
 149543 fail 6cd3d4019ba3f45aa1a87e4e914e81d367b59937 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef5dcba975ee3b4c29b19ad0b23d371a2cd9d60a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 6a3b59ab9c7dc00331c21346052dfa6a0df45aa3 990b6e38d93c6e60f9d81e8b71ddfd209fca00bd
 149529 fail ff2ae607c6f329d11a3b0528801ea7474be8c3e9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef5dcba975ee3b4c29b19ad0b23d371a2cd9d60a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 6a3b59ab9c7dc00331c21346052dfa6a0df45aa3 990b6e38d93c6e60f9d81e8b71ddfd209fca00bd
 149544 pass 0adb8bc0391f1fa7820529c0200fb0c4912fe365 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef5dcba975ee3b4c29b19ad0b23d371a2cd9d60a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 6a3b59ab9c7dc00331c21346052dfa6a0df45aa3 990b6e38d93c6e60f9d81e8b71ddfd209fca00bd
 149546 fail 6cd3d4019ba3f45aa1a87e4e914e81d367b59937 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef5dcba975ee3b4c29b19ad0b23d371a2cd9d60a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 6a3b59ab9c7dc00331c21346052dfa6a0df45aa3 990b6e38d93c6e60f9d81e8b71ddfd209fca00bd
Searching for interesting versions
 Result found: flight 149386 (pass), for basis pass
 Result found: flight 149505 (fail), for basis failure
 Repro found: flight 149506 (pass), for basis pass
 Repro found: flight 149524 (fail), for basis failure
 0 revisions at 0adb8bc0391f1fa7820529c0200fb0c4912fe365 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef5dcba975ee3b4c29b19ad0b23d371a2cd9d60a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 6a3b59ab9c7dc00331c21346052dfa6a0df45aa3 990b6e38d93c6e60f9d81e8b71ddfd209fca00bd
No revisions left to test, checking graph state.
 Result found: flight 149538 (pass), for last pass
 Result found: flight 149540 (fail), for first failure
 Repro found: flight 149542 (pass), for last pass
 Repro found: flight 149543 (fail), for first failure
 Repro found: flight 149544 (pass), for last pass
 Repro found: flight 149546 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  linux git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
  Bug introduced:  6cd3d4019ba3f45aa1a87e4e914e81d367b59937
  Bug not present: 0adb8bc0391f1fa7820529c0200fb0c4912fe365
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/149546/


  commit 6cd3d4019ba3f45aa1a87e4e914e81d367b59937
  Merge: 0adb8bc0391f c3881eb58d56
  Author: Linus Torvalds <torvalds@linux-foundation.org>
  Date:   Fri Apr 3 12:51:46 2020 -0700
  
      Merge tag 'for-linus-5.7-rc1-tag' of git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip
      
      Pull xen updates from Juergen Gross:
      
       - a cleanup patch removing an unused function
      
       - a small fix for the xen pciback driver
      
       - a series for making the unwinder hyppay with the Xen PV guest idle
         task stacks
      
      * tag 'for-linus-5.7-rc1-tag' of git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip:
        x86/xen: Make the secondary CPU idle tasks reliable
        x86/xen: Make the boot CPU idle task reliable
        xen-pciback: fix INTERRUPT_TYPE_* defines
        xen/xenbus: remove unused xenbus_map_ring()
  
  commit c3881eb58d56116c79ac4ee4f40fd15ead124c4b
  Author: Miroslav Benes <mbenes@suse.cz>
  Date:   Thu Mar 26 10:26:03 2020 +0100
  
      x86/xen: Make the secondary CPU idle tasks reliable
      
      The unwinder reports the secondary CPU idle tasks' stack on XEN PV as
      unreliable, which affects at least live patching.
      cpu_initialize_context() sets up the context of the CPU through
      VCPUOP_initialise hypercall. After it is woken up, the idle task starts
      in cpu_bringup_and_idle() function and its stack starts at the offset
      right below pt_regs. The unwinder correctly detects the end of stack
      there but it is confused by NULL return address in the last frame.
      
      Introduce a wrapper in assembly, which just calls
      cpu_bringup_and_idle(). The return address is thus pushed on the stack
      and the wrapper contains the annotation hint for the unwinder regarding
      the stack state.
      
      Signed-off-by: Miroslav Benes <mbenes@suse.cz>
      Reviewed-by: Juergen Gross <jgross@suse.com>
      Signed-off-by: Juergen Gross <jgross@suse.com>
  
  commit 2f62f36e62daec43aa7b9633ef7f18e042a80bed
  Author: Miroslav Benes <mbenes@suse.cz>
  Date:   Thu Mar 26 10:26:02 2020 +0100
  
      x86/xen: Make the boot CPU idle task reliable
      
      The unwinder reports the boot CPU idle task's stack on XEN PV as
      unreliable, which affects at least live patching. There are two reasons
      for this. First, the task does not follow the x86 convention that its
      stack starts at the offset right below saved pt_regs. It allows the
      unwinder to easily detect the end of the stack and verify it. Second,
      startup_xen() function does not store the return address before jumping
      to xen_start_kernel() which confuses the unwinder.
      
      Amend both issues by moving the starting point of initial stack in
      startup_xen() and storing the return address before the jump, which is
      exactly what call instruction does.
      
      Signed-off-by: Miroslav Benes <mbenes@suse.cz>
      Reviewed-by: Juergen Gross <jgross@suse.com>
      Signed-off-by: Juergen Gross <jgross@suse.com>
  
  commit 69086bd698574501a59073b07b629f2a00b82552
  Author: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Date:   Fri Mar 20 04:09:18 2020 +0100
  
      xen-pciback: fix INTERRUPT_TYPE_* defines
      
      xen_pcibk_get_interrupt_type() assumes INTERRUPT_TYPE_NONE being 0
      (initialize ret to 0 and return as INTERRUPT_TYPE_NONE).
      Fix the definition to make INTERRUPT_TYPE_NONE really 0, and also shift
      other values to not leave holes.
      But also, do not assume INTERRUPT_TYPE_NONE being 0 anymore to avoid
      similar confusions in the future.
      
      Fixes: 476878e4b2be ("xen-pciback: optionally allow interrupt enable flag writes")
      Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
      Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
      Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
      Signed-off-by: Juergen Gross <jgross@suse.com>
  
  commit b28089a7ad9d07b1b35e2b781a66a200f8b8e20d
  Author: Juergen Gross <jgross@suse.com>
  Date:   Mon Mar 9 16:54:41 2020 +0100
  
      xen/xenbus: remove unused xenbus_map_ring()
      
      xenbus_map_ring() is used nowhere in the tree, remove it.
      xenbus_unmap_ring() is used only locally, so make it static and move it
      up.
      
      Signed-off-by: Juergen Gross <jgross@suse.com>
      Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
      Signed-off-by: Juergen Gross <jgross@suse.com>

pnmtopng: 220 colors found
Revision graph left in /home/logs/results/bisect/linux-linus/test-amd64-i386-xl-pvshim.xen-boot.{dot,ps,png,html,svg}.
----------------------------------------
149546: tolerable ALL FAIL

flight 149546 linux-linus real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/149546/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-i386-xl-pvshim     7 xen-boot                fail baseline untested


jobs:
 test-amd64-i386-xl-pvshim                                    fail    


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


