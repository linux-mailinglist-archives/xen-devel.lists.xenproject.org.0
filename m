Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FB9992D99
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 15:41:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811994.1224654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxnz9-00084O-Nk; Mon, 07 Oct 2024 13:41:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811994.1224654; Mon, 07 Oct 2024 13:41:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxnz9-00082q-JG; Mon, 07 Oct 2024 13:41:15 +0000
Received: by outflank-mailman (input) for mailman id 811994;
 Mon, 07 Oct 2024 13:41:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sxnz8-00082b-69; Mon, 07 Oct 2024 13:41:14 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sxnz8-0001Hk-3W; Mon, 07 Oct 2024 13:41:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sxnz7-00070u-Io; Mon, 07 Oct 2024 13:41:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sxnz7-0006Fs-IC; Mon, 07 Oct 2024 13:41:13 +0000
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
	bh=7Cdej+adiCoj6cMUfxxLDRDaIOlnOphlBAbfU5f4RZg=; b=lpE6zT3bTcdfIgCn0laA0hUyQ5
	10bPsRNQ6noSxxTeV8vmchdfFkgmA57eAcJGOxvmZ1DARic9RCYtbMgH7tSg7OkZT5xyCISEBJ1nV
	1rNFPXT2gSMbbbpTfr3TZVe/edtIHDA3F/o+VLe1CiVxHyYP1SfIfyBT0LoidXB+0ZzM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187992-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 187992: regressions - FAIL
X-Osstest-Failures:
    qemu-mainline:test-amd64-amd64-qemuu-nested-intel:debian-hvm-install/l1/l2:fail:regression
    qemu-mainline:test-armhf-armhf-xl-qcow2:xen-boot:fail:heisenbug
    qemu-mainline:test-amd64-amd64-libvirt-vhd:leak-check/check:fail:heisenbug
    qemu-mainline:test-armhf-armhf-xl-credit1:xen-boot:fail:heisenbug
    qemu-mainline:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    qemuu=b5ab62b3c0050612c7f9b0b4baeb44ebab42775a
X-Osstest-Versions-That:
    qemuu=ea9cdbcf3a0b8d5497cddf87990f1b39d8f3bb0a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 07 Oct 2024 13:41:13 +0000

flight 187992 qemu-mainline real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187992/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-qemuu-nested-intel 20 debian-hvm-install/l1/l2 fail REGR. vs. 187720

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-xl-qcow2     8 xen-boot         fail in 187988 pass in 187992
 test-amd64-amd64-libvirt-vhd 22 leak-check/check fail in 187988 pass in 187992
 test-armhf-armhf-xl-credit1   8 xen-boot                   fail pass in 187988

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-credit1 15 migrate-support-check fail in 187988 never pass
 test-armhf-armhf-xl-credit1 16 saverestore-support-check fail in 187988 never pass
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 187720
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 187720
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 187720
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 187720
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass

version targeted for testing:
 qemuu                b5ab62b3c0050612c7f9b0b4baeb44ebab42775a
baseline version:
 qemuu                ea9cdbcf3a0b8d5497cddf87990f1b39d8f3bb0a

Last test of basis   187720  2024-09-16 10:37:24 Z   21 days
Failing since        187731  2024-09-17 13:11:20 Z   20 days   34 attempts
Testing same since   187988  2024-10-06 17:41:20 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
    Ajeet Singh <itachis@FreeBSD.org>
  Akihiko Odaki <akihiko.odaki@daynix.com>
  Alan Adamson <alan.adamson@oracle.com>
  Alex Bennée <alex.bennee@linaro.org>
  Alexandre Ghiti <alexghiti@rivosinc.com>
  Alistair Francis <alistair.francis@wdc.com>
  Alistair Francis <alistair23@gmail.com>
  Alvin Chang <alvinga@andestech.com>
  Andrew Jeffery <andrew@codeconstruct.com.au>
  Andrew Jones <ajones@ventanamicro.com>
  Ani Sinha <anisinha@redhat.com>
  Anthony PERARD <anthony.perard@vates.tech>
  Ard Biesheuvel <ardb@kernel.org>
  Arnd Bergmann <arnd@arndb.de>
  Arun Kumar <arun.kka@samsung.com>
  Bernhard Beschow <shentey@gmail.com>
  Bibo Mao <maobibo@loongson.cn>
  Corvin Köhne <c.koehne@beckhoff.com>
  Corvin Köhne <corvin.koehne@gmail.com>
  Daniel Henrique Barboza <dbarboza@ventanamicro.com>
  Daniel P. Berrangé <berrange@redhat.com>
  David Hildenbrand <david@redhat.com>
  Dmitry Frolov <frolov@swemel.ru>
  Dr. David Alan Gilbert <dave@treblig.org>
  Edgar E. Iglesias <edgar.iglesias@amd.com>
  Fabiano Rosas <farosas@suse.de>
  Fea.Wang <fea.wang@sifive.com>
  Fiona Ebner <f.ebner@proxmox.com>
  Gavin Shan <gshan@redhat.com>
  Gerd Hoffmann <kraxel@redhat.com>
  Greg Kurz <groug@kaod.org>
  Haibo Xu <haibo1.xu@intel.com>
  Ilya Leoshkevich <iii@linux.ibm.com>
  Inès Varhol <ines.varhol@telecom-paris.fr>
  Jacob Abrams <satur9nine@gmail.com>
  Jamin Lin <jamin_lin@aspeedtech.com>
  Jan Luebbe <jlu@pengutronix.de>
  Jason Chien <jason.chien@sifive.com>
  Julia Suvorova <jusual@redhat.com>
  Juraj Marcin <jmarcin@redhat.com>
  Kamil Szczęk <kamil@szczek.dev>
  Keith Busch <kbusch@kernel.org>
  Kinsey Moore <kinsey.moore@oarcorp.com>
  Klaus Jensen <k.jensen@samsung.com>
  Laurent Vivier <laurent@vivier.eu>
  Lei Wang <lei4.wang@intel.com>
  Marc-André Lureau <marcandre.lureau@redhat.com>
  Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
  Maria Klauchek <m.klauchek@syntacore.com>
  Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
  Mark Corbin <mark@dibsco.co.uk>
  Markus Armbruster <armbru@redhat.com>
  Markus Armbruster <armbru@redhat.com> (QAPI schema)
  Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
  Mattias Nissler <mnissler@rivosinc.com>
  Michael Tokarev <mjt@tls.msk.ru>
  Milan P. Stanić <mps@arvanta.net>
  Paolo Bonzini <pbonzini@redhat.com>
  Peter Maydell <peter.maydell@linaro.org>
  Peter Xu <peterx@redhat.com>
  Philippe Mathieu-Daudé <philmd@linaro.org>
  Pierrick Bouvier <pierrick.bouvier@linaro.org>
  Richard Henderson <richard.henderson@linaro.org>
  Rowan Hart <rowanbhart@gmail.com>
  Samuel Holland <samuel.holland@sifive.com>
  Samuel Tardieu <sam@rfc1149.net>
  Shiva sagar Myana <Shivasagar.Myana@amd.com>
  Stefan Hajnoczi <stefanha@redhat.com>
  Stefan Weil <sw@weilnetz.de>
  Stefano Stabellini <sstabellini@kernel.org>
  TANG Tiancheng <tangtiancheng.ttc@alibaba-inc.com>
  Tejas Vipin <tejasvipin76@gmail.com>
  Thomas Huth <thuth@redhat.com>
  Tomasz Jeznach <tjeznach@rivosinc.com>
  Vladimir Isaev <vladimir.isaev@syntacore.com>
  Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
  Warner Losh <imp@bsdimp.com>
  Xianglai Li <lixianglai@loongson.cn>
  Xin Li (Intel) <xin@zytor.com>
  Xin Li <xin3.li@intel.com>
  Xingtao Yao <yaoxt.fnst@fujitsu.com>
  Yotaro Nada <yotaro.nada@gmail.com>
  zhenwei pi <pizhenwei@bytedance.com>
  Zhenyu Zhang <zhenyzha@redhat.com>

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
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-qemuu-nested-intel                          fail    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-xl-qcow2                                    pass    
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-amd64-amd64-xl-raw                                      pass    
 test-armhf-armhf-xl-raw                                      pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-libvirt-vhd                                 pass    
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      pass    


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

(No revision log; it would be 7931 lines long.)

