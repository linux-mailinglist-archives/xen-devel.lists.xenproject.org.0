Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CC0573C40
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jul 2022 19:54:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.366940.597912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBgYX-0008Lk-J2; Wed, 13 Jul 2022 17:53:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 366940.597912; Wed, 13 Jul 2022 17:53:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBgYX-0008IX-F5; Wed, 13 Jul 2022 17:53:49 +0000
Received: by outflank-mailman (input) for mailman id 366940;
 Wed, 13 Jul 2022 17:53:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oBgYW-0008IN-C6; Wed, 13 Jul 2022 17:53:48 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oBgYW-0000we-5p; Wed, 13 Jul 2022 17:53:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oBgYV-0007Kk-II; Wed, 13 Jul 2022 17:53:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oBgYV-0002Ua-HZ; Wed, 13 Jul 2022 17:53:47 +0000
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
	bh=FQAaEpurcYq5jZCbkDAHTAST7N13V0n+5TuHhmcgXwY=; b=ndF0D3QtSe4Do7dlp180NXC8gc
	f1b/DZhC01xbAb6c/6nuzNpmnSFgOAWDHosE606bP1ZSepxEkEIZiTPh698D4laVqVef3qQ+aAJCQ
	dc0Ur8rpdZeL2obO4yhboUQUzJd2DIRyIq5fbvHuZBK1+36Xau1HUjUFME/72+zJ9upM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171608-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.16-testing test] 171608: regressions - FAIL
X-Osstest-Failures:
    xen-4.16-testing:build-arm64:xen-build:fail:regression
    xen-4.16-testing:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    xen-4.16-testing:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-seattle:build-check(1):blocked:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-vhd:build-check(1):blocked:nonblocking
    xen-4.16-testing:build-arm64-libvirt:build-check(1):blocked:nonblocking
    xen-4.16-testing:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-4.16-testing:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=0a5387a01165b46c8c85e7f7e2ddbe60a7f5db44
X-Osstest-Versions-That:
    xen=744accad1b73223b3261e3e678e16e030d83b179
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 13 Jul 2022 17:53:47 +0000

flight 171608 xen-4.16-testing real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171608/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64                   6 xen-build                fail REGR. vs. 171595

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-seattle   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-vhd       1 build-check(1)               blocked  n/a
 build-arm64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 171595
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 171595
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 171595
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 171595
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 171595
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 171595
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 171595
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 171595
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 171595
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 171595
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 171595
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 171595
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass

version targeted for testing:
 xen                  0a5387a01165b46c8c85e7f7e2ddbe60a7f5db44
baseline version:
 xen                  744accad1b73223b3261e3e678e16e030d83b179

Last test of basis   171595  2022-07-12 09:37:57 Z    1 days
Testing same since   171608  2022-07-12 23:09:33 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-arm64                                                  fail    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          blocked 
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


Not pushing.

------------------------------------------------------------
commit 0a5387a01165b46c8c85e7f7e2ddbe60a7f5db44
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Jun 27 19:29:40 2022 +0100

    x86/spec-ctrl: Mitigate Branch Type Confusion when possible
    
    Branch Type Confusion affects AMD/Hygon CPUs on Zen2 and earlier.  To
    mitigate, we require SMT safety (STIBP on Zen2, no-SMT on Zen1), and to issue
    an IBPB on each entry to Xen, to flush the BTB.
    
    Due to performance concerns, dom0 (which is trusted in most configurations) is
    excluded from protections by default.
    
    Therefore:
     * Use STIBP by default on Zen2 too, which now means we want it on by default
       on all hardware supporting STIBP.
     * Break the current IBPB logic out into a new function, extending it with
       IBPB-at-entry logic.
     * Change the existing IBPB-at-ctxt-switch boolean to be tristate, and disable
       it by default when IBPB-at-entry is providing sufficient safety.
    
    If all PV guests on the system are trusted, then it is recommended to boot
    with `spec-ctrl=ibpb-entry=no-pv`, as this will provide an additional marginal
    perf improvement.
    
    This is part of XSA-407 / CVE-2022-23825.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    (cherry picked from commit d8cb7e0f069e0f106d24941355b59b45a731eabe)

commit 5457a6870eb1369b868f7b8e833966ed43a773ad
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Mar 15 18:30:25 2022 +0000

    x86/spec-ctrl: Enable Zen2 chickenbit
    
    ... as instructed in the Branch Type Confusion whitepaper.
    
    This is part of XSA-407.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    (cherry picked from commit 9deaf2d932f08c16c6b96a1c426e4b1142c0cdbe)

commit 0826c7596d35c887b3b7858137c7ac374d9ef17a
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon May 16 15:48:24 2022 +0100

    x86/cpuid: Enumeration for BTC_NO
    
    BTC_NO indicates that hardware is not succeptable to Branch Type Confusion.
    
    Zen3 CPUs don't suffer BTC.
    
    This is part of XSA-407.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    (cherry picked from commit 76cb04ad64f3ab9ae785988c40655a71dde9c319)

commit 76c5fcee9027fb8823dd501086f0ff3ee3c4231c
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu Feb 24 13:44:33 2022 +0000

    x86/spec-ctrl: Support IBPB-on-entry
    
    We are going to need this to mitigate Branch Type Confusion on AMD/Hygon CPUs,
    but as we've talked about using it in other cases too, arrange to support it
    generally.  However, this is also very expensive in some cases, so we're going
    to want per-domain controls.
    
    Introduce SCF_ist_ibpb and SCF_entry_ibpb controls, adding them to the IST and
    DOM masks as appropriate.  Also introduce X86_FEATURE_IBPB_ENTRY_{PV,HVM} to
    to patch the code blocks.
    
    For SVM, the STGI is serialising enough to protect against Spectre-v1 attacks,
    so no "else lfence" is necessary.  VT-x will use use the MSR host load list,
    so doesn't need any code in the VMExit path.
    
    For the IST path, we can't safely check CPL==0 to skip a flush, as we might
    have hit an entry path before it's IBPB.  As IST hitting Xen is rare, flush
    irrespective of CPL.  A later path, SCF_ist_sc_msr, provides Spectre-v1
    safety.
    
    For the PV paths, we know we're interrupting CPL>0, while for the INTR paths,
    we can safely check CPL==0.  Only flush when interrupting guest context.
    
    An "else lfence" is needed for safety, but we want to be able to skip it on
    unaffected CPUs, so the block wants to be an alternative, which means the
    lfence has to be inline rather than UNLIKELY() (the replacement block doesn't
    have displacements fixed up for anything other than the first instruction).
    
    As with SPEC_CTRL_ENTRY_FROM_INTR_IST, %rdx is 0 on entry so rely on this to
    shrink the logic marginally.  Update the comments to specify this new
    dependency.
    
    This is part of XSA-407.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    (cherry picked from commit 53a570b285694947776d5190f591a0d5b9b18de7)

commit 2a9e690a0ad5d54dca4166e089089a07bbe7fc85
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Jul 1 15:59:40 2022 +0100

    x86/spec-ctrl: Rework SPEC_CTRL_ENTRY_FROM_INTR_IST
    
    We are shortly going to add a conditional IBPB in this path.
    
    Therefore, we cannot hold spec_ctrl_flags in %eax, and rely on only clobbering
    it after we're done with its contents.  %rbx is available for use, and the
    more normal register to hold preserved information in.
    
    With %rax freed up, use it instead of %rdx for the RSB tmp register, and for
    the adjustment to spec_ctrl_flags.
    
    This leaves no use of %rdx, except as 0 for the upper half of WRMSR.  In
    practice, %rdx is 0 from SAVE_ALL on all paths and isn't likely to change in
    the foreseeable future, so update the macro entry requirements to state this
    dependency.  This marginal optimisation can be revisited if circumstances
    change.
    
    No practical change.
    
    This is part of XSA-407.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    (cherry picked from commit e9b8d31981f184c6539f91ec54bd9cae29cdae36)

commit e7671561c84322860875745e57b228a7a310f2bf
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Jul 4 21:32:17 2022 +0100

    x86/spec-ctrl: Rename opt_ibpb to opt_ibpb_ctxt_switch
    
    We are about to introduce the use of IBPB at different points in Xen, making
    opt_ibpb ambiguous.  Rename it to opt_ibpb_ctxt_switch.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    (cherry picked from commit a8e5ef079d6f5c88c472e3e620db5a8d1402a50d)

commit 31aa2a20bfefc3a8a200da54a56471bf99f9630e
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Jun 28 14:36:56 2022 +0100

    x86/spec-ctrl: Rename SCF_ist_wrmsr to SCF_ist_sc_msr
    
    We are about to introduce SCF_ist_ibpb, at which point SCF_ist_wrmsr becomes
    ambiguous.
    
    No functional change.
    
    This is part of XSA-407.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    (cherry picked from commit 76d6a36f645dfdbad8830559d4d52caf36efc75e)

commit 3a280cbae7022b83af91c27a8e2211ba3b1234f5
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Jul 1 15:59:40 2022 +0100

    x86/spec-ctrl: Rework spec_ctrl_flags context switching
    
    We are shortly going to need to context switch new bits in both the vcpu and
    S3 paths.  Introduce SCF_IST_MASK and SCF_DOM_MASK, and rework d->arch.verw
    into d->arch.spec_ctrl_flags to accommodate.
    
    No functional change.
    
    This is part of XSA-407.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    (cherry picked from commit 5796912f7279d9348a3166655588d30eae9f72cc)
(qemu changes not included)

