Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AC08BBAC3
	for <lists+xen-devel@lfdr.de>; Sat,  4 May 2024 13:30:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716857.1119043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3DZE-0001AR-4K; Sat, 04 May 2024 11:28:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716857.1119043; Sat, 04 May 2024 11:28:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3DZD-00018f-VC; Sat, 04 May 2024 11:28:35 +0000
Received: by outflank-mailman (input) for mailman id 716857;
 Sat, 04 May 2024 11:28:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s3DZB-00018V-Uz; Sat, 04 May 2024 11:28:33 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s3DZB-0005Jg-MR; Sat, 04 May 2024 11:28:33 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s3DZB-0000Pe-9W; Sat, 04 May 2024 11:28:33 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1s3DZB-00014j-8R; Sat, 04 May 2024 11:28:33 +0000
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
	bh=FvqhBxE4tN1swcbsPzBJMhveWkJAW7ySJaiNJjaR7Vc=; b=q3A2QQvVgjPRNd3S2LvP2Uf5pv
	n4cEm2dkdZPK3ohodNzkPvYM34XrBSiutI5rXCexuu/FmvP+OOciahZhn6BvnzRrPgnWf+WPX3fZI
	iM0+713xbZwLtP2/2FVSeHle5xM9cM2m9KaAga5+aUz2eN/kONeIcdATitzATJ0FqYo8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185915-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 185915: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-xl:xen-boot:fail:heisenbug
    linux-linus:test-armhf-armhf-examine:reboot:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-rtds:xen-boot:fail:allowable
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:xen-boot:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=7367539ad4b0f8f9b396baf02110962333719a48
X-Osstest-Versions-That:
    linux=b947cc5bf6d793101135265352e205aeb30b54f0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 04 May 2024 11:28:33 +0000

flight 185915 linux-linus real [real]
flight 185918 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/185915/
http://logs.test-lab.xenproject.org/osstest/logs/185918/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-xl           8 xen-boot            fail pass in 185918-retest
 test-armhf-armhf-examine      8 reboot              fail pass in 185918-retest

Regressions which are regarded as allowable (not blocking):
 test-armhf-armhf-xl-rtds      8 xen-boot                 fail REGR. vs. 185870

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl         15 migrate-support-check fail in 185918 never pass
 test-armhf-armhf-xl     16 saverestore-support-check fail in 185918 never pass
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 185870
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 185870
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 185870
 test-armhf-armhf-libvirt      8 xen-boot                     fail  like 185870
 test-armhf-armhf-xl-arndale   8 xen-boot                     fail  like 185870
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 185870
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 185870
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                7367539ad4b0f8f9b396baf02110962333719a48
baseline version:
 linux                b947cc5bf6d793101135265352e205aeb30b54f0

Last test of basis   185870  2024-04-29 17:43:51 Z    4 days
Failing since        185888  2024-04-30 20:31:50 Z    3 days    8 attempts
Testing same since   185915  2024-05-04 01:14:15 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alex Deucher <alexander.deucher@amd.com>
  Alexander Gordeev <agordeev@linux.ibm.com>
  Alexander Potapenko <glider@google.com>
  Alexandra Winter <wintera@linux.ibm.com>
  Alexei Starovoitov <ast@kernel.org>
  Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
  Aman Dhoot <amandhoot12@gmail.com>
  Andrii Nakryiko <andrii@kernel.org>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Anton Protopopov <aspsk@isovalent.com>
  Ard Biesheuvel <ardb@kernel.org>
  Arnd Bergmann <arnd@arndb.de>
  Arvind Yadav <arvind.yadav@amd.com>
  Asbjørn Sloth Tønnesen <ast@fiberby.net>
  Audra Mitchell <audra@redhat.com>
  Aurabindo Pillai <aurabindo.pillai@amd.com>
  Barry Song <v-songbaohua@oppo.com>
  Billy Tsai <billy_tsai@aspeedtech.com>
  Björn Töpel <bjorn@kernel.org>
  Björn Töpel <bjorn@rivosinc.com>
  Bui Quang Minh <minhquangbui99@gmail.com>
  Cezary Rojewski <cezary.rojewski@intel.com>
  Chen Yu <yu.c.chen@intel.com>
  Chen-Yu Tsai <wenst@chromium.org>
  Christian König <christian.koenig@amd.com>
  Christoph Paasch <cpaasch@apple.com>
  Chuck Lever <chuck.lever@oracle.com>
  Claudio Imbrenda <imbrenda@linux.ibm.com>
  Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
  Dan Carpenter <dan.carpenter@linaro.org>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniel Wheeler <daniel.wheeler@amd.com>
  Dave Airlie <airlied@redhat.com>
  Dave Jiang <dave.jiang@intel.com>
  David Bauer <mail@david-bauer.net>
  David Howells <dhowells@redhat.com>
  David Lechner <dlechner@baylibre.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Derek Fang <derek.fang@realtek.com>
  Devyn Liu <liudingyuan@huawei.com>
  Dima Ruinskiy <dima.ruinskiy@intel.com>
  Dominique Martinet <dominique.martinet@atmark-techno.com>
  Donald Hunter <donald.hunter@gmail.com>
  Doug Berger <opendmb@gmail.com>
  end.to.start <end.to.start@mail.ru>
  Felix Fietkau <nbd@nbd.name>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Gabe Teeger <gabe.teeger@amd.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  George Shen <george.shen@amd.com>
  Guillaume Nault <gnault@redhat.com>
  Hannes Reinecke <hare@kernel.org>
  Hans de Goede <hdegoede@redhat.com>
  Harald Freudenberger <freude@linux.ibm.com>
  Harry Wentland <harry.wentland@amd.com>
  Heiko Carstens <hca@linux.ibm.com>
  Hersen Wu <hersenxs.wu@amd.com>
  Ian Forbes <ian.forbes@broadcom.com>
  Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
  Ilya Leoshkevich <iii@linux.ibm.com>
  Ivan Babrou <ivan@cloudflare.com>
  Jack Yu <jack.yu@realtek.com>
  Jakub Kicinski <kuba@kernel.org>
  James Chapman <jchapman@katalix.com>
  Jan Dakinevich <jan.dakinevich@salutedevices.com>
  Jani Nikula <jani.nikula@intel.com>
  Jason Xing <kernelxing@tencent.com>
  Jeffrey Altman <jaltman@auristor.com>
  Jens Axboe <axboe@kernel.dk>
  Jens Remus <jremus@linux.ibm.com>
  Jerome Brunet <jbrunet@baylibre.com>
  Jesper Dangaard Brouer <hawk@kernel.org>
  Jirong Feng <jirong.feng@easystack.cn>
  Joao Paulo Goncalves <joao.goncalves@toradex.com>
  John Garry <john.g.garry@oracle.com>
  Josef Bacik <josef@toxicpanda.com>
  Juergen Gross <jgross@suse.com>
  Kailang Yang <kailang@realtek.com>
  Keith Busch <kbusch@kernel.org>
  Kent Overstreet <kent.overstreet@linux.dev>
  Krzysztof Kozlowski <krzk@kernel.org>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Kuniyuki Iwashima <kuniyu@amazon.com>
  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Lai Jiangshan <jiangshan.ljs@antgroup.com>
  Lancelot SIX <lancelot.six@amd.com>
  Leo Ma <hanghong.ma@amd.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Lucas De Marchi <lucas.demarchi@intel.com>
  Lyude Paul <lyude@redhat.com>
  Mans Rullgard <mans@mansr.com>
  Marc Dionne <marc.dionne@auristor.com>
  Marek Behún <kabel@kernel.org>
  Mario Limonciello <mario.limonciello@amd.com>
  Mark Brown <broonie@kernel.org>
  Martin K. Petersen <martin.petersen@oracle.com>
  Martin KaFai Lau <martin.lau@kernel.org>
  Matt Coster <matt.coster@imgtec.com>
  Matthew Auld <matthew.auld@intel.com>
  Matthieu Baerts (NGI0) <matttbe@kernel.org>
  Matti Vaittinen <mazziesaccount@gmail.com>
  Maurizio Lombardi <mlombard@redhat.com>
  Mauro Carvalho Chehab <mchehab@kernel.org>
  Max Filippov <jcmvbkbc@gmail.com>
  Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>
  Mukul Joshi <mukul.joshi@amd.com>
  Neil Armstrong <neil.armstrong@linaro.org>
  Nikolay Aleksandrov <razor@blackwall.org>
  Nilay Shroff <nilay@linux.ibm.com>
  Olga Kornievskaia <kolga@netapp.com>
  Oliver Upton <oliver.upton@linux.dev>
  Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
  Paolo Abeni <pabeni@redhat.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Peter Ujfalusi <peter.ujfalusi@gmail.com>
  Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
  Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
  Puranjay Mohan <puranjay12@gmail.com>
  Puranjay Mohan <puranjay@kernel.org>
  Qu Wenruo <wqu@suse.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
  Richard Fitzgerald <rf@opensource.cirrus.com>
  Richard Gobert <richardbgobert@gmail.com>
  Robert Richter <rrichter@amd.com>
  Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
  Sagi Grimberg <sagi@grimberg.me>
  Sameer Pujar <spujar@nvidia.com>
  Sasha Neftin <sasha.neftin@intel.com>
  Sebastian Andrzej Siewior <bigeasy@linutronix.de>
  Sebastian Reichel <sebastian.reichel@collabora.com>
  Shashank Sharma <shashank.sharma@amd.com>
  Shigeru Yoshida <syoshida@redhat.com>
  Simon Trimmer <simont@opensource.cirrus.com>
  Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
  Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
  Stanislav Fomichev <sdf@google.com>
  Stefan Binding <sbinding@opensource.cirrus.com>
  Sung Joon Kim <sungjoon.kim@amd.com>
  Sven Schnelle <svens@linux.ibm.com>
  Swapnil Patel <swapnil.patel@amd.com>
  Takashi Iwai <tiwai@suse.de>
  Takashi Sakamoto <o-takashi@sakamocchi.jp>
  Tejun Heo <tj@kernel.org>
  Thanassis Avgerinos <thanassis.avgerinos@gmail.com>
  Thierry Reding <treding@nvidia.com>
  Thomas Gleixner <tglx@linutronix.de>
  Thomas Zimmermann <tzimmermann@suse.de>
  Thorsten Blum <thorsten.blum@toblux.com>
  Toke Høiland-Jørgensen <toke@redhat.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Trond Myklebust <trond.myklebust@hammerspace.com>
  Uday Shankar <ushankar@purestorage.com>
  Vitaly Lifshits <vitaly.lifshits@intel.com>
  Wayne Lin <wayne.lin@amd.com>
  Xin Long <lucien.xin@gmail.com>
  Xingyou Chen <rockrush@rockwork.org>
  Xu Kuohai <xukuohai@huawei.com>
  Yi Zhang <yi.zhang@redhat.com>
  Yunsheng Lin <linyunsheng@huawei.com>
  Zack Rusin <zack.rusin@broadcom.com>
  Zeng Heng <zengheng4@huawei.com>

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
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-armhf-armhf-xl-arndale                                  fail    
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
 test-armhf-armhf-xl-raw                                      pass    
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


Pushing revision :

hint: The 'hooks/update' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
hint: The 'hooks/post-receive' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
hint: The 'hooks/post-update' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
To xenbits.xen.org:/home/xen/git/linux-pvops.git
   b947cc5bf6d79..7367539ad4b0f  7367539ad4b0f8f9b396baf02110962333719a48 -> tested/linux-linus

