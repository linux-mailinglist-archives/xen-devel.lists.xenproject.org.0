Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DBD93CAF5
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 00:46:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765165.1175755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sX7EF-0001Jq-4o; Thu, 25 Jul 2024 22:46:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765165.1175755; Thu, 25 Jul 2024 22:46:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sX7EF-0001Ha-1U; Thu, 25 Jul 2024 22:46:31 +0000
Received: by outflank-mailman (input) for mailman id 765165;
 Thu, 25 Jul 2024 22:46:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sX7ED-0001HH-6Z; Thu, 25 Jul 2024 22:46:29 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sX7EC-0002BP-MX; Thu, 25 Jul 2024 22:46:28 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sX7EC-0003YA-Ao; Thu, 25 Jul 2024 22:46:28 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sX7EC-00070V-AN; Thu, 25 Jul 2024 22:46:28 +0000
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
	bh=uf4dY2yWur06dR51MRH9GzL//IQ3LAavzyzX/ljSs/M=; b=quVAAsP/0R5GsVFXR90fsxMPoZ
	/iPL9XeLNp0w6nXxyBCnx2BQ1qW2fDjVkL0ofi/UNCaV0zxmWbyQ5sZqIvgevD+bYeAKh6ePlNo/e
	O2VmUXwicceIFaA+jmMAgUhSU3N6X5kwgKreURvLQ4okldGPLM7NKK6TT3FAecOaqgKw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187002-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-6.1 test] 187002: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-6.1:test-amd64-amd64-libvirt-pair:debian-fixup/dst_host:fail:heisenbug
    linux-6.1:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=c18e82d3ee4426dd73eaa5550ac54b8bf01133cd
X-Osstest-Versions-That:
    linux=9b3f9a5b12dc96965b2fcc9d7d8342f1b63e29c4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 25 Jul 2024 22:46:28 +0000

flight 187002 linux-6.1 real [real]
flight 187009 linux-6.1 real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/187002/
http://logs.test-lab.xenproject.org/osstest/logs/187009/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-libvirt-pair 21 debian-fixup/dst_host fail pass in 187009-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 186877
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 186877
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 186877
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 186877
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 186877
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 186877
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                c18e82d3ee4426dd73eaa5550ac54b8bf01133cd
baseline version:
 linux                9b3f9a5b12dc96965b2fcc9d7d8342f1b63e29c4

Last test of basis   186877  2024-07-18 11:42:52 Z    7 days
Testing same since   187002  2024-07-25 08:13:58 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Agathe Boutmy <agathe@boutmy.com>
  Aivaz Latypov <reichaivaz@gmail.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alexander Gordeev <agordeev@linux.ibm.com>
  Alexander Usyskin <alexander.usyskin@intel.com>
  Alexey Makhalov <alexey.makhalov@broadcom.com>
  Alvin Lee <alvin.lee2@amd.com>
  Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
  Ananth Narayan <Ananth.Narayan@amd.com>
  Andreas Hindborg <a.hindborg@samsung.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Anjali K <anjalik@linux.ibm.com>
  Anup Patel <apatel@ventanamicro.com>
  Ard Biesheuvel <ardb@kernel.org>
  Armin Wolf <W_Armin@gmx.de>
  Arnd Bergmann <arnd@arndb.de>
  Atish Patra <atishp@rivosinc.com>
  Ayala Beker <ayala.beker@intel.com>
  Baokun Li <libaokun1@huawei.com>
  Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Bjørn Mork <bjorn@mork.no>
  Borislav Petkov (AMD) <bp@alien8.de>
  Chen Ni <nichen@iscas.ac.cn>
  Christian Brauner <brauner@kernel.org>
  Chunguang Xu <chunguang.xu@shopee.com>
  Conor Dooley <conor.dooley@microchip.com>
  Daniel Gabay <daniel.gabay@intel.com>
  Daniel Wagner <dwagner@suse.de>
  Daniel Wheeler <daniel.wheeler@amd.com>
  Daniele Palmas <dnlplm@gmail.com>
  David Laight <david.laight@aculab.com>
  David Lechner <dlechner@baylibre.com>
  David Sterba <dsterba@suse.com>
  Dhananjay Ugwekar <Dhananjay.Ugwekar@amd.com>
  Dmitry Antipov <dmantipov@yandex.ru>
  Dmitry Mastykin <mastichi@gmail.com>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Edward Adam Davis <eadavis@qq.com>
  Eric Dumazet <edumazet@google.com>
  Filipe Manana <fdmanana@suse.com>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Ganesh Goudar <ganeshgr@linux.ibm.com>
  Gao Xiang <hsiangkao@linux.alibaba.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Hannes Reinecke <hare@suse.de>
  Hans de Goede <hdegoede@redhat.com>
  Heiko Carstens <hca@linux.ibm.com>
  Huacai Chen <chenhuacai@loongson.cn>
  Ian Ray <ian.ray@gehealthcare.com>
  Ilan Peer <ilan.peer@intel.com>
  Jai Luthra <j-luthra@ti.com>
  Jakub Kicinski <kuba@kernel.org>
  Jann Horn <jannh@google.com>
  Jason A. Donenfeld <Jason@zx2c4.com>
  Jeff Layton <jlayton@kernel.org>
  Jens Axboe <axboe@kernel.dk>
  Jens Wiklander <jens.wiklander@linaro.org>
  Jerry Zuo <jerry.zuo@amd.com>
  Jiri Kosina <jkosina@suse.com>
  Johannes Berg <johannes.berg@intel.com>
  John Hubbard <jhubbard@nvidia.com>
  Jon Hunter <jonathanh@nvidia.com>
  Jonathan Denose <jdenose@google.com>
  Kailang Yang <kailang@realtek.com>
  Kees Cook <keescook@chromium.org>
  Keith Busch <kbusch@kernel.org>
  kernelci.org bot <bot@kernelci.org>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Louis Dalibard <ontake@ontake.dev>
  Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Marc Zyngier <maz@kernel.org>
  Mark Brown <broonie@kernel.org>
  Mark-PK Tsai <mark-pk.tsai@mediatek.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Martin Wilck <martin.wilck@suse.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Michael Ellerman <mpe@ellerman.id.au>
  ming-jen.chang <ming-jen.chang@mediatek.com>
  Miri Korenblit <miriam.rachel.korenblit@intel.com>
  Muhammad Usama Anjum <usama.anjum@collabora.com>
  Namjae Jeon <linkinjeon@kernel.org>
  Nathan Chancellor <nathan@kernel.org>
  Nick Child <nnac123@linux.ibm.com>
  Nicolas Escande <nico.escande@gmail.com>
  Nilesh Javali <njavali@marvell.com>
  Palmer Dabbelt <palmer@rivosinc.com>
  Paolo Abeni <pabeni@redhat.com>
  Pavel Machek (CIP) <pavel@denx.de>
  Peter Ujfalusi <peter.ujfalusi@gmail.com>
  Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
  Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
  Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
  Primoz Fiser <primoz.fiser@norik.com>
  Puranjay Mohan <puranjay@kernel.org>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Randy Dunlap <rdunlap@infradead.org>
  Ritesh Harjani (IBM) <ritesh.list@gmail.com>
  Rob Herring (Arm) <robh@kernel.org>
  Ron Economos <re@w6rz@net>
  Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
  Sagi Grimberg <sagi@grimberg.me>
  Samuel Holland <samuel.holland@sifive.com>
  Sasha Levin <sashal@kernel.org>
  Saurav Kashyap <skashyap@marvell.com>
  Scott Mayhew <smayhew@redhat.com>
  SeongJae Park <sj@kernel.org>
  Shengjiu Wang <shengjiu.wang@nxp.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Stefan Schmidt <stefan@datenfreihafen.org>
  Steve French <stfrench@microsoft.com>
  Takashi Iwai <tiwai@suse.de>
  Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Thomas GENTY <tomlohave@gmail.com>
  Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
  Tomas Winkler <tomas.winkler@intel.com>
  Trond Myklebust <trond.myklebust@hammerspace.com>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Vishal Chourasia <vishalc@linux.ibm.com>
  Vyacheslav Frantsishko <itmymaill@gmail.com>
  Xingui Yang <yangxingui@huawei.com>
  Yedidya Benshimol <yedidya.ben.shimol@intel.com>
  Yunshui Jiang <jiangyunshui@kylinos.cn>
  Yuntao Wang <yuntao.wang@linux.dev>
  Zizhi Wo <wozizhi@huawei.com>

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
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
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
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-amd64-libvirt-pair                                fail    
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
 test-amd64-amd64-examine-uefi                                pass    
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


Pushing revision :

hint: The 'hooks/update' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
hint: The 'hooks/post-receive' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
hint: The 'hooks/post-update' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
To xenbits.xen.org:/home/xen/git/linux-pvops.git
   9b3f9a5b12dc9..c18e82d3ee442  c18e82d3ee4426dd73eaa5550ac54b8bf01133cd -> tested/linux-6.1

