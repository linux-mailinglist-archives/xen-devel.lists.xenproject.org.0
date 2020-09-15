Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD80526A25D
	for <lists+xen-devel@lfdr.de>; Tue, 15 Sep 2020 11:37:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kI7OH-0004gx-UT; Tue, 15 Sep 2020 09:36:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e2Gj=CY=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kI7OG-0004gR-SX
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2020 09:36:44 +0000
X-Inumbo-ID: f7072ce8-7977-473d-989c-776498eac2de
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f7072ce8-7977-473d-989c-776498eac2de;
 Tue, 15 Sep 2020 09:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=3lThqzdMvxsqGXUlSSgKR9vcRC/HxEdcbuionxudELw=; b=VaVSi8aPJZi/J/fP3aWY7Nm7qn
 JpAFG2tcJLUj/SREKZHSvNeWlZai12AUJ+Sezmg5ueXF8aeeLk3CNFZOdQM1QrLkH25s0XTsmXyOk
 CSezFPIJ5dX+6eLusXxHUSVRnmc0RGgEG43+147Geo/xM6sCVyyxq1ZyOKwJSe+thLg8=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kI7OC-0006T4-Kg; Tue, 15 Sep 2020 09:36:40 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kI7OC-0006ce-Ag; Tue, 15 Sep 2020 09:36:40 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kI7OC-00012E-AC; Tue, 15 Sep 2020 09:36:40 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-154122-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-4.13-testing test] 154122: trouble: fail/pass/preparing
X-Osstest-Failures: xen-4.13-testing:test-armhf-armhf-xl-credit2:hosts-allocate:running:regression
 xen-4.13-testing:test-amd64-amd64-dom0pvh-xl-amd:hosts-allocate:running:regression
 xen-4.13-testing:test-amd64-coresched-amd64-xl:hosts-allocate:running:regression
 xen-4.13-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 xen-4.13-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 xen-4.13-testing:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 xen-4.13-testing:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 xen-4.13-testing:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 xen-4.13-testing:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 xen-4.13-testing:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-4.13-testing:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 xen-4.13-testing:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 xen-4.13-testing:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 xen-4.13-testing:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 xen-4.13-testing:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 xen-4.13-testing:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-4.13-testing:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 xen-4.13-testing:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 xen-4.13-testing:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-4.13-testing:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 xen-4.13-testing:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 xen-4.13-testing:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 xen-4.13-testing:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 xen-4.13-testing:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 xen-4.13-testing:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-4.13-testing:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 xen-4.13-testing:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 xen-4.13-testing:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 xen-4.13-testing:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 xen-4.13-testing:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 xen-4.13-testing:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 xen-4.13-testing:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 xen-4.13-testing:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 xen-4.13-testing:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 xen-4.13-testing:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 xen-4.13-testing:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 xen-4.13-testing:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 xen-4.13-testing:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 xen-4.13-testing:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 xen-4.13-testing:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 xen-4.13-testing:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 xen-4.13-testing:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 xen-4.13-testing:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 xen-4.13-testing:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 xen-4.13-testing:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 xen-4.13-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 xen-4.13-testing:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 xen-4.13-testing:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 xen-4.13-testing:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 xen-4.13-testing:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 xen-4.13-testing:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 xen-4.13-testing:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
X-Osstest-Versions-This: xen=c663fa577b42e7f4731bb33fc7f94f7ffb05a1ef
X-Osstest-Versions-That: xen=9b367b2b0b714f3ffb69ed6be0a118e8d3eac07f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 15 Sep 2020 09:36:40 +0000
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

flight 154122 xen-4.13-testing running [real]
http://logs.test-lab.xenproject.org/osstest/logs/154122/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl-credit2   2 hosts-allocate               running
 test-amd64-amd64-dom0pvh-xl-amd  2 hosts-allocate               running
 test-amd64-coresched-amd64-xl  2 hosts-allocate               running

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop              fail never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop             fail never pass
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop             fail never pass
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop             fail never pass
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop             fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop              fail never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass

version targeted for testing:
 xen                  c663fa577b42e7f4731bb33fc7f94f7ffb05a1ef
baseline version:
 xen                  9b367b2b0b714f3ffb69ed6be0a118e8d3eac07f

Last test of basis   152528  2020-08-07 15:39:16 Z   38 days
Testing same since                          (not found)         0 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
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
 test-amd64-coresched-amd64-xl                                preparing
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
 test-amd64-amd64-dom0pvh-xl-amd                              preparing
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
 test-armhf-armhf-xl-credit2                                  preparing
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
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
commit c663fa577b42e7f4731bb33fc7f94f7ffb05a1ef
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Sep 11 14:53:37 2020 +0200

    x86/pv: Rewrite segment context switching from scratch
    
    There are multiple bugs with the existing implementation.
    
    On AMD CPUs prior to Zen2, loading a NUL segment selector doesn't clear the
    segment base, which is a problem for 64bit code which typically expects to use
    a NUL %fs/%gs selector.
    
    On a context switch from any PV vcpu, to a 64bit PV vcpu with an %fs/%gs
    selector which faults, the fixup logic loads NUL, and the guest is entered at
    the failsafe callback with the stale base.
    
    Alternatively, a PV context switch sequence of 64 (NUL, non-zero base) =>
    32 (NUL) => 64 (NUL, zero base) will similarly cause Xen to enter the guest
    with a stale base.
    
    Both of these corner cases manifest as state corruption in the final vcpu.
    However, damage is limited to to 64bit code expecting to use Thread Local
    Storage with a base pointer of 0, which doesn't occur by default.
    
    The context switch logic is extremely complicated, and is attempting to
    optimise away loading a NUL selector (which is fast), or writing a 64bit base
    of 0 (which is rare).  Furthermore, it fails to respect Linux's ABI with
    userspace, which manifests as userspace state corruption as far as Linux is
    concerned.
    
    Always restore all selector and base state, in all cases.
    
    Leave a large comment explaining hardware behaviour, and the new ABI
    expectations.  Update the comments in the public headers.
    
    Drop all "segment preloading" to handle the AMD corner case.  It was never
    anything but a waste of time for %ds/%es, and isn't needed now that %fs/%gs
    bases are unconditionally written for 64bit PV guests.  In load_segments(),
    store the result of is_pv_32bit_vcpu() as it is an expensive predicate now,
    and not used in a way which impacts speculative safety.
    
    Reported-by: Andy Lutomirski <luto@kernel.org>
    Reported-by: Sarah Newman <srn@prgmr.com>
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    
    x86/pv: Fix assertions in svm_load_segs()
    
    OSSTest has shown an assertion failure:
    http://logs.test-lab.xenproject.org/osstest/logs/153906/test-xtf-amd64-amd64-1/serial-rimava1.log
    
    This is because we pass a non-NUL selector into svm_load_segs(), which is
    something we must not do, as this path does not load the attributes/limits
    from the GDT/LDT.
    
    Drop the {fs,gs}_sel parameters from svm_load_segs() and use 0 instead.  This
    is acceptable even for non-zero NUL segments, as it is how the IRET
    instruction behaves in all CPUs.
    
    Only use the svm_load_segs() path when both FS and GS are NUL, which is the
    common case when scheduling a 64bit vcpu with 64bit userspace in context.
    
    Fixes: ad0fd291c5 ("x86/pv: Rewrite segment context switching from scratch")
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    master commit: ad0fd291c5e79191c2e3c70e43dded569f11a450
    master date: 2020-09-07 11:32:34 +0100
    master commit: 1e2d3be2e516e6f415ca6029f651b76a8563a27c
    master date: 2020-09-08 16:46:31 +0100

commit 761e8df102594da97cc32a895daa44386ee9476e
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Sep 11 14:52:35 2020 +0200

    x86/pv: Fix consistency of 64bit segment bases
    
    The comments in save_segments(), _toggle_guest_pt() and write_cr() are false.
    The %fs and %gs bases can be updated at any time by the guest.
    
    As a consequence, Xen's fs_base/etc tracking state is always stale when the
    vcpu is in context, and must not be used to complete MSR_{FS,GS}_BASE reads, etc.
    
    In particular, a sequence such as:
    
      wrmsr(MSR_FS_BASE, 0x1ull << 32);
      write_fs(__USER_DS);
      base = rdmsr(MSR_FS_BASE);
    
    will return the stale base, not the new base.  This may cause guest a guest
    kernel's context switching of userspace to malfunction.
    
    Therefore:
     * Update save_segments(), _toggle_guest_pt() and read_msr() to always read
       the segment bases from hardware.
     * Update write_cr(), write_msr() and do_set_segment_base() to not not waste
       time caching data which is instantly going to become stale again.
     * Provide comments explaining when the tracking state is and isn't stale.
    
    This bug has been present for 14 years, but several bugfixes since have built
    on and extended the original flawed logic.
    
    Fixes: ba9adb737ba ("Apply stricter checking to RDMSR/WRMSR emulations.")
    Fixes: c42494acb2f ("x86: fix FS/GS base handling when using the fsgsbase feature")
    Fixed: eccc170053e ("x86/pv: Don't have %cr4.fsgsbase active behind a guest kernels back")
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    master commit: a5eaac9245f4f382a3cd0e9710e9d1cba7db20e4
    master date: 2020-09-07 11:32:34 +0100

commit 64690393a81c96296dbde5b865460144a86290c3
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Sep 11 14:51:43 2020 +0200

    x86/pv: Fix multiple bugs with SEGBASE_GS_USER_SEL
    
    The logic takes the segment selector unmodified from guest context.  This
    allowed the guest to load DPL0 descriptors into %gs.  Fix up the RPL for
    non-NUL selectors to be 3.
    
    Xen's context switch logic skips saving the inactive %gs base, as it cannot be
    modified by the guest behind Xen's back.  This depends on Xen caching updates
    to the inactive base, which is was missing from this path.
    
    The consequence is that, following SEGBASE_GS_USER_SEL, the next context
    switch will restore the stale inactive %gs base, and corrupt vcpu state.
    
    Rework the hypercall to update the cached idea of gs_base_user, and fix the
    behaviour in the case of the AMD NUL selector bug to always zero the segment
    base.
    
    Reported-by: Andy Lutomirski <luto@kernel.org>
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    master commit: afe018e041ec112d90a8b4e6ed607d22aa06f280
    master date: 2020-08-31 14:21:46 +0100

commit b9083432f1d40ff1b7b8b9a849a8ec54c4b23c88
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Sep 11 14:51:08 2020 +0200

    x86/intel: Expose MSR_ARCH_CAPS to dom0
    
    The overhead of (the lack of) MDS_NO alone has been measured at 30% on some
    workloads.  While we're not in a position yet to offer MSR_ARCH_CAPS generally
    to guests, dom0 doesn't migrate, so we can pass a subset of hardware values
    straight through.
    
    This will cause PVH dom0's not to use KPTI by default, and all dom0's not to
    use VERW flushing by default, and to use eIBRS in preference to retpoline on
    recent Intel CPUs.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    master commit: e46474278a0e87e2b32ad5dd5fc20e8d2cb0688b
    master date: 2020-08-31 13:43:26 +0100

commit ac4ec487e086dc9ed00f1c230df8f1621e536c5a
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Sep 11 14:50:26 2020 +0200

    x86: Begin to introduce support for MSR_ARCH_CAPS
    
    ... including serialisation/deserialisation logic and unit tests.
    
    There is no current way to configure this MSR correctly for guests.
    The toolstack side this logic needs building, which is far easier to
    do with it in place.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    master commit: e32605b07ef2e01c9d05da9b2d5d7b8f9a5c7c1b
    master date: 2020-08-27 12:48:46 +0100

commit a7f0434093f52768e333b64b73c1b02fa0b310fb
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Fri Sep 11 14:49:52 2020 +0200

    x86: use constant flags for section .init.rodata
    
    LLVM 11 complains with:
    
    <instantiation>:1:1: error: changed section flags for .init.rodata, expected: 0x2
    .pushsection .init.rodata
    ^
    <instantiation>:30:9: note: while in macro instantiation
            entrypoint 0
            ^
    entry.S:979:9: note: while in macro instantiation
            .rept 256
            ^
    
    And:
    
    entry.S:1015:9: error: changed section flags for .init.rodata, expected: 0x2
            .section .init.rodata
            ^
    
    Fix it by explicitly using the same flags and type in all the
    instances.
    
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
    master commit: d2770047a277ccdc7924fb99d1b051eeb0d5a90f
    master date: 2020-08-27 09:53:46 +0200

commit 0861885b5f88213ac393053f496b98f05085577c
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Sep 11 14:48:57 2020 +0200

    x86/ioapic: Fix fixmap error path logic in ioapic_init_mappings()
    
    In the case that bad_ioapic_register() fails, the current position of idx++
    means that clear_fixmap(idx) will be called with the wrong index, and not
    clean up the mapping just created.
    
    Increment idx as part of the loop, rather than midway through the loop body.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    master commit: b4175c6693e089ffcd77cd1ea388e76e67d36d57
    master date: 2020-08-05 17:35:11 +0100
(qemu changes not included)

