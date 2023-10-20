Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 784907D0F71
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 14:12:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619760.965361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtoL4-0002kO-Od; Fri, 20 Oct 2023 12:10:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619760.965361; Fri, 20 Oct 2023 12:10:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtoL4-0002h9-L1; Fri, 20 Oct 2023 12:10:50 +0000
Received: by outflank-mailman (input) for mailman id 619760;
 Fri, 20 Oct 2023 12:10:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qtoL3-0002gz-7W; Fri, 20 Oct 2023 12:10:49 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qtoL3-0001AX-38; Fri, 20 Oct 2023 12:10:49 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qtoL2-0005by-IY; Fri, 20 Oct 2023 12:10:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qtoL2-0003Ni-I6; Fri, 20 Oct 2023 12:10:48 +0000
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
	bh=94t7YqZgWCs4vUvLmNARLRvgB+Iy03SrGLXcfgABPfs=; b=H3t8evLysoHuLoWDZdt7ln4gh4
	6Zr87VYfoSZ/roEb1IT2RqjeYvA4tdiJZ1Yo6u19NC1O5dxl5K2/FKuecQ2G4BNFVJsYg8Zw3boer
	D8t8T6CyJXYd55riaJoDxPz9Jw23n7Y9Rd3zt8ZfEsF9TZPH7TS82+qmPdAWpeTFsyuI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183438-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 183438: regressions - FAIL
X-Osstest-Failures:
    xen-unstable:test-amd64-i386-libvirt-raw:xen-install:fail:regression
    xen-unstable:test-amd64-i386-pair:xen-install/src_host:fail:heisenbug
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-migrupgrade:xen-install/src_host:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=474fc7d3c6525e209bd2fe1e6ef0bbb34de86bb4
X-Osstest-Versions-That:
    xen=698b0f5031c6083401234a9b9415175cc5855a0a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 20 Oct 2023 12:10:48 +0000

flight 183438 xen-unstable real [real]
flight 183441 xen-unstable real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/183438/
http://logs.test-lab.xenproject.org/osstest/logs/183441/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-libvirt-raw   7 xen-install              fail REGR. vs. 183430

Tests which are failing intermittently (not blocking):
 test-amd64-i386-pair        10 xen-install/src_host fail pass in 183441-retest

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop      fail blocked in 183430
 test-amd64-i386-migrupgrade  10 xen-install/src_host         fail  like 183430
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 183430
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 183430
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 183430
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 183430
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 183430
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 183430
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 183430
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 183430
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 183430
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 183430
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 183430
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass

version targeted for testing:
 xen                  474fc7d3c6525e209bd2fe1e6ef0bbb34de86bb4
baseline version:
 xen                  698b0f5031c6083401234a9b9415175cc5855a0a

Last test of basis   183430  2023-10-19 14:38:43 Z    0 days
Testing same since   183438  2023-10-20 01:08:42 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-prev                                             pass    
 build-i386-prev                                              pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-xtf-amd64-amd64-1                                       pass    
 test-xtf-amd64-amd64-2                                       pass    
 test-xtf-amd64-amd64-3                                       pass    
 test-xtf-amd64-amd64-4                                       pass    
 test-xtf-amd64-amd64-5                                       pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  pass    
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
 test-amd64-i386-qemut-rhel6hvm-amd                           pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-i386-xl-qemut-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-i386-xl-qemut-ws16-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-i386-examine-bios                                 pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-i386-examine                                      pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-livepatch                                   pass    
 test-amd64-i386-livepatch                                    pass    
 test-amd64-amd64-migrupgrade                                 pass    
 test-amd64-i386-migrupgrade                                  fail    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         fail    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  fail    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-i386-examine-uefi                                 pass    
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
commit 474fc7d3c6525e209bd2fe1e6ef0bbb34de86bb4
Author: Roger Pau Monne <roger.pau@citrix.com>
Date:   Wed Oct 18 18:07:33 2023 +0200

    iommu/vt-d: fix SAGAW capability parsing
    
    SAGAW is a bitmap field, with bits 1, 2 and 3 signaling support for 3, 4 and 5
    level page tables respectively.  According to the Intel VT-d specification, an
    IOMMU can report multiple SAGAW bits being set.
    
    Commit 859d11b27912 claims to replace the open-coded find_first_set_bit(), but
    it's actually replacing an open coded implementation to find the last set bit.
    The change forces the used AGAW to the lowest supported by the IOMMU instead of
    the highest one between 1 and 2.
    
    Restore the previous SAGAW parsing by using fls() instead of
    find_first_set_bit(), in order to get the highest (supported) AGAW to be used.
    
    However there's a caveat related to the value the AW context entry field must
    be set to when using passthrough mode:
    
    "When the Translation-type (TT) field indicates pass-through processing (10b),
    this field must be programmed to indicate the largest AGAW value supported by
    hardware." [0]
    
    Newer Intel IOMMU implementations support 5 level page tables for the IOMMU,
    and signal such support in SAGAW bit 3.
    
    Enabling 5 level paging support (AGAW 3) is too risky at this point in the Xen
    4.18 release, so instead put a bodge to unconditionally disable passthough
    mode if SAGAW has any bits greater than 2 set.  Ignore bit 0; it's reserved in
    current specifications, but had a meaning in the past and is unlikely to be
    reused in the future.
    
    Note the message about unhandled SAGAW bits being set is printed
    unconditionally, regardless of whether passthrough mode is enabled.  This is
    done in order to easily notice IOMMU implementations with not yet supported
    SAGAW values.
    
    [0] Intel VT Directed Spec Rev 4.1
    
    Fixes: 859d11b27912 ('VT-d: prune SAGAW recognition')
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Release-acked-by: Henry Wang <Henry.Wang@arm.com>

commit 94a5127ebeb4a005f128150909ca78bfea50206a
Author: Roger Pau Monne <roger.pau@citrix.com>
Date:   Thu Oct 19 12:45:51 2023 +0200

    iommu: fix quarantine mode command line documentation
    
    With the addition of per-device quarantine page tables the sink page is now
    exclusive for each device, and thus writable.  Update the documentation to
    reflect the current implementation.
    
    Fixes: 14dd241aad8a ('IOMMU/x86: use per-device page tables for quarantining')
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Release-acked-by: Henry Wang <Henry.Wang@arm.com>

commit 11f81a5a2c74d021d34bd5d4a0f02a210df21b1c
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Oct 19 14:08:22 2023 +0200

    EFI: reduce memory map logging level
    
    With the release build default now being INFO, the typically long EFI
    memory map will want logging at DEBUG level only.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>

commit 196a8fac1cb5df44214c255420d465be8bff1040
Author: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Date:   Fri Oct 6 04:05:19 2023 +0200

    automation: extract QEMU log in relevant hardware tests
    
    Let it be printed to the console too. QEMU and Linux messages have
    different enough format that it should be possible to distinguish them.
    
    Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Acked-by: Stefano Stabellini <sstabellini@kernel.org>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Release-acked-by: Henry Wang <Henry.Wang@arm.com>

commit cbb0fdc0d7b7321d9293e974ea975999be1a3053
Author: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Date:   Fri Oct 6 04:05:18 2023 +0200

    automation: improve checking for MSI/MSI-X in PCI passthrough tests
    
    Checking /proc/interrupts is unreliable because different drivers set
    different names there. Install pciutils and use lspci instead.
    In fact, the /proc/interrupts content was confusing enough that
    adl-pci-hvm had it wrong (MSI-X is in use there). Fix this too.
    
    Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Acked-by: Stefano Stabellini <sstabellini@kernel.org>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Release-acked-by: Henry Wang <Henry.Wang@arm.com>

commit 9c34956b1916b2fcc2de8022b4d94202e46f1026
Author: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Date:   Fri Oct 6 04:05:17 2023 +0200

    automation: cleanup test alpine install
    
    Remove parts of initramfs for the test system (domU, and in few tests
    dom0 too) that are not not working and are not really needed in this
    simple system.
    
    This makes the test log much lighter on misleading error messages.
    
    Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Acked-by: Stefano Stabellini <sstabellini@kernel.org>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Release-acked-by: Henry Wang <Henry.Wang@arm.com>

commit 052813b1d23b0d148da1c39f2b7e4aacdba06bca
Author: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Date:   Fri Oct 6 04:05:16 2023 +0200

    automation: hide timeout countdown in log
    
    grep+sleep message every 1s makes job log unnecessary hard to read.
    
    Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Acked-by: Stefano Stabellini <sstabellini@kernel.org>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Release-acked-by: Henry Wang <Henry.Wang@arm.com>

commit dfe5bfc3d55811e285c9198febf3230eecc7f837
Author: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Date:   Fri Oct 6 04:05:15 2023 +0200

    automation: include real-time view of the domU console log too
    
    Passthrough domU console log to the serial console in real time, not
    only after the test. First of all, this gives domU console also in case
    of test failure. But also, allows correlation between domU and dom0 or
    Xen messages.
    
    To avoid ambiguity, add log prefix with 'sed'.
    
    Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Acked-by: Stefano Stabellini <sstabellini@kernel.org>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Release-acked-by: Henry Wang <Henry.Wang@arm.com>
(qemu changes not included)

