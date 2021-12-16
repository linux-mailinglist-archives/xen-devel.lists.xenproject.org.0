Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E9447728F
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 14:03:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247941.427598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxqOG-0007SZ-Gd; Thu, 16 Dec 2021 13:01:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247941.427598; Thu, 16 Dec 2021 13:01:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxqOG-0007Q4-9f; Thu, 16 Dec 2021 13:01:44 +0000
Received: by outflank-mailman (input) for mailman id 247941;
 Thu, 16 Dec 2021 13:01:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mxqOE-0007Pu-K6; Thu, 16 Dec 2021 13:01:42 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mxqOE-0007TJ-2V; Thu, 16 Dec 2021 13:01:42 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mxqOD-0000xg-P1; Thu, 16 Dec 2021 13:01:41 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mxqOD-0000K6-OW; Thu, 16 Dec 2021 13:01:41 +0000
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
	bh=F2ruPA49gUvoGeF1MFQA5D1MrGFa00GvJlcO5eZDLBM=; b=f5/aAGHiXvmcbbfNr0ZnvahIwq
	thBMrV0Tr4raaDMaElc4wf3o1WeNm3nUXv6BltUPguARFafe4BJNsrTRYfFrtcnuQwGCbUMRjCLIh
	EmAZCAJ8a0SaZfyYNhHMLHiE4KO4MXcN+sCqctlZoAKrhz207L3y2B7A30+SuH2iQISY=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-167440-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 167440: trouble: broken/fail/pass
X-Osstest-Failures:
    xen-unstable:test-armhf-armhf-libvirt:<job status>:broken:regression
    xen-unstable:test-armhf-armhf-libvirt:host-install(5):broken:regression
    xen-unstable:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:allowable
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=8b3cbdbe782cae972e9a47cf22620ebee61a96a6
X-Osstest-Versions-That:
    xen=d828caa9aeee80c59a35f662f875f6573e9b532f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 16 Dec 2021 13:01:41 +0000

flight 167440 xen-unstable real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167440/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-libvirt        <job status>                 broken
 test-armhf-armhf-libvirt      5 host-install(5)        broken REGR. vs. 167411

Regressions which are regarded as allowable (not blocking):
 test-armhf-armhf-xl-rtds    18 guest-start/debian.repeat fail REGR. vs. 167411

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 167411
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 167411
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 167411
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 167411
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 167411
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 167411
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 167411
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 167411
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 167411
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 167411
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 167411
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 xen                  8b3cbdbe782cae972e9a47cf22620ebee61a96a6
baseline version:
 xen                  d828caa9aeee80c59a35f662f875f6573e9b532f

Last test of basis   167411  2021-12-14 12:17:05 Z    2 days
Failing since        167418  2021-12-14 21:38:12 Z    1 days    2 attempts
Testing same since   167440  2021-12-15 22:09:58 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Bobby Eshleman <bobby.eshleman@gmail.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
  Paul Durrant <paul@xen.org>

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
 test-armhf-armhf-xl-cubietruck                               pass    
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
 test-armhf-armhf-libvirt                                     broken  
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
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  pass    
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

broken-job test-armhf-armhf-libvirt broken
broken-step test-armhf-armhf-libvirt host-install(5)

Not pushing.

------------------------------------------------------------
commit 8b3cbdbe782cae972e9a47cf22620ebee61a96a6
Author: Bobby Eshleman <bobby.eshleman@gmail.com>
Date:   Tue Sep 28 13:30:24 2021 -0700

    arm/traps: remove debugger_trap_fatal() calls
    
    ARM doesn't actually use debugger_trap_* anything, and is stubbed out.
    
    This commit simply removes the unneeded calls.
    
    Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit 9956fdc70f99b0f133be7f16f62417928a84622c
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Dec 15 10:24:45 2021 +0100

    Arm: drop memguard_{,un}guard_range() stubs
    
    These exist for no reason: The code using them is only ever built for
    Arm32. And memguard_guard_stack() has no use outside of x86-specific
    code at all.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit fdf01494560219d10f92ce3419a5551e3ce5fe4f
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Dec 15 10:23:51 2021 +0100

    x86: drop MEMORY_GUARD
    
    The functions it guards are dead code. Worse, while intended to exist in
    debug builds only, as of commit bacbf0cb7349 ("build: convert debug to
    Kconfig") they also get compiled in release builds.
    
    The remaining uses in show_stack_overflow() aren't really related to any
    memory guarding anymore - with CET-SS support the stacks now get set up
    the same in debug and release builds. Drop them as well; there's no harm
    providing the information there in all cases.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 163db6a72b660f0f3c9fe1d34e8f6b07ae6bd77d
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Dec 15 10:20:35 2021 +0100

    x86/PVH: permit more physdevop-s to be used by Dom0
    
    Certain notifications of Dom0 to Xen are independent of the mode Dom0 is
    running in. Permit further PCI related ones (only their modern forms).
    Also include the USB2 debug port operation at this occasion. While
    largely relevant for the latter, drop the has_vpci() part of the
    conditional as redundant with is_hardware_domain(): There's no PVH Dom0
    without vPCI.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

commit 5b226ca74bb2c5cd84ede5c1f2b859c2e3bcd8a0
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Dec 15 10:19:54 2021 +0100

    x86/PVH: improve Dom0 memory size calculation
    
    Assuming that the accounting for IOMMU page tables will also take care
    of the P2M needs was wrong: dom0_paging_pages() can determine a far
    higher value, high enough for the system to run out of memory while
    setting up Dom0. Hence in the case of shared page tables the larger of
    the two values needs to be used (without shared page tables the sum of
    both continues to be applicable).
    
    To not further complicate the logic, eliminate the up-to-2-iteration
    loop in favor of doing a few calculations twice (before and after
    calling dom0_paging_pages()). While this will lead to slightly too high
    a value in "cpu_pages", it is deemed better to account a few too many
    than a few too little.
    
    As a result the calculation is now deemed good enough to no longer
    warrant the warning message, which therefore gets dropped.
    
    Also uniformly use paging_mode_enabled(), not is_hvm_domain().
    
    While there also account for two further aspects in the PV case: With
    "iommu=dom0-passthrough" no IOMMU page tables would get allocated, so
    none need accounting for. And if shadow mode is to be enabled (including
    only potentially, because of "pv-l1tf=dom0"), setting aside a suitable
    amount for the P2M pool to get populated is also necessary (i.e. similar
    to the non-shared-page-tables case of PVH).
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

commit a6d21af4a12d310fec72ca3e87e2a3b045643a25
Author: Anthony PERARD <anthony.perard@citrix.com>
Date:   Wed Dec 15 10:17:34 2021 +0100

    build: adjust $(TARGET).efi creation in arch/arm
    
    There is no need to try to guess a relative path to the "xen.efi" file,
    we can simply use $@. Also, there's no need to use `notdir`, make
    already do that work via $(@F).
    
    Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit 19427e439e01715c1a493c1528122234346efe38
Author: Anthony PERARD <anthony.perard@citrix.com>
Date:   Wed Dec 15 10:16:51 2021 +0100

    build: generate "include/xen/compile.h" with if_changed
    
    This will avoid regenerating "compile.h" if the content hasn't changed.
    
    As it's currently the case, the file isn't regenerated during `sudo
    make install` if it exist and does belong to a different user, thus we
    can remove the target "delete-unfresh-files". Target "$(TARGET)" still
    need a phony dependency, so add "FORCE".
    
    Use "$(dot-target).tmp" as temporary file as this is already cover by
    ".*.tmp" partern in ".gitconfig".
    
    Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 725381a5eab35227ef0099a43e05034def42bb77
Author: Anthony PERARD <anthony.perard@citrix.com>
Date:   Wed Dec 15 10:14:13 2021 +0100

    xen: move include/asm-* to arch/*/include/asm
    
    This avoid the need to create the symbolic link "include/asm".
    
    Whenever a comment refer to an "asm" headers, this patch avoid
    spelling the arch when not needed to avoid some code churn.
    
    One unrelated change is to sort entries in MAINTAINERS for "INTEL(R)
    VT FOR X86 (VT-X)"
    
    Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
    Acked-by: Paul Durrant <paul@xen.org>
    Acked-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Julien Grall <jgrall@amazon.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 72f12ac6a36d5aa0567fd7abc2856e3bf054c4ef
Author: Anthony PERARD <anthony.perard@citrix.com>
Date:   Wed Dec 15 10:08:38 2021 +0100

    build: factorise generation of the linker scripts
    
    In Arm and X86 makefile, generating the linker script is the same, so
    we can simply have both call the same macro.
    
    We need to add *.lds files into extra-y so that Rules.mk can find the
    .*.cmd dependency file and load it.
    
    Change made to the command line:
    - Use cpp_flags macro which simply filter -Wa,% options from $(a_flags).
    - Added -D__LINKER__ even it is only used by Arm's lds.
    
    Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit 249e0f1d8f203188ccdcced5a05c2149739e1566
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Dec 13 20:33:42 2021 +0000

    x86/cpuid: Fix TSXLDTRK definition
    
    TSXLDTRK lives in CPUID leaf 7[0].edx, not 7[0].ecx.
    
    Bit 16 in ecx is LA57.
    
    Fixes: a6d1b558471f ("x86emul: support X{SUS,RES}LDTRK")
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 1382241fe880d48e109f2056cec052bb3919a9d1
Author: Juergen Gross <jgross@suse.com>
Date:   Tue Dec 14 09:50:07 2021 +0100

    perfc: drop calls_to_multicall performance counter
    
    The calls_to_multicall performance counter is basically redundant to
    the multicall hypercall counter. The only difference is the counting
    of continuation calls, which isn't really that interesting.
    
    Drop the calls_to_multicall performance counter.
    
    Suggested-by: Jan Beulich <jbeulich@suse.com>
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 668dd44902bbaf52f8e7214e0da060b6ec962e88
Author: Juergen Gross <jgross@suse.com>
Date:   Tue Dec 14 09:49:23 2021 +0100

    x86/perfc: add hypercall performance counters for hvm, correct pv
    
    The HVM hypercall handler is missing incrementing the per hypercall
    counters. Add that.
    
    The counters for PV are handled wrong, as they are not using
    perf_incra() with the number of the hypercall as index, but are
    incrementing the first hypercall entry (set_trap_table) for each
    hypercall. Fix that.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 7b99e7258559c9caa235d9faf323b22c68e4a581
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Dec 14 09:48:17 2021 +0100

    x86emul: drop "seg" parameter from insn_fetch() hook
    
    This is specified (and asserted for in a number of places) to always be
    CS. Passing this as an argument in various places is therefore
    pointless. The price to pay is two simple new functions, with the
    benefit of the PTWR case now gaining a more appropriate error code.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Paul Durrant <paul@xen.org>

commit c49ee0329ff3de98722fd74ed5ba6d9665701e54
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Dec 14 09:47:31 2021 +0100

    SUPPORT.md: limit security support for hosts with very much memory
    
    Sufficient and in particular regular testing on very large hosts cannot
    currently be guaranteed. Anyone wanting us to support larger hosts is
    free to propose so, but will need to supply not only test results, but
    also a test plan.
    
    This is a follow-up to XSA-385.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit 53ed194539ddbea4f6aecb1b7c2f33aa8c0201d9
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Dec 14 09:46:48 2021 +0100

    x86/monitor: don't open-code hvm_has_set_descriptor_access_exiting()
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed by: Alexandru Isaila <aisaila@bitdefender.com>

commit 7dc0233f534f64e7f3ee71e74e05dd5ab8a24808
Author: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Date:   Tue Dec 14 09:44:44 2021 +0100

    vpci: fix function attributes for vpci_process_pending
    
    vpci_process_pending is defined with different attributes, e.g.
    with __must_check if CONFIG_HAS_VPCI enabled and not otherwise.
    Fix this by defining both of the definitions with __must_check.
    
    Fixes: 14583a590783 ("7fbb096bf345 kconfig: don't select VPCI if building a shim-only binary")
    Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
(qemu changes not included)

