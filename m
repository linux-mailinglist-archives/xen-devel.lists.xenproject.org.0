Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C690837AF88
	for <lists+xen-devel@lfdr.de>; Tue, 11 May 2021 21:47:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126010.237198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgYKH-0005vE-FD; Tue, 11 May 2021 19:45:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126010.237198; Tue, 11 May 2021 19:45:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgYKH-0005tB-7R; Tue, 11 May 2021 19:45:53 +0000
Received: by outflank-mailman (input) for mailman id 126010;
 Tue, 11 May 2021 19:45:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lgYKF-0005sz-1E; Tue, 11 May 2021 19:45:51 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lgYKE-0003ev-QU; Tue, 11 May 2021 19:45:50 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lgYKE-0007We-Fh; Tue, 11 May 2021 19:45:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lgYKE-0000Ju-Es; Tue, 11 May 2021 19:45:50 +0000
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
	bh=usLGunb9ZCpuE4KlaJK+bTRqkDGbgqPGWRmT44tUqGs=; b=hXmjwTR6aMQCr2GnfzI5dQVjAX
	Lb6zpA1HMYaFVMeN+1PQem9NtZfXneIYiS8CPpSlrc864FLbSvQAjjhso28bxvepyjdoxpzLQ4LjH
	Bfhq6XjDkQRY8IlenQsl11BwcBM0R8k+8Jt/giRaZzsyUg6OO/TJAbc5jVwX/KgAL9eY=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161904-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 161904: trouble: blocked/broken/fail/pass
X-Osstest-Failures:
    xen-unstable:build-arm64:<job status>:broken:regression
    xen-unstable:build-arm64-pvops:<job status>:broken:regression
    xen-unstable:build-arm64-xsm:<job status>:broken:regression
    xen-unstable:build-arm64-pvops:host-install(4):broken:regression
    xen-unstable:build-arm64-xsm:host-install(4):broken:regression
    xen-unstable:build-arm64:host-install(4):broken:regression
    xen-unstable:test-arm64-arm64-examine:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    xen-unstable:build-arm64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=d4fb5f166c2bfbaf9ba0de69da0d411288f437a9
X-Osstest-Versions-That:
    xen=982c89ed527bc5b0ffae5da9fd33f9d2d1528f06
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 11 May 2021 19:45:50 +0000

flight 161904 xen-unstable real [real]
http://logs.test-lab.xenproject.org/osstest/logs/161904/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64                     <job status>                 broken
 build-arm64-pvops               <job status>                 broken
 build-arm64-xsm                 <job status>                 broken
 build-arm64-pvops             4 host-install(4)        broken REGR. vs. 161898
 build-arm64-xsm               4 host-install(4)        broken REGR. vs. 161898
 build-arm64                   4 host-install(4)        broken REGR. vs. 161898

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-examine      1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-seattle   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 build-arm64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 161898
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 161898
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 161898
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 161898
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 161898
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 161898
 test-armhf-armhf-xl-rtds     18 guest-start/debian.repeat    fail  like 161898
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 161898
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 161898
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 161898
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 161898
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 161898
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  d4fb5f166c2bfbaf9ba0de69da0d411288f437a9
baseline version:
 xen                  982c89ed527bc5b0ffae5da9fd33f9d2d1528f06

Last test of basis   161898  2021-05-10 19:06:50 Z    1 days
Testing same since   161904  2021-05-11 10:00:22 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Julien Grall <jgrall@amazon.com>
  Michal Orzel <michal.orzel@arm.com>
  Volodymyr Babchuk <volodymyr_babchuk@epam.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              broken  
 build-i386-xsm                                               pass    
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-arm64                                                  broken  
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          blocked 
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
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      blocked 
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
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  blocked 
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  blocked 
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     blocked 
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
 test-amd64-amd64-amd64-pvgrub                                pass    
 test-amd64-amd64-i386-pvgrub                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-xl-raw                                       pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 blocked 
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-xl-vhd                                      pass    


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

broken-job build-arm64 broken
broken-job build-arm64-pvops broken
broken-job build-arm64-xsm broken
broken-step build-arm64-pvops host-install(4)
broken-step build-arm64-xsm host-install(4)
broken-step build-arm64 host-install(4)

Not pushing.

------------------------------------------------------------
commit d4fb5f166c2bfbaf9ba0de69da0d411288f437a9
Author: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Date:   Fri May 7 01:39:47 2021 +0000

    optee: enable OPTEE_SMC_SEC_CAP_MEMREF_NULL capability
    
    OP-TEE mediator already have support for NULL memory references. It
    was added in patch 0dbed3ad336 ("optee: allow plain TMEM buffers with
    NULL address"). But it does not propagate
    OPTEE_SMC_SEC_CAP_MEMREF_NULL capability flag to a guest, so well
    behaving guest can't use this feature.
    
    Note: linux optee driver honors this capability flag when handling
    buffers from userspace clients, but ignores it when working with
    internal calls. For instance, __optee_enumerate_devices() function
    uses NULL argument to get buffer size hint from OP-TEE. This was the
    reason, why "optee: allow plain TMEM buffers with NULL address" was
    introduced in the first place.
    
    This patch adds the mentioned capability to list of known
    capabilities. From Linux point of view it means that userspace clients
    can use this feature, which is confirmed by OP-TEE test suite:
    
    * regression_1025 Test memref NULL and/or 0 bytes size
    o regression_1025.1 Invalid NULL buffer memref registration
      regression_1025.1 OK
    o regression_1025.2 Input/Output MEMREF Buffer NULL - Size 0 bytes
      regression_1025.2 OK
    o regression_1025.3 Input MEMREF Buffer NULL - Size non 0 bytes
      regression_1025.3 OK
    o regression_1025.4 Input MEMREF Buffer NULL over PTA invocation
      regression_1025.4 OK
      regression_1025 OK
    
    Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit 30f34457b20c78b2862b2b16cb26cb4f10a667ad
Author: Julien Grall <jgrall@amazon.com>
Date:   Mon May 10 18:28:16 2021 +0100

    tools/xenstore: Fix indentation in the header of xenstored_control.c
    
    Commit e867af081d94 "tools/xenstore: save new binary for live update"
    seemed to have spuriously changed the indentation of the first line of
    the copyright header.
    
    The previous indentation is re-instated so all the lines are indented
    the same.
    
    Reported-by: Bjoern Doebel <doebel@amazon.com>
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    Reviewed-by: Juergen Gross <jgross@suse.com>

commit 7e71b1e0affa83c0976c832f254276eeb6e6575c
Author: Julien Grall <jgrall@amazon.com>
Date:   Thu May 6 17:12:23 2021 +0100

    tools/xenstored: Prevent a buffer overflow in dump_state_node_perms()
    
    ASAN reported one issue when Live Updating Xenstored:
    
    =================================================================
    ==873==ERROR: AddressSanitizer: stack-buffer-overflow on address 0x7ffc194f53e0 at pc 0x555c6b323292 bp 0x7ffc194f5340 sp 0x7ffc194f5338
    WRITE of size 1 at 0x7ffc194f53e0 thread T0
        #0 0x555c6b323291 in dump_state_node_perms xen/tools/xenstore/xenstored_core.c:2468
        #1 0x555c6b32746e in dump_state_special_node xen/tools/xenstore/xenstored_domain.c:1257
        #2 0x555c6b32a702 in dump_state_special_nodes xen/tools/xenstore/xenstored_domain.c:1273
        #3 0x555c6b32ddb3 in lu_dump_state xen/tools/xenstore/xenstored_control.c:521
        #4 0x555c6b32e380 in do_lu_start xen/tools/xenstore/xenstored_control.c:660
        #5 0x555c6b31b461 in call_delayed xen/tools/xenstore/xenstored_core.c:278
        #6 0x555c6b32275e in main xen/tools/xenstore/xenstored_core.c:2357
        #7 0x7f95eecf3d09 in __libc_start_main ../csu/libc-start.c:308
        #8 0x555c6b3197e9 in _start (/usr/local/sbin/xenstored+0xc7e9)
    
    Address 0x7ffc194f53e0 is located in stack of thread T0 at offset 80 in frame
        #0 0x555c6b32713e in dump_state_special_node xen/tools/xenstore/xenstored_domain.c:1232
    
      This frame has 2 object(s):
        [32, 40) 'head' (line 1233)
        [64, 80) 'sn' (line 1234) <== Memory access at offset 80 overflows this variable
    
    This is happening because the callers are passing a pointer to a variable
    allocated on the stack. However, the field perms is a dynamic array, so
    Xenstored will end up to read outside of the variable.
    
    Rework the code so the permissions are written one by one in the fd.
    
    Fixes: ed6eebf17d2c ("tools/xenstore: dump the xenstore state for live update")
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    Reviewed-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

commit 3f568354a95ee2f0c9c553efb94c734fa6848af0
Author: Michal Orzel <michal.orzel@arm.com>
Date:   Wed May 5 09:43:07 2021 +0200

    arm/time,vtimer: Get rid of READ/WRITE_SYSREG32
    
    AArch64 registers are 64bit whereas AArch32 registers
    are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
    we should get rid of helpers READ/WRITE_SYSREG32
    in favour of using READ/WRITE_SYSREG.
    We should also use register_t type when reading sysregs
    which can correspond to uint64_t or uint32_t.
    Even though many AArch64 registers have upper 32bit reserved
    it does not mean that they can't be widen in the future.
    
    Modify type of vtimer structure's member: ctl to register_t.
    
    Add macro CNTFRQ_MASK containing mask for timer clock frequency
    field of CNTFRQ_EL0 register.
    
    Modify CNTx_CTL_* macros to return unsigned long instead of
    unsigned int as ctl is now of type register_t.
    
    Signed-off-by: Michal Orzel <michal.orzel@arm.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit 86faae561cd8eee819e0f42ba7a18dd180aa49d1
Author: Michal Orzel <michal.orzel@arm.com>
Date:   Wed May 5 09:43:06 2021 +0200

    arm/page: Get rid of READ/WRITE_SYSREG32
    
    AArch64 registers are 64bit whereas AArch32 registers
    are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
    we should get rid of helpers READ/WRITE_SYSREG32
    in favour of using READ/WRITE_SYSREG.
    We should also use register_t type when reading sysregs
    which can correspond to uint64_t or uint32_t.
    Even though many AArch64 registers have upper 32bit reserved
    it does not mean that they can't be widen in the future.
    
    Modify accesses to CTR_EL0 to use READ/WRITE_SYSREG.
    
    Signed-off-by: Michal Orzel <michal.orzel@arm.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>

commit 25e5d0c412e0d7420f2aa7fdd71cc39d8ed6c528
Author: Michal Orzel <michal.orzel@arm.com>
Date:   Wed May 5 09:43:05 2021 +0200

    xen/arm: Always access SCTLR_EL2 using READ/WRITE_SYSREG()
    
    The Armv8 specification describes the system register as a 64-bit value
    on AArch64 and 32-bit value on AArch32 (same as ARMv7).
    
    Unfortunately, Xen is accessing the system registers using
    READ/WRITE_SYSREG32() which means the top 32-bit are clobbered.
    
    This is only a latent bug so far because Xen will not yet use the top
    32-bit.
    
    There is also no change in behavior because arch/arm/arm64/head.S will
    initialize SCTLR_EL2 to a sane value with the top 32-bit zeroed.
    
    Signed-off-by: Michal Orzel <michal.orzel@arm.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit 8eb7cc0465fa228064e807aad51eb7428d6d3199
Author: Michal Orzel <michal.orzel@arm.com>
Date:   Wed May 5 09:43:04 2021 +0200

    arm/p2m: Get rid of READ/WRITE_SYSREG32
    
    AArch64 registers are 64bit whereas AArch32 registers
    are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
    we should get rid of helpers READ/WRITE_SYSREG32
    in favour of using READ/WRITE_SYSREG.
    We should also use register_t type when reading sysregs
    which can correspond to uint64_t or uint32_t.
    Even though many AArch64 registers have upper 32bit reserved
    it does not mean that they can't be widen in the future.
    
    Modify type of vtcr to register_t.
    
    Signed-off-by: Michal Orzel <michal.orzel@arm.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>

commit 78e67c99eb3f90c22c8c6ee282ec3a43d2ddccb5
Author: Michal Orzel <michal.orzel@arm.com>
Date:   Wed May 5 09:43:03 2021 +0200

    arm/gic: Get rid of READ/WRITE_SYSREG32
    
    AArch64 registers are 64bit whereas AArch32 registers
    are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
    we should get rid of helpers READ/WRITE_SYSREG32
    in favour of using READ/WRITE_SYSREG.
    We should also use register_t type when reading sysregs
    which can correspond to uint64_t or uint32_t.
    Even though many AArch64 registers have upper 32bit reserved
    it does not mean that they can't be widen in the future.
    
    Modify types of following members of struct gic_v3 to register_t:
    -vmcr
    -sre_el1
    -apr0
    -apr1
    
    Add new macro GICC_IAR_INTID_MASK containing the mask
    for INTID field of ICC_IAR0/1_EL1 register as only the first 23-bits
    of IAR contains the interrupt number. The rest are RES0.
    Therefore, take the opportunity to mask the bits [23:31] as
    they should be used for an IRQ number (we don't know how the top bits
    will be used).
    
    Signed-off-by: Michal Orzel <michal.orzel@arm.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit d55afb1acaffc6047af3cabc3ef4442f313bee2c
Author: Michal Orzel <michal.orzel@arm.com>
Date:   Wed May 5 09:43:02 2021 +0200

    arm/gic: Remove member hcr of structure gic_v3
    
    ... as it is never used even in the patch introducing it.
    
    Signed-off-by: Michal Orzel <michal.orzel@arm.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit b80470c84553808fef3a6803000ceee8a100e63c
Author: Michal Orzel <michal.orzel@arm.com>
Date:   Wed May 5 09:43:01 2021 +0200

    arm: Modify type of actlr to register_t
    
    AArch64 registers are 64bit whereas AArch32 registers
    are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
    we should get rid of helpers READ/WRITE_SYSREG32
    in favour of using READ/WRITE_SYSREG.
    We should also use register_t type when reading sysregs
    which can correspond to uint64_t or uint32_t.
    Even though many AArch64 registers have upper 32bit reserved
    it does not mean that they can't be widen in the future.
    
    ACTLR_EL1 system register bits are implementation defined
    which means it is possibly a latent bug on current HW as the CPU
    implementer may already have decided to use the top 32bit.
    
    Signed-off-by: Michal Orzel <michal.orzel@arm.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>

commit 3fd8336bc599788e5a52a7e63e833b6f03d79fd5
Author: Michal Orzel <michal.orzel@arm.com>
Date:   Wed May 5 09:43:00 2021 +0200

    arm/domain: Get rid of READ/WRITE_SYSREG32
    
    AArch64 registers are 64bit whereas AArch32 registers
    are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
    we should get rid of helpers READ/WRITE_SYSREG32
    in favour of using READ/WRITE_SYSREG.
    We should also use register_t type when reading sysregs
    which can correspond to uint64_t or uint32_t.
    Even though many AArch64 registers have upper 32bit reserved
    it does not mean that they can't be widen in the future.
    
    Modify type of register cntkctl to register_t.
    
    Thumbee registers are only usable by a 32-bit domain and therefore
    we can just store the bottom 32-bit (IOW there is no type change).
    In fact, this could technically be restricted to Armv7 HW (the
    support was dropped retrospectively in Armv8) but leave it as-is
    for now.
    
    Signed-off-by: Michal Orzel <michal.orzel@arm.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>

commit 8990f0eaca139364091109389416455f4f78cd65
Author: Michal Orzel <michal.orzel@arm.com>
Date:   Wed May 5 09:42:59 2021 +0200

    arm64/vfp: Get rid of READ/WRITE_SYSREG32
    
    AArch64 registers are 64bit whereas AArch32 registers
    are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
    we should get rid of helpers READ/WRITE_SYSREG32
    in favour of using READ/WRITE_SYSREG.
    We should also use register_t type when reading sysregs
    which can correspond to uint64_t or uint32_t.
    Even though many AArch64 registers have upper 32bit reserved
    it does not mean that they can't be widen in the future.
    
    Modify type of FPCR, FPSR, FPEXC32_EL2 to register_t.
    
    Signed-off-by: Michal Orzel <michal.orzel@arm.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>
(qemu changes not included)

