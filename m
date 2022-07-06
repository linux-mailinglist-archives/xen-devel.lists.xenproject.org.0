Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52314567C93
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 05:40:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361744.591401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8vtE-0004SV-UQ; Wed, 06 Jul 2022 03:39:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361744.591401; Wed, 06 Jul 2022 03:39:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8vtE-0004QW-RK; Wed, 06 Jul 2022 03:39:48 +0000
Received: by outflank-mailman (input) for mailman id 361744;
 Wed, 06 Jul 2022 03:39:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o8vtE-0004QM-1J; Wed, 06 Jul 2022 03:39:48 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o8vtD-0006rC-Uy; Wed, 06 Jul 2022 03:39:47 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o8vtD-0001qt-MK; Wed, 06 Jul 2022 03:39:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1o8vtD-0003iF-Lu; Wed, 06 Jul 2022 03:39:47 +0000
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
	bh=ji+uP1rzOY2LmtqlgcnhS6EhWIiKhAjDmAwSsYrfQnE=; b=sEC8/ARL3SaqYyA4XTTtFUSRL9
	UeSNLUFbjVBrQ5vNH4UaBZkcv1yHTFd/60eGi+4MtYwK9lDW0uXHDQsQnTHKXsWaMyFN89YFptAz8
	iIuFdvAKo5Pwt3HaEaMES7cWmRXRZuoRY36eQCHgYLiF6dRfyZwRN62jHgVTX10nlq8o=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171511-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 171511: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:xen-boot:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=61ff2733221e3b5bae5f647d9a460c7a68a5ace8
X-Osstest-Versions-That:
    xen=4df2e99d731402da48afb19dc970ccab5a0814d6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 06 Jul 2022 03:39:47 +0000

flight 171511 xen-unstable-smoke real [real]
flight 171517 xen-unstable-smoke real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/171511/
http://logs.test-lab.xenproject.org/osstest/logs/171517/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-arm64-arm64-xl-xsm       8 xen-boot                 fail REGR. vs. 171486

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  61ff2733221e3b5bae5f647d9a460c7a68a5ace8
baseline version:
 xen                  4df2e99d731402da48afb19dc970ccab5a0814d6

Last test of basis   171486  2022-07-04 13:00:25 Z    1 days
Failing since        171501  2022-07-05 12:03:08 Z    0 days    3 attempts
Testing same since   171506  2022-07-05 17:00:29 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Anthony PERARD <anthony.perard@citrix.com>
  Demi Marie Obenour <demi@invisiblethingslab.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Luca Fancellu <luca.fancellu@arm.com>
  Michal Orzel <michal.orzel@arm.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Wei Chen <wei.chen@arm.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-libvirt                                     pass    


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
commit 61ff2733221e3b5bae5f647d9a460c7a68a5ace8
Author: Michal Orzel <michal.orzel@arm.com>
Date:   Mon Jun 27 15:15:39 2022 +0200

    xen/common: Use unsigned int instead of plain unsigned
    
    This is just for the style and consistency reasons as the former is
    being used more often than the latter.
    
    Signed-off-by: Michal Orzel <michal.orzel@arm.com>
    Reviewed-by: Juergen Gross <jgross@suse.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 54d8f27d0477937e1f99a414fc1ffd93d184b38a
Author: Roger Pau Monne <roger.pau@citrix.com>
Date:   Fri Apr 8 10:21:11 2022 +0200

    tools/libxl: report trusted backend status to frontends
    
    Allow administrators to notify a frontend driver that it's backend
    counterpart is not to be trusted, so the frontend can deploy whatever
    mitigations required in order to secure itself.
    
    Allow such option for disk and network frontends only, as those are
    the only hardened ones currently supported.
    
    This is part of XSA-403
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

commit a4d4c541f58b378bc9d499dcb554eb9fe22312c8
Author: Wei Chen <wei.chen@arm.com>
Date:   Tue Jul 5 13:12:15 2022 +0200

    xen/arm32: avoid EFI stub wchar_t size linker warning
    
    Xen uses "-fshort-wchar" in CFLAGS for EFI common code. Arm32
    is using stub.c of EFI common code for EFI stub functions. But
    "-fshort-wchar" CFLAG will cause a warning when build stub.c
    for Arm32:
    "arm-linux-gnueabihf-ld: warning: arch/arm/efi/built_in.o uses
    2-byte wchar_t yet the output is to use 4-byte wchar_t; use of
    wchar_t values across objects may fail"
    
    This is because the "-fshort-wchar" flag causes GCC to generate
    code that is not binary compatible with code generated without
    that flag. Why this warning hasn't been triggered in Arm64 is
    because Arm64 does not use wchar type directly in any code for
    parameters, variables and return values. And in EFI code, wchar
    has been replaced by CHAR16 (the UEFI "abstraction" of wchar_t).
    CHAR16 has been specified as unsigned short type in typedef, the
    "-fshort-wchar" flag will not affect CHAR16. So Arm64 object
    files are exactly the same with "-fshort-wchar" and without
    "-fshort-wchar".
    
    We are also not using wchar in Arm32 codes, but Arm32 will embed
    ABI information in ".ARM.attributes" section. This section stores
    some object file attributes, like ABI version, CPU arch and etc.
    And wchar size is described in this section by "Tag_ABI_PCS_wchar_t"
    too. Tag_ABI_PCS_wchar_t is 2 for object files with "-fshort-wchar",
    but for object files without "-fshort-wchar" is 4. Arm32 GCC
    ld will check this tag, and throw above warning when it finds
    the object files have different Tag_ABI_PCS_wchar_t values.
    
    Xen need to keep "-fshort-wchar" in EFI code to force wchar to use
    short integers (2 bytes) instead of integers (4 bytes), but this is
    unnecessary for code out of EFI. So in this patch, we add
    "-fno-short-wchar" to override "-fshort-wchar" for Arm architectures
    without EFI enabled to remove above warning."
    
    Reported-and-Suggested-by: Jan Beulich <jbeulich@suse.com>
    Tested-by: Jan Beulich <jbeulich@suse.com>
    Signed-off-by: Wei Chen <wei.chen@arm.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit c4184bf305dc14c3e150617904c40b120664efe6
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Jul 5 13:11:51 2022 +0200

    public: constify xsd_errors[]
    
    While in principle this could break existing users, I think such users
    deserve to be put in trouble. After all the table should have been const
    from the very beginning.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Juergen Gross <jgross@suse.com>

commit 2b1ee386122a6e8bf66f5163cbda51084af6e0f4
Author: Luca Fancellu <luca.fancellu@arm.com>
Date:   Tue Jul 5 13:11:25 2022 +0200

    tools/helpers: fix snprintf argument in init-dom0less.c
    
    Fix snprintf argument in init-dom0less.c because two instances of
    the function are using libxl_dominfo struct members that are uint64_t
    types, so change "%lu" to "%"PRIu64 to handle it properly when
    building on arm32 and arm64.
    
    Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
    Acked-by: Anthony PERARD <anthony.perard@citrix.com>

commit 8d410ac2c178e1dd1001cadddbe9ca75a9738c95
Author: Demi Marie Obenour <demi@invisiblethingslab.com>
Date:   Tue Jul 5 13:10:46 2022 +0200

    EFI: preserve the System Resource Table for dom0
    
    The EFI System Resource Table (ESRT) is necessary for fwupd to identify
    firmware updates to install.  According to the UEFI specification §23.4,
    the ESRT shall be stored in memory of type EfiBootServicesData.  However,
    memory of type EfiBootServicesData is considered general-purpose memory
    by Xen, so the ESRT needs to be moved somewhere where Xen will not
    overwrite it.  Copy the ESRT to memory of type EfiRuntimeServicesData,
    which Xen will not reuse.  dom0 can use the ESRT if (and only if) it is
    in memory of type EfiRuntimeServicesData.
    
    Earlier versions of this patch reserved the memory in which the ESRT was
    located.  This created awkward alignment problems, and required either
    splitting the E820 table or wasting memory.  It also would have required
    a new platform op for dom0 to use to indicate if the ESRT is reserved.
    By copying the ESRT into EfiRuntimeServicesData memory, the E820 table
    does not need to be modified, and dom0 can just check the type of the
    memory region containing the ESRT.  The copy is only done if the ESRT is
    not already in EfiRuntimeServicesData memory, avoiding memory leaks on
    repeated kexec.
    
    See https://lore.kernel.org/xen-devel/20200818184018.GN1679@mail-itl/T/
    for details.
    
    Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
(qemu changes not included)

