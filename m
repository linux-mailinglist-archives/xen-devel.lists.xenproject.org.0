Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 536A9991B95
	for <lists+xen-devel@lfdr.de>; Sun,  6 Oct 2024 02:28:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811112.1223770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxF8A-0005nk-UF; Sun, 06 Oct 2024 00:28:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811112.1223770; Sun, 06 Oct 2024 00:28:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxF8A-0005mD-RJ; Sun, 06 Oct 2024 00:28:14 +0000
Received: by outflank-mailman (input) for mailman id 811112;
 Sun, 06 Oct 2024 00:28:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sxF89-0005m3-Ub; Sun, 06 Oct 2024 00:28:13 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sxF89-0001tZ-LS; Sun, 06 Oct 2024 00:28:13 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sxF89-00014K-71; Sun, 06 Oct 2024 00:28:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sxF89-00058E-6W; Sun, 06 Oct 2024 00:28:13 +0000
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
	bh=0U4QH4PBs3sbqQKysXutRRQViYe0HoNaCg+1lNZalyQ=; b=Cv34Sb8d3L0aNZvk1Ktdgax2rV
	y2kr1p8iZtmFxslD/DqNUUjrH1PODEjT7Bb9dKNHNNRoLt7p4s/6+fcKwGds4o9VNcvfW/pO7AXD+
	qEgPrlAAC4LGF/j9kxF6s7K/OA+HXw3L2/ti/+H0MG02sirkZyMaHoLgiZf0Rk9KBBrQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187981-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 187981: regressions - trouble: broken/fail/pass
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-xl-raw:<job status>:broken:regression
    linux-linus:test-armhf-armhf-xl-raw:host-install(5):broken:regression
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=27cc6fdf720183dce1dbd293483ec5a9cb6b595e
X-Osstest-Versions-That:
    linux=0c559323bbaabee7346c12e74b497e283aaafef5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 06 Oct 2024 00:28:13 +0000

flight 187981 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187981/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl-raw         <job status>                 broken
 test-armhf-armhf-xl-raw       5 host-install(5)        broken REGR. vs. 187970
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 187970

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 187970
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 187970
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 187970
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 187970
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 187970
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 187970
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                27cc6fdf720183dce1dbd293483ec5a9cb6b595e
baseline version:
 linux                0c559323bbaabee7346c12e74b497e283aaafef5

Last test of basis   187970  2024-10-04 17:41:58 Z    1 days
Testing same since   187981  2024-10-05 10:56:41 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abdul Rahim <abdul.rahim@myyahoo.com>
  Abhishek Tamboli <abhishektamboli9@gmail.com>
  Ai Chao <aichao@kylinos.cn>
  Al Viro <viro@zeniv.linux.org.uk>
  Alessandro Zanni <alessandro.zanni87@gmail.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alex Hung <alex.hung@amd.com>
  Alexandre Belloni <alexandre.belloni@bootlin.com>
  Alexandre Ghiti <alexghiti@rivosinc.com>
  Alexey Klimov <alexey.klimov@linaro.org>
  Alison Schofield <alison.schofield@intel.com>
  Andrei Simion <andrei.simion@microchip.com>
  Ard Biesheuvel <ardb@kernel.org>
  Armin Wolf <W_Armin@gmx.de>
  Ashutosh Dixit <ashutosh.dixit@intel.com>
  Aurabindo Pillai <aurabindo.pillai@amd.com>
  Ba Jing <bajing@cmss.chinamobile.com>
  Baojun Xu <baojun.xu@ti.com>
  Bard Liao <yung-chuan.liao@linux.intel.com>
  Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Ben Hutchings <benh@debian.org>
  Benjamin Tissoires <bentiss@kernel.org>
  Boris Brezillon <boris.brezillon@collabora.com>
  Catalin Marinas <catalin.marinas@arm.com>
  Charlene Liu <Charlene.Liu@amd.com>
  Charles Han <hanchunchao@inspur.com>
  Charles Keepax <ckeepax@opensource.cirrus.com>
  Christian König <christian.koenig@amd.com>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Chun-Yi Lee <jlee@suse.com>
  Chun-Yi Lee <joeyli.kernel@gmail.com>
  Dan Carpenter <dan.carpenter@linaro.org>
  Daniel Wheeler <daniel.wheeler@amd.com>
  Danilo Krummrich <dakr@kernel.org>
  Dave Airlie <airlied@redhat.com>
  David Arendt <admin@prnet.org>
  David Lawrence Glanzman <davidglanzman@yahoo.com>
  David Sterba <dsterba@suse.com>
  Derek Foreman <derek.foreman@collabora.com>
  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Easwar Hariharan <eahariha@linux.microsoft.com>
  Eder Zulian <ezulian@redhat.com>
  Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
  Fangzhi Zuo <Jerry.Zuo@amd.com>
  Filipe Manana <fdmanana@suse.com>
  Gianfranco Trad <gianf.trad@gmail.com>
  Guenter Roeck <linux@roeck-us.net>
  Guixin Liu <kanie@linux.alibaba.com>
  Gustavo Sousa <gustavo.sousa@intel.com>
  Hans de Goede <hdegoede@redhat.com>
  Hans P. Moller <hmoller@uc.cl>
  He Lugang <helugang@uniontech.com>
  Heiko Stuebner <heiko@sntech.de>
  Hui Wang <hui.wang@canonical.com>
  Ilya Dryomov <idryomov@gmail.com>
  Imre Deak <imre.deak@intel.com>
  Jan Kara <jack@suse.cz>
  Jan Lalinsky <lalinsky@c4.cz>
  Jani Nikula <jani.nikula@intel.com>
  Janne Grunau <j@jannau.net>
  Jaroslav Kysela <perex@perex.cz>
  Jason A. Donenfeld <Jason@zx2c4.com>
  Javier Carrasco <javier.carrasco.cruz@gmail.com>
  Jens Axboe <axboe@kernel.dk>
  Johannes Thumshirn <johannes.thumshirn@wdc.com>
  John Stultz <jstultz@google.com>
  Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
  Josef Bacik <josef@toxicpanda.com>
  Joseph Jang <jjang@nvidia.com>
  José Roberto de Souza <jose.souza@intel.com>
  Julia Lawall <Julia.Lawall@inria.fr>
  Keerthy <j-keerthy@ti.com>
  Keith Busch <kbusch@kernel.org>
  Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Leo Li <sunpeng.li@amd.com>
  Leo Martins <loemra.dev@gmail.com>
  Lianqin Hu <hulianqin@vivo.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Liviu Dudau <liviu.dudau@arm.com>
  Lizhi Xu <lizhi.xu@windriver.com>
  Lucas De Marchi <lucas.demarchi@intel.com>
  Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
  Mark Brown <broonie@kernel.org>
  Mark Rutland <mark.rutland@arm.com>
  Masami Hiramatsu (Google) <mhiramat@kernel.org>
  Matt Roper <matthew.d.roper@intel.com>
  Matthew Auld <matthew.auld@intel.com>
  Matthew Brost <matthew.brost@intel.com>
  Maxime Ripard <mripard@kernel.org>
  Min-Hua Chen <minhuadotchen@gmail.com>
  Miquel Raynal <miquel.raynal@bootlin.com>
  Miquel Sabaté Solà <mikisabate@gmail.com>
  Nikolai Afanasenkov <nikolai.afanasenkov@hp.com>
  Nilay Shroff <nilay@linux.ibm.com>
  Oder Chiou <oder_chiou@realtek.com>
  Oldherl Oh <me@oldherl.one>
  Pali Rohár <pali@kernel.org>
  Palmer Dabbelt <palmer@rivosinc.com>
  Parth Pancholi <parth.pancholi@toradex.com>
  Patrick Donnelly <pdonnell@redhat.com>
  Paulo Alcantara (Red Hat) <pc@manguebit.com>
  Philipp Stanner <pstanner@redhat.com>
  Pu Lehui <pulehui@huawei.com>
  Qu Wenruo <wqu@suse.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
  Rob Clark <robdclark@chromium.org>
  Rob Herring (Arm) <robh@kernel.org>
  Rodrigo Vivi <rodrigo.vivi@intel.com>
  Sami Tolvanen <samitolvanen@google.com>
  Sebastian Andrzej Siewior <bigeasy@linutronix.de>
  Shen Lichuan <shenlichuan@vivo.com>
  Shengjiu Wang <shengjiu.wang@nxp.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
  Steve French <stfrench@microsoft.com>
  Steven Price <steven.price@arm.com>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Steven Rostedt <rostedt@goodmis.org>
  syzbot+7a4842f0b1801230a989@syzkaller.appspotmail.com
  syzbot+8901c4560b7ab5c2f9df@syzkaller.appspotmail.com
  Takashi Iwai <tiwai@suse.de>
  Tang Bin <tangbin@cmss.chinamobile.com>
  Thomas Gleixner <tglx@linutronix.de>
  Thomas Zimmermann <tzimmermann@suse.de>
  Thorsten Blum <thorsten.blum@toblux.com>
  Tom Chung <chiahsuan.chung@amd.com>
  Tomas Glozar <tglozar@redhat.com>
  Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
  Uladzislau Rezki (Sony) <urezki@gmail.com>
  Uwe Kleine-König <u.kleine-koenig@baylibre.com>
  Uwe Kleine-König <ukleinek@debian.org>
  Vignesh Raghavendra <vigneshr@ti.com>
  Vijendar Mukunda <Vijendar.Mukunda@amd.com>
  Viresh Kumar <viresh.kumar@linaro.org>
  Vlastimil Babka <vbabka@suse.cz>
  wangrong <wangrong@uniontech.com>
  Wei Li <liwei391@huawei.com>
  Wolfram Sang <wsa+renesas@sang-engineering.com>
  xiao sheng wen <atzlinux@sina.com>
  Yi Zhang <yi.zhang@redhat.com>
  Yifei Liu <yifei.l.liu@oracle.com>
  Yihan Zhu <Yihan.Zhu@amd.com>
  Yu Jiaoliang <yujiaoliang@vivo.com>
  Yun Lu <luyun@kylinos.cn>
  Zhanjun Dong <zhanjun.dong@intel.com>
  Zhao Mengmeng <zhaomengmeng@kylinos.cn>

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
 test-armhf-armhf-xl-raw                                      broken  
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

broken-job test-armhf-armhf-xl-raw broken
broken-step test-armhf-armhf-xl-raw host-install(5)

Not pushing.

(No revision log; it would be 4857 lines long.)

