Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCA968EE5C
	for <lists+xen-devel@lfdr.de>; Wed,  8 Feb 2023 12:58:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491700.760953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPj4P-0003Me-Ck; Wed, 08 Feb 2023 11:57:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491700.760953; Wed, 08 Feb 2023 11:57:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPj4P-0003K0-9J; Wed, 08 Feb 2023 11:57:01 +0000
Received: by outflank-mailman (input) for mailman id 491700;
 Wed, 08 Feb 2023 11:56:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pPj4N-0003Jo-2h; Wed, 08 Feb 2023 11:56:59 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pPj4N-0000iQ-1D; Wed, 08 Feb 2023 11:56:59 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pPj4M-0001QE-Fe; Wed, 08 Feb 2023 11:56:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pPj4M-0001zB-F6; Wed, 08 Feb 2023 11:56:58 +0000
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
	bh=g726fAPK2Qq3C/TjQL2K/jPMldEWIVQ++njzKPZLggA=; b=yR8jS9aGAZdpFZR+E4yvisA4aa
	D3tjIRAQ9RW0bgUe65pliNcm8zu51o2W2VZCtoeasOo3ohuH+IktnQRgkfKUIXwMzjbUkcvDszshz
	fwzliO9HRotRZlQLvLKyTuZVciVUbLbH+lXw8ON6KdCw2U3zi+4lI+vUpr78Vp2OBmTc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-176458-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.16-testing test] 176458: tolerable trouble: fail/pass/starved - PUSHED
X-Osstest-Failures:
    xen-4.16-testing:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:build-armhf-libvirt:build-check(1):starved:nonblocking
    xen-4.16-testing:test-armhf-armhf-libvirt:build-check(1):starved:nonblocking
    xen-4.16-testing:test-armhf-armhf-libvirt-qcow2:build-check(1):starved:nonblocking
    xen-4.16-testing:test-armhf-armhf-libvirt-raw:build-check(1):starved:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl:build-check(1):starved:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-credit1:build-check(1):starved:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-credit2:build-check(1):starved:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-cubietruck:build-check(1):starved:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-multivcpu:build-check(1):starved:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-rtds:build-check(1):starved:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-vhd:build-check(1):starved:nonblocking
    xen-4.16-testing:build-armhf:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    xen=6e081438bf8ef616d0123aab7a743476d8114ef6
X-Osstest-Versions-That:
    xen=65bf12135f618614bbf44626fba1c20ca8d1a127
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 08 Feb 2023 11:56:58 +0000

flight 176458 xen-4.16-testing real [real]
http://logs.test-lab.xenproject.org/osstest/logs/176458/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 175454
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 175454
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 175454
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 175454
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 175454
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 175454
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 175454
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 175454
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 175454
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 build-armhf-libvirt           1 build-check(1)               starved  n/a
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
 xen                  6e081438bf8ef616d0123aab7a743476d8114ef6
baseline version:
 xen                  65bf12135f618614bbf44626fba1c20ca8d1a127

Last test of basis   175454  2022-12-22 09:46:50 Z   48 days
Testing same since   176458  2023-02-07 16:39:55 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Ayan Kumar Halder <ayan.kumar.halder@amd.com>
  Jan Beulich <jbeulich@suse.com>
  Jason Andryuk <jandryuk@gmail.com>

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
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  starved 
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  starved 
 test-armhf-armhf-xl-cubietruck                               starved 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
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
 test-amd64-i386-libvirt-pair                                 pass    
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


Pushing revision :

To xenbits.xen.org:/home/xen/git/xen.git
   65bf12135f..6e081438bf  6e081438bf8ef616d0123aab7a743476d8114ef6 -> stable-4.16

