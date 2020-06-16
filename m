Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBEE1FBFBE
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 22:12:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlHvW-0002wZ-5u; Tue, 16 Jun 2020 20:11:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hdra=75=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jlHvV-0002w7-A4
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 20:11:21 +0000
X-Inumbo-ID: 87a6fd48-b00d-11ea-bca7-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 87a6fd48-b00d-11ea-bca7-bc764e2007e4;
 Tue, 16 Jun 2020 20:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eZS8zH6HiF4/jh+lKZhYJEev/Br5SI+LOu/9kN0OiFs=; b=FadgZW5InN3ERrigELjff2hKW
 1tNDztsm1PaD8XHx4RTDx9cExNgK01544lRIkZSxL50wVP9JbaFrGiz6vg8LJKfB/ErQZ78t+y+7R
 PTcl3HfxMZDIl4iY67U1llwfUPYhsSYz07bg7dV9hBdOamt3m9UQltJ30PdAMDf8mJV7w=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jlHvO-0006Ly-Bc; Tue, 16 Jun 2020 20:11:14 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jlHvN-0005Fl-MA; Tue, 16 Jun 2020 20:11:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jlHvN-0000Dt-LV; Tue, 16 Jun 2020 20:11:13 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151149-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 151149: regressions - FAIL
X-Osstest-Failures: qemu-mainline:test-amd64-amd64-qemuu-nested-intel:xen-boot/l1:fail:regression
 qemu-mainline:test-amd64-amd64-qemuu-nested-amd:xen-boot/l1:fail:regression
 qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:windows-install:fail:regression
 qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:windows-install:fail:regression
 qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:windows-install:fail:regression
 qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:windows-install:fail:regression
 qemu-mainline:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
 qemu-mainline:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: qemuu=7d3660e79830a069f1848bb4fa1cdf8f666424fb
X-Osstest-Versions-That: qemuu=9e3903136d9acde2fb2dd9e967ba928050a6cb4a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 16 Jun 2020 20:11:13 +0000
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

flight 151149 qemu-mainline real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151149/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-qemuu-nested-intel 14 xen-boot/l1       fail REGR. vs. 151065
 test-amd64-amd64-qemuu-nested-amd 14 xen-boot/l1         fail REGR. vs. 151065
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 10 debian-hvm-install fail REGR. vs. 151065
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 10 debian-hvm-install fail REGR. vs. 151065
 test-amd64-amd64-xl-qemuu-win7-amd64 10 windows-install  fail REGR. vs. 151065
 test-amd64-i386-xl-qemuu-win7-amd64 10 windows-install   fail REGR. vs. 151065
 test-amd64-amd64-xl-qemuu-ws16-amd64 10 windows-install  fail REGR. vs. 151065
 test-amd64-i386-xl-qemuu-ws16-amd64 10 windows-install   fail REGR. vs. 151065

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 151065
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 151065
 test-armhf-armhf-xl-rtds     16 guest-start/debian.repeat    fail  like 151065
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass

version targeted for testing:
 qemuu                7d3660e79830a069f1848bb4fa1cdf8f666424fb
baseline version:
 qemuu                9e3903136d9acde2fb2dd9e967ba928050a6cb4a

Last test of basis   151065  2020-06-12 22:27:51 Z    3 days
Testing same since   151101  2020-06-14 08:32:51 Z    2 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alex Bennée <alex.bennee@linaro.org>
  Alex Williamson <alex.williamson@redhat.com>
  Alexander Bulekov <alxndr@bu.edu>
  Anthony PERARD <anthony.perard@citrix.com>
  Babu Moger <babu.moger@amd.com>
  Cathy Zhang <cathy.zhang@intel.com>
  Colin Xu <colin.xu@intel.com>
  Cédric Le Goater <clg@kaod.org>
  David Carlier <devnexen@gmail.com>
  David Gibson <david@gibson.dropbear.id.au>
  Edgar E. Iglesias <edgar.iglesias@xilinx.com>
  Eric Auger <eric.auger@redhat.com>
  Evgeny Yakovlev <eyakovlev@virtuozzo.com>
  Igor Mammedov <imammedo@redhat.com>
  Janne Grunau <j@jannau.net>
  Jon Doron <arilou@gmail.com>
  Joseph Myers <joseph@codesourcery.com>
  Julio Faracco <jcfaracco@gmail.com>
  Leonid Bloch <lb.workbox@gmail.com>
  Leonid Bloch <lbloch@janustech.com>
  Like Xu <like.xu@linux.intel.com>
  Liran Alon <liran.alon@oracle.com>
  Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
  Markus Armbruster <armbru@redhat.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Michael S. Tsirkin <mst@redhat.com>
  Pan Nengyuan <pannengyuan@huawei.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Pavel Dovgalyuk <Pavel.Dovgaluk@gmail.com>
  Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>
  Peter Maydell <peter.maydell@linaro.org>
  Peter Xu <peterx@redhat.com>
  Philippe Mathieu-Daudé <f4bug@amsat.org>
  Philippe Mathieu-Daudé <philmd@redhat.com>
  Prasad J Pandit <pjp@fedoraproject.org>
  Roman Bolshakov <r.bolshakov@yadro.com>
  Roman Kagan <rkagan@virtuozzo.com>
  Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
  Thomas Huth <thuth@redhat.com>
  WangBowen <bowen.wang@intel.com>
  Wei Huang <wei.huang2@amd.com>

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
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 fail    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  fail    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
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
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          fail    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
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

(No revision log; it would be 2277 lines long.)

