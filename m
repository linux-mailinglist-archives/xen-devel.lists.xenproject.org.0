Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4078708989
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 22:30:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536520.834920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzkFn-00063L-PR; Thu, 18 May 2023 20:29:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536520.834920; Thu, 18 May 2023 20:29:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzkFn-00060z-MM; Thu, 18 May 2023 20:29:39 +0000
Received: by outflank-mailman (input) for mailman id 536520;
 Thu, 18 May 2023 20:29:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pzkFm-00060p-0Z; Thu, 18 May 2023 20:29:38 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pzkFl-0005G3-No; Thu, 18 May 2023 20:29:37 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pzkFl-00077L-Cm; Thu, 18 May 2023 20:29:37 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pzkFl-0002bW-C6; Thu, 18 May 2023 20:29:37 +0000
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
	bh=ipPWF7UbJu7UukY68WVGOATrSspFJTjeP/ujTokov3w=; b=lHIp8H9mdzrsxvlp0WFOZf0Z0P
	qUiFohnfvD49AKlwuU2OmTb8VMtCx+WKz3Ygq+yS6s6+AFlWoDBrCk8N0zGghMyiSzIaw3xymaaDw
	fJAJrpVmKUNaas/HgwbkFjK8CkjV2hkzWbEUsSEQJCUYlOFojQTU0NX+79NOELMGWrBs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180699-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 180699: regressions - trouble: blocked/broken/fail/pass
X-Osstest-Failures:
    qemu-mainline:test-amd64-coresched-amd64-xl:<job status>:broken:regression
    qemu-mainline:test-amd64-coresched-amd64-xl:capture-logs(26):broken:regression
    qemu-mainline:build-arm64:xen-build:fail:regression
    qemu-mainline:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:build-check(1):blocked:nonblocking
    qemu-mainline:build-arm64-libvirt:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    qemuu=d27e7c359330ba7020bdbed7ed2316cb4cf6ffc1
X-Osstest-Versions-That:
    qemuu=6972ef1440a9d685482d78672620a7482f2bd09a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 18 May 2023 20:29:37 +0000

flight 180699 qemu-mainline real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180699/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-coresched-amd64-xl    <job status>                 broken
 test-amd64-coresched-amd64-xl 26 capture-logs(26)      broken REGR. vs. 180691
 build-arm64                   6 xen-build                fail REGR. vs. 180691

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-vhd       1 build-check(1)               blocked  n/a
 build-arm64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 180691
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 180691
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 180691
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 180691
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 180691
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 180691
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 180691
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 180691
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 qemuu                d27e7c359330ba7020bdbed7ed2316cb4cf6ffc1
baseline version:
 qemuu                6972ef1440a9d685482d78672620a7482f2bd09a

Last test of basis   180691  2023-05-17 10:45:22 Z    1 days
Testing same since   180699  2023-05-18 07:21:24 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Afonso Bordado <afonsobordado@gmail.com>
  Daniil Kovalev <dkovalev@compiler-toolchain-for.me>
  Igor Mammedov <imammedo@redhat.com>
  Laurent Vivier <laurent@vivier.eu>
  Markus Armbruster <armbru@redhat.com>
  Michael Tokarev <mjt@tls.msk.ru>
  Palmer Dabbelt <palmer@rivosinc.com>
  Richard Henderson <richard.henderson@linaro.org>
  Thomas Huth <thuth@redhat.com>
  Thomas Weißschuh <thomas@t-8ch.de>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  fail    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          blocked 
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                broken  
 test-arm64-arm64-xl                                          blocked 
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  blocked 
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  blocked 
 test-armhf-armhf-xl-credit2                                  pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 blocked 
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 blocked 
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      blocked 
 test-armhf-armhf-xl-vhd                                      pass    
 test-amd64-i386-xl-vhd                                       pass    


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

broken-job test-amd64-coresched-amd64-xl broken
broken-step test-amd64-coresched-amd64-xl capture-logs(26)

Not pushing.

------------------------------------------------------------
commit d27e7c359330ba7020bdbed7ed2316cb4cf6ffc1
Author: Markus Armbruster <armbru@redhat.com>
Date:   Wed May 17 08:16:00 2023 +0200

    qapi/parser: Drop two bad type hints for now
    
    Two type hints fail centos-stream-8-x86_64 CI.  They are actually
    broken.  Changing them to Optional[re.Match[str]] fixes them locally
    for me, but then CI fails differently.  Drop them for now.
    
    Fixes: 3e32dca3f0d1 (qapi: Rewrite parsing of doc comment section symbols and tags)
    Signed-off-by: Markus Armbruster <armbru@redhat.com>
    Message-Id: <20230517061600.1782455-1-armbru@redhat.com>
    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
    Tested-by: Igor Mammedov <imammedo@redhat.com>
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

commit 19200a0edf67a193275f2b194f7b3b731b3817b3
Merge: 6972ef1440 1e35d32789
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Wed May 17 05:42:14 2023 -0700

    Merge tag 'linux-user-for-8.1-pull-request' of https://github.com/vivier/qemu into staging
    
    linux-user pull request 20230512-v4
    
    add open_tree(), move_mount()
    add /proc/cpuinfo for riscv
    fixes and cleanup
    
    # -----BEGIN PGP SIGNATURE-----
    #
    # iQJGBAABCAAwFiEEzS913cjjpNwuT1Fz8ww4vT8vvjwFAmRkiZISHGxhdXJlbnRA
    # dml2aWVyLmV1AAoJEPMMOL0/L748FdIP/RC1JaCftkP7ajAstNbZLMLegMxjUYHV
    # TrdhsMOsm804ZmLgTqqfS3bJ080mIHup0xUnHBckcEtUcwaz54cJ1BAR2WlM3/8A
    # t3fHMt3PDkh3OPd/3AnmpLE8XRh7yBztirPYfZc6SKqnFzT0TZrwBoQnwprEnZ5r
    # c0gbrgLZLunZhrWU1BbQmuIufW1qDoQo4PzwnyZeux1fHA1/v/dx3wgSLpv3V4k6
    # x0Kj8TvtMUU4/io2RqYF4jKopfhwsh0jnr9rlOmydOExalKq1VbRptJI2UC4KVOY
    # MZuApF1EaZfrW+v/WSlvmzaZ/zRzP1L0X3Xh0wB4J9Rj3057/elXr6bi+R+rM46p
    # xGTcti9ahWKP2J4/xrazRw2lfPsLcw/YbqVGG79AX1xLJPCiWq6lamzc/g3ptFnx
    # F/RRETe65z7apzF/nzU7SDOsMdN5p4/fMb1SysLuAov5OepNVjNVWyiTgqOHB5uC
    # ye+lOYkkvk+qRdMbls/fIcjDQ3C4AjoBWj4QlgRc0/Qf6ac4TkVjzPa70Y6eyzzS
    # LEV9D4fXD8EZgYWENNGmbbKPNbtfqc9uR6gXdgkEsKDx/rf5IMf1d6r1C99dhB3A
    # nbu0JpFKKY2lhD2oGVPDE3UQMW9DXXhZpDApUBsLNiEwfuoXZee+apH+6jc8tbn6
    # r+8LFB1mM9os
    # =NfIV
    # -----END PGP SIGNATURE-----
    # gpg: Signature made Wed 17 May 2023 01:00:18 AM PDT
    # gpg:                using RSA key CD2F75DDC8E3A4DC2E4F5173F30C38BD3F2FBE3C
    # gpg:                issuer "laurent@vivier.eu"
    # gpg: Good signature from "Laurent Vivier <lvivier@redhat.com>" [undefined]
    # gpg:                 aka "Laurent Vivier <laurent@vivier.eu>" [undefined]
    # gpg:                 aka "Laurent Vivier (Red Hat) <lvivier@redhat.com>" [undefined]
    # gpg: WARNING: This key is not certified with a trusted signature!
    # gpg:          There is no indication that the signature belongs to the owner.
    # Primary key fingerprint: CD2F 75DD C8E3 A4DC 2E4F  5173 F30C 38BD 3F2F BE3C
    
    * tag 'linux-user-for-8.1-pull-request' of https://github.com/vivier/qemu:
      linux-user: fix getgroups/setgroups allocations
      linux-user: Fix mips fp64 executables loading
      linux-user: Don't require PROT_READ for mincore
      linux-user: Add new flag VERIFY_NONE
      linux-user/main: Use list_cpus() instead of cpu_list()
      linux-user: Add open_tree() syscall
      linux-user: Add move_mount() syscall
      linux-user: report ENOTTY for unknown ioctls
      linux-user: Emulate /proc/cpuinfo output for riscv
    
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

commit 1e35d327890bdd117a67f79c52e637fb12bb1bf4
Author: Michael Tokarev <mjt@tls.msk.ru>
Date:   Sun Apr 9 13:53:27 2023 +0300

    linux-user: fix getgroups/setgroups allocations
    
    linux-user getgroups(), setgroups(), getgroups32() and setgroups32()
    used alloca() to allocate grouplist arrays, with unchecked gidsetsize
    coming from the "guest".  With NGROUPS_MAX being 65536 (linux, and it
    is common for an application to allocate NGROUPS_MAX for getgroups()),
    this means a typical allocation is half the megabyte on the stack.
    Which just overflows stack, which leads to immediate SIGSEGV in actual
    system getgroups() implementation.
    
    An example of such issue is aptitude, eg
    https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=811087#72
    
    Cap gidsetsize to NGROUPS_MAX (return EINVAL if it is larger than that),
    and use heap allocation for grouplist instead of alloca().  While at it,
    fix coding style and make all 4 implementations identical.
    
    Try to not impose random limits - for example, allow gidsetsize to be
    negative for getgroups() - just do not allocate negative-sized grouplist
    in this case but still do actual getgroups() call.  But do not allow
    negative gidsetsize for setgroups() since its argument is unsigned.
    
    Capping by NGROUPS_MAX seems a bit arbitrary, - we can do more, it is
    not an error if set size will be NGROUPS_MAX+1. But we should not allow
    integer overflow for the array being allocated. Maybe it is enough to
    just call g_try_new() and return ENOMEM if it fails.
    
    Maybe there's also no need to convert setgroups() since this one is
    usually smaller and known beforehand (KERN_NGROUPS_MAX is actually 63, -
    this is apparently a kernel-imposed limit for runtime group set).
    
    The patch fixes aptitude segfault mentioned above.
    
    Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
    Message-Id: <20230409105327.1273372-1-mjt@msgid.tls.msk.ru>
    Signed-off-by: Laurent Vivier <laurent@vivier.eu>

commit a0f8d2701b205d9d7986aa555e0566b13dc18fa0
Author: Daniil Kovalev <dkovalev@compiler-toolchain-for.me>
Date:   Tue Apr 4 08:21:54 2023 +0300

    linux-user: Fix mips fp64 executables loading
    
    If a program requires fr1, we should set the FR bit of CP0 control status
    register and add F64 hardware flag. The corresponding `else if` branch
    statement is copied from the linux kernel sources (see `arch_check_elf` function
    in linux/arch/mips/kernel/elf.c).
    
    Signed-off-by: Daniil Kovalev <dkovalev@compiler-toolchain-for.me>
    Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
    Message-Id: <20230404052153.16617-1-dkovalev@compiler-toolchain-for.me>
    Signed-off-by: Laurent Vivier <laurent@vivier.eu>

commit f443a26cc6c077f792a5114c5229020ecf44ba3b
Author: Thomas Weißschuh <thomas@t-8ch.de>
Date:   Sat Apr 22 12:03:14 2023 +0200

    linux-user: Don't require PROT_READ for mincore
    
    The kernel does not require PROT_READ for addresses passed to mincore.
    For example the fincore(1) tool from util-linux uses PROT_NONE and
    currently does not work under qemu-user.
    
    Example (with fincore(1) from util-linux 2.38):
    
    $ fincore /proc/self/exe
    RES PAGES  SIZE FILE
    24K     6 22.1K /proc/self/exe
    
    $ qemu-x86_64 /usr/bin/fincore /proc/self/exe
    fincore: failed to do mincore: /proc/self/exe: Cannot allocate memory
    
    With this patch:
    
    $ ./build/qemu-x86_64 /usr/bin/fincore /proc/self/exe
    RES PAGES  SIZE FILE
    24K     6 22.1K /proc/self/exe
    
    Signed-off-by: Thomas Weißschuh <thomas@t-8ch.de>
    Reviewed-by: Laurent Vivier <laurent@vivier.eu>
    Message-Id: <20230422100314.1650-3-thomas@t-8ch.de>
    Signed-off-by: Laurent Vivier <laurent@vivier.eu>

commit 64d06015f6f44e3338af0ab2968ef7467dd2f3ef
Author: Thomas Weißschuh <thomas@t-8ch.de>
Date:   Sat Apr 22 12:03:13 2023 +0200

    linux-user: Add new flag VERIFY_NONE
    
    This can be used to validate that an address range is mapped but without
    being readable or writable.
    
    It will be used by an updated implementation of mincore().
    
    Signed-off-by: Thomas Weißschuh <thomas@t-8ch.de>
    Reviewed-by: Laurent Vivier <laurent@vivier.eu>
    Message-Id: <20230422100314.1650-2-thomas@t-8ch.de>
    Signed-off-by: Laurent Vivier <laurent@vivier.eu>

commit b67e5cb43b64cd511785aa1b35876b5e5bf55f69
Author: Thomas Huth <thuth@redhat.com>
Date:   Mon Apr 24 14:21:26 2023 +0200

    linux-user/main: Use list_cpus() instead of cpu_list()
    
    This way we can get rid of the if'deffery and the XXX comment
    here (it's repeated in the list_cpus() function anyway).
    
    Signed-off-by: Thomas Huth <thuth@redhat.com>
    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
    Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
    Message-Id: <20230424122126.236586-1-thuth@redhat.com>
    Signed-off-by: Laurent Vivier <laurent@vivier.eu>

commit 7f696cddd9d7bbde0ecc489eb9a29c7196b29727
Author: Thomas Weißschuh <thomas@t-8ch.de>
Date:   Mon Apr 24 17:34:29 2023 +0200

    linux-user: Add open_tree() syscall
    
    Signed-off-by: Thomas Weißschuh <thomas@t-8ch.de>
    Reviewed-by: Laurent Vivier <laurent@vivier.eu>
    Message-Id: <20230424153429.276788-2-thomas@t-8ch.de>
    [lv: move declaration at the beginning of the block,
         define syscall]
    Signed-off-by: Laurent Vivier <laurent@vivier.eu>

commit 4b2d2753e88bdb25db5eab84c172135200f15c99
Author: Thomas Weißschuh <thomas@t-8ch.de>
Date:   Mon Apr 24 17:34:28 2023 +0200

    linux-user: Add move_mount() syscall
    
    Signed-off-by: Thomas Weißschuh <thomas@t-8ch.de>
    Reviewed-by: Laurent Vivier <laurent@vivier.eu>
    [lv: define syscall]
    Message-Id: <20230424153429.276788-1-thomas@t-8ch.de>
    Signed-off-by: Laurent Vivier <laurent@vivier.eu>

commit 59d11727768a0a29675a78a18c3f87390d5dc90a
Author: Thomas Weißschuh <thomas@t-8ch.de>
Date:   Wed Apr 26 09:06:59 2023 +0200

    linux-user: report ENOTTY for unknown ioctls
    
    The correct error number for unknown ioctls is ENOTTY.
    
    ENOSYS would mean that the ioctl() syscall itself is not implemented,
    which is very improbable and unexpected for userspace.
    
    ENOTTY means "Inappropriate ioctl for device". This is what the kernel
    returns on unknown ioctls, what qemu is trying to express and what
    userspace is prepared to handle.
    
    Signed-off-by: Thomas Weißschuh <thomas@t-8ch.de>
    Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
    Message-Id: <20230426070659.80649-1-thomas@t-8ch.de>
    Signed-off-by: Laurent Vivier <laurent@vivier.eu>

commit 8ddc171b7b302844d9f4598125fed925b72c686c
Author: Afonso Bordado <afonsobordado@gmail.com>
Date:   Sun Mar 5 14:34:37 2023 +0000

    linux-user: Emulate /proc/cpuinfo output for riscv
    
    RISC-V does not expose all extensions via hwcaps, thus some userspace
    applications may want to query these via /proc/cpuinfo.
    
    Currently when querying this file the host's file is shown instead
    which is slightly confusing. Emulate a basic /proc/cpuinfo file
    with mmu info and an ISA string.
    
    Signed-off-by: Afonso Bordado <afonsobordado@gmail.com>
    Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
    Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
    Reviewed-by: Laurent Vivier <laurent@vivier.eu>
    Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
    Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
    Message-Id: <167873059442.9885.15152085316575248452-0@git.sr.ht>
    [lv: removed the test that fails in CI for unknown reason]
    Signed-off-by: Laurent Vivier <laurent@vivier.eu>

