Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9032509A5
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 21:52:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAIUa-00048K-2M; Mon, 24 Aug 2020 19:50:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z2P5=CC=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kAIUY-000480-Bx
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 19:50:54 +0000
X-Inumbo-ID: badc7aef-6f2f-4b67-9d9c-65e2b856ada5
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id badc7aef-6f2f-4b67-9d9c-65e2b856ada5;
 Mon, 24 Aug 2020 19:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=zSp03TSB7sNg9P+vwfs4zlev785KGiou2gTQjVDYJVM=; b=vrbiaDcgaubkoqYu2b8HupDkpE
 /TpTqk3D7egg91UhbOpE0UyRsWxUP35CRoWTMsnII6oBoL848nT4sFfS/gZ+Twb1k1RIb8kA8MYX8
 NA6Io8B/NWyat8Yz2B6b0dXCRFpC8I8oybyTup5hswFe4i/qZrg589qDqFITlb60acJ4=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kAIUQ-0002uk-M7; Mon, 24 Aug 2020 19:50:46 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kAIUQ-0004Z9-Ec; Mon, 24 Aug 2020 19:50:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kAIUQ-00076a-Dt; Mon, 24 Aug 2020 19:50:46 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152726-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 152726: regressions - FAIL
X-Osstest-Failures: qemu-mainline:test-amd64-i386-qemuu-rhel6hvm-amd:redhat-install:fail:regression
 qemu-mainline:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-i386-qemuu-rhel6hvm-intel:redhat-install:fail:regression
 qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:windows-install:fail:regression
 qemu-mainline:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-i386-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-amd64:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:windows-install:fail:regression
 qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:windows-install:fail:regression
 qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:windows-install:fail:regression
 qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64:debian-hvm-install:fail:regression
 qemu-mainline:test-arm64-arm64-libvirt-xsm:guest-start:fail:regression
 qemu-mainline:test-armhf-armhf-xl-vhd:debian-di-install:fail:regression
 qemu-mainline:test-amd64-amd64-qemuu-nested-intel:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-amd64-libvirt-vhd:guest-start:fail:regression
 qemu-mainline:test-amd64-amd64-xl-qcow2:debian-di-install:fail:regression
 qemu-mainline:test-amd64-amd64-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
 qemu-mainline:test-armhf-armhf-libvirt:guest-start:fail:regression
 qemu-mainline:test-armhf-armhf-libvirt-raw:debian-di-install:fail:regression
 qemu-mainline:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: qemuu=8367a77c4d3f6e1e60890f5510304feb2c621611
X-Osstest-Versions-That: qemuu=1d806cef0e38b5db8347a8e12f214d543204a314
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 24 Aug 2020 19:50:46 +0000
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

flight 152726 qemu-mainline real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152726/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-qemuu-rhel6hvm-amd 10 redhat-install     fail REGR. vs. 152631
 test-amd64-amd64-qemuu-nested-amd 10 debian-hvm-install  fail REGR. vs. 152631
 test-amd64-i386-qemuu-rhel6hvm-intel 10 redhat-install   fail REGR. vs. 152631
 test-amd64-amd64-xl-qemuu-win7-amd64 10 windows-install  fail REGR. vs. 152631
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 10 debian-hvm-install fail REGR. vs. 152631
 test-amd64-i386-xl-qemuu-ovmf-amd64 10 debian-hvm-install fail REGR. vs. 152631
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 10 debian-hvm-install fail REGR. vs. 152631
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow 10 debian-hvm-install fail REGR. vs. 152631
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 10 debian-hvm-install fail REGR. vs. 152631
 test-amd64-i386-xl-qemuu-debianhvm-amd64 10 debian-hvm-install fail REGR. vs. 152631
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 10 debian-hvm-install fail REGR. vs. 152631
 test-amd64-i386-xl-qemuu-win7-amd64 10 windows-install   fail REGR. vs. 152631
 test-amd64-i386-xl-qemuu-ws16-amd64 10 windows-install   fail REGR. vs. 152631
 test-amd64-amd64-xl-qemuu-ws16-amd64 10 windows-install  fail REGR. vs. 152631
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 10 debian-hvm-install fail REGR. vs. 152631
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 10 debian-hvm-install fail REGR. vs. 152631
 test-arm64-arm64-libvirt-xsm 12 guest-start              fail REGR. vs. 152631
 test-armhf-armhf-xl-vhd      10 debian-di-install        fail REGR. vs. 152631
 test-amd64-amd64-qemuu-nested-intel 10 debian-hvm-install fail REGR. vs. 152631
 test-amd64-amd64-libvirt-vhd 11 guest-start              fail REGR. vs. 152631
 test-amd64-amd64-xl-qcow2    10 debian-di-install        fail REGR. vs. 152631
 test-amd64-amd64-xl-qemuu-ovmf-amd64 10 debian-hvm-install fail REGR. vs. 152631
 test-armhf-armhf-libvirt     12 guest-start              fail REGR. vs. 152631
 test-armhf-armhf-libvirt-raw 10 debian-di-install        fail REGR. vs. 152631

Tests which did not succeed, but are not blocking:
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass

version targeted for testing:
 qemuu                8367a77c4d3f6e1e60890f5510304feb2c621611
baseline version:
 qemuu                1d806cef0e38b5db8347a8e12f214d543204a314

Last test of basis   152631  2020-08-20 09:07:46 Z    4 days
Failing since        152659  2020-08-21 14:07:39 Z    3 days    6 attempts
Testing same since   152712  2020-08-23 23:07:32 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alistair Francis <alistair.francis@wdc.com>
  Alistair Francis <alistair.francis@xilinx.com>
  Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
  Bin Meng <bin.meng@windriver.com>
  Christian Borntraeger <borntraeger@de.ibm.com>
  Cornelia Huck <cohuck@redhat.com>
  Daniel P. Berrangé <berrange@redhat.com>
  David Gibson <david@gibson.dropbear.id.au>
  Eduardo Habkost <ehabkost@redhat.com>
  Eric Blake <eblake@redhat.com>
  Filip Bozuta <Filip.Bozuta@syrmia.com>
  Gerd Hoffmann <kraxel@redhat.com>
  Hongzheng-Li <Ethan.Lee.QNL@gmail.com>
  Hou Weiying <weiying_hou@outlook.com>
  Laurent Vivier <laurent@vivier.eu>
  LIU Zhiwei <zhiwei_liu@c-sky.com>
  Marc-André Lureau <marcandre.lureau@redhat.com>
  Max Reitz <mreitz@redhat.com>
  Michal Privoznik <mprivozn@redhat.com>
  Myriad-Dreamin <camiyoru@gmail.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Peter Maydell <peter.maydell@linaro.org>
  Philippe Mathieu-Daudé <f4bug@amsat.org>
  Philippe Mathieu-Daudé <philmd@redhat.com>
  Richard Henderson <richard.henderson@linaro.org>
  Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
  Stefan Hajnoczi <stefanha@redhat.com>
  Stefano Garzarella <sgarzare@redhat.com>
  Thomas Huth <thuth@redhat.com>
  Zong Li <zong.li@sifive.com>

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
 test-arm64-arm64-libvirt-xsm                                 fail    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           fail    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    fail    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     fail    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         fail    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          fail    
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
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        fail    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         fail    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          fail    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         fail    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     fail    
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
 test-amd64-amd64-xl-qcow2                                    fail    
 test-armhf-armhf-libvirt-raw                                 fail    
 test-amd64-i386-xl-raw                                       pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             fail    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              fail    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 fail    
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

(No revision log; it would be 3398 lines long.)

