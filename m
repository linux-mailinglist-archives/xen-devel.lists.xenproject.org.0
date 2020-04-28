Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F7A1BB44A
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 04:59:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTGRz-0002F0-M8; Tue, 28 Apr 2020 02:58:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qrdk=6M=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jTGRy-0002Ev-Hf
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 02:58:22 +0000
X-Inumbo-ID: 1dbfdfa4-88fc-11ea-ae69-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1dbfdfa4-88fc-11ea-ae69-bc764e2007e4;
 Tue, 28 Apr 2020 02:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PBDKrhCGgiL1u4q9NMQ/Jq5POPMS3ZYPJLEwNQSi8ck=; b=PH+HdW4CMVUoM2g0p2KtwmQ58
 optn7wrPJMcJtmyr7cG5gOXyhSlMCwbNTqoBOXQ0p/XXAdux0qT6EjjEhiggDdCqcGeyrQNep//K9
 yvQdyFmPEwZ+NqJ2U/2YK7bQ51V66jorbK36FCz4nOxvKrAFkAJVAOpcSXGlXxBFzw3VE=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jTGRv-0006uN-Tm; Tue, 28 Apr 2020 02:58:19 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jTGRv-000824-L2; Tue, 28 Apr 2020 02:58:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jTGRv-0004oy-KO; Tue, 28 Apr 2020 02:58:19 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149838-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.12-testing test] 149838: regressions - FAIL
X-Osstest-Failures: xen-4.12-testing:test-armhf-armhf-xl-credit2:xen-boot:fail:regression
 xen-4.12-testing:test-amd64-amd64-xl-qcow2:guest-localmigrate/x10:fail:nonblocking
 xen-4.12-testing:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 xen-4.12-testing:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 xen-4.12-testing:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 xen-4.12-testing:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 xen-4.12-testing:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 xen-4.12-testing:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 xen-4.12-testing:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 xen-4.12-testing:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 xen-4.12-testing:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 xen-4.12-testing:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 xen-4.12-testing:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 xen-4.12-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 xen-4.12-testing:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 xen-4.12-testing:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 xen-4.12-testing:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 xen-4.12-testing:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 xen-4.12-testing:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 xen-4.12-testing:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
X-Osstest-Versions-This: xen=e6a2681148382e9227f54b70a5df8e895914c877
X-Osstest-Versions-That: xen=3536f8dc39cc7311715340b87a04a89fac468406
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 28 Apr 2020 02:58:19 +0000
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

flight 149838 xen-4.12-testing real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149838/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl-credit2   7 xen-boot                 fail REGR. vs. 149646

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qcow2    17 guest-localmigrate/x10       fail  like 149646
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop             fail never pass
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop             fail never pass
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop              fail never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail   never pass
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop             fail never pass
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop             fail never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass

version targeted for testing:
 xen                  e6a2681148382e9227f54b70a5df8e895914c877
baseline version:
 xen                  3536f8dc39cc7311715340b87a04a89fac468406

Last test of basis   149646  2020-04-14 13:05:53 Z   13 days
Testing same since   149838  2020-04-27 14:06:02 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Harsha Shamsundara Havanur <havanur@amazon.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Roger Pau Monné <roger.pau@citrix.com>
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
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           pass    
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
 test-armhf-armhf-xl-credit2                                  fail    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
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
 test-amd64-amd64-xl-qcow2                                    fail    
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
commit e6a2681148382e9227f54b70a5df8e895914c877
Author: Anthony PERARD <anthony.perard@citrix.com>
Date:   Mon Apr 27 15:58:42 2020 +0200

    build,xsm: fix multiple call
    
    Both script mkflask.sh and mkaccess_vector.sh generates multiple
    files. Exploits the 'multi-target pattern rule' trick to call each
    scripts only once.
    
    Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    master commit: 52f3f319851e40892fbafeae53e512c7d61f03d0
    master date: 2020-04-23 09:59:05 +0200

commit d32cbbc141837600aa74f331c31a06df3777a2fb
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Apr 27 15:57:13 2020 +0200

    x86: validate VM assist value in arch_set_info_guest()
    
    While I can't spot anything that would go wrong, just like the
    respective hypercall only permits applicable bits to be set, we should
    also do so when loading guest context.
    
    Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    master commit: a62c6fe05c4ae905b7d4cb0ca946508b7f96d522
    master date: 2020-04-22 13:01:10 +0200

commit 8d2ea0f4c830a3a6a7e7a19aa4f7d8a9fd854521
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Apr 27 15:55:51 2020 +0200

    x86/HVM: expose VM assist hypercall
    
    In preparation for the addition of VMASST_TYPE_runstate_update_flag
    commit 72c538cca957 ("arm: add support for vm_assist hypercall") enabled
    the hypercall for Arm. I consider it not logical that it then isn't also
    exposed to x86 HVM guests (with the same single feature permitted to be
    enabled as Arm has); Linux actually tries to use it afaict.
    
    Rather than introducing yet another thin wrapper around vm_assist(),
    make that function the main handler, requiring a per-arch
    arch_vm_assist_valid_mask() definition instead.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Julien Grall <jgrall@amazon.com>
    master commit: f13404d57f55a97838f1c16a366fbc3231ec21f1
    master date: 2020-04-22 12:58:25 +0200

commit a6366e0f884db4302354ce7372ece93aeb95207f
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Apr 27 15:54:14 2020 +0200

    x86: Enumeration for Control-flow Enforcement Technology
    
    The CET spec has been published and guest kernels are starting to get support.
    Introduce the CPUID and MSRs, and fully block the MSRs from guest use.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Wei Liu <wl@xen.org>
    master commit: 4803a67114279a656a54a23cebed646da32efeb6
    master date: 2020-04-21 16:52:03 +0100

commit 55d65346d70b779f082b7764480e745cb51e675f
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Mon Apr 27 15:53:26 2020 +0200

    x86/vtd: relax EPT page table sharing check
    
    The EPT page tables can be shared with the IOMMU as long as the page
    sizes supported by EPT are also supported by the IOMMU.
    
    Current code checks that both the IOMMU and EPT support the same page
    sizes, but this is not strictly required, the IOMMU supporting more
    page sizes than EPT is fine and shouldn't block page table sharing.
    
    This is likely not a common case (IOMMU supporting more page sizes
    than EPT), but should still be fixed for correctness.
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Kevin Tian <kevin.tian@intel.com>
    master commit: 3957e12c02670b97855ef0933b373f99993fa598
    master date: 2020-04-21 10:54:56 +0200

commit 6bf8bdd5c66148c991b9e046491956b84fdb0fb5
Author: Harsha Shamsundara Havanur <havanur@amazon.com>
Date:   Mon Apr 27 15:52:45 2020 +0200

    hvmloader: enable MMIO and I/O decode, after all resource allocation
    
    It was observed that PCI MMIO and/or IO BARs were programmed with
    memory and I/O decodes (bits 0 and 1 of PCI COMMAND register) enabled,
    during PCI setup phase. This resulted in incorrect memory mapping as
    soon as the lower half of the 64 bit bar is programmed.
    This displaced any RAM mappings under 4G. After the
    upper half is programmed PCI memory mapping is restored to its
    intended high mem location, but the RAM displaced is not restored.
    The OS then continues to boot and function until it tries to access
    the displaced RAM at which point it suffers a page fault and crashes.
    
    This patch address the issue by deferring enablement of memory and
    I/O decode in command register until all the resources, like interrupts
    I/O and/or MMIO BARs for all the PCI device functions are programmed,
    in the descending order of memory requested.
    
    Signed-off-by: Harsha Shamsundara Havanur <havanur@amazon.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    master commit: a8e0c228c79f3a000e19183090eb41fca173b034
    master date: 2020-04-16 10:58:46 +0200

commit e8032787d44ff9dfe157bda9e7f47e1c58faa973
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Apr 27 15:51:14 2020 +0200

    x86/boot: Fix early exception handling with CONFIG_PERF_COUNTERS
    
    The PERFC_INCR() macro uses current->processor, but current is not valid
    during early boot.  This causes the following crash to occur if
    e.g. rdmsr_safe() has to recover from a #GP fault.
    
      (XEN) Early fatal page fault at e008:ffff82d0803b1a39 (cr2=0000000000000004, ec=0000)
      (XEN) ----[ Xen-4.14-unstable  x86_64  debug=y   Not tainted ]----
      (XEN) CPU:    0
      (XEN) RIP:    e008:[<ffff82d0803b1a39>] x86_64/entry.S#handle_exception_saved+0x64/0xb8
      ...
      (XEN) Xen call trace:
      (XEN)    [<ffff82d0803b1a39>] R x86_64/entry.S#handle_exception_saved+0x64/0xb8
      (XEN)    [<ffff82d0806394fe>] F __start_xen+0x2cd/0x2980
      (XEN)    [<ffff82d0802000ec>] F __high_start+0x4c/0x4e
    
    Furthermore, the PERFC_INCR() macro is wildly inefficient.  There has been a
    single caller for many releases now, so inline it and delete the macro
    completely.
    
    There is no need to reference current at all.  What is actually needed is the
    per_cpu_offset which can be obtained directly from the top-of-stack block.
    This simplifies the counter handling to 3 instructions and no spilling to the
    stack at all.
    
    The same breakage from above is now handled properly:
    
      (XEN) traps.c:1591: GPF (0000): ffff82d0806394fe [__start_xen+0x2cd/0x2980] -> ffff82d0803b3bfb
    
    Reported-by: Julien Grall <jgrall@amazon.com>
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Tested-by: Julien Grall <jgrall@amazon.com>
    master commit: 615bfe42c6d183a0e54a0525ef82b58580d01619
    master date: 2020-04-16 09:48:38 +0100

commit 499a2944d7651acacfb81ac9ec9ef720ca05883b
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Apr 27 15:49:38 2020 +0200

    x86/EFI: also fill boot_tsc_stamp on the xen.efi boot path
    
    Commit e3a379c35eff ("x86/time: always count s_time from Xen boot")
    introducing this missed adjusting this path as well.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Wei Liu <wl@xen.org>
    master commit: 0dbc112e727f6c17f306c864950bdf83dece5cd5
    master date: 2020-04-14 11:42:11 +0200
(qemu changes not included)

