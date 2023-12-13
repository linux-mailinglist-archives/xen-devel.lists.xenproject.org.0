Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6EC8114E2
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 15:40:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654056.1020688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDQP2-0006t4-DZ; Wed, 13 Dec 2023 14:40:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654056.1020688; Wed, 13 Dec 2023 14:40:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDQP2-0006pu-AF; Wed, 13 Dec 2023 14:40:00 +0000
Received: by outflank-mailman (input) for mailman id 654056;
 Wed, 13 Dec 2023 14:39:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rDQP1-0006pk-AY; Wed, 13 Dec 2023 14:39:59 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rDQP0-0002e0-V8; Wed, 13 Dec 2023 14:39:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rDQP0-0002yK-L3; Wed, 13 Dec 2023 14:39:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rDQP0-00068G-Kf; Wed, 13 Dec 2023 14:39:58 +0000
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
	bh=DzEJXmfOKgUBcyVjwS4TZKRwoJ0/+qFXU7azknnrkFM=; b=NrDa0HDvd1N/ofBoKoykneB4F2
	ScnAlOyApbwh81CHiFfOK9iVQSHJHHwcj2uJHnohudBKByg7mNWWAUqYPCFfj3wtDLmRGRme429kg
	NFdgiM/SeWz/g+RgGBUhTpZ3FHdzTy+Srpb8RY4J8ErKRV7M2sfiJIYSsEbSehVH9tUg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184109-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.17-testing test] 184109: tolerable trouble: fail/pass/starved - PUSHED
X-Osstest-Failures:
    xen-4.17-testing:test-amd64-i386-qemut-rhel6hvm-intel:guest-start/redhat.repeat:fail:heisenbug
    xen-4.17-testing:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.17-testing:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.17-testing:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-4.17-testing:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-4.17-testing:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-4.17-testing:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.17-testing:test-arm64-arm64-libvirt-xsm:hosts-allocate:starved:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-credit2:hosts-allocate:starved:nonblocking
    xen-4.17-testing:test-arm64-arm64-libvirt-raw:hosts-allocate:starved:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl:hosts-allocate:starved:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-credit1:hosts-allocate:starved:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-thunderx:hosts-allocate:starved:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-vhd:hosts-allocate:starved:nonblocking
    xen-4.17-testing:test-arm64-arm64-xl-xsm:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    xen=958706fd2e178ffe8e5597b05b694b494e24258b
X-Osstest-Versions-That:
    xen=6eb98dda5c91e68555684c57a2c9bd119ff082c1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 13 Dec 2023 14:39:58 +0000

flight 184109 xen-4.17-testing real [real]
flight 184124 xen-4.17-testing real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/184109/
http://logs.test-lab.xenproject.org/osstest/logs/184124/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-i386-qemut-rhel6hvm-intel 14 guest-start/redhat.repeat fail pass in 184124-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 184007
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 184007
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 184007
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 184007
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 184007
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 184007
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 184007
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 184007
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 184007
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 184007
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 184007
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 184007
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm  3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl-credit2   3 hosts-allocate               starved  n/a
 test-arm64-arm64-libvirt-raw  3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl           3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl-credit1   3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl-thunderx  3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl-vhd       3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl-xsm       3 hosts-allocate               starved  n/a

version targeted for testing:
 xen                  958706fd2e178ffe8e5597b05b694b494e24258b
baseline version:
 xen                  6eb98dda5c91e68555684c57a2c9bd119ff082c1

Last test of basis   184007  2023-12-06 10:07:12 Z    7 days
Testing same since   184109  2023-12-12 14:07:07 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  George Dunlap <george.dunlap@cloud.com>
  Henry Wang <Henry.Wang@arm.com>
  Jason Andryuk <jandryuk@gmail.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Michal Orzel <michal.orzel@amd.com>
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
 test-arm64-arm64-xl-credit1                                  starved 
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  starved 
 test-armhf-armhf-xl-credit2                                  pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         fail    
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
 test-amd64-amd64-libvirt-vhd                                 pass    
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


Pushing revision :

To xenbits.xen.org:/home/xen/git/xen.git
   6eb98dda5c..958706fd2e  958706fd2e178ffe8e5597b05b694b494e24258b -> stable-4.17

