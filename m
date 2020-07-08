Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C202191C4
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jul 2020 22:45:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jtGvF-0002g2-KA; Wed, 08 Jul 2020 20:44:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=okql=AT=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jtGvD-0002fY-Pq
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2020 20:44:03 +0000
X-Inumbo-ID: bdf48596-c15b-11ea-bb8b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bdf48596-c15b-11ea-bb8b-bc764e2007e4;
 Wed, 08 Jul 2020 20:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x4BZCyfNq5FAECX+m3n2YDIJbbhRHWpNTAHhi3bcKmI=; b=dH5+F1nmzBtN/rOH7NrG+j+2/
 /USg4enJTH8eOSM1Bg03p6r35ePpMonZhCZ/j826L6GASpeZvPJogftr47ICGwlX+PgyXcOqh+nZI
 ViUSGqzkUV8hiwWYaBKdP20k/RCLZ1LMJ1m0otxQNzldtQ7UCwkCHNPrhQ9Tvry9MnExk=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jtGv5-0001yI-PR; Wed, 08 Jul 2020 20:43:55 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jtGv5-000116-CJ; Wed, 08 Jul 2020 20:43:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jtGv5-00065i-5P; Wed, 08 Jul 2020 20:43:55 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151721-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 151721: regressions - FAIL
X-Osstest-Failures: qemu-mainline:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-amd64-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:windows-install:fail:regression
 qemu-mainline:test-amd64-amd64-libvirt-vhd:debian-di-install:fail:regression
 qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:windows-install:fail:regression
 qemu-mainline:test-amd64-amd64-qemuu-nested-intel:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-i386-libvirt-xsm:guest-start:fail:regression
 qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:windows-install:fail:regression
 qemu-mainline:test-amd64-i386-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-amd64-xl-qcow2:debian-di-install:fail:regression
 qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-i386-qemuu-rhel6hvm-amd:redhat-install:fail:regression
 qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-amd64:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:windows-install:fail:regression
 qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-i386-libvirt-pair:guest-start/debian:fail:regression
 qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
 qemu-mainline:test-amd64-i386-freebsd10-i386:guest-start:fail:regression
 qemu-mainline:test-amd64-i386-qemuu-rhel6hvm-intel:redhat-install:fail:regression
 qemu-mainline:test-amd64-amd64-libvirt:guest-start:fail:regression
 qemu-mainline:test-amd64-amd64-libvirt-xsm:guest-start:fail:regression
 qemu-mainline:test-amd64-i386-libvirt:guest-start:fail:regression
 qemu-mainline:test-amd64-i386-freebsd10-amd64:guest-start:fail:regression
 qemu-mainline:test-armhf-armhf-xl-vhd:debian-di-install:fail:regression
 qemu-mainline:test-amd64-amd64-libvirt-pair:guest-start/debian:fail:regression
 qemu-mainline:test-armhf-armhf-libvirt:guest-start:fail:regression
 qemu-mainline:test-arm64-arm64-libvirt-xsm:guest-start:fail:regression
 qemu-mainline:test-armhf-armhf-libvirt-raw:debian-di-install:fail:regression
 qemu-mainline:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 qemu-mainline:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 qemu-mainline:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: qemuu=c8eaf81fd22638691c5bdcc7d723d31fbb80ff6f
X-Osstest-Versions-That: qemuu=9e3903136d9acde2fb2dd9e967ba928050a6cb4a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 08 Jul 2020 20:43:55 +0000
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

flight 151721 qemu-mainline real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151721/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 10 debian-hvm-install fail REGR. vs. 151065
 test-amd64-amd64-xl-qemuu-ovmf-amd64 10 debian-hvm-install fail REGR. vs. 151065
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 10 debian-hvm-install fail REGR. vs. 151065
 test-amd64-amd64-xl-qemuu-win7-amd64 10 windows-install  fail REGR. vs. 151065
 test-amd64-amd64-libvirt-vhd 10 debian-di-install        fail REGR. vs. 151065
 test-amd64-i386-xl-qemuu-win7-amd64 10 windows-install   fail REGR. vs. 151065
 test-amd64-amd64-qemuu-nested-intel 10 debian-hvm-install fail REGR. vs. 151065
 test-amd64-i386-libvirt-xsm  12 guest-start              fail REGR. vs. 151065
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 10 debian-hvm-install fail REGR. vs. 151065
 test-amd64-amd64-xl-qemuu-ws16-amd64 10 windows-install  fail REGR. vs. 151065
 test-amd64-i386-xl-qemuu-ovmf-amd64 10 debian-hvm-install fail REGR. vs. 151065
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 10 debian-hvm-install fail REGR. vs. 151065
 test-amd64-amd64-qemuu-nested-amd 10 debian-hvm-install  fail REGR. vs. 151065
 test-amd64-amd64-xl-qcow2    10 debian-di-install        fail REGR. vs. 151065
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 10 debian-hvm-install fail REGR. vs. 151065
 test-amd64-i386-qemuu-rhel6hvm-amd 10 redhat-install     fail REGR. vs. 151065
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 10 debian-hvm-install fail REGR. vs. 151065
 test-amd64-i386-xl-qemuu-debianhvm-amd64 10 debian-hvm-install fail REGR. vs. 151065
 test-amd64-i386-xl-qemuu-ws16-amd64 10 windows-install   fail REGR. vs. 151065
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow 10 debian-hvm-install fail REGR. vs. 151065
 test-amd64-i386-libvirt-pair 21 guest-start/debian       fail REGR. vs. 151065
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 10 debian-hvm-install fail REGR. vs. 151065
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 10 debian-hvm-install fail REGR. vs. 151065
 test-amd64-i386-freebsd10-i386 11 guest-start            fail REGR. vs. 151065
 test-amd64-i386-qemuu-rhel6hvm-intel 10 redhat-install   fail REGR. vs. 151065
 test-amd64-amd64-libvirt     12 guest-start              fail REGR. vs. 151065
 test-amd64-amd64-libvirt-xsm 12 guest-start              fail REGR. vs. 151065
 test-amd64-i386-libvirt      12 guest-start              fail REGR. vs. 151065
 test-amd64-i386-freebsd10-amd64 11 guest-start           fail REGR. vs. 151065
 test-armhf-armhf-xl-vhd      10 debian-di-install        fail REGR. vs. 151065
 test-amd64-amd64-libvirt-pair 21 guest-start/debian      fail REGR. vs. 151065
 test-armhf-armhf-libvirt     12 guest-start              fail REGR. vs. 151065
 test-arm64-arm64-libvirt-xsm 12 guest-start              fail REGR. vs. 151065
 test-armhf-armhf-libvirt-raw 10 debian-di-install        fail REGR. vs. 151065

Tests which did not succeed, but are not blocking:
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass

version targeted for testing:
 qemuu                c8eaf81fd22638691c5bdcc7d723d31fbb80ff6f
baseline version:
 qemuu                9e3903136d9acde2fb2dd9e967ba928050a6cb4a

Last test of basis   151065  2020-06-12 22:27:51 Z   25 days
Failing since        151101  2020-06-14 08:32:51 Z   24 days   31 attempts
Testing same since   151721  2020-07-07 18:37:11 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
  Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
  Alex Bennée <alex.bennee@linaro.org>
  Alex Williamson <alex.williamson@redhat.com>
  Alexander Bulekov <alxndr@bu.edu>
  Alexey Krasikov <alex-krasikov@yandex-team.ru>
  Alistair Francis <alistair.francis@wdc.com>
  Allan Peramaki <aperamak@pp1.inet.fi>
  Andrew Jones <drjones@redhat.com>
  Ani Sinha <ani.sinha@nutanix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Ard Biesheuvel <ardb@kernel.org>
  Artyom Tarasenko <atar4qemu@gmail.com>
  Aurelien Jarno <aurelien@aurel32.net>
  Babu Moger <babu.moger@amd.com>
  BALATON Zoltan <balaton@eik.bme.hu>
  Beata Michalska <beata.michalska@linaro.org>
  Bin Meng <bin.meng@windriver.com>
  Cathy Zhang <cathy.zhang@intel.com>
  Chen Gang <chengang@emindsoft.com.cn>
  Christian Borntraeger <borntraeger@de.ibm.com>
  Cindy Lu <lulu@redhat.com>
  Claudio Fontana <cfontana@suse.de>
  Cleber Rosa <crosa@redhat.com>
  Colin Xu <colin.xu@intel.com>
  Cornelia Huck <cohuck@redhat.com>
  Cédric Le Goater <clg@kaod.org>
  Daniel P. Berrangé <berrange@redhat.com>
  Daniele Buono <dbuono@linux.vnet.ibm.com>
  David Carlier <devnexen@gmail.com>
  David Gibson <david@gibson.dropbear.id.au>
  David Hildenbrand <david@redhat.com>
  Derek Su <dereksu@qnap.com>
  Dr. David Alan Gilbert <dgilbert@redhat.com>
  Edgar E. Iglesias <edgar.iglesias@xilinx.com>
  Eduardo Habkost <ehabkost@redhat.com>
  Emilio G. Cota <cota@braap.org>
  Eric Auger <eric.auger@redhat.com>
  Eric Blake <eblake@redhat.com>
  Eric Farman <farman@linux.ibm.com>
  Erik Smit <erik.lucas.smit@gmail.com>
  Evgeny Yakovlev <eyakovlev@virtuozzo.com>
  fangying <fangying1@huawei.com>
  Farhan Ali <alifm@linux.ibm.com>
  Filip Bozuta <Filip.Bozuta@syrmia.com>
  Finn Thain <fthain@telegraphics.com.au>
  Geoffrey McRae <geoff@hostfission.com>
  Gerd Hoffmann <kraxel@redhat.com>
  Giuseppe Musacchio <thatlemon@gmail.com>
  Greg Kurz <groug@kaod.org>
  Guenter Roeck <linux@roeck-us.net>
  Gustavo Romero <gromero@linux.ibm.com>
  Halil Pasic <pasic@linux.ibm.com>
  Helge Deller <deller@gmx.de>
  Huacai Chen <chenhc@lemote.com>
  Huacai Chen <zltjiangshi@gmail.com>
  Ian Jiang <ianjiang.ict@gmail.com>
  Igor Mammedov <imammedo@redhat.com>
  Janne Grunau <j@jannau.net>
  Janosch Frank <frankja@linux.ibm.com>
  Jason Wang <jasowang@redhat.com>
  Jay Zhou <jianjay.zhou@huawei.com>
  Jean-Christophe Dubois <jcd@tribudubois.net>
  Jessica Clarke <jrtc27@jrtc27.com>
  Jiaxun Yang <jiaxun.yang@flygoat.com>
  Jingqi Liu <jingqi.liu@intel.com>
  John Snow <jsnow@redhat.com>
  Jon Doron <arilou@gmail.com>
  Joseph Myers <joseph@codesourcery.com>
  Julio Faracco <jcfaracco@gmail.com>
  Keqian Zhu <zhukeqian1@huawei.com>
  Kevin Wolf <kwolf@redhat.com>
  Klaus Jensen <k.jensen@samsung.com>
  Klaus Jensen <klaus.jensen@cnexlabs.com>
  Laurent Vivier <laurent@vivier.eu>
  Laurent Vivier <lvivier@redhat.com>
  Leonid Bloch <lb.workbox@gmail.com>
  Leonid Bloch <lbloch@janustech.com>
  Li Qiang <liq3ea@gmail.com>
  Liao Pingfang <liao.pingfang@zte.com.cn>
  lichun <lichun@ruijie.com.cn>
  Like Xu <like.xu@linux.intel.com>
  Lingfeng Yang <lfy@google.com>
  Lingshan zhu <lingshan.zhu@intel.com>
  Liran Alon <liran.alon@oracle.com>
  LIU Zhiwei <zhiwei_liu@c-sky.com>
  Lukas Straub <lukasstraub2@web.de>
  Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
  Magnus Damm <magnus.damm@gmail.com>
  Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
  Marcelo Tosatti <mtosatti@redhat.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
  Markus Armbruster <armbru@redhat.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Max Filippov <jcmvbkbc@gmail.com>
  Max Reitz <mreitz@redhat.com>
  Maxime Coquelin <maxime.coquelin@redhat.com>
  Michael S. Tsirkin <mst@redhat.com>
  Michele Denber <denber@mindspring.com>
  Nir Soffer <nsoffer@redhat.com>
  Pan Nengyuan <pannengyuan@huawei.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Pavel Dovgalyuk <Pavel.Dovgaluk@gmail.com>
  Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>
  Peter Maydell <peter.maydell@linaro.org>
  Peter Xu <peterx@redhat.com>
  Philippe Mathieu-Daude <philmd@redhat.com>
  Philippe Mathieu-Daudé <f4bug@amsat.org>
  Philippe Mathieu-Daudé <philmd@redhat.com>
  Prasad J Pandit <pjp@fedoraproject.org>
  Raphael Norwitz <raphael.norwitz@nutanix.com>
  Richard Henderson <richard.henderson@linaro.org>
  Richard W.M. Jones <rjones@redhat.com>
  Riku Voipio <riku.voipio@linaro.org>
  Robert Foley <robert.foley@linaro.org>
  Roman Bolshakov <r.bolshakov@yadro.com>
  Roman Kagan <rkagan@virtuozzo.com>
  Roman Kagan <rvkagan@yandex-team.ru>
  Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
  Sebastian Rasmussen <sebras@gmail.com>
  Sergio Lopez <slp@redhat.com>
  Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
  Stefan Berger <stefanb@linux.ibm.com>
  Stefan Berger <stefanb@linux.vnet.ibm.com>
  Stefan Hajnoczi <stefanha@redhat.com>
  Tao Xu <tao3.xu@intel.com>
  Thomas Huth <huth@tuxfamily.org>
  Thomas Huth <thuth@redhat.com>
  Tiwei Bie <tiwei.bie@intel.com>
  Tong Ho <tong.ho@xilinx.com>
  Vivek Goyal <vgoyal@redhat.com>
  Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
  Volker Rümelin <vr_qemu@t-online.de>
  WangBowen <bowen.wang@intel.com>
  Wei Huang <wei.huang2@amd.com>
  Wei Wang <wei.w.wang@intel.com>
  Ying Fang <fangying1@huawei.com>
  Yoshinori Sato <ysato@users.sourceforge.jp>
  Yuri Benditovich <yuri.benditovich@daynix.com>
  Zhang Chen <chen.zhang@intel.com>

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

(No revision log; it would be 19299 lines long.)

