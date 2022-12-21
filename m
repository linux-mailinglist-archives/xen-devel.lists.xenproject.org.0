Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6477C652D01
	for <lists+xen-devel@lfdr.de>; Wed, 21 Dec 2022 07:43:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467564.726607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7soF-0006sS-7Q; Wed, 21 Dec 2022 06:42:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467564.726607; Wed, 21 Dec 2022 06:42:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7soF-0006pK-3r; Wed, 21 Dec 2022 06:42:35 +0000
Received: by outflank-mailman (input) for mailman id 467564;
 Wed, 21 Dec 2022 06:42:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p7soD-0006p8-2w; Wed, 21 Dec 2022 06:42:33 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p7soC-0000cJ-VF; Wed, 21 Dec 2022 06:42:33 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p7soC-0008Uz-FG; Wed, 21 Dec 2022 06:42:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p7soC-000468-De; Wed, 21 Dec 2022 06:42:32 +0000
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
	bh=ne6CD7LIqo8GwcwZun+7quWzZvpjpU0XcSNMsOloAPE=; b=1+owhR7+VqOkVo9DmDzxSv/taR
	alcqgHltMoYcPBTnmNz4HJsa5vW4Hktbb0T0in7f6ZWl4sxjZKloHj9qActj90a2HNrLmKeWYnBCG
	FDGOmHRZV05/5tKgQppsRHcHYSskBzWDSRrtKT+lL7Mj7pjBkG1aOqxyk1m43hsaWKLA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175425-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.17-testing test] 175425: regressions - trouble: blocked/broken/fail/pass
X-Osstest-Failures:
    xen-4.17-testing:build-arm64-pvops:<job status>:broken:regression
    xen-4.17-testing:build-arm64-pvops:host-install(4):broken:regression
    xen-4.17-testing:test-amd64-i386-qemut-rhel6hvm-amd:xen-install:fail:regression
    xen-4.17-testing:test-amd64-i386-xl:xen-install:fail:regression
    xen-4.17-testing:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-seattle:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-vhd:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    xen-4.17-testing:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.17-testing:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.17-testing:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-4.17-testing:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=a7a26da0b59da7233e6c6f63b180bab131398351
X-Osstest-Versions-That:
    xen=11560248ffda3f00f20bbdf3ae088af474f7f2a3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 21 Dec 2022 06:42:32 +0000

flight 175425 xen-4.17-testing real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175425/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64-pvops               <job status>                 broken
 build-arm64-pvops             4 host-install(4)        broken REGR. vs. 175096
 test-amd64-i386-qemut-rhel6hvm-amd  7 xen-install        fail REGR. vs. 175096
 test-amd64-i386-xl            7 xen-install              fail REGR. vs. 175096

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-seattle   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-vhd       1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 175096
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 175096
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 175096
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 175096
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 175096
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 175096
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 175096
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 175096
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 175096
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 175096
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 175096
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 175096
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 xen                  a7a26da0b59da7233e6c6f63b180bab131398351
baseline version:
 xen                  11560248ffda3f00f20bbdf3ae088af474f7f2a3

Last test of basis   175096  2022-12-08 18:07:02 Z   12 days
Testing same since   175425  2022-12-20 13:06:46 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Demi Marie Obenour <demi@invisiblethingslab.com>
  Jan Beulich <jbeulich@suse.com>
  Neowutran <xen@neowutran.ovh>
  Per Bilse <per.bilse@citrix.com>
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
 build-arm64-pvops                                            broken  
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-xtf-amd64-amd64-1                                       pass    
 test-xtf-amd64-amd64-2                                       pass    
 test-xtf-amd64-amd64-3                                       pass    
 test-xtf-amd64-amd64-4                                       pass    
 test-xtf-amd64-amd64-5                                       pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          blocked 
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           fail    
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
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      blocked 
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemut-rhel6hvm-amd                           fail    
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
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  blocked 
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  blocked 
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
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
 test-arm64-arm64-libvirt-raw                                 blocked 
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 blocked 
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      blocked 
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

broken-job build-arm64-pvops broken
broken-step build-arm64-pvops host-install(4)

Not pushing.

------------------------------------------------------------
commit a7a26da0b59da7233e6c6f63b180bab131398351
Author: Neowutran <xen@neowutran.ovh>
Date:   Tue Dec 20 13:46:38 2022 +0100

    x86/time: prevent overflow with high frequency TSCs
    
    Make sure tsc_khz is promoted to a 64-bit type before multiplying by
    1000 to avoid an 'overflow before widen' bug. Otherwise just above
    4.294GHz the value will overflow. Processors with clocks this high are
    now in production and require this to work correctly.
    
    Signed-off-by: Neowutran <xen@neowutran.ovh>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    master commit: ad15a0a8ca2515d8ac58edfc0bc1d3719219cb77
    master date: 2022-12-19 11:34:16 +0100

commit 1dcc9b6dfe528c7815a314f9b5581804b5e23750
Author: Demi Marie Obenour <demi@invisiblethingslab.com>
Date:   Tue Dec 20 13:46:09 2022 +0100

    EFI: relocate the ESRT when booting via multiboot2
    
    This was missed in the initial patchset.
    
    Move efi_relocate_esrt() up to avoid adding a forward declaration.
    
    Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    master commit: 8d7acf3f7d8d2555c78421dced45bc49f79ae806
    master date: 2022-12-14 12:00:35 +0100

commit c3e37c60fbf8f8cd71db0f0846c9c7aeadf02963
Author: Per Bilse <per.bilse@citrix.com>
Date:   Tue Dec 20 13:45:38 2022 +0100

    ioreq_broadcast(): accept partial broadcast success
    
    Avoid incorrectly triggering an error when a broadcast buffered ioreq
    is not handled by all registered clients, as long as the failure is
    strictly because the client doesn't handle buffered ioreqs.
    
    Signed-off-by: Per Bilse <per.bilse@citrix.com>
    Reviewed-by: Paul Durrant <paul@xen.org>
    master commit: a44734df6c24fadbdb001f051cc5580c467caf7d
    master date: 2022-12-07 12:17:30 +0100

commit 26f39b3d705b667aa21f368c252abffb0b4d3e5d
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Dec 20 13:45:07 2022 +0100

    x86/HVM: don't mark evtchn upcall vector as pending when vLAPIC is disabled
    
    Linux'es relatively new use of HVMOP_set_evtchn_upcall_vector has
    exposed a problem with the marking of the respective vector as
    pending: For quite some time Linux has been checking whether any stale
    ISR or IRR bits would still be set while preparing the LAPIC for use.
    This check is now triggering on the upcall vector, as the registration,
    at least for APs, happens before the LAPIC is actually enabled.
    
    In software-disabled state an LAPIC would not accept any interrupt
    requests and hence no IRR bit would newly become set while in this
    state. As a result it is also wrong for us to mark the upcall vector as
    having a pending request when the vLAPIC is in this state.
    
    To compensate for the "enabled" check added to the assertion logic, add
    logic to (conditionally) mark the upcall vector as having a request
    pending at the time the LAPIC is being software-enabled by the guest.
    Note however that, like for the pt_may_unmask_irq() we already have
    there, long term we may need to find a different solution. This will be
    especially relevant in case yet better LAPIC acceleration would
    eliminate notifications of guest writes to this and other registers.
    
    Fixes: 7b5b8ca7dffd ("x86/upcall: inject a spurious event after setting upcall vector")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Juergen Gross <jgross@suse.com>
    master commit: f5d0279839b58cb622f0995dbf9cff056f03082e
    master date: 2022-12-06 13:51:49 +0100

commit 5810edc049cd5828c2628a377ca8443610e54f82
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Dec 20 13:44:38 2022 +0100

    x86/Viridian: don't mark IRQ vectors as pending when vLAPIC is disabled
    
    In software-disabled state an LAPIC does not accept any interrupt
    requests and hence no IRR bit would newly become set while in this
    state. As a result it is also wrong for us to mark Viridian IPI or timer
    vectors as having a pending request when the vLAPIC is in this state.
    Such interrupts are simply lost.
    
    Introduce a local variable in send_ipi() to help readability.
    
    Fixes: fda96b7382ea ("viridian: add implementation of the HvSendSyntheticClusterIpi hypercall")
    Fixes: 26fba3c85571 ("viridian: add implementation of synthetic timers")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Paul Durrant <paul@xen.org>
    master commit: 831419f82913417dee4e5b0f80769c5db590540b
    master date: 2022-12-02 10:35:32 +0100

commit 54bb56e12868100c5ce06e33b4f57b6b2b8f37b9
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Dec 20 13:44:07 2022 +0100

    x86/HVM: don't mark external IRQs as pending when vLAPIC is disabled
    
    In software-disabled state an LAPIC does not accept any interrupt
    requests and hence no IRR bit would newly become set while in this
    state. As a result it is also wrong for us to mark IO-APIC or MSI
    originating vectors as having a pending request when the vLAPIC is in
    this state. Such interrupts are simply lost.
    
    Introduce (IO-APIC) or re-use (MSI) a local variable to help
    readability.
    
    Fixes: 4fe21ad3712e ("This patch add virtual IOAPIC support for VMX guest")
    Fixes: 85715f4bc7c9 ("MSI 5/6: add MSI support to passthrough HVM domain")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    master commit: f1d7aac1e3c3cd164e17d41791a575a5c3e87121
    master date: 2022-12-02 10:35:01 +0100

commit b7b34bd66ac77326bb49b10130013b4a9f83e4a2
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Tue Dec 20 13:43:37 2022 +0100

    x86/pvh: do not forward MADT Local APIC NMI structures to dom0
    
    Currently Xen will passthrough any Local APIC NMI Structure found in
    the native ACPI MADT table to a PVH dom0.  This is wrong because PVH
    doesn't have access to the physical local APIC, and instead gets an
    emulated local APIC by Xen, that doesn't have the LINT0 or LINT1
    pins wired to anything.  Furthermore the ACPI Processor UIDs used in
    the APIC NMI Structures are likely to not match the ones generated by
    Xen for the Local x2APIC Structures, creating confusion to dom0.
    
    Fix this by removing the logic to passthrough the Local APIC NMI
    Structure for PVH dom0.
    
    Fixes: 1d74282c45 ('x86: setup PVHv2 Dom0 ACPI tables')
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    master commit: b39e6385250ccef9509af0eab9003ad5c1478842
    master date: 2022-12-02 10:33:40 +0100

commit 9cbc04a95f8a7f7cc27901211cbe19a42850c4ed
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Tue Dec 20 13:43:04 2022 +0100

    x86/irq: do not release irq until all cleanup is done
    
    Current code in _clear_irq_vector() will mark the irq as unused before
    doing the cleanup required when move_in_progress is true.
    
    This can lead to races in create_irq() if the function picks an irq
    desc that's been marked as unused but has move_in_progress set, as the
    call to assign_irq_vector() in that function can then fail with
    -EAGAIN.
    
    Prevent that by only marking irq descs as unused when all the cleanup
    has been done.  While there also use write_atomic() when setting
    IRQ_UNUSED in _clear_irq_vector() and add a barrier in order to
    prevent the setting of IRQ_UNUSED getting reordered by the compiler.
    
    The check for move_in_progress cannot be removed from
    _assign_irq_vector(), as other users (io_apic_set_pci_routing() and
    ioapic_guest_write()) can still pass active irq descs to
    assign_irq_vector().
    
    Note the trace point is not moved and is now set before the irq is
    marked as unused.  This is done so that the CPU mask provided in the
    trace point is the one belonging to the current vector, not the old
    one.
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    master commit: e267d11969a40f0aec33dbf966f5a6490b205f43
    master date: 2022-12-02 10:32:21 +0100

commit 0b999fa2eadaeff840a8331b87f1f73abf3b14eb
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Dec 20 13:40:38 2022 +0100

    update Xen version to 4.17.1-pre
(qemu changes not included)

