Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F68337F401
	for <lists+xen-devel@lfdr.de>; Thu, 13 May 2021 10:23:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126758.238187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lh6cf-0008QF-4R; Thu, 13 May 2021 08:23:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126758.238187; Thu, 13 May 2021 08:23:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lh6cf-0008NL-0P; Thu, 13 May 2021 08:23:09 +0000
Received: by outflank-mailman (input) for mailman id 126758;
 Thu, 13 May 2021 08:23:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lh6cd-0008N9-I8; Thu, 13 May 2021 08:23:07 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lh6cd-0005dQ-Bt; Thu, 13 May 2021 08:23:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lh6cd-00079g-0n; Thu, 13 May 2021 08:23:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lh6cd-00066z-0F; Thu, 13 May 2021 08:23:07 +0000
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
	bh=wP2oHVzakojn+QNCwk1KkBWAJl8fNGhvycmPsvmK/Ow=; b=t6mK18DXI2JV8oL4axnTeyX8PD
	oM2spQkQQbCe75oFunW5e/SNwsec7EUuEkrf/8QnDudAhJGWLcVTXKS9hhBg2wSIYPr3kcKkGhYQ1
	SCOVVRvI0+aCFChecIMemGCiXcK3bXqjAwTJABLusA/eLpGZBTU9S87aIHL5UTvuVFk0=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161918-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 161918: tolerable FAIL - PUSHED
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
    linux-5.4:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=16022114de9869743d6304290815cdb8a8c7deaa
X-Osstest-Versions-That:
    linux=b5dbcd05792a4bad2c9bb3c4658c854e72c444b7
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 13 May 2021 08:23:07 +0000

flight 161918 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/161918/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 161832
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 161832
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 161832
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 161832
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 161832
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 161832
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 161832
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 161832
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 161832
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 161832
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 161832
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 linux                16022114de9869743d6304290815cdb8a8c7deaa
baseline version:
 linux                b5dbcd05792a4bad2c9bb3c4658c854e72c444b7

Last test of basis   161832  2021-05-07 09:10:55 Z    5 days
Testing same since   161905  2021-05-11 12:11:22 Z    1 days    3 attempts

------------------------------------------------------------
People who touched revisions under test:
  Adrian Hunter <adrian.hunter@intel.com>
  Alan Stern <stern@rowland.harvard.edu>
  Alex Deucher <alexander.deucher@amd.com>
  Alexander Lobakin <alobakin@pm.me>
  Alexander Shishkin <alexander.shishkin@linux.intel.com>
  Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
  Anirudh Rayabharam <mail@anirudhrb.com>
  Anson Jacob <Anson.Jacob@amd.com>
  Ard Biesheuvel <ardb@kernel.org>
  Aric Cyr <aric.cyr@amd.com>
  Arnd Bergmann <arnd@arndb.de>
  Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
  Arun Easi <aeasi@marvell.com>
  Avri Altman <avri.altman@wdc.com>
  Bart Van Assche <bvanassche@acm.org>
  Benjamin Block <bblock@linux.ibm.com>
  Bill Wendling <morbo@google.com>
  Bindu Ramamurthy <bindu.r@amd.com>
  Bixuan Cui <cuibixuan@huawei.com>
  Borislav Petkov <bp@suse.de>
  Brendan Peter <bpeter@lytx.com>
  Catalin Marinas <catalin.marinas@arm.com>
  Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
  Chanwoo Choi <cw00.choi@samsung.com>
  Chao Yu <yuchao0@huawei.com>
  Charles Keepax <ckeepax@opensource.cirrus.com>
  Chen Jun <chenjun102@huawei.com>
  Christian Brauner <christian.brauner@ubuntu.com>
  Christian König <christian.koenig@amd.com>
  Christoph Hellwig <hch@lst.de>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Chunfeng Yun <chunfeng.yun@mediatek.com>
  Colin Ian King <colin.king@canonical.com>
  Daniel Niv <danielniv3@gmail.com>
  Daniel Vetter <daniel.vetter@ffwll.ch>
  Daniel Wheeler <daniel.wheeler@amd.com>
  dann frazier <dann.frazier@canonical.com>
  David Bauer <mail@david-bauer.net>
  David E. Box <david.e.box@linux.intel.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Davide Caratti <dcaratti@redhat.com>
  Dean Anderson <dean@sensoray.com>
  Dick Kennedy <dick.kennedy@broadcom.com>
  Dinghao Liu <dinghao.liu@zju.edu.cn>
  Dinh Nguyen <dinguyen@kernel.org>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Dmitry Vyukov <dvyukov@google.com>
  Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
  Don Brace <don.brace@microchip.com>
  dongjian <dongjian@yulong.com>
  DooHyun Hwang <dh0421.hwang@samsung.com>
  Eckhart Mohr <e.mohr@tuxedocomputers.com>
  Eelco Chaudron <echaudro@redhat.com>
  Eric Biggers <ebiggers@google.com>
  Eryk Brol <eryk.brol@amd.com>
  Ewan D. Milne <emilne@redhat.com>
  Felipe Balbi <balbi@kernel.org>
  Fengnan Chang <changfengnan@vivo.com>
  Filipe Manana <fdmanana@suse.com>
  Florian Fainelli <f.fainelli@gmail.com>
  Gao Xiang <hsiangkao@redhat.com>
  Gerd Hoffmann <kraxel@redhat.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Gregory CLEMENT <gregory.clement@bootlin.com>
  Guchun Chen <guchun.chen@amd.com>
  Guenter Roeck <linux@roeck-us.net>
  Guochun Mao <guochun.mao@mediatek.com>
  Hanjun Guo <guohanjun@huawei.com>
  Hans de Goede <hdegoede@redhat.com>
  Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Hansem Ro <hansemro@outlook.com>
  Harald Freudenberger <freude@linux.ibm.com>
  He Ying <heying24@huawei.com>
  Heiko Carstens <hca@linux.ibm.com>
  Heinz Mauelshagen <heinzm@redhat.com>
  Hemant Kumar <hemantk@codeaurora.org>
  Herbert Xu <herbert@gondor.apana.org.au>
  Hillf Danton <hdanton@sina.com>
  Hui Tang <tanghui20@huawei.com>
  Ido Schimmel <idosch@nvidia.com>
  Jaegeuk Kim <jaegeuk@kernel.org>
  Jakub Kicinski <kuba@kernel.org>
  James Morris <jamorris@linux.microsoft.com>
  James Smart <jsmart2021@gmail.com>
  Jan Kara <jack@suse.cz>
  Jared Baldridge <jrb@expunge.us>
  Jarkko Sakkinen <jarkko@kernel.org>
  Jason Self <jason@bluehome.net>
  Jeffrey Mitchell <jeffrey.mitchell@starlab.io>
  Jens Axboe <axboe@kernel.dk>
  Jens Wiklander <jens.wiklander@linaro.org>
  Jerome Forissier <jerome@forissier.org>
  Jessica Yu <jeyu@kernel.org>
  Joe Thornber <ejt@redhat.com>
  John Millikin <john@john-millikin.com>
  Jon Hunter <jonathanh@nvidia.com>
  Jonathan Kim <jonathan.kim@amd.com>
  Josef Bacik <josef@toxicpanda.com>
  Julian Braha <julianbraha@gmail.com>
  Justin Tee <justin.tee@broadcom.com>
  Kai Stuhlemmer (ebee Engineering) <kai.stuhlemmer@ebee.de>
  Kalle Valo <kvalo@codeaurora.org>
  karthik alapati <mail@karthek.com>
  Kevin Barnett <kevin.barnett@microchip.com>
  Konstantin Kharlamov <hi-angel@yandex.ru>
  Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  Lee Jones <lee.jones@linaro.org>
  Lingutla Chandrasekhar <clingutla@codeaurora.org>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  lizhe <lizhe67@huawei.com>
  Luis Henriques <lhenriques@suse.de>
  Luke D Jones <luke@ljones.dev>
  Luo Jiaxing <luojiaxing@huawei.com>
  Lv Yunlong <lyl2019@mail.ustc.edu.cn>
  Lyude Paul <lyude@redhat.com>
  Mahesh Salgaonkar <mahesh@linux.ibm.com>
  Marc Zyngier <maz@kernel.org>
  Marek Behún <kabel@kernel.org>
  Marek Vasut <marex@denx.de>
  Marijn Suijten <marijn.suijten@somainline.org>
  Mark Brown <broonie@kernel.org>
  Mark Langsdorf <mlangsdo@redhat.com>
  Mark Rutland <mark.rutland@arm.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Martin Wilck <mwilck@suse.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Mathias Nyman <mathias.nyman@linux.intel.com>
  Matthias Brugger <matthias.bgg@gmail.com>
  Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
  Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  Maximilian Luz <luzmaximilian@gmail.com>
  Melissa Wen <melissa.srw@gmail.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Mike Snitzer <snitzer@redhat.com>
  Miklos Szeredi <mszeredi@redhat.com>
  Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
  Ming-Hung Tsai <mtsai@redhat.com>
  Miquel Raynal <miquel.raynal@bootlin.com>
  Muhammad Usama Anjum <musamaanjum@gmail.com>
  Murthy Bhat <Murthy.Bhat@microchip.com>
  Nathan Chancellor <nathan@kernel.org>
  Nick Desaulniers <ndesaulniers@google.com>
  Nilesh Javali <njavali@marvell.com>
  Paul Aurich <paul@darkrain42.org>
  Paul Clements <paul.clements@us.sios.com>
  Pavel Machek <pavel@denx.de>
  Pavel Machek <pavel@ucw.cz>
  Pavel Skripkin <paskripkin@gmail.com>
  Pawel Laszczak <pawell@cadence.com>
  Peilin Ye <yepeilin.cs@gmail.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Phil Calvin <phil@philcalvin.com>
  Phillip Potter <phil@philpotter.co.uk>
  Pradeep P V K <pragalla@codeaurora.org>
  Qu Huang <jinsdb@126.com>
  Quinn Tran <qutran@marvell.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Ricardo Ribalda <ribalda@chromium.org>
  Richard Weinberger <richard@nod.at>
  Rob Clark <robdclark@chromium.org>
  Robin Murphy <robin.murphy@arm.com>
  Ruslan Bilovol <ruslan.bilovol@gmail.com>
  Russell King <rmk+kernel@armlinux.org.uk>
  Sakari Ailus <sakari.ailus@linux.intel.com>
  Sami Loone <sami@loone.fi>
  Sasha Levin <sashal@kernel.org>
  Saurav Kashyap <skashyap@marvell.com>
  Sean Christopherson <seanjc@google.com>
  Sean Young <sean@mess.org>
  Sebastian Reichel <sebastian.reichel@collabora.com>
  Sedat Dilek <sedat.dilek@gmail.com>
  Seunghui Lee <sh043.lee@samsung.com>
  shaoyunl <shaoyun.liu@amd.com>
  Shixin Liu <liushixin2@huawei.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Solomon Chiu <solomon.chiu@amd.com>
  Song Liu <song@kernel.org>
  Sreekanth Reddy <sreekanth.reddy@broadcom.com>
  Stefan Berger <stefanb@linux.ibm.com>
  Stephen Boyd <sboyd@kernel.org>
  Steve French <stfrench@microsoft.com>
  Steven Rostedt (VMware) <rostedt@goodmis.org>
  Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
  Takashi Iwai <tiwai@suse.de>
  Theodore Ts'o <tytso@mit.edu>
  Thinh Nguyen <Thinh.Nguyen@synopsys.com>
  Thomas Gleixner <tglx@linutronix.de>
  Thomas Zimmermann <tzimmermann@suse.de>
  Tian Tao <tiantao6@hisilicon.com>
  Timo Gurr <timo.gurr@gmail.com>
  Todd Brandt <todd.e.brandt@linux.intel.com>
  Tony Ambardar <Tony.Ambardar@gmail.com>
  Tony Lindgren <tony@atomide.com>
  Trond Myklebust <trond.myklebust@hammerspace.com>
  Tudor Ambarus <tudor.ambarus@microchip.com>
  Tyler Hicks <code@tyhicks.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Valentin Schneider <valentin.schneider@arm.com>
  Vasily Gorbik <gor@linux.ibm.com>
  Vinod Koul <vkoul@kernel.org>
  Vitaly Kuznetsov <vkuznets@redhat.com>
  Vivek Goyal <vgoyal@redhat.com>
  Wang Li <wangli74@huawei.com>
  Wei Yongjun <weiyongjun1@huawei.com>
  Werner Sembach <wse@tuxedocomputers.com>
  Wesley Cheng <wcheng@codeaurora.org>
  Will Deacon <will@kernel.org>
  Xingui Yang <yangxingui@huawei.com>
  Yang Yang <yang.yang29@zte.com.cn>
  Yang Yingliang <yangyingliang@huawei.com>
  Zhang Yi <yi.zhang@huawei.com>

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
   b5dbcd05792a..16022114de98  16022114de9869743d6304290815cdb8a8c7deaa -> tested/linux-5.4

