Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB2A6C52EF
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 18:45:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513562.794749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pf2WT-0001xf-A8; Wed, 22 Mar 2023 17:45:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513562.794749; Wed, 22 Mar 2023 17:45:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pf2WT-0001ug-6X; Wed, 22 Mar 2023 17:45:17 +0000
Received: by outflank-mailman (input) for mailman id 513562;
 Wed, 22 Mar 2023 17:45:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pf2WR-0001uW-Dg; Wed, 22 Mar 2023 17:45:15 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pf2WR-0004d7-A2; Wed, 22 Mar 2023 17:45:15 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pf2WQ-0002XP-IK; Wed, 22 Mar 2023 17:45:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pf2WQ-0007Aj-Hu; Wed, 22 Mar 2023 17:45:14 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=RRnqa0rFyUkWsOZFV+YhBO5YcvhK3ZBj2sMoLalNwYc=; b=R1VNX0+dCyRDUZH/fFunTolrwU
	BsrijGd2qdYi0qC8w/OdLSVTbwedP3nZpPx/HIoZLopDDxGbIHfRfYseWBu6xfwwL4tIxqDzI1iZ2
	+pkTvTx5cQ8FsPUKGF9H2CvjmJgJLZcbsxGJ3vwf36fygQo66y7LXeZo6IQ7w82HKsCc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-179847-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 179847: regressions - trouble: fail/pass/starved
X-Osstest-Failures:
    qemu-mainline:test-amd64-i386-libvirt:guest-start:fail:regression
    qemu-mainline:test-amd64-amd64-xl-qcow2:debian-di-install:fail:regression
    qemu-mainline:test-amd64-i386-libvirt-xsm:guest-start:fail:regression
    qemu-mainline:test-amd64-i386-libvirt-pair:guest-start/debian:fail:regression
    qemu-mainline:test-amd64-i386-libvirt-raw:debian-di-install:fail:regression
    qemu-mainline:test-arm64-arm64-libvirt-xsm:guest-start:fail:regression
    qemu-mainline:test-amd64-amd64-libvirt-vhd:debian-di-install:fail:regression
    qemu-mainline:test-amd64-i386-xl-vhd:debian-di-install:fail:regression
    qemu-mainline:test-amd64-amd64-libvirt:guest-start:fail:regression
    qemu-mainline:test-amd64-amd64-libvirt-xsm:guest-start:fail:regression
    qemu-mainline:test-arm64-arm64-libvirt-raw:debian-di-install:fail:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:debian-hvm-install:fail:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:debian-hvm-install:fail:regression
    qemu-mainline:test-arm64-arm64-xl-vhd:debian-di-install:fail:regression
    qemu-mainline:test-amd64-amd64-libvirt-pair:guest-start/debian:fail:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:build-check(1):starved:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:build-check(1):starved:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:build-check(1):starved:nonblocking
    qemu-mainline:test-armhf-armhf-xl:build-check(1):starved:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:build-check(1):starved:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:build-check(1):starved:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:build-check(1):starved:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:build-check(1):starved:nonblocking
    qemu-mainline:build-armhf-libvirt:build-check(1):starved:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:build-check(1):starved:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:build-check(1):starved:nonblocking
    qemu-mainline:build-armhf:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    qemuu=42d55ab1706912bd21c916dc818279f113ae2791
X-Osstest-Versions-That:
    qemuu=7b0f0aa55fd292fa3489755a3a896e496c51ea86
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 22 Mar 2023 17:45:14 +0000

flight 179847 qemu-mainline real [real]
http://logs.test-lab.xenproject.org/osstest/logs/179847/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-libvirt      14 guest-start              fail REGR. vs. 179518
 test-amd64-amd64-xl-qcow2    12 debian-di-install        fail REGR. vs. 179518
 test-amd64-i386-libvirt-xsm  14 guest-start              fail REGR. vs. 179518
 test-amd64-i386-libvirt-pair 25 guest-start/debian       fail REGR. vs. 179518
 test-amd64-i386-libvirt-raw  12 debian-di-install        fail REGR. vs. 179518
 test-arm64-arm64-libvirt-xsm 14 guest-start              fail REGR. vs. 179518
 test-amd64-amd64-libvirt-vhd 12 debian-di-install        fail REGR. vs. 179518
 test-amd64-i386-xl-vhd       12 debian-di-install        fail REGR. vs. 179518
 test-amd64-amd64-libvirt     14 guest-start              fail REGR. vs. 179518
 test-amd64-amd64-libvirt-xsm 14 guest-start              fail REGR. vs. 179518
 test-arm64-arm64-libvirt-raw 12 debian-di-install        fail REGR. vs. 179518
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 12 debian-hvm-install fail REGR. vs. 179518
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 12 debian-hvm-install fail REGR. vs. 179518
 test-arm64-arm64-xl-vhd      12 debian-di-install        fail REGR. vs. 179518
 test-amd64-amd64-libvirt-pair 25 guest-start/debian      fail REGR. vs. 179518

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 179518
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 179518
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 179518
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 179518
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 179518
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-libvirt      1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt-qcow2  1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               starved  n/a
 test-armhf-armhf-xl           1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-credit1   1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-multivcpu  1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-rtds      1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-vhd       1 build-check(1)               starved  n/a
 build-armhf-libvirt           1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-cubietruck  1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-credit2   1 build-check(1)               starved  n/a
 build-armhf                   2 hosts-allocate               starved  n/a

version targeted for testing:
 qemuu                42d55ab1706912bd21c916dc818279f113ae2791
baseline version:
 qemuu                7b0f0aa55fd292fa3489755a3a896e496c51ea86

Last test of basis   179518  2023-03-09 10:37:19 Z   13 days
Failing since        179526  2023-03-10 01:53:40 Z   12 days   21 attempts
Testing same since   179847  2023-03-21 14:52:57 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Akihiko Odaki <akihiko.odaki@daynix.com>
  Albert Esteve <aesteve@redhat.com>
  Alex Bennée <alex.bennee@linaro.org>
  Alex Williamson <alex.williamson@redhat.com>
  Alistair Francis <alistair.francis@wdc.com>
  Andreas Schwab <schwab@suse.de>
  Anton Johansson <anjo@rev.ng>
  Avihai Horon <avihaih@nvidia.com>
  BALATON Zoltan <balaton@eik.bme.hu>
  Bernhard Beschow <shentey@gmail.com>
  Carlos López <clopez@suse.de>
  Cédric Le Goater <clg@kaod.org>
  Cédric Le Goater <clg@redhat.com>
  Damien Hedde <damien.hedde@dahe.fr>
  Daniel P. Berrangé <berrange@redhat.com>
  David Hildenbrand <david@redhat.com>
  David Woodhouse <dwmw2@infradead.org>
  David Woodhouse <dwmw@amazon.co.uk>
  Dr. David Alan Gilbert <dgilbert@redhat.com>
  Erico Nunes <ernunes@redhat.com>
  Eugenio Pérez <eperezma@redhat.com>
  Fabiano Rosas <farosas@suse.de>
  Fan Ni <fan.ni@samsung.com>
  fanwenjie <fanwj@mail.ustc.edu.cn>
  fanwj@mail.ustc.edu.cn <fanwj@mail.ustc.edu.cn>
  Fiona Ebner <f.ebner@proxmox.com>
  Gal Hammer <gal.hammer@sap.com>
  Gerd Hoffmann <kraxel@redhat.com>
  Hanna Czenczek <hreitz@redhat.com>
  Helge Deller <deller@gmx.de>
  Idan Horowitz <idan.horowitz@gmail.com>
  Igor Mammedov <imammedo@redhat.com>
  Ilya Leoshkevich <iii@linux.ibm.com>
  Ivan Klokov <ivan.klokov@syntacore.com>
  Jared Rossi <jrossi@linux.ibm.com>
  Jason Wang <jasowang@redhat.com>
  Jiaxun Yang <jiaxun.yang@flygoat.com>
  Joao Martins <joao.m.martins@oracle.com>
  John Snow <jsnow@redhat.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Juan Quintela <quintela@redhat.com>
  Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
  Kevin Wolf <kwolf@redhat.com>
  Kfir Manor <kfir@daynix.com>
  Konstantin Kostiuk <kkostiuk@redhat.com>
  Laurent Vivier <laurent@vivier.eu>
  Lei Yang <leiyang@redhat.com>
  Li Zhijian <lizhijian@fujitsu.com>
  Mads Ynddal <m.ynddal@samsung.com>
  Marc-André Lureau <marcandre.lureau@redhat.com>
  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
  Marcin Nowakowski <marcin.nowakowski@fungible.com>
  Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
  Markus Armbruster <armbru@redhat.com>
  Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
  Mathis Marion <mathis.marion@silabs.com>
  Max Filippov <jcmvbkbc@gmail.com>
  Michael S. Tsirkin <mst@redhat.com>
  Mikhail Tyutin <m.tyutin@yadro.com>
  Miroslav Rezanina <mrezanin@redhat.com>
  Nina Schoetterl-Glausch <nsg@linux.ibm.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Paul Durrant <paul@xen.org>
  Paul Durrant <pdurrant@amazon.com>
  Peter Maydell <peter.maydell@linaro.org>
  Peter Xu <peterx@redhat.com>
  Philippe Mathieu-Daudé <philmd@linaro.org>
  Rene Engel <ReneEngel80@emailn.de>
  Richard Henderson <richard.henderson@linaro.org>
  Ross Lagerwall <ross.lagerwall@citrix.com>
  Shreesh Adiga <16567adigashreesh@gmail.com>
  Stefan Hajnoczi <stefanha@redhat.com>
  Steve Sistare <steven.sistare@oracle.com>
  Taylor Simpson <tsimpson@quicinc.com>
  Ted Chen <znscnchen@gmail.com>
  Thomas Huth <thuth@redhat.com>
  Tsukasa OI <research_trasio@irq.a4lg.com>
  Wei Wang <wei.w.wang@intel.com>
  Willem van de Velde <williamvdvelde@gmail.com>
  Yeqi Fu <fufuyqqqqqq@gmail.com>
  zhenwei pi <pizhenwei@bytedance.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  starved 
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          starved 
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          starved 
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-libvirt-xsm                                 fail    
 test-arm64-arm64-libvirt-xsm                                 fail    
 test-amd64-i386-libvirt-xsm                                  fail    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  starved 
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  starved 
 test-armhf-armhf-xl-cubietruck                               starved 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        fail    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         fail    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     fail    
 test-armhf-armhf-libvirt                                     starved 
 test-amd64-i386-libvirt                                      fail    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                starved 
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                fail    
 test-amd64-i386-libvirt-pair                                 fail    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               starved 
 test-amd64-amd64-xl-qcow2                                    fail    
 test-arm64-arm64-libvirt-raw                                 fail    
 test-armhf-armhf-libvirt-raw                                 starved 
 test-amd64-i386-libvirt-raw                                  fail    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     starved 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 fail    
 test-arm64-arm64-xl-vhd                                      fail    
 test-armhf-armhf-xl-vhd                                      starved 
 test-amd64-i386-xl-vhd                                       fail    


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

(No revision log; it would be 10015 lines long.)

