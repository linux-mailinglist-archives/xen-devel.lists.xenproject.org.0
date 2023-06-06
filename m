Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74606723466
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jun 2023 03:14:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543950.849351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6LGA-0001Tc-As; Tue, 06 Jun 2023 01:13:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543950.849351; Tue, 06 Jun 2023 01:13:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6LGA-0001RB-7w; Tue, 06 Jun 2023 01:13:18 +0000
Received: by outflank-mailman (input) for mailman id 543950;
 Tue, 06 Jun 2023 01:13:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q6LG9-0001Qx-DJ; Tue, 06 Jun 2023 01:13:17 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q6LG9-0002ab-1v; Tue, 06 Jun 2023 01:13:17 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q6LG8-0006XE-GB; Tue, 06 Jun 2023 01:13:16 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q6LG8-0001dl-Fg; Tue, 06 Jun 2023 01:13:16 +0000
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
	bh=9/vhrgx75gHhCCw/oiiTZ/w5ED6en4GkreLyhWInrAw=; b=yoLb8TXUy99JaJOO5RGbibGNXa
	UUTC5xMjerhunoVNROvsEJZCzV/OcxD+An+CCkPQIAq53OPwErQgEBuDDmH6feEOwEtTEGtI5Vh7E
	YgMk9LTTjgEAYQqBK9nWr/npS/SIUOrDGMFRNVe7dRQuLQqnzW1tO0TR6UrwCnMjwLx0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181185-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 181185: regressions - trouble: blocked/broken/fail/pass
X-Osstest-Failures:
    qemu-mainline:test-amd64-coresched-amd64-xl:<job status>:broken:regression
    qemu-mainline:test-amd64-amd64-libvirt-pair:leak-check/check/src_host:fail:regression
    qemu-mainline:test-amd64-amd64-libvirt-pair:leak-check/check/dst_host:fail:regression
    qemu-mainline:test-amd64-i386-libvirt:leak-check/check:fail:regression
    qemu-mainline:test-amd64-amd64-libvirt-xsm:leak-check/check:fail:regression
    qemu-mainline:build-arm64-xsm:xen-build:fail:regression
    qemu-mainline:build-arm64:xen-build:fail:regression
    qemu-mainline:test-amd64-amd64-libvirt:leak-check/check:fail:regression
    qemu-mainline:test-amd64-i386-libvirt-xsm:leak-check/check:fail:regression
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:leak-check/check:fail:regression
    qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:leak-check/check:fail:regression
    qemu-mainline:test-amd64-amd64-libvirt-vhd:leak-check/check:fail:regression
    qemu-mainline:test-amd64-i386-libvirt-raw:leak-check/check:fail:regression
    qemu-mainline:test-amd64-amd64-xl-qcow2:leak-check/check:fail:regression
    qemu-mainline:test-armhf-armhf-libvirt:leak-check/check:fail:regression
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:leak-check/check:fail:regression
    qemu-mainline:test-armhf-armhf-libvirt-raw:leak-check/check:fail:regression
    qemu-mainline:test-armhf-armhf-xl-vhd:leak-check/check:fail:regression
    qemu-mainline:test-amd64-i386-libvirt-pair:leak-check/check/src_host:fail:regression
    qemu-mainline:test-amd64-i386-libvirt-pair:leak-check/check/dst_host:fail:regression
    qemu-mainline:test-amd64-i386-xl-vhd:leak-check/check:fail:regression
    qemu-mainline:test-amd64-coresched-amd64-xl:host-install(5):broken:heisenbug
    qemu-mainline:test-amd64-amd64-xl-qcow2:guest-start/debian.repeat:fail:heisenbug
    qemu-mainline:test-amd64-i386-libvirt-pair:xen-install/dst_host:fail:heisenbug
    qemu-mainline:test-amd64-i386-xl-vhd:guest-start/debian.repeat:fail:heisenbug
    qemu-mainline:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:build-arm64-libvirt:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    qemuu=848a6caa88b9f082c89c9b41afa975761262981d
X-Osstest-Versions-That:
    qemuu=6972ef1440a9d685482d78672620a7482f2bd09a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 06 Jun 2023 01:13:16 +0000

flight 181185 qemu-mainline real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181185/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-coresched-amd64-xl    <job status>                 broken
 test-amd64-amd64-libvirt-pair 30 leak-check/check/src_host fail REGR. vs. 180691
 test-amd64-amd64-libvirt-pair 31 leak-check/check/dst_host fail REGR. vs. 180691
 test-amd64-i386-libvirt      23 leak-check/check         fail REGR. vs. 180691
 test-amd64-amd64-libvirt-xsm 23 leak-check/check         fail REGR. vs. 180691
 build-arm64-xsm               6 xen-build                fail REGR. vs. 180691
 build-arm64                   6 xen-build                fail REGR. vs. 180691
 test-amd64-amd64-libvirt     23 leak-check/check         fail REGR. vs. 180691
 test-amd64-i386-libvirt-xsm  23 leak-check/check         fail REGR. vs. 180691
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 21 leak-check/check fail REGR. vs. 180691
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 21 leak-check/check fail REGR. vs. 180691
 test-amd64-amd64-libvirt-vhd 22 leak-check/check         fail REGR. vs. 180691
 test-amd64-i386-libvirt-raw  22 leak-check/check         fail REGR. vs. 180691
 test-amd64-amd64-xl-qcow2    24 leak-check/check         fail REGR. vs. 180691
 test-armhf-armhf-libvirt     21 leak-check/check         fail REGR. vs. 180691
 test-armhf-armhf-libvirt-qcow2 20 leak-check/check       fail REGR. vs. 180691
 test-armhf-armhf-libvirt-raw 20 leak-check/check         fail REGR. vs. 180691
 test-armhf-armhf-xl-vhd      20 leak-check/check         fail REGR. vs. 180691
 test-amd64-i386-libvirt-pair 30 leak-check/check/src_host fail in 181168 REGR. vs. 180691
 test-amd64-i386-libvirt-pair 31 leak-check/check/dst_host fail in 181168 REGR. vs. 180691
 test-amd64-i386-xl-vhd     24 leak-check/check fail in 181168 REGR. vs. 180691

Tests which are failing intermittently (not blocking):
 test-amd64-coresched-amd64-xl  5 host-install(5)         broken pass in 181177
 test-amd64-amd64-xl-qcow2 21 guest-start/debian.repeat fail in 181168 pass in 181185
 test-amd64-i386-libvirt-pair 11 xen-install/dst_host       fail pass in 181168
 test-amd64-i386-xl-vhd       21 guest-start/debian.repeat  fail pass in 181177

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-vhd       1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 build-arm64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 180691
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 180691
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 180691
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 180691
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 180691
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 180691
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 180691
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 180691
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 qemuu                848a6caa88b9f082c89c9b41afa975761262981d
baseline version:
 qemuu                6972ef1440a9d685482d78672620a7482f2bd09a

Last test of basis   180691  2023-05-17 10:45:22 Z   19 days
Failing since        180699  2023-05-18 07:21:24 Z   18 days   63 attempts
Testing same since   181131  2023-06-03 03:50:56 Z    2 days    7 attempts

------------------------------------------------------------
People who touched revisions under test:
  Afonso Bordado <afonsobordado@gmail.com>
  Akihiko Odaki <akihiko.odaki@daynix.com>
  Akihiro Suda <akihiro.suda.cz@hco.ntt.co.jp>
  Alex Bennée <alex.bennee@linaro.org>
  Alex Williamson <alex.williamson@redhat.com>
  Alexander Bulekov <alxndr@bu.edu>
  Alexander Graf <graf@amazon.com>
  Alistair Francis <alistair.francis@wdc.com>
  Ani Sinha <ani@anisinha.ca>
  Ani Sinha <anisinha@redhat.com>
  Anton Johansson <anjo@rev.ng>
  BALATON Zoltan <balaton@eik.bme.hu>
  Bernhard Beschow <shentey@gmail.com>
  Bin Meng <bin.meng@windriver.com>
  Brian Cain <bcain@quicinc.com>
  Brice Goglin <Brice.Goglin@inria.fr>
  Camilla Conte <cconte@redhat.com>
  Cindy Lu <lulu@redhat.com>
  Clément Chigot <chigot@adacore.com>
  Cornelia Huck <cohuck@redhat.com>
  Cédric Le Goater <clg@kaod.org>
  Cédric Le Goater <clg@redhat.com>
  Daniel Henrique Barboza <danielhb413@gmail.com>
  Daniel P. Berrangé <berrange@redhat.com>
  Daniil Kovalev <dkovalev@compiler-toolchain-for.me>
  David Hildenbrand <david@redhat.com>
  Emanuele Giuseppe Esposito <eesposit@redhat.com>
  Enze Li <lienze@kylinos.cn>
  Eric Auger <eric.auger@redhat.com>
  Eric Blake <eblake@redhat.com>
  Eric DeVolder <eric.devolder@oracle.com>
  Erico Nunes <ernunes@redhat.com>
  Eugenio Pérez <eperezma@redhat.com>
  Fabiano Rosas <farosas@suse.de>
  Fan Ni <fan.ni@samsung.com>
  Fiona Ebner <f.ebner@proxmox.com>
  Francisco Iglesias <frasse.iglesias@gmail.com>
  Gavin Shan <gshan@redhat.com>
  Gregory Price <gourry.memverge@gmail.com>
  Gregory Price <gregory.price@memverge.com>
  Hao Zeng <zenghao@kylinos.cn>
  Hawkins Jiawei <yin31149@gmail.com>
  Igor Mammedov <imammedo@redhat.com>
  Ira Weiny <ira.weiny@intel.com>
  Jason Wang <jasowang@redhat.com>
  Jean-Philippe Brucker <jean-philippe@linaro.org>
  John Snow <jsnow@redhat.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Juan Quintela <quintela@redhat.com>
  Kevin Wolf <kwolf@redhat.com>
  Laurent Vivier <laurent@vivier.eu>
  Lei Yang <leiyang@redhat.com>
  Leonardo Bras <leobras@redhat.com>
  Maksim Davydov <davydov-max@yandex-team.ru>
  Marc-André Lureau <marcandre.lureau@redhat.com>
  Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
  Marco Liebel <quic_mliebel@quicinc.com>
  Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
  Markus Armbruster <armbru@redhat.com>
  Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
  Mauro Matteo Cascella <mcascell@redhat.com>
  Michael S. Tsirkin <mst@redhat.com>
  Michael Tokarev <mjt@tls.msk.ru>
  Mostafa Saleh <smostafa@google.com>
  Nicholas Piggin <npiggin@gmail.com>
  Nicolas Saenz Julienne <nsaenz@amazon.com>
  Palmer Dabbelt <palmer@rivosinc.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Peter Maydell <peter.maydell@linaro.org>
  Peter Xu <peterx@redhat.com>
  Philippe Mathieu-Daudé <philmd@linaro.org>
  Raghu H <raghuhack78@gmail.com>
  Rene Engel <ReneEngel80@emailn.de>
  Richard Henderson <richard.henderson@linaro.org>
  Richard Purdie <richard.purdie@linuxfoundation.org>
  Ricky Zhou <ricky@rzhou.org>
  Ryan Wendland <wendland@live.com.au>
  Sebastian Ott <sebott@redhat.com>
  Sergio Lopez <slp@redhat.com>
  Sid Manning <sidneym@quicinc.com>
  Song Gao <gaosong@loongson.cn>
  Stefan Hajnoczi <stefanha@redhat.com>
  Stefano Garzarella <sgarzare@redhat.com>
  Steve Sistare <steven.sistare@oracle.com>
  Taylor Simpson <tsimpson@quicinc.com>
  Thomas Huth <thuth@redhat.com>
  Thomas Weißschuh <thomas@t-8ch.de>
  timothee.cocault@gmail.com <timothee.cocault@gmail.com>
  Timothée Cocault <timothee.cocault@gmail.com>
  Tommy Wu <tommy.wu@sifive.com>
  Viktor Prutyanov <viktor@daynix.com>
  Vitaly Cheptsov <cheptsov@ispras.ru>
  Vivek Kasireddy <vivek.kasireddy@intel.com>
  Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
  Volker Rümelin <vr_qemu@t-online.de>
  Xinyu Li <lixinyu20s@ict.ac.cn>
  Zeng Hao <zenghao@kylinos.cn>
  Zhenyu Zhang <zhenyzha@redhat.com>
  Zhenzhong Duan <zhenzhong.duan@intel.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              fail    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  fail    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          blocked 
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                broken  
 test-arm64-arm64-xl                                          blocked 
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           fail    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            fail    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-libvirt-xsm                                 fail    
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-amd64-i386-libvirt-xsm                                  fail    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      blocked 
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
 test-arm64-arm64-xl-credit1                                  blocked 
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  blocked 
 test-armhf-armhf-xl-credit2                                  pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
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
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               fail    
 test-amd64-amd64-xl-qcow2                                    fail    
 test-arm64-arm64-libvirt-raw                                 blocked 
 test-armhf-armhf-libvirt-raw                                 fail    
 test-amd64-i386-libvirt-raw                                  fail    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 blocked 
 test-amd64-amd64-libvirt-vhd                                 fail    
 test-arm64-arm64-xl-vhd                                      blocked 
 test-armhf-armhf-xl-vhd                                      fail    
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

broken-job test-amd64-coresched-amd64-xl broken
broken-step test-amd64-coresched-amd64-xl host-install(5)

Not pushing.

(No revision log; it would be 12540 lines long.)

