Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4117278283A
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 13:51:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587566.918944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY3Qb-0002sV-0q; Mon, 21 Aug 2023 11:50:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587566.918944; Mon, 21 Aug 2023 11:50:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY3Qa-0002qq-TQ; Mon, 21 Aug 2023 11:50:36 +0000
Received: by outflank-mailman (input) for mailman id 587566;
 Mon, 21 Aug 2023 11:50:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qY3QZ-0002qg-Ir; Mon, 21 Aug 2023 11:50:35 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qY3QZ-0004uS-3M; Mon, 21 Aug 2023 11:50:35 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qY3QY-0004M7-Jr; Mon, 21 Aug 2023 11:50:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qY3QY-0003uj-JG; Mon, 21 Aug 2023 11:50:34 +0000
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
	bh=h7rDDzohI+3Ki4XYZ1CSxL5ZHsH1u1RJdBdEkdSS+aM=; b=yRN1wphZ2EJ3C1+RKsXrAhL9CJ
	YZnBs6w0vvpAZz38gbgDzC0HDIEAni/ZUWPP4WKhingfldpNhtmQjyIzpilvd1ra6gf92W95D6co7
	Re0+N8KazJKOSpfc9H3vYwlAnWCUzFy4HPw271mDmWx/sb8fA+rseCuNsxc87KDMmGZ8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182408-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 182408: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-amd64:guest-localmigrate/x10:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:guest-start.2:fail:regression
    linux-linus:build-arm64-pvops:kernel-build:fail:regression
    linux-linus:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-examine:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
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
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=f7757129e3dea336c407551c98f50057c22bb266
X-Osstest-Versions-That:
    linux=706a741595047797872e669b3101429ab8d378ef
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 21 Aug 2023 11:50:34 +0000

flight 182408 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182408/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemut-debianhvm-amd64 18 guest-localmigrate/x10 fail REGR. vs. 182405
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 21 guest-start.2 fail REGR. vs. 182405
 build-arm64-pvops             6 kernel-build             fail REGR. vs. 182405

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-credit1   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-vhd       1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-arm64-arm64-examine      1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 182405
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 182405
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 182405
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 182405
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 182405
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 182405
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 182405
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 182405
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
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
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass

version targeted for testing:
 linux                f7757129e3dea336c407551c98f50057c22bb266
baseline version:
 linux                706a741595047797872e669b3101429ab8d378ef

Last test of basis   182405  2023-08-20 18:11:48 Z    0 days
Testing same since   182408  2023-08-21 05:42:03 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Herbert Xu <herbert@gondor.apana.org.au>
  Linus Torvalds <torvalds@linux-foundation.org>
  Pavel Skripkin <paskripkin@gmail.com>

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
 build-arm64-pvops                                            fail    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          blocked 
 test-armhf-armhf-xl                                          pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        fail    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      blocked 
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    fail    
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
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  blocked 
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  blocked 
 test-armhf-armhf-xl-credit2                                  pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     blocked 
 test-armhf-armhf-examine                                     pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
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
 test-arm64-arm64-libvirt-raw                                 blocked 
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 blocked 
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      blocked 
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
commit f7757129e3dea336c407551c98f50057c22bb266
Merge: 4542057e18ca 080aa61e370b
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon Aug 21 07:02:21 2023 +0200

    Merge tag 'v6.5-p3' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6
    
    Pull crypto fixes from Herbert Xu:
     "Fix a regression in the caam driver and af_alg"
    
    * tag 'v6.5-p3' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6:
      crypto: fix uninit-value in af_alg_free_resources
      Revert "crypto: caam - adjust RNG timing to support more devices"

commit 4542057e18caebe5ebaee28f0438878098674504
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon Aug 21 06:11:33 2023 +0200

    mm: avoid 'might_sleep()' in get_mmap_lock_carefully()
    
    This might_sleep() goes back a long time: it was originally introduced
    way back when by commit 010060741ad3 ("x86: add might_sleep() to
    do_page_fault()"), and made it into the generic VM code when the x86
    fault path got re-organized and generalized in commit c2508ec5a58d ("mm:
    introduce new 'lock_mm_and_find_vma()' page fault helper").
    
    However, it turns out that the placement of that might_sleep() has
    always been rather questionable simply because it's not only a debug
    statement to warn about sleeping in contexts that shouldn't sleep (which
    was the original reason for adding it), but it also implies a voluntary
    scheduling point.
    
    That, in turn, is less than desirable for two reasons:
    
     (a) it ends up being done after we successfully got the mmap_lock, so
         just as we got the lock we will now eagerly schedule away and
         increase lock contention
    
    and
    
     (b) this is all very possibly part of the "oops, things went horribly
         wrong" path and we just haven't figured that out yet
    
    After all, the whole _reason_ for having that get_mmap_lock_carefully()
    rather than just doing the obvious mmap_read_lock() is because this code
    wants to deal somewhat gracefully with potential kernel wild pointer
    bugs.
    
    So then a voluntary scheduling point here is simply not a good idea.
    
    We could certainly turn the 'might_sleep()' into a '__might_sleep()' and
    make it be just the debug check that it was originally intended to be.
    
    But even that seems questionable in the wild kernel pointer case - which
    again is part of the whole point of this code.  The problem wouldn't be
    about the _sleeping_ part of the page fault, but about a bad kernel
    access.  The fact that that bad kernel access might happen in a section
    that you shouldn't sleep in is secondary.
    
    So it really ends up being the case that this is simply entirely the
    wrong place to do this debug check and related scheduling point at all.
    
    So let's just remove the check entirely.  It's been around for over a
    decade, it has served its purpose.
    
    The re-schedule will happen at return to user space anyway for the
    normal case, and the warning - if we even need it - might be better off
    done as a special case for "page fault from kernel mode" once we've
    dealt with any potential kernel oopses where the oops is the relevant
    thing, not some artificial "scheduling while atomic" test.
    
    Reported-by: Mateusz Guzik <mjguzik@gmail.com>
    Link: https://lore.kernel.org/lkml/20230820104303.2083444-1-mjguzik@gmail.com/
    Cc: Matthew Wilcox <willy@infradead.org>
    Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>

commit 080aa61e370b9c5cafe71cacadbfe0e72db4d6df
Author: Pavel Skripkin <paskripkin@gmail.com>
Date:   Mon Aug 14 21:03:41 2023 +0300

    crypto: fix uninit-value in af_alg_free_resources
    
    Syzbot was able to trigger use of uninitialized memory in
    af_alg_free_resources.
    
    Bug is caused by missing initialization of rsgl->sgl.need_unpin before
    adding to rsgl_list. Then in case of extract_iter_to_sg() failure, rsgl
    is left with uninitialized need_unpin which is read during clean up
    
    BUG: KMSAN: uninit-value in af_alg_free_sg crypto/af_alg.c:545 [inline]
    BUG: KMSAN: uninit-value in af_alg_free_areq_sgls crypto/af_alg.c:778 [inline]
    BUG: KMSAN: uninit-value in af_alg_free_resources+0x3d1/0xf60 crypto/af_alg.c:1117
     af_alg_free_sg crypto/af_alg.c:545 [inline]
     af_alg_free_areq_sgls crypto/af_alg.c:778 [inline]
     af_alg_free_resources+0x3d1/0xf60 crypto/af_alg.c:1117
     _skcipher_recvmsg crypto/algif_skcipher.c:144 [inline]
    ...
    
    Uninit was created at:
     slab_post_alloc_hook+0x12f/0xb70 mm/slab.h:767
     slab_alloc_node mm/slub.c:3470 [inline]
     __kmem_cache_alloc_node+0x536/0x8d0 mm/slub.c:3509
     __do_kmalloc_node mm/slab_common.c:984 [inline]
     __kmalloc+0x121/0x3c0 mm/slab_common.c:998
     kmalloc include/linux/slab.h:586 [inline]
     sock_kmalloc+0x128/0x1c0 net/core/sock.c:2683
     af_alg_alloc_areq+0x41/0x2a0 crypto/af_alg.c:1188
     _skcipher_recvmsg crypto/algif_skcipher.c:71 [inline]
    
    Fixes: c1abe6f570af ("crypto: af_alg: Use extract_iter_to_sg() to create scatterlists")
    Reported-and-tested-by: syzbot+cba21d50095623218389@syzkaller.appspotmail.com
    Closes: https://syzkaller.appspot.com/bug?extid=cba21d50095623218389
    Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
    Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

commit 83874b8e97f895e62d9ab03223318176d5e78203
Author: Herbert Xu <herbert@gondor.apana.org.au>
Date:   Fri Aug 18 16:47:02 2023 +0800

    Revert "crypto: caam - adjust RNG timing to support more devices"
    
    This reverts commit ef492d080302913e85122a2d92efa2ca174930f8.
    
    This patch breaks the RNG on i.MX8MM.
    
    Reported-by: Bastian Krause <bst@pengutronix.de>
    Link: https://lore.kernel.org/all/e1f3f073-9d5e-1bae-f4f8-08dc48adad62@pengutronix.de/
    Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

