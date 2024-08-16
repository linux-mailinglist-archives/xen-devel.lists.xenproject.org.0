Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7800954AB0
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2024 15:02:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778619.1188664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sewai-00062G-9i; Fri, 16 Aug 2024 13:02:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778619.1188664; Fri, 16 Aug 2024 13:02:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sewai-00060W-70; Fri, 16 Aug 2024 13:02:04 +0000
Received: by outflank-mailman (input) for mailman id 778619;
 Fri, 16 Aug 2024 13:02:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sewah-00060M-DF; Fri, 16 Aug 2024 13:02:03 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sewah-0006lD-4X; Fri, 16 Aug 2024 13:02:03 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sewag-00023B-En; Fri, 16 Aug 2024 13:02:02 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sewag-0000sJ-EH; Fri, 16 Aug 2024 13:02:02 +0000
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
	bh=T/mGRIEslAAgTsIo5bcFwGeB2ORxDFQXJ2PYc/y+vVA=; b=yGvFUOy43dGWCxrK29sd2gTn3b
	uDk+JO2U7VW4QsW2vYmjzRjN5Qj+BSjrBikJl9gLzRDz4i13/+xKAyTRSHVkJfY37XFoB4RAbUTnj
	R7tIzwaj+b9Nbb2o2YE94kARQ7JMi8NSLcKdKCyfW9oCAgD6ZIc+6d3A9kc9Zo0wtYLY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187252-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-6.1 test] 187252: tolerable FAIL - PUSHED
X-Osstest-Failures:
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
    linux-6.1:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=117ac406ba904da738fb79a3b2c96d4a385292c1
X-Osstest-Versions-That:
    linux=36790ef5e00b69ccb92817f95ba1928eea24eebb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 16 Aug 2024 13:02:02 +0000

flight 187252 linux-6.1 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187252/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 187211
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 187211
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 187211
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 187211
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 187211
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 187211
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                117ac406ba904da738fb79a3b2c96d4a385292c1
baseline version:
 linux                36790ef5e00b69ccb92817f95ba1928eea24eebb

Last test of basis   187211  2024-08-11 10:42:52 Z    5 days
Testing same since   187241  2024-08-14 12:15:39 Z    2 days    3 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alex Deucher <alexander.deucher@amd.com>
  Alex Hung <alex.hung@amd.com>
  Alexander Gordeev <agordeev@linux.ibm.com>
  Andi Kleen <ak@linux.intel.com>
  Andi Shyti <andi.shyti@kernel.org>
  Andrew Morton <akpm@linux-foundation.org>
  Andrey Konovalov <andreyknvl@gmail.com>
  Anna Schumaker <Anna.Schumaker@Netapp.com>
  Anton Khirnov <anton@khirnov.net>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Arseniy Krasnov <avkrasnov@salutedevices.com>
  Bart Van Assche <bvanassche@acm.org>
  Benjamin Coddington <bcodding@redhat.com>
  Besar Wicaksono <bwicaksono@nvidia.com>
  Bharath SM <bharathsm@microsoft.com>
  Bjorn Helgaas <bhelgaas@google.com>
  Bjørn Mork <bjorn@mork.no>
  Bob Zhou <bob.zhou@amd.com>
  Boqun Feng <boqun.feng@gmail.com>
  Catalin Marinas <catalin.marinas@arm.com>
  Chandan Babu R <chandanbabu@kernel.org>
  Cheng-Jui Wang <cheng-jui.wang@mediatek.com>
  Chi Zhiling <chizhiling@kylinos.cn>
  Chris Wulff <crwulff@gmail.com>
  Christoph Hellwig <hch@lst.de>
  ChromeOS CQ Test <chromeos-kernel-stable-merge@google.com>
  Csókás, Bence <csokas.bence@prolan.hu>
  Curtis Malainey <cujomalainey@chromium.org>
  Damien Le Moal <dlemoal@kernel.org>
  Dan Williams <dan.j.williams@intel.com>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniel Lezcano <daniel.lezcano@linaro.org>
  Daniel Wheeler <daniel.wheeler@amd.com>
  Daniele Palmas <dnlplm@gmail.com>
  Darrick J. Wong <djwong@kernel.org>
  David Hildenbrand <david@redhat.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Dmitry Antipov <dmantipov@yandex.ru>
  Dragan Simic <dsimic@manjaro.org>
  Dragos Tatulea <dtatulea@nvidia.com>
  Dustin L. Howett <dustin@howett.net>
  Eric Dumazet <edumazet@google.com>
  Fangzhi Zuo <Jerry.Zuo@amd.com>
  Feng Tang <feng.tang@intel.com>
  Filipe Manana <fdmanana@suse.com>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Florian Westphal <fw@strlen.de>
  Frederic Weisbecker <frederic@kernel.org>
  FUJITA Tomonori <fujita.tomonori@gmail.com>
  Gaosheng Cui <cuigaosheng1@huawei.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Geliang Tang <geliang.tang@suse.com>
  George Kennedy <george.kennedy@oracle.com>
  George Zhang <George.zhang@amd.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Hamza Mahfooz <hamza.mahfooz@amd.com>
  Hanna Czenczek <hreitz@redhat.com>
  Hans de Goede <hdegoede@redhat.com>
  Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Huacai Chen <chenhuacai@loongson.cn>
  HungNien Chen <hn.chen@sunplusit.com>
  Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
  Ivan Lipski <ivlipski@amd.com>
  Jakub Kicinski <kuba@kernel.org>
  James Chapman <jchapman@katalix.com>
  Jan Kara <jack@suse.cz>
  Jason Wang <jasowang@redhat.com>
  Jens Axboe <axboe@kernel.dk>
  Jerome Brunet <jbrunet@baylibre.com>
  Jin Wang <jin1.wang@intel.com>
  Jiri Olsa <jolsa@kernel.org>
  Jithu Joseph <jithu.joseph@intel.com>
  Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
  Johan Hovold <johan@kernel.org>
  Johannes Berg <johannes.berg@intel.com>
  Jon Hunter <jonathanh@nvidia.com>
  Justin Stitt <justinstitt@google.com>
  Kemeng Shi <shikemeng@huaweicloud.com>
  Kevin Berry <kpberry@google.com>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Kuniyuki Iwashima <kuniyu@amazon.com>
  Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
  Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  Li Nan <linan122@huawei.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Lucas Stach <l.stach@pengutronix.de>
  Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Lyude Paul <lyude@redhat.com>
  Ma Jun <Jun.Ma2@amd.com>
  Ma Ke <make24@iscas.ac.cn>
  Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Marco Elver <elver@google.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Mark Brown <broonie@kernel.org>
  Mark Rutland <mark.rutland@arm.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Masami Hiramatsu (Google) <mhiramat@kernel.org>
  Matthieu Baerts (NGI0) <matttbe@kernel.org>
  Matthieu Baerts <matthieu.baerts@tessares.net>
  Menglong Dong <dongml2@chinatelecom.cn>
  Menglong Dong <menglong8.dong@gmail.com>
  Miaohe Lin <linmiaohe@huawei.com>
  Michael S. Tsirkin <mst@redhat.com>
  Michal Pecio <michal.pecio@gmail.com>
  Mikulas Patocka <mpatocka@redhat.com>
  Ming Qian <ming.qian@nxp.com>
  Muchun Song <muchun.song@linux.dev>
  Neil Armstrong <neil.armstrong@linaro.org>
  Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
  Nicolas Dichtel <nicolas.dichtel@6wind.com>
  Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Nikolay Aleksandrov <razor@blackwall.org>
  Oliver Neukum <oneukum@suse.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Abeni <pabeni@redhat.com>
  Paul E. McKenney <paulmck@kernel.org>
  Pavel Machek (CIP) <pavel@denx.de>
  Pengfei Xu <pengfei.xu@intel.com>
  Peter Oberparleiter <oberpar@linux.ibm.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Peter Zijlstra <peterz@infradead.org>
  Prashanth K <quic_prashk@quicinc.com>
  Qiang Yu <yuq825@gmail.com>
  Qu Wenruo <wqu@suse.com>
  Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Ricardo Ribalda <ribalda@chromium.org>
  Robert Foss <rfoss@kernel.org>
  Roman Smirnov <r.smirnov@omp.ru>
  Ron Economos <re@w6rz.net>
  Salvatore Bonaccorso <carnil@debian.org>
  Sasha Levin <sashal@kernel.org>
  Sebastian Fricke <sebastian.fricke@collabora.com>
  Sebastian Reichel <sebastian.reichel@collabora.com>
  Shay Drory <shayd@nvidia.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Song Liu <song@kernel.org>
  Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
  Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
  Stefan Wahren <wahrenst@gmx.net>
  Steve French <stfrench@microsoft.com>
  Steven 'Steve' Kendall <skend@chromium.org>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  syzbot+e6979a5d2f10ecb700e4@syzkaller.appspotmail.com
  Takashi Iwai <tiwai@suse.de>
  Tariq Toukan <tariqt@nvidia.com>
  Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
  Theodore Ts'o <tytso@mit.edu>
  Thomas Gleixner <tglx@linutronix.de>
  Thomas Weißschuh <linux@weissschuh.net>
  Thomas Zimmermann <tzimmermann@suse.de>
  Tom Parkin <tparkin@katalix.com>
  Tze-nan Wu <Tze-nan.Wu@mediatek.com>
  Vamshi Gajjela <vamshigajjela@google.com>
  Victor Skvortsov <victor.skvortsov@amd.com>
  Waiman Long <longman@redhat.com>
  Wayne Lin <wayne.lin@amd.com>
  Will Deacon <will@kernel.org>
  Wolfram Sang <wsa+renesas@sang-engineering.com>
  Wolfram Sang <wsa@kernel.org>
  Xiaxi Shen <shenxiaxi26@gmail.com>
  Xin Long <lucien.xin@gmail.com>
  Yang Shi <yang@os.amperecomputing.com>
  Yang Wang<kevinyang.wang@amd.com>
  Yang Yingliang <yangyingliang@huawei.com>
  Yann Sionneau <ysionneau@kalrayinc.com>
  Yipeng Zou <zouyipeng@huawei.com>
  Yonghong Song <yonghong.song@linux.dev>
  Yu Kuai <yukuai3@huawei.com>
  Yu Liao <liaoyu15@huawei.com>
  Yves-Alexis Perez <corsac@debian.org>
  Zheng Zucheng <zhengzucheng@huawei.com>
  Zhiguo Niu <zhiguo.niu@unisoc.com>

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
   36790ef5e00b..117ac406ba90  117ac406ba904da738fb79a3b2c96d4a385292c1 -> tested/linux-6.1

