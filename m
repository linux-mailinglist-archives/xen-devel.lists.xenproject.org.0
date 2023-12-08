Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F8480AF51
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 23:02:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650810.1016614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBivR-0008A7-SE; Fri, 08 Dec 2023 22:02:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650810.1016614; Fri, 08 Dec 2023 22:02:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBivR-00087p-Oj; Fri, 08 Dec 2023 22:02:25 +0000
Received: by outflank-mailman (input) for mailman id 650810;
 Fri, 08 Dec 2023 22:02:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rBivQ-00087f-C6; Fri, 08 Dec 2023 22:02:24 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rBivQ-0000mK-3X; Fri, 08 Dec 2023 22:02:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rBivP-0008SK-M2; Fri, 08 Dec 2023 22:02:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rBivP-000464-Le; Fri, 08 Dec 2023 22:02:23 +0000
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
	bh=VjjBFw5OWXpq1aFSVxO4COZDqXQxutdW+E5Ex1AVAeQ=; b=qEqRkFBh7m68+pBLt/MrBlKxqA
	/mcjCzGlYZJoGOEAbDROZWFJgTYQQRYMgB1yg/JgwXDbikFe3ZHH/Z+qrokBE7EClA7yl3MEmrT+A
	aBNAAAgRcKeSUEoK/dgvfV2vavAFNWq8uEf9NdrGeg/L5GjW4nG048ggkZ2dSay+C02E=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184035-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 184035: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-5.4:test-amd64-amd64-libvirt-vhd:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-credit1:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:guest-start:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=34244ed6219a9eab1ce2262dc3c2bf39a3789b8a
X-Osstest-Versions-That:
    linux=8e221b47173d59e1b2877f6d8dc91e8be2031746
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 08 Dec 2023 22:02:23 +0000

flight 184035 linux-5.4 real [real]
flight 184039 linux-5.4 real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/184035/
http://logs.test-lab.xenproject.org/osstest/logs/184039/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-libvirt-vhd 19 guest-start/debian.repeat fail pass in 184039-retest
 test-armhf-armhf-xl    18 guest-start/debian.repeat fail pass in 184039-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-credit1 18 guest-start/debian.repeat fail blocked in 183929
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 183907
 test-armhf-armhf-xl-rtds     18 guest-start/debian.repeat    fail  like 183907
 test-armhf-armhf-xl-multivcpu 14 guest-start                  fail like 183929
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 183929
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 183929
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 183929
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 183929
 test-armhf-armhf-xl-credit2  18 guest-start/debian.repeat    fail  like 183929
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 183929
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 183929
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 183929
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 183929
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 183929
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 183929
 test-armhf-armhf-xl-vhd      17 guest-start/debian.repeat    fail  like 183929
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 183929
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 linux                34244ed6219a9eab1ce2262dc3c2bf39a3789b8a
baseline version:
 linux                8e221b47173d59e1b2877f6d8dc91e8be2031746

Last test of basis   183929  2023-11-29 05:20:53 Z    9 days
Testing same since   184035  2023-12-08 08:13:05 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Rafael J. Wysocki" <rafael@kernel.org>
  Adrian Hunter <adrian.hunter@intel.com>
  Alexander Gordeev <agordeev@linux.ibm.com>
  Amir Goldstein <amir73il@gmail.com>
  Andrea della Porta <andrea.porta@suse.com>
  Andrew Halaney <ahalaney@redhat.com>
  Andrew Murray <andrew.murray@arm.com>
  Asuna Yang <SpriteOvO@gmail.com>
  Baokun Li <libaokun1@huawei.com>
  Bart Van Assche <bvanassche@acm.org>
  Benjamin Tissoires <benjamin.tissoires@redhat.com>
  Catalin Marinas <catalin.marinas@arm.com>
  Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
  Charles Yi <be286@163.com>
  Chen Ni <nichen@iscas.ac.cn>
  Christoph Hellwig <hch@lst.de>
  Christoph Niedermaier <cniedermaier@dh-electronics.com>
  Christopher Bednarz <christopher.n.bednarz@intel.com>
  Christopher Obbard <chris.obbard@collabora.com>
  Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
  Coly Li <colyli@suse.de>
  Damien Le Moal <dlemoal@kernel.org>
  David Howells <dhowells@redhat.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Dexuan Cui <decui@microsoft.com>
  Diederik de Haas <didi.debian@cknow.org>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Eric Snowberg <eric.snowberg@oracle.com>
  Filipe Manana <fdmanana@suse.com>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Furong Xu <0x1207@gmail.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Haiyang Zhang <haiyangz@microsoft.com>
  Hans de Goede <hdegoede@redhat.com>
  Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
  Heiko Carstens <hca@linux.ibm.com>
  Heiko Stuebner <heiko@sntech.de>
  Helge Deller <deller@gmx.de>
  Herb Wei <weihao.bj@ieisystem.com>
  Himanshu Madhani <hmadhani@marvell.com>
  Huacai Chen <chenhuacai@loongson.cn>
  Ivan Ivanov <ivan.ivanov@suse.com>
  Jakub Kicinski <kuba@kernel.org>
  Jan Höppner <hoeppner@linux.ibm.com>
  Jann Horn <jannh@google.com>
  Jean-Philippe Brucker <jean-philippe@linaro.org>
  Jens Axboe <axboe@kernel.dk>
  Jiri Kosina <jkosina@suse.cz>
  Johan Hovold <johan+linaro@kernel.org>
  Johan Hovold <johan@kernel.org>
  Jon Hunter <jonathanh@nvidia.com>
  Jonas Karlman <jonas@kwiboo.se>
  Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
  Juergen Gross <jgross@suse.com>
  Kailang Yang <kailang@realtek.com>
  Keith Busch <kbusch@kernel.org>
  Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
  Kornel Dulęba <korneld@chromium.org>
  Kunwu Chan <chentao@kylinos.cn>
  Lech Perczak <lech.perczak@gmail.com>
  Leon Romanovsky <leon@kernel.org>
  Linus Walleij <linus.walleij@linaro.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Long Li <longli@microsoft.com>
  Marek Vasut <marex@denx.de>
  Maria Yu <quic_aiquny@quicinc.com>
  Mark Rutland <mark.rutland@arm.com>
  Markus Weippert <markus@gekmihesg.de>
  Martin K. Petersen <martin.petersen@oracle.com>
  Max Nguyen <maxwell.nguyen@hp.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Mike Snitzer <snitzer@kernel.org>
  Miklos Szeredi <mszeredi@redhat.com>
  Mikulas Patocka <mpatocka@redhat.com>
  Mimi Zohar <zohar@linux.ibm.com>
  Miquel Raynal <miquel.raynal@bootlin.com>
  Nathan Chancellor <nathan@kernel.org>
  Nilesh Javali <njavali@marvell.com>
  Oliver Neukum <oneukum@suse.com>
  Paolo Abeni <pabeni@redhat.com>
  Puliang Lu <puliang.lu@fibocom.com>
  Qu Wenruo <wqu@suse.com>
  Quinn Tran <qutran@marvell.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Raju Rangoju <Raju.Rangoju@amd.com>
  Rand Deeb <rand.sec96@gmail.com>
  Raul E Rangel <rrangel@chromium.org>
  Ricardo Ribalda <ribalda@chromium.org>
  Samuel Holland <samuel.holland@sifive.com>
  Saravana Kannan <saravanak@google.com>
  Sasha Levin <sashal@kernel.org>
  Shiraz Saleem <shiraz.saleem@intel.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
  Stefan Haberland <sth@linux.ibm.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stefano Stabellini <stefano.stabellini@amd.com>
  Stephen Hemminger <stephen@networkplumber.org>
  Steve French <stfrench@microsoft.com>
  Sudeep Holla <sudeep.holla@arm.com>
  Takashi Iwai <tiwai@suse.de>
  Takashi Sakamoto <o-takashi@sakamocchi.jp>
  Theodore Ts'o <tytso@mit.edu>
  Thinh Nguyen <Thinh.Nguyen@synopsys.com>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Timothy Pearson <tpearson@raptorengineering.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Vasily Gorbik <gor@linux.ibm.com>
  Victor Fragoso <victorffs@hotmail.com>
  Vignesh Raghavendra <vigneshr@ti.com>
  Viresh Kumar <viresh.kumar@linaro.org>
  Will Deacon <will@kernel.org>
  Wu Bo <bo.wu@vivo.com>
  Yang Yingliang <yangyingliang@huawei.com>
  Yangyu Chen <cyy@cyyself.name>
  Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Zenghui Yu <yuzenghui@huawei.com>
  Zhang Yi <yi.zhang@huawei.com>
  Zheng Yongjun <zhengyongjun3@huawei.com>
  Zhengchao Shao <shaozhengchao@huawei.com>

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
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-i386-examine-uefi                                 pass    
 test-amd64-amd64-libvirt-vhd                                 fail    
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
   8e221b47173d..34244ed6219a  34244ed6219a9eab1ce2262dc3c2bf39a3789b8a -> tested/linux-5.4

