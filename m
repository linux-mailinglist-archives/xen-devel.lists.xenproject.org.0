Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7848B34F7F9
	for <lists+xen-devel@lfdr.de>; Wed, 31 Mar 2021 06:25:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103708.197823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRSPC-0008II-9h; Wed, 31 Mar 2021 04:24:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103708.197823; Wed, 31 Mar 2021 04:24:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRSPC-0008Ho-4J; Wed, 31 Mar 2021 04:24:34 +0000
Received: by outflank-mailman (input) for mailman id 103708;
 Wed, 31 Mar 2021 04:24:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lRSPA-0008Hg-IU; Wed, 31 Mar 2021 04:24:32 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lRSPA-0001qb-8s; Wed, 31 Mar 2021 04:24:32 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lRSP9-0008Is-VV; Wed, 31 Mar 2021 04:24:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lRSP9-0001AL-Ur; Wed, 31 Mar 2021 04:24:31 +0000
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
	bh=YR1ds5a616HF6GQXMwZZhFBazs1J4Ve7XGIiVzR7anM=; b=31eeYAqeZ6trNShNbp4LRjucQC
	mupDbdWE63K0mgstlaqbHJKO+C7tTG5/KRCuLIZi7WiAVU73YCRq4Rloj2dFVf8aa9lIr0vrnVFez
	Zp4V0nVGwqApAjLHMgEuxywqxgn2D4VafQq9c+iMCdHTXf4unM7IRrxKN48QBPFYAcAI=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-160557-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 160557: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=4e85f8a712cddf2ceeaac50a26b239fbbcb7091f
X-Osstest-Versions-That:
    linux=b90344f7d6000deba0709d75225f30cbf79ec2f0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 31 Mar 2021 04:24:31 +0000

flight 160557 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/160557/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 160387
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 160387
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 160387
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 160387
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 160387
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 160387
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 160387
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 160387
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 160387
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 160387
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 160387
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                4e85f8a712cddf2ceeaac50a26b239fbbcb7091f
baseline version:
 linux                b90344f7d6000deba0709d75225f30cbf79ec2f0

Last test of basis   160387  2021-03-24 10:40:15 Z    6 days
Testing same since   160557  2021-03-30 12:41:35 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Erhard F." <erhard_f@mailbox.org>
  Adrian Hunter <adrian.hunter@intel.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alexander Ovechkin <ovov@yandex-team.ru>
  Alexei Starovoitov <ast@kernel.org>
  Anatoly Pugachev <matorola@gmail.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andrey Konovalov <andreyknvl@google.com>
  Andrii Nakryiko <andrii@kernel.org>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Angelo Dureghello <angelo@kernel-space.org>
  Anna Schumaker <Anna.Schumaker@Netapp.com>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Aurelien Aptel <aaptel@suse.com>
  Aya Levin <ayal@nvidia.com>
  Bart Van Assche <bvanassche@acm.org>
  Benjamin Herrenschmidt <benh@kernel.crashing.org>
  Borislav Petkov <bp@suse.de>
  Chris Chiu <chris.chiu@canonical.com>
  Christian König <christian.koenig@amd.com>
  Christoph Hellwig <hch@lst.de>
  Claudiu Beznea <claudiu.beznea@microchip.com>
  Corentin Labbe <clabbe@baylibre.com>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniel Wagner <dwagner@suse.de>
  Daniel Wheeler <daniel.wheeler@amd.com>
  David Jeffery <djeffery@redhat.com>
  David S. Miller <davem@davemloft.net>
  Denis Efremov <efremov@linux.com>
  Dinghao Liu <dinghao.liu@zju.edu.cn>
  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Dmitry Monakhov <dmtrmonakhov@yandex-team.ru>
  Dvora Fuxbrumer <dvorax.fuxbrumer@linux.intel.com>
  Dylan Hung <dylan_hung@aspeedtech.com>
  Eric Dumazet <edumazet@google.com>
  Eryk Brol <eryk.brol@amd.com>
  Fabio Estevam <festevam@gmail.com>
  Feng Tang <feng.tang@intel.com>
  Florian Fainelli <f.fainelli@gmail.com>
  Florian Westphal <fw@strlen.de>
  Frank Sorenson <sorenson@redhat.com>
  Geetha sowjanya <gakula@marvell.com>
  Georgi Valkov <gvalkov@abv.bg>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Greg Ungerer <gerg@kernel.org>
  Grygorii Strashko <grygorii.strashko@ti.com>
  Guenter Roeck <linux@roeck-us.net>
  Hangbin Liu <liuhangbin@gmail.com>
  Hannes Reinecke <hare@suse.de>
  Hans de Goede <hdegoede@redhat.com>
  Hariprasad Kelam <hkelam@marvell.com>
  Hayes Wang <hayeswang@realtek.com>
  Heiko Thiery <heiko.thiery@gmail.com>
  Herbert Xu <herbert@gondor.apana.org.au>
  Horia Geantă <horia.geanta@nxp.com>
  Hulk Robot <hulkrobot@huawei.com>
  Ingo Molnar <mingo@kernel.org>
  Isaku Yamahata <isaku.yamahata@intel.com>
  J. Bruce Fields <bfields@redhat.com>
  Jakub Kicinski <kuba@kernel.org>
  Jan Beulich <jbeulich@suse.com>
  Jan Kara <jack@suse.cz>
  Jason Gunthorpe <jgg@nvidia.com>
  Jason Self <jason@bluehome.net>
  Jean-Philippe Brucker <jean-philippe@linaro.org>
  Jens Axboe <axboe@kernel.dk>
  JeongHyeon Lee <jhs2.lee@samsung.com>
  Jia-Ju Bai <baijiaju1990@gmail.com>
  Jimmy Assarsson <extja@kvaser.com>
  Joel Stanley <joel@jms.id.au>
  Johan Hovold <johan@kernel.org>
  Johannes Berg <johannes.berg@intel.com>
  Jon Hunter <jonathanh@nvidia.com>
  Juergen Gross <jgross@suse.com>
  Kumar Kartikeya Dwivedi <memxor@gmail.com>
  Li Yang <leoyang.li@nxp.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Louis Peens <louis.peens@corigine.com>
  Lukasz Luba <lukasz.luba@arm.com>
  Lv Yunlong <lyl2019@mail.ustc.edu.cn>
  Maciej Fijalkowski <maciej.fijalkowski@intel.com>
  Manish Rangankar <mrangankar@marvell.com>
  Maor Dickman <maord@nvidia.com>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Marc Zyngier <maz@kernel.org>
  Mark Brown <broonie@kernel.org>
  Mark Pearson <markpearson@lenovo.com>
  Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
  Markus Theil <markus.theil@tu-ilmenau.de>
  Martin K. Petersen <martin.petersen@oracle.com>
  Martin Willi <martin@strongswan.org>
  Mian Yousaf Kaukab <ykaukab@suse.de>
  Michael Braun <michael-dev@fami-braun.de>
  Michael Ellerman <mpe@ellerman.id.au>
  Mike Kravetz <mike.kravetz@oracle.com>
  Mike Snitzer <snitzer@redhat.com>
  Mikulas Patocka <mpatocka@redhat.com>
  Mimi Zohar <zohar@linux.ibm.com>
  Muhammad Husaini Zulkifli <muhammad.husaini.zulkifli@intel.com>
  Nathan Chancellor <nathan@kernel.org>
  Nick Desaulniers <ndesaulniers@google.com>
  Nicolas Ferre <nicolas.ferre@microchip.com>
  Nirmoy Das <nirmoy.das@amd.com>
  Oded Gabbay <ogabbay@kernel.org>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paul Cercueil <paul@crapouillou.net>
  Paulo Alcantara (SUSE) <pc@cjr.nz>
  Paulo Alcantara <pc@cjr.nz>
  Pavel Tatashin <pasha.tatashin@soleen.com>
  Peter Oberparleiter <oberpar@linux.ibm.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Peter Zijlstra <peterz@infradead.org>
  Philipp Leskovitz <philipp.leskovitz@secunet.com>
  Phillip Lougher <phillip@squashfs.org.uk>
  Potnuri Bharat Teja <bharat@chelsio.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Richard Cochran <richardcochran@gmail.com>
  Rob Clark <robdclark@chromium.org>
  Rob Gardner <rob.gardner@oracle.com>
  Roman Gushchin <guro@fb.com>
  Saeed Mahameed <saeedm@nvidia.com>
  Sascha Hauer <s.hauer@pengutronix.de>
  Sasha Levin <sashal@kernel.org>
  Sasha Neftin <sasha.neftin@intel.com>
  satya priya <skakit@codeaurora.org>
  Sean Nyekjaer <sean@geanix.com>
  Sergei Trofimovich <slyfox@gentoo.org>
  Shawn Guo <shawnguo@kernel.org>
  Shuah Khan <skhan@linuxfoundation.org>
  Simon Horman <simon.horman@netronome.com>
  Stephane Grosjean <s.grosjean@peak-system.com>
  Steve French <stfrench@microsoft.com>
  Sudeep Holla <sudeep.holla@arm.com>
  Sung Lee <sung.lee@amd.com>
  Sunil Kovvuri Goutham <sgoutham@marvell.com>
  Takashi Iwai <tiwai@suse.de>
  Theodore Ts'o <tytso@mit.edu>
  Thomas Gleixner <tglx@linutronix.de>
  Timo Rothenpieler <timo@rothenpieler.org>
  Toke Høiland-Jørgensen <toke@redhat.com>
  Tomer Tayar <ttayar@habana.ai>
  Tong Zhang <ztong0001@gmail.com>
  Tony Brelinski <tonyx.brelinski@intel.com>
  Tony Lindgren <tony@atomide.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Torin Cooper-Bennun <torin@maxiluxsystems.com>
  Toshiaki Makita <toshiaki.makita1@gmail.com>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Viresh Kumar <viresh.kumar@linaro.org>
  Vitaly Lifshits <vitaly.lifshits@intel.com>
  Wei Wang <weiwan@google.com>
  Will Deacon <will@kernel.org>
  William Tu <u9012063@gmail.com>
  Yang Li <yang.lee@linux.alibaba.com>
  Yonghong Song <yhs@fb.com>

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
 test-armhf-armhf-xl-rtds                                     pass    
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
   b90344f7d600..4e85f8a712cd  4e85f8a712cddf2ceeaac50a26b239fbbcb7091f -> tested/linux-5.4

