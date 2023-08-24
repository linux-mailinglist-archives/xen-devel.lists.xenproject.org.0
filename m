Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 534C07866F7
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 07:00:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589759.921786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ2Rr-0002iW-U7; Thu, 24 Aug 2023 04:59:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589759.921786; Thu, 24 Aug 2023 04:59:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ2Rr-0002gJ-R3; Thu, 24 Aug 2023 04:59:59 +0000
Received: by outflank-mailman (input) for mailman id 589759;
 Thu, 24 Aug 2023 04:59:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qZ2Rq-0002g9-2e; Thu, 24 Aug 2023 04:59:58 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qZ2Rp-0001Q6-OL; Thu, 24 Aug 2023 04:59:57 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qZ2Rp-0003Pr-Cb; Thu, 24 Aug 2023 04:59:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qZ2Rp-0003pz-C3; Thu, 24 Aug 2023 04:59:57 +0000
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
	bh=HkTvNrLYiTo7FEJ7QHdKJPQAgE67fq7I3/B1s7SzDUU=; b=o6hf0X+n7Va/gd0A5Vl1WGSicQ
	/HZkj7QCAUulaD9HfLIKa050/6eJ0cF9NSyvlI6XiN/fF8xMeJLU64KJxGtQEVHUOuVsm26o0/Otl
	fnTs1WvJN+ACytZtdcLnQ9fKsaW/WGK+QM+KPs0i0+e0K5TRpmWiwHpjO6ZEbSoceEjc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182452-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 182452: regressions - trouble: fail/pass/starved
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-xl-credit1:guest-start/debian.repeat:fail:regression
    linux-linus:test-amd64-amd64-dom0pvh-xl-intel:xen-boot:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-shadow:guest-saverestore.2:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-credit2:guest-start/debian.repeat:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:hosts-allocate:starved:nonblocking
    linux-linus:test-arm64-arm64-xl:hosts-allocate:starved:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:hosts-allocate:starved:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:hosts-allocate:starved:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:hosts-allocate:starved:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:hosts-allocate:starved:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:hosts-allocate:starved:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    linux=89bf6209cad66214d3774dac86b6bbf2aec6a30d
X-Osstest-Versions-That:
    linux=53663f4103ff6738e4697004d6f84864d052333d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 24 Aug 2023 04:59:57 +0000

flight 182452 linux-linus real [real]
flight 182496 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/182452/
http://logs.test-lab.xenproject.org/osstest/logs/182496/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-credit1 22 guest-start/debian.repeat fail REGR. vs. 182424

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-dom0pvh-xl-intel  8 xen-boot       fail pass in 182496-retest
 test-amd64-amd64-xl-shadow   19 guest-saverestore.2 fail pass in 182496-retest
 test-amd64-amd64-xl-credit2 22 guest-start/debian.repeat fail pass in 182496-retest

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 182424
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 182424
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 182424
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 182424
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 182424
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 182424
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 182424
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 182424
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-arm64-arm64-libvirt-raw  3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl           3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl-credit2   3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl-vhd       3 hosts-allocate               starved  n/a
 test-arm64-arm64-libvirt-xsm  3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl-credit1   3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl-xsm       3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl-thunderx  3 hosts-allocate               starved  n/a

version targeted for testing:
 linux                89bf6209cad66214d3774dac86b6bbf2aec6a30d
baseline version:
 linux                53663f4103ff6738e4697004d6f84864d052333d

Last test of basis   182424  2023-08-22 18:10:18 Z    1 days
Testing same since   182452  2023-08-23 10:10:33 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Linus Torvalds <torvalds@linux-foundation.org>
  Peng Fan <peng.fan@nxp.com>
  Rik van Riel <riel@surriel.com>
  Rob Herring <robh@kernel.org>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          starved 
 test-armhf-armhf-xl                                          pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 starved 
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      starved 
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-freebsd11-amd64                             pass    
 test-amd64-amd64-freebsd12-amd64                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  fail    
 test-arm64-arm64-xl-credit1                                  starved 
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  fail    
 test-arm64-arm64-xl-credit2                                  starved 
 test-armhf-armhf-xl-credit2                                  pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            fail    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-libvirt-qcow2                               pass    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 starved 
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   fail    
 test-arm64-arm64-xl-thunderx                                 starved 
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      starved 
 test-armhf-armhf-xl-vhd                                      pass    


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
commit 89bf6209cad66214d3774dac86b6bbf2aec6a30d
Merge: 53663f4103ff 7882541ca06d
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue Aug 22 11:16:23 2023 -0700

    Merge tag 'devicetree-fixes-for-6.5-2' of git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux
    
    Pull devicetree fixes from Rob Herring:
    
     - Fix DT node refcount when creating platform devices
    
     - Fix deadlock in changeset code due to printing with devtree_lock held
    
     - Fix unittest EXPECT strings for parse_phandle_with_args_map() test
    
     - Fix IMA kexec memblock freeing
    
    * tag 'devicetree-fixes-for-6.5-2' of git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux:
      of/platform: increase refcount of fwnode
      of: dynamic: Refactor action prints to not use "%pOF" inside devtree_lock
      of: unittest: Fix EXPECT for parse_phandle_with_args_map() test
      mm,ima,kexec,of: use memblock_free_late from ima_free_kexec_buffer

commit 7882541ca06d51a6c12d687827176c16d5e05f65
Author: Peng Fan <peng.fan@nxp.com>
Date:   Mon Aug 21 10:39:28 2023 +0800

    of/platform: increase refcount of fwnode
    
    commit 0f8e5651095b
    ("of/platform: Propagate firmware node by calling device_set_node()")
    use of_fwnode_handle to replace of_node_get, which introduces a side
    effect that the refcount is not increased. Then the out of tree
    jailhouse hypervisor enable/disable test will trigger kernel dump in
    of_overlay_remove, with the following sequence
    "
       of_changeset_revert(&overlay_changeset);
       of_changeset_destroy(&overlay_changeset);
       of_overlay_remove(&overlay_id);
    "
    
    So increase the refcount to avoid issues.
    
    This patch also release the refcount when releasing amba device to avoid
    refcount leakage.
    
    Fixes: 0f8e5651095b ("of/platform: Propagate firmware node by calling device_set_node()")
    Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
    Signed-off-by: Peng Fan <peng.fan@nxp.com>
    Link: https://lore.kernel.org/r/20230821023928.3324283-2-peng.fan@oss.nxp.com
    Signed-off-by: Rob Herring <robh@kernel.org>

commit 914d9d831e6126a6e7a92e27fcfaa250671be42c
Author: Rob Herring <robh@kernel.org>
Date:   Fri Aug 18 15:40:57 2023 -0500

    of: dynamic: Refactor action prints to not use "%pOF" inside devtree_lock
    
    While originally it was fine to format strings using "%pOF" while
    holding devtree_lock, this now causes a deadlock.  Lockdep reports:
    
        of_get_parent from of_fwnode_get_parent+0x18/0x24
        ^^^^^^^^^^^^^
        of_fwnode_get_parent from fwnode_count_parents+0xc/0x28
        fwnode_count_parents from fwnode_full_name_string+0x18/0xac
        fwnode_full_name_string from device_node_string+0x1a0/0x404
        device_node_string from pointer+0x3c0/0x534
        pointer from vsnprintf+0x248/0x36c
        vsnprintf from vprintk_store+0x130/0x3b4
    
    Fix this by moving the printing in __of_changeset_entry_apply() outside
    the lock. As the only difference in the multiple prints is the action
    name, use the existing "action_names" to refactor the prints into a
    single print.
    
    Fixes: a92eb7621b9fb2c2 ("lib/vsprintf: Make use of fwnode API to obtain node names and separators")
    Cc: stable@vger.kernel.org
    Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
    Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
    Link: https://lore.kernel.org/r/20230801-dt-changeset-fixes-v3-2-5f0410e007dd@kernel.org
    Signed-off-by: Rob Herring <robh@kernel.org>

commit 0aeae3788e28f64ccb95405d4dc8cd80637ffaea
Author: Rob Herring <robh@kernel.org>
Date:   Fri Aug 18 15:40:56 2023 -0500

    of: unittest: Fix EXPECT for parse_phandle_with_args_map() test
    
    Commit 12e17243d8a1 ("of: base: improve error msg in
    of_phandle_iterator_next()") added printing of the phandle value on
    error, but failed to update the unittest.
    
    Fixes: 12e17243d8a1 ("of: base: improve error msg in of_phandle_iterator_next()")
    Cc: stable@vger.kernel.org
    Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
    Link: https://lore.kernel.org/r/20230801-dt-changeset-fixes-v3-1-5f0410e007dd@kernel.org
    Signed-off-by: Rob Herring <robh@kernel.org>

commit f0362a253606e2031f8d61c74195d4d6556e12a4
Author: Rik van Riel <riel@surriel.com>
Date:   Thu Aug 17 13:57:59 2023 -0400

    mm,ima,kexec,of: use memblock_free_late from ima_free_kexec_buffer
    
    The code calling ima_free_kexec_buffer runs long after the memblock
    allocator has already been torn down, potentially resulting in a use
    after free in memblock_isolate_range.
    
    With KASAN or KFENCE, this use after free will result in a BUG
    from the idle task, and a subsequent kernel panic.
    
    Switch ima_free_kexec_buffer over to memblock_free_late to avoid
    that issue.
    
    Fixes: fee3ff99bc67 ("powerpc: Move arch independent ima kexec functions to drivers/of/kexec.c")
    Cc: stable@kernel.org
    Signed-off-by: Rik van Riel <riel@surriel.com>
    Suggested-by: Mike Rappoport <rppt@kernel.org>
    Link: https://lore.kernel.org/r/20230817135759.0888e5ef@imladris.surriel.com
    Signed-off-by: Rob Herring <robh@kernel.org>

