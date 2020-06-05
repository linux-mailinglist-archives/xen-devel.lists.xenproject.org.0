Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF431F02E8
	for <lists+xen-devel@lfdr.de>; Sat,  6 Jun 2020 00:32:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhKsV-0007sC-MU; Fri, 05 Jun 2020 22:31:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vDJQ=7S=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jhKsT-0007s6-Uj
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 22:31:54 +0000
X-Inumbo-ID: 56d87582-a77c-11ea-96fb-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 56d87582-a77c-11ea-96fb-bc764e2007e4;
 Fri, 05 Jun 2020 22:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y88DBPcxMZB+qb/MnqUHcF+BDWadVXhUEaI03dtYtEw=; b=phLbY1Xd5HfJrUWR/wLReMTUu
 oY2YnlHWliX2tA04oLm52TOCk5bEuI0mS51tTH3ShR9axXgJGIFBaYTqG/gaS9c/49nVW7xGhHjsQ
 jx854/IE4gAmjJ8YPfAb/GhIILkQOJzfHiw5pT0h3hcI2WoQuoFu9L9TGy3ie9pSo6Ts0=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jhKsL-00010C-Jx; Fri, 05 Jun 2020 22:31:45 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jhKsL-0006gI-13; Fri, 05 Jun 2020 22:31:45 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jhKsL-0006Te-01; Fri, 05 Jun 2020 22:31:45 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150831-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 150831: regressions - FAIL
X-Osstest-Failures: qemu-mainline:test-armhf-armhf-xl-arndale:xen-boot:fail:regression
 qemu-mainline:test-armhf-armhf-xl-vhd:guest-start:fail:regression
 qemu-mainline:test-amd64-amd64-xl-rtds:guest-localmigrate/x10:fail:nonblocking
 qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 qemu-mainline:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 qemu-mainline:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 qemu-mainline:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This: qemuu=b489f015fbe2bd59d409211f79ea0a8ac5d2a66d
X-Osstest-Versions-That: qemuu=66234fee9c2d37bfbc523aa8d0ae5300a14cc10e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 05 Jun 2020 22:31:45 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
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

flight 150831 qemu-mainline real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150831/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl-arndale   7 xen-boot                 fail REGR. vs. 150694
 test-armhf-armhf-xl-vhd      11 guest-start              fail REGR. vs. 150694

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-rtds     18 guest-localmigrate/x10       fail  like 150694
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 150694
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 150694
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 150694
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 150694
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 150694
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass

version targeted for testing:
 qemuu                b489f015fbe2bd59d409211f79ea0a8ac5d2a66d
baseline version:
 qemuu                66234fee9c2d37bfbc523aa8d0ae5300a14cc10e

Last test of basis   150694  2020-06-04 11:44:20 Z    1 days
Testing same since   150831  2020-06-05 13:06:20 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alexander Bulekov <alxndr@bu.edu>
  Kevin Wolf <kwolf@redhat.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Peter Maydell <peter.maydell@linaro.org>
  Philippe Mathieu-Daudé <philmd@redhat.com>
  Stefan Hajnoczi <stefanha@redhat.com>
  Stefano Garzarella <sgarzare@redhat.com>
  Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

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
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-armhf-armhf-xl-arndale                                  fail    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-amd64-pvgrub                                pass    
 test-amd64-amd64-i386-pvgrub                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-xl-raw                                       pass    
 test-amd64-amd64-xl-rtds                                     fail    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-xl-vhd                                      fail    


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
commit b489f015fbe2bd59d409211f79ea0a8ac5d2a66d
Merge: 66234fee9c 7d2410cea1
Author: Peter Maydell <peter.maydell@linaro.org>
Date:   Fri Jun 5 11:53:37 2020 +0100

    Merge remote-tracking branch 'remotes/stefanha/tags/block-pull-request' into staging
    
    Pull request
    
    # gpg: Signature made Fri 05 Jun 2020 10:47:27 BST
    # gpg:                using RSA key 8695A8BFD3F97CDAAC35775A9CA4ABB381AB73C8
    # gpg: Good signature from "Stefan Hajnoczi <stefanha@redhat.com>" [full]
    # gpg:                 aka "Stefan Hajnoczi <stefanha@gmail.com>" [full]
    # Primary key fingerprint: 8695 A8BF D3F9 7CDA AC35  775A 9CA4 ABB3 81AB 73C8
    
    * remotes/stefanha/tags/block-pull-request:
      block: Factor out bdrv_run_co()
      exec: Rename qemu_ram_writeback() as qemu_ram_msync()
      hw/block: Let the NVMe emulated device be target-agnostic
      memory: Extract memory_region_msync() from memory_region_writeback()
      memory: Rename memory_region_do_writeback -> memory_region_writeback
      fuzz: run the main-loop in fork-server process
      fuzz: add mangled object name to linker script
      fuzz: fix typo in i440fx-qtest-reboot arguments
      fuzz: add datadir for oss-fuzz compatability
      io_uring: use io_uring_cq_ready() to check for ready cqes
      io_uring: retry io_uring_submit() if it fails with errno=EINTR
    
    Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

commit 7d2410cea154bf915fb30179ebda3b17ac36e70e
Author: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Date:   Wed May 20 17:49:01 2020 +0300

    block: Factor out bdrv_run_co()
    
    We have a few bdrv_*() functions that can either spawn a new coroutine
    and wait for it with BDRV_POLL_WHILE() or use a fastpath if they are
    alreeady running in a coroutine. All of them duplicate basically the
    same code.
    
    Factor the common code into a new function bdrv_run_co().
    
    Signed-off-by: Kevin Wolf <kwolf@redhat.com>
    Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
    Message-id: 20200520144901.16589-1-vsementsov@virtuozzo.com
       [Factor out bdrv_run_co_entry too]
    Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

commit ab7e41e6679224e5ad8da6d70ed7e645a5a482ab
Author: Philippe Mathieu-Daudé <philmd@redhat.com>
Date:   Fri May 8 08:24:56 2020 +0200

    exec: Rename qemu_ram_writeback() as qemu_ram_msync()
    
    Rename qemu_ram_writeback() as qemu_ram_msync() to better
    match what it does.
    
    Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
    Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
    Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
    Acked-by: Paolo Bonzini <pbonzini@redhat.com>
    Message-id: 20200508062456.23344-5-philmd@redhat.com
    Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

commit bc2a2364b8050632a3b3de07f30d88b7f0734845
Author: Philippe Mathieu-Daudé <philmd@redhat.com>
Date:   Fri May 8 08:24:55 2020 +0200

    hw/block: Let the NVMe emulated device be target-agnostic
    
    Now than the non-target specific memory_region_msync() function
    is available, use it to make this device target-agnostic.
    
    Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
    Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
    Acked-by: Paolo Bonzini <pbonzini@redhat.com>
    Message-id: 20200508062456.23344-4-philmd@redhat.com
    Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

commit 9ecc996a3d39bdbf64a488936f97a9496b74ebd8
Author: Philippe Mathieu-Daudé <philmd@redhat.com>
Date:   Fri May 8 08:24:54 2020 +0200

    memory: Extract memory_region_msync() from memory_region_writeback()
    
    Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
    Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
    Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
    Acked-by: Paolo Bonzini <pbonzini@redhat.com>
    Message-id: 20200508062456.23344-3-philmd@redhat.com
    Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

commit 4dfe59d187d9b218efca8d89c0c2fac1298d8712
Author: Philippe Mathieu-Daudé <philmd@redhat.com>
Date:   Fri May 8 08:24:53 2020 +0200

    memory: Rename memory_region_do_writeback -> memory_region_writeback
    
    We usually use '_do_' for internal functions. Rename
    memory_region_do_writeback() as memory_region_writeback().
    
    Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
    Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
    Acked-by: Paolo Bonzini <pbonzini@redhat.com>
    Message-id: 20200508062456.23344-2-philmd@redhat.com
    Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

commit dfd5ddb5680511a2aa5576d8ed01ff214cc0fc03
Author: Alexander Bulekov <alxndr@bu.edu>
Date:   Mon May 11 23:01:33 2020 -0400

    fuzz: run the main-loop in fork-server process
    
    Without this, the time since the last main-loop keeps increasing, as the
    fuzzer runs. The forked children need to handle all the "past-due"
    timers, slowing them down, over time. With this change, the
    parent/fork-server process runs the main-loop, while waiting on the
    child, ensuring that the timer events do not pile up, over time.
    
    Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
    Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
    Message-id: 20200512030133.29896-5-alxndr@bu.edu
    Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

commit 3b113229c5d5477d34f54fce0a3e8781090c93b6
Author: Alexander Bulekov <alxndr@bu.edu>
Date:   Mon May 11 23:01:32 2020 -0400

    fuzz: add mangled object name to linker script
    
    Previously, we relied on "FuzzerTracePC*(.bss*)" to place libfuzzer's
    fuzzer::TPC object into our contiguous shared-memory region. This does
    not work for some libfuzzer builds, so this addition identifies the
    region by its mangled name: *(.bss._ZN6fuzzer3TPCE);
    
    Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
    Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
    Message-id: 20200512030133.29896-4-alxndr@bu.edu
    Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

commit 6851803a467238ed39408e35b5f2063c1370b156
Author: Alexander Bulekov <alxndr@bu.edu>
Date:   Mon May 11 23:01:31 2020 -0400

    fuzz: fix typo in i440fx-qtest-reboot arguments
    
    Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
    Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
    Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
    Message-id: 20200512030133.29896-3-alxndr@bu.edu
    Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

commit 7a071a96d3ef48095892c1d1075c0181c8940058
Author: Alexander Bulekov <alxndr@bu.edu>
Date:   Mon May 11 23:01:30 2020 -0400

    fuzz: add datadir for oss-fuzz compatability
    
    This allows us to keep pc-bios in executable_dir/pc-bios, rather than
    executable_dir/../pc-bios, which is incompatible with oss-fuzz' file
    structure.
    
    Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
    Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
    Message-id: 20200512030133.29896-2-alxndr@bu.edu
    Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

commit 769335ecb1e8fd9c4317bdff7cfd0f84af7ab2f9
Author: Stefano Garzarella <sgarzare@redhat.com>
Date:   Tue May 19 15:49:42 2020 +0200

    io_uring: use io_uring_cq_ready() to check for ready cqes
    
    In qemu_luring_poll_cb() we are not using the cqe peeked from the
    CQ ring. We are using io_uring_peek_cqe() only to see if there
    are cqes ready, so we can replace it with io_uring_cq_ready().
    
    Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
    Message-id: 20200519134942.118178-1-sgarzare@redhat.com
    Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

commit b4e44c9944e19c8bfc7fbf0c4a6a5e48f3ba3dc0
Author: Stefano Garzarella <sgarzare@redhat.com>
Date:   Tue May 19 15:30:41 2020 +0200

    io_uring: retry io_uring_submit() if it fails with errno=EINTR
    
    As recently documented [1], io_uring_enter(2) syscall can return an
    error (errno=EINTR) if the operation was interrupted by a delivery
    of a signal before it could complete.
    
    This should happen when IORING_ENTER_GETEVENTS flag is used, for
    example during io_uring_submit_and_wait() or during io_uring_submit()
    when IORING_SETUP_IOPOLL is enabled.
    
    We shouldn't have this problem for now, but it's better to prevent it.
    
    [1] https://github.com/axboe/liburing/commit/344355ec6619de8f4e64584c9736530b5346e4f4
    
    Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
    Message-id: 20200519133041.112138-1-sgarzare@redhat.com
    Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

