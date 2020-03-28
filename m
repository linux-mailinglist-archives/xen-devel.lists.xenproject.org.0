Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5C0196424
	for <lists+xen-devel@lfdr.de>; Sat, 28 Mar 2020 08:21:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jI5jw-0003xZ-7i; Sat, 28 Mar 2020 07:18:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2fYQ=5N=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jI5ju-0003xU-Nr
 for xen-devel@lists.xenproject.org; Sat, 28 Mar 2020 07:18:42 +0000
X-Inumbo-ID: 55f0c6ea-70c4-11ea-8aef-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 55f0c6ea-70c4-11ea-8aef-12813bfff9fa;
 Sat, 28 Mar 2020 07:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M04eLwbugGb9VIipWosu2EPkwkhO8Hg7c5RIdL+Irsc=; b=G1zrlQTY0wBDbXDfMIlBRU9Iu
 vLB/n9lNDkAm6s4FtJ9/mA4TnkDuD+3u6+l1pV7/LEsrsu/dWCTtt5+jX0q62u17pj0VpLuJHt8i/
 p6GF9LYgk0VnzZbi+LGP7J8xpfBAGwXvgybL4FexmuaVgHn+2HlB+HUmFCtyNFmUOToLA=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jI5jm-0003GC-Cv; Sat, 28 Mar 2020 07:18:34 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jI5jl-0007Qd-NV; Sat, 28 Mar 2020 07:18:33 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jI5jl-0000D9-Mp; Sat, 28 Mar 2020 07:18:33 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149075-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
X-Osstest-Failures: qemu-mainline:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:windows-install:fail:regression
 qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-amd64:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-amd64-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-i386-freebsd10-i386:guest-start:fail:regression
 qemu-mainline:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-i386-qemuu-rhel6hvm-intel:redhat-install:fail:regression
 qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:windows-install:fail:regression
 qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:windows-install:fail:regression
 qemu-mainline:test-amd64-i386-qemuu-rhel6hvm-amd:redhat-install:fail:regression
 qemu-mainline:test-amd64-i386-libvirt-pair:guest-start/debian:fail:regression
 qemu-mainline:test-amd64-amd64-libvirt:guest-start:fail:regression
 qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:windows-install:fail:regression
 qemu-mainline:test-amd64-amd64-libvirt-xsm:guest-start:fail:regression
 qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-amd64-libvirt-pair:guest-start/debian:fail:regression
 qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-amd64-qemuu-nested-intel:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-i386-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-i386-libvirt:guest-start:fail:regression
 qemu-mainline:test-amd64-i386-freebsd10-amd64:guest-start:fail:regression
 qemu-mainline:test-amd64-i386-libvirt-xsm:guest-start:fail:regression
 qemu-mainline:test-arm64-arm64-libvirt-xsm:guest-start:fail:regression
 qemu-mainline:test-armhf-armhf-libvirt:guest-start:fail:regression
 qemu-mainline:test-amd64-amd64-libvirt-vhd:debian-di-install:fail:regression
 qemu-mainline:test-amd64-amd64-xl-qcow2:debian-di-install:fail:regression
 qemu-mainline:test-armhf-armhf-xl-vhd:debian-di-install:fail:regression
 qemu-mainline:test-armhf-armhf-libvirt-raw:debian-di-install:fail:regression
 qemu-mainline:test-amd64-amd64-dom0pvh-xl-intel:guest-saverestore.2:fail:nonblocking
 qemu-mainline:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-amd64-amd64-dom0pvh-xl-amd:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This: qemuu=cfe68ae025f704f336d7dd3d1903ce37b445831d
X-Osstest-Versions-That: qemuu=7697ac55fcc6178fd8fd8aa22baed13a0c8ca942
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 28 Mar 2020 07:18:33 +0000
Subject: [Xen-devel] [qemu-mainline test] 149075: regressions - trouble:
 fail/pass/starved
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

flight 149075 qemu-mainline real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149075/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 10 debian-hvm-install fail REGR. vs. 144861
 test-amd64-amd64-xl-qemuu-win7-amd64 10 windows-install  fail REGR. vs. 144861
 test-amd64-i386-xl-qemuu-debianhvm-amd64 10 debian-hvm-install fail REGR. vs. 144861
 test-amd64-amd64-xl-qemuu-ovmf-amd64 10 debian-hvm-install fail REGR. vs. 144861
 test-amd64-amd64-qemuu-nested-amd 10 debian-hvm-install  fail REGR. vs. 144861
 test-amd64-i386-freebsd10-i386 11 guest-start            fail REGR. vs. 144861
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 10 debian-hvm-install fail REGR. vs. 144861
 test-amd64-i386-qemuu-rhel6hvm-intel 10 redhat-install   fail REGR. vs. 144861
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 10 debian-hvm-install fail REGR. vs. 144861
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 10 debian-hvm-install fail REGR. vs. 144861
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 10 debian-hvm-install fail REGR. vs. 144861
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 10 debian-hvm-install fail REGR. vs. 144861
 test-amd64-amd64-xl-qemuu-ws16-amd64 10 windows-install  fail REGR. vs. 144861
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 10 debian-hvm-install fail REGR. vs. 144861
 test-amd64-i386-xl-qemuu-ws16-amd64 10 windows-install   fail REGR. vs. 144861
 test-amd64-i386-qemuu-rhel6hvm-amd 10 redhat-install     fail REGR. vs. 144861
 test-amd64-i386-libvirt-pair 21 guest-start/debian       fail REGR. vs. 144861
 test-amd64-amd64-libvirt     12 guest-start              fail REGR. vs. 144861
 test-amd64-i386-xl-qemuu-win7-amd64 10 windows-install   fail REGR. vs. 144861
 test-amd64-amd64-libvirt-xsm 12 guest-start              fail REGR. vs. 144861
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow 10 debian-hvm-install fail REGR. vs. 144861
 test-amd64-amd64-libvirt-pair 21 guest-start/debian      fail REGR. vs. 144861
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 10 debian-hvm-install fail REGR. vs. 144861
 test-amd64-amd64-qemuu-nested-intel 10 debian-hvm-install fail REGR. vs. 144861
 test-amd64-i386-xl-qemuu-ovmf-amd64 10 debian-hvm-install fail REGR. vs. 144861
 test-amd64-i386-libvirt      12 guest-start              fail REGR. vs. 144861
 test-amd64-i386-freebsd10-amd64 11 guest-start           fail REGR. vs. 144861
 test-amd64-i386-libvirt-xsm  12 guest-start              fail REGR. vs. 144861
 test-arm64-arm64-libvirt-xsm 12 guest-start              fail REGR. vs. 144861
 test-armhf-armhf-libvirt     12 guest-start              fail REGR. vs. 144861
 test-amd64-amd64-libvirt-vhd 10 debian-di-install        fail REGR. vs. 144861
 test-amd64-amd64-xl-qcow2    10 debian-di-install        fail REGR. vs. 144861
 test-armhf-armhf-xl-vhd      10 debian-di-install        fail REGR. vs. 144861
 test-armhf-armhf-libvirt-raw 10 debian-di-install        fail REGR. vs. 144861

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-dom0pvh-xl-intel 17 guest-saverestore.2 fail baseline untested
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-dom0pvh-xl-amd  2 hosts-allocate               starved  n/a

version targeted for testing:
 qemuu                cfe68ae025f704f336d7dd3d1903ce37b445831d
baseline version:
 qemuu                7697ac55fcc6178fd8fd8aa22baed13a0c8ca942

Last test of basis   144861  2019-12-16 13:06:24 Z  102 days
Failing since        144880  2019-12-16 20:07:08 Z  102 days  311 attempts
Testing same since   149075  2020-03-27 04:28:52 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Michael S. Tsirkin" <mst@redhat.com>
  Aarushi Mehta <mehta.aaru20@gmail.com>
  Adrian Moreno <amorenoz@redhat.com>
  Adrien GRASSEIN <adrien.grassein@smile.fr>
  Alberto Garcia <berto@igalia.com>
  Aleksandar Markovic <aleksandar.m.mail@gmail.com>
  Aleksandar Markovic <amarkovic@wavecomp.com>
  Alex Bennée <alex.bennee@linaro.org>
  Alex Richardson <Alexander.Richardson@cl.cam.ac.uk>
  Alex Williamson <alex.williamson@redhat.com>
  Alexander Bulekov <alxndr@bu.edu>
  Alexander Popov <alex.popov@linux.com>
  Alexey Kardashevskiy <aik@ozlabs.ru>
  Alexey Romko <nevilad@yahoo.com>
  Alistair Francis <alistair.francis@wdc.com>
  Alistair Francis <alistair@alistair23.me>
  Andrea Bolognani <abologna@redhat.com>
  Andreas Schwab <schwab@suse.de>
  Andrew Jeffery <andrew@aj.id.au>
  Andrew Jones <drjones@redhat.com>
  Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Anton V. Boyarshinov <boyarsh@altlinux.org>
  Anup Patel <anup.patel@wdc.com>
  Aravinda Prasad <arawinda.p@gmail.com>
  Ard Biesheuvel <ard.biesheuvel@linaro.org>
  Atish Patra <atish.patra@wdc.com>
  Aurelien Jarno <aurelien@aurel32.net>
  Babu Moger <babu.moger@amd.com>
  BALATON Zoltan <balaton@eik.bme.hu>
  Basil Salman <basil@daynix.com>
  bauerchen <bauerchen@tencent.com>
  Beata Michalska <beata.michalska@linaro.org>
  Benjamin Herrenschmidt <benh@kernel.crashing.org>
  Bharata B Rao <bharata@linux.ibm.com>
  Bin Meng <bmeng.cn@gmail.com>
  Cameron Esfahani <dirty@apple.com>
  Carlos Santos <casantos@redhat.com>
  Cathy Zhang <cathy.zhang@intel.com>
  Changbin Du <changbin.du@gmail.com>
  Chen Qun <kuhn.chenqun@huawei.com>
  Christian Borntraeger <borntraeger@de.ibm.com>
  Christian Ehrhardt <christian.ehrhardt@canonical.com>
  Christian Schoenebeck <qemu_oss@crudebyte.com>
  Christophe de Dinechin <dinechin@redhat.com>
  Christophe Lyon <christophe.lyon@linaro.org>
  Cleber Rosa <crosa@redhat.com>
  Clement Deschamps <clement.deschamps@greensocs.com>
  Cole Robinson <crobinso@redhat.com>
  Colin Xu <colin.xu@intel.com>
  Corey Minyard <cminyard@mvista.com>
  Cornelia Huck <cohuck@redhat.com>
  Cornelia Huck <cohuck@redhat.com> #s390x
  Cédric Le Goater <clg@fr.ibm.com>
  Cédric Le Goater <clg@kaod.org>
  Damien Hedde <damien.hedde@greensocs.com>
  Daniel Henrique Barboza <danielhb413@gmail.com>
  Daniel P. Berrangé <berrange@redhat.com>
  David Edmondson <david.edmondson@oracle.com>
  David Gibson <david@gibson.dropbear.id.au>
  David Gibson <david@gibson.dropbear.id.au> (ppc parts)
  David Hildenbrand <david@redhat.com>
  David Vrabel <david.vrabel@nutanix.com>
  Denis Plotnikov <dplotnikov@virtuozzo.com>
  Dmitry Fleytman <dmitry.fleytman@gmail.com>
  Dr. David Alan Gilbert <dgilbert@redhat.com>
  Edgar E. Iglesias <edgar.iglesias@xilinx.com>
  Eduardo Habkost <ehabkost@redhat.com>
  Eiichi Tsukata <devel@etsukata.com>
  Emilio G. Cota <cota@braap.org>
  Eric Auger <eric.auger@redhat.com>
  Eric Blake <eblake@redhat.com>
  Eric Ren <renzhen@linux.alibaba.com>
  Eryu Guan <eguan@linux.alibaba.com>
  Fabiano Rosas <farosas@linux.ibm.com>
  Fangrui Song <i@maskray.me>
  Felipe Franciosi <felipe@nutanix.com>
  Filip Bozuta <Filip.Bozuta@rt-rk.com>
  Finn Thain <fthain@telegraphics.com.au>
  Florian Florensa <fflorensa@online.net>
  Francisco Iglesias <francisco.iglesias@xilinx.com>
  Francisco Iglesias <frasse.iglesias@gmail.com>
  Ganesh Goudar <ganeshgr@linux.ibm.com>
  Ganesh Maharaj Mahalingam <ganesh.mahalingam@intel.com>
  Gavin Shan <gshan@redhat.com>
  Gerd Hoffmann <kraxel@redhat.com>
  Greg Kurz <groug@kaod.org>
  Guenter Roeck <linux@roeck-us.net>
  Guoyi Tu <tu.guoyi@h3c.com>
  Halil Pasic <pasic@linux.ibm.com>
  Han Han <hhan@redhat.com>
  Helge Deller <deller@gmx.de>
  Hervé Poussineau <hpoussin@reactos.org>
  Heyi Guo <guoheyi@huawei.com>
  Hikaru Nishida <hikarupsp@gmail.com>
  Howard Spoelstra <hsp.cat7@gmail.com>
  Igor Mammedov <imammedo@redhat.com>
  Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
  Jafar Abdi <cafer.abdi@gmail.com>
  Jaijun Chen <chenjiajun8@huawei.com>
  James Clarke <jrtc27@jrtc27.com>
  James Hogan <jhogan@kernel.org>
  Jan Kiszka <jan.kiszka@siemens.com>
  Jan Kiszka <jan.kiszka@web.de>
  Janosch Frank <frankja@linux.ibm.com>
  Jason A. Donenfeld <Jason@zx2c4.com>
  Jason Andryuk <jandryuk@gmail.com>
  Jason Wang <jasowang@redhat.com>
  Jean-Philippe Brucker <jean-philippe@linaro.org>
  Jeff Kubascik <jeff.kubascik@dornerworks.com>
  Jens Freimann <jfreimann@redhat.com>
  Jiahui Cen <cenjiahui@huawei.com>
  Jiajun Chen <chenjiajun8@huawei.com>
  Jiufei Xue <jiufei.xue@linux.alibaba.com>
  Joe Richey <joerichey@google.com>
  Joel Stanley <joel@jms.id.au>
  Johannes Berg <johannes.berg@intel.com>
  John Arbuckle <programmingkidx@gmail.com>
  John Snow <jsnow@redhat.com>
  Josh Kunz <jkz@google.com>
  Juan Quintela <quintela@redhat.com>
  Julia Suvorova <jusual@redhat.com>
  Julio Faracco <jcfaracco@gmail.com>
  Jun Piao <piaojun@huawei.com>
  Kashyap Chamarthy <kchamart@redhat.com>
  Keith Packard <keithp@keithp.com>
  Keqian Zhu <zhukeqian1@huawei.com>
  Kevin Wolf <kwolf@redhat.com>
  KONRAD Frederic <frederic.konrad@adacore.com>
  Kővágó, Zoltán <DirtY.iCE.hu@gmail.com>
  Laszlo Ersek <lersek@redhat.com>
  Laurent Vivier <laurent@vivier.eu>
  Laurent Vivier <lvivier@redhat.com>
  Leif Lindholm <leif@nuviainc.com>
  Leonardo Bras <leonardo@ibm.com>
  Leonardo Bras <leonardo@linux.ibm.com>
  Li Hangjing <lihangjing@baidu.com>
  Liam Merwick <liam.merwick@oracle.com>
  Liang Yan <lyan@suse.com>
  Lirong Yuan <yuanzi@google.com>
  Liu Bo <bo.liu@linux.alibaba.com>
  Liu Jingqi <jingqi.liu@intel.com>
  Liu Yi L <yi.l.liu@intel.com>
  Longpeng <longpeng2@huawei.com>
  Luc Michel <luc.michel@greensocs.com>
  Lukas Straub <lukasstraub2@web.de>
  Lukáš Doktor <ldoktor@redhat.com>
  Mahesh Salgaonkar <mahesh@linux.ibm.com>
  Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
  Marc Hartmayer <mhartmay@linux.ibm.com>
  Marc Zyngier <maz@kernel.org>
  Marc-André Lureau <marcandre.lureau@redhat.com>
  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
  Marek Dolata <mkdolata@us.ibm.com>
  Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
  Markus Armbruster <armbru@redhat.com>
  Martin Kaiser <martin@kaiser.cx>
  Masahiro Yamada <masahiroy@kernel.org>
  Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>
  Matt Borgerson <contact@mborgerson.com>
  Matthew Rosato <mjrosato@linux.ibm.com>
  Matthias Lüscher <lueschem@gmail.com>
  Max Filippov <jcmvbkbc@gmail.com>
  Max Reitz <mreitz@redhat.com>
  Maxim Levitsky <mlevitsk@redhat.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael Rolnik <mrolnik@gmail.com>
  Michael Roth <mdroth@linux.vnet.ibm.com>
  Michael S. Tsirkin <mst@redhat.com>
  Michal Privoznik <mprivozn@redhat.com>
  Micky Yun Chan (michiboo) <chanmickyyun@gmail.com>
  Micky Yun Chan <chanmickyyun@gmail.com>
  Miklos Szeredi <mszeredi@redhat.com>
  Miroslav Rezanina <mrezanin@redhat.com>
  Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
  mkdolata@us.ibm.com <mkdolata@us.ibm.com>
  Moger, Babu <Babu.Moger@amd.com>
  Nicholas Piggin <npiggin@gmail.com>
  Nick Erdmann <n@nirf.de>
  Niek Linnenbank <nieklinnenbank@gmail.com>
  Nikola Pavlica <pavlica.nikola@gmail.com>
  Oksana Vohchana <ovoshcha@redhat.com>
  Palmer Dabbelt <palmer@sifive.com>
  Palmer Dabbelt <palmerdabbelt@google.com>
  Pan Nengyuan <pannengyuan@huawei.com>
  PanNengyuan <pannengyuan@huawei.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Paul Durrant <paul@xen.org>
  Paul Durrant <pdurrant@amazon.com>
  Pavel Dovgalyuk <pavel.dovgaluk@gmail.com>
  Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>
  Peng Tao <tao.peng@linux.alibaba.com>
  Peter Krempa <pkrempa@redhat.com>
  Peter Maydell <peter.maydell@linaro.org>
  Peter Turschmid <peter.turschm@nutanix.com>
  Peter Wu <peter@lekensteyn.nl>
  Peter Xu <peterx@redhat.com>
  Philippe Mathieu-Daudé <f4bug@amsat.org>
  Philippe Mathieu-Daudé <philmd@redhat.com>
  piaojun <piaojun@huawei.com>
  Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
  Raphael Norwitz <raphael.norwitz@nutanix.com>
  Rene Stange <rsta2@o2online.de>
  Richard Henderson <richard.henderson@linaro.org>
  Richard Henderson <rth@twiddle.net>
  Robert Foley <robert.foley@linaro.org>
  Robert Hoo <robert.hu@linux.intel.com>
  Roman Kapl <rka@sysgo.com>
  Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
  Salvador Fandino <salvador@qindel.com>
  Sameeh Jubran <sjubran@redhat.com>
  Samuel Thibault <samuel.thibault@ens-lyon.org>
  Scott Cheloha <cheloha@linux.vnet.ibm.com>
  Sergio Lopez <slp@redhat.com>
  Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
  ShihPo Hung <shihpo.hung@sifive.com>
  Shivaprasad G Bhat <sbhat@linux.ibm.com>
  Simon Veith <sveith@amazon.de>
  Stafford Horne <shorne@gmail.com>
  Stefan Berger <stefanb@linux.ibm.com>
  Stefan Berger <stefanb@linux.vnet.ibm.com>
  Stefan Hajnoczi <stefanha@redhat.com>
  Stefan Weil <sw@weilnetz.de>
  Stefano Garzarella <sgarzare@redhat.com>
  Stefano Stabellini <stefano.stabellini@xilinx.com>
  Sunil Muthuswamy <sunilmut@microsoft.com>
  Suraj Jitindar Singh <sjitindarsingh@gmail.com>
  Sven Schnelle <svens@stackframe.org>
  Tao Xu <tao3.xu@intel.com>
  Taylor Simpson <tsimpson@quicinc.com>
  Thomas Huth <thuth@redhat.com>
  Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
  Tobias Koch <tobias.koch@nonterra.com>
  Tuguoyi <tu.guoyi@h3c.com>
  Vincent DEHORS <vincent.dehors@smile.fr>
  Vincent Fazio <vfazio@gmail.com>
  Vitaly Chikunov <vt@altlinux.org>
  Vivek Goyal <vgoyal@redhat.com>
  Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
  Volker Rümelin <vr_qemu@t-online.de>
  Wainer dos Santos Moschetta <wainersm@redhat.com>
  wangyong <wang.yongD@h3c.com>
  Wei Yang <richardw.yang@linux.intel.com>
  Willian Rampazzo <willianr@redhat.com>
  Willian Rampazzo <wrampazz@redhat.com>
  Xiang Zheng <zhengxiang9@huawei.com>
  Xiao Yang <yangx.jy@cn.fujitsu.com>
  Xiaoyao Li <xiaoyao.li@intel.com>
  Xinyu Li <precinct@mail.ustc.edu.cn>
  Yi Sun <yi.y.sun@linux.intel.com>
  Ying Fang <fangying1@huawei.com>
  Yiting Wang <yiting.wang@windriver.com>
  Yongbok Kim <yongbok.kim@mips.com>
  Yoshinori Sato <ysato@users.sourceforge.jp>
  Yu-Chen Lin <npes87184@gmail.com>
  Yu-Chen Lin <yuchenlin@synology.com>
  Yuri Benditovich <yuri.benditovich@daynix.com>
  Yury Kotov <yury-kotov@yandex-team.ru>
  Yuval Shaia <yuval.shaia.ml@gmail.com>
  Yuval Shaia <yuval.shaia@oracle.com>
  Zenghui Yu <yuzenghui@huawei.com>
  zhanghailiang <zhang.zhanghailiang@huawei.com>
  zhenwei pi <pizhenwei@bytedance.com>
  Zhimin Feng <fengzhimin1@huawei.com>

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
 test-amd64-amd64-dom0pvh-xl-amd                              starved 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    fail    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     fail    
 test-amd64-i386-freebsd10-amd64                              fail    
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
 test-amd64-amd64-dom0pvh-xl-intel                            fail    
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

(No revision log; it would be 54608 lines long.)

