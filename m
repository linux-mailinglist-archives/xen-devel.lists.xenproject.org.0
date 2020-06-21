Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C150202814
	for <lists+xen-devel@lfdr.de>; Sun, 21 Jun 2020 05:02:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmqDm-0007aI-6g; Sun, 21 Jun 2020 03:00:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iz7/=AC=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jmqDj-0007aD-Uy
 for xen-devel@lists.xenproject.org; Sun, 21 Jun 2020 03:00:36 +0000
X-Inumbo-ID: 5f6bd202-b36b-11ea-8496-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5f6bd202-b36b-11ea-8496-bc764e2007e4;
 Sun, 21 Jun 2020 03:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4EuybYWKvsBw1Q3JZm+xZC7m+Jm9vfrrMRnMNStUxKc=; b=EC6l7S/aKwypobfUfkezTvgiP
 PxF8uWsfwrhp5Jne12kwpJozawvwTWhzRJqHmTbRX6lf8A+qySMbtT1rGjx63NMhYrFSO8W0K+RL7
 yRM9O+DKHdL/bFAEMFw3i6TAACEGWG1yQax3aWuuCeC7a98NNaoHmkdOOY5UsQgqxQQkM=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jmqDg-00061h-Mf; Sun, 21 Jun 2020 03:00:32 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jmqDg-0001NO-C8; Sun, 21 Jun 2020 03:00:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jmqDg-00058O-BS; Sun, 21 Jun 2020 03:00:32 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151236-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 151236: regressions - FAIL
X-Osstest-Failures: linux-linus:test-arm64-arm64-libvirt-xsm:guest-start/debian.repeat:fail:regression
 linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
X-Osstest-Versions-This: linux=5e857ce6eae7ca21b2055cca4885545e29228fe2
X-Osstest-Versions-That: linux=1b5044021070efa3259f3e9548dc35d1eb6aa844
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 21 Jun 2020 03:00:32 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

flight 151236 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151236/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-arm64-arm64-libvirt-xsm 16 guest-start/debian.repeat fail REGR. vs. 151214

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 151214
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 151214
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 151214
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop            fail like 151214
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 151214
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 151214
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 151214
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 151214
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass

version targeted for testing:
 linux                5e857ce6eae7ca21b2055cca4885545e29228fe2
baseline version:
 linux                1b5044021070efa3259f3e9548dc35d1eb6aa844

Last test of basis   151214  2020-06-18 02:27:46 Z    3 days
Testing same since   151236  2020-06-19 19:10:35 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Christoph Hellwig <hch@lst.de>
  Linus Torvalds <torvalds@linux-foundation.org>
  Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
  Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>

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
 test-arm64-arm64-libvirt-xsm                                 fail    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemut-rhel6hvm-amd                           pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
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
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
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
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
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
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
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

------------------------------------------------------------
commit 5e857ce6eae7ca21b2055cca4885545e29228fe2
Merge: 670d0a4b1070 0c389d89abc2
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu Jun 18 12:35:51 2020 -0700

    Merge branch 'hch' (maccess patches from Christoph Hellwig)
    
    Merge non-faulting memory access cleanups from Christoph Hellwig:
     "Andrew and I decided to drop the patches implementing your suggested
      rename of the probe_kernel_* and probe_user_* helpers from -mm as
      there were way to many conflicts.
    
      After -rc1 might be a good time for this as all the conflicts are
      resolved now"
    
    This also adds a type safety checking patch on top of the renaming
    series to make the subtle behavioral difference between 'get_user()' and
    'get_kernel_nofault()' less potentially dangerous and surprising.
    
    * emailed patches from Christoph Hellwig <hch@lst.de>:
      maccess: make get_kernel_nofault() check for minimal type compatibility
      maccess: rename probe_kernel_address to get_kernel_nofault
      maccess: rename probe_user_{read,write} to copy_{from,to}_user_nofault
      maccess: rename probe_kernel_{read,write} to copy_{from,to}_kernel_nofault

commit 0c389d89abc28edf70ae847ee2fa55acb267b826
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu Jun 18 12:10:37 2020 -0700

    maccess: make get_kernel_nofault() check for minimal type compatibility
    
    Now that we've renamed probe_kernel_address() to get_kernel_nofault()
    and made it look and behave more in line with get_user(), some of the
    subtle type behavior differences end up being more obvious and possibly
    dangerous.
    
    When you do
    
            get_user(val, user_ptr);
    
    the type of the access comes from the "user_ptr" part, and the above
    basically acts as
    
            val = *user_ptr;
    
    by design (except, of course, for the fact that the actual dereference
    is done with a user access).
    
    Note how in the above case, the type of the end result comes from the
    pointer argument, and then the value is cast to the type of 'val' as
    part of the assignment.
    
    So the type of the pointer is ultimately the more important type both
    for the access itself.
    
    But 'get_kernel_nofault()' may now _look_ similar, but it behaves very
    differently.  When you do
    
            get_kernel_nofault(val, kernel_ptr);
    
    it behaves like
    
            val = *(typeof(val) *)kernel_ptr;
    
    except, of course, for the fact that the actual dereference is done with
    exception handling so that a faulting access is suppressed and returned
    as the error code.
    
    But note how different the casting behavior of the two superficially
    similar accesses are: one does the actual access in the size of the type
    the pointer points to, while the other does the access in the size of
    the target, and ignores the pointer type entirely.
    
    Actually changing get_kernel_nofault() to act like get_user() is almost
    certainly the right thing to do eventually, but in the meantime this
    patch adds logit to at least verify that the pointer type is compatible
    with the type of the result.
    
    In many cases, this involves just casting the pointer to 'void *' to
    make it obvious that the type of the pointer is not the important part.
    It's not how 'get_user()' acts, but at least the behavioral difference
    is now obvious and explicit.
    
    Cc: Christoph Hellwig <hch@lst.de>
    Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>

commit 25f12ae45fc1931a1dce3cc59f9989a9d87834b0
Author: Christoph Hellwig <hch@lst.de>
Date:   Wed Jun 17 09:37:55 2020 +0200

    maccess: rename probe_kernel_address to get_kernel_nofault
    
    Better describe what this helper does, and match the naming of
    copy_from_kernel_nofault.
    
    Also switch the argument order around, so that it acts and looks
    like get_user().
    
    Signed-off-by: Christoph Hellwig <hch@lst.de>
    Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>

commit 670d0a4b10704667765f7d18f7592993d02783aa
Author: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Date:   Thu Jun 18 00:02:26 2020 +0200

    sparse: use identifiers to define address spaces
    
    Currently, address spaces in warnings are displayed as '<asn:X>' with
    'X' being the address space's arbitrary number.
    
    But since sparse v0.6.0-rc1 (late December 2018), sparse allows you to
    define the address spaces using an identifier instead of a number.  This
    identifier is then directly used in the warnings.
    
    So, use the identifiers '__user', '__iomem', '__percpu' & '__rcu' for
    the corresponding address spaces.  The default address space, __kernel,
    being not displayed in warnings, stays defined as '0'.
    
    With this change, warnings that used to be displayed as:
    
            cast removes address space '<asn:1>' of expression
            ... void [noderef] <asn:2> *
    
    will now be displayed as:
    
            cast removes address space '__user' of expression
            ... void [noderef] __iomem *
    
    This also moves the __kernel annotation to be the first one, since it is
    quite different from the others because it's the default one, and so:
    
     - it's never displayed
    
     - it's normally not needed, nor in type annotations, nor in cast
       between address spaces. The only time it's needed is when it's
       combined with a typeof to express "the same type as this one but
       without the address space"
    
     - it can't be defined with a name, '0' must be used.
    
    So, it seemed strange to me to have it in the middle of the other
    ones.
    
    Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
    Acked-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
    Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>

commit c0ee37e85e0e47402b8bbe35b6cec8e06937ca58
Author: Christoph Hellwig <hch@lst.de>
Date:   Wed Jun 17 09:37:54 2020 +0200

    maccess: rename probe_user_{read,write} to copy_{from,to}_user_nofault
    
    Better describe what these functions do.
    
    Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
    Signed-off-by: Christoph Hellwig <hch@lst.de>
    Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>

commit fe557319aa06c23cffc9346000f119547e0f289a
Author: Christoph Hellwig <hch@lst.de>
Date:   Wed Jun 17 09:37:53 2020 +0200

    maccess: rename probe_kernel_{read,write} to copy_{from,to}_kernel_nofault
    
    Better describe what these functions do.
    
    Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
    Signed-off-by: Christoph Hellwig <hch@lst.de>
    Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>

