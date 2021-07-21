Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9693D06AA
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jul 2021 04:19:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159083.292648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m61oK-0004VC-Ef; Wed, 21 Jul 2021 02:18:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159083.292648; Wed, 21 Jul 2021 02:18:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m61oK-0004UU-A0; Wed, 21 Jul 2021 02:18:12 +0000
Received: by outflank-mailman (input) for mailman id 159083;
 Wed, 21 Jul 2021 02:18:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m61oI-0004TZ-JX; Wed, 21 Jul 2021 02:18:10 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m61oI-00061b-Bd; Wed, 21 Jul 2021 02:18:10 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m61oH-00008F-Qz; Wed, 21 Jul 2021 02:18:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1m61oH-0005Hs-QQ; Wed, 21 Jul 2021 02:18:09 +0000
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
	bh=Z5Z+AUu8xEKadlrTDZuPXfxO4bGVP8GBpQ6I/ancnjo=; b=Ka+tVPGLZkPpgRlSsnEwJzduyp
	NrWac2B/d8swRqB50FTECww+QLu87TVr4BiEo1knSqlk8p+gfoBFuq1ecVvjiwzY+z9533EC9/XZz
	QTFUwxMRX0CQcPwHerVh1SOqNiTRY/UaQ0p5XXmWmXRdZScw1k96HC3Gsu9kh25qYsbc=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-163844-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 163844: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-5.4:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:allowable
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=9afc0c209685bc239e45b6ca1ea07186b78c7437
X-Osstest-Versions-That:
    linux=795e84798fa7f6c753ded1a95037b4cf08db85d4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 21 Jul 2021 02:18:09 +0000

flight 163844 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/163844/

Failures :-/ but no regressions.

Regressions which are regarded as allowable (not blocking):
 test-armhf-armhf-xl-rtds    18 guest-start/debian.repeat fail REGR. vs. 163800

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 163800
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 163800
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 163800
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 163800
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 163800
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 163800
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 163800
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 163800
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 163800
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 163800
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 163800
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 linux                9afc0c209685bc239e45b6ca1ea07186b78c7437
baseline version:
 linux                795e84798fa7f6c753ded1a95037b4cf08db85d4

Last test of basis   163800  2021-07-19 07:11:17 Z    1 days
Testing same since   163844  2021-07-20 14:40:23 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alexander Shishkin <alexander.shishkin@linux.intel.com>
  Alexandre Belloni <alexandre.belloni@bootlin.com>
  Andrew Morton <akpm@linux-foundation.org>
  anton.ivanov@cambridgegreys.com
  Arnd Bergmann <arnd@arndb.de>
  Aswath Govindraju <a-govindraju@ti.com>
  Athira Rajeev <atrajeev@linux.vnet.ibm.com>
  Bartosz Golaszewski <bgolaszewski@baylibre.com>
  Benjamin Herrenschmidt <benh@kernel.crashing.org>
  Bixuan Cui <cuibixuan@huawei.com>
  Bjorn Helgaas <bhelgaas@google.com>
  Borislav Petkov <bp@suse.de>
  Brian Cain <bcain@codeaurora.org>
  Chandrakanth Patil <chandrakanth.patil@broadcom.com>
  Chang S. Bae <chang.seok.bae@intel.com>
  Chao Yu <yuchao0@huawei.com>
  Christian Borntraeger <borntraeger@de.ibm.com>
  Christian Brauner <christian.brauner@ubuntu.com>
  Christoph Hellwig <hch@lst.de>
  Christoph Niedermaier <cniedermaier@dh-electronics.com>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Corentin Labbe <clabbe@baylibre.com>
  Cristian Marussi <cristian.marussi@arm.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Daniel Lezcano <daniel.lezcano@linaro.org>
  Daniel Mack <daniel@zonque.org>
  Daniel Vetter <daniel.vetter@ffwll.ch>
  Dave Kleikamp <dave.kleikamp@oracle.com>
  David S. Miller <davem@davemloft.net>
  Dimitri John Ledkov <dimitri.ledkov@canonical.com>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Eric Sandeen <sandeen@redhat.com>
  Fabio Aiuto <fabioaiuto83@gmail.com>
  Florian Fainelli <f.fainelli@gmail.com>
  Frederic Weisbecker <frederic@kernel.org>
  Gao Xiang <hsiangkao@linux.alibaba.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Geoff Levand <geoff@infradead.org>
  Geoffrey D. Bennett <g@b4.vu>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Gregory CLEMENT <gregory.clement@bootlin.com>
  Guenter Roeck <linux@roeck-us.net>
  Hannes Reinecke <hare@suse.de>
  Hans de Goede <hdegoede@redhat.com>
  Heiko Carstens <hca@linux.ibm.com>
  Ilya Dryomov <idryomov@gmail.com>
  Jaegeuk Kim <jaegeuk@kernel.org>
  James Smart <jsmart2021@gmail.com>
  Jan Kiszka <jan.kiszka@siemens.com>
  Jason Wang <jasowang@redhat.com>
  Jeff Layton <jlayton@kernel.org>
  Jiajun Cao <jjcao20@fudan.edu.cn>
  Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
  John Garry <john.garry@huawei.com>
  Jon Hunter <jonathanh@nvidia.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Justin Tee <justin.tee@broadcom.com>
  Kashyap Desai <kashyap.desai@broadcom.com>
  Kefeng Wang <wangkefeng.wang@huawei.com>
  Krzysztof Kozlowski <krzk@kernel.org>
  Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
  Krzysztof Wilczyński <kw@linux.com>
  Lai Jiangshan <laijs@linux.alibaba.com>
  Lee Jones <lee.jones@linaro.org>
  Liguang Zhang <zhangliguang@linux.alibaba.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Logan Gunthorpe <logang@deltatee.com>
  Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
  Luiz Sampaio <sampaio.ime@gmail.com>
  Lv Yunlong <lyl2019@mail.ustc.edu.cn>
  Marc Zyngier <maz@kernel.org>
  Marek Behún <kabel@kernel.org>
  Mark Brown <broonie@kernel.org>
  Martin Fäcknitz <faecknitz@hotsplots.de>
  Martin K. Petersen <martin.petersen@oracle.com>
  Maurizio Lombardi <mlombard@redhat.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael S. Tsirkin <mst@redhat.com>
  Mike Christie <michael.christie@oracle.com>
  Mike Marshall <hubcap@omnibond.com>
  Nageswara R Sastry <rnsastry@linux.ibm.com <mailto:rnsastry@linux.ibm.com>>
  Namhyung Kim <namhyung@kernel.org>
  Nathan Chancellor <nathan@kernel.org>
  Nicholas Piggin <npiggin@gmail.com>
  Nick Desaulniers <ndesaulniers@google.com>
  Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Pali Rohár <pali@kernel.org>
  Paolo Bonzini <pbonzini@redhat.com>
  Paul E. McKenney <paulmck@kernel.org>
  Paul Mackerras <paulus@ozlabs.org>
  Peter Robinson <pbrobinson@gmail.com>
  Philipp Zabel <p.zabel@pengutronix.de>
  Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
  Po-Hsu Lin <po-hsu.lin@canonical.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Rafał Miłecki <rafal@milecki.pl>
  Randy Dunlap <rdunlap@infradead.org>
  Ray Jui <ray.jui@broadcom.com>
  Richard Weinberger <richard@nod.at>
  Robin Gong <yibin.gong@nxp.com>
  Ruslan Bilovol <ruslan.bilovol@gmail.com>
  Russell King <rmk+kernel@armlinux.org.uk>
  Sandor Bodo-Merle <sbodomerle@gmail.com>
  Sasha Levin <sashal@kernel.org>
  Sean Christopherson <seanjc@google.com>
  Sebastian Reichel <sebastian.reichel@collabora.com>
  Sergey Shtylyov <s.shtylyov@omp.ru>
  Shawn Guo <shawnguo@kernel.org>
  Sherry Sun <sherry.sun@nxp.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Srinivas Neeli <srinivas.neeli@xilinx.com>
  Stefan Eichenberger <eichest@gmail.com>
  Stephan Gerhold <stephan@gerhold.net>
  Stephen Boyd <swboyd@chromium.org>
  Steven Rostedt (VMware) <rostedt@goodmis.org>
  Sudeep Holla <sudeep.holla@arm.com>
  Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
  Sumit Saxena <sumit.saxena@broadcom.com>
  Takashi Iwai <tiwai@suse.de>
  Takashi Sakamoto <o-takashi@sakamocchi.jp>
  Tao Ren <rentao.bupt@gmail.com>
  Thierry Reding <thierry.reding@gmail.com>
  Thierry Reding <treding@nvidia.com>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Thomas Gleixner <tglx@linutronix.de>
  Tom Zanussi <zanussi@kernel.org>
  Tong Zhang <ztong0001@gmail.com>
  Tony Lindgren <tony@atomide.com>
  Trond Myklebust <trond.myklebust@hammerspace.com>
  Tyrel Datwyler <tyreld@linux.ibm.com>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Valentin Vidic <vvidic@valentin-vidic.from.hr>
  Valentine Barshak <valentine.barshak@cogentembedded.com>
  Vasily Gorbik <gor@linux.ibm.com>
  Vinod Koul <vkoul@kernel.org>
  Vladimir Zapolskiy <vz@mleia.com>
  Will Deacon <will@kernel.org>
  Wim Van Sebroeck <wim@linux-watchdog.org>
  Wolfram Sang <wsa@kernel.org>
  Xie Yongji <xieyongji@bytedance.com>
  Xin Tan <tanxin.ctf@gmail.com>
  Xiyu Yang <xiyuyang19@fudan.edu.cn>
  Yang Yingliang <yangyingliang@huawei.com>
  Yizhuo <yzhai003@ucr.edu>
  Yizhuo Zhai <yzhai003@ucr.edu>
  Yufen Yu <yuyufen@huawei.com>
  Zhen Lei <thunder.leizhen@huawei.com>
  Zhihao Cheng <chengzhihao1@huawei.com>
  Zou Wei <zou_wei@huawei.com>

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
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
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
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
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
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
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
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-amd64-pvgrub                                pass    
 test-amd64-amd64-i386-pvgrub                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-xl-raw                                       pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
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
   795e84798fa7..9afc0c209685  9afc0c209685bc239e45b6ca1ea07186b78c7437 -> tested/linux-5.4

