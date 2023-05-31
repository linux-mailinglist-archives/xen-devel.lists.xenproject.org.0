Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFCC71892B
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 20:14:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541931.845216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4QL8-0007jy-5n; Wed, 31 May 2023 18:14:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541931.845216; Wed, 31 May 2023 18:14:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4QL8-0007hn-36; Wed, 31 May 2023 18:14:30 +0000
Received: by outflank-mailman (input) for mailman id 541931;
 Wed, 31 May 2023 18:14:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q4QL6-0007hd-2O; Wed, 31 May 2023 18:14:28 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q4QL5-0003kC-Sg; Wed, 31 May 2023 18:14:27 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q4QL5-0005MW-Dz; Wed, 31 May 2023 18:14:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q4QL5-0002Bz-DZ; Wed, 31 May 2023 18:14:27 +0000
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
	bh=nc0/cEN31Df9u0VnJzrkoowJpASosrl+FAMTxE9wJ90=; b=aoW+y+r0qvWndhUcjWjivjsBSk
	+v4fMRBTtuRdPGjPMZd6TK9zA8sY4hcaXd9uwWex2IySNsNo6luFngYdLpOVqSxBU1Rqd5oF90QGg
	YeOiDy1l2TCZkiWHLFQ8AYNkwOlOUnrzA8pjBrgf4bUD1jA+B3vraFS1GjstsKugSWqM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181044-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 181044: regressions - trouble: blocked/broken/pass
X-Osstest-Failures:
    xen-unstable-smoke:build-armhf:<job status>:broken:regression
    xen-unstable-smoke:build-armhf:host-build-prep:fail:regression
    xen-unstable-smoke:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=04f25e9048c375898430a58e1c570806896252cb
X-Osstest-Versions-That:
    xen=94200e1bae07e725cc07238c11569c5cab7befb7
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 31 May 2023 18:14:27 +0000

flight 181044 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181044/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-armhf                     <job status>                 broken
 build-armhf                   5 host-build-prep          fail REGR. vs. 181018

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  04f25e9048c375898430a58e1c570806896252cb
baseline version:
 xen                  94200e1bae07e725cc07238c11569c5cab7befb7

Last test of basis   181018  2023-05-30 20:00:24 Z    0 days
Failing since        181031  2023-05-31 11:00:27 Z    0 days    3 attempts
Testing same since   181044  2023-05-31 16:01:57 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bobby Eshleman <bobbyeshleman@gmail.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Oleksii Kurochko <oleksii.kurochko@gmail.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  broken  
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          blocked 
 test-arm64-arm64-xl-xsm                                      pass    
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

broken-job build-armhf broken

Not pushing.

------------------------------------------------------------
commit 04f25e9048c375898430a58e1c570806896252cb
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed May 31 16:04:30 2023 +0200

    vPCI: fix test harness build
    
    The earlier commit introduced two uses of is_hardware_domain().
    
    Fixes: 465217b0f872 ("vPCI: account for hidden devices")
    Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Roger Pau Monné <roger.pau@citrix.com>

commit 7a2f0ba0d08562fc09c6dd865c6cb3468185be1f
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed May 31 16:04:12 2023 +0200

    vPCI: add test harness entry to ./MAINTAINERS
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Roger Pau Monné <roger.pau@citrix.com>

commit 465217b0f872602b4084a1b0fa2ef75377cb3589
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed May 31 12:01:11 2023 +0200

    vPCI: account for hidden devices
    
    Hidden devices (e.g. an add-in PCI serial card used for Xen's serial
    console) are associated with DomXEN, not Dom0. This means that while
    looking for overlapping BARs such devices cannot be found on Dom0's list
    of devices; DomXEN's list also needs to be scanned.
    
    Suppress vPCI init altogether for r/o devices (which constitute a subset
    of hidden ones).
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    Tested-by: Stefano Stabellini <sstabellini@kernel.org>

commit 445fdc641e304ff41a544f8f5926a13b604c08ad
Author: Juergen Gross <jgross@suse.com>
Date:   Wed May 31 12:00:40 2023 +0200

    xen/include/public: fix 9pfs xenstore path description
    
    In xen/include/public/io/9pfs.h the name of the Xenstore backend node
    "security-model" should be "security_model", as this is how the Xen
    tools are creating it and qemu is reading it.
    
    Fixes: ad58142e73a9 ("xen/public: move xenstore related doc into 9pfs.h")
    Fixes: cf1d2d22fdfd ("docs/misc: Xen transport for 9pfs")
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
    Acked-by: Stefano Stabellini <sstabellini@kernel.org>

commit 0f80a46ffa6bfd5d111fc2e64ee5983513627e4d
Author: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Date:   Wed May 31 12:00:13 2023 +0200

    xen/riscv: remove dummy_bss variable
    
    After introduction of initial pagetables there is no any sense
    in dummy_bss variable as bss section will not be empty anymore.
    
    Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
    Acked-by: Bobby Eshleman <bobbyeshleman@gmail.com>

commit 0d74fc2b2f85586ceb5672aedc79c666e529381d
Author: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Date:   Wed May 31 12:00:05 2023 +0200

    xen/riscv: setup initial pagetables
    
    The patch does two thing:
    1. Setup initial pagetables.
    2. Enable MMU which end up with code in
       cont_after_mmu_is_enabled()
    
    Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
    Acked-by: Bobby Eshleman <bobbyeshleman@gmail.com>

commit ec337ce2e972b70619f5a076b20910a2ff4fea7a
Author: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Date:   Wed May 31 11:59:53 2023 +0200

    xen/riscv: align __bss_start
    
    bss clear cycle requires proper alignment of __bss_start.
    
    ALIGN(PAGE_SIZE) before "*(.bss.page_aligned)" in xen.lds.S
    was removed as any contribution to "*(.bss.page_aligned)" have to
    specify proper aligntment themselves.
    
    Fixes: cfa0409f7cbb ("xen/riscv: initialize .bss section")
    Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Bobby Eshleman <bobbyeshleman@gmail.com>

commit e66003e7be1996c9dd8daca54ba34ad5bb58d668
Author: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Date:   Wed May 31 11:55:58 2023 +0200

    xen/riscv: introduce setup_initial_pages
    
    The idea was taken from xvisor but the following changes
    were done:
    * Use only a minimal part of the code enough to enable MMU
    * rename {_}setup_initial_pagetables functions
    * add an argument for setup_initial_mapping to have
      an opportunity to make set PTE flags.
    * update setup_initial_pagetables function to map sections
      with correct PTE flags.
    * Rewrite enable_mmu() to C.
    * map linker addresses range to load addresses range without
      1:1 mapping. It will be 1:1 only in case when
      load_start_addr is equal to linker_start_addr.
    * add safety checks such as:
      * Xen size is less than page size
      * linker addresses range doesn't overlap load addresses
        range
    * Rework macros {THIRD,SECOND,FIRST,ZEROETH}_{SHIFT,MASK}
    * change PTE_LEAF_DEFAULT to RW instead of RWX.
    * Remove phys_offset as it is not used now
    * Remove alignment  of {map, pa}_start &= XEN_PT_LEVEL_MAP_MASK(0);
      in  setup_inital_mapping() as they should be already aligned.
      Make a check that {map_pa}_start are aligned.
    * Remove clear_pagetables() as initial pagetables will be
      zeroed during bss initialization
    * Remove __attribute__((section(".entry")) for setup_initial_pagetables()
      as there is no such section in xen.lds.S
    * Update the argument of pte_is_valid() to "const pte_t *p"
    * Add check that Xen's load address is aligned at 4k boundary
    * Refactor setup_initial_pagetables() so it is mapping linker
      address range to load address range. After setup needed
      permissions for specific section ( such as .text, .rodata, etc )
      otherwise RW permission will be set by default.
    * Add function to check that requested SATP_MODE is supported
    
    Origin: git@github.com:xvisor/xvisor.git 9be2fdd7
    Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Bobby Eshleman <bobbyeshleman@gmail.com>

commit efadb18dd58abaa0c6102e04f1c25ac94c273853
Author: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Date:   Wed May 31 11:55:46 2023 +0200

    xen/riscv: add VM space layout
    
    Also it was added explanation about ignoring of top VA bits
    
    Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
    Acked-by: Bobby Eshleman <bobbyeshleman@gmail.com>
(qemu changes not included)

