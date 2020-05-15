Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B72F81D4C81
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2020 13:22:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZYPn-0001eq-6B; Fri, 15 May 2020 11:22:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ibeu=65=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jZYPl-0001eg-LO
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 11:22:05 +0000
X-Inumbo-ID: 4a0e0554-969e-11ea-b9cf-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a0e0554-969e-11ea-b9cf-bc764e2007e4;
 Fri, 15 May 2020 11:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Tr0aXhJhMY68R9mm0Eh3V/DQhBLYjZ14pOpUdpPVZAY=; b=lZjFqnyWMKc8McmkGRumtXDOr
 iurM33ZXzMoNvBBWQMdjaNlGLmpkNiRJhxfPrPpZDI1f6D6TGpP1hUcJoEuauoJtDLNrAQNn4indZ
 WcEwjRGGL5tLChfpO0y/vvLMPC4cYwIf25zKP/hTnLalD7SpsP0stj+DKEP0Ay6p1vD18=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jZYPd-0005dg-6C; Fri, 15 May 2020 11:21:57 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jZYPc-0004NM-PO; Fri, 15 May 2020 11:21:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jZYPc-000674-Na; Fri, 15 May 2020 11:21:56 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150179-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 150179: regressions - FAIL
X-Osstest-Failures: xen-unstable:test-armhf-armhf-xl-vhd:debian-di-install:fail:regression
 xen-unstable:test-amd64-amd64-xl-rtds:guest-localmigrate/x10:fail:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This: xen=f8644fe441abfd8de8b1f237229cfbe600a58701
X-Osstest-Versions-That: xen=9d83ad86834300927b636fa02b29d84854399ed8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 15 May 2020 11:21:56 +0000
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

flight 150179 xen-unstable real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150179/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl-vhd      10 debian-di-install        fail REGR. vs. 150164

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-rtds     18 guest-localmigrate/x10  fail blocked in 150164
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 150164
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 150164
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 150164
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 150164
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 150164
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 150164
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 150164
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop            fail like 150164
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop             fail like 150164
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass

version targeted for testing:
 xen                  f8644fe441abfd8de8b1f237229cfbe600a58701
baseline version:
 xen                  9d83ad86834300927b636fa02b29d84854399ed8

Last test of basis   150164  2020-05-13 17:36:57 Z    1 days
Failing since        150169  2020-05-14 03:54:42 Z    1 days    2 attempts
Testing same since   150179  2020-05-14 13:37:22 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Dario Faggioli <dfaggioli@suse.com>
  Jan Beulich <jbeulich@suse.com>
  Jason Andryuk <jandryuk@gmail.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Nick Rosbrook <rosbrookn@ainfosec.com>
  Nick Rosbrook <rosbrookn@gmail.com>
  Stefano Stabellini <sstabellini@kernel.org>
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
 test-amd64-amd64-xl-rtds                                     fail    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
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

------------------------------------------------------------
commit f8644fe441abfd8de8b1f237229cfbe600a58701
Author: Julien Grall <jgrall@amazon.com>
Date:   Thu Apr 30 15:25:47 2020 +0100

    xen/Kconfig: define EXPERT a bool rather than a string
    
    Since commit f80fe2b34f08 "xen: Update Kconfig to Linux v5.4" EXPERT
    can only have two values (enabled or disabled). So switch from a string
    to a bool.
    
    Take the opportunity to replace all "EXPERT = y" to "EXPERT" and use
    squash the lines bool and prompt together in modified place.
    
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    Acked-by: Dario Faggioli <dfaggioli@suse.com>
    Acked-by: Stefano Stabellini <sstabellini@kernel.org>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 122b52230aa5b79d65e18b8b77094027faa2f8e2
Author: Juergen Gross <jgross@suse.com>
Date:   Thu Apr 30 07:38:42 2020 +0200

    tools/xenstore: don't store domU's mfn of ring page in xenstored
    
    The XS_INTRODUCE command has two parameters: the mfn (or better: gfn)
    of the domain's xenstore ring page and the event channel of the
    domain for communicating with Xenstore.
    
    The gfn is not really needed. It is stored in the per-domain struct
    in xenstored and in case of another XS_INTRODUCE for the domain it
    is tested to match the original value. If it doesn't match the
    command is aborted via EINVAL, otherwise the event channel to the
    domain is recreated.
    
    As XS_INTRODUCE is limited to dom0 and there is no real downside of
    recreating the event channel just omit the test for the gfn to
    match and don't return EINVAL for multiple XS_INTRODUCE calls.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>
    Acked-by: Wei Liu <wl@xen.org>

commit b539eeffc737d859dd1814c2e529e0ed0feba7a7
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu May 14 07:53:55 2020 +0200

    x86/PVH: PHYSDEVOP_pci_mmcfg_reserved should not blindly register a region
    
    The op has a "is reserved" flag, and hence registration shouldn't
    happen unilaterally.
    
    Fixes: eb3dd90e4089 ("x86/physdev: enable PHYSDEVOP_pci_mmcfg_reserved for PVH Dom0")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

commit 3a218961b16f1f4feb1147f56338faf1ac8f5703
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue May 12 19:18:43 2020 +0100

    x86/build: Unilaterally disable -fcf-protection
    
    Xen doesn't support CET-IBT yet.  At a minimum, logic is required to enable it
    for supervisor use, but the livepatch functionality needs to learn not to
    overwrite ENDBR64 instructions.
    
    Furthermore, Ubuntu enables -fcf-protection by default, along with a buggy
    version of GCC-9 which objects to it in combination with
    -mindirect-branch=thunk-extern (Fixed in GCC 10, 9.4).
    
    Various objects (Xen boot path, Rombios 32 stubs) require .text to be at the
    beginning of the object.  These paths explode when .note.gnu.properties gets
    put ahead of .text and we end up executing the notes data.
    
    Disable -fcf-protection for all embedded objects.
    
    Reported-by: Jason Andryuk <jandryuk@gmail.com>
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 1a47731115c2c8eb510e135fa48ed51ad2e94a26
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed May 13 13:06:28 2020 +0100

    x86/build: move -fno-asynchronous-unwind-tables into EMBEDDED_EXTRA_CFLAGS
    
    Users of EMBEDDED_EXTRA_CFLAGS already use -fno-asynchronous-unwind-tables, or
    ought to.  This shrinks the size of the rombios 32bit stubs in guest memory.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 24f94fca23ad7c45806a1428331e1d602dfd8604
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue May 12 19:18:37 2020 +0100

    x86/build32: Discard all orphaned sections
    
    Linkers may put orphaned sections ahead of .text, which breaks the calling
    requirements.  A concrete example is Ubuntu's GCC-9 default of enabling
    -fcf-protection which causes us to try and execute .note.gnu.properties during
    Xen's boot.
    
    Put .got.plt in its own section as it specifically needs preserving from the
    linkers point of view, and discard everything else.  This will hopefully be
    more robust to other unexpected toolchain properties.
    
    Fixes boot from an Ubuntu build of Xen.
    
    Reported-by: Jason Andryuk <jandryuk@gmail.com>
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Tested-by: Jason Andryuk <jandryuk@gmail.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 9f74a7b66b0b03fe563779bb2c133051f1595ece
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue May 12 17:21:33 2020 +0100

    x86/guest: Fix assembler warnings with newer binutils
    
    GAS of at least version 2.34 complains:
    
      hypercall_page.S: Assembler messages:
      hypercall_page.S:24: Warning: symbol 'HYPERCALL_set_trap_table' already has its type set
      ...
      hypercall_page.S:71: Warning: symbol 'HYPERCALL_arch_7' already has its type set
    
    which is because the whole page is declared as STT_OBJECT already.  Rearrange
    .set with respect to .type in DECLARE_HYPERCALL() so STT_FUNC is already in
    place.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit f3b0d25e343562dee29729cfaf32f8c79f8b6502
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed May 13 13:07:53 2020 +0100

    stubdom: Use matching quotes in error message
    
    This prevents syntax highlighting from believing the rest of the file is a
    string.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Julien Grall <jgrall@amazon.com>

commit d8a6a8b36d864e1e56d3c63b30892cbb4e55d65c
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Mar 2 14:36:03 2020 +0000

    tools/libxc: Reduce feature handling complexity in xc_cpuid_apply_policy()
    
    xc_cpuid_apply_policy() is gaining extra parameters to untangle CPUID
    complexity in Xen.  While an improvement in general, it does have the
    unfortunate side effect of duplicating some settings across multiple
    parameters.
    
    Rearrange the logic to only consider 'pae' if no explicit featureset is
    provided.  This reduces the complexity for callers who have already provided a
    pae setting in the featureset.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Paul Durrant <pdurrant@amzn.com>
    Acked-by: Wei Liu <wl@xen.org>

commit 61be48dc029294275348443f78a5e600ef28274f
Author: Nick Rosbrook <rosbrookn@gmail.com>
Date:   Wed May 13 10:18:19 2020 -0400

    golang/xenlight: add necessary module/package documentation
    
    Add a README and package comment giving a brief overview of the package.
    These also help pkg.go.dev generate better documentation.
    
    Also, add a copy of the LGPL (the same license used by libxl) to
    tools/golang/xenlight. This is required for the package to be shown
    on pkg.go.dev and added to the default module proxy, proxy.golang.org.
    
    Finally, add an entry for the xenlight package to SUPPORT.md.
    
    Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
    Reviewed-by: George Dunlap <george.dunlap@citrix.com>
(qemu changes not included)

