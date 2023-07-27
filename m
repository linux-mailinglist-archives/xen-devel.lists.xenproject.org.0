Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D8C765428
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 14:38:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571082.894072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP0Es-0008Ql-Vh; Thu, 27 Jul 2023 12:37:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571082.894072; Thu, 27 Jul 2023 12:37:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP0Es-0008P7-Sq; Thu, 27 Jul 2023 12:37:06 +0000
Received: by outflank-mailman (input) for mailman id 571082;
 Thu, 27 Jul 2023 12:37:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qP0Er-0008Ox-Gj; Thu, 27 Jul 2023 12:37:05 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qP0Er-00040G-Cp; Thu, 27 Jul 2023 12:37:05 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qP0Eq-00066S-Qo; Thu, 27 Jul 2023 12:37:04 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qP0Eq-0005u2-Oc; Thu, 27 Jul 2023 12:37:04 +0000
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
	bh=PZ7YFAvydma0hwJyuFvsD8XlhJXbMIdJysIoWqDlAXo=; b=7GSOxd/PDg8CuhiDzoiPPi7D5e
	wAYs2mHOiDvCJyzglzfsfEOErIRQdqBUfuv0q0IJnvq9qCfAJnIyRlAn8eGFNdopN158B023V7QCP
	AYuGMEymIiAb3eNZU5qqA+UqGHIomd5M4ihSGg/uuuJl56j5DYxX/jYpb8dEYEZGauvc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182027-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 182027: regressions - trouble: fail/pass/starved
X-Osstest-Failures:
    xen-unstable:test-amd64-amd64-libvirt-vhd:guest-start.2:fail:regression
    xen-unstable:test-amd64-i386-freebsd10-amd64:xen-install:fail:heisenbug
    xen-unstable:test-amd64-i386-freebsd10-i386:xen-install:fail:heisenbug
    xen-unstable:test-amd64-i386-pair:xen-install/dst_host:fail:heisenbug
    xen-unstable:test-amd64-amd64-libvirt-vhd:guest-start/debian.repeat:fail:heisenbug
    xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:hosts-allocate:starved:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:hosts-allocate:starved:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:hosts-allocate:starved:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:hosts-allocate:starved:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:hosts-allocate:starved:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:hosts-allocate:starved:nonblocking
    xen-unstable:test-arm64-arm64-xl:hosts-allocate:starved:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    xen=3d2d4ea026df73c37a7df7e216443cbf652ff892
X-Osstest-Versions-That:
    xen=0b1171be87698bc7d14760383c0770aeb6e41dd4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 27 Jul 2023 12:37:04 +0000

flight 182027 xen-unstable real [real]
flight 182035 xen-unstable real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/182027/
http://logs.test-lab.xenproject.org/osstest/logs/182035/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-libvirt-vhd 20 guest-start.2  fail in 182035 REGR. vs. 182012

Tests which are failing intermittently (not blocking):
 test-amd64-i386-freebsd10-amd64  7 xen-install      fail pass in 182035-retest
 test-amd64-i386-freebsd10-i386  7 xen-install       fail pass in 182035-retest
 test-amd64-i386-pair        11 xen-install/dst_host fail pass in 182035-retest
 test-amd64-amd64-libvirt-vhd 19 guest-start/debian.repeat fail pass in 182035-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 182012
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 182012
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 182012
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 182012
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 182012
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 182012
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 182012
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 182012
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 182012
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 182012
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 182012
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 182012
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw  3 hosts-allocate               starved  n/a
 test-arm64-arm64-libvirt-xsm  3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl-vhd       3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl-credit2   3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl-credit1   3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl-thunderx  3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl           3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl-xsm       3 hosts-allocate               starved  n/a

version targeted for testing:
 xen                  3d2d4ea026df73c37a7df7e216443cbf652ff892
baseline version:
 xen                  0b1171be87698bc7d14760383c0770aeb6e41dd4

Last test of basis   182012  2023-07-25 19:27:43 Z    1 days
Testing same since   182027  2023-07-26 21:35:59 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Federico Serafini <federico.serafini@bugseng.com>
  Jan Beulich <jbeulich@suse.com>
  Leo Yan <leo.yan@linaro.org>
  Nicola Vetrini <nicola.vetrini@bugseng.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>

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
 test-arm64-arm64-xl                                          starved 
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
 test-arm64-arm64-libvirt-xsm                                 starved 
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      starved 
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
 test-amd64-i386-freebsd10-amd64                              fail    
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
 test-arm64-arm64-xl-credit1                                  starved 
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  starved 
 test-armhf-armhf-xl-credit2                                  pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-i386-examine                                      pass    
 test-amd64-i386-freebsd10-i386                               fail    
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
 test-amd64-i386-migrupgrade                                  pass    
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
 test-arm64-arm64-libvirt-raw                                 starved 
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 starved 
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-i386-examine-uefi                                 pass    
 test-amd64-amd64-libvirt-vhd                                 fail    
 test-arm64-arm64-xl-vhd                                      starved 
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
commit 3d2d4ea026df73c37a7df7e216443cbf652ff892
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Jul 19 13:37:37 2023 +0100

    x86/boot: Update construct_dom0() to take a const char *cmdline
    
    With hvm_copy_to_guest_*() able to use const sources, update construct_dom0()
    and friends to pass a const cmdline pointer.  Nothing in these paths have a
    reason to be modifying the command line passed in.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 90732a8b4cb554254af473d0e570daf6b8c987a7
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Jul 19 11:57:46 2023 +0100

    xen/x86: Use const char * for string literals (2)
    
    This hunk was accidentally missing from a previous change.
    
    Fixes: d642c0706678 ("xen/x86: Use const char * for string literals")
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 9895e3374237267697bd505c04810d2d10e42c7b
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Jul 19 11:30:56 2023 +0100

    x86/hvm: Allow hvm_copy_to_guest_*() to come from const sources
    
    The work to fix MISRA rule 7.4 (using mutable pointers to string literals)
    identifies that string literals do indeed get passed into
    hvm_copy_to_guest_linear() by way of the PVH dom0 command line.
    
    This higlights that the copy_to_* helpers really ought to take a const
    source.  Update the function types to match, and cast away constness in the
    wrappers around __hvm_copy() where HVMCOPY_to_guest is used.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 9380f06fe82fe1886a8ae468d22b901bd6c4d3d5
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Jul 25 16:32:35 2023 +0100

    xen: Drop the (almost) unused extern start[]
    
    This global variable is shadowed by plenty local variables, violating MISRA
    rule 5.3.  Some architectures happen to have a symbol by the name of start in
    their head.S's, but it's not a useful symbol to reference from C.
    
    In fact, the single use of the global start[] in RISC-V means to use _start[]
    as the linker symbol at the beginning of the .text section, not the function
    which happens to be in the same location.
    
    Fix RISC-V to use the right symbol for it's calculation, and drop the extern.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
    Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

commit 4b2cdbfe766e5666e6754198946df2dc16f6a642
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed May 17 10:13:36 2023 +0100

    x86/cpu-policy: Advertise MSR_ARCH_CAPS to guests by default
    
    With xl/libxl now able to control the policy bits for MSR_ARCH_CAPS, it is
    safe to advertise to guests by default.  In turn, we don't need the special
    case to expose details to dom0.
    
    This advertises MSR_ARCH_CAPS to guests on *all* Intel hardware, even if the
    register content ends up being empty.
    
      - Advertising ARCH_CAPS and not RSBA signals "retpoline is safe here and
        everywhere you might migrate to".  This is important because it avoids the
        guest kernel needing to rely on model checks.
    
      - Alternatively, levelling for safety across the Broadwell/Skylake divide
        requires advertising ARCH_CAPS and RSBA, meaning "retpoline not safe on
        some hardware you might migrate to".
    
    On Cascade Lake and later hardware, guests can now see RDCL_NO (not vulnerable
    to Meltdown) amongst others.  This causes substantial performance
    improvements, as guests are no longer applying software mitigations in cases
    where they don't need to.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 6d21cedbaa34b3a3856f964189e911112c732b21
Author: Roger Pau Monne <roger.pau@citrix.com>
Date:   Tue Jul 25 15:05:58 2023 +0200

    libxl: add support for parsing MSR features
    
    Introduce support for handling MSR features in
    libxl_cpuid_parse_config().  The MSR policies are added to the
    libxl_cpuid_policy like the CPUID one, which gets passed to
    xc_cpuid_apply_policy().
    
    This allows existing users of libxl to provide MSR related features as
    key=value pairs to libxl_cpuid_parse_config() without requiring the
    usage of a different API.
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Acked-by: Anthony PERARD <anthony.perard@citrix.com>

commit d638fe233cb3a45105319df75df0edfed2fde5a5
Author: Roger Pau Monne <roger.pau@citrix.com>
Date:   Tue Jul 25 15:05:57 2023 +0200

    libxl: use the cpuid feature names from cpufeatureset.h
    
    The current implementation in libxl_cpuid_parse_config() requires
    keeping a list of cpuid feature bits that should be mostly in sync
    with the contents of cpufeatureset.h.
    
    Avoid such duplication by using the automatically generated list of
    cpuid features in INIT_FEATURE_NAMES in order to map feature names to
    featureset bits, and then translate from featureset bits into cpuid
    leaf, subleaf, register tuple.
    
    Note that the full contents of the previous cpuid translation table
    can't be removed.  That's because some feature names allowed by libxl
    are not described in the featuresets, or because naming has diverged
    and the previous nomenclature is preserved for compatibility reasons.
    
    Should result in no functional change observed by callers, albeit some
    new cpuid features will be available as a result of the change.
    
    While there constify cpuid_flags name field.
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

commit e2b1da9b8fda0ed7d3dca7bd15829cfea496973a
Author: Roger Pau Monne <roger.pau@citrix.com>
Date:   Tue Jul 25 15:05:56 2023 +0200

    libxl: split logic to parse user provided CPUID features
    
    Move the CPUID value parsers out of libxl_cpuid_parse_config() into a
    newly created cpuid_add() local helper.  This is in preparation for
    also adding MSR feature parsing support.
    
    No functional change intended.
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

commit 5b80cecb747b2176b9e85f6e7aa7be83416d77e1
Author: Roger Pau Monne <roger.pau@citrix.com>
Date:   Wed Jul 26 09:47:53 2023 +0200

    libxl: introduce MSR data in libxl_cpuid_policy
    
    Add a new array field to libxl_cpuid_policy in order to store the MSR
    policies.
    
    Adding the MSR data in the libxl_cpuid_policy_list type is done so
    that existing users can seamlessly pass MSR features as part of the
    CPUID data, without requiring the introduction of a separate
    domain_build_info field, and a new set of handlers functions.
    
    Note that support for parsing the old JSON format is kept, as that's
    required in order to restore domains or received migrations from
    previous tool versions.  Differentiation between the old and the new
    formats is done based on whether the contents of the 'cpuid' field is
    an array or a map JSON object.
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

commit 4825d19603580949144ac2ac5cb22df75c9da954
Author: Roger Pau Monne <roger.pau@citrix.com>
Date:   Tue Jul 25 15:05:54 2023 +0200

    libxl: change the type of libxl_cpuid_policy_list
    
    Currently libxl_cpuid_policy_list is an opaque type to the users of
    libxl, and internally it's an array of xc_xend_cpuid objects.
    
    Change the type to instead be a structure that contains one array for
    CPUID policies, in preparation for it also holding another array for
    MSR policies.
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

commit ed742cf1b65c822759833027ca5cbb087c506a41
Author: Roger Pau Monne <roger.pau@citrix.com>
Date:   Tue Jul 25 15:05:53 2023 +0200

    libs/guest: introduce support for setting guest MSRs
    
    Like it's done with CPUID, introduce support for passing MSR values to
    xc_cpuid_apply_policy().  The chosen format for expressing MSR policy
    data matches the current one used for CPUID.  Note that existing
    callers of xc_cpuid_apply_policy() can pass NULL as the value for the
    newly introduced 'msr' parameter in order to preserve the same
    functionality, and in fact that's done in libxl on this patch.
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Acked-by: Anthony PERARD <anthony.perard@citrix.com>

commit 1f8a6a99b225d34cf608f47b2938092e310f9e03
Author: Nicola Vetrini <nicola.vetrini@bugseng.com>
Date:   Mon Jul 24 18:19:19 2023 +0200

    docs/misra: document the usage of array range initializers
    
    The usage of a documented GNU extension that allows a range of elements
    in an array to be initalized to the same value using a designated
    initalizer is added to this document, to fully comply with
    MISRA C:2012 Rule 1.1.
    
    Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit 89d7903172fee953b7c112160f67959f6de4731f
Author: Leo Yan <leo.yan@linaro.org>
Date:   Mon Jul 24 16:52:11 2023 +0800

    docs: Correct name for xen-command-line.pandoc
    
    In the commit d661611d08 ("docs/markdown: Switch to using pandoc, and
    fix underscore escaping"), the documentation suffix was changed from
    ".markdown" to ".pandoc"; however, the reference was missed to update.
    
    This patch updates the documentation name to xen-command-line.pandoc.
    
    Fixes: d661611d08 ("docs/markdown: Switch to using pandoc, and fix underscore escaping")
    Signed-off-by: Leo Yan <leo.yan@linaro.org>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit 1b631a67ac2a70474cc5e43794551f0536dde2ef
Author: Federico Serafini <federico.serafini@bugseng.com>
Date:   Tue Jul 25 16:43:02 2023 +0200

    xen/cpu: change parameter name in __cpu_up() declaration
    
    Change parameter name from 'cpunum' to 'cpu' to keep consistency with
    the name used in the corresponding definitions thus addressing a
    violation of MISRA C:2012 Rule 8.3: "All declarations of an object or
    function shall use the same names and type qualifiers".
    
    No functional changes.
    
    Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
(qemu changes not included)

