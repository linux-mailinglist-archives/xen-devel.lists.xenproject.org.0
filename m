Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7247E6323
	for <lists+xen-devel@lfdr.de>; Thu,  9 Nov 2023 06:23:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629470.981731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0xVD-0004do-Cd; Thu, 09 Nov 2023 05:22:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629470.981731; Thu, 09 Nov 2023 05:22:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0xVD-0004bO-9w; Thu, 09 Nov 2023 05:22:51 +0000
Received: by outflank-mailman (input) for mailman id 629470;
 Thu, 09 Nov 2023 05:22:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r0xVB-0004bE-LJ; Thu, 09 Nov 2023 05:22:49 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r0xVB-0002Do-Do; Thu, 09 Nov 2023 05:22:49 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r0xVA-0001qj-TS; Thu, 09 Nov 2023 05:22:49 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1r0xVA-0002S3-Se; Thu, 09 Nov 2023 05:22:48 +0000
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
	bh=pxGtufy2jK9mDyn9PMsvuN6n1n6aaLyXH9QTm6uzLcs=; b=GR9X4Ye/zh3xGIE/k3d8UXhYpM
	Z0yskV2VurmM9ANe4lwbnPV3vnzJcMkW96naKymt+NEuK7PbHOsSRtFlKioVO0YtjEtG9qQy+Kdvh
	kVAVfd6cxMbIgwjM3GUWxzezRkJJo+cV/g6lrxPQl/8cgXTPUSlj33xpFzfZGV2XXhW4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183714-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 183714: tolerable trouble: fail/pass/starved - PUSHED
X-Osstest-Failures:
    linux-5.4:test-armhf-armhf-xl-credit1:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-vhd:guest-start:fail:heisenbug
    linux-5.4:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:heisenbug
    linux-5.4:test-amd64-amd64-xl-rtds:xen-boot:fail:allowable
    linux-5.4:test-armhf-armhf-xl-multivcpu:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-dom0pvh-xl-amd:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    linux=87e8e7a7aa1f96276252a90373de1d56add31918
X-Osstest-Versions-That:
    linux=86ea40e6ad22d9d7daa54b9e8167ad1e4a8a48ee
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 09 Nov 2023 05:22:48 +0000

flight 183714 linux-5.4 real [real]
flight 183719 linux-5.4 real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/183714/
http://logs.test-lab.xenproject.org/osstest/logs/183719/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-xl-credit1 18 guest-start/debian.repeat fail pass in 183719-retest
 test-armhf-armhf-xl-vhd      13 guest-start         fail pass in 183719-retest
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail pass in 183719-retest

Regressions which are regarded as allowable (not blocking):
 test-amd64-amd64-xl-rtds      8 xen-boot                 fail REGR. vs. 183523

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-multivcpu 18 guest-start/debian.repeat fail blocked in 183523
 test-armhf-armhf-xl-vhd     14 migrate-support-check fail in 183719 never pass
 test-armhf-armhf-xl-vhd 15 saverestore-support-check fail in 183719 never pass
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 183523
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 183523
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 183523
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 183523
 test-armhf-armhf-xl-credit2  18 guest-start/debian.repeat    fail  like 183523
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 183523
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 183523
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 183523
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 183523
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 183523
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 183523
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 183523
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 183523
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-amd64-amd64-dom0pvh-xl-amd  3 hosts-allocate               starved  n/a

version targeted for testing:
 linux                87e8e7a7aa1f96276252a90373de1d56add31918
baseline version:
 linux                86ea40e6ad22d9d7daa54b9e8167ad1e4a8a48ee

Last test of basis   183523  2023-10-25 10:14:26 Z   14 days
Testing same since   183714  2023-11-08 10:46:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "William A. Kennington III" <william@wkennington.com>
  Al Viro <viro@zeniv.linux.org.uk>
  Alain Volmat <alain.volmat@foss.st.com>
  Alessandro Carminati (Red Hat) <alessandro.carminati@gmail.com>
  Alessandro Carminati <alessandro.carminati@gmail.com>
  Alon Zahavi <zahavi.alon@gmail.com>
  Anastasia Belova <abelova@astralinux.ru>
  Andi Shyti <andi.shyti@kernel.org>
  Andrew Jeffery <andrew@codeconstruct.com.au>
  Arnd Bergmann <arnd@arndb.de>
  Arpana Arland <arpanax.arland@intel.com> (A Contingent worker at Intel)
  Baokun Li <libaokun1@huawei.com>
  Baoquan He <bhe@redhat.com>
  Ben Wolsieffer <ben.wolsieffer@hefring.com>
  Bjorn Andersson <andersson@kernel.org>
  Bjorn Andersson <quic_bjorande@quicinc.com>
  Bjorn Helgaas <bhelgaas@google.com>
  Borislav Petkov <bp@suse.de>
  Cameron Williams <cang1@live.co.uk>
  Catalin Marinas <catalin.marinas@arm.com>
  Chao Yu <chao@kernel.org>
  Christoph Hellwig <hch@lst.de>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Chuck Lever <chuck.lever@oracle.com>
  Damien Le Moal <damien.lemoal@opensource.wdc.com>
  David Lazar <dlazar@gmail.com>
  David S. Miller <davem@davemloft.net>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Douglas Anderson <dianders@chromium.org>
  Dragos-Marian Panait <dragos.panait@windriver.com>
  Eric Dumazet <edumazet@google.com>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Florian Westphal <fw@strlen.de>
  Francis Laniel <flaniel@linux.microsoft.com>
  Fred Chen <fred.chenchen03@gmail.com>
  Gavin Shan <gshan@redhat.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Hangyu Hua <hbh25y@gmail.com>
  Hans de Goede <hdegoede@redhat.com>
  Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
  Helge Deller <deller@gmx.de>
  Herve Codina <herve.codina@bootlin.com>
  Ingo Molnar <mingo@kernel.org>
  Ivan Vecera <ivecera@redhat.com>
  Jacob Keller <jacob.e.keller@intel.com>
  Jaegeuk Kim <jaegeuk@kernel.org>
  Jakub Kicinski <kuba@kernel.org>
  Javier Rodriguez <josejavier.rodriguez@duagon.com>
  Jeff Layton <jlayton@kernel.org>
  Jeffery Miller <jefferymiller@google.com>
  Jens Axboe <axboe@kernel.dk>
  Jian Zhang <zhangjian.3032@bytedance.com>
  Jinjie Ruan <ruanjinjie@huawei.com>
  Joe Damato <jdamato@fastly.com>
  Johannes Thumshirn <jth@kernel.org>
  Jon Hunter <jonathanh@nvidia.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Jorge Maidana <jorgem.linux@gmail.com>
  Jorge Sanjuan Garcia <jorge.sanjuangarcia@duagon.com>
  Josh Poimboeuf <jpoimboe@kernel.org>
  Josh Poimboeuf <jpoimboe@redhat.com>
  Juergen Gross <jgross@suse.com>
  Kazunori Kobayashi <kazunori.kobayashi@miraclelinux.com>
  Keith Busch <kbusch@kernel.org>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Kunwu Chan <chentao@kylinos.cn>
  Lee Jones <lee@kernel.org>
  Liha Sikanen <lihasika@gmail.com>
  LihaSika <lihasika@gmail.com>
  Liming Sun <limings@nvidia.com>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Luis Machado <luis.machado@arm.com>
  Lukasz Majczak <lma@semihalf.com>
  Manasi Navare <navaremanasi@chromium.org>
  Marc Zyngier <maz@kernel.org>
  Marco Elver <elver@google.com>
  Marek Szyprowski <m.szyprowski@samsung.com>
  Mark Brown <broonie@kernel.org>
  Mark Rutland <mark.rutland@arm.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Masami Hiramatsu (Google) <mhiramat@kernel.org>
  Mateusz Palczewski <mateusz.palczewski@intel.com>
  Mathieu Poirier <mathieu.poirier@linaro.org>
  Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
  Maximilian Heyne <mheyne@amazon.de>
  Michael S. Tsirkin <mst@redhat.com>
  Miquel Raynal <miquel.raynal@bootlin.com>
  Mirsad Goran Todorovac <mirsad.todorovac@alu.unizg.hr>
  Naama Meir <naamax.meir@linux.intel.com>
  Nathan Chancellor <nathan@kernel.org>
  Neal Cardwell <ncardwell@google.com>
  Oleksandr Tymoshenko <ovt@google.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Abeni <pabeni@redhat.com>
  Paul Barker <paul.barker.ct@bp.renesas.com>
  Peng Fan <peng.fan@nxp.com>
  Peter Rosin <peda@axentia.se>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Peter Zijlstra <peterz@infradead.org>
  Pucha Himasekhar Reddy <himasekharx.reddy.pucha@intel.com> (A Contingent worker at Intel)
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Ravi Chandra Minnikanti <rminnikanti@marvell.com>
  Rodríguez Barbarin, José Javier <JoseJavier.Rodriguez@duagon.com>
  Sagi Grimberg <sagi@grimberg.me>
  Sasha Levin <sashal@kernel.org>
  Sasha Neftin <sasha.neftin@intel.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Shuming Fan <shumingf@realtek.com>
  Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
  Stephen Boyd <sboyd@kernel.org>
  Steve French <stfrench@microsoft.com>
  Su Hui <suhui@nfschina.com>
  Szilard Fabian <szfabian@bluemarch.art>
  Theodore Ts'o <tytso@mit.edu>
  Thomas Gleixner <tglx@linutronix.de>
  Tomas Henzl <thenzl@redhat.com>
  Vicki Pfau <vi@endrift.com>
  Vinod Koul <vkoul@kernel.org>
  Wang Hai <wanghai38@huawei.com>
  William A. Kennington III <william@wkennington.com>
  Wolfram Sang <wsa@kernel.org>
  Zhang Shurong <zhang_shurong@foxmail.com>
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
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 fail    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  pass    
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
 test-amd64-i386-qemut-rhel6hvm-amd                           pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-dom0pvh-xl-amd                              starved 
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-i386-xl-qemut-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-i386-xl-qemut-ws16-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-i386-examine-bios                                 pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  fail    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-i386-examine                                      pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                fail    
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
 test-amd64-amd64-xl-rtds                                     fail    
 test-armhf-armhf-xl-rtds                                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-i386-examine-uefi                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      fail    
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

hint: The 'hooks/update' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
hint: The 'hooks/post-receive' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
hint: The 'hooks/post-update' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
To xenbits.xen.org:/home/xen/git/linux-pvops.git
   86ea40e6ad22..87e8e7a7aa1f  87e8e7a7aa1f96276252a90373de1d56add31918 -> tested/linux-5.4

