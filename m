Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA06716934
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 18:25:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541277.843872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q429W-0005eV-Cj; Tue, 30 May 2023 16:24:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541277.843872; Tue, 30 May 2023 16:24:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q429W-0005be-9D; Tue, 30 May 2023 16:24:54 +0000
Received: by outflank-mailman (input) for mailman id 541277;
 Tue, 30 May 2023 16:24:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q429U-0005ZI-Im; Tue, 30 May 2023 16:24:52 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q429U-0004cH-EV; Tue, 30 May 2023 16:24:52 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q429U-0001v0-0y; Tue, 30 May 2023 16:24:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q429U-0005Uj-0W; Tue, 30 May 2023 16:24:52 +0000
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
	bh=9i62zlCseA50x7E0mxAViWkBfsOahj2xaYLsj5R5gxk=; b=5NlgHo0I9MFya4s9lUQeBHukc8
	RAVs54Fg5Aue760o3NLyP1DGP90xvwayfLMz9Xq2mIha63V96XVX4jrAp0ZzCY5FoZkdwHkgGK16U
	fIAggarbjGAHwFyqSRLBY+hL4gcMIa0M1eFl8TUv7rCVMBN3jpjEsEyYPJuC8XZTgBEI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181014-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 181014: trouble: broken/pass
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:<job status>:broken:regression
    xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:host-install(5):broken:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=05422d276b56f2ebc2309a84a66fc5722c45ad74
X-Osstest-Versions-That:
    xen=f54dd5b53ee516fa1d4c106e0744ce0083acfcdc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 30 May 2023 16:24:52 +0000

flight 181014 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181014/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-debianhvm-amd64    <job status>               broken
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 5 host-install(5) broken REGR. vs. 180963

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  05422d276b56f2ebc2309a84a66fc5722c45ad74
baseline version:
 xen                  f54dd5b53ee516fa1d4c106e0744ce0083acfcdc

Last test of basis   180963  2023-05-26 13:01:58 Z    4 days
Testing same since   181014  2023-05-30 11:02:30 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Anthony PERARD <anthony.perard@citrix.com>
  Cyril Rébert <slack@rabbit.lu>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Luca Fancellu <luca.fancellu@arm.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stewart Hildebrand <stewart.hildebrand@amd.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    broken  
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

broken-job test-amd64-amd64-xl-qemuu-debianhvm-amd64 broken
broken-step test-amd64-amd64-xl-qemuu-debianhvm-amd64 host-install(5)

Not pushing.

------------------------------------------------------------
commit 05422d276b56f2ebc2309a84a66fc5722c45ad74
Author: Anthony PERARD <anthony.perard@citrix.com>
Date:   Tue May 30 12:12:59 2023 +0200

    build: adjust compile.h compiler version command line
    
    CFLAGS is just from Config.mk, drop its use. Don't even bother to
    instead use the flags used to build Xen.
    
    Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 352c917acfe1dd6afc2eee44aa4ab7c50d4bc48a
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue May 30 12:00:34 2023 +0200

    x86/vPIC: register only one ELCR handler instance
    
    There's no point consuming two port-I/O slots. Even less so considering
    that some real hardware permits both ports to be accessed in one go,
    emulating of which requires there to be only a single instance.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

commit 647377ea06b86d7356f5975e4780b9a6a81c188e
Author: Stewart Hildebrand <stewart.hildebrand@amd.com>
Date:   Tue May 30 11:59:33 2023 +0200

    xen/arm: un-break build with clang
    
    clang doesn't like extern with __attribute__((__used__)):
    
      ./arch/arm/include/asm/setup.h:171:8: error: 'used' attribute ignored [-Werror,-Wignored-attributes]
      extern DEFINE_BOOT_PAGE_TABLE(boot_pgtable);
             ^
      ./arch/arm/include/asm/lpae.h:273:29: note: expanded from macro 'DEFINE_BOOT_PAGE_TABLE'
      lpae_t __aligned(PAGE_SIZE) __section(".data.page_aligned")                   \$
                                  ^
      ./include/xen/compiler.h:71:27: note: expanded from macro '__section'
      #define __section(s)      __used __attribute__((__section__(s)))
                                ^
      ./include/xen/compiler.h:104:39: note: expanded from macro '__used'
      #define __used         __attribute__((__used__))
                                            ^
    
    Simplify the declarations by getting rid of the macro (and thus the
    __aligned/__section/__used attributes) in the header. No functional change
    intended as the macro/attributes are present in the respective definitions in
    xen/arch/arm/mm.c.
    
    Fixes: 1c78d76b67e1 ("xen/arm64: mm: Introduce helpers to prepare/enable/disable the identity mapping")
    Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit 2a8a1681505d67dae5d3964f98cc1b1daf8e43f3
Author: Cyril Rébert <slack@rabbit.lu>
Date:   Tue May 30 11:57:42 2023 +0200

    tools/xenstore: remove deprecated parameter from xenstore commands help
    
    Completing commit c65687e ("tools/xenstore: remove socket-only option from xenstore client").
    As the socket-only option (-s) has been removed from the Xenstore access commands (xenstore-*),
    also remove the parameter from the commands help (xenstore-* -h).
    
    Suggested-by: Yann Dirson <yann.dirson@vates.fr>
    Signed-off-by: Cyril Rébert <slack@rabbit.lu>
    Reviewed-by: Juergen Gross <jgross@suse.com>

commit ca045140d90c7892ec0664cdb2ef3e16c97eb0b6
Author: Luca Fancellu <luca.fancellu@arm.com>
Date:   Tue May 30 11:57:17 2023 +0200

    xen/misra: xen-analysis.py: Fix cppcheck report relative paths
    
    Fix the generation of the relative path from the repo, for cppcheck
    reports, when the script is launching make with in-tree build.
    
    Fixes: b046f7e37489 ("xen/misra: xen-analysis.py: use the relative path from the ...")
    Reported-by: Michal Orzel <michal.orzel@amd.com>
    Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
    Acked-by: Stefano Stabellini <sstabellini@kernel.org>
    Tested-by: Stefano Stabellini <sstabellini@kernel.org>

commit 8bd504290bc3e5fb4d04150f96a36783407661b4
Author: Luca Fancellu <luca.fancellu@arm.com>
Date:   Tue May 30 11:57:02 2023 +0200

    xen/misra: xen-analysis.py: Fix latent bug
    
    Currenly there is a latent bug that is not triggered because
    the function cppcheck_merge_txt_fragments is called with the
    parameter strip_paths having a list of only one element.
    
    The bug is that the split function should not be in the
    loop for strip_paths, but one level before, fix it.
    
    Fixes: 02b26c02c7c4 ("xen/scripts: add cppcheck tool to the xen-analysis.py script")
    Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
    Acked-by: Stefano Stabellini <sstabellini@kernel.org>
    Tested-by: Stefano Stabellini <sstabellini@kernel.org>

commit e56f2106b6727223bd7de03e20fedd1f94da655d
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue May 30 11:56:22 2023 +0200

    VMX/cpu-policy: disable RDTSCP and INVPCID insns as needed
    
    When either feature is available in hardware, but disabled for a guest,
    the respective insn would better cause #UD if attempted to be used.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Kevin Tian <kevin.tian@intel.com>

commit 233a8f20cfbe999505c7b07b359f03fc04111008
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue May 30 11:54:55 2023 +0200

    VMX/cpu-policy: check availability of RDTSCP and INVPCID
    
    Both have separate enable bits, which are optional. While on real
    hardware we can perhaps expect these VMX controls to be available if
    (and only if) the base CPU feature is available, when running
    virtualized ourselves this may not be the case.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Kevin Tian <kevin.tian@intel.com>
(qemu changes not included)

