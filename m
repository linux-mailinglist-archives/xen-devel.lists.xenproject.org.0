Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E7020C5AC
	for <lists+xen-devel@lfdr.de>; Sun, 28 Jun 2020 06:16:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jpOid-0006GM-9Y; Sun, 28 Jun 2020 04:15:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lqO6=AJ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jpOic-0006Fv-3h
 for xen-devel@lists.xenproject.org; Sun, 28 Jun 2020 04:15:02 +0000
X-Inumbo-ID: eb1ed486-b8f5-11ea-bca7-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eb1ed486-b8f5-11ea-bca7-bc764e2007e4;
 Sun, 28 Jun 2020 04:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ripyVfW6CKG7aPxJHoWXOyW7+IwHyrnbZN+RfwerVUc=; b=0jbHRPCQK4IyzMAJahOp2MI9a
 SNQtdtadMqpih1BCpHZdbUVjR9eNpdSr04Ne6G6C8UiozOL548pytuTe/3halCq4RAMgmKG5f+6Vs
 uMM48qoiCCm5+kWg8q3w/RR4PMgj75pNAHywsyYW/NiABebkIcy3QnMIJmOhF2yWwq7TA=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jpOiS-0003rw-Sl; Sun, 28 Jun 2020 04:14:52 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jpOiS-0000ks-FJ; Sun, 28 Jun 2020 04:14:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jpOiS-0003el-ET; Sun, 28 Jun 2020 04:14:52 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151402-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 151402: regressions - FAIL
X-Osstest-Failures: xen-unstable:test-amd64-amd64-examine:memdisk-try-append:fail:regression
 xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
X-Osstest-Versions-This: xen=88cfd062e8318dfeb67c7d2eb50b6cd224b0738a
X-Osstest-Versions-That: xen=d3688bf60f798074bf38d712a3e15c88cfb81ed4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 28 Jun 2020 04:14:52 +0000
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

flight 151402 xen-unstable real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151402/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-examine      4 memdisk-try-append       fail REGR. vs. 151382

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 151382
 test-armhf-armhf-xl-rtds     16 guest-start/debian.repeat    fail  like 151382
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 151382
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 151382
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 151382
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 151382
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 151382
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 151382
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop            fail like 151382
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop             fail like 151382
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass

version targeted for testing:
 xen                  88cfd062e8318dfeb67c7d2eb50b6cd224b0738a
baseline version:
 xen                  d3688bf60f798074bf38d712a3e15c88cfb81ed4

Last test of basis   151382  2020-06-26 15:39:39 Z    1 days
Testing same since   151402  2020-06-27 10:19:44 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Grzegorz Uriasz <gorbak25@gmail.com>
  Ian Jackson <ian.jackson@eu.citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Jason Andryuk <jandryuk@gmail.com>
  Tim Deegan <tim@xen.org>
  Wei Liu <wl@xen.org>

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
commit 88cfd062e8318dfeb67c7d2eb50b6cd224b0738a
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Jun 26 15:35:27 2020 +0100

    changelog: Add notes about CET and Migration changes
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Paul Durrant <paul@xen.org>
    Release-acked-by: Paul Durrant <paul@xen.org>

commit 92167e9430c010df410336f2b68cc4e30b7872d9
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Jun 8 18:47:58 2020 +0100

    x86/livepatch: Make livepatching compatible with CET Shadow Stacks
    
    Just like the alternatives infrastructure, the livepatch infrastructure
    disables CR0.WP to perform patching, which is not permitted with CET active.
    
    Modify arch_livepatch_{quiesce,revive}() to disable CET before disabling WP,
    and reset the dirty bits on all virtual regions before re-enabling CET.
    
    One complication is that arch_livepatch_revive() has to fix up the top of the
    shadow stack.  This depends on the functions not being inlined, even under
    LTO.  Another limitation is that reset_virtual_region_perms() may shatter the
    final superpage of .text depending on alignment.
    
    This logic, and its downsides, are temporary until the patching infrastructure
    can be adjusted to not use CR0.WP.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>
    Release-acked-by: Paul Durrant <paul@xen.org>

commit bcdfbb70fca579baa04f212c0936b77919bdae11
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Jun 19 12:14:32 2020 +0100

    x86/msr: Disallow access to Processor Trace MSRs
    
    We do not expose the feature to guests, so should disallow access to the
    respective MSRs.  For simplicity, drop the entire block of MSRs, not just the
    subset which have been specified thus far.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Wei Liu <wl@xen.org>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Release-acked-by: Paul Durrant <paul@xen.org>

commit 40b532fbdcb2095da7152a1d08d9f0288524c223
Author: Jason Andryuk <jandryuk@gmail.com>
Date:   Wed Jun 10 23:29:36 2020 -0400

    vchan-socket-proxy: Handle closing shared input/output_fd
    
    input_fd & output_fd may be the same FD.  In that case, mark both as -1
    when closing one.  That avoids a dangling FD reference.
    
    Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
    Acked-by: Wei Liu <wl@xen.org>
    Reviewed-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Release-acked-by: Paul Durrant <paul@xen.org>

commit d20c0f1a7864a38b6c26d11d0e44467fba118625
Author: Jason Andryuk <jandryuk@gmail.com>
Date:   Wed Jun 10 23:29:35 2020 -0400

    vchan-socket-proxy: Cleanup resources on exit
    
    Close open FDs and close th vchan connection when exiting the program.
    
    This addresses some Coverity findings about leaking file descriptors.
    
    Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
    Acked-by: Wei Liu <wl@xen.org>
    Reviewed-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Release-acked-by: Paul Durrant <paul@xen.org>

commit 620225c48573396dc2394f59080a2d704a566c9d
Author: Jason Andryuk <jandryuk@gmail.com>
Date:   Wed Jun 10 23:29:34 2020 -0400

    vchan-socket-proxy: Set closed FDs to -1
    
    These FDs are closed, so set them to -1 so they are no longer valid.
    
    Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
    Acked-by: Wei Liu <wl@xen.org>
    Reviewed-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Release-acked-by: Paul Durrant <paul@xen.org>

commit bfb310ee686bc36c9a8f9c15c42f97f96206cd29
Author: Jason Andryuk <jandryuk@gmail.com>
Date:   Wed Jun 10 23:29:33 2020 -0400

    vchan-socket-proxy: Switch data_loop() to take state
    
    Switch data_loop to take a pointer to vchan_proxy_state.
    
    No functional change.
    
    This removes a dead store to input_fd identified by Coverity.
    
    Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
    Acked-by: Wei Liu <wl@xen.org>
    Reviewed-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Release-acked-by: Paul Durrant <paul@xen.org>

commit ace450ebdf120c081e02b40896dc719646708046
Author: Jason Andryuk <jandryuk@gmail.com>
Date:   Wed Jun 10 23:29:32 2020 -0400

    vchan-socket-proxy: Use a struct to store state
    
    Use a struct to group the vchan ctrl and FDs.  This will facilite
    tracking the state of open and closed FDs and ctrl in data_loop().
    
    Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
    Acked-by: Wei Liu <wl@xen.org>
    Reviewed-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Release-acked-by: Paul Durrant <paul@xen.org>

commit 2b1a2188111ec3f39de1c6e6ff834e6894d1e05a
Author: Jason Andryuk <jandryuk@gmail.com>
Date:   Wed Jun 10 23:29:31 2020 -0400

    vchan-socket-proxy: Unify main return value
    
    Introduce 'ret' for main's return value and remove direct returns.  This
    is in preparation for a unified exit path with resource cleanup.
    
    Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
    Acked-by: Wei Liu <wl@xen.org>
    Reviewed-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Release-acked-by: Paul Durrant <paul@xen.org>

commit 20b65c15a38d98f31f212925a3e5a733dce5b477
Author: Jason Andryuk <jandryuk@gmail.com>
Date:   Wed Jun 10 23:29:30 2020 -0400

    vchan-socket-proxy: Check xs_watch return value
    
    Check the return value of xs_watch and error out on failure.
    
    This was found by Citrix's Coverity.
    
    Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
    Acked-by: Wei Liu <wl@xen.org>
    Reviewed-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Release-acked-by: Paul Durrant <paul@xen.org>

commit fbdf181fe36516d74b77217207565e87511bf805
Author: Jason Andryuk <jandryuk@gmail.com>
Date:   Wed Jun 10 23:29:29 2020 -0400

    vchan-socket-proxy: Move perror() into connect_socket
    
    errno is reset by subsequent system & library calls, so it may be
    inaccurate by the time connect_socket returns.  Call perror immediately
    after failing system calls to print the proper message.
    
    Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
    Acked-by: Wei Liu <wl@xen.org>
    Reviewed-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Release-acked-by: Paul Durrant <paul@xen.org>

commit 01b9a28e7d1dc54968d5081bdc089449052df939
Author: Jason Andryuk <jandryuk@gmail.com>
Date:   Wed Jun 10 23:29:28 2020 -0400

    vchan-socket-proxy: Move perror() into listen_socket
    
    The use of perror on the return from listen_socket can produce
    misleading results like:
    UNIX socket path "/tmp/aa....aa" too long (156 >= 108)
    listen socket: Success
    
    errno is reset by subsequent system & library calls, so it may be
    inaccurate by the time listen_socket returns.  Call perror immediately
    after failing system calls to print the proper message.
    
    Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
    Acked-by: Wei Liu <wl@xen.org>
    Reviewed-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Release-acked-by: Paul Durrant <paul@xen.org>

commit 2c8ac47d4e780389842f812bb6b2f95fa673add5
Author: Jason Andryuk <jandryuk@gmail.com>
Date:   Wed Jun 10 23:29:27 2020 -0400

    vchan-socket-proxy: Ensure UNIX path NUL terminated
    
    Check the socket path length to ensure sun_path is NUL terminated.
    
    This was spotted by Citrix's Coverity.
    
    Also use strcpy to avoid a warning "'__builtin_strncpy' specified bound
    108 equals destination size [-Werror=stringop-truncation]" flagged by
    gcc 10.
    
    Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
    Acked-by: Wei Liu <wl@xen.org>
    Reviewed-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Release-acked-by: Paul Durrant <paul@xen.org>

commit ed69c2ecaf3a6745b7c5a10cf2482e3c49cb8c4f
Author: Grzegorz Uriasz <gorbak25@gmail.com>
Date:   Sun Jun 14 16:17:08 2020 +0000

    libxl: tooling expects wrong errno
    
    When iommu is not enabled for a given domain then pci passthrough
    hypercalls such as xc_test_assign_device return EOPNOTSUPP.
    The code responsible for this is in "iommu_do_domctl" inside
    xen/drivers/passthrough/iommu.c
    This patch fixes the error message reported by libxl when assigning
    pci devices to domains without iommu.
    
    Signed-off-by: Grzegorz Uriasz <gorbak25@gmail.com>
    Tested-by: Grzegorz Uriasz <gorbak25@gmail.com>
    Backport: 4.13
    Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
    Release-acked-by: Paul Durrant <paul@xen.org>

commit 3471cafbdda35eacf04670881dd2aee2558b4f08
Author: Tim Deegan <tim@xen.org>
Date:   Fri Jun 26 10:40:44 2020 +0000

    kdd: stop using [0] arrays to access packet contents
    
    GCC 10 is unhappy about this, and we already use 64k buffers
    in the only places where packets are allocated, so move the
    64k size into the packet definition.
    
    Reported-by: Olaf Hering <olaf@aepfle.de>
    Signed-off-by: Tim Deegan <tim@xen.org>
    Acked-by: Wei Liu <wl@xen.org>
    Release-acked-by: Paul Durrant <paul@xen.org>

commit f91d103e74d4c2efa60fb42b6e9d530a92838f8e
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Jun 10 12:40:04 2020 +0100

    tools: fix error path of xendevicemodel_open()
    
    c/s 6902cb00e03 "tools/libxendevicemodel: extract functions and add a compat
    layer" introduced calls to both xencall_open() and osdep_xendevicemodel_open()
    but failed to fix up the error path.
    
    c/s f68c7c618a3 "libs/devicemodel: free xencall handle in error path in
    _open()" fixed up the xencall_open() aspect of the error path (missing the
    osdep_xendevicemodel_open() aspect), but positioned the xencall_close()
    incorrectly, creating the same pattern proved to be problematic by c/s
    30a72f02870 "tools: fix error path of xenhypfs_open()".
    
    Reposition xtl_logger_destroy(), and introduce the missing
    osdep_xendevicemodel_close().
    
    Fixes: 6902cb00e03 ("tools/libxendevicemodel: extract functions and add a compat layer")
    Fixes: f68c7c618a3 ("libs/devicemodel: free xencall handle in error path in _open()")
    Backport: 4.9+
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Juergen Gross <jgross@suse.com>
    Release-acked-by: Paul Durrant <paul@xen.org>
    Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>
(qemu changes not included)

