Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB76875E08F
	for <lists+xen-devel@lfdr.de>; Sun, 23 Jul 2023 11:02:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568166.887579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNUx5-0003zq-Ha; Sun, 23 Jul 2023 09:00:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568166.887579; Sun, 23 Jul 2023 09:00:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNUx5-0003yE-Ec; Sun, 23 Jul 2023 09:00:31 +0000
Received: by outflank-mailman (input) for mailman id 568166;
 Sun, 23 Jul 2023 09:00:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qNUx3-0003xx-OB; Sun, 23 Jul 2023 09:00:29 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qNUx3-0002Ow-K0; Sun, 23 Jul 2023 09:00:29 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qNUx3-00033y-5B; Sun, 23 Jul 2023 09:00:29 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qNUx3-0002Wr-4l; Sun, 23 Jul 2023 09:00:29 +0000
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
	bh=2kn0mmAkJuWdIzODHF0341KaOs80e6IUdNg7+fILLDs=; b=gnMqKY/fiy02pRoU35zhjPtWkm
	1h1bgwyiIWkVbM5AuMQ5EoF+VoiWafApUAvGWfLtwSRgHZnj39jX8rzFR8RHuA0t7yinUskFCI95e
	Cjys2f1am4LhFlUlkoB1sgWESYyYGb5/LlvKg0UvCArx1k3vv5tY7/7DdkF/KVtCaLSs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181975-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-upstream-unstable test] 181975: tolerable FAIL - PUSHED
X-Osstest-Failures:
    qemu-upstream-unstable:test-amd64-amd64-libvirt-vhd:guest-start/debian.repeat:fail:heisenbug
    qemu-upstream-unstable:test-amd64-i386-xl-qemuu-ovmf-amd64:xen-install:fail:heisenbug
    qemu-upstream-unstable:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:guest-start/debianhvm.repeat:fail:heisenbug
    qemu-upstream-unstable:test-amd64-amd64-dom0pvh-xl-amd:guest-start:fail:nonblocking
    qemu-upstream-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-upstream-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-upstream-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-upstream-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-upstream-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    qemu-upstream-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    qemu-upstream-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    qemu-upstream-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-upstream-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    qemu-upstream-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-upstream-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    qemu-upstream-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    qemu-upstream-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    qemu-upstream-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-upstream-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    qemu-upstream-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    qemu-upstream-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    qemu-upstream-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-upstream-unstable:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-upstream-unstable:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    qemu-upstream-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-upstream-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    qemu-upstream-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    qemu-upstream-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-upstream-unstable:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    qemuu=698407ef8395521a9a5b15ed9cd0b7e1fc258ded
X-Osstest-Versions-That:
    qemuu=8c51cd970509b97d8378d175646ec32889828158
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 23 Jul 2023 09:00:29 +0000

flight 181975 qemu-upstream-unstable real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181975/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-libvirt-vhd 19 guest-start/debian.repeat fail in 181963 pass in 181975
 test-amd64-i386-xl-qemuu-ovmf-amd64  7 xen-install         fail pass in 181963
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 14 guest-start/debianhvm.repeat fail pass in 181963

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-dom0pvh-xl-amd 14 guest-start      fail in 181963 like 180030
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 180030
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 180030
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 180030
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 180030
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 180030
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt   16 saverestore-support-check fail starved in 180030
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check fail starved in 180030
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check fail starved in 180030

version targeted for testing:
 qemuu                698407ef8395521a9a5b15ed9cd0b7e1fc258ded
baseline version:
 qemuu                8c51cd970509b97d8378d175646ec32889828158

Last test of basis   180030  2023-03-27 14:09:05 Z  117 days
Testing same since   181963  2023-07-21 15:11:10 Z    1 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Akihiko Odaki <akihiko.odaki@daynix.com>
  Albert Esteve <aesteve@redhat.com>
  Alex Bennée <alex.bennee@linaro.org>
  Alexander Bulekov <alxndr@bu.edu>
  Alistair Francis <alistair.francis@wdc.com>
  Anastasia Belova <abelova@astralinux.ru>
  Ani Sinha <anisinha@redhat.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Anton Johansson <anjo@rev.ng>
  Ard Biesheuvel <ardb@kernel.org>
  Bernhard Beschow <shentey@gmail.com>
  Bin Meng <bin.meng@windriver.com>
  Carlos López <clopez@suse.de>
  Chenyi Qiang <chenyi.qiang@intel.com>
  Christian Schoenebeck <qemu_oss@crudebyte.com>
  Chuck Zmudzinski <brchuckz@aol.com>
  Clément Chigot <chigot@adacore.com>
  Cédric Le Goater <clg@kaod.org>
  Cédric Le Goater <clg@redhat.com>
  Daniel Bertalan <dani@danielbertalan.dev>
  Daniel Henrique Barboza <danielhb413@gmail.com>
  Daniel P. Berrangé <berrange@redhat.com>
  Daniil Kovalev <dkovalev@compiler-toolchain-for.me>
  David Daney <david.daney@fungible.com>
  David Hildenbrand <david@redhat.com>
  Dongwon Kim <dongwon.kim@intel.com>
  Dov Murik <dovmurik@linux.ibm.com>
  Dr. David Alan Gilbert &lt;<a href="mailto:dgilbert@redhat.com" target="_blank">dgilbert@redhat.com</a>&gt;<br>
  Dr. David Alan Gilbert <dgilbert@redhat.com>
  Eric Blake <eblake@redhat.com>
  Erico Nunes <ernunes@redhat.com>
  Eugenio Pérez <eperezma@redhat.com>
  Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
  Fiona Ebner <f.ebner@proxmox.com>
  Francisco Iglesias <frasse.iglesias@gmail.com>
  Gerd Hoffmann <kraxel@redhat.com>
  Greg Kurz <groug@kaod.org>
  Guenter Roeck <linux@roeck-us.net>
  Hawkins Jiawei <yin31149@gmail.com>
  Helge Deller <deller@gmx.de>
  Igor Mammedov <imammedo@redhat.com>
  Ilya Leoshkevich <iii@linux.ibm.com>
  Jagannathan Raman <jag.raman@oracle.com>
  Jason Andryuk <jandryuk@gmail.com>
  Jason Wang <jasowang@redhat.com>
  Jiri Pirko <jiri@nvidia.com>
  Juan Quintela <quintela@redhat.com>
  Julia Suvorova <jusual@redhat.com>
  Kevin Wolf <kwolf@redhat.com>
  Klaus Jensen <k.jensen@samsung.com>
  Konstantin Kostiuk <kkostiuk@redhat.com>
  Kostiantyn Kostiuk <kostyanf14@live.com>
  Laszlo Ersek <lersek@redhat.com>
  Laurent Vivier <laurent@vivier.eu>
  Laurent Vivier <lvivier@redhat.com>
  Lei Yang <leiyang@redhat.com>
  LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
  Lukas Straub <lukasstraub2@web.de>
  Lukas Tschoke <lukts330@gmail.com>
  Marc-André Lureau <marcandre.lureau@redhat.com>
  Mark Somerville <mark@qpok.net>
  Markus Armbruster <armbru@redhat.com>
  Mathis Marion <mathis.marion@silabs.com>
  Mattias Nissler <mnissler@rivosinc.com>
  Mauro Matteo Cascella <mcascell@redhat.com>
  Maxime Coquelin <maxime.coquelin@redhat.com>
  Michael S. Tsirkin <mst@redhat.com>
  Michael Tokarev <mjt@tls.msk.ru>
  Nathan Chancellor <nathan@kernel.org>
  Nicholas Piggin <npiggin@gmail.com>
  Nina Schoetterl-Glausch <nsg@linux.ibm.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Peter Maydell <peter.maydell@linaro.org>
  Peter Xu <peterx@redhat.com>
  Philippe Mathieu-Daudé <philmd@linaro.org>
  Pierrick Bouvier <pierrick.bouvier@linaro.org>
  Prasad Pandit <pjp@fedoraproject.org>
  Richard Henderson <richard.henderson@linaro.org>
  Ryan Wendland <wendland@live.com.au>
  Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
  Shivaprasad G Bhat <sbhat@linux.ibm.com>
  Stefan Hajnoczi <stefanha@redhat.com>
  Tested-By: Solra Bizna <solra@bizna.name>
  Thomas Huth <thuth@redhat.com>
  timothee.cocault@gmail.com <timothee.cocault@gmail.com>
  Timothée Cocault <timothee.cocault@gmail.com>
  Tommy Wu <tommy.wu@sifive.com>
  Vaibhav Jain <vaibhav@linux.ibm.com>
  Viktor Prutyanov <viktor@daynix.com>
  Vivek Kasireddy <vivek.kasireddy@intel.com>
  Volker Rümelin <vr_qemu@t-online.de>
  Wang Liang <wangliangzz@inspur.com>
  Xinyu Li <lixinyu20s@ict.ac.cn>
  Yajun Wu <yajunw@nvidia.com>
  Yang Zhong <yang.zhong@linux.intel.com>
  Yin Wang <yin.wang@intel.com>
  Yuval Shaia <yuval.shaia.ml@gmail.com>
  Zhenzhong Duan <zhenzhong.duan@intel.com>

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
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        fail    
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
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      pass    
 test-amd64-i386-xl-vhd                                       pass    


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
   8c51cd9705..698407ef83  698407ef8395521a9a5b15ed9cd0b7e1fc258ded -> master

