Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0C8741009
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jun 2023 13:28:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556434.868970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qETKt-0001TB-93; Wed, 28 Jun 2023 11:27:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556434.868970; Wed, 28 Jun 2023 11:27:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qETKt-0001Qt-4f; Wed, 28 Jun 2023 11:27:47 +0000
Received: by outflank-mailman (input) for mailman id 556434;
 Wed, 28 Jun 2023 11:27:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qETKr-0001Qj-9S; Wed, 28 Jun 2023 11:27:45 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qETKr-0000hY-33; Wed, 28 Jun 2023 11:27:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qETKq-0008Pi-HW; Wed, 28 Jun 2023 11:27:44 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qETKq-00055B-Gs; Wed, 28 Jun 2023 11:27:44 +0000
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
	bh=bVnnv1PMlDnyVO8p0sKxRMztrXUMgIBigHtRiSvdLZU=; b=FnR2hte4GZKbsuNL4aPoswRqj+
	F3JdZVRSXtzZ8RvHLAJzwxK49kPIZUyg6pGkk6CUFBKzXsVvOSO2uxImBqYaaPeNCrsXpxAlAeXJ1
	fEE9MsZRQwviXdpcF5OwbxYpKWRXfHgZM/PmQpB9uiN5mSEN3vh3ZjFud+H+RDGJ9NNg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181619-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 181619: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-qemuu-nested-amd:leak-check/basis(11):fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:leak-check/basis(11):fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-pygrub:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-amd64:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-libvirt-xsm:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl:leak-check/basis(11):fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-ovmf-amd64:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-xsm:leak-check/basis(11):fail:regression
    linux-linus:test-amd64-amd64-xl-credit2:leak-check/basis(11):fail:regression
    linux-linus:test-amd64-amd64-libvirt:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-freebsd11-amd64:leak-check/basis(11):fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-libvirt-raw:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:leak-check/basis(11):fail:regression
    linux-linus:test-amd64-amd64-xl-shadow:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:leak-check/basis(11):fail:regression
    linux-linus:test-amd64-amd64-xl-multivcpu:debian-install:fail:regression
    linux-linus:test-amd64-amd64-xl-pvhv2-amd:debian-install:fail:regression
    linux-linus:test-amd64-amd64-xl-credit1:debian-install:fail:regression
    linux-linus:test-amd64-amd64-libvirt-pair:xen-boot/dst_host:fail:regression
    linux-linus:test-amd64-amd64-xl-pvhv2-intel:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-pair:xen-boot/src_host:fail:regression
    linux-linus:test-amd64-amd64-pair:xen-boot/dst_host:fail:regression
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-freebsd12-amd64:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-qemuu-nested-intel:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-pvshim:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-libvirt-qcow2:debian-di-install:fail:regression
    linux-linus:test-amd64-coresched-amd64-xl:leak-check/check:fail:regression
    linux-linus:test-armhf-armhf-xl-credit1:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-examine:reboot:fail:regression
    linux-linus:test-amd64-amd64-examine-uefi:reboot:fail:regression
    linux-linus:build-arm64-pvops:kernel-build:fail:regression
    linux-linus:test-amd64-amd64-xl-rtds:debian-install:fail:allowable
    linux-linus:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-examine:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-examine:reboot:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:xen-boot:fail:nonblocking
X-Osstest-Versions-This:
    linux=98be618ad03010b1173fc3c35f6cbb4447ee2b07
X-Osstest-Versions-That:
    linux=6c538e1adbfc696ac4747fb10d63e704344f763d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 28 Jun 2023 11:27:44 +0000

flight 181619 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181619/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-qemuu-nested-amd 11 leak-check/basis(11) fail REGR. vs. 180278
 test-amd64-amd64-xl-qemut-ws16-amd64 11 leak-check/basis(11) fail REGR. vs. 180278
 test-amd64-amd64-xl-qemuu-ws16-amd64  8 xen-boot         fail REGR. vs. 180278
 test-amd64-amd64-pygrub       8 xen-boot                 fail REGR. vs. 180278
 test-amd64-amd64-xl-qemut-win7-amd64  8 xen-boot         fail REGR. vs. 180278
 test-amd64-amd64-xl-qemuu-win7-amd64  8 xen-boot         fail REGR. vs. 180278
 test-amd64-amd64-xl-qemut-debianhvm-amd64  8 xen-boot    fail REGR. vs. 180278
 test-amd64-amd64-libvirt-xsm  8 xen-boot                 fail REGR. vs. 180278
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  8 xen-boot    fail REGR. vs. 180278
 test-amd64-amd64-xl          11 leak-check/basis(11)     fail REGR. vs. 180278
 test-amd64-amd64-xl-qemuu-ovmf-amd64  8 xen-boot         fail REGR. vs. 180278
 test-amd64-amd64-xl-xsm      11 leak-check/basis(11)     fail REGR. vs. 180278
 test-amd64-amd64-xl-credit2  11 leak-check/basis(11)     fail REGR. vs. 180278
 test-amd64-amd64-libvirt      8 xen-boot                 fail REGR. vs. 180278
 test-amd64-amd64-freebsd11-amd64 11 leak-check/basis(11) fail REGR. vs. 180278
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm  8 xen-boot fail REGR. vs. 180278
 test-amd64-amd64-libvirt-raw  8 xen-boot                 fail REGR. vs. 180278
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 11 leak-check/basis(11) fail REGR. vs. 180278
 test-amd64-amd64-xl-shadow    8 xen-boot                 fail REGR. vs. 180278
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 11 leak-check/basis(11) fail REGR. vs. 180278
 test-amd64-amd64-xl-multivcpu 12 debian-install          fail REGR. vs. 180278
 test-amd64-amd64-xl-pvhv2-amd 12 debian-install          fail REGR. vs. 180278
 test-amd64-amd64-xl-credit1  12 debian-install           fail REGR. vs. 180278
 test-amd64-amd64-libvirt-pair 13 xen-boot/dst_host       fail REGR. vs. 180278
 test-amd64-amd64-xl-pvhv2-intel  8 xen-boot              fail REGR. vs. 180278
 test-amd64-amd64-pair        12 xen-boot/src_host        fail REGR. vs. 180278
 test-amd64-amd64-pair        13 xen-boot/dst_host        fail REGR. vs. 180278
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 12 debian-hvm-install fail REGR. vs. 180278
 test-amd64-amd64-freebsd12-amd64  8 xen-boot             fail REGR. vs. 180278
 test-amd64-amd64-qemuu-nested-intel  8 xen-boot          fail REGR. vs. 180278
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 8 xen-boot fail REGR. vs. 180278
 test-amd64-amd64-xl-pvshim    8 xen-boot                 fail REGR. vs. 180278
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 180278
 test-amd64-amd64-libvirt-qcow2 12 debian-di-install      fail REGR. vs. 180278
 test-amd64-coresched-amd64-xl 25 leak-check/check        fail REGR. vs. 180278
 test-armhf-armhf-xl-credit1   8 xen-boot                 fail REGR. vs. 180278
 test-amd64-amd64-examine      8 reboot                   fail REGR. vs. 180278
 test-amd64-amd64-examine-uefi  8 reboot                  fail REGR. vs. 180278
 build-arm64-pvops             6 kernel-build             fail REGR. vs. 180278

Regressions which are regarded as allowable (not blocking):
 test-amd64-amd64-xl-rtds     12 debian-install           fail REGR. vs. 180278

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-vhd       1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-arm64-arm64-examine      1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)               blocked  n/a
 test-armhf-armhf-examine      8 reboot                       fail  like 180278
 test-armhf-armhf-xl-arndale   8 xen-boot                     fail  like 180278
 test-armhf-armhf-xl           8 xen-boot                     fail  like 180278
 test-armhf-armhf-libvirt-raw  8 xen-boot                     fail  like 180278
 test-armhf-armhf-xl-credit2   8 xen-boot                     fail  like 180278
 test-armhf-armhf-xl-rtds      8 xen-boot                     fail  like 180278
 test-armhf-armhf-libvirt      8 xen-boot                     fail  like 180278
 test-armhf-armhf-libvirt-qcow2  8 xen-boot                    fail like 180278
 test-armhf-armhf-xl-vhd       8 xen-boot                     fail  like 180278
 test-armhf-armhf-xl-multivcpu  8 xen-boot                     fail like 180278

version targeted for testing:
 linux                98be618ad03010b1173fc3c35f6cbb4447ee2b07
baseline version:
 linux                6c538e1adbfc696ac4747fb10d63e704344f763d

Last test of basis   180278  2023-04-16 19:41:46 Z   72 days
Failing since        180281  2023-04-17 06:24:36 Z   72 days  138 attempts
Testing same since   181619  2023-06-28 02:01:09 Z    0 days    1 attempts

------------------------------------------------------------
2901 people touched revisions under test,
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
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
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
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  fail    
 test-arm64-arm64-xl-credit1                                  blocked 
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  fail    
 test-arm64-arm64-xl-credit2                                  blocked 
 test-armhf-armhf-xl-credit2                                  fail    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        fail    
 test-amd64-amd64-examine                                     fail    
 test-arm64-arm64-examine                                     blocked 
 test-armhf-armhf-examine                                     fail    
 test-amd64-amd64-qemuu-nested-intel                          fail    
 test-amd64-amd64-xl-pvhv2-intel                              fail    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
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
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             fail    
 test-amd64-amd64-xl-shadow                                   fail    
 test-arm64-arm64-xl-thunderx                                 blocked 
 test-amd64-amd64-examine-uefi                                fail    
 test-amd64-amd64-xl-vhd                                      pass    
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

(No revision log; it would be 394231 lines long.)

