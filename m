Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2326939AAB6
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jun 2021 21:10:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136535.253096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1losiB-0003Pi-At; Thu, 03 Jun 2021 19:08:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136535.253096; Thu, 03 Jun 2021 19:08:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1losiB-0003Nk-78; Thu, 03 Jun 2021 19:08:59 +0000
Received: by outflank-mailman (input) for mailman id 136535;
 Thu, 03 Jun 2021 19:08:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1losi9-0003Na-FP; Thu, 03 Jun 2021 19:08:57 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1losi9-0004Kv-7C; Thu, 03 Jun 2021 19:08:57 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1losi8-0004R4-RT; Thu, 03 Jun 2021 19:08:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1losi8-0002Ek-Qt; Thu, 03 Jun 2021 19:08:56 +0000
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
	bh=Ob8dCytT9+ymlZx+30Oup4G11ASj0K8MDkiHj7R7pAU=; b=cO4Pbz2j2tTFrpvoJ6CPKJhKJ/
	afe9H4AjOl3/i5gvxKBqzMDHTB0khPHenaU2Qm2Cj+fKLRqwp6zhI1TZZy4Ff+bNA+5F09KZ266qb
	1DzQIdY+7NRd21aHb/ANeThRf6R8lTF16gfXDJZofZBUCnfm88ga75ZvImDKlKyVFrxc=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-162346-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 162346: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=70154d2f82a9058e8316b6e106071c72fcc58718
X-Osstest-Versions-That:
    linux=103f1dbea1ae44731edca02cd7fcfa4a33742cd2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 03 Jun 2021 19:08:56 +0000

flight 162346 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/162346/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 162247
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 162247
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 162247
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 162247
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 162247
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 162247
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 162247
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 162247
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 162247
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 162247
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 162247
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                70154d2f82a9058e8316b6e106071c72fcc58718
baseline version:
 linux                103f1dbea1ae44731edca02cd7fcfa4a33742cd2

Last test of basis   162247  2021-05-28 11:41:53 Z    6 days
Testing same since   162346  2021-06-03 07:12:37 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Adrian Hunter <adrian.hunter@intel.com>
  Alaa Emad <alaaemadhossney.ae@gmail.com>
  Alan Stern <stern@rowland.harvard.edu>
  Aleksander Jan Bajkowski <olek2@wp.pl>
  Alex Deucher <alexander.deucher@amd.com>
  Alexander Usyskin <alexander.usyskin@intel.com>
  Alexandru Ardelean <aardelean@deviqon.com>
  Andy Gospodarek <gospo@broadcom.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Anirudh Rayabharam <mail@anirudhrb.com>
  Anna Schumaker <Anna.Schumaker@Netapp.com>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Atul Gopinathan <atulgopinathan@gmail.com>
  Aurelien Aptel <aaptel@suse.com>
  Bartosz Golaszewski <bgolaszewski@baylibre.com>
  Boris Burkov <boris@bur.io>
  Catherine Sullivan <csully@google.com>
  Charles Keepax <ckeepax@opensource.cirrus.com>
  Chinmay Agarwal <chinagar@codeaurora.org>
  Chris Park <Chris.Park@amd.com>
  Christian Brauner <christian.brauner@ubuntu.com>
  Christian Gmeiner <christian.gmeiner@gmail.com>
  Christian KÃnig <christian.koenig@amd.com>
  Christian König <christian.koenig@amd.com>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Chunfeng Yun <chunfeng.yun@mediatek.com>
  Colin Ian King <colin.king@canonical.com>
  Cornelia Huck <cohuck@redhat.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniel Lezcano <daniel.lezcano@linaro.org>
  Daniel Wheeler <daniel.wheeler@amd.com>
  Daniele Palmas <dnlplm@gmail.com>
  David Awogbemila <awogbemila@google.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  DENG Qingfang <dqfext@gmail.com>
  Dima Chumak <dchumak@nvidia.com>
  Dominik Andreas Schorpp <dominik.a.schorpp@ids.de>
  Dominik Brodowski <linux@dominikbrodowski.net>
  Dongliang Mu <mudongliangabcd@gmail.com>
  Du Cheng <ducheng2@gmail.com>
  Edward Cree <ecree@solarflare.com>
  Eric Farman <farman@linux.ibm.com>
  Felipe Balbi <balbi@kernel.org>
  Felix Fietkau <nbd@nbd.name>
  Florian Fainelli <f.fainelli@gmail.com>
  Francesco Ruggeri <fruggeri@arista.com>
  Fugang Duan <fugang.duan@nxp.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Geoffrey D. Bennett <g@b4.vu>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Hans de Goede <hdegoede@redhat.com>
  Hoang Le <hoang.h.le@dektech.com.au>
  Huazhong Tan <tanhuazhong@huawei.com>
  Hui Wang <hui.wang@canonical.com>
  Hulk Robot <hulkrobot@huawei.com>、
  Jakub Kicinski <kuba@kernel.org>
  James Zhu <James.Zhu@amd.com>
  Jarkko Nikula <jarkko.nikula@linux.intel.com>
  Jason Self <jason@bluehome.net>
  Jean Delvare <jdelvare@suse.de>
  Jerry Hoemann <jerry.hoemann@hpe.com>
  Jesse Brandeburg <jesse.brandeburg@intel.com>
  Jim Ma <majinjing3@gmail.com>
  Jingwen Chen <Jingwen.Chen2@amd.com>
  Jiri Slaby <jirislaby@kernel.org>
  Joakim Zhang <qiangqing.zhang@nxp.com>
  Joerg Roedel <jroedel@suse.de>
  Johan Hovold <johan@kernel.org>
  Johannes Berg <johannes.berg@intel.com>
  Jon Maloy <jmaloy@redhat.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Josef Bacik <josef@toxicpanda.com>
  Jouni Malinen <jouni@codeaurora.org>
  Juergen Borleis <jbe@pengutronix.de>
  Juergen Gross <jgross@suse.com>
  Jussi Maki <joamaki@gmail.com>
  Kai-Heng Feng <kai.heng.feng@canonical.com>
  Kees Cook <keescook@chromium.org>
  kernel test robot <lkp@intel.com>
  Khalid Aziz <khalid@gonehiking.org>
  Konrad Jankowski <konrad0.jankowski@intel.com>
  Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
  Lang Yu <Lang.Yu@amd.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Lu Baolu <baolu.lu@linux.intel.com>
  Lucas Stankus <lucas.p.stankus@gmail.com>
  Lukas Wunner <lukas@wunner.de>
  Manuel Lauss <manuel.lauss@gmail.com>
  Marcel Holtmann <marcel@holtmann.org>
  Mark Brown <broonie@kernel.org>
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Mateusz Palczewski <mateusz.palczewski@intel.com>
  Mathias Nyman <mathias.nyman@linux.intel.com>
  Mathy Vanhoef <Mathy.Vanhoef@kuleuven.be>
  Matt Wang <wwentao@vmware.com>
  Matthew Rosato <mjrosato@linux.ibm.com>
  Michael Chan <michael.chan@broadcom.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael Grzeschik <m.grzeschik@pengutronix.de>
  Mika Westerberg <mika.westerberg@linux.intel.com>
  Mike Snitzer <snitzer@redhat.com>
  Mikulas Patocka <mpatocka@redhat.com>
  Neil Armstrong <narmstrong@baylibre.com>
  Ondrej Mosnacek <omosnace@redhat.com>
  Paolo Abeni <pabeni@redhat.com>
  Pavel Skripkin <paskripkin@gmail.com>
  Peter Zijlstra <peterz@infradead.org>
  Phillip Potter <phil@philpotter.co.uk>
  Piotr Skajewski <piotrx.skajewski@intel.com>
  Raju Rangoju <rajur@chelsio.com>
  Randy Dunlap <rdunlap@infradead.org>
  Randy Wright <rwright@hpe.com>
  Richard Fitzgerald <rf@opensource.cirrus.com>
  Rolf Eike Beer <eb@emlix.com>
  Rui Miguel Silva <rui.silva@linaro.org>
  Saeed Mahameed <saeedm@nvidia.com>
  Sargun Dhillon <sargun@sargun.me>
  Sasha Levin <sashal@kernel.org>
  Sean MacLennan <seanm@seanm.ca>
  Shuah Khan <skhan@linuxfoundation.org>
  Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
  Sinan Kaya <okaya@kernel.org>
  Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
  Sriram R <srirrama@codeaurora.org>
  Stafford Horne <shorne@gmail.com>
  Stefan Roese <sr@denx.de>
  Steve French <stfrench@microsoft.com>
  Stylon Wang <stylon.wang@amd.com>
  Taehee Yoo <ap420073@gmail.com>
  Takashi Iwai <tiwai@suse.de>
  Tao Liu <thomas.liu@ucloud.cn>
  Tariq Toukan <tariqt@nvidia.com>
  Teava Radu <rateava@gmail.com>
  Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
  Thinh Nguyen <Thinh.Nguyen@synopsys.com>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Tom Seewald <tseewald@gmail.com>
  Tomas Winkler <tomas.winkler@intel.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Trond Myklebust <trond.myklebust@hammerspace.com>
  Tung Nguyen <tung.q.nguyen@dektech.com.au>
  Tycho Andersen <tycho@tycho.pizza>
  Vinod Koul <vkoul@kernel.org>
  Vladimir Oltean <vladimir.oltean@nxp.com>
  Vladyslav Tarasiuk <vladyslavt@nvidia.com>
  Wen Gong <wgong@codeaurora.org>
  Willem de Bruijn <willemb@google.com>
  Willem de Brujin <willemb@google.com>
  Wolfram Sang <wsa@kernel.org>
  Xin Long <lucien.xin@gmail.com>
  xinhui pan <xinhui.pan@amd.com>
  Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  YueHaibing <yuehaibing@huawei.com>
  Yunsheng Lin <linyunsheng@huawei.com>
  Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
  Zhen Lei <thunder.leizhen@huawei.com>
  Zheyu Ma <zheyuma97@gmail.com>
  zhouchuangao <zhouchuangao@vivo.com>
  Zolton Jheng <s6668c2t@gmail.com>
  Zou Wei <zou_wei@huawei.com>
  Éric Piel <eric.piel@trempplin-utc.net>

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
   103f1dbea1ae..70154d2f82a9  70154d2f82a9058e8316b6e106071c72fcc58718 -> tested/linux-5.4

