Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8ADB6C04B3
	for <lists+xen-devel@lfdr.de>; Sun, 19 Mar 2023 21:13:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511670.790790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdzOc-0006w7-Qn; Sun, 19 Mar 2023 20:12:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511670.790790; Sun, 19 Mar 2023 20:12:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdzOc-0006tY-NP; Sun, 19 Mar 2023 20:12:50 +0000
Received: by outflank-mailman (input) for mailman id 511670;
 Sun, 19 Mar 2023 20:12:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pdzOb-0006tO-RM; Sun, 19 Mar 2023 20:12:49 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pdzOb-0004Vq-NS; Sun, 19 Mar 2023 20:12:49 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pdzOb-000352-AW; Sun, 19 Mar 2023 20:12:49 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pdzOb-00028D-AB; Sun, 19 Mar 2023 20:12:49 +0000
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
	bh=y0gBlQS4fNXMlWbZlpied+fXp19rvOhRKXLRh5FCu8g=; b=fB4yujTJSyiZ/TIXYWUUrpvMOG
	xKH3k4SSuX85UXDOYtA7vzq+I6y2hi8zm3Cq8BzvCZdhyDejaFV4H0Bb+2rrj5dbS9y/Nywcp1VRo
	TevDI2ZPuSj8uiS88Ha706hc/nl/JrwufMD8n5V8m0fdB1L51pI0H8F+9PBGhcyJsi8s=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-179774-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 179774: regressions - trouble: fail/pass/starved
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-freebsd12-amd64:guest-start:fail:regression
    linux-linus:test-amd64-amd64-pair:guest-migrate/src_host/dst_host:fail:regression
    linux-linus:test-amd64-amd64-xl-credit1:guest-localmigrate:fail:regression
    linux-linus:test-amd64-amd64-xl-shadow:guest-start:fail:regression
    linux-linus:test-amd64-amd64-xl-pvhv2-intel:guest-saverestore:fail:regression
    linux-linus:test-amd64-amd64-xl-xsm:guest-start:fail:regression
    linux-linus:test-amd64-amd64-xl:guest-start:fail:regression
    linux-linus:test-amd64-amd64-xl-pvhv2-amd:guest-start:fail:regression
    linux-linus:test-amd64-amd64-freebsd11-amd64:guest-localmigrate:fail:regression
    linux-linus:test-amd64-amd64-dom0pvh-xl-intel:guest-start:fail:regression
    linux-linus:test-amd64-amd64-xl-multivcpu:guest-localmigrate/x10:fail:regression
    linux-linus:test-amd64-amd64-dom0pvh-xl-amd:guest-start:fail:regression
    linux-linus:test-amd64-amd64-libvirt-xsm:guest-start:fail:regression
    linux-linus:test-amd64-amd64-libvirt-pair:guest-migrate/dst_host/src_host/debian.repeat:fail:regression
    linux-linus:test-arm64-arm64-xl-thunderx:guest-start:fail:regression
    linux-linus:test-arm64-arm64-xl-xsm:guest-start:fail:regression
    linux-linus:test-amd64-amd64-xl-credit2:guest-localmigrate/x10:fail:regression
    linux-linus:test-arm64-arm64-xl-credit2:guest-start:fail:regression
    linux-linus:test-arm64-arm64-libvirt-xsm:guest-start:fail:regression
    linux-linus:test-arm64-arm64-xl:guest-start:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:guest-localmigrate/x10:fail:regression
    linux-linus:test-arm64-arm64-xl-credit1:guest-start/debian.repeat:fail:regression
    linux-linus:test-amd64-amd64-qemuu-nested-intel:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-libvirt:guest-start:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:guest-localmigrate/x10:fail:regression
    linux-linus:test-amd64-coresched-amd64-xl:guest-start:fail:regression
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-amd64:debian-hvm-install:fail:regression
    linux-linus:build-i386-pvops:kernel-build:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-xl-pvshim:guest-start:fail:regression
    linux-linus:test-amd64-amd64-xl-vhd:debian-di-install:fail:regression
    linux-linus:test-amd64-amd64-pygrub:debian-di-install:fail:regression
    linux-linus:test-amd64-amd64-libvirt-raw:debian-di-install:fail:regression
    linux-linus:test-amd64-amd64-libvirt-qcow2:debian-di-install:fail:regression
    linux-linus:test-arm64-arm64-xl-vhd:debian-di-install:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:debian-hvm-install:fail:regression
    linux-linus:test-arm64-arm64-libvirt-raw:debian-di-install:fail:regression
    linux-linus:test-amd64-amd64-xl-rtds:guest-start:fail:allowable
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-examine:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-libvirt:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-xl:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:build-check(1):starved:nonblocking
    linux-linus:build-armhf-libvirt:build-check(1):starved:nonblocking
    linux-linus:build-armhf:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    linux=a3671bd86a9770e34969522d29bb30a1b66fd88a
X-Osstest-Versions-That:
    linux=3f0b0903fde584a7398f82fc00bf4f8138610b87
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 19 Mar 2023 20:12:49 +0000

flight 179774 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/179774/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-freebsd12-amd64 13 guest-start          fail REGR. vs. 178042
 test-amd64-amd64-pair 26 guest-migrate/src_host/dst_host fail REGR. vs. 178042
 test-amd64-amd64-xl-credit1  18 guest-localmigrate       fail REGR. vs. 178042
 test-amd64-amd64-xl-shadow   14 guest-start              fail REGR. vs. 178042
 test-amd64-amd64-xl-pvhv2-intel 17 guest-saverestore     fail REGR. vs. 178042
 test-amd64-amd64-xl-xsm      14 guest-start              fail REGR. vs. 178042
 test-amd64-amd64-xl          14 guest-start              fail REGR. vs. 178042
 test-amd64-amd64-xl-pvhv2-amd 14 guest-start             fail REGR. vs. 178042
 test-amd64-amd64-freebsd11-amd64 17 guest-localmigrate   fail REGR. vs. 178042
 test-amd64-amd64-dom0pvh-xl-intel 14 guest-start         fail REGR. vs. 178042
 test-amd64-amd64-xl-multivcpu 20 guest-localmigrate/x10  fail REGR. vs. 178042
 test-amd64-amd64-dom0pvh-xl-amd 14 guest-start           fail REGR. vs. 178042
 test-amd64-amd64-libvirt-xsm 14 guest-start              fail REGR. vs. 178042
 test-amd64-amd64-libvirt-pair 28 guest-migrate/dst_host/src_host/debian.repeat fail REGR. vs. 178042
 test-arm64-arm64-xl-thunderx 14 guest-start              fail REGR. vs. 178042
 test-arm64-arm64-xl-xsm      14 guest-start              fail REGR. vs. 178042
 test-amd64-amd64-xl-credit2  20 guest-localmigrate/x10   fail REGR. vs. 178042
 test-arm64-arm64-xl-credit2  14 guest-start              fail REGR. vs. 178042
 test-arm64-arm64-libvirt-xsm 14 guest-start              fail REGR. vs. 178042
 test-arm64-arm64-xl          14 guest-start              fail REGR. vs. 178042
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 18 guest-localmigrate/x10 fail REGR. vs. 178042
 test-arm64-arm64-xl-credit1 18 guest-start/debian.repeat fail REGR. vs. 178042
 test-amd64-amd64-qemuu-nested-intel 12 debian-hvm-install fail REGR. vs. 178042
 test-amd64-amd64-libvirt     14 guest-start              fail REGR. vs. 178042
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 18 guest-localmigrate/x10 fail REGR. vs. 178042
 test-amd64-coresched-amd64-xl 14 guest-start             fail REGR. vs. 178042
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 12 debian-hvm-install fail REGR. vs. 178042
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 12 debian-hvm-install fail REGR. vs. 178042
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 12 debian-hvm-install fail REGR. vs. 178042
 test-amd64-amd64-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail REGR. vs. 178042
 test-amd64-amd64-xl-qemut-debianhvm-amd64 12 debian-hvm-install fail REGR. vs. 178042
 build-i386-pvops              6 kernel-build             fail REGR. vs. 178042
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 12 debian-hvm-install fail REGR. vs. 178042
 test-amd64-amd64-qemuu-nested-amd 12 debian-hvm-install  fail REGR. vs. 178042
 test-amd64-amd64-xl-pvshim   14 guest-start              fail REGR. vs. 178042
 test-amd64-amd64-xl-vhd      12 debian-di-install        fail REGR. vs. 178042
 test-amd64-amd64-pygrub      12 debian-di-install        fail REGR. vs. 178042
 test-amd64-amd64-libvirt-raw 12 debian-di-install        fail REGR. vs. 178042
 test-amd64-amd64-libvirt-qcow2 12 debian-di-install      fail REGR. vs. 178042
 test-arm64-arm64-xl-vhd      12 debian-di-install        fail REGR. vs. 178042
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 12 debian-hvm-install fail REGR. vs. 178042
 test-arm64-arm64-libvirt-raw 12 debian-di-install        fail REGR. vs. 178042

Regressions which are regarded as allowable (not blocking):
 test-amd64-amd64-xl-rtds     14 guest-start              fail REGR. vs. 178042

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 178042
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 178042
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 178042
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 178042
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-examine      1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt-qcow2  1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               starved  n/a
 test-armhf-armhf-xl           1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-credit1   1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-credit2   1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-cubietruck  1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-multivcpu  1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-rtds      1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-vhd       1 build-check(1)               starved  n/a
 build-armhf-libvirt           1 build-check(1)               starved  n/a
 build-armhf                   2 hosts-allocate               starved  n/a

version targeted for testing:
 linux                a3671bd86a9770e34969522d29bb30a1b66fd88a
baseline version:
 linux                3f0b0903fde584a7398f82fc00bf4f8138610b87

Last test of basis   178042  2023-02-21 17:44:43 Z   26 days
Failing since        178093  2023-02-22 05:02:47 Z   25 days   48 attempts
Testing same since   179774  2023-03-19 06:52:53 Z    0 days    1 attempts

------------------------------------------------------------
2187 people touched revisions under test,
not listing them all

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  starved 
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          starved 
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             fail    
 test-amd64-amd64-xl                                          fail    
 test-amd64-coresched-amd64-xl                                fail    
 test-arm64-arm64-xl                                          fail    
 test-armhf-armhf-xl                                          starved 
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           fail    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        fail    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 fail    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 fail    
 test-amd64-amd64-libvirt-xsm                                 fail    
 test-arm64-arm64-libvirt-xsm                                 fail    
 test-amd64-amd64-xl-xsm                                      fail    
 test-arm64-arm64-xl-xsm                                      fail    
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
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  fail    
 test-arm64-arm64-xl-credit1                                  fail    
 test-armhf-armhf-xl-credit1                                  starved 
 test-amd64-amd64-xl-credit2                                  fail    
 test-arm64-arm64-xl-credit2                                  fail    
 test-armhf-armhf-xl-credit2                                  starved 
 test-armhf-armhf-xl-cubietruck                               starved 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        fail    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     starved 
 test-amd64-amd64-qemuu-nested-intel                          fail    
 test-amd64-amd64-xl-pvhv2-intel                              fail    
 test-amd64-amd64-dom0pvh-xl-intel                            fail    
 test-amd64-amd64-libvirt                                     fail    
 test-armhf-armhf-libvirt                                     starved 
 test-amd64-amd64-xl-multivcpu                                fail    
 test-armhf-armhf-xl-multivcpu                                starved 
 test-amd64-amd64-pair                                        fail    
 test-amd64-amd64-libvirt-pair                                fail    
 test-amd64-amd64-xl-pvshim                                   fail    
 test-amd64-amd64-pygrub                                      fail    
 test-amd64-amd64-libvirt-qcow2                               fail    
 test-armhf-armhf-libvirt-qcow2                               starved 
 test-amd64-amd64-libvirt-raw                                 fail    
 test-arm64-arm64-libvirt-raw                                 fail    
 test-armhf-armhf-libvirt-raw                                 starved 
 test-amd64-amd64-xl-rtds                                     fail    
 test-armhf-armhf-xl-rtds                                     starved 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             fail    
 test-amd64-amd64-xl-shadow                                   fail    
 test-arm64-arm64-xl-thunderx                                 fail    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-xl-vhd                                      fail    
 test-arm64-arm64-xl-vhd                                      fail    
 test-armhf-armhf-xl-vhd                                      starved 


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

(No revision log; it would be 255671 lines long.)

