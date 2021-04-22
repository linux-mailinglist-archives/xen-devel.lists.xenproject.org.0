Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB13B3686BE
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 20:46:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115791.220955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZeKs-0007aJ-NL; Thu, 22 Apr 2021 18:45:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115791.220955; Thu, 22 Apr 2021 18:45:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZeKs-0007Zt-J7; Thu, 22 Apr 2021 18:45:58 +0000
Received: by outflank-mailman (input) for mailman id 115791;
 Thu, 22 Apr 2021 18:45:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lZeKr-0007Zl-Eu; Thu, 22 Apr 2021 18:45:57 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lZeKr-0004Sa-8z; Thu, 22 Apr 2021 18:45:57 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lZeKr-0007Gs-0C; Thu, 22 Apr 2021 18:45:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lZeKq-0004HF-Vy; Thu, 22 Apr 2021 18:45:56 +0000
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
	bh=nblyyW8QvRhi0LBjPHvFSOphniIixJ0dBn3z9Y5H1tU=; b=6v5fdTR5o3VXnlbdDQwhnFwwQ+
	gxwRC36K8UHHaaC3sRdXLBq3WpqDoLIxfj0Y0HNhMxBJQI7Kk++3xENCSm+KXloruhz17VDLkSeKo
	CvKO9pkiHRMxjUhZKhjImwrs7+VSnSLjauyfOw4nBhqA3twij4cdv8kNZc49gDTP+XEw=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161364-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 161364: regressions - FAIL
X-Osstest-Failures:
    qemu-mainline:test-amd64-amd64-qemuu-freebsd11-amd64:guest-saverestore:fail:regression
    qemu-mainline:test-amd64-i386-libvirt:guest-start:fail:regression
    qemu-mainline:test-amd64-amd64-libvirt:guest-start:fail:regression
    qemu-mainline:test-amd64-i386-libvirt-xsm:guest-start:fail:regression
    qemu-mainline:test-amd64-amd64-qemuu-freebsd12-amd64:guest-saverestore:fail:regression
    qemu-mainline:test-amd64-amd64-libvirt-xsm:guest-start:fail:regression
    qemu-mainline:test-amd64-i386-freebsd10-i386:guest-saverestore:fail:regression
    qemu-mainline:test-amd64-i386-freebsd10-amd64:guest-saverestore:fail:regression
    qemu-mainline:test-amd64-amd64-libvirt-pair:guest-start/debian:fail:regression
    qemu-mainline:test-amd64-i386-libvirt-pair:guest-start/debian:fail:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-amd64:guest-saverestore:fail:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:guest-saverestore:fail:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:guest-saverestore:fail:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-ovmf-amd64:guest-saverestore:fail:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64:guest-saverestore:fail:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:guest-saverestore:fail:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:guest-saverestore:fail:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-ovmf-amd64:guest-saverestore:fail:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:guest-saverestore:fail:regression
    qemu-mainline:test-amd64-amd64-qemuu-nested-intel:debian-hvm-install/l1/l2:fail:regression
    qemu-mainline:test-armhf-armhf-libvirt:guest-start:fail:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:guest-saverestore:fail:regression
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
    qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:guest-saverestore:fail:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-saverestore:fail:regression
    qemu-mainline:build-arm64-pvops:kernel-build:fail:regression
    qemu-mainline:test-armhf-armhf-xl-rtds:guest-start:fail:allowable
    qemu-mainline:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl-seattle:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    qemuu=b1cffefa1b163bce9aebc3416f562c1d3886eeaa
X-Osstest-Versions-That:
    qemuu=1d806cef0e38b5db8347a8e12f214d543204a314
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 22 Apr 2021 18:45:56 +0000

flight 161364 qemu-mainline real [real]
http://logs.test-lab.xenproject.org/osstest/logs/161364/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-qemuu-freebsd11-amd64 16 guest-saverestore fail REGR. vs. 152631
 test-amd64-i386-libvirt      14 guest-start              fail REGR. vs. 152631
 test-amd64-amd64-libvirt     14 guest-start              fail REGR. vs. 152631
 test-amd64-i386-libvirt-xsm  14 guest-start              fail REGR. vs. 152631
 test-amd64-amd64-qemuu-freebsd12-amd64 16 guest-saverestore fail REGR. vs. 152631
 test-amd64-amd64-libvirt-xsm 14 guest-start              fail REGR. vs. 152631
 test-amd64-i386-freebsd10-i386 16 guest-saverestore      fail REGR. vs. 152631
 test-amd64-i386-freebsd10-amd64 16 guest-saverestore     fail REGR. vs. 152631
 test-amd64-amd64-libvirt-pair 25 guest-start/debian      fail REGR. vs. 152631
 test-amd64-i386-libvirt-pair 25 guest-start/debian       fail REGR. vs. 152631
 test-amd64-i386-xl-qemuu-debianhvm-amd64 15 guest-saverestore fail REGR. vs. 152631
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow 15 guest-saverestore fail REGR. vs. 152631
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 15 guest-saverestore fail REGR. vs. 152631
 test-amd64-i386-xl-qemuu-ovmf-amd64 15 guest-saverestore fail REGR. vs. 152631
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 15 guest-saverestore fail REGR. vs. 152631
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 15 guest-saverestore fail REGR. vs. 152631
 test-amd64-amd64-xl-qemuu-win7-amd64 15 guest-saverestore fail REGR. vs. 152631
 test-amd64-amd64-xl-qemuu-ovmf-amd64 15 guest-saverestore fail REGR. vs. 152631
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 15 guest-saverestore fail REGR. vs. 152631
 test-amd64-amd64-qemuu-nested-intel 20 debian-hvm-install/l1/l2 fail REGR. vs. 152631
 test-armhf-armhf-libvirt     14 guest-start              fail REGR. vs. 152631
 test-amd64-i386-xl-qemuu-win7-amd64 15 guest-saverestore fail REGR. vs. 152631
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 12 debian-hvm-install fail REGR. vs. 152631
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 12 debian-hvm-install fail REGR. vs. 152631
 test-amd64-i386-xl-qemuu-ws16-amd64 15 guest-saverestore fail REGR. vs. 152631
 test-amd64-amd64-xl-qemuu-ws16-amd64 15 guest-saverestore fail REGR. vs. 152631
 build-arm64-pvops             6 kernel-build             fail REGR. vs. 152631

Regressions which are regarded as allowable (not blocking):
 test-armhf-armhf-xl-rtds     14 guest-start              fail REGR. vs. 152631

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-seattle   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 152631
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 152631
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 qemuu                b1cffefa1b163bce9aebc3416f562c1d3886eeaa
baseline version:
 qemuu                1d806cef0e38b5db8347a8e12f214d543204a314

Last test of basis   152631  2020-08-20 09:07:46 Z  245 days
Failing since        152659  2020-08-21 14:07:39 Z  244 days  450 attempts
Testing same since   161364  2021-04-21 23:21:43 Z    0 days    1 attempts

------------------------------------------------------------
478 people touched revisions under test,
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
 build-arm64-pvops                                            fail    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          blocked 
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           fail    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            fail    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 fail    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  fail    
 test-amd64-amd64-libvirt-xsm                                 fail    
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-amd64-i386-libvirt-xsm                                  fail    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      blocked 
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    fail    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     fail    
 test-amd64-i386-freebsd10-amd64                              fail    
 test-amd64-amd64-qemuu-freebsd11-amd64                       fail    
 test-amd64-amd64-qemuu-freebsd12-amd64                       fail    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         fail    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
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
 test-amd64-i386-freebsd10-i386                               fail    
 test-amd64-amd64-qemuu-nested-intel                          fail    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     fail    
 test-armhf-armhf-libvirt                                     fail    
 test-amd64-i386-libvirt                                      fail    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                fail    
 test-amd64-i386-libvirt-pair                                 fail    
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
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             fail    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              fail    
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


Not pushing.

(No revision log; it would be 142972 lines long.)

