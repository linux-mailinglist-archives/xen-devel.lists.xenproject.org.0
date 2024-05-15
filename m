Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D93D18C5F0E
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 04:13:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721880.1125569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s748K-00082P-Tx; Wed, 15 May 2024 02:12:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721880.1125569; Wed, 15 May 2024 02:12:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s748K-00080j-R4; Wed, 15 May 2024 02:12:44 +0000
Received: by outflank-mailman (input) for mailman id 721880;
 Wed, 15 May 2024 02:12:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s748J-00080Z-Gj; Wed, 15 May 2024 02:12:43 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s748J-0004lO-DW; Wed, 15 May 2024 02:12:43 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s748J-0004au-4W; Wed, 15 May 2024 02:12:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1s748J-0008R9-40; Wed, 15 May 2024 02:12:43 +0000
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
	bh=A8byFbvkfmO0olRQvq0rttrgby+ZLN0W6xVLmpqTpsQ=; b=RKGDJdF853lV3sfvplZeiO1HEe
	Uhbm9uoRHnPo3hiZQf2ovqzOUg1fiYm7zRxdkYXKFcnI6DMbjQkRkyoXTJxci2JpSQnka7FMnb1mU
	aJWuuuomB1Qv01t3eVfzqQsZ+WAM1Wm/6Kx8xV4SGQ/7VAFbiBpzMKZvtUax4HEnUV8g=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185998-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 185998: regressions - trouble: broken/fail/pass
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-xl-raw:<job status>:broken:regression
    linux-linus:test-armhf-armhf-xl-raw:host-install(5):broken:regression
    linux-linus:test-armhf-armhf-xl:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-libvirt:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-qemuu-freebsd11-amd64:guest-start.2:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-examine:reboot:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:xen-boot:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=4b95dc87362aa57bdd0dcbad109ca5e5ef3cbb6c
X-Osstest-Versions-That:
    linux=a5131c3fdf2608f1c15f3809e201cf540eb28489
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 15 May 2024 02:12:43 +0000

flight 185998 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185998/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl-raw         <job status>                 broken
 test-armhf-armhf-xl-raw       5 host-install(5)        broken REGR. vs. 185996
 test-armhf-armhf-xl           8 xen-boot                 fail REGR. vs. 185996
 test-armhf-armhf-libvirt      8 xen-boot                 fail REGR. vs. 185996

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-qemuu-freebsd11-amd64 22 guest-start.2 fail blocked in 185996
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 185996
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 185996
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 185996
 test-armhf-armhf-libvirt-vhd  8 xen-boot                     fail  like 185996
 test-armhf-armhf-examine      8 reboot                       fail  like 185996
 test-armhf-armhf-xl-credit1   8 xen-boot                     fail  like 185996
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 185996
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 185996
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                4b95dc87362aa57bdd0dcbad109ca5e5ef3cbb6c
baseline version:
 linux                a5131c3fdf2608f1c15f3809e201cf540eb28489

Last test of basis   185996  2024-05-14 09:18:32 Z    0 days
Testing same since   185998  2024-05-14 19:41:48 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Adrian Hunter <adrian.hunter@intel.com>
  Alice Ryhl <aliceryhl@google.com>
  Amer Al Shanawany <amer.shanawany@gmail.com>
  Andrea della Porta <andrea.porta@suse.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Anna-Maria Behnsen <anna-maria@linutronix.de>
  Antonio Borneo <antonio.borneo@foss.st.com>
  Anup Patel <apatel@ventanamicro.com>
  Arjan van de Ven <arjan@linux.intel.com>
  Arnd Bergmann <arnd@arndb.de>
  Arnd Bergmann <arnd@kernel.org>
  Artur Rojek <contact@artur-rojek.eu>
  Baoqi Zhang <zhangbaoqi@loongson.cn>
  Besar Wicaksono <bwicaksono@nvidia.com>
  Biao Dong <dongbiao@loongson.cn>
  Biju Das <biju.das.jz@bp.renesas.com>
  Bitao Hu <yaoma@linux.alibaba.com>
  Björn Töpel <bjorn@rivosinc.com>
  Boqun Feng <boqun.feng@gmail.com>
  Borislav Petkov (AMD) <bp@alien8.de>
  Brennan Xavier McManus <bxmcmanus@gmail.com>
  chenqiwu <qiwu.chen@transsion.com>
  chenqiwu <qiwuchen55@gmail.com>
  Christian Brauner <brauner@kernel.org>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Colin Ian King <colin.i.king@gmail.com>
  Conor Dooley <conor.dooley@microchip.com>
  Daniel J Blueman <daniel@quora.org>
  Daniel Lezcano <daniel.lezcano@linaro.org>
  Dave Hansen <dave.hansen@linux.intel.com>
  David Gow <davidgow@google.com>
  David Stevens <stevensd@chromium.org>
  David Woodhouse <dwmw@amazon.co.uk>
  Dawei Li <dawei.li@shingroup.cn>
  Dongli Zhang <dongli.zhang@oracle.com>
  Dr. David Alan Gilbert <linux@treblig.org>
  Edward Liaw <edliaw@google.com>
  Eric Chanudet <echanude@redhat.com>
  Fabrice Gasnier <fabrice.gasnier@foss.st.com>
  Finn Thain <fthain@linux-m68k.org>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Gavin Shan <gshan@redhat.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Geert Uytterhoeven <geert@linux-m68k.org>
  George Guo <guodongtai@kylinos.cn>
  Guanrui Huang <guanrui.huang@linux.alibaba.com>
  Guenter Roeck <linux@roeck-us.net>
  Haifeng Xu <haifeng.xu@shopee.com>
  Hao Chen <chenhao418@huawei.com>
  Ingo Molnar <mingo@kernel.org>
  Itaru Kitayama <itaru.kitayama@fujitsu.com>
  Ivan Orlov <ivan.orlov0322@gmail.com>
  Jacob Pan <jacob.jun.pan@linux.intel.com>
  Jarkko Sakkinen <jarkko@kernel.org>
  Jernej Skrabec <jernej.skrabec@gmail.com>
  Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
  Jinjie Ruan <ruanjinjie@huawei.com>
  Jiri Slaby (SUSE) <jirislaby@kernel.org>
  Joel Granados <j.granados@samsung.com>
  John Hubbard <jhubbard@nvidia.com>
  John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Junhao He <hejunhao3@huawei.com>
  Keguang Zhang <keguang.zhang@gmail.com>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Kunwu Chan <chentao@kylinos.cn>
  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Li Zhijian <lizhijian@fujitsu.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Lu Dai <dai.lu@exordes.com>
  Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
  Marc Zyngier <maz@kernel.org>
  Mark Brown <broonie@kernel.org>
  Mark Rutland <mark.rutland@arm.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Masami Hiramatsu (Google) <mhiramat@kernel.org>
  Michael Schmitz <schmitzmic@gmail.com>
  Mickaël Salaün <mic@digikod.net>
  Miguel Ojeda <ojeda@kernel.org>
  Muhammad Usama Anjum <usama.anjum@collabora.com>
  Nathan Chancellor <nathan@kernel.org>
  Nikhil Rao <nikhil.rao@intel.com>
  Niklas Schnelle <schnelle@linux.ibm.com>
  Nícolas F. R. A. Prado <nfraprado@collabora.com>
  Paul Cercueil <paul@crapouillou.net>
  Paul E. McKenney <paulmck@kernel.org>
  Peter Xu <peterx@redhat.com>
  Qiuxu Zhuo <qiuxu.zhuo@intel.com>
  Rae Moar <rmoar@google.com>
  Rafael J. Wysocki <rafael@kernel.org>
  Randy Dunlap <rdunlap@infradead.org>
  Reinette Chatre <reinette.chatre@intel.com>
  Rob Landley <rob@landley.net>
  Robin Murphy <robin.murphy@arm.com>
  Rodrigo Campos <rodrigo@sdfg.com.ar>
  Ryan Roberts <ryan.roberts@arm.com>
  Scott Mayhew <smayhew@redhat.com>
  Sean Christopherson <seanjc@google.com>
  Shiqi Liu <shiqiliu@hust.edu.cn>
  Shuah Khan <skhan@linuxfoundation.org>
  Simon Glass <sjg@chromium.org>
  Srikanth Aithal <sraithal@amd.com>
  Stafford Horne <shorne@gmail.com>
  Stefan Wahren <wahrenst@gmx.net>
  Stephen Boyd <swboyd@chromium.org>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Sudeep Holla <sudeep.holla@arm.com>
  Suzuki K Poulose <suzuki.poulose@arm.com>
  Thomas Gleixner <tglx@linutronix.de>
  Thomas Weißschuh <linux@weissschuh.net>
  Thorsten Blum <thorsten.blum@toblux.com>
  Tianyang Zhang <zhangtianyang@loongson.cn>
  Tiezhu Yang <yangtiezhu@loongson.cn>
  Tom Lendacky <thomas.lendacky@amd.com>
  Tony Luck <tony.luck@intel.com>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Valentin Obst <kernel@valentinobst.de>
  Viresh Kumar <viresh.kumar@linaro.org>
  Wander Lairson Costa <wander@redhat.com>
  Will Deacon <will@kernel.org>
  Willy Tarreau <w@1wt.eu>
  xieming <xieming@kylinos.cn>
  Yicong Yang <yangyicong@hisilicon.com>
  Yo-Jung (Leo) Lin <0xff07@gmail.com>
  Yury Norov <yury.norov@gmail.com>
  Zenghui Yu <yuzenghui@huawei.com>

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
 test-armhf-armhf-xl                                          fail    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       fail    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     fail    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     fail    
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
 test-armhf-armhf-xl-raw                                      broken  
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-libvirt-vhd                                 fail    
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

broken-job test-armhf-armhf-xl-raw broken
broken-step test-armhf-armhf-xl-raw host-install(5)

Not pushing.

(No revision log; it would be 6941 lines long.)

