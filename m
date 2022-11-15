Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C63D7629259
	for <lists+xen-devel@lfdr.de>; Tue, 15 Nov 2022 08:19:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443777.698517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouqDI-0007bq-CK; Tue, 15 Nov 2022 07:18:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443777.698517; Tue, 15 Nov 2022 07:18:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouqDI-0007Ze-9E; Tue, 15 Nov 2022 07:18:32 +0000
Received: by outflank-mailman (input) for mailman id 443777;
 Tue, 15 Nov 2022 07:18:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ouqDG-0007ZB-RU; Tue, 15 Nov 2022 07:18:30 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ouqDG-0004oi-Nv; Tue, 15 Nov 2022 07:18:30 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ouqDG-0005AE-4P; Tue, 15 Nov 2022 07:18:30 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ouqDG-0008O8-3u; Tue, 15 Nov 2022 07:18:30 +0000
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
	bh=nznCw4o/rxaAswbpXZ3AGfobQ3U3MfNyah9FhL35vF8=; b=jYG79+DRm8OAofeNg8TtQMy3Xd
	v6oo2T7ELApc2sS9y9f0CIbRVN/OEb6oApz3Vp5NVTVgwHdvlZfBr2qrHeRPFl7N61y2tLlTXGAWo
	gfSvBp9pZkwzLB9ZuJXgC38oKa+RFtT63/U/dIjkKO39w6kqhw3DrvrV4qefB9JdRZzE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-174772-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 174772: trouble: broken/fail/pass
X-Osstest-Failures:
    qemu-mainline:test-armhf-armhf-xl-arndale:<job status>:broken:regression
    qemu-mainline:test-armhf-armhf-xl-arndale:host-install(5):broken:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    qemuu=98f10f0e2613ba1ac2ad3f57a5174014f6dcb03d
X-Osstest-Versions-That:
    qemuu=305f6f62d9d250a32cdf090ddcb7e3a5b26a342e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 15 Nov 2022 07:18:30 +0000

flight 174772 qemu-mainline real [real]
http://logs.test-lab.xenproject.org/osstest/logs/174772/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl-arndale     <job status>                 broken
 test-armhf-armhf-xl-arndale   5 host-install(5)        broken REGR. vs. 174761

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 174761
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 174761
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 174761
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 174761
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 174761
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 174761
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 174761
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 174761
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 qemuu                98f10f0e2613ba1ac2ad3f57a5174014f6dcb03d
baseline version:
 qemuu                305f6f62d9d250a32cdf090ddcb7e3a5b26a342e

Last test of basis   174761  2022-11-14 01:07:28 Z    1 days
Testing same since   174772  2022-11-14 22:08:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jens Wiklander <jens.wiklander@linaro.org>
  Peter Maydell <peter.maydell@linaro.org>
  Stefan Hajnoczi <stefanha@redhat.com>
  Vikram Garhwal <vikram.garhwal@amd.com>

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
 test-armhf-armhf-xl-arndale                                  broken  
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
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      pass    
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

broken-job test-armhf-armhf-xl-arndale broken
broken-step test-armhf-armhf-xl-arndale host-install(5)

Not pushing.

------------------------------------------------------------
commit 98f10f0e2613ba1ac2ad3f57a5174014f6dcb03d
Merge: 305f6f62d9 d9721f19cd
Author: Stefan Hajnoczi <stefanha@redhat.com>
Date:   Mon Nov 14 13:31:17 2022 -0500

    Merge tag 'pull-target-arm-20221114' of https://git.linaro.org/people/pmaydell/qemu-arm into staging
    
    target-arm queue:
     * hw/intc/arm_gicv3: fix prio masking on pmr write
     * MAINTAINERS: Update maintainer's email for Xilinx CAN
    
    # -----BEGIN PGP SIGNATURE-----
    #
    # iQJNBAABCAA3FiEE4aXFk81BneKOgxXPPCUl7RQ2DN4FAmNyY7cZHHBldGVyLm1h
    # eWRlbGxAbGluYXJvLm9yZwAKCRA8JSXtFDYM3mrBD/4mG6AMW4CGROWq3u3F8STK
    # 22uxpilhyBmPawBykUC8dYId8A0GjGqeJ5HRhYE/0ZKqlk9GtFBI4YHM8ccocozK
    # VdgKP7VvXNiBwjV2kQ3mdZnfXRnNWLTnGQd9Q/9EjU+FOBz4hsOoRh8rv+9t2inn
    # dtXV8wbLYQYHCgVPAwTP39DXzF0YQ5sAjVxbjC1lFE6k3pAcDvoGKKcWt9GOI5m1
    # 5ImPgnVdunscqA9otvl56a03M5TbdH8KiAEARo3juFYYEHkl4qD2E2CK6On8wTIA
    # 7zeSoxvTDDYD6mcV/RwFuEcOr+YIFpxeGxes9PKpnYh8Dpx9YPeIYRsK5qTI7QUz
    # Ldbz9PnZE6DPaPsT67kzFnfx4se6q10d5wXaK8VsFBOZ4V9yYONaXlHiZbgpWn/K
    # jlbiJFtehCA0iS4D6YcoDTqL88M/RM5cbj/5tht8sxrl9HJ3r/hxdJ7W+zqpTg2j
    # 3TV+j9okLqyq/4RIFZbf5yVPFPMtF/FOIl95ZAHmvJYjC/L9yXRT6Y5EdKfZPwMe
    # 5FBjdly4gsUqNxFUfPByRVtaoelxjXi/+0wHXWZNw8Naco3yd7VMoqIRLDE4qhY5
    # GfjF2Aai7PHiwb2VE+mIIfz+ldEk5XHFYlXBtUOwt8q2UUnmYsVqh8zFpTYLaDdY
    # RezkZM4yMYx38GPWCvAvlg==
    # =clh5
    # -----END PGP SIGNATURE-----
    # gpg: Signature made Mon 14 Nov 2022 10:50:15 EST
    # gpg:                using RSA key E1A5C593CD419DE28E8315CF3C2525ED14360CDE
    # gpg:                issuer "peter.maydell@linaro.org"
    # gpg: Good signature from "Peter Maydell <peter.maydell@linaro.org>" [full]
    # gpg:                 aka "Peter Maydell <pmaydell@gmail.com>" [full]
    # gpg:                 aka "Peter Maydell <pmaydell@chiark.greenend.org.uk>" [full]
    # gpg:                 aka "Peter Maydell <peter@archaic.org.uk>" [unknown]
    # Primary key fingerprint: E1A5 C593 CD41 9DE2 8E83  15CF 3C25 25ED 1436 0CDE
    
    * tag 'pull-target-arm-20221114' of https://git.linaro.org/people/pmaydell/qemu-arm:
      hw/intc/arm_gicv3: fix prio masking on pmr write
      MAINTAINERS: Update maintainer's email for Xilinx CAN
    
    Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

commit d9721f19cd05a382f4f5a7093c80d1c4a8a1aa82
Author: Jens Wiklander <jens.wiklander@linaro.org>
Date:   Mon Nov 14 15:10:58 2022 +0000

    hw/intc/arm_gicv3: fix prio masking on pmr write
    
    With commit 39f29e599355 ("hw/intc/arm_gicv3: Use correct number of
    priority bits for the CPU") the number of priority bits was changed from
    the maximum value 8 to typically 5. As a consequence a few of the lowest
    bits in ICC_PMR_EL1 becomes RAZ/WI. However prior to this patch one of
    these bits was still used since the supplied priority value is masked
    before it's eventually right shifted with one bit. So the bit is not
    lost as one might expect when the register is read again.
    
    The Linux kernel depends on lowest valid bit to be reset to zero, see
    commit 33625282adaa ("irqchip/gic-v3: Probe for SCR_EL3 being clear
    before resetting AP0Rn") for details.
    
    So fix this by masking the priority value after it may have been right
    shifted by one bit.
    
    Cc: qemu-stable@nongnu.org
    Fixes: 39f29e599355 ("hw/intc/arm_gicv3: Use correct number of priority bits for the CPU")
    Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
    Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
    Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

commit 32bd99d02b4549d1007fb26b7301d26c55e3ba5a
Author: Vikram Garhwal <vikram.garhwal@amd.com>
Date:   Mon Nov 14 15:10:57 2022 +0000

    MAINTAINERS: Update maintainer's email for Xilinx CAN
    
    Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
    Reviewed-by: Francisco Iglesias <francisco.iglesias@amd.com>
    Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

