Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBEE3CF460
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jul 2021 08:17:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.158645.291949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5j3j-0002bD-1O; Tue, 20 Jul 2021 06:16:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 158645.291949; Tue, 20 Jul 2021 06:16:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5j3i-0002Xh-Sr; Tue, 20 Jul 2021 06:16:50 +0000
Received: by outflank-mailman (input) for mailman id 158645;
 Tue, 20 Jul 2021 06:16:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m5j3i-0002XY-B1; Tue, 20 Jul 2021 06:16:50 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m5j3i-0002VA-1g; Tue, 20 Jul 2021 06:16:50 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m5j3h-0005bq-NU; Tue, 20 Jul 2021 06:16:49 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1m5j3h-0007tn-N2; Tue, 20 Jul 2021 06:16:49 +0000
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
	bh=zwDO7ft0tdyDJGT298HOEmVHhwTWsPYwGMmO063whNo=; b=sIvPvbT70LcJmE+gdK3sEY9Kev
	5EmkjuHBcbH9fUTwJUQwnjp5mRyagyhqE0UKfDpVXNBeBLhO1b12jDLS5pXBc/Hqh2qhQeRkxgSq6
	IbnH9t/Phkom8ibpUl5q7HmLw0IaHuyV/EScsuuBhpBbncdKQ2ClWodlKR67TOf5I0AA=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-163811-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 163811: regressions - FAIL
X-Osstest-Failures:
    qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-amd64:debian-hvm-install:fail:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:debian-hvm-install:fail:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:windows-install:fail:regression
    qemu-mainline:test-amd64-amd64-xl-qcow2:debian-di-install:fail:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:debian-hvm-install:fail:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:debian-hvm-install:fail:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64:debian-hvm-install:fail:regression
    qemu-mainline:test-amd64-i386-qemuu-rhel6hvm-intel:redhat-install:fail:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:debian-hvm-install:fail:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
    qemu-mainline:test-amd64-amd64-libvirt:guest-start:fail:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:windows-install:fail:regression
    qemu-mainline:test-amd64-amd64-qemuu-freebsd11-amd64:guest-start:fail:regression
    qemu-mainline:test-amd64-amd64-qemuu-nested-intel:debian-hvm-install:fail:regression
    qemu-mainline:test-amd64-amd64-libvirt-xsm:guest-start:fail:regression
    qemu-mainline:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install:fail:regression
    qemu-mainline:test-amd64-amd64-libvirt-vhd:debian-di-install:fail:regression
    qemu-mainline:test-amd64-amd64-qemuu-freebsd12-amd64:guest-start:fail:regression
    qemu-mainline:test-amd64-i386-libvirt-pair:guest-start/debian:fail:regression
    qemu-mainline:test-amd64-i386-qemuu-rhel6hvm-amd:redhat-install:fail:regression
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:debian-hvm-install:fail:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:windows-install:fail:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:windows-install:fail:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:debian-hvm-install:fail:regression
    qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
    qemu-mainline:test-amd64-i386-freebsd10-i386:guest-start:fail:regression
    qemu-mainline:test-amd64-i386-freebsd10-amd64:guest-start:fail:regression
    qemu-mainline:test-amd64-amd64-libvirt-pair:guest-start/debian:fail:regression
    qemu-mainline:test-arm64-arm64-libvirt-xsm:guest-start:fail:regression
    qemu-mainline:test-armhf-armhf-xl-vhd:debian-di-install:fail:regression
    qemu-mainline:test-amd64-i386-libvirt:guest-start:fail:regression
    qemu-mainline:test-amd64-i386-libvirt-xsm:guest-start:fail:regression
    qemu-mainline:test-armhf-armhf-xl-multivcpu:xen-boot:fail:regression
    qemu-mainline:test-armhf-armhf-libvirt:guest-start:fail:regression
    qemu-mainline:test-armhf-armhf-libvirt-raw:debian-di-install:fail:regression
    qemu-mainline:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    qemuu=7457b407edd6e8555e4b46488aab2f13959fccf8
X-Osstest-Versions-That:
    qemuu=9bef7ea9d93ee6b6297a5be6cb5a557f7d1764c9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 20 Jul 2021 06:16:49 +0000

flight 163811 qemu-mainline real [real]
http://logs.test-lab.xenproject.org/osstest/logs/163811/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl-qemuu-debianhvm-amd64 12 debian-hvm-install fail REGR. vs. 163321
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 12 debian-hvm-install fail REGR. vs. 163321
 test-amd64-amd64-xl-qemuu-win7-amd64 12 windows-install  fail REGR. vs. 163321
 test-amd64-amd64-xl-qcow2    12 debian-di-install        fail REGR. vs. 163321
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 163321
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 12 debian-hvm-install fail REGR. vs. 163321
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 12 debian-hvm-install fail REGR. vs. 163321
 test-amd64-i386-qemuu-rhel6hvm-intel 12 redhat-install   fail REGR. vs. 163321
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 12 debian-hvm-install fail REGR. vs. 163321
 test-amd64-amd64-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail REGR. vs. 163321
 test-amd64-amd64-libvirt     14 guest-start              fail REGR. vs. 163321
 test-amd64-i386-xl-qemuu-win7-amd64 12 windows-install   fail REGR. vs. 163321
 test-amd64-amd64-qemuu-freebsd11-amd64 13 guest-start    fail REGR. vs. 163321
 test-amd64-amd64-qemuu-nested-intel 12 debian-hvm-install fail REGR. vs. 163321
 test-amd64-amd64-libvirt-xsm 14 guest-start              fail REGR. vs. 163321
 test-amd64-amd64-qemuu-nested-amd 12 debian-hvm-install  fail REGR. vs. 163321
 test-amd64-amd64-libvirt-vhd 12 debian-di-install        fail REGR. vs. 163321
 test-amd64-amd64-qemuu-freebsd12-amd64 13 guest-start    fail REGR. vs. 163321
 test-amd64-i386-libvirt-pair 25 guest-start/debian       fail REGR. vs. 163321
 test-amd64-i386-qemuu-rhel6hvm-amd 12 redhat-install     fail REGR. vs. 163321
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 12 debian-hvm-install fail REGR. vs. 163321
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow 12 debian-hvm-install fail REGR. vs. 163321
 test-amd64-i386-xl-qemuu-ws16-amd64 12 windows-install   fail REGR. vs. 163321
 test-amd64-i386-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail REGR. vs. 163321
 test-amd64-amd64-xl-qemuu-ws16-amd64 12 windows-install  fail REGR. vs. 163321
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 163321
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 12 debian-hvm-install fail REGR. vs. 163321
 test-amd64-i386-freebsd10-i386 13 guest-start            fail REGR. vs. 163321
 test-amd64-i386-freebsd10-amd64 13 guest-start           fail REGR. vs. 163321
 test-amd64-amd64-libvirt-pair 25 guest-start/debian      fail REGR. vs. 163321
 test-arm64-arm64-libvirt-xsm 14 guest-start              fail REGR. vs. 163321
 test-armhf-armhf-xl-vhd      12 debian-di-install        fail REGR. vs. 163321
 test-amd64-i386-libvirt      14 guest-start              fail REGR. vs. 163321
 test-amd64-i386-libvirt-xsm  14 guest-start              fail REGR. vs. 163321
 test-armhf-armhf-xl-multivcpu  8 xen-boot                fail REGR. vs. 163321
 test-armhf-armhf-libvirt     14 guest-start              fail REGR. vs. 163321
 test-armhf-armhf-libvirt-raw 12 debian-di-install        fail REGR. vs. 163321

Tests which did not succeed, but are not blocking:
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass

version targeted for testing:
 qemuu                7457b407edd6e8555e4b46488aab2f13959fccf8
baseline version:
 qemuu                9bef7ea9d93ee6b6297a5be6cb5a557f7d1764c9

Last test of basis   163321  2021-07-06 00:39:14 Z   14 days
Failing since        163327  2021-07-06 12:39:04 Z   13 days   23 attempts
Testing same since   163811  2021-07-19 15:38:23 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Akihiko Odaki <akihiko.odaki@gmail.com>
  Alberto Garcia <berto@igalia.com>
  Alex Bennée <alex.bennee@linaro.org>
  Alex Williamson <alex.williamson@redhat.com>
  Alexandre Iooss <erdnaxe@crans.org>
  Alexey Kardashevskiy <aik@ozlabs.ru>
  Alistair Francis <alistair.francis@wdc.com>
  Andreas Schwab <schwab@suse.de>
  Andrew Melnychenko <andrew@daynix.com>
  Arseny Krasnov <arseny.krasnov@kaspersky.com>
  BALATON Zoltan <balaton@eik.bme.hu>
  Bharata B Rao <bharata@linux.ibm.com>
  Bin Meng <bin.meng@windriver.com>
  Bin Meng <bmeng.cn@gmail.com>
  Brad Smith <brad@comstyle.com>
  Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
  Cai Huoqing <caihuoqing@baidu.com>
  Cho, Yu-Chen <acho@suse.com>
  Christian Borntraeger <borntraeger@de.ibm.com>
  Claudio Fontana <cfontana@suse.de>
  Cleber Rosa <crosa@redhat.com>
  Connor Kuehl <ckuehl@redhat.com>
  Corey Minyard <cminyard@mvista.com>
  Cornelia Huck <cohuck@redhat.com>
  Cédric Le Goater <clg@kaod.org>
  Daniel P. Berrangé <berrange@redhat.com>
  David Edmondson <david.edmondson@oracle.com>
  David Gibson <david@gibson.dropbear.id.au>
  David Hildenbrand <david@redhat.com>
  Dmitry Voronetskiy <davoronetskiy@gmail.com>
  Dov Murik <dovmurik@linux.ibm.com>
  Dr. David Alan Gilbert <dgilbert@redhat.com>
  Eduardo Habkost <ehabkost@redhat.com>
  Eduardo Otubo <otubo@redhat.com>
  Eric Auger <eric.auger@redhat.com>
  Eric Blake <eblake@redhat.com>
  Fabiano Rosas <farosas@linux.ibm.com>
  Finn Thain <fthain@linux-m68k.org>
  Gerd Hoffmann <kraxel@redhat.com>
  Greg Kurz <groug@kaod.org>
  Heinrich Schuchardt <xypron.glpk@gmx.de>
  hnick@vmware.com <hnick@vmware.com>
  Hubert Jasudowicz <hubert.jasudowicz@gmail.com>
  Hyman <huangy81@chinatelecom.cn>
  Igor Mammedov <imammedo@redhat.com>
  Ilya Dryomov <idryomov@gmail.com>
  Jinhua Cao <caojinhua1@huawei.com>
  John Arbuckle <programmingkidx@gmail.com>
  John Sucaet <john.sucaet@ekinops.com>
  Jose Martins <josemartins90@gmail.com>
  Jose R. Ziviani <jziviani@suse.de>
  Julia Suvorova <jusual@redhat.com>
  Kevin Wolf <kwolf@redhat.com>
  Kito Cheng <kito.cheng@sifive.com>
  Kostiantyn Kostiuk <konstantin@daynix.com>
  Lara Lazier <laramglazier@gmail.com>
  Laszlo Ersek <lersek@redhat.com>
  Laurent Vivier <laurent@vivier.eu>
  Laurent Vivier <lvivier@redhat.com>
  Li Zhijian <lizhijian@cn.fujitsu.com>
  Liren Wei <lrwei@bupt.edu.cn>
  Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
  Lukas Straub <lukasstraub2@web.de>
  Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
  Mahmoud Mandour <ma.mandourr@gmail.com>
  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
  Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
  Mark Nelson <mdnelson8@gmail.com>
  Markus Armbruster <armbru@redhat.com>
  Mathieu Poirier <mathieu.poirier@linaro.org>
  Max Filippov <jcmvbkbc@gmail.com>
  Max Reitz <mreitz@redhat.com>
  Michael Roth <michael.roth@amd.com>
  Michael S. Tsirkin <mst@redhat.com>
  Michal Privoznik <mprivozn@redhat.com>
  Miroslav Rezanina <mrezanin@redhat.com>
  Nicholas Piggin <npiggin@gmail.com>
  Nick Hudson <hnick@vmware.com>
  Olaf Hering <olaf@aepfle.de>
  Or Ozeri <oro@il.ibm.com>
  Owen Anderson <oanderso@google.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
  Peter Lieven <pl@kamp.de>
  Peter Maydell <peter.maydell@linaro.org>
  Peter Xu <peterx@redhat.com>
  Philippe Mathieu-Daudé <f4bug@amsat.org>
  Philippe Mathieu-Daudé <philmd@redhat.com>
  Rebecca Cran <rebecca@nuviainc.com>
  Ricardo Koller <ricarkol@google.com>
  Richard Henderson <richard.henderson@linaro.org>
  Stefan Hajnoczi <stefanha@redhat.com>
  Stefano Garzarella <sgarzare@redhat.com>
  Thomas Huth <thuth@redhat.com>
  Titus Rwantare <titusr@google.com>
  Ulrich Weigand <ulrich.weigand@de.ibm.com>
  Viktor Ashirov <vashirov@redhat.com>
  Vincent Bernat <vincent@bernat.ch>
  Viresh Kumar <viresh.kumar@linaro.org>
  Vitaly Kuznetsov <vkuznets@redhat.com>
  Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
  Wainer dos Santos Moschetta <wainersm@redhat.com>
  Willian Rampazzo <willianr@redhat.com>
  Xingang Wang <wangxingang5@huawei.com>
  zhenwei pi <pizhenwei@bytedance.com>
  Ziqiao Kong <ziqiaokong@gmail.com>

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
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           fail    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            fail    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 fail    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  fail    
 test-amd64-amd64-libvirt-xsm                                 fail    
 test-arm64-arm64-libvirt-xsm                                 fail    
 test-amd64-i386-libvirt-xsm                                  fail    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           fail    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    fail    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     fail    
 test-amd64-i386-freebsd10-amd64                              fail    
 test-amd64-amd64-qemuu-freebsd11-amd64                       fail    
 test-amd64-amd64-qemuu-freebsd12-amd64                       fail    
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
 test-amd64-i386-freebsd10-i386                               fail    
 test-amd64-amd64-qemuu-nested-intel                          fail    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         fail    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     fail    
 test-armhf-armhf-libvirt                                     fail    
 test-amd64-i386-libvirt                                      fail    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                fail    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                fail    
 test-amd64-i386-libvirt-pair                                 fail    
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

(No revision log; it would be 10730 lines long.)

