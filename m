Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 077E123E644
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 05:27:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3t11-0004dw-Lf; Fri, 07 Aug 2020 03:25:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l16/=BR=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1k3t10-0004dV-Rm
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2020 03:25:54 +0000
X-Inumbo-ID: 6ef7ef97-80a4-4aee-b1c7-1ef842d9fa7f
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6ef7ef97-80a4-4aee-b1c7-1ef842d9fa7f;
 Fri, 07 Aug 2020 03:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=klo+F4ldPHfSN22YaqHE7EZhk7mPIRWxRUqgh1HhR0A=; b=OXma7w9TbftWxKOOMjWB98ar3
 vuWN6k9L/y6yTjArbGL1nWbEGbrggKqWjY/NRw9qgqNg1oCvAQFN/vpHWH/Nji8sc5AWpaain5894
 NJaqbsBYk+NnYQ/zmJhLamd/0ojXS6ekMhFBwO8rOybSNvPsZMCoTr9fwxDXBAhMa97bc=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k3t0r-0003RD-L9; Fri, 07 Aug 2020 03:25:45 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k3t0r-0008K9-9U; Fri, 07 Aug 2020 03:25:45 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1k3t0r-0000gu-86; Fri, 07 Aug 2020 03:25:45 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152498-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 152498: regressions - FAIL
X-Osstest-Failures: xen-unstable:test-amd64-amd64-examine:memdisk-try-append:fail:regression
 xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
X-Osstest-Versions-This: xen=b2bc1e714462c6cc222e3bbc38d87b039b4fa405
X-Osstest-Versions-That: xen=81fd0d3ca4b2cd309403c6e8da662c325dd35750
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 07 Aug 2020 03:25:45 +0000
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

flight 152498 xen-unstable real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152498/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-examine      4 memdisk-try-append       fail REGR. vs. 152418

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 152418
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 152418
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 152418
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 152418
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 152418
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 152418
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 152418
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop            fail like 152418
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop             fail like 152418
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass

version targeted for testing:
 xen                  b2bc1e714462c6cc222e3bbc38d87b039b4fa405
baseline version:
 xen                  81fd0d3ca4b2cd309403c6e8da662c325dd35750

Last test of basis   152418  2020-08-03 11:11:04 Z    3 days
Failing since        152461  2020-08-04 07:50:21 Z    2 days    3 attempts
Testing same since   152498  2020-08-06 01:55:41 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
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
commit b2bc1e714462c6cc222e3bbc38d87b039b4fa405
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Aug 5 14:56:11 2020 +0100

    x86/tsc: Fix diagnostics for TSC frequency
    
    A Gemini Lake platform prints:
    
      (XEN) CPU0: TSC: 19200000MHz * 279 / 3 = 1785600000MHz
      (XEN) CPU0: 800..1800 MHz
    
    during boot.  The units on the first line are Hz, not MHz, so correct that and
    add a space for clarity.
    
    Also, for the min/max line, use three dots instead of two and add more spaces
    so that the line can't be mistaken for being a double decimal point typo.
    
    Boot now reads:
    
      (XEN) CPU0: TSC: 19200000 Hz * 279 / 3 = 1785600000 Hz
      (XEN) CPU0: 800 ... 1800 MHz
    
    Extend these changes to the other TSC diagnostics.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit dae7ea5138f72f3ac38367f50d941e8f70628119
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Aug 5 14:35:16 2020 +0100

    x86/ioapic: Improve code generation for __io_apic_{read,write}()
    
    The write into REGSEL prevents the optimiser from reusing the address
    calculation, forcing it to be calcualted twice.
    
    The calculation itself is quite expensive.  Pull it out into a local varaible.
    
    Bloat-o-meter reports:
      add/remove: 0/0 grow/shrink: 0/26 up/down: 0/-1527 (-1527)
    
    Also correct the register type, which is uint32_t, not int.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit a8ee9c4d3fb8532a60c6c87abd0fe80b5b03c6e8
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Aug 5 11:49:15 2020 +0100

    x86/ioapic: Fix style in io_apic.h
    
    This file is a mix of Xen and Linux styles.  Switch it fully to Xen style.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit b4175c6693e089ffcd77cd1ea388e76e67d36d57
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Aug 5 12:05:27 2020 +0100

    x86/ioapic: Fix fixmap error path logic in ioapic_init_mappings()
    
    In the case that bad_ioapic_register() fails, the current position of idx++
    means that clear_fixmap(idx) will be called with the wrong index, and not
    clean up the mapping just created.
    
    Increment idx as part of the loop, rather than midway through the loop body.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit e58a71274c65e7547fc2e917f051c5c04e2820e2
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Aug 5 10:30:18 2020 +0200

    x86emul: correct AVX512_BF16 insn names in EVEX Disp8 test
    
    The leading 'v' ought to be omitted from the table entries.
    
    Fixes: 7ff66809ccd5 ("x86emul: support AVX512_BF16 insns")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 062aad5190aea2c8a57933c16acae571551a7737
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Aug 5 10:29:55 2020 +0200

    x86emul: extend decoding / mem access testing to EVEX-encoded insns
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 96137cf1426a1d6419ec9fd205e22b03b2af313d
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Aug 5 10:29:18 2020 +0200

    x86emul: AVX512PF insns aren't memory accesses
    
    These are prefetches, so should be treated just like other prefetches.
    
    Fixes: 467e91bde720 ("x86emul: support AVX512PF insns")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 6156cfeaf28c9cd0ffb84c25216c43aa64d93de4
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Aug 5 10:28:40 2020 +0200

    x86emul: AVX512F scatter insns are memory writes
    
    While the custom handling renders the "to_mem" field generally unused,
    x86_insn_is_mem_write() still (indirectly) consumes that information,
    and hence the table entries want to be correct.
    
    Fixes: 7d569b848036 ("x86emul: support AVX512F scatter insns")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 067e7b76fd38a2f6ba3898c15a09878498a73226
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Aug 5 10:28:01 2020 +0200

    x86emul: AVX512{F,BW} down conversion moves are memory writes
    
    For this to be properly reported, the case labels need to move to a
    different switch() block.
    
    Fixes: 30e0bdf79828 ("x86emul: support AVX512{F,BW} down conversion moves")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 3cb82fe3ff4262ddd4fa594c425cbd8f3f14dc76
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Aug 5 10:27:31 2020 +0200

    x86emul: extend decoding / mem access testing to XOP-encoded insns
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 5e6dc9b8e51679ead71ab3834c8d24bcb95a4fdf
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Aug 5 10:27:23 2020 +0200

    x86emul: extend decoding / mem access testing to VEX-encoded insns
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit d9dad3584b63f7a4d1a33ee3a4b637b4b0d36856
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Aug 5 10:27:11 2020 +0200

    x86emul: extend decoding / mem access testing to MMX / SSE insns
    
    IOW just legacy encoded ones. For 3dNow! just one example is used, as
    they're all similar in nature both encoding- and operand-wise.
    
    Rename pfx_none to pfx_no, so it can be used to improve readability /
    column alignment.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 37b7b1571bedbbe93392a1f51da501d88985071c
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Aug 5 10:26:59 2020 +0200

    x86emul: extend decoding / mem access testing to FPU insns
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit df8fb11d8880cb0f4f1bbcff1700d0a80e0f6983
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Aug 5 10:26:11 2020 +0200

    x86emul: adjustments to mem access / write logic testing
    
    The combination of specifying a ModR/M byte with the upper two bits set
    and the modrm field set to T is pointless - the same test will be
    executed twice, i.e. overall things will be slower for no extra gain. I
    can only assume this was a copy-and-paste-without-enough-editing mistake
    of mine.
    
    Furthermore adjust the base type of a few bit fields to shrink table
    size, as subsequently quite a few new entries will get added to the
    tables using this type.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 2e98d0b1d09e99e3d1287cb13f42b604ebc3c29a
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Aug 5 10:21:22 2020 +0200

    x86: comment update after "drop high compat r/o M2P table address range"
    
    Commit 5af040ef8b57 clearly should also have updated the comment, not
    just the #define-s.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 48660560d1b64763551be5746f980eec700ba46c
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Aug 5 10:20:59 2020 +0200

    x86emul: further FPU env testing relaxation for AMD-like CPUs
    
    See the code comment that's being extended. Additionally a few more
    zap_fpsel() invocations are needed - whenever we stored state after
    there potentially having been a context switch behind our backs.
    
    Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Tested-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 21de9680eb594a7038d4d4ed78e53ac90a8c5a6e
Author: Jan Beulich <jbeulich@suse.com>
Date:   Wed Aug 5 10:19:29 2020 +0200

    x86emul: replace further UB shifts
    
    I have no explanation how I managed to overlook these while putting
    together what is now b6a907f8c83d ("x86emul: replace UB shifts").
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit c9f9a7258dc07735e2da2b6d0b51a0218c76a51f
Author: Wei Liu <wl@xen.org>
Date:   Tue Aug 4 15:53:48 2020 +0000

    Revert "libxl: avoid golang building without CONFIG_GOLANG=y"
    
    This reverts commit fe49938f21c26f0ce630c69af055f927dd0ed75f.
    
    We have an on-going discussion regarding this patch.
    
    Signed-off-by: Wei Liu <wl@xen.org>

commit fe49938f21c26f0ce630c69af055f927dd0ed75f
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Aug 3 10:06:32 2020 +0200

    libxl: avoid golang building without CONFIG_GOLANG=y
    
    While this doesn't address the real problem I've run into (attempting to
    update r/o source files), not recursing into tools/golang/xenlight/ is
    enough to fix the build for me for the moment. I don't currently see why
    60db5da62ac0 ("libxl: Generate golang bindings in libxl Makefile") found
    it necessary to invoke this build step unconditionally.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Wei Liu <wl@xen.org>

commit 9909532113692020c1b50eb974cac47d4ea10e69
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Aug 3 16:27:22 2020 +0200

    x86emul: avoid assembler warning about .type not taking effect in test harness
    
    gcc re-orders top level blocks by default when optimizing. This
    re-ordering results in all our .type directives to get emitted to the
    assembly file first, followed by gcc's. The assembler warns about
    attempts to change the type of a symbol when it was already set (and
    when there's no intervening setting to "notype").
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
(qemu changes not included)

