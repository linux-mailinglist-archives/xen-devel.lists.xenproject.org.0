Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6DB692BB6
	for <lists+xen-devel@lfdr.de>; Sat, 11 Feb 2023 01:04:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.493694.763694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQdMb-0005SP-4d; Sat, 11 Feb 2023 00:03:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493694.763694; Sat, 11 Feb 2023 00:03:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQdMb-0005Qg-1d; Sat, 11 Feb 2023 00:03:33 +0000
Received: by outflank-mailman (input) for mailman id 493694;
 Sat, 11 Feb 2023 00:03:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pQdMY-0005QW-NL; Sat, 11 Feb 2023 00:03:30 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pQdMY-0006XC-Jz; Sat, 11 Feb 2023 00:03:30 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pQdMY-0000m7-4p; Sat, 11 Feb 2023 00:03:30 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pQdMY-0005Yt-49; Sat, 11 Feb 2023 00:03:30 +0000
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
	bh=7Jb79gROf2++UtUlUzz5Krv3V8w/bONrzu8xR3/PNmI=; b=AzFlnw3WnuNgiA4PnZ7D++Zo5m
	iQUFAU6Co1AqlRUWjvUve+4K50cjFc3tyrzQWC8YkTrZJebQ/akby1W3zTPDIamY4Fdb5yG/tU+/1
	UFz1/4IqCLK3tyxgEHvKH8x7UBNeV8oUXNoooDZaToXUJHnCp5IN0qcb09sv8B49WdQI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-176855-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 176855: regressions - trouble: fail/pass/starved
X-Osstest-Failures:
    xen-unstable:test-amd64-amd64-xl-qcow2:guest-start/debian.repeat:fail:regression
    xen-unstable:test-amd64-i386-migrupgrade:xen-install/src_host:fail:heisenbug
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:build-armhf-libvirt:build-check(1):starved:nonblocking
    xen-unstable:test-armhf-armhf-examine:build-check(1):starved:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:build-check(1):starved:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:build-check(1):starved:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:build-check(1):starved:nonblocking
    xen-unstable:test-armhf-armhf-xl:build-check(1):starved:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:build-check(1):starved:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:build-check(1):starved:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:build-check(1):starved:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:build-check(1):starved:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:build-check(1):starved:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:build-check(1):starved:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:hosts-allocate:starved:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:hosts-allocate:starved:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:hosts-allocate:starved:nonblocking
    xen-unstable:build-armhf:hosts-allocate:starved:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:hosts-allocate:starved:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:hosts-allocate:starved:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:hosts-allocate:starved:nonblocking
    xen-unstable:test-arm64-arm64-xl:hosts-allocate:starved:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    xen=01e7477d1b081cff4288ff9f51ec59ee94c03ee0
X-Osstest-Versions-That:
    xen=4e0b4ccfc504f26187939068796295340ffd0e2f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 11 Feb 2023 00:03:30 +0000

flight 176855 xen-unstable real [real]
flight 176902 xen-unstable real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/176855/
http://logs.test-lab.xenproject.org/osstest/logs/176902/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qcow2   21 guest-start/debian.repeat fail REGR. vs. 176769

Tests which are failing intermittently (not blocking):
 test-amd64-i386-migrupgrade 10 xen-install/src_host fail pass in 176902-retest

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 176769
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 176769
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 176769
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 176769
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 176769
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 176769
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 176769
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 176769
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 176769
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 build-armhf-libvirt           1 build-check(1)               starved  n/a
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
 test-arm64-arm64-libvirt-raw  3 hosts-allocate               starved  n/a
 test-arm64-arm64-libvirt-xsm  3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl-xsm       3 hosts-allocate               starved  n/a
 build-armhf                   2 hosts-allocate               starved  n/a
 test-arm64-arm64-xl-credit1   3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl-credit2   3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl-thunderx  3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl           3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl-vhd       3 hosts-allocate               starved  n/a

version targeted for testing:
 xen                  01e7477d1b081cff4288ff9f51ec59ee94c03ee0
baseline version:
 xen                  4e0b4ccfc504f26187939068796295340ffd0e2f

Last test of basis   176769  2023-02-09 18:40:48 Z    1 days
Testing same since   176855  2023-02-10 12:17:08 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Christian Lindig <christian.lindig@citrix.com>
  George Dunlap <george.dunlap@cloud.com>
  Henry Wang <Henry.Wang@arm.com>
  Ian Jackson <ijackson@chiark.greenend.org.uk>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  starved 
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          starved 
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
 test-armhf-armhf-xl                                          starved 
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
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-i386-examine-bios                                 pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  starved 
 test-armhf-armhf-xl-credit1                                  starved 
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  starved 
 test-armhf-armhf-xl-credit2                                  starved 
 test-armhf-armhf-xl-cubietruck                               starved 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     starved 
 test-amd64-i386-examine                                      pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     starved 
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-livepatch                                   pass    
 test-amd64-i386-livepatch                                    pass    
 test-amd64-amd64-migrupgrade                                 pass    
 test-amd64-i386-migrupgrade                                  fail    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                starved 
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               starved 
 test-amd64-amd64-xl-qcow2                                    fail    
 test-arm64-arm64-libvirt-raw                                 starved 
 test-armhf-armhf-libvirt-raw                                 starved 
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     starved 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 starved 
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-i386-examine-uefi                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      starved 
 test-armhf-armhf-xl-vhd                                      starved 
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
commit 01e7477d1b081cff4288ff9f51ec59ee94c03ee0
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Oct 28 11:40:00 2022 +0100

    x86/shskt: Disable CET-SS on parts susceptible to fractured updates
    
    Refer to Intel SDM Rev 70 (Dec 2022), Vol3 17.2.3 "Supervisor Shadow Stack
    Token".
    
    Architecturally, an event delivery which starts in CPL<3 and switches shadow
    stack will first validate the Supervisor Shadow Stack Token (setting the busy
    bit), then pushes CS/LIP/SSP.  One example of this is an NMI interrupting Xen.
    
    Some CPUs suffer from an issue called fracturing, whereby a fault/vmexit/etc
    between setting the busy bit and completing the event injection renders the
    action non-restartable, because when it comes time to restart, the busy bit is
    found to be already set.
    
    This is far more easily encountered under virt, yet it is not the fault of the
    hypervisor, nor the fault of the guest kernel.  The fault lies somewhere
    between the architectural specification, and the uarch behaviour.
    
    Intel have allocated CPUID.7[1].ecx[18] CET_SSS to enumerate that supervisor
    shadow stacks are safe to use.  Because of how Xen lays out its shadow stacks,
    fracturing is not expected to be a problem on native.
    
    Detect this case on boot and default to not using shstk if virtualised.
    Specifying `cet=shstk` on the command line will override this heuristic and
    enable shadow stacks irrespective.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit b4a23bf6293aadecfd03bf9e83974443e2eac9cb
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Oct 28 11:40:00 2022 +0100

    x86/cpuid: Infrastructure for leaves 7:1{ecx,edx}
    
    We don't actually need ecx yet, but adding it in now will reduce the amount to
    which leaf 7 is out of order in a featureset.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 789ed08abb8f5e411cf06f6acb61c2d261f625da
Author: Juergen Gross <jgross@suse.com>
Date:   Thu Feb 9 15:41:48 2023 +0100

    docs: clarify xenstore permission documentation
    
    In docs/misc/xenstore.txt the description of the Xenstore node access
    permissions is missing one important aspect, which can be found only
    in the code or in the wiki [1]:
    
    The first permission entry is defining the owner of the node via the
    domid, and the access rights for all domains NOT having a dedicated
    permission entry.
    
    Make that aspect clear in the official documentation.
    
    [1]: https://wiki.xenproject.org/wiki/XenBus#Permissions
    
    Reported-by: Edwin Török <edwin.torok@cloud.com>
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>

commit d184b26db2b29b5f610b61c43580becd7a4057b1
Author: Juergen Gross <jgross@suse.com>
Date:   Thu Feb 9 15:23:57 2023 +0100

    SUPPORT.md: update version to 4.18-unstable
    
    The current version is no longer 4.17-rc. Update it to "4.18-unstable".
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit e51d31f79edc10f8d622e7f5bf4b935af6d4618f
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu Feb 9 15:25:10 2023 +0000

    tools/ocaml: Drop libxl and xentoollog bindings
    
    There are significant issues with these bindings (they segfault for starters)
    and their companion half in Xapi was deleted in 2018
    
      https://github.com/xapi-project/xen-api/commit/203292ebe0c487d7ae4adb961a6d080f4fbe933d
    
    owing to there having been no development of these bindings since 2014.
    
    In the unlikely event that we'd want to reinstate them, they'd need reworking
    basically from scratch anyway.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Christian Lindig <christian.lindig@citrix.com>

commit bf652a50fb3bb3b1b3d93db6fb79bc28f978fe75
Author: Anthony PERARD <anthony.perard@citrix.com>
Date:   Thu Feb 9 16:14:48 2023 +0000

    libs/util: Fix parallel build between flex/bison and CC rules
    
    flex/bison generate two targets, and when those targets are
    prerequisite of other rules they are considered independently by make.
    
    We can have a situation where the .c file is out-of-date but not the
    .h, git checkout for example. In this case, if a rule only have the .h
    file as prerequiste, make will procced and start to build the object.
    In parallel, another target can have the .c file as prerequisite and
    make will find out it need re-generating and do so, changing the .h at
    the same time. This parallel task breaks the first one.
    
    To avoid this scenario, we put both the header and the source as
    prerequisite for all object even if they only need the header.
    
    Reported-by: Andrew Cooper <Andrew.Cooper3@citrix.com>
    Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 52493ec3e32a6e631b3ae3571db7ed41f10d9b06
Author: Anthony PERARD <anthony.perard@citrix.com>
Date:   Thu Feb 9 12:11:40 2023 +0000

    libs/util: Remove unused headers in libxlu_pci.c
    
    libxlu_pci.c doesn't use any "xlu__cfg*()" functions and doesn't use
    any of the disk parsing functions "xlu__disk*()", so all those headers
    can be removed.
    
    Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 5b46dd85d051ceecc2c00a0de27f03e571bff379
Author: Julien Grall <jgrall@amazon.com>
Date:   Fri Jan 27 18:55:46 2023 +0000

    tools/xenstored: hashtable: Constify the parameters of hashfn/eqfn
    
    The parameters of hashfn/eqfn should never be modified. So constify
    them and propagate the const to the users.
    
    Take the opportunity to solve some coding style issues around the
    code modified.
    
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    Reviewed-by: Henry Wang <Henry.Wang@arm.com>
    Tested-by: Henry Wang <Henry.Wang@arm.com>
    Reviewed-by: Juergen Gross <jgross@suse.com>

commit 4e0e7a29d2fe318e4e60e77a56773b4d020ebc6a
Author: Julien Grall <jgrall@amazon.com>
Date:   Thu Feb 9 17:07:28 2023 +0000

    docs/process: branching-checklist: Clarify steps to add the branch in osstest
    
    The steps to add the new branch in osstest doesn't mention the change
    should be committed.
    
    Update the steps to clarify that. Take the opportunity to switch to
    use $v instead hardcoded version.
    
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    Reviewed-by: Henry Wang <Henry.Wang@arm.com>

commit 6a6ae4ac349ee31030d4fb3952f2c3b48e60d09f
Author: Julien Grall <jgrall@amazon.com>
Date:   Thu Feb 9 17:07:13 2023 +0000

    docs/process: branching-checklist: Remove reference to root
    
    The steps to generate the documentation for the new branch requires
    to ssh as root and then su to run with the user xendocs.
    
    The release technician may not (and should not) have access to root.
    So update the step to directly ssh as xendocs.
    
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    Acked-by: George Dunlap <george.dunlap@cloud.com>
    Reviewed-by: Henry Wang <Henry.Wang@arm.com>

commit f87a15f5cce5c76c3d8028b7129f3a1abf1d6b7d
Author: Julien Grall <jgrall@amazon.com>
Date:   Thu Feb 9 17:04:41 2023 +0000

    docs/process: branching-checklist: Remove reference to qemu-ijw.git
    
    Per [1], qemu-iwj.git was a clone of QEMU traditional on Ian's computer
    for tagging QEMU trad.
    
    The next section will provide tag for the official tree. So remove
    the section about qemu-ijw.git.
    
    [1] 25482.10006.140155.984629@chiark.greenend.org.uk
    
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    Acked-by: George Dunlap <george.dunlap@cloud.com>
    Acked-by: Ian Jackson <ijackson@chiark.greenend.org.uk>
    Reviewed-by: Henry Wang <Henry.Wang@arm.com>

commit 5dbe775c2b622a9473ddb9492db63cc320d562c4
Author: Julien Grall <jgrall@amazon.com>
Date:   Thu Feb 9 17:04:30 2023 +0000

    docs/process: branching-checklist: Use consistent indentation
    
    At the moment, branch-checklist.txt is using a mix of soft and hard
    tab. They are both meant to be represented using 8 characters.
    
    In Xen we tend to use 4-space softtab represented with 4 characters. So
    to avoid  having to use a different editor configuration, switch all
    the indentation to 4-space softtab.
    
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    Acked-by: George Dunlap <george.dunlap@cloud.com>
    Reviewed-by: Henry Wang <Henry.Wang@arm.com>
(qemu changes not included)

