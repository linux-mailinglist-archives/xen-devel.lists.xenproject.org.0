Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74482314F8D
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 13:56:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83223.154344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9SZJ-00080r-R4; Tue, 09 Feb 2021 12:56:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83223.154344; Tue, 09 Feb 2021 12:56:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9SZJ-00080R-Mp; Tue, 09 Feb 2021 12:56:37 +0000
Received: by outflank-mailman (input) for mailman id 83223;
 Tue, 09 Feb 2021 12:56:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l9SZI-00080E-Q4; Tue, 09 Feb 2021 12:56:36 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l9SZI-0006dR-KR; Tue, 09 Feb 2021 12:56:36 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l9SZI-0001kB-9f; Tue, 09 Feb 2021 12:56:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l9SZI-0006y2-9B; Tue, 09 Feb 2021 12:56:36 +0000
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
	bh=blrZzqRxOiG3EVQmzEaPCwQ1IBLTJMb4ma3DnB9G2WE=; b=D1wuCbb4jJkbWQCbmawSB00dZH
	QRZ5kR2+Fbwzy5mvo8P5RZe/jAt61vJS2G2hCbmaGKKIsBnzYfYU+vEoVdonI7pp+jy2Wl0FP3k1E
	kSIlVYmuyRpHkt4C0SGa0Yvy2J7lB4oBqNOnD8NgsRMtBTA2VxygWO9yEKRhQVP6JmxA=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159129-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 159129: regressions - FAIL
X-Osstest-Failures:
    linux-5.4:test-arm64-arm64-xl:guest-start:fail:regression
    linux-5.4:test-amd64-amd64-xl-shadow:guest-start:fail:regression
    linux-5.4:test-arm64-arm64-xl-credit1:guest-start:fail:regression
    linux-5.4:test-arm64-arm64-xl-seattle:guest-start:fail:regression
    linux-5.4:test-arm64-arm64-xl-credit2:guest-start:fail:regression
    linux-5.4:test-arm64-arm64-xl-xsm:guest-start:fail:regression
    linux-5.4:test-arm64-arm64-libvirt-xsm:guest-start:fail:regression
    linux-5.4:test-armhf-armhf-xl-credit2:guest-start:fail:regression
    linux-5.4:test-arm64-arm64-xl-thunderx:guest-start:fail:regression
    linux-5.4:test-armhf-armhf-xl-credit1:guest-start:fail:regression
    linux-5.4:test-armhf-armhf-xl-multivcpu:guest-start:fail:regression
    linux-5.4:test-armhf-armhf-libvirt:guest-start:fail:regression
    linux-5.4:test-armhf-armhf-xl-cubietruck:guest-start:fail:regression
    linux-5.4:test-armhf-armhf-xl:guest-start:fail:regression
    linux-5.4:test-armhf-armhf-xl-arndale:guest-start:fail:regression
    linux-5.4:test-armhf-armhf-xl-vhd:debian-di-install:fail:regression
    linux-5.4:test-armhf-armhf-libvirt-raw:debian-di-install:fail:regression
    linux-5.4:test-armhf-armhf-xl-rtds:guest-start:fail:allowable
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=d4716ee8751bf8dabf5872ba008124a0979a5f94
X-Osstest-Versions-That:
    linux=a829146c3fdcf6d0b76d9c54556a223820f1f73b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 09 Feb 2021 12:56:36 +0000

flight 159129 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/159129/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-arm64-arm64-xl          14 guest-start              fail REGR. vs. 158387
 test-amd64-amd64-xl-shadow   14 guest-start              fail REGR. vs. 158387
 test-arm64-arm64-xl-credit1  14 guest-start              fail REGR. vs. 158387
 test-arm64-arm64-xl-seattle  14 guest-start              fail REGR. vs. 158387
 test-arm64-arm64-xl-credit2  14 guest-start              fail REGR. vs. 158387
 test-arm64-arm64-xl-xsm      14 guest-start              fail REGR. vs. 158387
 test-arm64-arm64-libvirt-xsm 14 guest-start              fail REGR. vs. 158387
 test-armhf-armhf-xl-credit2  14 guest-start              fail REGR. vs. 158387
 test-arm64-arm64-xl-thunderx 14 guest-start              fail REGR. vs. 158387
 test-armhf-armhf-xl-credit1  14 guest-start              fail REGR. vs. 158387
 test-armhf-armhf-xl-multivcpu 14 guest-start             fail REGR. vs. 158387
 test-armhf-armhf-libvirt     14 guest-start              fail REGR. vs. 158387
 test-armhf-armhf-xl-cubietruck 14 guest-start            fail REGR. vs. 158387
 test-armhf-armhf-xl          14 guest-start              fail REGR. vs. 158387
 test-armhf-armhf-xl-arndale  14 guest-start              fail REGR. vs. 158387
 test-armhf-armhf-xl-vhd      12 debian-di-install        fail REGR. vs. 158387
 test-armhf-armhf-libvirt-raw 12 debian-di-install        fail REGR. vs. 158387

Regressions which are regarded as allowable (not blocking):
 test-armhf-armhf-xl-rtds     14 guest-start              fail REGR. vs. 158387

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 158387
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 158387
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 158387
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 158387
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 158387
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 158387
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 158387
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 158387
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 158387
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass

version targeted for testing:
 linux                d4716ee8751bf8dabf5872ba008124a0979a5f94
baseline version:
 linux                a829146c3fdcf6d0b76d9c54556a223820f1f73b

Last test of basis   158387  2021-01-12 19:40:06 Z   27 days
Failing since        158473  2021-01-17 13:42:20 Z   22 days   34 attempts
Testing same since   159129  2021-02-08 10:46:56 Z    1 days    1 attempts

------------------------------------------------------------
377 people touched revisions under test,
not listing them all

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          fail    
 test-armhf-armhf-xl                                          fail    
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
 test-arm64-arm64-libvirt-xsm                                 fail    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      fail    
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
 test-armhf-armhf-xl-arndale                                  fail    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  fail    
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  fail    
 test-armhf-armhf-xl-credit2                                  fail    
 test-armhf-armhf-xl-cubietruck                               fail    
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
 test-armhf-armhf-libvirt                                     fail    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                fail    
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
 test-armhf-armhf-libvirt-raw                                 fail    
 test-amd64-i386-xl-raw                                       pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   fail    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 fail    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-xl-vhd                                      fail    


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

(No revision log; it would be 11411 lines long.)

