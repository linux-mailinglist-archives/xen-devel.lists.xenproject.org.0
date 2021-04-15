Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1067036002E
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 04:56:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110897.211893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWsAD-0003jU-Ao; Thu, 15 Apr 2021 02:55:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110897.211893; Thu, 15 Apr 2021 02:55:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWsAD-0003ir-33; Thu, 15 Apr 2021 02:55:29 +0000
Received: by outflank-mailman (input) for mailman id 110897;
 Thu, 15 Apr 2021 02:55:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lWsAC-0003ij-66; Thu, 15 Apr 2021 02:55:28 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lWsAC-0005ac-04; Thu, 15 Apr 2021 02:55:28 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lWsAB-0002iS-Kl; Thu, 15 Apr 2021 02:55:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lWsAB-0006uR-KI; Thu, 15 Apr 2021 02:55:27 +0000
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
	bh=wHr+Si6qzHALXZkhPeiqjQF3g2FTtTrNbNiLHPq/A6k=; b=Qjc+M1ERhAWbwsa3c5B/tnP08J
	MZ3lbDxZTmbzOc/OcYODKQv+m9j9gXyeE9K4LTZ/1IBQBlolZ22yxbiWwFDptltZNW3aKaFoBVaaP
	mF5JuMPDKh0hZ170/s5qAPtL6vI0iHHozYq9UWQ4Z5oBR+h5tnavVqLikr+QLF+rzLNA=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161125-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 161125: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-5.4:test-armhf-armhf-xl-credit2:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=8f55ad4daf001b6ee8ddf672e14475a35403b258
X-Osstest-Versions-That:
    linux=a49e5ea5e0450a3feb1aaae2554dcbc3d20eee38
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 15 Apr 2021 02:55:27 +0000

flight 161125 linux-5.4 real [real]
flight 161154 linux-5.4 real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/161125/
http://logs.test-lab.xenproject.org/osstest/logs/161154/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-xl-credit2 18 guest-start/debian.repeat fail pass in 161154-retest

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 160939
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 160939
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 160939
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 160939
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 160939
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 160939
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 160939
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 160939
 test-armhf-armhf-xl-rtds     18 guest-start/debian.repeat    fail  like 160939
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 160939
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 160939
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 160939
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                8f55ad4daf001b6ee8ddf672e14475a35403b258
baseline version:
 linux                a49e5ea5e0450a3feb1aaae2554dcbc3d20eee38

Last test of basis   160939  2021-04-11 04:44:49 Z    3 days
Testing same since   161125  2021-04-14 07:10:15 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Adrian Hunter <adrian.hunter@intel.com>
  Ahmed S. Darwish <a.darwish@linutronix.de>
  Al Viro <viro@zeniv.linux.org.uk>
  Aleksandr Loktionov <aleksandr.loktionov@intel.com>
  Alexander Aring <aahringo@redhat.com>
  Alexander Gordeev <agordeev@linux.ibm.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Anirudh Rayabharam <mail@anirudhrb.com>
  Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Arnd Bergmann <arnd@arndb.de>
  Aya Levin <ayal@nvidia.com>
  Bart Van Assche <bvanassche@acm.org>
  Bastian Germann <bage@linutronix.de>
  Bean Huo <beanhuo@micron.com>
  Boris Ostrovsky <boris.ostrovsky@oracle.com>
  Borislav Petkov <bp@suse.de>
  Can Guo <cang@codeaurora.org>
  Charles Keepax <ckeepax@opensource.cirrus.com>
  Claudiu Beznea <claudiu.beznea@microchip.com>
  Claudiu Manoil <claudiu.manoil@nxp.com>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniel Jurgens <danielj@mellanox.com>
  Dave Switzer <david.switzer@intel.com>
  David S. Miller <davem@davemloft.net>
  Dawid Lukwinski <dawid.lukwinski@intel.com>
  Dinh Nguyen <dinguyen@kernel.org>
  Du Cheng <ducheng2@gmail.com>
  Eddie James <eajames@linux.ibm.com>
  Eric Dumazet <edumazet@google.com>
  Eryk Rybak <eryk.roch.rybak@intel.com>
  Eyal Birger <eyal.birger@gmail.com>
  Fabio Pricoco <fabio.pricoco@intel.com>
  Fabrice Gasnier <fabrice.gasnier@foss.st.com>
  Florian Fainelli <f.fainelli@gmail.com>
  Gao Xiang <hsiangkao@redhat.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Greentime Hu <green.hu@gmail.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Gregory CLEMENT <gregory.clement@bootlin.com>
  Grzegorz Szczurek <grzegorzx.szczurek@intel.com>
  Guangbin Huang <huangguangbin2@huawei.com>
  Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
  Guenter Roeck <linux@roeck-us.net>
  Haiyue Wang <haiyue.wang@intel.com>
  Hans de Goede <hdegoede@redhat.com>
  Hauke Mehrtens <hauke@hauke-m.de>
  Heiko Carstens <hca@linux.ibm.com>
  Helge Deller <deller@gmx.de>
  Huazhong Tan <tanhuazhong@huawei.com>
  Hulk Robot <hulkrobot@huawei.com>
  Ilya Leoshkevich <iii@linux.ibm.com>
  Ilya Maximets <i.maximets@ovn.org>
  Jacek Bułatek <jacekx.bulatek@intel.com>
  Jack Qiu <jack.qiu@huawei.com>
  Jason Gunthorpe <jgg@nvidia.com>
  Jason Self <jason@bluehome.net>
  Jason Wang <jasowang@redhat.com>
  Jiri Olsa <jolsa@redhat.com>
  Johannes Berg <johannes.berg@intel.com>
  John Fastabend <john.fastabend@gmail.com>
  Jon Hunter <jonathanh@nvidia.com>
  Jonas Holmberg <jonashg@axis.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Klaus Kudielka <klaus.kudielka@gmail.com>
  Konrad Jankowski <konrad0.jankowski@intel.com>
  Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
  Kumar Kartikeya Dwivedi <memxor@gmail.com>
  Kurt Kanzenbach <kurt@linutronix.de>
  Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
  Leon Romanovsky <leonro@nvidia.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Louis Peens <louis.peens@corigine.com>
  Luca Fancellu <luca.fancellu@arm.com>
  Lukasz Bartosik <lb@semihalf.com>
  Lv Yunlong <lyl2019@mail.ustc.edu.cn>
  Maciej Żenczykowski <maze@google.com>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Marek Behún <kabel@kernel.org>
  Mark Bloch <mbloch@nvidia.com>
  Mark Brown <broonie@kernel.org>
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Mateusz Palczewski <mateusz.palczewski@intel.com>
  Michael S. Tsirkin <mst@redhat.com>
  Mike Rapoport <rppt@linux.ibm.com>
  Milton Miller <miltonm@us.ibm.com>
  Muhammad Usama Anjum <musamaanjum@gmail.com>
  Nick Desaulniers <ndesaulniers@google.com>
  Nicolas Ferre <nicolas.ferre@microchip.com>
  Norman Maurer <norman_maurer@apple.com>
  Oliver Hartkopp <socketcan@hartkopp.net>
  Oliver Stäbler <oliver.staebler@bytesatwork.ch>
  Paolo Abeni <pabeni@redhat.com>
  Pavel Skripkin <paskripkin@gmail.com>
  Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
  Payal Kshirsagar <payalskshirsagar1234@gmail.com>
  Phillip Potter <phil@philpotter.co.uk>
  Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
  Potnuri Bharat Teja <bharat@chelsio.com>
  Prasad Sodagudi <psodagud@quicinc.com>
  Raed Salem <raeds@nvidia.com>
  Rafał Miłecki <rafal@milecki.pl>
  Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>
  Richard Weinberger <richard@nod.at>
  Rob Clark <robdclark@chromium.org>
  Rob Herring <robh@kernel.org>
  Robert Malz <robertx.malz@intel.com>
  Rodrigo Vivi <rodrigo.vivi@intel.com>
  Rui Salvaterra <rsalvaterra@gmail.com>
  Saeed Mahameed <saeedm@nvidia.com>
  Sasha Levin <sashal@kernel.org>
  Sergei Trofimovich <slyfox@gentoo.org>
  Shawn Guo <shawnguo@kernel.org>
  Shengjiu Wang <shengjiu.wang@nxp.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
  Simon Horman <simon.horman@netronome.com>
  Stefan Riedmueller <s.riedmueller@phytec.de>
  Stefan Schmidt <stefan@datenfreihafen.org>
  Steffen Klassert <steffen.klassert@secunet.com>
  Stephen Boyd <sboyd@kernel.org>
  Stephen Boyd <swboyd@chromium.org>
  Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
  Sudip Mukherjee <sudipm.mukherjee@gmail.com>
  Sven Eckelmann <sven@narfation.org>
  syzbot <syzbot+50ee810676e6a089487b@syzkaller.appspotmail.com>
  syzbot+c49fe6089f295a05e6f8@syzkaller.appspotmail.com
  Takashi Iwai <tiwai@suse.de>
  Tejun Heo <tj@kernel.org>
  Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
  Toke Høiland-Jørgensen <toke@redhat.com>
  Tom Lendacky <thomas.lendacky@amd.com>
  Tonghao Zhang <xiangxia.m.yue@gmail.com>
  Tony Brelinski <tonyx.brelinski@intel.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Venkat Gopalakrishnan <venkatg@codeaurora.org>
  Ville Syrjälä <ville.syrjala@linux.intel.com>
  Wengang Wang <wen.gang.wang@oracle.com>
  William Breathitt Gray <vilhelm.gray@gmail.com>
  William Roche <william.roche@oracle.com>
  Wolfram Sang <wsa+renesas@sang-engineering.com>
  Wolfram Sang <wsa@kernel.org>
  Xiaoming Ni <nixiaoming@huawei.com>
  Xin Long <lucien.xin@gmail.com>
  Yinjun Zhang <yinjun.zhang@corigine.com>
  Yuya Kusakabe <yuya.kusakabe@gmail.com>
  Zheng Yongjun <zhengyongjun3@huawei.com>
  Zqiang <qiang.zhang@windriver.com>

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
 test-armhf-armhf-xl-credit2                                  fail    
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
   a49e5ea5e045..8f55ad4daf00  8f55ad4daf001b6ee8ddf672e14475a35403b258 -> tested/linux-5.4

