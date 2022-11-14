Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21ABD6273E6
	for <lists+xen-devel@lfdr.de>; Mon, 14 Nov 2022 01:41:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443048.697431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouNWB-0003ie-5k; Mon, 14 Nov 2022 00:40:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443048.697431; Mon, 14 Nov 2022 00:40:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouNWB-0003gu-2U; Mon, 14 Nov 2022 00:40:07 +0000
Received: by outflank-mailman (input) for mailman id 443048;
 Mon, 14 Nov 2022 00:40:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ouNWA-0003gk-Ba; Mon, 14 Nov 2022 00:40:06 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ouNWA-0003Wc-70; Mon, 14 Nov 2022 00:40:06 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ouNW9-0000w9-N6; Mon, 14 Nov 2022 00:40:05 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ouNW9-0000RA-Kt; Mon, 14 Nov 2022 00:40:05 +0000
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
	bh=0cmDFqiSfWeRA8TVzzF1o1AFd/1QZCrBupoKLObZfYc=; b=IB98+wTmHX1VMurFgxEd3z0dAR
	CU7BUv2BSzSLj1tVr7J1TLQlLsP2jC/MAUnhQ+nUorXiHaoTwcQ8U0tr+9ppPX4VddL7WDCc1046d
	iRM+sM4NQLygrCDin771hOtCdLTC27pLUu20NzEeEa0xXRI+KjEn9wwJjEYJtTDHHwrE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-174756-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 174756: regressions - FAIL
X-Osstest-Failures:
    qemu-mainline:test-amd64-amd64-xl-qcow2:guest-start/debian.repeat:fail:regression
    qemu-mainline:test-armhf-armhf-libvirt-raw:xen-boot:fail:heisenbug
    qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:windows-install:fail:heisenbug
    qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    qemuu=305f6f62d9d250a32cdf090ddcb7e3a5b26a342e
X-Osstest-Versions-That:
    qemuu=6a4cff8e1a80bafc4b8fe2bfb10081f4880d1b3b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 14 Nov 2022 00:40:05 +0000

flight 174756 qemu-mainline real [real]
flight 174759 qemu-mainline real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/174756/
http://logs.test-lab.xenproject.org/osstest/logs/174759/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qcow2   21 guest-start/debian.repeat fail REGR. vs. 174752

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-libvirt-raw  8 xen-boot            fail pass in 174759-retest
 test-amd64-amd64-xl-qemuu-ws16-amd64 12 windows-install fail pass in 174759-retest

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop  fail in 174759 like 174752
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check fail in 174759 like 174752
 test-armhf-armhf-libvirt-raw 14 migrate-support-check fail in 174759 never pass
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 174752
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 174752
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 174752
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 174752
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 174752
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 174752
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 qemuu                305f6f62d9d250a32cdf090ddcb7e3a5b26a342e
baseline version:
 qemuu                6a4cff8e1a80bafc4b8fe2bfb10081f4880d1b3b

Last test of basis   174752  2022-11-13 01:10:32 Z    0 days
Testing same since   174756  2022-11-13 11:40:07 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bin Meng <bmeng@tinylab.org>
  Philippe Mathieu-Daudé <f4bug@amsat.org>
  Philippe Mathieu-Daudé <philmd@linaro.org>
  Richard Henderson <richard.henderson@linaro.org>
  Song Gao <gaosong@loongson.cn>
  Stefan Hajnoczi <stefanha@redhat.com>

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
 test-armhf-armhf-xl-arndale                                  pass    
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
 test-amd64-amd64-xl-qcow2                                    fail    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 fail    
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
commit 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e
Merge: 57bc6e40e8 46b21de238
Author: Stefan Hajnoczi <stefanha@redhat.com>
Date:   Sat Nov 12 09:17:06 2022 -0500

    Merge tag 'pull-la-20221112' of https://gitlab.com/rth7680/qemu into staging
    
    Fix loongarch make check-tcg failure.
    
    # -----BEGIN PGP SIGNATURE-----
    #
    # iQFRBAABCgA7FiEEekgeeIaLTbaoWgXAZN846K9+IV8FAmNu8aUdHHJpY2hhcmQu
    # aGVuZGVyc29uQGxpbmFyby5vcmcACgkQZN846K9+IV90jAgAsaB0nU7YGzJRYRmK
    # +QXtrQa5AmXf014X7OeOZyxdYCPCwri2rnCxc1eOKAIOeSbdFY54xjXXEV8qpej+
    # ZiLbdvXFG519vJpZquEJm1wgk68NnKYy2wfeRuwBMcQD4E7yeE9y11IKtuN6vbcq
    # sh/Zxh43KwzyZ1wrVQl8DUxesTcE4RwVDJ+t2q+uYKcgmUVRQJJd9aXLkOKpOb1f
    # QU+6lJAGv293IbW5LUD8fIPNKVWqlVwDIsFVWhYYJFxvWfbL211NsJbX70RnKahr
    # vJ6olGORlShNJEiV++9QTrgGr1v76KkVECaKNtohkYL/BkfNxoy4yWxcC7I9zds+
    # 6oH9vQ==
    # =7NI1
    # -----END PGP SIGNATURE-----
    # gpg: Signature made Fri 11 Nov 2022 20:06:45 EST
    # gpg:                using RSA key 7A481E78868B4DB6A85A05C064DF38E8AF7E215F
    # gpg:                issuer "richard.henderson@linaro.org"
    # gpg: Good signature from "Richard Henderson <richard.henderson@linaro.org>" [full]
    # Primary key fingerprint: 7A48 1E78 868B 4DB6 A85A  05C0 64DF 38E8 AF7E 215F
    
    * tag 'pull-la-20221112' of https://gitlab.com/rth7680/qemu:
      hw/loongarch: Fix loongarch fdt addr confict
    
    Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

commit 57bc6e40e82c0446a358ab01f9bbf0db0d9465e4
Author: Philippe Mathieu-Daudé <f4bug@amsat.org>
Date:   Fri Nov 11 13:45:50 2022 +0100

    libvduse: Avoid warning about dangerous use of strncpy()
    
    GCC 8 added a -Wstringop-truncation warning:
    
      The -Wstringop-truncation warning added in GCC 8.0 via r254630 for
      bug 81117 is specifically intended to highlight likely unintended
      uses of the strncpy function that truncate the terminating NUL
      character from the source string.
    
    Here the next line indeed unconditionally zeroes the last byte, but
    1/ the buffer has been calloc'd, so we don't need to add an extra
    byte, and 2/ we called vduse_name_is_invalid() which checked the
    string length, so we can simply call strcpy().
    
    This fixes when using gcc (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0:
    
      [42/666] Compiling C object subprojects/libvduse/libvduse.a.p/libvduse.c.o
      FAILED: subprojects/libvduse/libvduse.a.p/libvduse.c.o
      cc -m64 -mcx16 -Isubprojects/libvduse/libvduse.a.p -Isubprojects/libvduse -I../../subprojects/libvduse [...] -o subprojects/libvduse/libvduse.a.p/libvduse.c.o -c ../../subprojects/libvduse/libvduse.c
      In file included from /usr/include/string.h:495,
                       from ../../subprojects/libvduse/libvduse.c:24:
      In function ‘strncpy’,
          inlined from ‘vduse_dev_create’ at ../../subprojects/libvduse/libvduse.c:1312:5:
      /usr/include/x86_64-linux-gnu/bits/string_fortified.h:106:10: error: ‘__builtin_strncpy’ specified bound 256 equals destination size [-Werror=stringop-truncation]
        106 |   return __builtin___strncpy_chk (__dest, __src, __len, __bos (__dest));
            |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      cc1: all warnings being treated as errors
      ninja: build stopped: cannot make progress due to previous errors.
    
    Fixes: d9cf16c0be ("libvduse: Replace strcpy() with strncpy()")
    Suggested-by: Markus Armbruster <armbru@redhat.com>
    Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
    Reviewed-by: Xie Yongji <xieyongji@bytedance.com>
    Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
    Tested-by: Bin Meng <bmeng@tinylab.org>
    Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
    Message-Id: <20221111124550.35753-1-philmd@linaro.org>

commit 46b21de238c643ea098f2dcffe493abd135f7d89
Author: Song Gao <gaosong@loongson.cn>
Date:   Wed Nov 9 10:04:49 2022 +0800

    hw/loongarch: Fix loongarch fdt addr confict
    
    Fix LoongArch check-tcg error:
       TEST    hello on loongarch64
    qemu-system-loongarch64: Some ROM regions are overlapping
    These ROM regions might have been loaded by direct user request or by default.
    They could be BIOS/firmware images, a guest kernel, initrd or some other file loaded into guest memory.
    Check whether you intended to load all this guest code, and whether it has been built to load to the correct addresses.
    
    The following two regions overlap (in the memory address space):
       hello ELF program header segment 0 (addresses 0x0000000000200000 - 0x0000000000242000)
       fdt (addresses 0x0000000000200000 - 0x0000000000300000)
    make[1]: *** [Makefile:177: run-hello] Error 1
    
    Fixes: 021836936ef ("hw/loongarch: Load FDT table into dram memory space")
    Reported-by: Richard Henderson <richard.henderson@linaro.org>
    Signed-off-by: Song Gao <gaosong@loongson.cn>
    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
    Message-Id: <20221109020449.978064-1-gaosong@loongson.cn>
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

