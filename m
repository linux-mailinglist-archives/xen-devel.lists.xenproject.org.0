Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 735FF9A2496
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 16:11:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820643.1234178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1RCl-0007Kc-1S; Thu, 17 Oct 2024 14:10:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820643.1234178; Thu, 17 Oct 2024 14:10:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1RCk-0007IB-TC; Thu, 17 Oct 2024 14:10:18 +0000
Received: by outflank-mailman (input) for mailman id 820643;
 Thu, 17 Oct 2024 14:10:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t1RCj-0007I1-RE; Thu, 17 Oct 2024 14:10:17 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t1RCj-0003sP-NK; Thu, 17 Oct 2024 14:10:17 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t1RCj-0007fI-AH; Thu, 17 Oct 2024 14:10:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1t1RCj-0000s8-9t; Thu, 17 Oct 2024 14:10:17 +0000
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
	bh=ngGK31vjmvRVkB76YImEKUSoAmoXJ+6FAB2pZFnMcT0=; b=g2CEEpAnGwsTIMh9rv5/za/AK4
	ZpmF/3aJ6eSpvOKGWEX1ROFrg3bEYbBYbzpOEtpwx5k6rMYbmjYtoiDAEL0N/A5SzsdERbVHIaP/e
	K4IWFE8NypVFPrSzzgYhcCntqQZaO6th1WF6Ya8xggbAY2wvvPsI0jrLvSAFIURBSSV0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-188153-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 188153: regressions - FAIL
X-Osstest-Failures:
    xen-unstable:build-amd64-libvirt:libvirt-build:fail:regression
    xen-unstable:build-arm64:xen-build:fail:regression
    xen-unstable:build-amd64-xsm:xen-build:fail:regression
    xen-unstable:build-arm64-xsm:xen-build:fail:regression
    xen-unstable:build-armhf:xen-build:fail:regression
    xen-unstable:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    xen-unstable:build-arm64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable:build-armhf-libvirt:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-pair:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qcow2:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-raw:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-xl-xsm:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-examine:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:build-check(1):blocked:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-examine:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-vhd:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-qcow2:build-check(1):blocked:nonblocking
    xen-unstable:test-armhf-armhf-xl-raw:build-check(1):blocked:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
X-Osstest-Versions-This:
    xen=47990ecef286606794d607d4ca8703d71c98d659
X-Osstest-Versions-That:
    xen=47990ecef286606794d607d4ca8703d71c98d659
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 17 Oct 2024 14:10:17 +0000

flight 188153 xen-unstable real [real]
http://logs.test-lab.xenproject.org/osstest/logs/188153/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64-libvirt           6 libvirt-build            fail REGR. vs. 188128
 build-arm64                   6 xen-build                fail REGR. vs. 188128
 build-amd64-xsm               6 xen-build                fail REGR. vs. 188128
 build-arm64-xsm               6 xen-build                fail REGR. vs. 188128
 build-armhf                   6 xen-build                fail REGR. vs. 188128

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm  1 build-check(1)     blocked n/a
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm  1 build-check(1)     blocked n/a
 build-arm64-libvirt           1 build-check(1)               blocked  n/a
 build-armhf-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-qcow2  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-amd64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-vhd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-rtds      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-xsm       1 build-check(1)               blocked  n/a
 test-arm64-arm64-examine      1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-vhd       1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-armhf-armhf-examine      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-vhd  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-arndale   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit1   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit2   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-multivcpu  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-qcow2     1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-raw       1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 188128
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 188128
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 188128
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 188128
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 188128

version targeted for testing:
 xen                  47990ecef286606794d607d4ca8703d71c98d659
baseline version:
 xen                  47990ecef286606794d607d4ca8703d71c98d659

Last test of basis   188153  2024-10-17 07:28:21 Z    0 days
Testing same since                          (not found)         0 attempts

jobs:
 build-amd64-xsm                                              fail    
 build-arm64-xsm                                              fail    
 build-i386-xsm                                               pass    
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-arm64                                                  fail    
 build-armhf                                                  fail    
 build-i386                                                   pass    
 build-amd64-libvirt                                          fail    
 build-arm64-libvirt                                          blocked 
 build-armhf-libvirt                                          blocked 
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
 test-arm64-arm64-xl                                          blocked 
 test-armhf-armhf-xl                                          blocked 
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           blocked 
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        blocked 
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 blocked 
 test-amd64-amd64-libvirt-xsm                                 blocked 
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-amd64-amd64-xl-xsm                                      blocked 
 test-arm64-arm64-xl-xsm                                      blocked 
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-armhf-armhf-xl-arndale                                  blocked 
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  blocked 
 test-armhf-armhf-xl-credit1                                  blocked 
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  blocked 
 test-armhf-armhf-xl-credit2                                  blocked 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     blocked 
 test-armhf-armhf-examine                                     blocked 
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     blocked 
 test-armhf-armhf-libvirt                                     blocked 
 test-amd64-amd64-livepatch                                   pass    
 test-amd64-amd64-migrupgrade                                 pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                blocked 
 test-amd64-amd64-pair                                        pass    
 test-amd64-amd64-libvirt-pair                                blocked 
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-libvirt-qcow2                               blocked 
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-xl-qcow2                                    blocked 
 test-amd64-amd64-libvirt-raw                                 blocked 
 test-arm64-arm64-libvirt-raw                                 blocked 
 test-amd64-amd64-xl-raw                                      pass    
 test-armhf-armhf-xl-raw                                      blocked 
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 blocked 
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-libvirt-vhd                                 blocked 
 test-armhf-armhf-libvirt-vhd                                 blocked 
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      blocked 


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


Published tested tree is already up to date.


