Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D79E475A6E9
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 08:50:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566363.885090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMNU9-0002z3-O2; Thu, 20 Jul 2023 06:50:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566363.885090; Thu, 20 Jul 2023 06:50:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMNU9-0002wM-L3; Thu, 20 Jul 2023 06:50:01 +0000
Received: by outflank-mailman (input) for mailman id 566363;
 Thu, 20 Jul 2023 06:50:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qMNU8-0002wA-4l; Thu, 20 Jul 2023 06:50:00 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qMNU7-0003DG-RR; Thu, 20 Jul 2023 06:49:59 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qMNU7-0002Xy-Eb; Thu, 20 Jul 2023 06:49:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qMNU7-00057P-E3; Thu, 20 Jul 2023 06:49:59 +0000
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
	bh=piB3ZBUDtOPrF2lCAGPF0ozRGgywbU09xyXoBDRZAMQ=; b=RZ2UeBRNrNU9WfNdUIhQBuEAIF
	Tje6VmVze7ie0Yc5GCd703nLTxMVZNLqxMRs+qM2otDwD74fziqy/d4qb336CgnOAhH/J8RQSazOx
	Cuy7YT8Zt+xb92bAiW4kzN+WQUJnN5ghSa3uv2BFWwlx6u5IASVmo6653aTqis2FRwz8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181901-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 181901: regressions - FAIL
X-Osstest-Failures:
    qemu-mainline:test-amd64-i386-libvirt-pair:xen-install/src_host:fail:regression
    qemu-mainline:test-amd64-i386-libvirt-pair:xen-install/dst_host:fail:regression
    qemu-mainline:test-amd64-i386-xl-vhd:guest-localmigrate/x10:fail:regression
    qemu-mainline:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    qemuu=7a0adc3e05c2bb1cfd450cb73a6da6f7de9ce3f4
X-Osstest-Versions-That:
    qemuu=6972ef1440a9d685482d78672620a7482f2bd09a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 20 Jul 2023 06:49:59 +0000

flight 181901 qemu-mainline real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181901/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-libvirt-pair 10 xen-install/src_host     fail REGR. vs. 180691
 test-amd64-i386-libvirt-pair 11 xen-install/dst_host     fail REGR. vs. 180691
 test-amd64-i386-xl-vhd       19 guest-localmigrate/x10   fail REGR. vs. 180691

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 180691
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 180691
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 180691
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 180691
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 180691
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 180691
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 180691
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 180691
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 qemuu                7a0adc3e05c2bb1cfd450cb73a6da6f7de9ce3f4
baseline version:
 qemuu                6972ef1440a9d685482d78672620a7482f2bd09a

Last test of basis   180691  2023-05-17 10:45:22 Z   63 days
Failing since        180699  2023-05-18 07:21:24 Z   62 days  126 attempts
Testing same since   181901  2023-07-19 14:37:22 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Afonso Bordado <afonsobordado@gmail.com>
  Akihiko Odaki <akihiko.odaki@daynix.com>
  Akihiro Suda <akihiro.suda.cz@hco.ntt.co.jp>
  Alex Bennée <alex.bennee@linaro.org>
  Alex Williamson <alex.williamson@redhat.com>
  Alexander Bulekov <alxndr@bu.edu>
  Alexander Graf <graf@amazon.com>
  Alexander Ivanov <alexander.ivanov@virtuozzo.com>
  Alistair Francis <alistair.francis@wdc.com>
  Anastasia Belova <abelova@astralinux.ru>
  Andrea Bolognani <abologna@redhat.com>
  Andreas Schwab <schwab@suse.de>
  Andrew Jeffery <andrew@aj.id.au>
  Andrew Melnychenko <andrew@daynix.com>
  Ani Sinha <ani@anisinha.ca>
  Ani Sinha <anisinha@redhat.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Anton Johansson <anjo@rev.ng>
  Antonio Caggiano <quic_acaggian@quicinc.com>
  Avihai Horon <avihaih@nvidia.com>
  BALATON Zoltan <balaton@eik.bme.hu>
  Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
  Bernhard Beschow <shentey@gmail.com>
  Bilal Elmoussaoui <belmouss@redhat.com>
  Bin Meng <bin.meng@windriver.com>
  Bin Meng <bmeng@tinylab.org>
  Brian Cain <bcain@quicinc.com>
  Brice Goglin <Brice.Goglin@inria.fr>
  Camilla Conte <cconte@redhat.com>
  Carlos Santos <casantos@redhat.com>
  Chen Baozi <chenbaozi@phytium.com.cn>
  Christian Borntraeger <borntraeger@linux.ibm.com>
  Christian Schoenebeck <qemu_oss@crudebyte.com>
  Christoph Muellner <christoph.muellner@vrull.eu>
  Christoph Müllner <christoph.muellner@vrull.eu>
  Chuck Zmudzinski <brchuckz@aol.com>
  Cindy Lu <lulu@redhat.com>
  Clément Chigot <chigot@adacore.com>
  Corey Minyard <cminyard@mvista.com>
  Cornelia Huck <cohuck@redhat.com>
  Cédric Le Goater <clg@kaod.org>
  Cédric Le Goater <clg@redhat.com>
  Daniel Bertalan <dani@danielbertalan.dev>
  Daniel Henrique Barboza <danielhb413@gmail.com>
  Daniel Henrique Barboza <dbarboza@ventanamicro.com>
  Daniel P. Berrangé <berrange@redhat.com>
  Daniil Kovalev <dkovalev@compiler-toolchain-for.me>
  David Hildenbrand <david@redhat.com>
  David Woodhouse <dwmw@amazon.co.uk>
  Dongwon Kim <dongwon.kim@intel.com>
  Emanuele Giuseppe Esposito <eesposit@redhat.com>
  Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
  Enze Li <lienze@kylinos.cn>
  Eric Auger <eric.auger@redhat.com>
  Eric Blake <eblake@redhat.com>
  Eric DeVolder <eric.devolder@oracle.com>
  Erico Nunes <ernunes@redhat.com>
  Erik Skultety <eskultet@redhat.com>
  Eugenio Pérez <eperezma@redhat.com>
  Fabiano Rosas <farosas@suse.de>
  Fan Ni <fan.ni@samsung.com>
  Fei Wu <fei2.wu@intel.com>
  Fiona Ebner <f.ebner@proxmox.com>
  Francesco Cagnin <fcagnin@quarkslab.com>
  Francisco Iglesias <frasse.iglesias@gmail.com>
  Frederic Barrat <fbarrat@linux.ibm.com>
  Gavin Shan <gshan@redhat.com>
  Gowrishankar Muthukrishnan <gmuthukrishn@marvell.com>
  Gregory Price <gourry.memverge@gmail.com>
  Gregory Price <gregory.price@memverge.com>
  Guenter Roeck <linux@roeck-us.net>
  Hanna Czenczek <hreitz@redhat.com>
  Hao Zeng <zenghao@kylinos.cn>
  Hawkins Jiawei <yin31149@gmail.com>
  Helge Deller <deller@gmx.de>
  Henrik Carlqvist <hc1245@poolhem.se>
  Henrik Carlqvist <hc981@poolhem.se>
  Himanshu Chauhan <hchauhan@ventanamicro.com>
  Igor Mammedov <imammedo@redhat.com>
  Ilya Leoshkevich <iii@linux.ibm.com>
  Ira Weiny <ira.weiny@intel.com>
  Isaku Yamahata <isaku.yamahata@intel.com>
  Ivan Klokov <ivan.klokov@syntacore.com>
  Jagannathan Raman <jag.raman@oracle.com>
  Jan Kratochvil <jan@jankratochvil.net>
  Jason Chien <jason.chien@sifive.com>
  Jason Wang <jasowang@redhat.com>
  Jean-Louis Dupond <jean-louis@dupond.be>
  Jean-Philippe Brucker <jean-philippe@linaro.org>
  Jiajie Chen <c@jia.je>
  Jiaxun Yang <jiaxun.yang@flygoat.com>
  Joao Martins <joao.m.martins@oracle.com>
  Joel Stanley <joel@jms.id.au>
  John Högberg <john.hogberg@ericsson.com>
  John Snow <jsnow@redhat.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Juan Quintela <quintela@redhat.com>
  Junqiang Wang <wangjunqiang@iscas.ac.cn>
  Keqian Zhu <zhukeqian1@huawei.com>
  Kevin Wolf <kwolf@redhat.com>
  Klaus Jensen <k.jensen@samsung.com>
  Konstantin Kostiuk <kkostiuk@redhat.com>
  Lakshmi Bai Raja Subramanian <lakshmi.bai.rajasubramanian@bodhicomputing.com>
  Laszlo Ersek <lersek@redhat.com>
  Laurent Vivier <laurent@vivier.eu>
  Laurent Vivier <lvivier@redhat.com>
  Lei Wang <lei4.wang@intel.com>
  Lei Yang <leiyang@redhat.com>
  Leonardo Bras <leobras@redhat.com>
  LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
  Lucas Dietrich <ld.adecy@gmail.com>
  Lukas Doktor <ldoktor@redhat.com>
  Mads Ynddal <m.ynddal@samsung.com>
  Maksim Davydov <davydov-max@yandex-team.ru>
  Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
  Marc-André Lureau <marcandre.lureau@redhat.com>
  Marcelo Tosatti <mtosatti@redhat.com>
  Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
  Marcin Nowakowski <marcin.nowakowski@fungible.com>
  Marco Liebel <quic_mliebel@quicinc.com>
  Mario Casquero <mcasquer@redhat.com>
  Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
  Markus Armbruster <armbru@redhat.com>
  Martin Kaiser <martin@kaiser.cx>
  Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
  Mattias Nissler <mnissler@rivosinc.com>
  Mauro Matteo Cascella <mcascell@redhat.com>
  Max Chou <max.chou@sifive.com>
  Max Filippov <jcmvbkbc@gmail.com>
  Max Fritz <antischmock@googlemail.com>
  Mayuresh Chitale <mchitale@ventanamicro.com>
  Michael S. Tsirkin <mst@redhat.com>
  Michael Tokarev <mjt@tls.msk.ru>
  Michal Privoznik <mprivozn@redhat.com>
  Milan Zamazal <mzamazal@redhat.com>
  Minwoo Im <minwoo.im@samsung.com>
  Mostafa Saleh <smostafa@google.com>
  Narayana Murty N <nnmlinux@linux.ibm.com>
  Nicholas Piggin <npiggin@gmail.com>
  Nicolas Saenz Julienne <nsaenz@amazon.com>
  Niek Linnenbank <nieklinnenbank@gmail.com>
  Niklas Cassel <niklas.cassel@wdc.com>
  Ninad Palsule <ninad@linux.ibm.com>
  Olaf Hering <olaf@aepfle.de>
  Palmer Dabbelt <palmer@rivosinc.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Patrick Venture <venture@google.com>
  Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
  Peng Liang <tcx4c70@gmail.com>
  Peter Maydell <peter.maydell@linaro.org>
  Peter Xu <peterx@redhat.com>
  Philippe Mathieu-Daudé <philmd@linaro.org>
  Philippe Mathieu-Daudé <philmd@redhat.com>
  Pierrick Bouvier <pierrick.bouvier@linaro.org>
  Prasad Pandit <pjp@fedoraproject.org>
  qianfan Zhao <qianfanguijin@163.com>
  Raghu H <raghuhack78@gmail.com>
  Rene Engel <ReneEngel80@emailn.de>
  Richard Henderson <richard.henderson@linaro.org>
  Richard Purdie <richard.purdie@linuxfoundation.org>
  Richard W.M. Jones <rjones@redhat.com>
  Ricky Zhou <ricky@rzhou.org>
  Robbin Ehn <rehn@rivosinc.com>
  Robin Voetter <robin@streamhpc.com>
  Ryan Wendland <wendland@live.com.au>
  Sebastian Ott <sebott@redhat.com>
  Sergey Kambalin <sergey.kambalin@auriga.com>
  Sergio Lopez <slp@redhat.com>
  Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
  Shashi Mallela <shashi.mallela@linaro.org>
  Siarhei Volkau <lis8215@gmail.com>
  Sid Manning <sidneym@quicinc.com>
  Siqi Chen <coc.cyqh@gmail.com>
  Song Gao <gaosong@loongson.cn>
  Stefan Berger <stefanb@linux.ibm.com>
  Stefan Hajnoczi <stefanha@redhat.com>
  Stefano Garzarella <sgarzare@redhat.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stefano Stabellini <stefano.stabellini@amd.com>
  Steve Sistare <steven.sistare@oracle.com>
  Sunil V L <sunilvl@ventanamicro.com>
  Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
  Tao Su <tao1.su@linux.intel.com>
  Taylor Simpson <tsimpson@quicinc.com>
  Tested-By: Solra Bizna <solra@bizna.name>
  Thomas Huth <thuth@redhat.com>
  Thomas Weißschuh <thomas@t-8ch.de>
  Tianrui Zhao <zhaotianrui@loongson.cn>
  timothee.cocault@gmail.com <timothee.cocault@gmail.com>
  Timothée Cocault <timothee.cocault@gmail.com>
  Tom Lonergan <tom.lonergan@nutanix.com>
  Tommy Wu <tommy.wu@sifive.com>
  Tong Ho <tong.ho@amd.com>
  Tony Krowiak <akrowiak@linux.ibm.com>
  Vanderson M. do Rosario <vandersonmr2@gmail.com>
  Vikram Garhwal <vikram.garhwal@amd.com>
  Viktor Prutyanov <viktor@daynix.com>
  Vitaly Cheptsov <cheptsov@ispras.ru>
  Vivek Kasireddy <vivek.kasireddy@intel.com>
  Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
  Volker Rümelin <vr_qemu@t-online.de>
  Wang Yuquan <wangyuquan1236@phytium.com.cn>
  Weiwei Li <liweiwei@iscas.ac.cn>
  Xiao Wang <xiao.w.wang@intel.com>
  Xinyu Li <lixinyu20s@ict.ac.cn>
  Xuelian Guo <xuelian.guo@intel.com>
  Yang Zhang <yang.zhang@hexintek.com>
  yang.zhang <yang.zhang@hexintek.com>
  YangHang Liu <yanghliu@redhat.com>
  Yin Wang <yin.wang@intel.com>
  Yuquan Wang <wangyuquan1236@phytium.com.cn>
  Zeng Hao <zenghao@kylinos.cn>
  Zhang Huasen <huasenzhang@foxmail.com>
  Zhao Liu <zhao1.liu@intel.com>
  zhenwei pi <pizhenwei@bytedance.com>
  Zhenyu Zhang <zhenyzha@redhat.com>
  Zhenzhong Duan <zhenzhong.duan@intel.com>
  Zhuojia Shen <chaosdefinition@hotmail.com>

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
 test-amd64-i386-libvirt-pair                                 fail    
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

(No revision log; it would be 38014 lines long.)

