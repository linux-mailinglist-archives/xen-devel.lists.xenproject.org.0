Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F156D767B85
	for <lists+xen-devel@lfdr.de>; Sat, 29 Jul 2023 04:31:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571630.895966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPZic-0005d1-7R; Sat, 29 Jul 2023 02:30:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571630.895966; Sat, 29 Jul 2023 02:30:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPZic-0005Zm-2W; Sat, 29 Jul 2023 02:30:10 +0000
Received: by outflank-mailman (input) for mailman id 571630;
 Sat, 29 Jul 2023 02:30:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qPZia-0005Zc-1O; Sat, 29 Jul 2023 02:30:08 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qPZiZ-0007xS-V1; Sat, 29 Jul 2023 02:30:08 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qPZiZ-0006dF-Hu; Sat, 29 Jul 2023 02:30:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qPZiZ-00043p-Cz; Sat, 29 Jul 2023 02:30:07 +0000
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
	bh=Qpakuun0qHJS7Dg3P3+hmqtagZ9REXu0bDIq8xlYuk4=; b=xW/DlNUf2rl1h6rLLl7k1cWfHI
	XJ9YxujMD4mHh486rR0bQzbYEv/mWDQem7TglGwDXARwwOMqRS+IXyeIHD+i7D5SvIpRC+ZcOdEEj
	DdRHLpyfYpmi7IrRqCjJ47iAh/QtV57PZyQkKJEoRbq0/u64aAV/gpAJ0KGjLA1IS4+U=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182058-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 182058: regressions - trouble: broken/fail/pass
X-Osstest-Failures:
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:host-install(5):broken:regression
    qemu-mainline:test-amd64-amd64-libvirt-vhd:guest-start/debian.repeat:fail:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:windows-install:fail:regression
    qemu-mainline:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:guest-start:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qcow2:guest-start/debian.repeat:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    qemuu=f33c74576425fac2cbb0725229895fe096df4261
X-Osstest-Versions-That:
    qemuu=ccdd31267678db9d80578b5f80bbe94141609ef4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 29 Jul 2023 02:30:07 +0000

flight 182058 qemu-mainline real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182058/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm    <job status>      broken
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 5 host-install(5) broken REGR. vs. 182029
 test-amd64-amd64-libvirt-vhd 19 guest-start/debian.repeat fail REGR. vs. 182029
 test-amd64-i386-xl-qemuu-win7-amd64 12 windows-install   fail REGR. vs. 182029

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 182029
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 182029
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 182029
 test-armhf-armhf-xl-vhd      13 guest-start                  fail  like 182029
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 182029
 test-amd64-amd64-xl-qcow2    21 guest-start/debian.repeat    fail  like 182029
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 182029
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 182029
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 182029
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass

version targeted for testing:
 qemuu                f33c74576425fac2cbb0725229895fe096df4261
baseline version:
 qemuu                ccdd31267678db9d80578b5f80bbe94141609ef4

Last test of basis   182029  2023-07-27 03:42:56 Z    1 days
Testing same since   182058  2023-07-28 13:08:59 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Hanna Czenczek <hreitz@redhat.com>
  Richard Henderson <richard.henderson@linaro.org>
  Sam Li <faithilikerun@gmail.com>
  Stefan Hajnoczi <stefanha@redhat.com>
  Stefano Garzarella <sgarzare@redhat.com>

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
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           broken  
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
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
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
 test-amd64-amd64-xl-qcow2                                    fail    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 fail    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      fail    
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

broken-job test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm broken
broken-step test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm host-install(5)

Not pushing.

------------------------------------------------------------
commit f33c74576425fac2cbb0725229895fe096df4261
Merge: ccdd312676 1c38fe69e2
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Thu Jul 27 17:41:55 2023 -0700

    Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging
    
    Pull request
    
    Please include these bug fixes in QEMU 8.1. Thanks!
    
    # -----BEGIN PGP SIGNATURE-----
    #
    # iQEzBAABCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmTCzPUACgkQnKSrs4Gr
    # c8g1DAf/fPUQ4zRsCn079pHIyK9TFo4COm23p4kiusxj8otfjt8LH1Zsc9pGWC2+
    # bl2RlnPID8JlyJFDRN7b/RCEhj45a83GtCmhDDmqVgy1eO5vwOKm2XyyWeD+pq/U
    # Hf2QLPLZZ7tCD8Njpty+gB3Ux4zqthKGXSg8FpJ3w0tl4me2efLvjMa6jHMwtnHT
    # aAbyQ3WMpT9w4XHLqRQDHzBqrTSY4od3nl9SrM/DQ2klLIcz8ECTEZVBY9B3pq6m
    # QvAg24tfb0QvS14YnZv/PMCfOaVuE87M9G4f93pCynnMxMYze+XczL0sGhIAS9wp
    # 03NgGlhGumOix6r2kHjlG6p3xywV8A==
    # =jMf8
    # -----END PGP SIGNATURE-----
    # gpg: Signature made Thu 27 Jul 2023 01:00:53 PM PDT
    # gpg:                using RSA key 8695A8BFD3F97CDAAC35775A9CA4ABB381AB73C8
    # gpg: Good signature from "Stefan Hajnoczi <stefanha@redhat.com>" [full]
    # gpg:                 aka "Stefan Hajnoczi <stefanha@gmail.com>" [full]
    
    * tag 'block-pull-request' of https://gitlab.com/stefanha/qemu:
      block/blkio: use blkio_set_int("fd") to check fd support
      block/blkio: fall back on using `path` when `fd` setting fails
      block/blkio: retry blkio_connect() if it fails using `fd`
      block/blkio: move blkio_connect() in the drivers functions
      block: Fix pad_request's request restriction
      block/file-posix: fix g_file_get_contents return path
      block/blkio: do not use open flags in qemu_open()
      block/blkio: enable the completion eventfd
    
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

commit 1c38fe69e2b8a05c1762b122292fa7e3662f06fd
Author: Stefano Garzarella <sgarzare@redhat.com>
Date:   Thu Jul 27 18:10:20 2023 +0200

    block/blkio: use blkio_set_int("fd") to check fd support
    
    Setting the `fd` property fails with virtio-blk-* libblkio drivers
    that do not support fd passing since
    https://gitlab.com/libblkio/libblkio/-/merge_requests/208.
    
    Getting the `fd` property, on the other hand, always succeeds for
    virtio-blk-* libblkio drivers even when they don't support fd passing.
    
    This patch switches to setting the `fd` property because it is a
    better mechanism for probing fd passing support than getting the `fd`
    property.
    
    Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
    Message-id: 20230727161020.84213-5-sgarzare@redhat.com
    Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

commit 723bea27b127969931fa26bc0de79372a3d9e148
Author: Stefano Garzarella <sgarzare@redhat.com>
Date:   Thu Jul 27 18:10:19 2023 +0200

    block/blkio: fall back on using `path` when `fd` setting fails
    
    qemu_open() fails if called with an unix domain socket in this way:
        -blockdev node-name=drive0,driver=virtio-blk-vhost-user,path=vhost-user-blk.sock,cache.direct=on: Could not open 'vhost-user-blk.sock': No such device or address
    
    Since virtio-blk-vhost-user does not support fd passing, let`s always fall back
    on using `path` if we fail the fd passing.
    
    Fixes: cad2ccc395 ("block/blkio: use qemu_open() to support fd passing for virtio-blk")
    Reported-by: Qing Wang <qinwang@redhat.com>
    Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
    Message-id: 20230727161020.84213-4-sgarzare@redhat.com
    Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

commit 809c319f8a089fbc49223dc29e1cc2b978beeada
Author: Stefano Garzarella <sgarzare@redhat.com>
Date:   Thu Jul 27 18:10:18 2023 +0200

    block/blkio: retry blkio_connect() if it fails using `fd`
    
    libblkio 1.3.0 added support of "fd" property for virtio-blk-vhost-vdpa
    driver. In QEMU, starting from commit cad2ccc395 ("block/blkio: use
    qemu_open() to support fd passing for virtio-blk") we are using
    `blkio_get_int(..., "fd")` to check if the "fd" property is supported
    for all the virtio-blk-* driver.
    
    Unfortunately that property is also available for those driver that do
    not support it, such as virtio-blk-vhost-user.
    
    So, `blkio_get_int()` is not enough to check whether the driver supports
    the `fd` property or not. This is because the virito-blk common libblkio
    driver only checks whether or not `fd` is set during `blkio_connect()`
    and fails with -EINVAL for those transports that do not support it
    (all except vhost-vdpa for now).
    
    So let's handle the `blkio_connect()` failure, retrying it using `path`
    directly.
    
    Fixes: cad2ccc395 ("block/blkio: use qemu_open() to support fd passing for virtio-blk")
    Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
    Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
    Message-id: 20230727161020.84213-3-sgarzare@redhat.com
    Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

commit 69785d66ae1ec43f77fc65109a21721992bead9f
Author: Stefano Garzarella <sgarzare@redhat.com>
Date:   Thu Jul 27 18:10:17 2023 +0200

    block/blkio: move blkio_connect() in the drivers functions
    
    This is in preparation for the next patch, where for virtio-blk
    drivers we need to handle the failure of blkio_connect().
    
    Let's also rename the *_open() functions to *_connect() to make
    the code reflect the changes applied.
    
    Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
    Message-id: 20230727161020.84213-2-sgarzare@redhat.com
    Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

commit ef256751e970bff435d40a8348dd51d81e67e52e
Author: Hanna Czenczek <hreitz@redhat.com>
Date:   Fri Jul 14 10:59:38 2023 +0200

    block: Fix pad_request's request restriction
    
    bdrv_pad_request() relies on requests' lengths not to exceed SIZE_MAX,
    which bdrv_check_qiov_request() does not guarantee.
    
    bdrv_check_request32() however will guarantee this, and both of
    bdrv_pad_request()'s callers (bdrv_co_preadv_part() and
    bdrv_co_pwritev_part()) already run it before calling
    bdrv_pad_request().  Therefore, bdrv_pad_request() can safely call
    bdrv_check_request32() without expecting error, too.
    
    In effect, this patch will not change guest-visible behavior.  It is a
    clean-up to tighten a condition to match what is guaranteed by our
    callers, and which exists purely to show clearly why the subsequent
    assertion (`assert(*bytes <= SIZE_MAX)`) is always true.
    
    Note there is a difference between the interfaces of
    bdrv_check_qiov_request() and bdrv_check_request32(): The former takes
    an errp, the latter does not, so we can no longer just pass
    &error_abort.  Instead, we need to check the returned value.  While we
    do expect success (because the callers have already run this function),
    an assert(ret == 0) is not much simpler than just to return an error if
    it occurs, so let us handle errors by returning them up the stack now.
    
    Reported-by: Peter Maydell <peter.maydell@linaro.org>
    Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
    Message-id: 20230714085938.202730-1-hreitz@redhat.com
    Fixes: 18743311b829cafc1737a5f20bc3248d5f91ee2a
           ("block: Collapse padded I/O vecs exceeding IOV_MAX")
    Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
    Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

commit 29a242e165610df9b158bdb8d6b84e83d8733fc4
Author: Sam Li <faithilikerun@gmail.com>
Date:   Thu Jul 27 19:58:44 2023 +0800

    block/file-posix: fix g_file_get_contents return path
    
    The g_file_get_contents() function returns a g_boolean. If it fails, the
    returned value will be 0 instead of -1. Solve the issue by skipping
    assigning ret value.
    
    This issue was found by Matthew Rosato using virtio-blk-{pci,ccw} backed
    by an NVMe partition e.g. /dev/nvme0n1p1 on s390x.
    
    Signed-off-by: Sam Li <faithilikerun@gmail.com>
    Reviewed-by: Matthew Rosato <mjrosato@linux.ibm.com>
    Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
    Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
    Message-id: 20230727115844.8480-1-faithilikerun@gmail.com
    Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

commit a5942c177b7bcc1357e496b7d68668befcfc2bb9
Author: Stefano Garzarella <sgarzare@redhat.com>
Date:   Wed Jul 26 09:48:07 2023 +0200

    block/blkio: do not use open flags in qemu_open()
    
    qemu_open() in blkio_virtio_blk_common_open() is used to open the
    character device (e.g. /dev/vhost-vdpa-0 or /dev/vfio/vfio) or in
    the future eventually the unix socket.
    
    In all these cases we cannot open the path in read-only mode,
    when the `read-only` option of blockdev is on, because the exchange
    of IOCTL commands for example will fail.
    
    In order to open the device read-only, we have to use the `read-only`
    property of the libblkio driver as we already do in blkio_file_open().
    
    Fixes: cad2ccc395 ("block/blkio: use qemu_open() to support fd passing for virtio-blk")
    Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2225439
    Reported-by: Qing Wang <qinwang@redhat.com>
    Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
    Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
    Message-id: 20230726074807.14041-1-sgarzare@redhat.com
    Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

commit 9359c459889fce1804c4e1b2a2ff8f182b4a9ae8
Author: Stefano Garzarella <sgarzare@redhat.com>
Date:   Tue Jul 25 12:37:44 2023 +0200

    block/blkio: enable the completion eventfd
    
    Until libblkio 1.3.0, virtio-blk drivers had completion eventfd
    notifications enabled from the start, but from the next releases
    this is no longer the case, so we have to explicitly enable them.
    
    In fact, the libblkio documentation says they could be disabled,
    so we should always enable them at the start if we want to be
    sure to get completion eventfd notifications:
    
        By default, the driver might not generate completion events for
        requests so it is necessary to explicitly enable the completion
        file descriptor before use:
    
        void blkioq_set_completion_fd_enabled(struct blkioq *q, bool enable);
    
    I discovered this while trying a development version of libblkio:
    the guest kernel hangs during boot, while probing the device.
    
    Fixes: fd66dbd424f5 ("blkio: add libblkio block driver")
    Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
    Message-id: 20230725103744.77343-1-sgarzare@redhat.com
    Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

