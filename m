Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C511AB0E5
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 21:02:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOnI9-0003Mj-SC; Wed, 15 Apr 2020 19:01:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+yDq=57=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jOnI7-0003MV-TI
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 19:01:43 +0000
X-Inumbo-ID: 87658cad-7f4b-11ea-8ac3-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 87658cad-7f4b-11ea-8ac3-12813bfff9fa;
 Wed, 15 Apr 2020 19:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H007eG7zLZ4obUNGIsBcZ4Ey5MWiYvGGM7z1HnLXD8w=; b=k6cLPmpMui3PX0jN2z6jHAukh
 uW+X/pFdssrTTyEKlreb1pyEcciHB9qijyjfx10LWJbE+Ky9SOalwA9hmMSoymneMvnDXqtXL+XQd
 SX8YMSXC5nwKEDK7WroUgGf4knh5DTdbolLZFSS/OXyzDDaC//JmrGnQbs6nsGXk7/yC0=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jOnHz-0002Wm-SK; Wed, 15 Apr 2020 19:01:35 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jOnHz-0007zR-Gv; Wed, 15 Apr 2020 19:01:35 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jOnHz-00057a-CA; Wed, 15 Apr 2020 19:01:35 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149658-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-upstream-4.13-testing test] 149658: tolerable FAIL - PUSHED
X-Osstest-Failures: qemu-upstream-4.13-testing:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 qemu-upstream-4.13-testing:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 qemu-upstream-4.13-testing:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 qemu-upstream-4.13-testing:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 qemu-upstream-4.13-testing:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 qemu-upstream-4.13-testing:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 qemu-upstream-4.13-testing:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 qemu-upstream-4.13-testing:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 qemu-upstream-4.13-testing:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 qemu-upstream-4.13-testing:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 qemu-upstream-4.13-testing:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 qemu-upstream-4.13-testing:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 qemu-upstream-4.13-testing:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 qemu-upstream-4.13-testing:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 qemu-upstream-4.13-testing:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 qemu-upstream-4.13-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 qemu-upstream-4.13-testing:test-amd64-amd64-xl-rtds:guest-localmigrate/x10:fail:nonblocking
 qemu-upstream-4.13-testing:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 qemu-upstream-4.13-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 qemu-upstream-4.13-testing:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 qemu-upstream-4.13-testing:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 qemu-upstream-4.13-testing:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 qemu-upstream-4.13-testing:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 qemu-upstream-4.13-testing:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 qemu-upstream-4.13-testing:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 qemu-upstream-4.13-testing:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 qemu-upstream-4.13-testing:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 qemu-upstream-4.13-testing:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 qemu-upstream-4.13-testing:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 qemu-upstream-4.13-testing:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 qemu-upstream-4.13-testing:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 qemu-upstream-4.13-testing:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 qemu-upstream-4.13-testing:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 qemu-upstream-4.13-testing:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 qemu-upstream-4.13-testing:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 qemu-upstream-4.13-testing:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 qemu-upstream-4.13-testing:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 qemu-upstream-4.13-testing:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 qemu-upstream-4.13-testing:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 qemu-upstream-4.13-testing:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 qemu-upstream-4.13-testing:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 qemu-upstream-4.13-testing:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 qemu-upstream-4.13-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 qemu-upstream-4.13-testing:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 qemu-upstream-4.13-testing:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 qemu-upstream-4.13-testing:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 qemu-upstream-4.13-testing:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 qemu-upstream-4.13-testing:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
X-Osstest-Versions-This: qemuu=730e2b1927e7d911bbd5350714054ddd5912f4ed
X-Osstest-Versions-That: qemuu=933ebad2470a169504799a1d95b8e410bd9847ef
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 15 Apr 2020 19:01:35 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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

flight 149658 qemu-upstream-4.13-testing real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149658/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-xl-rtds     18 guest-localmigrate/x10       fail   never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop             fail never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop              fail never pass
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop             fail never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass

version targeted for testing:
 qemuu                730e2b1927e7d911bbd5350714054ddd5912f4ed
baseline version:
 qemuu                933ebad2470a169504799a1d95b8e410bd9847ef

Last test of basis   144391  2019-11-29 15:07:52 Z  138 days
Testing same since   149658  2020-04-14 18:08:38 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Adrian Moreno <amorenoz@redhat.com>
  Alberto Garcia <berto@igalia.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Aurelien Jarno <aurelien@aurel32.net>
  Boris Fiuczynski <fiuczy@linux.ibm.com>
  Christian Borntraeger <borntraeger@de.ibm.com>
  Christophe Lyon <christophe.lyon@linaro.org>
  Cornelia Huck <cohuck@redhat.com>
  Daniel P. Berrangé <berrange@redhat.com>
  David Hildenbrand <david@redhat.com>
  Dr. David Alan Gilbert <dgilbert@redhat.com>
  Eduardo Habkost <ehabkost@redhat.com>
  Fan Yang <Fan_Yang@sjtu.edu.cn>
  Gerd Hoffmann <kraxel@redhat.com>
  Guoyi Tu <tu.guoyi@h3c.com>
  Hikaru Nishida <hikarupsp@gmail.com>
  Igor Mammedov <imammedo@redhat.com>
  Jason Wang <jasowang@redhat.com>
  Johannes Berg <johannes.berg@intel.com>
  John Snow <jsnow@redhat.com>
  Kevin Wolf <kwolf@redhat.com>
  Markus Armbruster <armbru@redhat.com>
  Matthew Rosato <mjrosato@linux.ibm.com>
  Max Filippov <jcmvbkbc@gmail.com>
  Max Reitz <mreitz@redhat.com>
  Maxim Levitsky <mlevitsk@redhat.com>
  Michael Roth <mdroth@linux.vnet.ibm.com>
  Michael S. Tsirkin <mst@redhat.com>
  Michael Weiser <michael.weiser@gmx.de>
  Mikhail Sennikovsky <mikhail.sennikovskii@cloud.ionos.com>
  Nir Soffer <nirsof@gmail.com>
  Nir Soffer <nsoffer@redhat.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Paul Durrant <paul.durrant@citrix.com>
  Paul Durrant <pdurrant@amazon.com>
  Peter Krempa <pkrempa@redhat.com>
  Peter Lieven <pl@kamp.de>
  Peter Maydell <peter.maydell@linaro.org>
  Peter Xu <peterx@redhat.com>
  Philippe Mathieu-Daudé <philmd@redhat.com>
  Prasad J Pandit <pjp@fedoraproject.org>
  Richard Henderson <richard.henderson@linaro.org>
  Sergio Lopez <slp@redhat.com>
  Stefan Hajnoczi <stefanha@redhat.com>
  Stefano Garzarella <sgarzare@redhat.com>
  Thomas Huth <thuth@redhat.com>
  Tuguoyi <tu.guoyi@h3c.com>
  Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
  Wei Yang <richardw.yang@linux.intel.com>

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
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
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
 test-amd64-amd64-qemuu-nested-intel                          pass    
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
 test-amd64-amd64-xl-rtds                                     fail    
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


Pushing revision :

To xenbits.xen.org:/home/xen/git/qemu-xen.git
   933ebad247..730e2b1927  730e2b1927e7d911bbd5350714054ddd5912f4ed -> stable-4.13

