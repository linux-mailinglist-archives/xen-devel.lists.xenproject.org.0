Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 389FA6C89B8
	for <lists+xen-devel@lfdr.de>; Sat, 25 Mar 2023 01:45:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514495.796803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfs0d-0001zG-2J; Sat, 25 Mar 2023 00:43:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514495.796803; Sat, 25 Mar 2023 00:43:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfs0c-0001xK-Vn; Sat, 25 Mar 2023 00:43:50 +0000
Received: by outflank-mailman (input) for mailman id 514495;
 Sat, 25 Mar 2023 00:43:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pfs0a-0001xA-O3; Sat, 25 Mar 2023 00:43:48 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pfs0a-0002Hx-JM; Sat, 25 Mar 2023 00:43:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pfs0a-0001C7-6E; Sat, 25 Mar 2023 00:43:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pfs0a-00044p-5p; Sat, 25 Mar 2023 00:43:48 +0000
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
	bh=t/2z3YBNv+dlKzBpFpZAmw8SIDykN63jiJJOALYI1Kc=; b=5ay+5ktGLW1MMOgoahqKA17vcX
	4KRm9beBhFBJbunmNW7z+oL6Znv9IdqHRVSMEeMCLOkJL1KJ0IeVwg+/cThQFSCAOqUp8wlLdnnX0
	NXJVPtj6RZ/3XDUwbXC+wSUB7/2D7GZnz2uHu05VoIx5RsPUUaQDhCySBkYorod7qOpY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-179904-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 179904: regressions - trouble: fail/pass/starved
X-Osstest-Failures:
    xen-unstable:test-amd64-i386-xl:xen-install:fail:regression
    xen-unstable:test-amd64-i386-libvirt-pair:xen-install/src_host:fail:regression
    xen-unstable:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:heisenbug
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
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
    xen-unstable:build-armhf:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    xen=95b757598f699bcb37f7d1fa60faa0ccd0d55c77
X-Osstest-Versions-That:
    xen=245d030f4aa79f766e575684127f86748c63bb32
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 25 Mar 2023 00:43:48 +0000

flight 179904 xen-unstable real [real]
flight 179949 xen-unstable real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/179904/
http://logs.test-lab.xenproject.org/osstest/logs/179949/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl            7 xen-install              fail REGR. vs. 179853
 test-amd64-i386-libvirt-pair 10 xen-install/src_host     fail REGR. vs. 179853

Tests which are failing intermittently (not blocking):
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail pass in 179949-retest

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 179853
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 179853
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 179853
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 179853
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 179853
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 179853
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 179853
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 179853
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 179853
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
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
 build-armhf                   2 hosts-allocate               starved  n/a

version targeted for testing:
 xen                  95b757598f699bcb37f7d1fa60faa0ccd0d55c77
baseline version:
 xen                  245d030f4aa79f766e575684127f86748c63bb32

Last test of basis   179853  2023-03-21 22:12:49 Z    3 days
Failing since        179882  2023-03-23 03:10:34 Z    1 days    2 attempts
Testing same since   179904  2023-03-23 17:39:36 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Christian Lindig <christian.lindig@cloud.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com> # tools/python/xen/lowlevel/xc/xc.c

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
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          starved 
 test-amd64-i386-xl                                           fail    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  fail    
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
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-i386-examine-bios                                 pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  starved 
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
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
 test-amd64-i386-migrupgrade                                  pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                starved 
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 fail    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               starved 
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 starved 
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     starved 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-i386-examine-uefi                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      pass    
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
commit 95b757598f699bcb37f7d1fa60faa0ccd0d55c77
Author: Juergen Gross <jgross@suse.com>
Date:   Thu Mar 23 09:18:26 2023 +0100

    tools/xl: rework p9 config parsing
    
    Rework the config parsing of a p9 device to use the
    split_string_into_pair() function instead of open coding it.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
    Acked-by: Anthony PERARD <anthony.perard@citrix.com>

commit 4bad14a133aa0c817a90a13c4e86531a7290deea
Author: Juergen Gross <jgross@suse.com>
Date:   Thu Mar 23 09:18:12 2023 +0100

    tools/xl: make split_string_into_pair() more usable
    
    Today split_string_into_pair() will not really do what its name is
    suggesting: instead of splitting a string into a pair of strings using
    a delimiter, it will return the first two strings of the initial string
    by using the delimiter.
    
    This is never what the callers want, so modify split_string_into_pair()
    to split the string only at the first delimiter found, resulting in
    something like "x=a=b" to be split into "x" and "a=b" when being called
    with "=" as the delimiter. Today the returned strings would be "x" and
    "a".
    
    At the same time switch the delimiter from "const char *" (allowing
    multiple delimiter characters) to "char" (a single character only), as
    this makes the function more simple without breaking any use cases.
    
    Suggested-by: Anthony PERARD <anthony.perard@citrix.com>
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
    Acked-by: Anthony PERARD <anthony.perard@citrix.com>

commit 4fe3c78d8103eac0a8d9fa4c8176d012614652d0
Author: Juergen Gross <jgross@suse.com>
Date:   Thu Mar 23 09:17:57 2023 +0100

    tools: use libxenlight for writing xenstore-stubdom console nodes
    
    Instead of duplicating libxl__device_console_add() work in
    init-xenstore-domain.c, just use libxenlight.
    
    This requires to add a small wrapper function to libxenlight, as
    libxl__device_console_add() is an internal function.
    
    This at once removes a theoretical race between starting xenconsoled
    and xenstore-stubdom, as the old code wasn't using a single
    transaction for writing all the entries, leading to the possibility
    that xenconsoled would see only some of the entries being written.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

commit 49de6749baa8d0addc3048defd4ef3e85cb135e9
Author: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Date:   Thu Mar 23 09:16:41 2023 +0100

    VT-d: fix iommu=no-igfx if the IOMMU scope contains fake device(s)
    
    If the scope for IGD's IOMMU contains additional device that doesn't
    actually exist, iommu=no-igfx would not disable that IOMMU. In this
    particular case (Thinkpad x230) it included 00:02.1, but there is no
    such device on this platform. Consider only existing devices for the
    "gfx only" check as well as the establishing of IGD DRHD address
    (underlying is_igd_drhd(), which is used to determine applicability of
    two workarounds).
    
    Fixes: 2d7f191b392e ("VT-d: generalize and correct "iommu=no-igfx" handling")
    Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Kevin Tian <kevin.tian@intel.com>

commit eee0d79134cffe605e49d240c985bc571d4bacca
Author: Juergen Gross <jgross@suse.com>
Date:   Wed Mar 22 10:00:09 2023 +0100

    tools/xl: allow split_string_into_pair() to trim values
    
    Most use cases of split_string_into_pair() are requiring the returned
    strings to be white space trimmed.
    
    In order to avoid the same code pattern multiple times, add a predicate
    parameter to split_string_into_pair() which can be specified to call
    trim() with that predicate for the string pair returned. Specifying
    NULL for the predicate will avoid the call of trim().
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
    Acked-by: Anthony PERARD <anthony.perard@citrix.com>

commit 7fa8b6cda90c4cade2cfda098fd73e091ad776d3
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Mar 22 09:58:25 2023 +0100

    move {,vcpu_}show_execution_state() declarations to common header
    
    These are used from common code, so their signatures should be
    consistent across architectures. This is achieved / guaranteed easiest
    when their declarations are in a common header.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit 5b18843067278ba972a695ac7edca1dd21bcd01b
Author: Juergen Gross <jgross@suse.com>
Date:   Wed Mar 22 09:57:19 2023 +0100

    tools: rename xen-tools/libs.h file to common-macros.h
    
    In order to better reflect the contents of the header and to make it
    more appropriate to use it for different runtime environments like
    programs, libraries, and firmware, rename the libs.h include file to
    common-macros.h. Additionally add a comment pointing out the need to be
    self-contained.
    
    Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com> # tools/python/xen/lowlevel/xc/xc.c
    Acked-by: Christian Lindig <christian.lindig@cloud.com>
    Acked-by: Anthony PERARD <anthony.perard@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
(qemu changes not included)

