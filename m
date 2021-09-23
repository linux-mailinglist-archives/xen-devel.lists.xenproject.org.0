Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1D641642E
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 19:14:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194524.346542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTSIp-0003Od-Mg; Thu, 23 Sep 2021 17:14:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194524.346542; Thu, 23 Sep 2021 17:14:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTSIp-0003LE-Hy; Thu, 23 Sep 2021 17:14:31 +0000
Received: by outflank-mailman (input) for mailman id 194524;
 Thu, 23 Sep 2021 17:14:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mTSIn-0003L4-Ol; Thu, 23 Sep 2021 17:14:29 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mTSIn-00057R-JU; Thu, 23 Sep 2021 17:14:29 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mTSIn-0007GX-6l; Thu, 23 Sep 2021 17:14:29 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mTSIn-0000qM-6G; Thu, 23 Sep 2021 17:14:29 +0000
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
	bh=9rwkIae5egJPcBMvrMn/u3CIGl0KXejc7SFy7oop6sA=; b=J4NKn9Jk3Eg+I/IgvV4OnB6ncd
	HG7W5coexuX3oIWbwgDjsswUlj+Z+kKrTVZ2oq6EZVQZHkajpWW8RakcotNg6QLE+a+8qnUUcwkzo
	XxTIxnS4i4hkBmME6QlIPeQxqDMUZMZ6xjaQksyF+X6z6YB0Cz5irUDMaD2dH9c2h/wU=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165163-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 165163: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-xl-pvshim:guest-saverestore:fail:regression
    linux-linus:test-amd64-amd64-dom0pvh-xl-amd:guest-saverestore:fail:regression
    linux-linus:test-amd64-amd64-xl-multivcpu:guest-saverestore:fail:regression
    linux-linus:test-amd64-amd64-dom0pvh-xl-intel:guest-saverestore:fail:regression
    linux-linus:test-amd64-amd64-xl-credit1:guest-saverestore:fail:regression
    linux-linus:test-amd64-amd64-xl-pvhv2-intel:guest-saverestore:fail:regression
    linux-linus:test-amd64-amd64-xl:guest-saverestore:fail:regression
    linux-linus:test-amd64-amd64-xl-shadow:guest-saverestore:fail:regression
    linux-linus:test-amd64-amd64-libvirt:guest-saverestore:fail:regression
    linux-linus:test-amd64-amd64-xl-credit2:guest-saverestore:fail:regression
    linux-linus:test-amd64-amd64-libvirt-xsm:guest-saverestore:fail:regression
    linux-linus:test-amd64-amd64-pair:guest-migrate/src_host/dst_host:fail:regression
    linux-linus:test-amd64-amd64-libvirt-pair:guest-migrate/src_host/dst_host:fail:regression
    linux-linus:test-amd64-amd64-xl-pvhv2-amd:guest-saverestore:fail:regression
    linux-linus:test-amd64-coresched-amd64-xl:guest-saverestore:fail:regression
    linux-linus:test-amd64-amd64-xl-xsm:guest-saverestore:fail:regression
    linux-linus:test-arm64-arm64-xl:debian-fixup:fail:regression
    linux-linus:test-arm64-arm64-xl-credit1:debian-fixup:fail:regression
    linux-linus:test-arm64-arm64-libvirt-xsm:debian-fixup:fail:regression
    linux-linus:test-arm64-arm64-xl-xsm:debian-fixup:fail:regression
    linux-linus:test-arm64-arm64-xl-credit2:debian-fixup:fail:regression
    linux-linus:test-arm64-arm64-xl-thunderx:debian-fixup:fail:regression
    linux-linus:test-armhf-armhf-xl-credit1:guest-start:fail:regression
    linux-linus:test-amd64-amd64-xl-rtds:guest-saverestore:fail:allowable
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=58e2cf5d794616b84f591d4d1276c8953278ce24
X-Osstest-Versions-That:
    linux=deacdb3e3979979016fcd0ffd518c320a62ad166
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 23 Sep 2021 17:14:29 +0000

flight 165163 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165163/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-pvshim   17 guest-saverestore        fail REGR. vs. 152332
 test-amd64-amd64-dom0pvh-xl-amd 17 guest-saverestore     fail REGR. vs. 152332
 test-amd64-amd64-xl-multivcpu 17 guest-saverestore       fail REGR. vs. 152332
 test-amd64-amd64-dom0pvh-xl-intel 17 guest-saverestore   fail REGR. vs. 152332
 test-amd64-amd64-xl-credit1  17 guest-saverestore        fail REGR. vs. 152332
 test-amd64-amd64-xl-pvhv2-intel 17 guest-saverestore     fail REGR. vs. 152332
 test-amd64-amd64-xl          17 guest-saverestore        fail REGR. vs. 152332
 test-amd64-amd64-xl-shadow   17 guest-saverestore        fail REGR. vs. 152332
 test-amd64-amd64-libvirt     17 guest-saverestore        fail REGR. vs. 152332
 test-amd64-amd64-xl-credit2  17 guest-saverestore        fail REGR. vs. 152332
 test-amd64-amd64-libvirt-xsm 17 guest-saverestore        fail REGR. vs. 152332
 test-amd64-amd64-pair 26 guest-migrate/src_host/dst_host fail REGR. vs. 152332
 test-amd64-amd64-libvirt-pair 26 guest-migrate/src_host/dst_host fail REGR. vs. 152332
 test-amd64-amd64-xl-pvhv2-amd 17 guest-saverestore       fail REGR. vs. 152332
 test-amd64-coresched-amd64-xl 17 guest-saverestore       fail REGR. vs. 152332
 test-amd64-amd64-xl-xsm      17 guest-saverestore        fail REGR. vs. 152332
 test-arm64-arm64-xl          13 debian-fixup             fail REGR. vs. 152332
 test-arm64-arm64-xl-credit1  13 debian-fixup             fail REGR. vs. 152332
 test-arm64-arm64-libvirt-xsm 13 debian-fixup             fail REGR. vs. 152332
 test-arm64-arm64-xl-xsm      13 debian-fixup             fail REGR. vs. 152332
 test-arm64-arm64-xl-credit2  13 debian-fixup             fail REGR. vs. 152332
 test-arm64-arm64-xl-thunderx 13 debian-fixup             fail REGR. vs. 152332
 test-armhf-armhf-xl-credit1  14 guest-start              fail REGR. vs. 152332

Regressions which are regarded as allowable (not blocking):
 test-amd64-amd64-xl-rtds     17 guest-saverestore        fail REGR. vs. 152332

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check fail baseline untested
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 152332
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 152332
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 152332
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 152332
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 152332
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 152332
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 152332
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                58e2cf5d794616b84f591d4d1276c8953278ce24
baseline version:
 linux                deacdb3e3979979016fcd0ffd518c320a62ad166

Last test of basis   152332  2020-07-31 19:41:23 Z  418 days
Failing since        152366  2020-08-01 20:49:34 Z  417 days  730 attempts
Testing same since   165163  2021-09-23 07:54:43 Z    0 days    1 attempts

------------------------------------------------------------
7324 people touched revisions under test,
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
 test-amd64-amd64-xl                                          fail    
 test-amd64-coresched-amd64-xl                                fail    
 test-arm64-arm64-xl                                          fail    
 test-armhf-armhf-xl                                          pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-libvirt-xsm                                 fail    
 test-arm64-arm64-libvirt-xsm                                 fail    
 test-amd64-amd64-xl-xsm                                      fail    
 test-arm64-arm64-xl-xsm                                      fail    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                fail    
 test-amd64-amd64-dom0pvh-xl-amd                              fail    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-freebsd11-amd64                             pass    
 test-amd64-amd64-freebsd12-amd64                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-xl-credit1                                  fail    
 test-arm64-arm64-xl-credit1                                  fail    
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  fail    
 test-arm64-arm64-xl-credit2                                  fail    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              fail    
 test-amd64-amd64-dom0pvh-xl-intel                            fail    
 test-amd64-amd64-libvirt                                     fail    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-amd64-xl-multivcpu                                fail    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        fail    
 test-amd64-amd64-libvirt-pair                                fail    
 test-amd64-amd64-xl-pvshim                                   fail    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-libvirt-qcow2                               pass    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-amd64-xl-rtds                                     fail    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   fail    
 test-arm64-arm64-xl-thunderx                                 fail    
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      pass    
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

(No revision log; it would be 2263977 lines long.)

