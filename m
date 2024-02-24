Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 930AD862597
	for <lists+xen-devel@lfdr.de>; Sat, 24 Feb 2024 15:19:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685086.1065441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdss1-0002mA-6Q; Sat, 24 Feb 2024 14:19:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685086.1065441; Sat, 24 Feb 2024 14:19:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdss1-0002kd-2O; Sat, 24 Feb 2024 14:19:17 +0000
Received: by outflank-mailman (input) for mailman id 685086;
 Sat, 24 Feb 2024 14:19:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rdsrz-0002kT-PZ; Sat, 24 Feb 2024 14:19:15 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rdsrz-000700-MH; Sat, 24 Feb 2024 14:19:15 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rdsrz-00031i-Au; Sat, 24 Feb 2024 14:19:15 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rdsrz-0002xk-AS; Sat, 24 Feb 2024 14:19:15 +0000
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
	bh=P8JESzndlLePrIZccpCq43bKPP4VKFHK8Mfj7HOmjH8=; b=Rsih9hqPNFxdRTJWsOy/Ti4KZd
	5PsQLM7EEqpEGZLtebnp5Mw9LfdgbLI1yNXEAWXwWzt6Us9JeEwPdUNoxxYEc0gOErUUI63l7QXDL
	5bhhLebiSlOVruHKhgBPqY2WSXF3TZAZ7bw6lGPzCLEXjx4bKfvNLPVjG68cpZ7E4gzI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184746-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 184746: regressions - FAIL
X-Osstest-Failures:
    xen-unstable:test-armhf-armhf-libvirt-raw:guest-start/debian.repeat:fail:regression
    xen-unstable:test-armhf-armhf-libvirt-raw:guest-start:fail:heisenbug
    xen-unstable:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:heisenbug
    xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=f5e1c527d0a0d09ca0cb1dcd8d4ab4a1a5261e91
X-Osstest-Versions-That:
    xen=812bdc99f4c5d05d20b6fac03b90920c0dbf9a2b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 24 Feb 2024 14:19:15 +0000

flight 184746 xen-unstable real [real]
flight 184750 xen-unstable real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/184746/
http://logs.test-lab.xenproject.org/osstest/logs/184750/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-libvirt-raw 17 guest-start/debian.repeat fail REGR. vs. 184732

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-libvirt-raw 13 guest-start      fail in 184750 pass in 184746
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail pass in 184750-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 184732
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 184732
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 184732
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 184732
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 184732
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 184732
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 184732
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 184732
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 184732
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 184732
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 184732
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 184732
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass

version targeted for testing:
 xen                  f5e1c527d0a0d09ca0cb1dcd8d4ab4a1a5261e91
baseline version:
 xen                  812bdc99f4c5d05d20b6fac03b90920c0dbf9a2b

Last test of basis   184732  2024-02-23 04:57:51 Z    1 days
Testing same since   184746  2024-02-23 23:07:23 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Christian Lindig <christian.lindig@cloud.com>
  Edwin Török <edwin.torok@cloud.com>
  George Dunlap <george.dunlap@cloud.com> # Golang bits
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Petr Beneš <w1benny@gmail.com>
  Samuel Thibault <samuel.thibault@ens-lyon.org>
  Shawn Anastasio <sanastasio@raptorengineering.com>
  Tamas K Lengyel <tamas@tklengyel.com>

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
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 fail    
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
 test-amd64-i386-migrupgrade                                  pass    
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
 test-armhf-armhf-libvirt-raw                                 fail    
 test-amd64-i386-libvirt-raw                                  pass    
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
commit f5e1c527d0a0d09ca0cb1dcd8d4ab4a1a5261e91
Author: Juergen Gross <jgross@suse.com>
Date:   Fri Feb 16 17:31:39 2024 +0100

    tools/xenstored: have a single do_control_memreport()
    
    With 9pfs now available in Xenstore-stubdom, there is no reason to
    have distinct do_control_memreport() variants for the daemon and the
    stubdom implementations.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

commit a76f8809f10f1764d4627844461906dac93e68df
Author: Juergen Gross <jgross@suse.com>
Date:   Fri Feb 16 17:31:38 2024 +0100

    tools/xenstored: support complete log capabilities in stubdom
    
    With 9pfs being fully available in Xenstore-stubdom now, there is no
    reason to not fully support all logging capabilities in stubdom.
    
    Open the logfile on stubdom only after the 9pfs file system has been
    mounted.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>
    Acked-by: Anthony PERARD <anthony.perard@citrix.com>

commit 93892648ffaf78a682edef48ea2d108650b3b547
Author: Juergen Gross <jgross@suse.com>
Date:   Fri Feb 16 17:31:37 2024 +0100

    tools/xenstored: add helpers for filename handling
    
    Add some helpers for handling filenames which might need different
    implementations between stubdom and daemon environments:
    
    - expansion of relative filenames (those are not really defined today,
      just expand them to be relative to /var/lib/xen/xenstore)
    - expansion of xenstore_daemon_rundir() (used e.g. for saving the state
      file in case of live update - needs to be unchanged in the daemon
      case, but should result in /var/lib/xen/xenstore for stubdom)
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>

commit 297a2587e6b5ab2edbadce90cec0d5192625973c
Author: Juergen Gross <jgross@suse.com>
Date:   Fri Feb 16 17:31:36 2024 +0100

    tools/xenstored: mount 9pfs device in stubdom
    
    Mount the 9pfs device in stubdom enabling it to use files.
    
    This has to happen in a worker thread in order to allow the main thread
    handling the required Xenstore accesses in parallel.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>

commit e21d9dbf4457a8c1f42d6e4a2ef2d3fe7c62616b
Author: Juergen Gross <jgross@suse.com>
Date:   Fri Feb 16 17:31:35 2024 +0100

    tools: add 9pfs device to xenstore-stubdom
    
    Add a 9pfs device to Xenstore stubdom in order to allow it to do e.g.
    logging into a dom0 file.
    
    Use the following parameters for the new device:
    
    - tag = "Xen"
    - type = "xen_9pfsd"
    - path = "/var/lib/xen/xenstore"
    - security-model = "none"
    
    For now don't limit allowed file space or number of files.
    
    Add a new libxl function for adding it similar to the function for
    adding the console device.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
    Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

commit 0b761781c4de2e6637203d0f51273a5a1f8873df
Author: Juergen Gross <jgross@suse.com>
Date:   Fri Feb 16 17:31:34 2024 +0100

    stubdom: extend xenstore stubdom configs
    
    Extend the config files of the Xenstore stubdoms to include XENBUS
    and 9PFRONT items in order to support file based logging.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
    Acked-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

commit 4287a71f9b9d6a7dc1e51ae89b5ae04e1ba49d7c
Author: Juergen Gross <jgross@suse.com>
Date:   Fri Feb 16 17:31:33 2024 +0100

    tools/xl: support new 9pfs backend xen_9pfsd
    
    Add support for the new 9pfs backend "xen_9pfsd". For this backend type
    the tag defaults to "Xen" and the host side path to
    "/var/log/xen/guests/<dom-name>".
    
    Do most of the default settings in libxl. Unfortunately the default
    path can't easily be set in libxl, as the domain name isn't available
    in the related 9pfs specific function.
    
    Settings the defaults in libxl requires to move the sanity checking
    of 9pfs parameters from xl to libxl, too.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
    Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

commit ab5a6b598651279ae9c47c22bbb0c072ad60d878
Author: Juergen Gross <jgross@suse.com>
Date:   Fri Feb 16 17:31:32 2024 +0100

    tools/libs/light: add backend type for 9pfs PV devices
    
    Make the backend type of 9pfs PV devices configurable. The default is
    "qemu" with the related Xenstore backend-side directory being "9pfs".
    
    Add another type "xen_9pfsd" with the related Xenstore backend-side
    directory "xen_9pfs".
    
    As additional security features it is possible to specify:
    - "max-space" for limiting the maximum space consumed on the filesystem
      in MBs
    - "max-files" for limiting the maximum number of files in the
      filesystem
    - "max-open-files" for limiting the maximum number of concurrent open
      files
    
    For convenience "auto-delete" is available to let the backend delete the
    oldest file of the guest in case otherwise "max-space" or "max-files"
    would be violated.
    
    The xen-9pfsd daemon will be started by libxenlight automatically when
    the first "xen_9pfs" device is being created.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
    Acked-by: George Dunlap <george.dunlap@cloud.com> # Golang bits
    Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

commit 098d868e52ac0165b7f36e22b767ea70cef70054
Author: Edwin Török <edwin.torok@cloud.com>
Date:   Wed Jan 31 10:52:56 2024 +0000

    tools/oxenstored: Make Quota.t pure
    
    Now that we no longer have a hashtable inside we can make Quota.t pure, and
    push the mutable update to its callers.  Store.t already had a mutable Quota.t
    field.
    
    No functional change.
    
    Signed-off-by: Edwin Török <edwin.torok@cloud.com>
    Acked-by: Christian Lindig <christian.lindig@cloud.com>

commit b6cf604207fd0a04451a48f2ce6d05fb66c612ab
Author: Edwin Török <edwin.torok@cloud.com>
Date:   Wed Jan 31 10:52:55 2024 +0000

    tools/oxenstored: Use Map instead of Hashtbl for quotas
    
    On a stress test running 1000 VMs flamegraphs have shown that
    `oxenstored` spends a large amount of time in `Hashtbl.copy` and the GC.
    
    Hashtable complexity:
     * read/write: O(1) average
     * copy: O(domains) -- copying the entire table
    
    Map complexity:
     * read/write: O(log n) worst case
     * copy: O(1) -- a word copy
    
    We always perform at least one 'copy' when processing each xenstore
    packet (regardless whether it is a readonly operation or inside a
    transaction or not), so the actual complexity per packet is:
      * Hashtbl: O(domains)
      * Map: O(log domains)
    
    Maps are the clear winner, and a better fit for the immutable xenstore
    tree.
    
    Signed-off-by: Edwin Török <edwin.torok@cloud.com>
    Acked-by: Christian Lindig <christian.lindig@cloud.com>

commit 7e5b662b289ac66ee347113f94c46c89d127e774
Author: Petr Beneš <w1benny@gmail.com>
Date:   Tue Feb 6 10:08:22 2024 +0000

    x86/altp2m: p2m_altp2m_get_or_propagate() should honor ap2m->default_access
    
    This patch addresses a behavior discrepancy in the handling of altp2m views,
    where upon the creation and subsequent EPT violation, the page access
    permissions were incorrectly inherited from the hostp2m instead of respecting
    the altp2m default_access.
    
    Previously, when a new altp2m view was established with restrictive
    default_access permissions and activated via xc_altp2m_switch_to_view(),
    it failed to trigger an event on the first access violation.  This behavior
    diverged from the intended mechanism, where the altp2m's default_access
    should dictate the initial permissions, ensuring proper event triggering on
    access violations.
    
    The correction involves modifying the handling mechanism to respect the
    altp2m view's default_access upon its activation, eliminating the need for
    setting memory access permissions for the entire altp2m range (e.g. within
    xen-access.c).  This change not only aligns the behavior with the expected
    access control logic but also results in a significant performance improvement
    by reducing the overhead associated with setting memory access permissions
    across the altp2m range.
    
    Signed-off-by: Petr Beneš <w1benny@gmail.com>
    Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

commit 98e79be5b60ac5f4fbcb064a9e11c30024929ff1
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Jan 29 11:39:32 2024 +0000

    xen/*/asm-offset: Fix bad copy&paste from x86
    
    All architectures have copy&pasted bad logic from x86.
    
    OFFSET() having a trailing semi-colon within the macro expansion can be a
    problematic pattern.  It's benign in this case, but fix it anyway.
    
    Perform style fixes for the other macros, and tame the mess of BLANK()
    position to be consistent (one BLANK() after each block) so the intermediate
    form is legible too.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Julien Grall <jgrall@amazon.com>
(qemu changes not included)

