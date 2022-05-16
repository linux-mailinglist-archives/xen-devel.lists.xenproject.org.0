Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE77528435
	for <lists+xen-devel@lfdr.de>; Mon, 16 May 2022 14:30:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.329832.553098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqZrI-0004kg-EX; Mon, 16 May 2022 12:29:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 329832.553098; Mon, 16 May 2022 12:29:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqZrI-0004hp-BN; Mon, 16 May 2022 12:29:56 +0000
Received: by outflank-mailman (input) for mailman id 329832;
 Mon, 16 May 2022 12:29:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nqZrG-0004ha-J8; Mon, 16 May 2022 12:29:54 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nqZrG-0001OD-F0; Mon, 16 May 2022 12:29:54 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nqZrG-0003TP-0I; Mon, 16 May 2022 12:29:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nqZrF-0003YZ-W7; Mon, 16 May 2022 12:29:53 +0000
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
	bh=ho6SH40ZNLRrkksW7rta1iDIp/0afoELIFy5ROR9jyg=; b=BNYk6KSBZHWlPz5+rmiT+izcZl
	sz6jceU/xLBHbzaWneZ617eRoIc4gVAknz5zDiMQvXx/YiCP7x+wioWv6g0PHMjoygEJrOtUVJcPD
	t6sY3EoSBi2Mxp2gUsQKedSs/UPvWQ0gU634EYyQzMiTCd56UPBiUv3HnWBYHOycA2vc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-170468-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 170468: regressions - FAIL
X-Osstest-Failures:
    qemu-mainline:test-amd64-i386-xl-xsm:xen-install:fail:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:xen-install:fail:heisenbug
    qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    qemuu=10c2a0c5e7d48e590d945c017b5b8af5b4c89a3c
X-Osstest-Versions-That:
    qemuu=48de9b0916ef60d5a6bd6ca9288832deff8ee1ee
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 16 May 2022 12:29:53 +0000

flight 170468 qemu-mainline real [real]
flight 170475 qemu-mainline real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/170468/
http://logs.test-lab.xenproject.org/osstest/logs/170475/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl-xsm        7 xen-install              fail REGR. vs. 170412

Tests which are failing intermittently (not blocking):
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 7 xen-install fail pass in 170475-retest

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 170412
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 170412
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 170412
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 170412
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 170412
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 170412
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 170412
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 170412
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass

version targeted for testing:
 qemuu                10c2a0c5e7d48e590d945c017b5b8af5b4c89a3c
baseline version:
 qemuu                48de9b0916ef60d5a6bd6ca9288832deff8ee1ee

Last test of basis   170412  2022-05-14 06:55:42 Z    2 days
Testing same since   170468  2022-05-16 03:38:42 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jason A. Donenfeld <Jason@zx2c4.com>
  Richard Henderson <richard.henderson@linaro.org>
  Stafford Horne <shorne@gmail.com>

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
 test-amd64-i386-xl-xsm                                       fail    
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
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         fail    
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


Not pushing.

------------------------------------------------------------
commit 10c2a0c5e7d48e590d945c017b5b8af5b4c89a3c
Merge: 48de9b0916 e8f0ab0cd6
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Sun May 15 16:56:27 2022 -0700

    Merge tag 'or1k-pull-request-20220515' of https://github.com/stffrdhrn/qemu into staging
    
    OpenRISC Fixes for 7.0
    
     - A few or1ksim fixes and enhancements
     - A fix for OpenRISC tcg backend around delay slot handling
    
    # -----BEGIN PGP SIGNATURE-----
    #
    # iQIzBAABCAAdFiEE2cRzVK74bBA6Je/xw7McLV5mJ+QFAmKAWKsACgkQw7McLV5m
    # J+SoFg/8Dlrc2BqjjXw9gpaQ18+3BRI6dMVPqHA22VJks88gykH7UWLUbrCxtKnS
    # SBcIcpzu17nKDdfwYWndqCr0UBM/zM3JzFrTv4QEhTEg6Np7lSM2KVNEhjBPVGoW
    # A7QOjPFrwItWOfAx6hrcczpj+L50iKuWeMW0XnEfqSeDYisxZcSp2yMoe5h3y7bF
    # tlpo+ha/ir/fd2kMlFrQlPWYiWkWM05RLJJOlXhdRMF7hrW5qlHqEB/SVykUTf7V
    # 6fqOFvY6r3vE5OFm0Scgf/k2AJIxwV8qXkBJ5/egv+ZqUidZBQ9nXtOw++vF2AWp
    # eKoU2/c2XIxiF1Xdpgdi6a/CxlLqrr9jraQROB3GpaL9zGQvd//wUCg0F+QLicLv
    # avq4lvNmnat89aXj1DQ+DWpLy0zaZFGmxsPR+KeBJ2wkuEJ3Vd4+uiuAyXnm9M8D
    # wEE8mgFQYsTL1WlgHF4uNTDIx8OLS+4gYlBE3tffRksxyLLwzKHHgAfLdNZvhfx8
    # QZBuPy+yyO8zjr3RUVUArBs/ukZHP1QwDE6uxmPKV34tvVEbFVeSFY3a1LmYV3w5
    # mZNALNqf+h5Dq5Qo7f7cGNMrzhL53GTWPNX0MK5+SBDZF3/fpPZyvCr4Zd69Z5tD
    # +YClfWBv8HPjdUf+IFHqyE8rURw/sgNvgB76GpalwcUYXRr7zTM=
    # =tmP4
    # -----END PGP SIGNATURE-----
    # gpg: Signature made Sat 14 May 2022 06:34:35 PM PDT
    # gpg:                using RSA key D9C47354AEF86C103A25EFF1C3B31C2D5E6627E4
    # gpg: Good signature from "Stafford Horne <shorne@gmail.com>" [unknown]
    # gpg: WARNING: This key is not certified with a trusted signature!
    # gpg:          There is no indication that the signature belongs to the owner.
    # Primary key fingerprint: D9C4 7354 AEF8 6C10 3A25  EFF1 C3B3 1C2D 5E66 27E4
    
    * tag 'or1k-pull-request-20220515' of https://github.com/stffrdhrn/qemu:
      target/openrisc: Do not reset delay slot flag on early tb exit
      hw/openrisc: use right OMPIC size variable
      hw/openrisc: support 4 serial ports in or1ksim
      hw/openrisc: page-align FDT address
    
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

commit e8f0ab0cd674241cbab7231ce05ac1bfa0b4f5ed
Author: Stafford Horne <shorne@gmail.com>
Date:   Wed May 11 20:47:50 2022 +0900

    target/openrisc: Do not reset delay slot flag on early tb exit
    
    This was found when running linux crypto algorithm selftests used by
    wireguard.  We found that randomly the tests would fail.  We found
    through investigation that a combination of a tick timer interrupt,
    raised when executing a delay slot instruction at a page boundary caused
    the issue.
    
    This was caused when handling the TB_EXIT_REQUESTED case in cpu_tb_exec.
    On OpenRISC, which doesn't implement synchronize_from_tb, set_pc was
    being used as a fallback.  The OpenRISC set_pc implementation clears
    dflag, which caused the exception handling logic to not account for the
    delay slot.  This was the bug, because it meant when execution resumed
    after the interrupt was handling it resumed in the wrong place.
    
    Fix this by implementing synchronize_from_tb which simply updates pc,
    and not clear the delay slot flag.
    
    Reported-by: Jason A. Donenfeld <Jason@zx2c4.com>
    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
    Signed-off-by: Stafford Horne <shorne@gmail.com>

commit a92162f4f1dfc2daf1bc8f2bbc3cad3c9d1ea729
Author: Jason A. Donenfeld <Jason@zx2c4.com>
Date:   Tue May 3 11:45:33 2022 +0200

    hw/openrisc: use right OMPIC size variable
    
    This appears to be a copy and paste error. The UART size was used
    instead of the much smaller OMPIC size. But actually that smaller OMPIC
    size is wrong too and doesn't allow the IPI to work in Linux. So set it
    to the old value.
    
    Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
    [smh:Updated OR1KSIM_OMPIC size to use OR1KSIM_CPUS_MAX]
    Signed-off-by: Stafford Horne <shorne@gmail.com>

commit 777784bda46847fc0587d711c3aacff8fff3c3f9
Author: Jason A. Donenfeld <Jason@zx2c4.com>
Date:   Tue May 3 01:20:56 2022 +0200

    hw/openrisc: support 4 serial ports in or1ksim
    
    The 8250 serial controller supports 4 serial ports, so wire them all up,
    so that we can have more than one basic I/O channel.
    
    Cc: Stafford Horne <shorne@gmail.com>
    Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
    [smh:Fixup indentation and lines over 80 chars]
    Signed-off-by: Stafford Horne <shorne@gmail.com>

commit 0a923be2f6427fdf2a5769b4b8a08e26c758dfab
Author: Jason A. Donenfeld <Jason@zx2c4.com>
Date:   Thu Apr 28 12:35:16 2022 +0200

    hw/openrisc: page-align FDT address
    
    The QEMU-provided FDT was only being recognized by the kernel when it
    was used in conjunction with -initrd. Without it, the magic bytes
    wouldn't be there and the kernel couldn't load it. This patch fixes the
    issue by page aligning the provided FDT.
    
    Cc: Stafford Horne <shorne@gmail.com>
    Cc: Peter Maydell <peter.maydell@linaro.org>
    Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
    Signed-off-by: Stafford Horne <shorne@gmail.com>

