Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FADA91C9C5
	for <lists+xen-devel@lfdr.de>; Sat, 29 Jun 2024 02:30:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.750793.1158831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sNLxz-0002YO-06; Sat, 29 Jun 2024 00:29:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 750793.1158831; Sat, 29 Jun 2024 00:29:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sNLxy-0002Wt-Sx; Sat, 29 Jun 2024 00:29:22 +0000
Received: by outflank-mailman (input) for mailman id 750793;
 Sat, 29 Jun 2024 00:29:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sNLxx-0002Wj-3H; Sat, 29 Jun 2024 00:29:21 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sNLxw-0003vG-UJ; Sat, 29 Jun 2024 00:29:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sNLxw-0000h1-Gv; Sat, 29 Jun 2024 00:29:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sNLxw-0002OA-GS; Sat, 29 Jun 2024 00:29:20 +0000
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
	bh=eTA2eJdMoBtyi0ZQO91p5hONoMKLXABD++979VehYRs=; b=vhUYnB7KdPIT10EQe2RK+DXqDj
	OQHMobl9qxeKIBzAWshAAB0iet6inQeR0l9iAjtEZPpMOQFSxNSqCQt3Tu7GhlDQg6MCwf2Azl5M4
	5wsQwjn9QvkOs8f3DDljePvF01twZYhzw4AIQO6UKnVP3rWWBnPFnLr9VBlbLopIjxA0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186550-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 186550: regressions - trouble: broken/fail/pass
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-libvirt-vhd:<job status>:broken:regression
    linux-linus:test-armhf-armhf-libvirt-vhd:host-install(5):broken:regression
    linux-linus:test-armhf-armhf-xl-credit2:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-qemuu-freebsd11-amd64:guest-start/freebsd.repeat:fail:regression
    linux-linus:test-armhf-armhf-examine:reboot:fail:regression
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
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=5bbd9b249880dba032bffa002dd9cd12cd5af09c
X-Osstest-Versions-That:
    linux=24ca36a562d63f1bff04c3f11236f52969c67717
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 29 Jun 2024 00:29:20 +0000

flight 186550 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186550/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-libvirt-vhd    <job status>                 broken
 test-armhf-armhf-libvirt-vhd  5 host-install(5)        broken REGR. vs. 186528
 test-armhf-armhf-xl-credit2   8 xen-boot                 fail REGR. vs. 186528
 test-amd64-amd64-qemuu-freebsd11-amd64 21 guest-start/freebsd.repeat fail REGR. vs. 186528
 test-armhf-armhf-examine      8 reboot                   fail REGR. vs. 186528

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 186528
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 186528
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 186528
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 186528
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 186528
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 186528
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                5bbd9b249880dba032bffa002dd9cd12cd5af09c
baseline version:
 linux                24ca36a562d63f1bff04c3f11236f52969c67717

Last test of basis   186528  2024-06-26 22:42:23 Z    2 days
Failing since        186530  2024-06-27 08:02:12 Z    1 days    3 attempts
Testing same since   186550  2024-06-28 13:57:07 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aaron Rainbolt <arainbolt@kfocus.org>
  aigourensheng <shechenglong001@gmail.com>
  Aivaz Latypov <reichaivaz@gmail.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alex Hung <alex.hung@amd.com>
  Alexander Gordeev <agordeev@linux.ibm.com>
  Alexander Hölzl <alexander.hoelzl@gmx.net>
  Alexei Starovoitov <ast@kernel.org>
  Alibek Omarov <a1ba.omarov@gmail.com>
  Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
  Andi Shyti <andi.shyti@linux.intel.com>
  Andrei Simion <andrei.simion@microchip.com>
  Andrew Bresticker <abrestic@rivosinc.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andrey Konovalov <andreyknvl@gmail.com>
  Andrii Nakryiko <andrii@kernel.org>
  Arnd Bergmann <arnd@arndb.de>
  Arun Ramadoss <arun.ramadoss@microchip.com>
  Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
  Bard Liao <yung-chuan.liao@linux.intel.com>
  Barry Song <v-songbaohua@oppo.com>
  Bing-Jhong Billy Jheng <billy@starlabs.sg>
  Bjørn Mork <bjorn@mork.no>
  Charles Keepax <ckeepax@opensource.cirrus.com>
  Chen Ni <nichen@iscas.ac.cn>
  Chen-Yu Tsai <wenst@chromium.org>
  Christoph Hellwig <hch@lst.de>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniel Wheeler <daniel.wheeler@amd.com>
  Daniele Palmas <dnlplm@gmail.com>
  Daniil Dulov <d.dulov@aladdin.ru>
  Dave Airlie <airlied@redhat.com>
  David Hildenbrand <david@redhat.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Dirk Su <dirk.su@canonical.com>
  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # X13s
  Eduard Zingerman <eddyz87@gmail.com>
  Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
  Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
  Eric Dumazet <edumazet@google.com>
  Filipe Manana <fdmanana@suse.com>
  Frank Li <Frank.Li@nxp.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Guillaume Nault <gnault@redhat.com>
  Guo Ren <guoren@kernel.org>
  Halil Pasic <pasic@linux.ibm.com>
  Hangbin Liu <liuhangbin@gmail.com>
  Heiko Carstens <hca@linux.ibm.com>
  Heiko Carstens <hca@linux.ibm.com> # s390
  Helge Deller <deller@gmx.de>
  Herbert Xu <herbert@gondor.apana.org.au>
  Hsin-Te Yuan <yuanhsinte@chromium.org>
  Hugh Dickins <hughd@google.com>
  Ido Schimmel <idosch@nvidia.com>
  Ilya Maximets <i.maximets@ovn.org>
  Jack Yu <jack.yu@realtek.com>
  Jai Luthra <j-luthra@ti.com>
  Jakub Kicinski <kuba@kernel.org>
  Jan Kara <jack@suse.cz>
  Jan Sokolowski <jan.sokolowski@intel.com>
  Jani Nikula <jani.nikula@intel.com>
  Jann Horn <jannh@google.com>
  Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
  Jarkko Sakkinen <jarkko@kernel.org>
  Jeff Johnson <quic_jjohnson@quicinc.com>
  Jeff Xu <jeffxu@chromium.org>
  Jens Axboe <axboe@kernel.dk>
  Jens Glathe <jens.glathe@oldschoolsolutions.biz>
  Jens Remus <jremus@linux.ibm.com>
  Jesper Dangaard Brouer <hawk@kernel.org>
  Jianguo Wu <wujianguo@chinatelecom.cn>
  Johan Hovold <johan+linaro@kernel.org>
  John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
  Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
  Julia Zhang <Julia.Zhang@amd.com>
  Karen Ostrowska <karen.ostrowska@intel.com>
  Kory Maincent <kory.maincent@bootlin.com>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  Kuniyuki Iwashima <kuniyu@amazon.com>
  Li Ma <li.ma@amd.com>
  Lijo Lazar <lijo.lazar@amd.com>
  Linus Lüssing <linus.luessing@c0d3.blue>
  Linus Torvalds <torvalds@linux-foundation.org>
  Liu Ying <victor.liu@nxp.com>
  luoxuanqiang <luoxuanqiang@kylinos.cn>
  Lyude Paul <lyude@redhat.com>
  Ma Ke <make24@iscas.ac.cn>
  Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
  Maciej Strozek <mstrozek@opensource.cirrus.com>
  Maksym Yaremchuk <maksymy@nvidia.com>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Marco Elver <elver@google.com>
  Mark Brown <broonie@kernel.org>
  Matt Bobrowski <mattbobrowski@google.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael Strauss <michael.strauss@amd.com>
  Naohiro Aota <naohiro.aota@wdc.com>
  Neal Cardwell <ncardwell@google.com>
  Neil Armstrong <neil.armstrong@linaro.org>
  Nick Child <nnac123@linux.ibm.com>
  Niklas Schnelle <schnelle@linux.ibm.com>
  Oleksij Rempel <o.rempel@pengutronix.de>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Abeni <pabeni@redhat.com>
  Pengfei Xu <pengfei.xu@intel.com>
  Peter Ujfalusi <peter.ujfalusi@gmail.com>
  Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
  Petr Machata <petrm@nvidia.com>
  Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
  Primoz Fiser <primoz.fiser@norik.com>
  Pucha Himasekhar Reddy <himasekharx.reddy.pucha@intel.com> (A Contingent worker at Intel)
  Qu Wenruo <wqu@suse.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Ratheesh Kannoth <rkannoth@marvell.com>
  Richard Fitzgerald <rf@opensource.cirrus.com>
  Shannon Nelson <shannon.nelson@amd.com>
  Shengjiu Wang <shengjiu.wang@nxp.com>
  Shigeru Yoshida <syoshida@redhat.com>
  Shuming Fan <shumingf@realtek.com>
  Simon Wunderlich <sw@simonwunderlich.de>
  Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
  Steev Klimaszewski <steev@kali.org>
  Stephen Brennan <stephen.s.brennan@oracle.com>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Suman Ghosh <sumang@marvell.com>
  Sumanth Korikkar <sumanthk@linux.ibm.com>
  Suren Baghdasaryan <surenb@google.com>
  Sven Eckelmann <sven@narfation.org>
  Taehee Yoo <ap420073@gmail.com>
  Takashi Iwai <tiwai@suse.de>
  Thomas GENTY <tomlohave@gmail.com>
  Thomas Huth <thuth@redhat.com>
  Thomas Zimmermann <tzimmermann@suse.de>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Tristram Ha <tristram.ha@microchip.com>
  Vasily Gorbik <gor@linux.ibm.com>
  Vijendar Mukunda <Vijendar.Mukunda@amd.com>
  Vitor Soares <vitor.soares@toradex.com>
  Vlastimil Babka <vbabka@suse.cz>
  Vyacheslav Frantsishko <itmymaill@gmail.com>
  Xin Long <lucien.xin@gmail.com>
  Xin Zeng <xin.zeng@intel.com>
  yangge <yangge1116@126.com>
  Yeoreum Yun <yeoreum.yun@arm.com>
  Yonghong Song <yonghong.song@linux.dev>
  Yunseong Kim <yskelg@gmail.com>
  Zhang Yi <zhangyi@everest-semi.com>
  Zhaoyang Huang <zhaoyang.huang@unisoc.com>
  Zi Yan <ziy@nvidia.com>

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
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  fail    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     fail    
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
 test-armhf-armhf-libvirt-vhd                                 broken  
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

broken-job test-armhf-armhf-libvirt-vhd broken
broken-step test-armhf-armhf-libvirt-vhd host-install(5)

Not pushing.

(No revision log; it would be 5945 lines long.)

