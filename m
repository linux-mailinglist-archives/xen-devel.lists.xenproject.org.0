Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DC528A082
	for <lists+xen-devel@lfdr.de>; Sat, 10 Oct 2020 15:11:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5420.14168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kREdr-0000Fg-Cw; Sat, 10 Oct 2020 13:10:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5420.14168; Sat, 10 Oct 2020 13:10:31 +0000
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
	id 1kREdr-0000FJ-9n; Sat, 10 Oct 2020 13:10:31 +0000
Received: by outflank-mailman (input) for mailman id 5420;
 Sat, 10 Oct 2020 13:10:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cL7A=DR=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kREdp-0000FE-7M
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2020 13:10:29 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 14bd9c86-4713-4b14-afb6-4d2ea481628f;
 Sat, 10 Oct 2020 13:10:25 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kREdl-0003kw-95; Sat, 10 Oct 2020 13:10:25 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kREdl-0008NX-1c; Sat, 10 Oct 2020 13:10:25 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kREdl-0000DP-17; Sat, 10 Oct 2020 13:10:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=cL7A=DR=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kREdp-0000FE-7M
	for xen-devel@lists.xenproject.org; Sat, 10 Oct 2020 13:10:29 +0000
X-Inumbo-ID: 14bd9c86-4713-4b14-afb6-4d2ea481628f
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 14bd9c86-4713-4b14-afb6-4d2ea481628f;
	Sat, 10 Oct 2020 13:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
	bh=9cKEvzK27ujtKBZ/Ri33penMFcwrR4vjG2oLF3EhfPU=; b=BpIi7weXlqG8ljMo6Z5gwW6bQ0
	ANBpvQ05NTiHkjSts9ACC8jrQVxWk44U7GIOIUemSNpukFx6s/lYpQqBtj0fj4YPjYIO63Vew9EnA
	40Pw2P5Rt9p1f3enjgQyb7Fiib0n0kMqtz4cJLgTtufyOLn8LGxguWH006viPwaGrJSA=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kREdl-0003kw-95; Sat, 10 Oct 2020 13:10:25 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kREdl-0008NX-1c; Sat, 10 Oct 2020 13:10:25 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kREdl-0000DP-17; Sat, 10 Oct 2020 13:10:25 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable-smoke bisection] complete test-arm64-arm64-xl-xsm
Message-Id: <E1kREdl-0000DP-17@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 10 Oct 2020 13:10:25 +0000

branch xen-unstable-smoke
xenbranch xen-unstable-smoke
job test-arm64-arm64-xl-xsm
testid xen-boot

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  8a71d50ed40bfa78c37722dc11995ac2563662c3
  Bug not present: 4dced5df761e36fa2561f6f0f6563b3580d95e7f
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/155652/


  commit 8a71d50ed40bfa78c37722dc11995ac2563662c3
  Author: Trammell Hudson <hudson@trmm.net>
  Date:   Fri Oct 2 07:18:21 2020 -0400
  
      efi: Enable booting unified hypervisor/kernel/initrd images
      
      This patch adds support for bundling the xen.efi hypervisor, the xen.cfg
      configuration file, the Linux kernel and initrd, as well as the XSM,
      and architectural specific files into a single "unified" EFI executable.
      This allows an administrator to update the components independently
      without requiring rebuilding xen, as well as to replace the components
      in an existing image.
      
      The resulting EFI executable can be invoked directly from the UEFI Boot
      Manager, removing the need to use a separate loader like grub as well
      as removing dependencies on local filesystem access.  And since it is
      a single file, it can be signed and validated by UEFI Secure Boot without
      requring the shim protocol.
      
      It is inspired by systemd-boot's unified kernel technique and borrows the
      function to locate PE sections from systemd's LGPL'ed code.  During EFI
      boot, Xen looks at its own loaded image to locate the PE sections for
      the Xen configuration (`.config`), dom0 kernel (`.kernel`), dom0 initrd
      (`.ramdisk`), and XSM config (`.xsm`), which are included after building
      xen.efi using objcopy to add named sections for each input file.
      
      For x86, the CPU ucode can be included in a section named `.ucode`,
      which is loaded in the efi_arch_cfg_file_late() stage of the boot process.
      
      On ARM systems the Device Tree can be included in a section named
      `.dtb`, which is loaded during the efi_arch_cfg_file_early() stage of
      the boot process.
      
      Note that the system will fall back to loading files from disk if
      the named sections do not exist. This allows distributions to continue
      with the status quo if they want a signed kernel + config, while still
      allowing a user provided initrd (which is how the shim protocol currently
      works as well).
      
      This patch also adds constness to the section parameter of
      efi_arch_cfg_file_early() and efi_arch_cfg_file_late(),
      changes pe_find_section() to use a const CHAR16 section name,
      and adds pe_name_compare() to match section names.
      
      Signed-off-by: Trammell Hudson <hudson@trmm.net>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>
      [Fix ARM build by including pe.init.o]
      Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable-smoke/test-arm64-arm64-xl-xsm.xen-boot.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable-smoke/test-arm64-arm64-xl-xsm.xen-boot --summary-out=tmp/155652.bisection-summary --basis-template=155584 --blessings=real,real-bisect xen-unstable-smoke test-arm64-arm64-xl-xsm xen-boot
Searching for failure / basis pass:
 155642 fail [host=laxton0] / 155584 ok.
Failure / basis pass flights: 155642 / 155584
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 8a62dee9ceff3056c7e0bd9632bac39bee2a51b3
Basis pass a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 25849c8b16f2a5b7fcd0a823e80a5f1b590291f9
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9-a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen.git#ea6d3cd1ed79d824e605a70c3626bc437c386260-ea6d3cd1ed79d824e605a70c3626bc437c386260 git://xenbits.xen.org/xen.git#25849c8b16f2a5b7fcd0a823e80a5f1b590291f9-8a62dee\
 9ceff3056c7e0bd9632bac39bee2a51b3
Loaded 5001 nodes in revision graph
Searching for test results:
 155584 pass a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 25849c8b16f2a5b7fcd0a823e80a5f1b590291f9
 155612 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 8a62dee9ceff3056c7e0bd9632bac39bee2a51b3
 155614 pass a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 25849c8b16f2a5b7fcd0a823e80a5f1b590291f9
 155616 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 8a62dee9ceff3056c7e0bd9632bac39bee2a51b3
 155615 [host=rochester1]
 155618 pass a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 04be2c3a067899a3860fc2c7bc7a1599502ed1c5
 155620 [host=rochester1]
 155623 [host=rochester1]
 155624 [host=rochester1]
 155626 [host=rochester1]
 155628 [host=rochester1]
 155622 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 8a62dee9ceff3056c7e0bd9632bac39bee2a51b3
 155629 [host=rochester1]
 155633 pass a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 4dced5df761e36fa2561f6f0f6563b3580d95e7f
 155635 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 8a71d50ed40bfa78c37722dc11995ac2563662c3
 155638 pass a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 4dced5df761e36fa2561f6f0f6563b3580d95e7f
 155632 [host=rochester1]
 155640 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 8a71d50ed40bfa78c37722dc11995ac2563662c3
 155641 [host=rochester1]
 155646 [host=rochester1]
 155642 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 8a62dee9ceff3056c7e0bd9632bac39bee2a51b3
 155648 [host=rochester1]
 155651 pass a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 4dced5df761e36fa2561f6f0f6563b3580d95e7f
 155652 fail a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 8a71d50ed40bfa78c37722dc11995ac2563662c3
Searching for interesting versions
 Result found: flight 155584 (pass), for basis pass
 For basis failure, parent search stopping at a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 4dced5df761e36fa2561f6f0f6563b3580d95e7f, results HASH(0x5640e46200e8) HASH(0x5640e4617da0) HASH(0x5640e4627028) For basis failure, parent search stopping at a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 04be2c3a067899a3860fc2c7bc7a1599502ed1c5, results \
 HASH(0x5640e460f2d8) For basis failure, parent search stopping at a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 25849c8b16f2a5b7fcd0a823e80a5f1b590291f9, results HASH(0x5640e460cbe0) HASH(0x5640e46152f0) Result found: flight 155612 (fail), for basis failure (at ancestor ~422)
 Repro found: flight 155614 (pass), for basis pass
 Repro found: flight 155616 (fail), for basis failure
 0 revisions at a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ea6d3cd1ed79d824e605a70c3626bc437c386260 4dced5df761e36fa2561f6f0f6563b3580d95e7f
No revisions left to test, checking graph state.
 Result found: flight 155633 (pass), for last pass
 Result found: flight 155635 (fail), for first failure
 Repro found: flight 155638 (pass), for last pass
 Repro found: flight 155640 (fail), for first failure
 Repro found: flight 155651 (pass), for last pass
 Repro found: flight 155652 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  8a71d50ed40bfa78c37722dc11995ac2563662c3
  Bug not present: 4dced5df761e36fa2561f6f0f6563b3580d95e7f
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/155652/


  commit 8a71d50ed40bfa78c37722dc11995ac2563662c3
  Author: Trammell Hudson <hudson@trmm.net>
  Date:   Fri Oct 2 07:18:21 2020 -0400
  
      efi: Enable booting unified hypervisor/kernel/initrd images
      
      This patch adds support for bundling the xen.efi hypervisor, the xen.cfg
      configuration file, the Linux kernel and initrd, as well as the XSM,
      and architectural specific files into a single "unified" EFI executable.
      This allows an administrator to update the components independently
      without requiring rebuilding xen, as well as to replace the components
      in an existing image.
      
      The resulting EFI executable can be invoked directly from the UEFI Boot
      Manager, removing the need to use a separate loader like grub as well
      as removing dependencies on local filesystem access.  And since it is
      a single file, it can be signed and validated by UEFI Secure Boot without
      requring the shim protocol.
      
      It is inspired by systemd-boot's unified kernel technique and borrows the
      function to locate PE sections from systemd's LGPL'ed code.  During EFI
      boot, Xen looks at its own loaded image to locate the PE sections for
      the Xen configuration (`.config`), dom0 kernel (`.kernel`), dom0 initrd
      (`.ramdisk`), and XSM config (`.xsm`), which are included after building
      xen.efi using objcopy to add named sections for each input file.
      
      For x86, the CPU ucode can be included in a section named `.ucode`,
      which is loaded in the efi_arch_cfg_file_late() stage of the boot process.
      
      On ARM systems the Device Tree can be included in a section named
      `.dtb`, which is loaded during the efi_arch_cfg_file_early() stage of
      the boot process.
      
      Note that the system will fall back to loading files from disk if
      the named sections do not exist. This allows distributions to continue
      with the status quo if they want a signed kernel + config, while still
      allowing a user provided initrd (which is how the shim protocol currently
      works as well).
      
      This patch also adds constness to the section parameter of
      efi_arch_cfg_file_early() and efi_arch_cfg_file_late(),
      changes pe_find_section() to use a const CHAR16 section name,
      and adds pe_name_compare() to match section names.
      
      Signed-off-by: Trammell Hudson <hudson@trmm.net>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>
      [Fix ARM build by including pe.init.o]
      Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Revision graph left in /home/logs/results/bisect/xen-unstable-smoke/test-arm64-arm64-xl-xsm.xen-boot.{dot,ps,png,html,svg}.
----------------------------------------
155652: tolerable ALL FAIL

flight 155652 xen-unstable-smoke real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/155652/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-arm64-arm64-xl-xsm       8 xen-boot                fail baseline untested


jobs:
 test-arm64-arm64-xl-xsm                                      fail    


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


