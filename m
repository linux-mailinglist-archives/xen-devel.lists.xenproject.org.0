Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B966ADDE1
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 12:46:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507327.780692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZVlr-0007DI-FI; Tue, 07 Mar 2023 11:46:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507327.780692; Tue, 07 Mar 2023 11:46:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZVlr-0007Ai-CS; Tue, 07 Mar 2023 11:46:19 +0000
Received: by outflank-mailman (input) for mailman id 507327;
 Tue, 07 Mar 2023 11:46:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pZVlq-0007AY-I1; Tue, 07 Mar 2023 11:46:18 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pZVlq-0005MF-EX; Tue, 07 Mar 2023 11:46:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pZVlq-00040R-0P; Tue, 07 Mar 2023 11:46:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pZVlp-0000vb-W3; Tue, 07 Mar 2023 11:46:17 +0000
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
	bh=LWMMi438shpTc07nTeVoeBhULF8POgINn69fPJwYbKA=; b=1lDY4vAFkcCxO3aBKYHwGaAHeQ
	O5m/Npk8f1f03gwsCNj/S6La+A5ck1ItJQuqi84e/AEB+jKS+pMFHAyHeYR+3IyfZurkjcHHc0/7x
	yLsM+AoS9ddiID0pktoS+dGArTARXGoGZBSsGLUBOaj4ybWzQzEmcPKR7KMpMZKras/s=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-179449-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 179449: tolerable trouble: fail/pass/starved - PUSHED
X-Osstest-Failures:
    qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
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
    qemuu=817fd33836e73812df2f1907612b57750fcb9491
X-Osstest-Versions-That:
    qemuu=387b2b52558bbb44ad74634415e1ab488d3c62a7
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 07 Mar 2023 11:46:17 +0000

flight 179449 qemu-mainline real [real]
http://logs.test-lab.xenproject.org/osstest/logs/179449/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop      fail blocked in 176342
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 176342
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 176342
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 176342
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 176342
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
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
 qemuu                817fd33836e73812df2f1907612b57750fcb9491
baseline version:
 qemuu                387b2b52558bbb44ad74634415e1ab488d3c62a7

Last test of basis   176342  2023-02-03 03:30:18 Z   32 days
Failing since        176352  2023-02-03 17:40:20 Z   31 days    7 attempts
Testing same since   179449  2023-03-07 01:40:20 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "John Berberian, Jr" <jeb.study@gmail.com>
  Akihiko Odaki <akihiko.odaki@daynix.com>
  Alberto Faria <afaria@redhat.com>
  Alex Bennée <alex.bennee@linaro.org>
  Alex Williamson <alex.williamson@redhat.com>
  Alexander Bulekov <alxndr@bu.edu>
  Alexander Graf <agraf@csgraf.de>
  Alistair Francis <alistair.francis@wdc.com>
  Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com>
  Ankur Arora <ankur.a.arora@oracle.com>
  Antoine Damhet <antoine.damhet@shadow.tech>
  Anton Johansson <anjo@rev.ng>
  Anton Kochkov <anton.kochkov@proton.me>
  Anup Patel <apatel@ventanamicro.com>
  Avihai Horon <avihaih@nvidia.com>
  BALATON Zoltan <balaton@eik.bme.hu>
  Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
  Bernhard Beschow <shentey@gmail.com>
  Bibo Mao <maobibo@loongson.cn>
  Bin Meng <bmeng@tinylab.org>
  Brad Smith <brad@comstyle.com>
  Carlos López <clopez@suse.de>
  Charles Frey <charles.frey@shadow.tech>
  Christian Schoenebeck <qemu_oss@crudebyte.com>
  Christian Svensson <blue@cmd.nu>
  Christoph Müllner <christoph.muellner@vrull.eu>
  Claudio Fontana <cfontana@suse.de>
  Claudio Imbrenda <imbrenda@linux.ibm.com>
  Corey Minyard <cminyard@mvista.com>
  Cornelia Huck <cohuck@redhat.com>
  Cédric Le Goater <clg@kaod.org>
  Cédric Le Goater <clg@redhat.com>
  Daniel Henrique Barboza <danielhb413@gmail.com>
  Daniel Henrique Barboza <dbarboza@ventanamicro.com>
  Daniel P. Berrangé <berrange@redhat.com>
  David Hildenbrand <david@redhat.com>
  David Woodhouse <dwmw2@amazon.co.uk>
  David Woodhouse <dwmw@amazon.co.uk>
  David Wooodhouse <dwmw@amazon.co.uk>
  Deepak Gupta <debug@rivosinc.com>
  Dinah Baum <dinahbaum123@gmail.com>
  Dongli Zhang <dongli.zhang@oracle.com>
  Doug Rabson <dfr@rabson.org>
  Dov Murik <dovmurik@linux.ibm.com>
  Dr. David Alan Gilbert <dgilbert@redhat.com>
  Drew DeVault <sir@cmpwn.com>
  Eitan Eliahu <eitan_eliahu@hotmail.com>
  Emanuele Giuseppe Esposito <eesposit@redhat.com>
  Emilio Cota <cota@braap.org>
  Eric Auger <eric.auger@redhat.com>
  Eugenio Pérez <eperezma@redhat.com>
  Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
  Fabiano Rosas <farosas@suse.de>
  Fan Ni <fan.ni@samsung.com>
  Fiona Ebner <f.ebner@proxmox.com>
  Frank Chang <frank.chang@sifive.com>
  Frederic Barrat <fbarrat@linux.ibm.com>
  Fuad Tabba <tabba@google.com>
  Gautam Dawar <gautam.dawar@amd.com>
  Gerd Hoffmann <kraxel@redhat.com>
  Gregory Price <gourry.memverge@gmail.com>
  Gregory Price <gregory.price@memverge.com>
  Guenter Roeck <linux@roeck-us.net>
  Hanna Czenczek <hreitz@redhat.com>
  Hanna Reitz <hreitz@redhat.com>
  Hao Wu <wuhaotsh@google.com>
  Havard Skinnemoen <hskinnemoen@google.com>
  Helge Deller <deller@gmx.de>
  Himanshu Chauhan <hchauhan@ventanamicro.com>
  Idan Horowitz <idan.horowitz@gmail.com>
  Ilya Leoshkevich <iii@linux.ibm.com>
  Ira Weiny <ira.weiny@intel.com>
  Jason Wang <jasowang@redhat.com>
  Jean-Philippe Brucker <jean-philippe@linaro.org>
  Jiang Jiacheng <jiangjiacheng@huawei.com>
  Jiri Pirko <jiri@nvidia.com>
  Joao Martins <joao.m.martins@oracle.com>
  Joel Stanley <joel@jms.id.au>
  Joelle van Dyne <j@getutm.app>
  John Berberian, Jr <jeb.study@gmail.com>
  John Snow <jsnow@redhat.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Juan Quintela <quintela@redhat.com>
  Juergen Lock <nox@jelal.kn-bremen.de>
  Julia Suvorova <jusual@redhat.com>
  Junqiang Wang <wangjunqiang@iscas.ac.cn>
  Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
  Keith Packard <keithp@keithp.com>
  Kevin Wolf <kwolf@redhat.com>
  Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
  Klaus Jensen <k.jensen@samsung.com>
  Kyle Evans <kevans@FreeBSD.org>
  Laurent Vivier <laurent@vivier.eu>
  Laurent Vivier <lvivier@redhat.com>
  Lei Yang <leiyang@redhat.com>
  Leonardo Bras <leobras@redhat.com>
  Letu Ren <fantasquex@gmail.com>
  Li Zhang <lizhang@suse.de>
  ling xu <ling1.xu@intel.com>
  LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
  Lukáš Doktor <ldoktor@redhat.com>
  manish.mishra <manish.mishra@nutanix.com>
  Marc-André Lureau <marcandre.lureau@redhat.com>
  Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
  Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
  Markus Armbruster <armbru@redhat.com>
  Mauro Matteo Cascella <mcascell@redhat.com>
  Maxime Coquelin <maxime.coquelin@redhat.com>
  Michael S. Tsirkin <mst@redhat.com>
  Michal Privoznik <mprivozn@redhat.com>
  Mike Frysinger <vapier@gentoo.org>
  Mostafa Saleh <smostafa@google.com>
  Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
  Nathan Chancellor <nathan@kernel.org>
  Ninad Palsule <ninadpalsule@us.ibm.com>
  Or Ozeri <oro@il.ibm.com>
  Palmer Dabbelt <palmer@rivosinc.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Paul Durrant <paul@xen.org>
  Paul Durrant <pdurrant@amazon.com>
  Peter Delevoryas <peter@pjd.dev>
  Peter Krempa <pkrempa@redhat.com>
  Peter Maydell <peter.maydell@linaro.org>
  Peter Xu <peterx@redhat.com>
  Philipp Tomsich <philipp.tomsich@vrull.eu>
  Philippe Mathieu-Daudé <f4bug@amsat.org>
  Philippe Mathieu-Daudé <philmd@linaro.org>
  Pierrick Bouvier <pierrick.bouvier@linaro.org>
  Qiang Liu <cyruscyliu@gmail.com>
  Raphael Kubo da Costa <rakuco@FreeBSD.org>
  Rene Engel <ReneEngel80@emailn.de>
  Richard Henderson <richard.henderson@linaro.org>
  Richard W.M. Jones <rjones@redhat.com>
  Rui Wang <wangrui@loongson.cn>
  Sean Bruno <sbruno@FreeBSD.org>
  Sergey Matyukevich <sergey.matyukevich@syntacore.com>
  Shaobo Song <songshaobo@eswincomputing.com>
  Sittisak Sinprem <ssinprem@celestica.com>
  Song Gao <gaosong@loongson.cn>
  Stacey Son <sson@FreeBSD.org>
  Stefan Hajnoczi <stefanha@redhat.com>
  Stefano Garzarella <sgarzare@redhat.com>
  Stephen Longfield <slongfield@google.com>
  Steve Sistare <steven.sistare@oracle.com>
  TaiseiIto <taisei1212@outlook.jp>
  Taylor Simpson <tsimpson@quicinc.com>
  Thomas Huth <thuth@redhat.com>
  Viktor Prutyanov <viktor@daynix.com>
  Vladimir Isaev <vladimir.isaev@syntacore.com>
  Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
  Volker Rümelin <vr_qemu@t-online.de>
  Wang, Lei <lei4.wang@intel.com>
  Warner Losh <imp@bsdimp.com>
  Weiwei Li <liweiwei@iscas.ac.cn>
  Wilfred Mallawa <wilfred.mallawa@wdc.com>
  Xiang Zheng <zhengxiang9@huawei.com>
  Yajun Wu <yajunw@nvidia.com>
  Zhenzhong Duan <zhenzhong.duan@intel.com>

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
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  starved 
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  starved 
 test-armhf-armhf-xl-cubietruck                               starved 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     starved 
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                starved 
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               starved 
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 starved 
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     starved 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      starved 
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
   387b2b5255..817fd33836  817fd33836e73812df2f1907612b57750fcb9491 -> upstream-tested

