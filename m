Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF2B3FDC0F
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 15:18:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176386.320976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLQ89-0004I1-A1; Wed, 01 Sep 2021 13:18:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176386.320976; Wed, 01 Sep 2021 13:18:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLQ89-0004Ez-4o; Wed, 01 Sep 2021 13:18:17 +0000
Received: by outflank-mailman (input) for mailman id 176386;
 Wed, 01 Sep 2021 13:18:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mLQ87-0004EZ-MM; Wed, 01 Sep 2021 13:18:15 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mLQ87-0002d1-GT; Wed, 01 Sep 2021 13:18:15 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mLQ87-0004zh-7I; Wed, 01 Sep 2021 13:18:15 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mLQ87-0004kd-6o; Wed, 01 Sep 2021 13:18:15 +0000
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
	bh=pO8xrE9MD3M/RlePB0hCndllLyMICn5OEKnGgj0YIoI=; b=ZEiJdBBsogdWFJed7sqYZCiCBU
	/PyHaEwuQvVmkeoca/I3bCEmC13rRInFzNygSz9fUmdjI4PEU1D8gwccXK/5QI20UFQNq04OkW6cB
	UtJmbEvb7zUgBQMXMj247We7IjCMcwYv2+zKqpyS0iSCKhGxXYv2SSKHiwy+48muUtmg=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164679-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-upstream-unstable test] 164679: tolerable FAIL - PUSHED
X-Osstest-Failures:
    qemu-upstream-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:guest-start/debianhvm.repeat:fail:heisenbug
    qemu-upstream-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    qemu-upstream-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-upstream-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    qemu-upstream-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-upstream-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-upstream-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-upstream-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-upstream-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    qemu-upstream-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    qemu-upstream-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-upstream-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    qemu-upstream-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    qemu-upstream-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    qemu-upstream-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    qemu-upstream-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    qemu-upstream-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    qemu-upstream-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-upstream-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    qemu-upstream-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-upstream-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-upstream-unstable:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    qemu-upstream-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    qemu-upstream-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    qemuu=b6e539830bf45e2d7a6bd86ddfdf003088b173b0
X-Osstest-Versions-That:
    qemuu=136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 01 Sep 2021 13:18:15 +0000

flight 164679 qemu-upstream-unstable real [real]
flight 164696 qemu-upstream-unstable real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/164679/
http://logs.test-lab.xenproject.org/osstest/logs/164696/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 18 guest-start/debianhvm.repeat fail pass in 164696-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 163309
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 163309
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 163309
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 163309
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 163309
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 163309
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 163309
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 qemuu                b6e539830bf45e2d7a6bd86ddfdf003088b173b0
baseline version:
 qemuu                136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823

Last test of basis   163309  2021-07-05 10:10:06 Z   58 days
Testing same since   164679  2021-08-31 11:08:25 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
    <ruixin.bao@ibm.com>
  Aaron Lindsay <aaron@os.amperecomputing.com>
  Ahmed Abouzied <email@aabouzied.com>
  Akihiko Odaki <akihiko.odaki@gmail.com>
  Alberto Garcia <berto@igalia.com>
  Aleksandar Rikalo <Aleksandar.Rikalo@syrmia.com>
  Alessandro Di Federico <ale@rev.ng>
  Alex Bennée <alex.bennee@linaro.org>
  Alex Williamson <alex.williamson@redhat.com>
  Alexander Bulekov <alxndr@bu.edu>
  Alexander Graf <agraf@csgraf.de>
  Alexander Wagner <alexander.wagner@ulal.de>
  Alexandre Iooss <erdnaxe@crans.org>
  Alexey Kardashevskiy <aik@ozlabs.ru>
  Alexey Neyman <stilor@att.net>
  Ali Shirvani <alishir@routerhosting.com>
  Alistair Francis <alistair.francis@wdc.com>
  Alyssa Ross <hi@alyssa.is>
  Andreas Schwab <schwab@suse.de>
  Andrew Jones <drjones@redhat.com>
  Andrew Melnychenko <andrew@daynix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Ard Biesheuvel <ardb@kernel.org>
  Arseny Krasnov <arseny.krasnov@kaspersky.com>
  Atish Patra <atish.patra@wdc.com>
  Axel Heider <axelheider@gmx.de>
  BALATON Zoltan <balaton@eik.bme.hu>
  Basil Salman <basil@daynix.com>
  Basil Salman <basil@redhat.com>
  Basil Salman <bsalman@daynix.com>
  Basil Salman <bsalman@redhat.com>
  Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
  Benjamin Herrenschmidt <benh@kernel.crashing.org>
  Bharata B Rao <bharata@linux.ibm.com>
  Bibo Mao <maobibo@loongson.cn>
  Bin Meng <bin.meng@windriver.com>
  Bin Meng <bmeng.cn@gmail.com>
  Brad Smith <brad@comstyle.com>
  Brijesh Singh <brijesh.singh@amd.com>
  Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
  Cai Huoqing <caihuoqing@baidu.com>
  Carlos Venegas <jose.carlos.venegas.munoz@intel.com>
  Changbin Du <changbin.du@gmail.com>
  Chenyi Qiang <chenyi.qiang@intel.com>
  Chetan Pant <chetan4windows@gmail.com>
  Cho, Yu-Chen <acho@suse.com>
  Christian Borntraeger <borntraeger@de.ibm.com>
  Christian Schoenebeck <qemu_oss@crudebyte.com>
  Christina Wang <christina.wang@windriver.com>
  Claudio Fontana <cfontana@suse.de>
  Cleber Rosa <crosa@redhat.com>
  Coiby Xu <coiby.xu@gmail.com>
  Cole Robinson <crobinso@redhat.com>
  Connor Kuehl <ckuehl@redhat.com>
  Corey Minyard <cminyard@mvista.com>
  Cornelia Huck <cohuck@redhat.com>
  Cédric Le Goater <clg@kaod.org>
  Damien Goutte-Gattat <dgouttegattat@incenp.org>
  Daniel Henrique Barboza <danielhb413@gmail.com>
  Daniel P. Berrangé <berrange@redhat.com>
  David Edmondson <david.edmondson@oracle.com>
  David Gibson <david@gibson.dropbear.id.au>
  David Hildenbrand <david@redhat.com>
  David Michael <fedora.dm0@gmail.com>
  Dennis Wölfing <denniswoelfing@gmx.de>
  Dmitry Voronetskiy <davoronetskiy@gmail.com>
  Dmitry Voronetskiy <vda1999@yandex.ru>
  Dov Murik <dovmurik@linux.ibm.com>
  Dr. David Alan Gilbert <dgilbert@redhat.com>
  Dylan Jhong <dylan@andestech.com>
  Edgar E. Iglesias <edgar.iglesias@xilinx.com>
  Eduardo Habkost <ehabkost@redhat.com>
  Eduardo Habkost <ehabkost@redhat.com> for memory backend and machine core
  Eduardo Otubo <otubo@redhat.com>
  Emanuele Giuseppe Esposito <eesposit@redhat.com>
  Emmanuel Blot <emmanuel.blot@sifive.com>
  Eric Auger <eric.auger@redhat.com>
  Eric Blake <eblake@redhat.com>
  Eric Farman <farman@linux.ibm.com>
  Fabian Ebner <f.ebner@proxmox.com>
  Fabiano Rosas <farosas@linux.ibm.com>
  Fabrice Fontaine <fontaine.fabrice@gmail.com>
  Feng Lin <linfeng23@huawei.com>
  Filip Vidojevic <filip.vidojevic@syrmia.com>
  Finn Thain <fthain@linux-m68k.org>
  Frank Chang <frank.chang@sifive.com>
  Frederic Konrad <frederic.konrad@adacore.com>
  Frederic Konrad <konrad@adacore.com>
  Gan Qixin <ganqixin@huawei.com>
  Gerd Hoffmann <kraxel@redhat.com>
  Giuseppe Musacchio <thatlemon@gmail.com>
  Gollu Appalanaidu <anaidu.gollu@samsung.com>
  Greg Kurz <groug@kaod.org>
  Guenter Roeck <linux@roeck-us.net>
  Han Han <hhan@redhat.com>
  Hanna Reitz <hreitz@redhat.com>
  Heinrich Schuchardt <xypron.glpk@gmx.de>
  hnick@vmware.com <hnick@vmware.com>
  Hongzheng-Li <Ethan.Lee.QNL@gmail.com>
  Hou Weiying <weiying_hou@outlook.com>
  Hubert Jasudowicz <hubert.jasudowicz@gmail.com>
  Hyman <huangy81@chinatelecom.cn>
  Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
  Ian Jackson <ian.jackson@eu.citrix.com>
  Igor Druzhinin <igor.druzhinin@citrix.com>
  Igor Mammedov &lt;<a href="mailto:imammedo@redhat.com" target="_blank">imammedo@redhat.com</a>&gt;<br>
  Igor Mammedov <imammedo@redhat.com>
  Ilya Dryomov <idryomov@gmail.com>
  Ilya Leoshkevich <iii@linux.ibm.com>
  Jade Fink <qemu@jade.fyi>
  Jagannathan Raman <jag.raman@oracle.com>
  James Bottomley <jejb@linux.ibm.com>
  Jamie Iles <jamie@nuviainc.com>
  Jason Andryuk <jandryuk@gmail.com>
  Jason Thorpe <thorpej@me.com>
  Jason Wang <jasowang@redhat.com>
  Jean-Philippe Brucker <jean-philippe@linaro.org>
  Jinhua Cao <caojinhua1@huawei.com>
  Joe Komlodi <joe.komlodi@xilinx.com>
  Joel Stanley <joel@jms.id.au>
  Joelle van Dyne <j@getutm.app>
  John Arbuckle <programmingkidx@gmail.com>
  John Snow <jsnow@redhat.com>
  John Sucaet <john.sucaet@ekinops.com>
  Jonathan Albrecht <jonathan.albrecht@linux.vnet.ibm.com>
  jonathan.albrecht <jonathan.albrecht@linux.vnet.ibm.com>
  Jose Martins <josemartins90@gmail.com>
  Jose R. Ziviani <jziviani@suse.de>
  Juergen Lock <nox@FreeBSD.org>
  Julia Suvorova <jusual@redhat.com>
  Kamil Rytarowski <kamil@NetBSD.org>
  Katsuhiro Ueno <uenobk@gmail.com>
  Keith Busch <kbusch@kernel.org>
  Keqian Zhu <zhukeqian1@huawei.com>
  Kevin Wolf <kwolf@redhat.com>
  Khem Raj <raj.khem@gmail.com>
  Kirill Tkhai <ktkhai@virtuozzo.com>
  Kirti Wankhede <kwankhede@nvidia.com>
  Kit Westneat <kit.westneat@gmail.com>
  Kito Cheng <kito.cheng@sifive.com>
  Klaus Jensen <k.jensen@samsung.com>
  KONRAD Frederic <frederic.konrad@adacore.com>
  Konstantin Nazarov <mail@knazarov.com>
  Kostiantyn Kostiuk <konstantin@daynix.com>
  Kunkun Jiang <jiangkunkun@huawei.com>
  Lara Lazier <laramglazier@gmail.com>
  Laszlo Ersek <lersek@redhat.com>
  Laurent Vivier <laurent@vivier.eu>
  Laurent Vivier <lvivier@redhat.com>
  Lei Rao <lei.rao@intel.com>
  Leonardo Bras <leobras.c@gmail.com>
  Li Qiang <liq3ea@163.com>
  Li Qiang <liq3ea@gmail.com>
  Li Zhijian <lizhijian@cn.fujitsu.com>
  Liren Wei <lrwei@bupt.edu.cn>
  LIU Zhiwei <zhiwei_liu@c-sky.com>
  Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
  Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
  Luis Pires <luis.pires@eldorado.org.br>
  Lukas Jünger <lukas.juenger@greensocs.com>
  Lukas Straub <lukasstraub2@web.de>
  Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
  Mahesh Salgaonkar <mahesh@linux.ibm.com>
  Mahmoud Mandour <ma.mandourr@gmail.com>
  Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
  maobibo <maobibo@loongson.cn>
  Marc Hartmayer <mhartmay@linux.ibm.com>
  Marc-André Lureau <marcandre.lureau@redhat.com>
  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
  Marcel Apfelbaum <marcel@redhat.com>
  Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
  Mark Johnston <markj@FreeBSD.org>
  Mark Nelson <mdnelson8@gmail.com>
  Markus Armbruster <armbru@redhat.com>
  Matheus Ferst <matheus.ferst@eldorado.org.br>
  Mathieu Poirier <mathieu.poirier@linaro.org>
  Matthew Rosato <mjrosato@linux.ibm.com>
  Matus Kysel <mkysel@tachyum.com>
  Mauro Matteo Cascella <mcascell@redhat.com>
  Max Filippov <jcmvbkbc@gmail.com>
  Max Reitz <mreitz@redhat.com>
  Maxim Levitsky <mlevitsk@redhat.com>
  Maxim Uvarov <maxim.uvarov@linaro.org>
  Michael Forney <mforney@mforney.org>
  Michael Rolnik <mrolnik@gmail.com>
  Michael Roth <michael.roth@amd.com>
  Michael S. Tsirkin <mst@redhat.com>
  Michael Tokarev <mjt@tls.msk.ru>
  Michael Walle <michael@walle.cc>
  Michal Privoznik <mprivozn@redhat.com>
  Miroslav Rezanina <mrezanin@redhat.com>
  Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
  Myriad-Dreamin <camiyoru@gmail.com>
  Nicholas Piggin <npiggin@gmail.com>
  Nick Hudson <hnick@vmware.com>
  Niklas Cassel <niklas.cassel@wdc.com>
  Nolan Leake <nolan@sigbus.net>
  Olaf Hering <olaf@aepfle.de>
  Or Ozeri <oro@il.ibm.com>
  Owen Anderson <oanderso@google.com>
  Padmakar Kalghatgi <p.kalghatgi@samsung.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Paolo Montesel <babush@rev.ng>
  Patrick Venture <venture@google.com>
  Paul A. Clarke <pc@us.ibm.com>
  Paul Durrant <paul@xen.org>
  Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
  Pavel Pisa <pisa@cmp.felk.cvut.cz>
  Peng Liang <liangpeng10@huawei.com>
  Peter Collingbourne <pcc@google.com>
  Peter Krempa <pkrempa@redhat.com>
  Peter Lieven <pl@kamp.de>
  Peter Maydell <peter.maydell@linaro.org>
  Peter Xu <peterx@redhat.com>
  Philippe Mathieu-Daudé <f4bug@amsat.org>
  Philippe Mathieu-Daudé <philmd@redhat.com>
  Qiang Liu <cyruscyliu@gmail.com>
  Ram Pai <linuxram@us.ibm.com>
  Rao, Lei <lei.rao@intel.com>
  Raphael Norwitz <raphael.norwitz@nutanix.com>
  Ravi Bangoria <ravi.bangoria@linux.ibm.com>
  Rebecca Cran <rebecca@nuviainc.com>
  Reinoud Zandijk <reinoud@NetBSD.org>
  Ricardo Koller <ricarkol@google.com>
  Ricgard Henderson <richard.henderson@linaro.org>
  Richard Henderson <richard.henderson@linaro.org>
  Richard W.M. Jones <rjones@redhat.com>
  Richard Zak <richard.j.zak@gmail.com>
  Robert Hoo <robert.hu@linux.intel.com>
  Roman Bolshakov <r.bolshakov@yadro.com>
  Roman Kagan <rvkagan@yandex-team.ru>
  Roman Kapl <rka@sysgo.com>
  Ruimei Yan <ruimei.yan@windriver.com>
  Ruinland ChuanTzu Tsai <ruinland@andestech.com>
  Samuel Thibault <samuel.thibault@ens-lyon.org>
  Serge Guelton <sguelton@redhat.com>
  Sergio Lopez <slp@redhat.com>
  Shivaprasad G Bhat <sbhat@linux.ibm.com>
  Silvano Cirujano Cuesta <silvano.cirujano-cuesta@siemens.com>
  Stefan Berger <stefanb@linux.ibm.com>
  Stefan Hajnoczi <stefanha@redhat.com>
  Stefan Reiter <s.reiter@proxmox.com>
  Stefan Weil <sw@weilnetz.de>
  Stefano Garzarella <sgarzare@redhat.com>
  Stephen Long <steplong@quicinc.com>
  Tarun Gupta <targupta@nvidia.com>
  Taylor Simpson <tsimpson@quicinc.com>
  Thomas Huth <thuth@redhat.com>
  Titus Rwantare <titusr@google.com>
  Tom Lendacky <thomas.lendacky@amd.com>
  Ulrich Weigand <ulrich.weigand@de.ibm.com>
  Vaibhav Jain <vaibhav@linux.ibm.com>
  VictorV (Kunlun Lab) <vv474172261@gmail.com>
  Vijai Kumar K <vijai@behindbytes.com>
  Viktor Ashirov <vashirov@redhat.com>
  Vincent Bernat <vincent@bernat.ch>
  Viresh Kumar <viresh.kumar@linaro.org>
  Vitaly Kuznetsov <vkuznets@redhat.com>
  Vivek Goyal <vgoyal@redhat.com>
  Vivek Kasireddy <vivek.kasireddy@intel.com>
  Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
  Volker Rümelin <vr_qemu@t-online.de>
  Wainer dos Santos Moschetta <wainersm@redhat.com>
  Warner Losh <imp@bsdimp.com>
  Wei Liu <wei.liu2@citrix.com>
  Wei Wang <wei.w.wang@intel.com>
  Willian Rampazzo <willianr@redhat.com>
  Xie Yongji <xieyongji@bytedance.com>
  Xingang Wang <wangxingang5@huawei.com>
  Xuzhou Cheng <xuzhou.cheng@windriver.com>
  YAMAMOTO Takashi <yamamoto@midokura.com>
  Yang Zhong <yang.zhong@intel.com>
  Yasuo Kuwahara <kwhr00@gmail.com>
  Yuri Benditovich <yuri.benditovich@daynix.com>
  Yuval Shaia <yuval.shaia.ml@gmail.com>
  Zenghui Yu <yuzenghui@huawei.com>
  Zhang Chen <chen.zhang@intel.com>
  zhenwei pi <pizhenwei@bytedance.com>
  Zhenzhong Duan <zhenzhong.duan@intel.com>
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
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            fail    
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
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
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


Pushing revision :

To xenbits.xen.org:/home/xen/git/qemu-xen.git
   136c34c9bc..b6e539830b  b6e539830bf45e2d7a6bd86ddfdf003088b173b0 -> master

