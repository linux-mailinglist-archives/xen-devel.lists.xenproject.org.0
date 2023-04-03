Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0173E6D44E1
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 14:51:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517432.802736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjJes-0006q2-K8; Mon, 03 Apr 2023 12:51:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517432.802736; Mon, 03 Apr 2023 12:51:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjJes-0006o9-Eo; Mon, 03 Apr 2023 12:51:38 +0000
Received: by outflank-mailman (input) for mailman id 517432;
 Mon, 03 Apr 2023 12:51:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pjJeq-0006nz-Uf; Mon, 03 Apr 2023 12:51:36 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pjJeq-0000Kh-RG; Mon, 03 Apr 2023 12:51:36 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pjJeq-0006Wy-Ac; Mon, 03 Apr 2023 12:51:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pjJeq-0000zg-AA; Mon, 03 Apr 2023 12:51:36 +0000
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
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=dpMlPzhdn2xiggfFd3IuEvqdtUJGVsKIy+S3+BQTpqs=; b=R3KRY6zRMW+GO/FkAfxsvodHlb
	CQDzmh4/U5tEe7+jZ/WGnsytTcuKs2Pht/CfKOEUfpJwLgWOyOJmWE9unnY1x17ppxJiBBr+viWpj
	2HaXaXpD8UcdpFxHqQQlVK6NIryRfGqyBI7aKYUG88MnpxKCaAQaxEYBB+VIU6BeIaRo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180117-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 180117: regressions - trouble: blocked/fail/pass/starved
X-Osstest-Failures:
    xen-unstable-smoke:build-amd64:xen-build:fail:regression
    xen-unstable-smoke:build-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):starved:nonblocking
    xen-unstable-smoke:build-armhf:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    xen=720ebfbad3e3bee8aa18e37e08ef597f493f8bf8
X-Osstest-Versions-That:
    xen=d6e0b4c41a38655ade7ecb566e8b2961282769fb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 03 Apr 2023 12:51:36 +0000

flight 180117 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180117/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                   6 xen-build                fail REGR. vs. 180085

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl           1 build-check(1)               starved  n/a
 build-armhf                   2 hosts-allocate               starved  n/a

version targeted for testing:
 xen                  720ebfbad3e3bee8aa18e37e08ef597f493f8bf8
baseline version:
 xen                  d6e0b4c41a38655ade7ecb566e8b2961282769fb

Last test of basis   180085  2023-03-31 07:01:54 Z    3 days
Testing same since   180117  2023-04-03 11:03:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Oleksii Kurochko <oleksii.kurochko@gmail.com>
  Roger Pau Monné <roger.pau@citrix.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  fail    
 build-armhf                                                  starved 
 build-amd64-libvirt                                          blocked 
 test-armhf-armhf-xl                                          starved 
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    blocked 
 test-amd64-amd64-libvirt                                     blocked 


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


Not pushing.

------------------------------------------------------------
commit 720ebfbad3e3bee8aa18e37e08ef597f493f8bf8
Author: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Date:   Mon Apr 3 12:53:29 2023 +0200

    xen/x86: switch to use generic implemetation of bug.h
    
    The following changes were made:
    * Make GENERIC_BUG_FRAME mandatory for X86
    * Update asm/bug.h using generic implementation in <xen/bug.h>
    * Update do_invalid_op using generic do_bug_frame()
    * Define BUG_DEBUGGER_TRAP_FATAL to debugger_trap_fatal(X86_EXC_GP,regs)
    * type of eip variable was changed to 'const void *'
    
    Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 71efa7b868e64d29b2a0488e015e80798f1fde8a
Author: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Date:   Mon Apr 3 12:52:02 2023 +0200

    xen: change <asm/bug.h> to <xen/bug.h>
    
    The idea of the patch is to change all <asm/bug.h> to <xen/bug.h> and
    keep Xen compilable with adding only minimal amount of changes:
    1. It was added "#include <xen/types.h>" to ARM's "<asm/bug.h>" as it
      uses uint_{16,32}t in 'struct bug_frame'.
    2. It was added '#define BUG_FRAME_STRUCT' which means that ARM hasn't
      been switched to generic implementation yet.
    3. It was added '#define BUG_FRAME_STRUCT' which means that x86 hasn't
      been switched to generic implementation yet.
    4. BUGFRAME_* and _start_bug_frame[], _stop_bug_frame_*[] were removed
      for ARM & x86 to deal with compilation errors such as:
          redundant redeclaration of ...
    5. Remove BUG_DISP_WIDTH, BUG_LINE_LO_WIDTH, BUG_LINE_HI_WIDTH from
      x86's <asm.bug.h> to not to produce #undef for them and #define again
      with the same values as in <xen/bug.h>. These #undef and #define will
      be anyway removed in the patch [2]
    6. Remove <asm/bug.h> from <x86/acpi/cpufreq/cpufreq.c> and
      <drivers/cpufreq/cpufreq.c> as nothing from <xen/bug.h> are used in
      <*/cpufreq.c>
    
    In the following two patches x86 and ARM archictectures will be
    switched fully:
    [1] xen/arm: switch ARM to use generic implementation of bug.h
    [2] xen/x86: switch x86 to use generic implemetation of bug.h
    
    Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit faafb5cb736db67a5790854c63bf3c76dd4df7e0
Author: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Date:   Mon Apr 3 12:50:56 2023 +0200

    xen/arm: remove unused defines in <asm/bug.h>
    
    The following defines BUG_DISP_WIDTH, BUG_LINE_LO_WIDTH,
    BUG_LINE_HI_WIDTH aren't used in ARM so could be purged
    as unused.
    
    Requested-by: Jan Beulich <jbeulich@suse.com>
    Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit 60a9b07150558b212918aa8fedd532be246b03d7
Author: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Date:   Mon Apr 3 12:50:06 2023 +0200

    xen: introduce CONFIG_GENERIC_BUG_FRAME
    
    A large part of the content of the bug.h is repeated among all
    architectures, so it was decided to create a new config
    CONFIG_GENERIC_BUG_FRAME.
    
    The version of <bug.h> from x86 was taken as the base version.
    
    The patch introduces the following stuff:
      * common bug.h header
      * generic implementation of do_bug_frame
      * new config CONFIG_GENERIC_BUG_FRAME
    
    Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Tested-by: Julien Grall <jgrall@amazon.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit de7d113212b0e28423b6d0e983aa164e76b415b7
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Apr 3 12:48:12 2023 +0200

    x86emul: move various utility functions to separate source files
    
    Many are needed by the hypervisor only - have one file for this purpose.
    Some are also needed by the harness (but not the fuzzer) - have another
    file for these.
    
    Code moved gets slightly adjusted in a few places, e.g. replacing
    "state" by "s" (like was done for other that has been split off).
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Roger Pau Monné <roger.pau@citrix.com>

commit c80243f94386f64f85c5d92ef0bb19dc406eefc2
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Apr 3 12:47:08 2023 +0200

    x86emul: move x86_emul_blk() to separate source file
    
    The function is already non-trivial and is expected to further grow.
    
    Code moved gets slightly adjusted in a few places, e.g. replacing EXC_*
    by X86_EXC_* (such that EXC_* don't need to move as well; we want these
    to be phased out anyway).
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Roger Pau Monné <roger.pau@citrix.com>

commit 1939403104965b091feb7712430ec5d7645a8d30
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Apr 3 12:46:08 2023 +0200

    x86emul: split off insn decoding
    
    This is a fair chunk of code and data and can easily live separate from
    the main emulation function.
    
    Code moved gets slightly adjusted in a few places, e.g. replacing EXC_*
    by X86_EXC_* (such that EXC_* don't need to move as well; we want these
    to be phased out anyway).
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Roger Pau Monné <roger.pau@citrix.com>

commit 8f196c12eec7f90bcf31f86312b8fe5ee12b41be
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Apr 3 12:44:59 2023 +0200

    x86emul: split off FPU opcode handling
    
    Some of the helper functions/macros are needed only for this, and the
    code is otherwise relatively independent of other parts of the emulator.
    
    Code moved gets slightly adjusted in a few places, e.g. replacing EXC_*
    by X86_EXC_* (such that EXC_* don't need to move as well; we want these
    to be phased out anyway).
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Roger Pau Monné <roger.pau@citrix.com>

commit 0bae69c96b32963b535bb569d6b41f96a7d72617
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Apr 3 12:43:51 2023 +0200

    x86emul: split off opcode 0fc7 handling
    
    There's a fair amount of sub-cases (with some yet to be implemented), so
    a separate function seems warranted.
    
    Code moved gets slightly adjusted in a few places, e.g. replacing EXC_*
    by X86_EXC_* (such that EXC_* don't need to move as well; we want these
    to be phased out anyway).
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Roger Pau Monné <roger.pau@citrix.com>

commit 3e957de632532dc287ae4cd356fd8d7882d4f233
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Apr 3 12:42:44 2023 +0200

    x86emul: split off opcode 0fae handling
    
    There's a fair amount of sub-cases (with some yet to be implemented), so
    a separate function seems warranted.
    
    Code moved gets slightly adjusted in a few places, e.g. replacing EXC_*
    by X86_EXC_* (such that EXC_* don't need to move as well; we want these
    to be phased out anyway).
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Roger Pau Monné <roger.pau@citrix.com>

commit 9ace97ab9b87924477bbaea0a5a1378e106951cb
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Apr 3 12:41:08 2023 +0200

    x86emul: split off opcode 0f01 handling
    
    There's a fair amount of sub-cases (with some yet to be implemented), so
    a separate function seems warranted.
    
    Code moved gets slightly adjusted in a few places, e.g. replacing EXC_*
    by X86_EXC_* (such that EXC_* don't need to move as well; we want these
    to be phased out anyway).
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Roger Pau Monné <roger.pau@citrix.com>
(qemu changes not included)

