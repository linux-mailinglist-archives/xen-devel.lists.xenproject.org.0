Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 373E23CCD6E
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jul 2021 07:32:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.158060.291185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5Ls8-0004zh-Va; Mon, 19 Jul 2021 05:31:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 158060.291185; Mon, 19 Jul 2021 05:31:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5Ls8-0004xR-Rw; Mon, 19 Jul 2021 05:31:20 +0000
Received: by outflank-mailman (input) for mailman id 158060;
 Mon, 19 Jul 2021 05:31:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m5Ls7-0004xH-F5; Mon, 19 Jul 2021 05:31:19 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m5Ls7-0002IO-9t; Mon, 19 Jul 2021 05:31:19 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m5Ls7-0007CK-11; Mon, 19 Jul 2021 05:31:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1m5Ls7-0003c9-0T; Mon, 19 Jul 2021 05:31:19 +0000
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
	bh=tI5YeWSngwNut+G2TysoJ23h6uCj0Pc7JaZqTA7Y5lI=; b=hx530vyxh+Uta7lzO0wuprBmdX
	mbu2RBwkf7EZk0RfJFNpfGM5F/nEjrG9A9/jBuSLQ1OC0B1ChtvoQTEcLrCEnm3Grlc7TsE9awuQk
	kskSKcWeV2Q5d/zZI35HNXltBkAsu7Yl3E7DzlxJQdfOxcWGHO+ogofTiG9pXhce4/Q8=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-163784-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 163784: regressions - FAIL
X-Osstest-Failures:
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64:debian-hvm-install:fail:regression
    qemu-mainline:test-amd64-amd64-qemuu-freebsd11-amd64:guest-start:fail:regression
    qemu-mainline:test-amd64-amd64-qemuu-freebsd12-amd64:guest-start:fail:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
    qemu-mainline:test-amd64-i386-libvirt-pair:guest-start/debian:fail:regression
    qemu-mainline:test-amd64-amd64-libvirt:guest-start:fail:regression
    qemu-mainline:test-amd64-i386-freebsd10-i386:guest-start:fail:regression
    qemu-mainline:test-amd64-i386-freebsd10-amd64:guest-start:fail:regression
    qemu-mainline:test-amd64-amd64-libvirt-pair:guest-start/debian:fail:regression
    qemu-mainline:test-amd64-i386-qemuu-rhel6hvm-amd:redhat-install:fail:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:debian-hvm-install:fail:regression
    qemu-mainline:test-armhf-armhf-xl-vhd:debian-di-install:fail:regression
    qemu-mainline:test-amd64-amd64-libvirt-xsm:guest-start:fail:regression
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:debian-hvm-install:fail:regression
    qemu-mainline:test-amd64-i386-xl-shadow:debian-fixup:fail:regression
    qemu-mainline:test-amd64-i386-libvirt-xsm:guest-start:fail:regression
    qemu-mainline:test-amd64-i386-libvirt:guest-start:fail:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:debian-hvm-install:fail:regression
    qemu-mainline:test-amd64-amd64-xl-qcow2:debian-di-install:fail:regression
    qemu-mainline:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install:fail:regression
    qemu-mainline:test-amd64-i386-qemuu-rhel6hvm-intel:redhat-install:fail:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:windows-install:fail:regression
    qemu-mainline:test-amd64-amd64-qemuu-nested-intel:debian-hvm-install:fail:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:debian-hvm-install:fail:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-amd64:debian-hvm-install:fail:regression
    qemu-mainline:test-amd64-amd64-libvirt-vhd:debian-di-install:fail:regression
    qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
    qemu-mainline:test-arm64-arm64-libvirt-xsm:guest-start:fail:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:debian-hvm-install:fail:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:debian-hvm-install:fail:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:windows-install:fail:regression
    qemu-mainline:test-armhf-armhf-libvirt:guest-start:fail:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:windows-install:fail:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:windows-install:fail:regression
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
    qemu-mainline:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    qemuu=fd79f89c76c8e2f409dd9db5d7a367b1f64b6dc6
X-Osstest-Versions-That:
    qemuu=9bef7ea9d93ee6b6297a5be6cb5a557f7d1764c9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 19 Jul 2021 05:31:19 +0000

flight 163784 qemu-mainline real [real]
http://logs.test-lab.xenproject.org/osstest/logs/163784/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 12 debian-hvm-install fail REGR. vs. 163321
 test-amd64-amd64-qemuu-freebsd11-amd64 13 guest-start    fail REGR. vs. 163321
 test-amd64-amd64-qemuu-freebsd12-amd64 13 guest-start    fail REGR. vs. 163321
 test-amd64-i386-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail REGR. vs. 163321
 test-amd64-i386-libvirt-pair 25 guest-start/debian       fail REGR. vs. 163321
 test-amd64-amd64-libvirt     14 guest-start              fail REGR. vs. 163321
 test-amd64-i386-freebsd10-i386 13 guest-start            fail REGR. vs. 163321
 test-amd64-i386-freebsd10-amd64 13 guest-start           fail REGR. vs. 163321
 test-amd64-amd64-libvirt-pair 25 guest-start/debian      fail REGR. vs. 163321
 test-amd64-i386-qemuu-rhel6hvm-amd 12 redhat-install     fail REGR. vs. 163321
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 12 debian-hvm-install fail REGR. vs. 163321
 test-armhf-armhf-xl-vhd      12 debian-di-install        fail REGR. vs. 163321
 test-amd64-amd64-libvirt-xsm 14 guest-start              fail REGR. vs. 163321
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 12 debian-hvm-install fail REGR. vs. 163321
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 12 debian-hvm-install fail REGR. vs. 163321
 test-amd64-i386-xl-shadow    13 debian-fixup             fail REGR. vs. 163321
 test-amd64-i386-libvirt-xsm  14 guest-start              fail REGR. vs. 163321
 test-amd64-i386-libvirt      14 guest-start              fail REGR. vs. 163321
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 163321
 test-amd64-amd64-xl-qcow2    12 debian-di-install        fail REGR. vs. 163321
 test-amd64-amd64-qemuu-nested-amd 12 debian-hvm-install  fail REGR. vs. 163321
 test-amd64-i386-qemuu-rhel6hvm-intel 12 redhat-install   fail REGR. vs. 163321
 test-amd64-amd64-xl-qemuu-win7-amd64 12 windows-install  fail REGR. vs. 163321
 test-amd64-amd64-qemuu-nested-intel 12 debian-hvm-install fail REGR. vs. 163321
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow 12 debian-hvm-install fail REGR. vs. 163321
 test-amd64-i386-xl-qemuu-debianhvm-amd64 12 debian-hvm-install fail REGR. vs. 163321
 test-amd64-amd64-libvirt-vhd 12 debian-di-install        fail REGR. vs. 163321
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 12 debian-hvm-install fail REGR. vs. 163321
 test-arm64-arm64-libvirt-xsm 14 guest-start              fail REGR. vs. 163321
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 163321
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 12 debian-hvm-install fail REGR. vs. 163321
 test-amd64-amd64-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail REGR. vs. 163321
 test-amd64-i386-xl-qemuu-win7-amd64 12 windows-install   fail REGR. vs. 163321
 test-armhf-armhf-libvirt     14 guest-start              fail REGR. vs. 163321
 test-amd64-i386-xl-qemuu-ws16-amd64 12 windows-install   fail REGR. vs. 163321
 test-amd64-amd64-xl-qemuu-ws16-amd64 12 windows-install  fail REGR. vs. 163321
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
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass

version targeted for testing:
 qemuu                fd79f89c76c8e2f409dd9db5d7a367b1f64b6dc6
baseline version:
 qemuu                9bef7ea9d93ee6b6297a5be6cb5a557f7d1764c9

Last test of basis   163321  2021-07-06 00:39:14 Z   13 days
Failing since        163327  2021-07-06 12:39:04 Z   12 days   21 attempts
Testing same since   163784  2021-07-18 16:50:39 Z    0 days    1 attempts

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
 test-armhf-armhf-xl-multivcpu                                pass    
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
 test-amd64-i386-xl-shadow                                    fail    
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

(No revision log; it would be 10578 lines long.)

