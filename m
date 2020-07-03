Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28892213C5F
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jul 2020 17:13:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrNN0-0003To-0C; Fri, 03 Jul 2020 15:12:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XYi7=AO=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jrNMy-0003Tj-Tv
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2020 15:12:52 +0000
X-Inumbo-ID: a433015c-bd3f-11ea-89dd-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a433015c-bd3f-11ea-89dd-12813bfff9fa;
 Fri, 03 Jul 2020 15:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G6kmMXHHYp/e8FfyleS/gSKtYRqyyh0F2t/O0OY+m5Y=; b=NtGzQG9OX8B/lAr7orW9Jy3jy
 Q9Zri9jhlQcENyz1/Vo4B7VGsEZqYd134E3Ht+1Qrv94D2B2lZb4qI5Eaf99JVMSALEGXnp9NgYpg
 zq2u1/aVazwId5G472ohn2P5rBgIB+VX/oSlevB+xKW8D6Bh7Mt1StoTo+m6rFgfixLCc=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jrNMn-0001HG-Qu; Fri, 03 Jul 2020 15:12:41 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jrNMn-00067d-Jn; Fri, 03 Jul 2020 15:12:41 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jrNMn-0006rA-Ix; Fri, 03 Jul 2020 15:12:41 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151554-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 151554: regressions - FAIL
X-Osstest-Failures: xen-unstable:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:regression
 xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
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
 xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
X-Osstest-Versions-This: xen=be63d9d47f571a60d70f8fb630c03871312d9655
X-Osstest-Versions-That: xen=23ca7ec0ba620db52a646d80e22f9703a6589f66
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 03 Jul 2020 15:12:41 +0000
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

flight 151554 xen-unstable real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151554/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 10 debian-hvm-install fail REGR. vs. 151506

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 151506
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 151506
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 151506
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 151506
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 151506
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 151506
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 151506
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop            fail like 151506
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop             fail like 151506
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass

version targeted for testing:
 xen                  be63d9d47f571a60d70f8fb630c03871312d9655
baseline version:
 xen                  23ca7ec0ba620db52a646d80e22f9703a6589f66

Last test of basis   151506  2020-07-01 10:55:16 Z    2 days
Failing since        151528  2020-07-02 04:45:56 Z    1 days    2 attempts
Testing same since   151554  2020-07-02 21:40:14 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Bertrand Marquis <bertrand.marquis@arm.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stefano Stabellini <stefano.stabellini@xilinx.com>
  Volodymyr Babchuk <volodymyr_babchuk@epam.com>

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
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 fail    
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
commit be63d9d47f571a60d70f8fb630c03871312d9655
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Jul 2 11:11:40 2020 +0200

    build: tweak variable exporting for make 3.82
    
    While I've been running into an issue here only because of an additional
    local change I'm carrying, to be able to override just the compiler in
    $(XEN_ROOT)/.config (rather than the whole tool chain), in
    config/StdGNU.mk:
    
    ifeq ($(filter-out default undefined,$(origin CC)),)
    
    I'd like to propose to nevertheless correct the underlying issue:
    Exporting an unset variable changes its origin from "undefined" to
    "file". This comes into effect because of our adding of -rR to
    MAKEFLAGS, which make 3.82 wrongly applies also upon re-invoking itself
    after having updated auto.conf{,.cmd}.
    
    Move the export statement past $(XEN_ROOT)/config/$(XEN_OS).mk inclusion
    (which happens through $(XEN_ROOT)/Config.mk) such that the variables
    already have their designated values at that point, while retaining
    their initial origin up to the point they get defined.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Tested-by: Bertrand Marquis <bertrand.marquis@arm.com>
    Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
    Release-acked-by: Paul Durrant <paul@xen.org>

commit 5b718d24e88ceb2c28010c647836929b85b22b5d
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Thu Jul 2 11:05:53 2020 +0200

    x86/tlb: fix assisted flush usage
    
    Commit e9aca9470ed86 introduced a regression when avoiding sending
    IPIs for certain flush operations. Xen page fault handler
    (spurious_page_fault) relies on blocking interrupts in order to
    prevent handling TLB flush IPIs and thus preventing other CPUs from
    removing page tables pages. Switching to assisted flushing avoided such
    IPIs, and thus can result in pages belonging to the page tables being
    removed (and possibly re-used) while __page_fault_type is being
    executed.
    
    Force some of the TLB flushes to use IPIs, thus avoiding the assisted
    TLB flush. Those selected flushes are the page type change (when
    switching from a page table type to a different one, ie: a page that
    has been removed as a page table) and page allocation. This sadly has
    a negative performance impact on the pvshim, as less assisted flushes
    can be used. Note the flush in grant-table code is also switched to
    use an IPI even when not strictly needed. This is done so that a
    common arch_flush_tlb_mask can be introduced and always used in common
    code.
    
    Introduce a new flag (FLUSH_FORCE_IPI) and helper to force a TLB flush
    using an IPI (x86 only). Note that the flag is only meaningfully defined
    when the hypervisor supports PV or shadow paging mode, as otherwise
    hardware assisted paging domains are in charge of their page tables and
    won't share page tables with Xen, thus not influencing the result of
    page walks performed by the spurious fault handler.
    
    Just passing this new flag when calling flush_area_mask prevents the
    usage of the assisted flush without any other side effects.
    
    Note the flag is not defined on Arm.
    
    Fixes: e9aca9470ed86 ('x86/tlb: use Xen L0 assisted TLB flush when available')
    Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Julien Grall <jgrall@amazon.com>
    Release-acked-by: Paul Durrant <paul@xen.org>

commit 0dbed3ad3366734fd23ee3fd1f9989c8c96b6052
Author: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Date:   Fri Jun 19 22:34:01 2020 +0000

    optee: allow plain TMEM buffers with NULL address
    
    Trusted Applications use a popular approach to determine the required
    size of a buffer: the client provides a memory reference with the NULL
    pointer to a buffer. This is so called "Null memory reference". TA
    updates the reference with the required size and returns it back to the
    client. Then the client allocates a buffer of the needed size and
    repeats the operation.
    
    This behavior is described in TEE Client API Specification, paragraph
    3.2.5. Memory References.
    
    OP-TEE represents this null memory reference as a TMEM parameter with
    buf_ptr = 0x0. This is the only case when we should allow a TMEM
    buffer without the OPTEE_MSG_ATTR_NONCONTIG flag. This also the
    special case for a buffer with OPTEE_MSG_ATTR_NONCONTIG flag.
    
    This could lead to a potential issue, because IPA 0x0 is a valid
    address, but OP-TEE will treat it as a special case. So, care should
    be taken when construction OP-TEE enabled guest to make sure that such
    guest have no memory at IPA 0x0 and none of its memory is mapped at PA
    0x0.
    
    Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
    Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
    Release-acked-by: Paul Durrant <paul@xen.org>

commit 5b13eb1d978e9732fe2c9826b60885b687a5c4fc
Author: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Date:   Fri Jun 19 22:33:59 2020 +0000

    optee: immediately free buffers that are released by OP-TEE
    
    Normal World can share a buffer with OP-TEE for two reasons:
    1. A client application wants to exchange data with TA
    2. OP-TEE asks for shared buffer for internal needs
    
    The second case was handled more strictly than necessary:
    
    1. In RPC request OP-TEE asks for buffer
    2. NW allocates buffer and provides it via RPC response
    3. Xen pins pages and translates data
    4. Xen provides buffer to OP-TEE
    5. OP-TEE uses it
    6. OP-TEE sends request to free the buffer
    7. NW frees the buffer and sends the RPC response
    8. Xen unpins pages and forgets about the buffer
    
    The problem is that Xen should forget about buffer in between stages 6
    and 7. I.e. the right flow should be like this:
    
    6. OP-TEE sends request to free the buffer
    7. Xen unpins pages and forgets about the buffer
    8. NW frees the buffer and sends the RPC response
    
    This is because OP-TEE internally frees the buffer before sending the
    "free SHM buffer" request. So we have no reason to hold reference for
    this buffer anymore. Moreover, in multiprocessor systems NW have time
    to reuse the buffer cookie for another buffer. Xen complained about this
    and denied the new buffer registration. I have seen this issue while
    running tests on iMX SoC.
    
    So, this patch basically corrects that behavior by freeing the buffer
    earlier, when handling RPC return from OP-TEE.
    
    Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
    Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
    Release-acked-by: Paul Durrant <paul@xen.org>

commit 3b7dab93f2401b08c673244c9ae0f92e08bd03ba
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Jul 1 12:39:59 2020 +0100

    x86/spec-ctrl: Protect against CALL/JMP straight-line speculation
    
    Some x86 CPUs speculatively execute beyond indirect CALL/JMP instructions.
    
    With CONFIG_INDIRECT_THUNK / Retpolines, indirect CALL/JMP instructions are
    converted to direct CALL/JMP's to __x86_indirect_thunk_REG(), leaving just a
    handful of indirect JMPs implementing those stubs.
    
    There is no architectrual execution beyond an indirect JMP, so use INT3 as
    recommended by vendors to halt speculative execution.  This is shorter than
    LFENCE (which would also work fine), but also shows up in logs if we do
    unexpected execute them.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Release-acked-by: Paul Durrant <paul@xen.org>
(qemu changes not included)

