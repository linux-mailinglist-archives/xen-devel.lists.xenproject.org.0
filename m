Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7128C6EC99B
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 11:58:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525262.816356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqsxN-0000lS-OO; Mon, 24 Apr 2023 09:58:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525262.816356; Mon, 24 Apr 2023 09:58:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqsxN-0000jc-JX; Mon, 24 Apr 2023 09:58:01 +0000
Received: by outflank-mailman (input) for mailman id 525262;
 Mon, 24 Apr 2023 09:57:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pqsxL-0000jS-E2; Mon, 24 Apr 2023 09:57:59 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pqsxL-0007DI-5s; Mon, 24 Apr 2023 09:57:59 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pqsxK-0000VL-FI; Mon, 24 Apr 2023 09:57:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pqsxK-0003BY-Ec; Mon, 24 Apr 2023 09:57:58 +0000
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
	bh=Oh3d51nRKtzkNhjxZTCl5EBI9ScQnvoGHx9aHyv7RoI=; b=N4RtyTY8KHQ5maJjN64mZyH+/A
	Ka/9aZFz486/9wuSqUXNz940EPTauluLNgvowxyKBMtcBdXyBbfkArLc4bofSEvom/s4k92RHy4j9
	ZOHGiGzxtWKpJtqabqgN/XGXUiK9G3V3cWLMiywRMURafmeJivqlpoDSs79j+XDdMk1Y=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180390-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 180390: regressions - trouble: broken/fail/pass
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-dom0pvh-xl-intel:<job status>:broken:regression
    linux-linus:test-amd64-amd64-dom0pvh-xl-intel:host-reuse/final:broken:regression
    linux-linus:test-amd64-amd64-freebsd11-amd64:guest-localmigrate/x10:fail:regression
    linux-linus:test-armhf-armhf-xl-credit1:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-xl:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-examine:reboot:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:xen-boot:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:xen-boot:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=457391b0380335d5e9a5babdec90ac53928b23b4
X-Osstest-Versions-That:
    linux=6c538e1adbfc696ac4747fb10d63e704344f763d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 24 Apr 2023 09:57:58 +0000

flight 180390 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180390/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-dom0pvh-xl-intel    <job status>                 broken
 test-amd64-amd64-dom0pvh-xl-intel 27 host-reuse/final  broken REGR. vs. 180278
 test-amd64-amd64-freebsd11-amd64 19 guest-localmigrate/x10 fail REGR. vs. 180278
 test-armhf-armhf-xl-credit1   8 xen-boot                 fail REGR. vs. 180278

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl           8 xen-boot                     fail  like 180278
 test-armhf-armhf-xl-vhd       8 xen-boot                     fail  like 180278
 test-armhf-armhf-libvirt-qcow2  8 xen-boot                    fail like 180278
 test-armhf-armhf-libvirt      8 xen-boot                     fail  like 180278
 test-armhf-armhf-xl-arndale   8 xen-boot                     fail  like 180278
 test-armhf-armhf-examine      8 reboot                       fail  like 180278
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 180278
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 180278
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 180278
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 180278
 test-armhf-armhf-xl-credit2   8 xen-boot                     fail  like 180278
 test-armhf-armhf-xl-rtds      8 xen-boot                     fail  like 180278
 test-armhf-armhf-xl-multivcpu  8 xen-boot                     fail like 180278
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 180278
 test-armhf-armhf-libvirt-raw  8 xen-boot                     fail  like 180278
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                457391b0380335d5e9a5babdec90ac53928b23b4
baseline version:
 linux                6c538e1adbfc696ac4747fb10d63e704344f763d

Last test of basis   180278  2023-04-16 19:41:46 Z    7 days
Failing since        180281  2023-04-17 06:24:36 Z    7 days   13 attempts
Testing same since   180390  2023-04-23 23:41:41 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abhinav Kumar <quic_abhinavk@quicinc.com>
  Alan Liu <HaoPing.Liu@amd.com>
  Aleksandr Loktionov <aleksandr.loktionov@intel.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alex Hung <alex.hung@amd.com>
  Alexander Aring <aahringo@redhat.com>
  Alexander Potapenko <glider@google.com>
  Alexander Stein <alexander.stein@ew.tq-group.com>
  Alexei Starovoitov <ast@kernel.org>
  Alexis Lothoré <alexis.lothore@bootlin.com>
  Andrea Righi <andrea.righi@canonical.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andrii Nakryiko <andrii@kernel.org>
  Andy Chi <andy.chi@canonical.com>
  Arnd Bergmann <arnd@arndb.de>
  Asahi Lina <lina@asahilina.net>
  Axel Lin <axel.lin@ingics.com>
  Baokun Li <libaokun1@huawei.com>
  Baoqi Zhang <zhangbaoqi@loongson.cn>
  Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Bhavya Kapoor <b-kapoor@ti.com>
  Bjorn Andersson <andersson@kernel.org>
  Bjorn Helgaas <bhelgaas@google.com>
  Boris Burkov <boris@bur.io>
  Borislav Petkov (AMD) <bp@alien8.de>
  Brian Masney <bmasney@redhat.com>
  Chancel Liu <chancel.liu@nxp.com>
  Chen Aotian <chenaotian2@163.com>
  Chong Qiao <qiaochong@loongson.cn>
  Chris Morgan <macromorgan@hotmail.com>
  Christoph Paasch <cpaasch@apple.com>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Chuck Lever <chuck.lever@oracle.com>
  Conor Dooley <conor.dooley@microchip.com>
  Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
  Dan Carpenter <dan.carpenter@linaro.org>
  Dan Carpenter <error27@gmail.com>
  Dan Johansen <strit@manjaro.org>
  Daniel Baluta <daniel.baluta@nxp.com>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniel Miess <Daniel.Miess@amd.com>
  Daniel Wheeler <daniel.wheeler@amd.com>
  Dave Airlie <airlied@redhat.com>
  David Gow <davidgow@google.com>
  David Hildenbrand <david@redhat.com>
  David Howells <dhowells@redhat.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Ding Hui <dinghui@sangfor.com.cn>
  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
  Donald Hunter <donald.hunter@gmail.com>
  Dragan Simic <dragan.simic@gmail.com>
  Duoming Zhou <duoming@zju.edu.cn>
  Ekaterina Orlova <vorobushek.ok@gmail.com>
  Enze Li <lienze@kylinos.cn>
  Fabio Estevam <festevam@denx.de>
  Florian Westphal <fw@strlen.de>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Gwangun Jung <exsociety@gmail.com>
  Heiko Stuebner <heiko@sntech.de>
  hrdl <git@hrdl.eu>
  Huacai Chen <chenhuacai@loongson.cn>
  Ido Schimmel <idosch@nvidia.com>
  Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
  Ilya Leoshkevich <iii@linux.ibm.com>
  Jacob Keller <jacob.e.keller@intel.com>
  Jakub Kicinski <kuba@kernel.org>
  Jamal Hadi Salim <jhs@mojatatu.com>
  Jamal Hadi Salim<jhs@mojatatu.com>
  Jani Nikula <jani.nikula@intel.com>
  Jaroslav Kysela <perex@perex.cz>
  Jason Wang <jasowang@redhat.com>
  Javier Martinez Canillas <javierm@redhat.com>
  Jay Vosburgh <jay.vosburgh@canonical.com>
  Jens Axboe <axboe@kernel.dk>
  Jens Wiklander <jens.wiklander@linaro.org>
  Jianqun Xu <jay.xu@rock-chips.com>
  Jiaxun Yang <jiaxun.yang@flygoat.com>
  Jingbo Xu <jefflexu@linux.alibaba.com>
  Johan Hovold <johan+linaro@kernel.org>
  John Ogness <john.ogness@linutronix.de>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Jonathan Toppins <jtoppins@redhat.com>
  JR Gonzalez <jrg@scientiam.org>
  Jules Maselbas <jmaselbas@kalray.eu>
  Kalesh AP <kalesh-anakkur.purayil@broadcom.com>
  Karol Herbst <kherbst@redhat.com>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Li Lanzhe <u202212060@hust.edu.cn>
  Liam R. Howlett <Liam.Howlett@oracle.com>
  Liang He <windhl@126.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Long Wang <long.wang@analog.com>
  Lorenzo Bianconi <lorenzo@kernel.org>
  Luben Tuikov <luben.tuikov@amd.com>
  Marc Gonzalez <mgonzalez@freebox.fr>
  Marc Zyngier <maz@kernel.org>
  Mark Brown <broonie@kernel.org>
  Mark Rutland <mark.rutland@arm.com>
  Martin Rodriguez Reboredo <yakoyoku@gmail.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Mat Martineau <martineau@kernel.org>
  Mateusz Palczewski <mateusz.palczewski@intel.com>
  Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
  Matthieu Baerts <matthieu.baerts@tessares.net>
  Mel Gorman <mgorman@suse.de>
  Mel Gorman <mgorman@techsingularity.net>
  Michael Chan <michael.chan@broadcom.com>
  Michael S. Tsirkin <mst@redhat.com>
  Michal Hocko <mhocko@suse.com>
  Michal Simek <michal.simek@amd.com>
  Miguel Ojeda <ojeda@kernel.org>
  Ming Lei <ming.lei@redhat.com>
  Mirsad Goran Todorovac <mirsad.todorovac@alu.unizg.hr>
  Naama Meir <naamax.meir@linux.intel.com>
  Naoya Horiguchi <naoya.horiguchi@nec.com>
  Neil Armstrong <neil.armstrong@linaro.org>
  Nikita Zhandarovich <n.zhandarovich@fintech.ru>
  Oliver Upton <oliver.upton@linux.dev>
  Ondrej Mosnacek <omosnace@redhat.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Abeni <pabeni@redhat.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Patrick Blass <patrickblass@mailbox.org>
  Paulo Alcantara (SUSE) <pc@manguebit.com>
  Paulo Alcantara <pc@manguebit.com>
  Pedro Tammela <pctammela@mojatatu.com>
  Peng Fan <peng.fan@nxp.com>
  Peng Zhang <zhangpeng.00@bytedance.com>
  Peter Geis <pgwipeout@gmail.com>
  Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
  Peter Xu <peterx@redhat.com>
  Petr Machata <petrm@nvidia.com>
  Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
  Pucha Himasekhar Reddy <himasekharx.reddy.pucha@intel.com> (A Contingent worker at Intel)
  Qi Zheng <zhengqi.arch@bytedance.com>
  Qing Zhang <zhangqing@loongson.cn>
  Qingqing Zhuo <qingqing.zhuo@amd.com>
  Ricardo Pardini <ricardo@pardini.net>
  Rob Herring <robh@kernel.org>
  Ryusuke Konishi <konishi.ryusuke@gmail.com>
  Sascha Hauer <s.hauer@pengutronix.de>
  Scott Mayhew <smayhew@redhat.com>
  Sebastian Basierski <sebastianx.basierski@intel.com>
  Sebastian Reichel <sebastian.reichel@collabora.com>
  Seiji Nishikawa <snishika@redhat.com>
  SeongJae Park <sj@kernel.org>
  Shakeel Butt <shakeelb@google.com>
  Shawn Guo <shawnguo@kernel.org>
  Shengjiu Wang <shengjiu.wang@gmail.com>
  Soumya Negi <soumya.negi97@gmail.com>
  Steev Klimaszewski <steev@kali.org> #Thinkpad X13s
  Steve Chou <steve_chou@pesi.com.tw>
  Steve French <stfrench@microsoft.com>
  Sudeep Holla <sudeep.holla@arm.com>
  syzbot+a7c1ec5b1d71ceaa5186@syzkaller.appspotmail.com
  Takashi Iwai <tiwai@suse.de>
  Tejun Heo <tj@kernel.org>
  Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
  Thomas Bamelis <thomas@bamelis.dev>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Thomas Gleixner <tglx@linutronix.de>
  Thomas Zimmermann <tzimmermann@suse.de>
  Tiezhu Yang <yangtiezhu@loongson.cn>
  Toke Høiland-Jørgensen <toke@toke.dk>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Vadim Fedorenko <vadfed@meta.com>
  Ville Syrjälä <ville.syrjala@linux.intel.com>
  Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
  Vitaly Kuznetsov <vkuznets@redhat.com>
  Vitaly Prosyak <vitaly.prosyak@amd.com>
  Vladimir Oltean <vladimir.oltean@nxp.com>
  Vlastimil Babka <vbabka@suse.cz>
  Will Deacon <will@kernel.org>
  William Breathitt Gray <william.gray@linaro.org>
  Willy Tarreau <w@1wt.eu>
  Woody Suwalski <terraluna977@gmail.com>
  Xu Yilun <yilun.xu@intel.com>
  Xuan Zhuo <xuanzhuo@linux.alibaba.com>

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
 test-amd64-amd64-freebsd11-amd64                             fail    
 test-amd64-amd64-freebsd12-amd64                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-armhf-armhf-xl-arndale                                  fail    
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  fail    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     fail    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            broken  
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     fail    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                fail    
 test-amd64-amd64-pair                                        pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-libvirt-qcow2                               pass    
 test-armhf-armhf-libvirt-qcow2                               fail    
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 fail    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      fail    


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

broken-job test-amd64-amd64-dom0pvh-xl-intel broken
broken-step test-amd64-amd64-dom0pvh-xl-intel host-reuse/final

Not pushing.

(No revision log; it would be 5589 lines long.)

