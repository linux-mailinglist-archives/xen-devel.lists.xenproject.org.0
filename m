Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1ED90152D
	for <lists+xen-devel@lfdr.de>; Sun,  9 Jun 2024 10:48:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736806.1142861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGED4-0004vu-Ab; Sun, 09 Jun 2024 08:47:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736806.1142861; Sun, 09 Jun 2024 08:47:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGED4-0004tO-7G; Sun, 09 Jun 2024 08:47:30 +0000
Received: by outflank-mailman (input) for mailman id 736806;
 Sun, 09 Jun 2024 08:47:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sGED3-0004tE-9x; Sun, 09 Jun 2024 08:47:29 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sGED3-0004b5-6k; Sun, 09 Jun 2024 08:47:29 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sGED2-0001Ii-S2; Sun, 09 Jun 2024 08:47:28 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sGED2-00080V-RW; Sun, 09 Jun 2024 08:47:28 +0000
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
	bh=BKATRq97Y92SjU0Fn3ezUYYEEAbIjResPwDiqB4winQ=; b=bf8KQ/ZGiUbkayrgheRtPtnzwY
	6oel+x6DU+OklsJV5d2BVzcw2VN0cDYAiKxY21s+MtF7MHrv21R695Js4ZP+n81gxipxNyn9HUZnu
	SndgwxM7FFhXnx8hCsumbGm9tYRJh2l9GSXoszSI/KYuxAf4CaVEu2Tx98Df8vd9Pc8g=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186292-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 186292: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-examine:reboot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:regression
    linux-linus:test-armhf-armhf-xl-arndale:xen-boot:fail:heisenbug
    linux-linus:test-armhf-armhf-xl:xen-boot:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:debian-hvm-install:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-multivcpu:xen-boot:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-rtds:xen-boot:fail:allowable
    linux-linus:test-armhf-armhf-xl-qcow2:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=061d1af7b0305227182bd9da60c7706c079348b7
X-Osstest-Versions-That:
    linux=8a92980606e3585d72d510a03b59906e96755b8a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 09 Jun 2024 08:47:28 +0000

flight 186292 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186292/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-examine      8 reboot                   fail REGR. vs. 186282
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 186282

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-xl-arndale   8 xen-boot         fail in 186290 pass in 186292
 test-armhf-armhf-xl           8 xen-boot                   fail pass in 186290
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 12 debian-hvm-install fail pass in 186290
 test-armhf-armhf-xl-multivcpu  8 xen-boot                  fail pass in 186290

Regressions which are regarded as allowable (not blocking):
 test-armhf-armhf-xl-rtds      8 xen-boot                 fail REGR. vs. 186282

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-qcow2     8 xen-boot            fail in 186290 like 186278
 test-armhf-armhf-libvirt-vhd  8 xen-boot            fail in 186290 like 186278
 test-armhf-armhf-xl         15 migrate-support-check fail in 186290 never pass
 test-armhf-armhf-xl     16 saverestore-support-check fail in 186290 never pass
 test-armhf-armhf-xl-raw     14 migrate-support-check fail in 186290 never pass
 test-armhf-armhf-xl-raw 15 saverestore-support-check fail in 186290 never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check fail in 186290 never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check fail in 186290 never pass
 test-armhf-armhf-xl-raw       8 xen-boot                     fail  like 186278
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 186282
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 186282
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 186282
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 186282
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 186282
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 186282
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                061d1af7b0305227182bd9da60c7706c079348b7
baseline version:
 linux                8a92980606e3585d72d510a03b59906e96755b8a

Last test of basis   186282  2024-06-07 18:13:19 Z    1 days
Failing since        186284  2024-06-08 00:43:36 Z    1 days    4 attempts
Testing same since   186290  2024-06-08 18:41:41 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alex Deucher <alexander.deucher@amd.com>
  Alexander Gordeev <agordeev@linux.ibm.com>
  Alexander Potapenko <glider@google.com>
  Andreas Hindborg <a.hindborg@samsung.com>
  Andrew Ballance <andrewjballance@gmail.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andy Shevchenko <andy.shevchenko@gmail.com>
  Armin Wolf <W_Armin@gmx.de>
  Arnd Bergmann <arnd@arndb.de>
  Aseda Aboagye <aaboagye@chromium.org>
  Baolin Wang <baolin.wang@linux.alibaba.com>
  Barry Song <baohua@kernel.org>
  Barry Song <v-songbaohua@oppo.com>
  Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Benjamin Tissoires <bentiss@kernel.org>
  Bingbu Cao <bingbu.cao@intel.com>
  Björn Töpel <bjorn@rivosinc.com>
  Borislav Petkov (AMD) <bp@alien8.de>
  Borislav Petkov <bp@alien8.de>
  Brian Johannesmeyer <bjohannesmeyer@gmail.com>
  Carlos Llamas <cmllamas@google.com>
  Chen Ni <nichen@iscas.ac.cn>
  Chengming Zhou <chengming.zhou@linux.dev>
  Chris Bainbridge <chris.bainbridge@gmail.com>
  Chris Li <chrisl@kernel.org>
  Christian Borntraeger <borntraeger@linux.ibm.com>
  Christoph Hellwig <hch@lst.de>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Chuck Lever <chuck.lever@oracle.com>
  Chunguang Xu <chunguang.xu@shopee.com>
  Cong Wang <cong.wang@bytedance.com>
  Dave Airlie <airlied@redhat.com>
  David Hildenbrand <david@redhat.com>
  David Kaplan <david.kaplan@amd.com>
  David Sterba <dsterba@suse.com>
  Dmitry Safonov <0x7f454c46@gmail.com>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Dr. David Alan Gilbert <linux@treblig.org>
  Filipe Manana <fdmanana@suse.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Gregor Herburger <gregor.herburger@tq-group.com>
  Hagar Hemdan <hagarhem@amazon.com>
  Haifeng Xu <haifeng.xu@shopee.com>
  Hans de Goede <hdegoede@redhat.com>
  Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Heiko Carstens <hca@linux.ibm.com>
  Huisong Li <lihuisong@huawei.com>
  Ian Forbes <ian.forbes@broadcom.com>
  Jean-Christophe Guillain <jean-christophe@guillain.net>
  Jeff Johnson <quic_jjohnson@quicinc.com>
  Jens Axboe <axboe@kernel.dk>
  Jerry Snitselaar <jsnitsel@redhat.com>
  Jessica Zhang <quic_jesszhan@quicinc.com>
  Jiri Kosina <jkosina@suse.com>
  Joerg Roedel <jroedel@suse.de>
  Johan Hovold <johan+linaro@kernel.org>
  Johannes Weiner <hannes@cmpxchg.org>
  José Expósito <jose.exposito89@gmail.com>
  Keith Busch <kbusch@kernel.org>
  Kun(llfl) <llfl@linux.alibaba.com>
  Lance Yang <ioworker0@gmail.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Liviu Dudau <liviu.dudau@arm.com>
  Louis Dalibard <ontake@ontake.dev>
  Lu Baolu <baolu.lu@linux.intel.com>
  Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
  Mario Limonciello <mario.limonciello@amd.com>
  Mark Rutland <mark.rutland@arm.com>
  Martin Tůma <martin.tuma@digiteqautomotive.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michal Hocko <mhocko@suse.com>
  Michal Wajdeczko <michal.wajdeczko@intel.com>
  Mike Rapoport (IBM) <rppt@kernel.org>
  Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
  Mikhail Zaslonko <zaslonko@linux.ibm.com>
  Muhammad Usama Anjum <usama.anjum@collabora.com>
  Nam Cao <namcao@linutronix.de>
  Neil Armstrong <neil.armstrong@linaro.org>
  Nikita Zhandarovich <n.zhandarovich@fintech.ru>
  Niklas Cassel <cassel@kernel.org>
  Omar Sandoval <osandov@fb.com>
  Oscar Salvador <osalvador@suse.de>
  Palmer Dabbelt <palmer@rivosinc.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Qu Wenruo <wqu@suse.com>
  Randy Dunlap <rdunlap@infradead.org>
  Richard Acayan <mailingradian@gmail.com>
  Robin Murphy <robin.murphy@arm.com>
  Ryusuke Konishi <konishi.ryusuke@gmail.com>
  Sakari Ailus <sakari.ailus@linux.intel.com>
  Samuel Holland <samuel.holland@sifive.com>
  Sebastian Andrzej Siewior <bigeasy@linutronix.de>
  Shakeel Butt <shakeel.butt@linux.dev>
  Steev Klimaszewski <steev@kali.org>
  Su Hui <suhui@nfschina.com>
  Suma Hegde <suma.hegde@amd.com>
  Sunil V L <sunilvl@ventanamicro.com>
  Suren Baghdasaryan <surenb@google.com>
  Tasos Sahanidis <tasos@tasossah.com>
  Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
  Thomas Gleixner <tglx@linutronix.de>
  Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
  Thomas Hellström <thomas.hellstrom@linux.intel.com>
  Vasant Hegde <vasant.hegde@amd.com>
  Vlastimil Babka <vbabka@suse.cz>
  Wei Li <liwei391@huawei.com>
  Weiwen Hu <huweiwen@linux.alibaba.com>
  Will Deacon <will@kernel.org>
  Yazen Ghannam <yazen.ghannam@amd.com>
  Yujie Liu <yujie.liu@intel.com>
  Zack Rusin <zack.rusin@broadcom.com>
  Zhang Lixu <lixu.zhang@intel.com>

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
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 fail    
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
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        fail    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     fail    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                fail    
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
 test-armhf-armhf-xl-raw                                      fail    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     fail    
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


Not pushing.

(No revision log; it would be 3554 lines long.)

