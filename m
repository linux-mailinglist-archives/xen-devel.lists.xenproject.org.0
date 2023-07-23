Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF1075DFB9
	for <lists+xen-devel@lfdr.de>; Sun, 23 Jul 2023 04:39:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568121.887533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNOyn-0005Gi-6b; Sun, 23 Jul 2023 02:37:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568121.887533; Sun, 23 Jul 2023 02:37:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNOyn-0005EU-1Q; Sun, 23 Jul 2023 02:37:53 +0000
Received: by outflank-mailman (input) for mailman id 568121;
 Sun, 23 Jul 2023 02:37:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qNOyl-0005EK-9n; Sun, 23 Jul 2023 02:37:51 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qNOyk-0000xz-TT; Sun, 23 Jul 2023 02:37:50 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qNOyk-00017h-G9; Sun, 23 Jul 2023 02:37:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qNOyk-0000GB-Fl; Sun, 23 Jul 2023 02:37:50 +0000
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
	bh=7hZ4jvVsRn8ifW8e8+/ROJIUUxg9z96ilAp4/6xgn/o=; b=Y/RQJ+qrrWfGkZ098ssjEgEZc9
	N/imtVSBjGYqdLGmGudcpI9Rf2zL3EudKV4G8VRBgIrL0pDJ0SXQQI2AC3Z+g2uIqAhBM5Io6PMQ1
	AVMeHuFe+bsbbl2qzcTJ4Go9jH0+UeS3kt4uo/36icVBKlGsH8SXC3xTQ6OVSIeFfBFk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181968-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 181968: regressions - FAIL
X-Osstest-Failures:
    xen-unstable:test-amd64-i386-qemuu-rhel6hvm-amd:xen-install:fail:regression
    xen-unstable:test-amd64-amd64-dom0pvh-xl-amd:guest-localmigrate/x10:fail:heisenbug
    xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=0c53c638e16278078371ce028c74693841d7738a
X-Osstest-Versions-That:
    xen=4bf014c6f7d7cc9a9e017cef0eb5ff4bf27526e9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 23 Jul 2023 02:37:50 +0000

flight 181968 xen-unstable real [real]
flight 181979 xen-unstable real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/181968/
http://logs.test-lab.xenproject.org/osstest/logs/181979/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-qemuu-rhel6hvm-amd  7 xen-install        fail REGR. vs. 181927

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-dom0pvh-xl-amd 20 guest-localmigrate/x10 fail pass in 181979-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 181927
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 181927
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 181927
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 181927
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 181927
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 181927
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 181927
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 181927
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 181927
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 181927
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 181927
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 181927
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 xen                  0c53c638e16278078371ce028c74693841d7738a
baseline version:
 xen                  4bf014c6f7d7cc9a9e017cef0eb5ff4bf27526e9

Last test of basis   181927  2023-07-20 13:41:22 Z    2 days
Failing since        181953  2023-07-21 10:42:59 Z    1 days    2 attempts
Testing same since   181968  2023-07-22 06:13:00 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Federico Serafini <federico.serafini@bugseng.com>
  Jan Beulich <jbeulich@suse.com>
  Jens Wiklander <jens.wiklander@linaro.org>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Nicola Vetrini <nicola.vetrini@bugseng.com>
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
 test-arm64-arm64-xl                                          pass    
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
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemut-rhel6hvm-amd                           pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           fail    
 test-amd64-amd64-dom0pvh-xl-amd                              fail    
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
 test-armhf-armhf-xl-credit1                                  pass    
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
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
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


Not pushing.

------------------------------------------------------------
commit 0c53c638e16278078371ce028c74693841d7738a
Author: Juergen Gross <jgross@suse.com>
Date:   Fri Jul 21 08:32:43 2023 +0200

    tools/xenstore: fix XSA-417 patch
    
    The fix for XSA-417 had a bug: domain_alloc_permrefs() will not return
    a negative value in case of an error, but a plain errno value.
    
    Note this is not considered to be a security issue, as the only case
    where domain_alloc_permrefs() will return an error is a failed memory
    allocation. As a guest should not be able to drive Xenstore out of
    memory, this is NOT a problem a guest can trigger at will.
    
    Fixes: ab128218225d ("tools/xenstore: fix checking node permissions")
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit 65fc6d8c92bc339d8ed874c5821e0e65101f6c52
Author: Federico Serafini <federico.serafini@bugseng.com>
Date:   Fri Jul 21 08:32:15 2023 +0200

    x86/mtrr: address violations of MISRA C:2012 Rule 8.3 on parameter types
    
    Change parameter types of function declarations to be consistent with
    the ones used in the corresponding definitions,
    thus addressing violations of MISRA C:2012 Rule 8.3 ("All declarations
    of an object or function shall use the same names and type qualifiers").
    
    No functional changes.
    
    Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
    Acked-by: Roger Pau Monné <roger.pau@citrix.com>

commit 652d8fbb8182f0b9a57ba371c24d21e0a981ee07
Author: Federico Serafini <federico.serafini@bugseng.com>
Date:   Fri Jul 21 08:31:42 2023 +0200

    x86/HVM: address violations of MISRA C:2012 Rules 8.2 and 8.3
    
    Give a name to unnamed parameters thus addressing violations of
    MISRA C:2012 Rule 8.2 ("Function types shall be in prototype form with
    named parameters").
    Keep consistency between parameter names and types used in function
    declarations and the ones used in the corresponding function
    definitions, thus addressing violations of MISRA C:2012 Rule 8.3
    ("All declarations of an object or function shall use the same names
    and type qualifiers").
    
    No functional changes.
    
    Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 60576722d0523122ce34c81b91fd1eafac8f7f5f
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Jul 21 08:31:09 2023 +0200

    x86/vRTC: move and tidy convert_hour() and {to,from}_bcd()
    
    This is to avoid the need for forward declarations, which in turn
    addresses a violation of MISRA C:2012 Rule 8.3 ("All declarations of an
    object or function shall use the same names and type qualifiers").
    
    While doing so,
    - drop inline (leaving the decision to the compiler),
    - add const,
    - add unsigned,
    - correct style.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit cd5048353725f37746da231202feaf5b88ceb46a
Author: Nicola Vetrini <nicola.vetrini@bugseng.com>
Date:   Fri Jul 21 08:30:29 2023 +0200

    xen: address MISRA C:2012 Rule 4.1
    
    MISRA C:2012 Rule 4.1 has the following headline:
    "Octal and hexadecimal escape sequences shall be terminated."
    
    The string literals modified by this patch contain octal or
    hexadecimal escape sequences that are neither terminated by the
    end of the literal, nor by the beginning of another escape sequence.
    
    Therefore, such unterminated sequences have been split into a
    separate literal as a way to comply with the rule and preserve the
    semantics of the code.
    
    No functional changes.
    
    Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 1ab2ae1610d99423af5b810829959431e43de12d
Author: Jens Wiklander <jens.wiklander@linaro.org>
Date:   Mon Jul 17 09:20:52 2023 +0200

    xen/arm: ffa: add support for FFA_ID_GET
    
    Adds support for the FF-A function FFA_ID_GET to return the ID of the
    calling client.
    
    Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

commit 0dacee5cfbf1576b1ea5f44680c92996f7e4175c
Author: Jens Wiklander <jens.wiklander@linaro.org>
Date:   Mon Jul 17 09:20:51 2023 +0200

    xen/arm: ffa: enforce dependency on 4k pages
    
    Adds a BUILD_BUG_ON() to assert the dependency on 4k pages in the FF-A
    mediator since the current implementation only works if Xen page size is
    the same as the FFA page size.
    
    Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
    Reviewed-by: Henry Wang <Henry.Wang@arm.com>

commit 246fdc288e7a4832b8cc93816850b12cf8e4de91
Author: Jens Wiklander <jens.wiklander@linaro.org>
Date:   Mon Jul 17 09:20:50 2023 +0200

    xen/arm: ffa: add defines for framework direct request/response messages
    
    According to DEN0077A version 1.1 REL0, section 18.3, Table 18.{21, 25,
    26, 27, 28}, add defines for framework direct request/response messages.
    
    Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
    Reviewed-by: Henry Wang <Henry.Wang@arm.com>
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

commit aaa416d425213ab37536088783f802df53af26d4
Author: Jens Wiklander <jens.wiklander@linaro.org>
Date:   Mon Jul 17 09:20:49 2023 +0200

    xen/arm: ffa: add flags for FFA_PARTITION_INFO_GET
    
    According to DEN0077A version 1.1 REL0, section 13.8, defines
    flags used for the function FFA_PARTITION_INFO_GET.
    
    Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
    Reviewed-by: Henry Wang <Henry.Wang@arm.com>
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

commit 9b6af1deb273f320e2d1c507aa1cb17f7356f805
Author: Jens Wiklander <jens.wiklander@linaro.org>
Date:   Mon Jul 17 09:20:48 2023 +0200

    xen/arm: ffa: add remaining SMC function IDs
    
    Adds the remaining SMC function IDs from FF-A 1.1 specification,
    DEN0077A version 1.1 REL0.
    
    Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
    Reviewed-by: Henry Wang <Henry.Wang@arm.com>

commit 38846de2176b991704e3062904d0e2fc455b47b9
Author: Jens Wiklander <jens.wiklander@linaro.org>
Date:   Mon Jul 17 09:20:47 2023 +0200

    xen/arm: tee: add a primitive FF-A mediator
    
    Adds a FF-A version 1.1 [1] mediator to communicate with a Secure
    Partition in secure world.
    
    This commit brings in only the parts needed to negotiate FF-A version
    number with guest and SPMC.
    
    [1] https://developer.arm.com/documentation/den0077/e
    
    Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
    [jgrall: Make Kconfig depends on TEE + Remove kconfig.h include]
    Acked-by: Julien Grall <jgrall@amazon.com>

commit 3069ecdf362eabfef452d8a29218290ba6d84b48
Author: Jens Wiklander <jens.wiklander@linaro.org>
Date:   Mon Jul 17 09:20:46 2023 +0200

    xen/arm: smccc: add support for SMCCCv1.2 extended input/output registers
    
    SMCCC v1.2 [1] AArch64 allows x0-x17 to be used as both parameter
    registers and result registers for the SMC and HVC instructions.
    
    Arm Firmware Framework for Armv8-A specification makes use of x0-x7 as
    parameter and result registers.
    
    Let us add new interface to support this extended set of input/output
    registers.
    
    This is based on 3fdc0cb59d97 ("arm64: smccc: Add support for SMCCCv1.2
    extended input/output registers") by Sudeep Holla from the Linux kernel
    
    The SMCCC version reported to the VM is bumped to 1.2 in order to support
    handling FF-A messages.
    
    [1] https://developer.arm.com/documentation/den0028/c/?lang=en
    
    Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
    Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit 12e5c93f9d5503e67b106846d69a7c404a2a01d1
Author: Jens Wiklander <jens.wiklander@linaro.org>
Date:   Mon Jul 17 09:20:45 2023 +0200

    xen/arm: add TEE teardown to arch_domain_teardown()
    
    Adds a progress state for tee_domain_teardown() to be called from
    arch_domain_teardown(). tee_domain_teardown() calls the new callback
    domain_teardown() in struct tee_mediator_ops.
    
    Note that the OP-TEE mediator should be updated in a future patch to use
    the new teardown facility, that is not done here.
    
    Co-developed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

commit 2d775ee651e05596f083e1fe8dfb2ab410369d7d
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Jul 17 09:20:44 2023 +0200

    xen: Introduce arch_domain_teardown()
    
    Plumb it into domain_teardown().  Provide arch_val in the teardown
    continuation information for use by arch_domain_teardown().
    
    No practical change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
(qemu changes not included)

