Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E3A65A3B3
	for <lists+xen-devel@lfdr.de>; Sat, 31 Dec 2022 12:10:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470011.729463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pBZjB-000803-PZ; Sat, 31 Dec 2022 11:08:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470011.729463; Sat, 31 Dec 2022 11:08:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pBZjB-0007xT-Ma; Sat, 31 Dec 2022 11:08:37 +0000
Received: by outflank-mailman (input) for mailman id 470011;
 Sat, 31 Dec 2022 11:08:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pBZjA-0007xJ-6F; Sat, 31 Dec 2022 11:08:36 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pBZjA-0003RF-4D; Sat, 31 Dec 2022 11:08:36 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pBZj9-0006Zq-MG; Sat, 31 Dec 2022 11:08:35 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pBZj9-0005fW-Lk; Sat, 31 Dec 2022 11:08:35 +0000
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
	bh=ySKN2C5g6MSOgbsKp5O2LouK8V2iNNJy/YLoWn2VTn8=; b=5ZjYt5/UGXTCEliE301Rc+yZhO
	rp2cknbVnZJMpgZaSCIlZZAxsQLdweF0Ev1GU02jwxXvD6tvnfAca3X9rMel3cCvpHJxWVHy8H38+
	8FqRfuinQb97gVRaKI5o6mxCw+B+TSoYI965z8jnN6SIprFfholIWHJzjy1jxkTY9StA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175535-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 175535: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-xl-credit1:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-qemuu-nested-intel:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-dom0pvh-xl-amd:guest-start:fail:regression
    linux-linus:test-amd64-amd64-libvirt-raw:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-libvirt-qcow2:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-pvhv2-amd:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-vhd:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-qemuu-nested-amd:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-freebsd12-amd64:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-xsm:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-amd64:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-pvhv2-intel:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-credit2:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-pair:xen-boot/src_host:fail:regression
    linux-linus:test-amd64-amd64-libvirt-xsm:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-pair:xen-boot/dst_host:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-libvirt-pair:xen-boot/src_host:fail:regression
    linux-linus:test-amd64-amd64-libvirt-pair:xen-boot/dst_host:fail:regression
    linux-linus:test-amd64-amd64-freebsd11-amd64:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-pygrub:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-shadow:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-libvirt:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-multivcpu:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-examine-uefi:reboot:fail:regression
    linux-linus:test-amd64-amd64-dom0pvh-xl-intel:guest-start:fail:regression
    linux-linus:test-amd64-amd64-xl-pvshim:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-xl-vhd:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-xl-multivcpu:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-ovmf-amd64:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-libvirt-raw:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-libvirt:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-examine-bios:reboot:fail:regression
    linux-linus:test-amd64-amd64-examine:reboot:fail:regression
    linux-linus:test-amd64-coresched-amd64-xl:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-libvirt-qcow2:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-xl-arndale:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-xl:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-examine:reboot:fail:regression
    linux-linus:test-armhf-armhf-xl-credit1:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-xl-credit2:xen-boot:fail:regression
    linux-linus:build-arm64-pvops:kernel-build:fail:regression
    linux-linus:test-armhf-armhf-xl-rtds:xen-boot:fail:allowable
    linux-linus:test-amd64-amd64-xl-rtds:xen-boot:fail:allowable
    linux-linus:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-examine:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=c8451c141e07a8d05693f6c8d0e418fbb4b68bb7
X-Osstest-Versions-That:
    linux=9d84bb40bcb30a7fa16f33baa967aeb9953dda78
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 31 Dec 2022 11:08:35 +0000

flight 175535 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175535/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-credit1   8 xen-boot                 fail REGR. vs. 173462
 test-amd64-amd64-qemuu-nested-intel  8 xen-boot          fail REGR. vs. 173462
 test-amd64-amd64-xl-qemuu-ws16-amd64  8 xen-boot         fail REGR. vs. 173462
 test-amd64-amd64-xl-qemut-win7-amd64  8 xen-boot         fail REGR. vs. 173462
 test-amd64-amd64-dom0pvh-xl-amd 14 guest-start           fail REGR. vs. 173462
 test-amd64-amd64-libvirt-raw  8 xen-boot                 fail REGR. vs. 173462
 test-amd64-amd64-libvirt-qcow2  8 xen-boot               fail REGR. vs. 173462
 test-amd64-amd64-xl-pvhv2-amd  8 xen-boot                fail REGR. vs. 173462
 test-amd64-amd64-xl-vhd       8 xen-boot                 fail REGR. vs. 173462
 test-amd64-amd64-qemuu-nested-amd  8 xen-boot            fail REGR. vs. 173462
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm  8 xen-boot fail REGR. vs. 173462
 test-amd64-amd64-xl-qemut-ws16-amd64  8 xen-boot         fail REGR. vs. 173462
 test-amd64-amd64-freebsd12-amd64  8 xen-boot             fail REGR. vs. 173462
 test-amd64-amd64-xl-xsm       8 xen-boot                 fail REGR. vs. 173462
 test-amd64-amd64-xl-qemut-debianhvm-amd64  8 xen-boot    fail REGR. vs. 173462
 test-amd64-amd64-xl-qemuu-win7-amd64  8 xen-boot         fail REGR. vs. 173462
 test-amd64-amd64-xl-pvhv2-intel  8 xen-boot              fail REGR. vs. 173462
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm  8 xen-boot fail REGR. vs. 173462
 test-amd64-amd64-xl-credit2   8 xen-boot                 fail REGR. vs. 173462
 test-amd64-amd64-pair        12 xen-boot/src_host        fail REGR. vs. 173462
 test-amd64-amd64-libvirt-xsm  8 xen-boot                 fail REGR. vs. 173462
 test-amd64-amd64-pair        13 xen-boot/dst_host        fail REGR. vs. 173462
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 8 xen-boot fail REGR. vs. 173462
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 8 xen-boot fail REGR. vs. 173462
 test-amd64-amd64-libvirt-pair 12 xen-boot/src_host       fail REGR. vs. 173462
 test-amd64-amd64-libvirt-pair 13 xen-boot/dst_host       fail REGR. vs. 173462
 test-amd64-amd64-freebsd11-amd64  8 xen-boot             fail REGR. vs. 173462
 test-amd64-amd64-pygrub       8 xen-boot                 fail REGR. vs. 173462
 test-amd64-amd64-xl-shadow    8 xen-boot                 fail REGR. vs. 173462
 test-amd64-amd64-libvirt      8 xen-boot                 fail REGR. vs. 173462
 test-amd64-amd64-xl-multivcpu  8 xen-boot                fail REGR. vs. 173462
 test-amd64-amd64-examine-uefi  8 reboot                  fail REGR. vs. 173462
 test-amd64-amd64-dom0pvh-xl-intel 14 guest-start         fail REGR. vs. 173462
 test-amd64-amd64-xl-pvshim    8 xen-boot                 fail REGR. vs. 173462
 test-armhf-armhf-xl-vhd       8 xen-boot                 fail REGR. vs. 173462
 test-armhf-armhf-xl-multivcpu  8 xen-boot                fail REGR. vs. 173462
 test-amd64-amd64-xl-qemuu-ovmf-amd64  8 xen-boot         fail REGR. vs. 173462
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  8 xen-boot    fail REGR. vs. 173462
 test-armhf-armhf-libvirt-raw  8 xen-boot                 fail REGR. vs. 173462
 test-armhf-armhf-libvirt      8 xen-boot                 fail REGR. vs. 173462
 test-amd64-amd64-xl           8 xen-boot                 fail REGR. vs. 173462
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 8 xen-boot fail REGR. vs. 173462
 test-amd64-amd64-examine-bios  8 reboot                  fail REGR. vs. 173462
 test-amd64-amd64-examine      8 reboot                   fail REGR. vs. 173462
 test-amd64-coresched-amd64-xl  8 xen-boot                fail REGR. vs. 173462
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 8 xen-boot fail REGR. vs. 173462
 test-armhf-armhf-libvirt-qcow2  8 xen-boot               fail REGR. vs. 173462
 test-armhf-armhf-xl-arndale   8 xen-boot                 fail REGR. vs. 173462
 test-armhf-armhf-xl           8 xen-boot                 fail REGR. vs. 173462
 test-armhf-armhf-examine      8 reboot                   fail REGR. vs. 173462
 test-armhf-armhf-xl-credit1   8 xen-boot                 fail REGR. vs. 173462
 test-armhf-armhf-xl-credit2   8 xen-boot                 fail REGR. vs. 173462
 build-arm64-pvops             6 kernel-build             fail REGR. vs. 173462

Regressions which are regarded as allowable (not blocking):
 test-armhf-armhf-xl-rtds      8 xen-boot                 fail REGR. vs. 173462
 test-amd64-amd64-xl-rtds      8 xen-boot                 fail REGR. vs. 173462

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-credit1   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-seattle   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-vhd       1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-arm64-arm64-examine      1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass

version targeted for testing:
 linux                c8451c141e07a8d05693f6c8d0e418fbb4b68bb7
baseline version:
 linux                9d84bb40bcb30a7fa16f33baa967aeb9953dda78

Last test of basis   173462  2022-10-07 18:41:45 Z   84 days
Failing since        173470  2022-10-08 06:21:34 Z   84 days  173 attempts
Testing same since   175532  2022-12-30 20:43:08 Z    0 days    2 attempts

------------------------------------------------------------
3252 people touched revisions under test,
not listing them all

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
 test-amd64-amd64-xl                                          fail    
 test-amd64-coresched-amd64-xl                                fail    
 test-arm64-arm64-xl                                          blocked 
 test-armhf-armhf-xl                                          fail    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           fail    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        fail    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 fail    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 fail    
 test-amd64-amd64-libvirt-xsm                                 fail    
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-amd64-amd64-xl-xsm                                      fail    
 test-arm64-arm64-xl-xsm                                      blocked 
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                fail    
 test-amd64-amd64-dom0pvh-xl-amd                              fail    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    fail    
 test-amd64-amd64-freebsd11-amd64                             fail    
 test-amd64-amd64-freebsd12-amd64                             fail    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         fail    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-armhf-armhf-xl-arndale                                  fail    
 test-amd64-amd64-examine-bios                                fail    
 test-amd64-amd64-xl-credit1                                  fail    
 test-arm64-arm64-xl-credit1                                  blocked 
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  fail    
 test-arm64-arm64-xl-credit2                                  blocked 
 test-armhf-armhf-xl-credit2                                  fail    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        fail    
 test-amd64-amd64-examine                                     fail    
 test-arm64-arm64-examine                                     blocked 
 test-armhf-armhf-examine                                     fail    
 test-amd64-amd64-qemuu-nested-intel                          fail    
 test-amd64-amd64-xl-pvhv2-intel                              fail    
 test-amd64-amd64-dom0pvh-xl-intel                            fail    
 test-amd64-amd64-libvirt                                     fail    
 test-armhf-armhf-libvirt                                     fail    
 test-amd64-amd64-xl-multivcpu                                fail    
 test-armhf-armhf-xl-multivcpu                                fail    
 test-amd64-amd64-pair                                        fail    
 test-amd64-amd64-libvirt-pair                                fail    
 test-amd64-amd64-xl-pvshim                                   fail    
 test-amd64-amd64-pygrub                                      fail    
 test-amd64-amd64-libvirt-qcow2                               fail    
 test-armhf-armhf-libvirt-qcow2                               fail    
 test-amd64-amd64-libvirt-raw                                 fail    
 test-arm64-arm64-libvirt-raw                                 blocked 
 test-armhf-armhf-libvirt-raw                                 fail    
 test-amd64-amd64-xl-rtds                                     fail    
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             fail    
 test-amd64-amd64-xl-shadow                                   fail    
 test-arm64-arm64-xl-thunderx                                 blocked 
 test-amd64-amd64-examine-uefi                                fail    
 test-amd64-amd64-xl-vhd                                      fail    
 test-arm64-arm64-xl-vhd                                      blocked 
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

(No revision log; it would be 496156 lines long.)

