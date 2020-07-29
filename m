Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B4423270D
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jul 2020 23:41:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0tpG-0000vZ-RB; Wed, 29 Jul 2020 21:41:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ULCb=BI=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1k0tpF-0000uO-31
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2020 21:41:25 +0000
X-Inumbo-ID: 3b3bc1ca-d1e4-11ea-aa6a-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3b3bc1ca-d1e4-11ea-aa6a-12813bfff9fa;
 Wed, 29 Jul 2020 21:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=omM/sdu3h7QV8x0kp356c73359gekvO4brxKtU/myZQ=; b=kKCxXxDLPnvBHGRuIVLxebQhC
 QG3MBWtRRv3Jag+3mmQldk46s95hqijzX0sSTEBlAG2DO6SXluYpHn0Nk95Fsxpjb75aGanLBKG7+
 xDPcitTQzzuEMfcNtuiZs8uIGcqnzF4iGM1ihX2U7uay8Mr+K+qcHz6Lco5q4FVHr+HYQ=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k0tp5-0002v7-Vm; Wed, 29 Jul 2020 21:41:16 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k0tp5-000884-HI; Wed, 29 Jul 2020 21:41:15 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1k0tp5-0000EK-Gc; Wed, 29 Jul 2020 21:41:15 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152282-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 152282: tolerable FAIL - PUSHED
X-Osstest-Failures: linux-5.4:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
X-Osstest-Versions-This: linux=58a12e3368dbcadc57c6b3f5fcbecce757426f02
X-Osstest-Versions-That: linux=d811d29517d1ea05bc159579231652d3ca1c2a01
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 29 Jul 2020 21:41:15 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

flight 152282 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152282/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-rtds     16 guest-start/debian.repeat    fail  like 152137
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop              fail never pass
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop              fail never pass
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop             fail never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop             fail never pass
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop             fail never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop             fail never pass

version targeted for testing:
 linux                58a12e3368dbcadc57c6b3f5fcbecce757426f02
baseline version:
 linux                d811d29517d1ea05bc159579231652d3ca1c2a01

Last test of basis   152137  2020-07-23 06:56:52 Z    6 days
Testing same since   152282  2020-07-29 08:44:57 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Adrian Hunter <adrian.hunter@intel.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alexander Lobakin <alobakin@marvell.com>
  Andrew Morton <akpm@linux-foundation.org>
  André Almeida <andrealmeid@collabora.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Angelo Dureghello <angelo.dureghello@timesys.com>
  Anna Schumaker <Anna.Schumaker@Netapp.com>
  Arnd Bergmann <arnd@arndb.de>
  Aurabindo Pillai <aurabindo.pillai@amd.com>
  Ben Skeggs <bskeggs@redhat.com>
  Bjorn Andersson <bjorn.andersson@linaro.org>
  Bjorn Helgaas <bhelgaas@google.com>
  Boris Burkov <boris@bur.io>
  Caiyuan Xie <caiyuan.xie@cn.alps.com>
  Charan Teja Kalla <charante@codeaurora.org>
  Charles Keepax <ckeepax@opensource.cirrus.com>
  Chen-Yu Tsai <wens@csie.org>
  Christian Brauner <christian.brauner@ubuntu.com>
  Christian König <christian.koenig@amd.com>
  Christoph Hellwig <hch@lst.de>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Chu Lin <linchuyuan@google.com>
  Chunfeng Yun <chunfeng.yun@mediatek.com>
  Claire Chang <tientzu@chromium.org>
  Claudiu Manoil <claudiu.manoil@nxp.com>
  Cong Wang <xiyou.wangcong@gmail.com>
  Cristian Marussi <cristian.marussi@arm.com>
  Damien Le Moal <damien.lemoal@wdc.com>
  Dan Williams <dan.j.williams@intel.com>
  Daniel Vetter <daniel.vetter@ffwll.ch>
  Dave Anglin <dave.anglin@bell.net>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Derek Basehore <dbasehore@chromium.org>
  Dinghao Liu <dinghao.liu@zju.edu.cn>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Douglas Anderson <dianders@chromium.org>
  Eddie James <eajames@linux.ibm.com>
  Emil Renner Berthing <kernel@esmil.dk>
  Eric Biggers <ebiggers@google.com>
  Evgeny Novikov <novikov@ispras.ru>
  Fabio Estevam <festevam@gmail.com>
  Fangrui Song <maskray@google.com>
  Federico Ricchiuto <fed.ricchiuto@gmail.com>
  Felipe Balbi <balbi@kernel.org>
  Filipe Manana <fdmanana@suse.com>
  Forest Crossman <cyrozap@gmail.com>
  Gavin Shan <gshan@redhat.com>
  Geert Uytterhoeven <geert@linux-m68k.org>
  George Kennedy <george.kennedy@oracle.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  guodeqing <geffrey.guo@huawei.com>
  Hans de Goede <hdegoede@redhat.com>
  Heikki Krogerus <heikki.krogerus@linux.intel.com>
  Helge Deller <deller@gmx.de>
  Helmut Grohne <helmut.grohne@intenta.de>
  Huang Guobin <huangguobin4@huawei.com>
  Huazhong Tan <tanhuazhong@huawei.com>
  Hugh Dickins <hughd@google.com>
  Ian Abbott <abbotti@mev.co.uk>
  Igor Russkikh <irusskikh@marvell.com>
  Ilya Katsnelson <me@0upti.me>
  Ingo Molnar <mingo@kernel.org>
  J. Bruce Fields <bfields@redhat.com>
  Jack Xiao <Jack.Xiao@amd.com>
  Jacky Hu <hengqing.hu@gmail.com>
  Jakub Kicinski <kuba@kernel.org>
  Jason Gunthorpe <jgg@nvidia.com>
  Jerry (Fangzhi) Zuo <Jerry.Zuo@amd.com>
  Jing Xiangfeng <jingxiangfeng@huawei.com>
  Jiri Kosina <jkosina@suse.cz>
  Joel Stanley <joel@jms.id.au>
  Joerg Roedel <jroedel@suse.de>
  Johan Hovold <johan@kernel.org>
  Johannes Berg <johannes.berg@intel.com>
  Johannes Thumshirn <johannes.thumshirn@wdc.com>
  John David Anglin <dave.anglin@bell.net>
  Joonho Wohn <doomsheart@gmail.com>
  Julian Anastasov <ja@ssi.bg>
  Kai Vehmanen <kai.vehmanen@linux.intel.com>
  Kalle Valo <kvalo@codeaurora.org>
  Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
  leilk.liu <leilk.liu@mediatek.com>
  Leon Romanovsky <leonro@mellanox.com>
  Leonid Ravich <Leonid.Ravich@emc.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Liu Jian <liujian56@huawei.com>
  Luca Coelho <luciano.coelho@intel.com>
  Mans Rullgard <mans@mansr.com>
  Maor Gottlieb <maorg@mellanox.com>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Marc Zyngier <maz@kernel.org>
  Mark Brown <broonie@kernel.org>
  Mark O'Donovan <shiftee@posteo.net>
  Markus Theil <markus.theil@tu-ilmenau.de>
  Martin K. Petersen <martin.petersen@oracle.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Matthew Gerlach <matthew.gerlach@linux.intel.com>
  Matthew Howell <matthew.howell@sealevel.com>
  Max Filippov <jcmvbkbc@gmail.com>
  Maxime Ripard <maxime@cerno.tech>
  Merlijn Wajer <merlijn@wizzup.org>
  Michael Chan <michael.chan@broadcom.com>
  Michael Hennerich <michael.hennerich@analog.com>
  Michael J. Ruhl <michael.j.ruhl@intel.com>
  Michael S. Tsirkin <mst@redhat.com>
  Michal Kalderon <michal.kalderon@marvell.com>
  Mike Snitzer <snitzer@redhat.com>
  Miklos Szeredi <mszeredi@redhat.com>
  Mikulas Patocka <mpatocka redhat com>
  Mikulas Patocka <mpatocka@redhat.com>
  Moritz Fischer <mdf@kernel.org>
  Muchun Song <songmuchun@bytedance.com>
  Nathan Chancellor <natechancellor@gmail.com>
  Navid Emamdoost <navid.emamdoost@gmail.com>
  Nick Desaulniers <ndesaulniers@google.com>
  Oleg Nesterov <oleg@redhat.com>
  Olga Kornievskaia <kolga@netapp.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Palmer Dabbelt <palmerdabbelt@google.com>
  Pavel Shilovsky <pshilov@microsoft.com>
  Paweł Gronowski <me@woland.xyz>
  PeiSen Hou <pshou@realtek.com.tw>
  Peter Chen <peter.chen@nxp.com>
  Pi-Hsun Shih <pihsun@chromium.org>
  Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
  Qi Liu <liuqi115@huawei.com>
  Qiu Wenbo <qiuwenbo@phytium.com.cn>
  Qiujun Huang <hqjagain@gmail.com>
  Qu Wenruo <wqu@suse.com>
  Richard Cochran <richardcochran@gmail.com>
  Robbie Ko <robbieko@synology.com>
  Rodrigo Rivas Costa <rodrigorivascosta@gmail.com>
  Roman Gushchin <guro@fb.com>
  Ronnie Sahlberg <lsahlber@redhat.com>
  Rustam Kovhaev <rkovhaev@gmail.com>
  Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
  Sasha Levin <sashal@kernel.org>
  Serge Semin <Sergey.Semin@baikalelectronics.ru>
  Sergey Organov <sorganov@gmail.com>
  Shannon Nelson <snelson@pensando.io>
  Shawn Guo <shawnguo@kernel.org>
  Shik Chen <shik@chromium.org>
  Shuah Khan <skhan@linuxfoundation.org>
  Siarhei Vishniakou <svv@google.com>
  Sreekanth Reddy <sreekanth.reddy@broadcom.com>
  Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
  Stefan Schmidt <stefan@datenfreihafen.org>
  Stefano Garzarella <sgarzare@redhat.com>
  Steve French <stfrench@microsoft.com>
  Steve Schremmer <steve.schremmer@netapp.com>
  Sumit Semwal <sumit.semwal@linaro.org>
  Taehee Yoo <ap420073@gmail.com>
  Takashi Iwai <tiwai@suse.de>
  Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
  Thierry Reding <treding@nvidia.com>
  Thomas Gleixner <tglx@linutronix.de>
  Tim Harvey <tharvey@gateworks.com>
  Todd Kjos <tkjos@google.com>
  Tom Rix <trix@redhat.com>
  Tony Lindgren <tony@atomide.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Vasiliy Kupriakov <rublag-ns@yandex.ru>
  Vasundhara Volam <vasundhara-v.volam@broadcom.com>
  Viktor Jägersküpper <viktor_jaegerskuepper@freenet.de>
  Vinod Koul <vkoul@kernel.org>
  Vlastimil Babka <vbabka@suse.cz>
  Wang Hai <wanghai38@huawei.com>
  Will Deacon <will@kernel.org>
  Wolfram Sang <wsa+renesas@sang-engineering.com>
  Wolfram Sang <wsa@kernel.org>
  Wu Hao <hao.wu@intel.com>
  Xie He <xie.he.0141@gmail.com>
  Xu Yilun <yilun.xu@intel.com>
  Yang Shi <yang.shi@linux.alibaba.com>
  Yang Yingliang <yangyingliang@huawei.com>
  Yunsheng Lin <linyunsheng@huawei.com>
  Zhang Xiaoxu <zhangxiaoxu5@huawei.com>

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
   d811d29517d1..58a12e3368db  58a12e3368dbcadc57c6b3f5fcbecce757426f02 -> tested/linux-5.4

