Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A33928803E4
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 18:50:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695552.1085402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmdbd-0003kB-GM; Tue, 19 Mar 2024 17:50:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695552.1085402; Tue, 19 Mar 2024 17:50:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmdbd-0003gx-Cs; Tue, 19 Mar 2024 17:50:33 +0000
Received: by outflank-mailman (input) for mailman id 695552;
 Tue, 19 Mar 2024 17:50:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rmdbc-0003gn-6o; Tue, 19 Mar 2024 17:50:32 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rmdbc-0001GE-4S; Tue, 19 Mar 2024 17:50:32 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rmdbb-0000XH-NT; Tue, 19 Mar 2024 17:50:31 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rmdbb-0007fZ-Mw; Tue, 19 Mar 2024 17:50:31 +0000
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
	bh=/HBk8YBIq7OzXhMEHVWMW2QSJ+x0P25vjjBFd4o3cWA=; b=w+06aiNika4Rpe3rIYtP6XlvoC
	6fuTmFmb0L79nsYKEOVZZMkQYYnN2lloipCVWuLLx3BqALNWAXMucEshqaq9vyplJgT45Sp5hLUp1
	Nc8MzgRK7Au7Jz1DSTZaDTcFx7ebwL26HJloSN05RuQ3NXfnwKrwGJjYYLMPTTS0kNAU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185083-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 185083: regressions - trouble: blocked/broken/fail/pass
X-Osstest-Failures:
    xen-unstable:build-i386-libvirt:<job status>:broken:regression
    xen-unstable:build-i386-libvirt:host-build-prep:fail:regression
    xen-unstable:test-armhf-armhf-xl-credit1:xen-boot:fail:regression
    xen-unstable:test-amd64-i386-libvirt:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-libvirt-pair:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-libvirt-raw:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-i386-libvirt-xsm:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:windows-install:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=62018f08708a5ff6ef8fc8ff2aaaac46e5a60430
X-Osstest-Versions-That:
    xen=d638e304f13a5ef7d125de5ace5f7828a7b25bac
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 19 Mar 2024 17:50:31 +0000

flight 185083 xen-unstable real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185083/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-i386-libvirt              <job status>                 broken
 build-i386-libvirt            5 host-build-prep          fail REGR. vs. 185072
 test-armhf-armhf-xl-credit1   8 xen-boot                 fail REGR. vs. 185072

Tests which did not succeed, but are not blocking:
 test-amd64-i386-libvirt       1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-i386-libvirt-raw   1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-xsm   1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 185072
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 185072
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 185072
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 185072
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 185072
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 185072
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 185072
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 185072
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 185072
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 185072
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 185072
 test-amd64-amd64-xl-qemuu-win7-amd64 12 windows-install       fail like 185072
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 xen                  62018f08708a5ff6ef8fc8ff2aaaac46e5a60430
baseline version:
 xen                  d638e304f13a5ef7d125de5ace5f7828a7b25bac

Last test of basis   185072  2024-03-18 01:54:35 Z    1 days
Testing same since   185083  2024-03-18 16:39:27 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Federico Serafini <federico.serafini@bugseng.com>
  George Dunlap <george.dunlap@cloud.com>
  Jan Beulich <jbeulich@suse.com>
  Kevin Tian <kevin.tian@intel.com>
  Nicola Vetrini <nicola.vetrini@bugseng.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Vaishali Thakkar <vaishali.thakkar@vates.tech>
  Wei Liu <wl@xen.org>

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
 build-i386-libvirt                                           broken  
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
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            blocked 
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  blocked 
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
 test-armhf-armhf-xl-credit1                                  fail    
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
 test-amd64-i386-libvirt                                      blocked 
 test-amd64-amd64-livepatch                                   pass    
 test-amd64-i386-livepatch                                    pass    
 test-amd64-amd64-migrupgrade                                 pass    
 test-amd64-i386-migrupgrade                                  pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 blocked 
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  blocked 
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

broken-job build-i386-libvirt broken

Not pushing.

------------------------------------------------------------
commit 62018f08708a5ff6ef8fc8ff2aaaac46e5a60430
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Mar 18 13:53:37 2024 +0100

    x86/mm: use block_lock_speculation() in _mm_write_lock()
    
    I can only guess that using block_speculation() there was a leftover
    from, earlier on, SPECULATIVE_HARDEN_LOCK depending on
    SPECULATIVE_HARDEN_BRANCH.
    
    Fixes: 197ecd838a2a ("locking: attempt to ensure lock wrappers are always inline")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit d92a67b60c038ebb0f0b83a7f1ce5ad359e052d6
Author: Nicola Vetrini <nicola.vetrini@bugseng.com>
Date:   Mon Mar 18 13:53:07 2024 +0100

    xen/sched: address violations of MISRA C Rule 20.7
    
    MISRA C Rule 20.7 states: "Expressions resulting from the expansion
    of macro parameters shall be enclosed in parentheses". Therefore, some
    macro definitions should gain additional parentheses to ensure that all
    current and future users will be safe with respect to expansions that
    can possibly alter the semantics of the passed-in macro parameter.
    
    No functional change.
    
    Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
    Acked-by: George Dunlap <george.dunlap@cloud.com>

commit f93d8dd5198c1ac0a4be5c7fb1b5a997d5c42a97
Author: Federico Serafini <federico.serafini@bugseng.com>
Date:   Mon Mar 18 13:52:53 2024 +0100

    automation/eclair: allow parameter name "unused"
    
    Update ECLAIR configuration of MISRA C:2012 Rule 8.3 to deviate
    violations involving parameter name "unused" (with an optional
    numeric suffix): it makes explicit the intention of not using such
    parameter within the function.
    
    Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit a5b90a90eee4709a3fe434e7da83b8421528e8fe
Author: Wei Liu <wl@xen.org>
Date:   Mon Mar 18 13:52:35 2024 +0100

    MAINTAINERS: remove myself from various positions
    
    I have not been active in the Xen community for some time. Update the
    MAINTAINERS file to reflect reality.
    
    Signed-off-by: Wei Liu <wl@xen.org>
    Acked-by: Stefano Stabellini <sstabellini@kernel.org>

commit ad52857efcd6e662f4ef75bc9d27368c8b99f1a5
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Mar 18 13:52:09 2024 +0100

    MAINTAINERS: drop AMD IOMMU and Intel VT-d sections
    
    We'd like to thank Kevin, so far the VT-d maintainer, for his past
    contributions, while at the same time we'd like to reflect reality as it
    has been for quite some time. Have VT-d maintainership (and for symmetry
    also AMD IOMMU's) fall back to the maintainers of general x86. This also
    brings things in sync with how they are for Arm.
    
    While touching the X86 section also append two so far missing slashes.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Kevin Tian <kevin.tian@intel.com>

commit 8a8d5c22afc515020669d9479b97e4ddda26d2b5
Author: Federico Serafini <federico.serafini@bugseng.com>
Date:   Mon Mar 18 13:51:17 2024 +0100

    perfc: add pseudo-keyword fallthrough
    
    Add pseudo-keyword fallthrough to make explicit the intention of the
    code and meet requirements to deviate MISRA C:2012 Rule 16.3
    ("An unconditional `break' statement shall terminate every
    switch-clause").
    
    No functional change.
    
    Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 53b5208de8f3151be0729e6ac49c9b616c07c5ff
Author: Vaishali Thakkar <vaishali.thakkar@vates.tech>
Date:   Mon Mar 18 13:50:33 2024 +0100

    x86/svmdebug: Print np, sev and sev_es vmcb bits
    
    Currently only raw _np_ctrl is being printed. It can
    be informational to know about which particular bits
    are enabled. So, this commit adds the bit-by-bit decode
    for np, sev and sev_es bits.
    
    Note that while, only np is enabled in certain scenarios
    at the moment, work for enabling sev and sev_es is in
    progress. And it'll be useful to have this information as
    part of svmdebug.
    
    Signed-off-by: Vaishali Thakkar <vaishali.thakkar@vates.tech>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 2f09f797ba43f1182cf5ce24e9ef63cd148d385e
Author: Vaishali Thakkar <vaishali.thakkar@vates.tech>
Date:   Mon Mar 18 13:49:46 2024 +0100

    x86/svm: Drop the suffix _guest from vmcb bit
    
    The suffix _guest is redundant for asid bit. Drop it
    to avoid adding extra code volume.
    
    While we're here, replace 0/1 with false/true and use
    VMCB accessors instead of open coding.
    
    Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Vaishali Thakkar <vaishali.thakkar@vates.tech>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
(qemu changes not included)

