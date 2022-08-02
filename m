Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E873C587F3A
	for <lists+xen-devel@lfdr.de>; Tue,  2 Aug 2022 17:49:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379398.612828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIu8k-0007k4-BL; Tue, 02 Aug 2022 15:49:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379398.612828; Tue, 02 Aug 2022 15:49:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIu8k-0007hH-8H; Tue, 02 Aug 2022 15:49:02 +0000
Received: by outflank-mailman (input) for mailman id 379398;
 Tue, 02 Aug 2022 15:49:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oIu8j-0007h7-Eq; Tue, 02 Aug 2022 15:49:01 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oIu8j-0000oV-Ac; Tue, 02 Aug 2022 15:49:01 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oIu8i-0001wM-TK; Tue, 02 Aug 2022 15:49:01 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oIu8i-0004DQ-Sr; Tue, 02 Aug 2022 15:49:00 +0000
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
	bh=VrYrY52tXJohW4DOIjuMJ9EmvXDRJ6MzOIx6AcY4PuM=; b=G/IXRQi83wFzlKLVyYoGPLp/FE
	KxLXR52+iqpRDoFtSo26CT7whSzIpqdq2p72Kft6Vr1nJuCa3mKyqPy4VkS0xYOb3xxufyHOUI0Tq
	V2pXAoUjWxame0RkVm+3uKE0piAWyiVFOUwqHyuIGN2BJPUjXrp9cprnL6vM/DmKj4qw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-172074-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 172074: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-xl-credit2:xen-boot:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=9de1f9c8ca5100a02a2e271bdbde36202e251b4b
X-Osstest-Versions-That:
    linux=0fac198def2b41138850867b6aa92044c76ff802
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 02 Aug 2022 15:49:00 +0000

flight 172074 linux-linus real [real]
flight 172083 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/172074/
http://logs.test-lab.xenproject.org/osstest/logs/172083/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-xl-credit2   8 xen-boot            fail pass in 172083-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-credit2 15 migrate-support-check fail in 172083 never pass
 test-armhf-armhf-xl-credit2 16 saverestore-support-check fail in 172083 never pass
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 172066
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 172066
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 172066
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 172066
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 172066
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 172066
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 172066
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 172066
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass

version targeted for testing:
 linux                9de1f9c8ca5100a02a2e271bdbde36202e251b4b
baseline version:
 linux                0fac198def2b41138850867b6aa92044c76ff802

Last test of basis   172066  2022-08-01 16:41:51 Z    0 days
Testing same since   172074  2022-08-02 02:01:19 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alexandre Torgue <alexandre.torgue@foss.st.com>
  Alexandru Elisei <alexandru.elisei@arm.com>
  Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
  Andre Mueller <am@emlix.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andrey Konovalov <andreyknvl@gmail.com>
  Andrey Konovalov <andreyknvl@google.com>
  Andy Lutomirski <luto@kernel.org>
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Anshuman Khandual <anshuman.khandual@arm.com>
  Antonio Borneo <antonio.borneo@foss.st.com>
  Ard Biesheuvel <ardb@kernel.org>
  Barry Song <v-songbaohua@oppo.com>
  Bartosz Golaszewski <brgl@bgdev.pl>
  Ben Dooks <ben-linux@fluff.org>
  Bjorn Helgaas <bhelgaas@google.com>   # pci_ids.h
  Borislav Petkov <bp@suse.de>
  Catalin Marinas <catalin.marinas@arm.com>
  Chang S. Bae <chang.seok.bae@intel.com>
  Chen Jun <chenjun102@huawei.com>
  Chen Yu <yu.c.chen@intel.com>
  Chen Zhongjin <chenzhongjin@huawei.com>
  Chengming Zhou <zhouchengming@bytedance.com>
  Christian Göttsche <cgzones@googlemail.com>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Claudiu Beznea <claudiu.beznea@microchip.com>
  Cruz Zhao <CruzZhao@linux.alibaba.com>
  Daniel Lezcano <daniel.lezcano@linaro.org>
  Dave Hansen <dave.hansen@linux.intel.com>
  David Chen <david.chen@nutanix.com>
  David Rientjes <rientjes@google.com>
  Dietmar Eggemann <dietmar.eggemann@arm.com>
  Eric Lin <eric.lin@sifive.com>
  Francis Laniel <flaniel@linux.microsoft.com>
  Gavin Shan <gshan@redhat.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Geert Uytterhoeven <geert@linux-m68k.org>
  Guangbin Huang <huangguangbin2@huawei.com>
  Guenter Roeck <linux@roeck-us.net>
  H. Peter Anvin (Intel) <hpa@zytor.com>
  Haibin Zhang <haibinzhang@tencent.com>
  haibinzhang (张海斌) <haibinzhang@tencent.com>
  Hanjun Guo <guohanjun@huawei.com>
  hewenliang <hewenliang4@huawei.com>
  Huacai Chen <chenhuacai@loongson.cn>
  Hugh Dickins <hughd@google.com>
  Hyeonggon Yoo <42.hyeyoo@gmail.com>
  Ian Rogers <irogers@google.com>
  Ingo Molnar <mingo@kernel.org>
  Ira Weiny <ira.weiny@intel.com>
  James Morse <james.morse@arm.com>
  Jason A. Donenfeld <Jason@zx2c4.com>
  Jason Wang <wangborong@cdjrlc.com>
  Jiang Jian <jiangjian@cdjrlc.com>
  Jianmin Lv <lvjianmin@loongson.cn>
  Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
  Jisheng Zhang <jszhang@kernel.org>
  Joey Gouly <joey.gouly@arm.com>
  Johan Hovold <johan@kernel.org>
  John Keeping <john@metanate.com>
  Jonathan McDowell <noodles@fb.com>
  Josh Don <joshdon@google.com>
  Juerg Haefliger <juerg.haefliger@canonical.com>
  Juerg Haefliger <juergh@canonical.com>
  Julia Lawall <Julia.Lawall@inria.fr>
  Juri Lelli <juri.lelli@redhat.com>
  K Prateek Nayak <kprateek.nayak@amd.com>
  Kan Liang <kan.liang@linux.intel.com>
  Kartik <kkartik@nvidia.com>
  Kefeng Wang <wangkefeng.wang@huawei.com>
  keliu <liuke94@huawei.com>
  Kristina Martsenko <kristina.martsenko@arm.com>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Laurent Vivier <laurent@vivier.eu>
  Li zeming <zeming@nfschina.com>
  Liang He <windhl@126.com>
  Like Xu <likexu@tencent.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Liu Song <liusong@linux.alibaba.com>
  Loic Pallardy <loic.pallardy@foss.st.com>
  Ludovic Barre <ludovic.barre@foss.st.com>
  Lukas Bulwahn <lukas.bulwahn@gmail.com>
  Lukas Wunner <lukas@wunner.de>
  Lukasz Luba <lukasz.luba@arm.com>
  Madhavan T. Venkataraman <madvenka@linux.microsoft.com>
  Marc Zyngier <maz@kernel.org>
  Marco Elver <elver@google.com>
  Mario Limonciello <mario.limonciello@amd.com>
  Mark Brown <broonie@kernel.org>
  Mark Rutland <mark.rutland@arm.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
  Mel Gorman <mgorman@techsingularity.net>
  Michael Jeanson <mjeanson@efficios.com>
  Michael Walle <michael@walle.cc>
  Mohini Narkhede <mohini.narkhede@intel.com>
  Muchun Song <songmuchun@bytedance.com>
  Nadav Amit <namit@vmware.com>
  Namhyung Kim <namhyung@kernel.org>
  Nathan Chancellor <nathan@kernel.org>
  Nicolas Saenz Julienne <nsaenzju@redhat.com>
  Nikita Shubin <n.shubin@yadro.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Paran Lee <p4ranlee@gmail.com>
  Paul Cercueil <paul@crapouillou.net>
  Peter Collingbourne <pcc@google.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Peter Zijlstra <peterz@infradead.org>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Randy Dunlap <rdunlap@infradead.org>
  Ravi Bangoria <ravi.bangoria@amd.com>
  Rob Herring <robh@kernel.org>
  Roman Gushchin <roman.gushchin@linux.dev>
  Samuel Holland <samuel@sholland.org>
  Sandipan Das <sandipan.das@amd.com>
  Schspa Shi <schspa@gmail.com>
  Shakeel Butt <shakeelb@google.com>
  Shreenidhi Shedi <sshedi@vmware.com>
  Smita Koralahalli <Smita.KoralahalliChannabasappa@amd.com>
  Stephane Eranian <eranian@google.com>
  Stéphane Graber <stgraber@ubuntu.com>
  Szabolcs Nagy <szabolcs.nagy@arm.com>
  Tanmay Jagdale <tanmay@marvell.com>
  Tejun Heo <tj@kernel.org>
  Thierry Reding <treding@nvidia.com>
  Thomas Gleixner <tglx@linutronix.de>
  Tianchen Ding <dtcccc@linux.alibaba.com>
  Tong Tiangen <tongtiangen@huawei.com>
  Tony Lindgren <tony@atomide.com>
  Uros Bizjak <ubizjak@gmail.com>
  Vasily Averin <vvs@openvz.org>
  Vincent Donnefort <vdonnefort@google.com>
  Vincent Donnefort <vincent.donnefort@arm.com>
  Vincent Guittot <vincent.guittot@linaro.org>
  Vlastimil Babka <vbabka@suse.cz>
  Will Deacon <will@kernel.org>
  William Dean <williamsukatube@163.com>
  Wolfram Sang <wsa+renesas@sang-engineering.com>
  Wyes Karny <wyes.karny@amd.com>
  Xiang wangx <wangxiang@cdjrlc.com>
  Xiongwei Song <xiongwei.song@windriver.com>
  XU pengfei <xupengfei@nfschina.com>
  Xu Qiang <xuqiang36@huawei.com>
  XueBing Chen <chenxuebing@jari.cn>
  Yajun Deng <yajun.deng@linux.dev>
  Yang Yingliang <yangyingliang@huawei.com>
  Yicong Yang <yangyicong@hisilicon.com>
  Zhang Qiao <zhangqiao22@huawei.com>
  Zhang Rui <rui.zhang@intel.com>

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
 test-amd64-amd64-freebsd11-amd64                             pass    
 test-amd64-amd64-freebsd12-amd64                             pass    
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
 test-armhf-armhf-xl-credit2                                  fail    
 test-armhf-armhf-xl-cubietruck                               pass    
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
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-libvirt-qcow2                               pass    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      pass    
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

hint: The 'hooks/update' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
hint: The 'hooks/post-receive' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
hint: The 'hooks/post-update' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
To xenbits.xen.org:/home/xen/git/linux-pvops.git
   0fac198def2b..9de1f9c8ca51  9de1f9c8ca5100a02a2e271bdbde36202e251b4b -> tested/linux-linus

