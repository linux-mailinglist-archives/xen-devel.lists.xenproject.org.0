Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B0F7FCE2D
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 06:16:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643683.1004092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8CvY-0004vO-Rg; Wed, 29 Nov 2023 05:16:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643683.1004092; Wed, 29 Nov 2023 05:16:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8CvY-0004tk-P1; Wed, 29 Nov 2023 05:16:00 +0000
Received: by outflank-mailman (input) for mailman id 643683;
 Wed, 29 Nov 2023 05:15:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r8CvX-0004ta-8Y; Wed, 29 Nov 2023 05:15:59 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r8CvW-0001WR-Ud; Wed, 29 Nov 2023 05:15:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r8CvW-0001AA-Jy; Wed, 29 Nov 2023 05:15:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1r8CvW-0005xf-JR; Wed, 29 Nov 2023 05:15:58 +0000
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
	bh=zl7Uvn5b1XIUrrRAR/SKSTU5TPZ4t7o37arR+5rYGSM=; b=zX4uXPsw2Ronv/63jDOJOtOvE5
	8Xa9eUCnbecXkFnK9wDy1uUf7B2Brvx/J0BdZ02y+F9WCs/JfbESHQpaQVZQtcWDXpBHTRxTwQHAT
	HwNV8laLtH+hFdKZjs8xrZ+p/phfrU7x0jBvvhDQA0qAusdkZXuJASLeU7/OIg3Kp1vk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183907-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 183907: regressions - FAIL
X-Osstest-Failures:
    linux-5.4:test-arm64-arm64-libvirt-raw:guest-start.2:fail:regression
    linux-5.4:test-armhf-armhf-libvirt-qcow2:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:allowable
    linux-5.4:test-arm64-arm64-libvirt-raw:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:guest-start:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=8e221b47173d59e1b2877f6d8dc91e8be2031746
X-Osstest-Versions-That:
    linux=ef379773e2e76d6470a907ae36c3d12f65a6ecdb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 29 Nov 2023 05:15:58 +0000

flight 183907 linux-5.4 real [real]
flight 183924 linux-5.4 real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/183907/
http://logs.test-lab.xenproject.org/osstest/logs/183924/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-arm64-arm64-libvirt-raw 18 guest-start.2            fail REGR. vs. 183803

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-libvirt-qcow2 17 guest-start/debian.repeat fail pass in 183924-retest

Regressions which are regarded as allowable (not blocking):
 test-armhf-armhf-xl-rtds    18 guest-start/debian.repeat fail REGR. vs. 183803

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-libvirt-raw 17 guest-start/debian.repeat fail in 183924 like 183797
 test-armhf-armhf-xl-credit1  14 guest-start                  fail  like 183797
 test-armhf-armhf-xl-multivcpu 18 guest-start/debian.repeat    fail like 183797
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 183803
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 183803
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 183803
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 183803
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 183803
 test-armhf-armhf-xl-credit2  18 guest-start/debian.repeat    fail  like 183803
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 183803
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 183803
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 183803
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 183803
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 183803
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 183803
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 183803
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                8e221b47173d59e1b2877f6d8dc91e8be2031746
baseline version:
 linux                ef379773e2e76d6470a907ae36c3d12f65a6ecdb

Last test of basis   183803  2023-11-20 21:13:23 Z    8 days
Testing same since   183907  2023-11-28 17:13:07 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alain Michaud <alainm@chromium.org>
  Alain Volmat <alain.volmat@foss.st.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alexander Sverdlin <alexander.sverdlin@siemens.com>
  Alexandre Belloni <alexandre.belloni@bootlin.com>
  Alexei Starovoitov <ast@kernel.org>
  Amelie Delaunay <amelie.delaunay@foss.st.com>
  Anastasia Belova <abelova@astralinux.ru>
  Andi Shyti <andi.shyti@kernel.org>
  Andreas Gruenbacher <agruenba@redhat.com>
  Andrew Morton <akpm@linux-foundation.org>
  Arnd Bergmann <arnd@arndb.de>
  Artem Lukyanov <dukzcry@ya.ru>
  Axel Lin <axel.lin@ingics.com>
  baozhu.liu <lucas.liu@siengine.com>
  Baruch Siach <baruch@tkos.co.il>
  Beau Belgrave <beaub@linux.microsoft.com>
  Benjamin Bara <benjamin.bara@skidata.com>
  Bjorn Andersson <andersson@kernel.org>
  Bjorn Helgaas <bhelgaas@google.com>
  Bob Peterson <rpeterso@redhat.com>
  Boris Brezillon <boris.brezillon@free-electrons.com>
  Brian Geffon <bgeffon@google.com>
  Cezary Rojewski <cezary.rojewski@intel.com>
  Chandradeep Dey <codesigning@chandradeepdey.com>
  Chandrakanth patil <chandrakanth.patil@broadcom.com>
  Christian König <christian.koenig@amd.com>
  Chuck Lever <chuck.lever@oracle.com>
  Colin Ian King <colin.king@canonical.com>
  Dan Carpenter <dan.carpenter@linaro.org>
  Daniel Lezcano <daniel.lezcano@linaro.org>
  Daniel Thompson <daniel.thompson@linaro.org>
  Daniel Wheeler <daniel.wheeler@amd.com>
  Dave Kleikamp <dave.kleikamp@oracle.com>
  David Hildenbrand <david@redhat.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  David Woodhouse <dwmw@amazon.co.uk>
  Dmitry Antipov <dmantipov@yandex.ru>
  Douglas Anderson <dianders@chromium.org>
  Dust Li <dust.li@linux.alibaba.com>
  Eduard Zingerman <eddyz87@gmail.com>
  Ekaterina Esina <eesina@astralinux.ru>
  Eric Biggers <ebiggers@google.com>
  Eric Dumazet <edumazet@google.com>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Florian Westphal <fw@strlen.de>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Gregory Greenman <gregory.greenman@intel.com>
  Guan Wentao <guanwentao@uniontech.com>
  Guenter Roeck <linux@roeck-us.net>
  Guo Zihua <guozihua@huawei.com>
  Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Hardik Gajjar <hgajjar@de.adit-jv.com>
  Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
  Heiner Kallweit <hkallweit1@gmail.com>
  Helge Deller <deller@gmx.de>
  Herbert Xu <herbert@gondor.apana.org.au>
  Hersen Wu <hersenxs.wu@amd.com>
  Herve Codina <herve.codina@bootlin.com>
  Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
  Ingo Molnar <mingo@kernel.org>
  Jacky Bai <ping.bai@nxp.com>
  Jakub Kicinski <kuba@kernel.org>
  Jan Kara <jack@suse.cz>
  Jay Vosburgh <jay.vosburgh@canonical.com>
  Jeff Johnson <quic_jjohnson@quicinc.com>
  Jeff Layton <jlayton@kernel.org>
  Jijie Shao <shaojijie@huawei.com>
  Jiri Kosina <jkosina@suse.cz>
  Johannes Berg <johannes.berg@intel.com>
  John Stultz <jstultz@google.com>
  Johnathan Mantey <johnathanx.mantey@intel.com>
  Jon Hunter <jonathanh@nvidia.com>
  Jorge Sanjuan Garcia <jorge.sanjuangarcia@duagon.com>
  Jose Abreu <Jose.Abreu@synopsys.com>
  Josef Bacik <josef@toxicpanda.com>
  Joseph Hwang <josephsih@chromium.org>
  Joshua Yeong <joshua.yeong@starfivetech.com>
  Juergen Gross <jgross@suse.com>
  Juntong Deng <juntong.deng@outlook.com>
  Kalle Valo <quic_kvalo@quicinc.com>
  Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
  Kees Cook <keescook@chromium.org>
  Kemeng Shi <shikemeng@huaweicloud.com>
  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Larry Finger <Larry.Finger@lwfinger.net>
  Lee Jones <lee@kernel.org>
  Leon Romanovsky <leon@kernel.org>
  Leon Romanovsky <leonro@nvidia.com>
  Linkui Xiao <xiaolinkui@kylinos.cn>
  Linus Walleij <linus.walleij@linaro.org>
  Liviu Dudau <liviu.dudau@arm.com>
  Lu Jialin <lujialin4@huawei.com>
  Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Lukas Wunner <lukas@wunner.de>
  Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
  Mahmoud Adam <mngyadam@amazon.com>
  Manas Ghandat <ghandatmanas@gmail.com>
  Marcel Holtmann <marcel@holtmann.org>
  Mario Casquero <mcasquer@redhat.com>
  Mario Limonciello <mario.limonciello@amd.com>
  Mark Brown <broonie@kernel.org>
  Martin K. Petersen <martin.petersen@oracle.com>
  Masum Reza <masumrezarock100@gmail.com>
  Max Kellermann <max.kellermann@ionos.com>
  Meng Tang <tangmeng@uniontech.com>
  menghui.huang <menghui.huang@siengine.com>
  Michal Hocko <mhocko@suse.com>
  Mike Rapoport (IBM) <rppt@kernel.org>
  Miri Korenblit <miriam.rachel.korenblit@intel.com>
  Neil Armstrong <narmstrong@baylibre.com>
  Nicolas Saenz Julienne <nsaenz@amazon.com>
  Nishanth Menon <nm@ti.com>
  Olga Kornievskaia <kolga@netapp.com>
  Olli Asikainen <olli.asikainen@gmail.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Abeni <pabeni@redhat.com>
  Paul Moore <paul@paul-moore.com>
  Pavel Krasavin <pkrasavin@imaqliq.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Ping-Ke Shih <pkshih@realtek.com>
  Pu Wen <puwen@hygon.cn>
  Qu Huang <qu.huang@linux.dev>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Rahul Rameshbabu <rrameshbabu@nvidia.com>
  Rajeshwar R Shinde <coolrrsh@gmail.com>
  Richard Cochran <richardcochran@gmail.com>
  Ronald Wahl <ronald.wahl@raritan.com>
  Rong Chen <rong.chen@amlogic.com>
  Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
  Saeed Mahameed <saeedm@nvidia.com>
  Sanjuán García, Jorge <Jorge.SanjuanGarcia@duagon.com>
  Sasha Levin <sashal@kernel.org>
  Sean Christopherson <seanjc@google.com>
  Sean Young <sean@mess.org>
  Shigeru Yoshida <syoshida@redhat.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Shuai Xue <xueshuai@linux.alibaba.com>
  Shung-Hsi Yu <shung-hsi.yu@suse.com>
  Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
  Steve French <stfrench@microsoft.com>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Sumit Saxena <sumit.saxena@broadcom.com>
  Takashi Iwai <tiwai@suse.de>
  Tao Lyu <tao.lyu@epfl.ch>
  Theodore Ts'o <tytso@mit.edu>
  Thierry Reding <thierry.reding@gmail.com>
  Thomas Gleixner <tglx@linutronix.de>
  Toke Høiland-Jørgensen <toke@redhat.com>
  Toke Høiland-Jørgensen <toke@toke.dk>
  Tony Lindgren <tony@atomide.com>
  Trond Myklebust <trond.myklebust@hammerspace.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Vikash Garodia <quic_vgarodia@quicinc.com>
  Vincent Whitchurch <vincent.whitchurch@axis.com>
  Vinod Koul <vkoul@kernel.org>
  Vlad Buslov <vladbu@nvidia.com>
  Wayne Lin <wayne.lin@amd.com>
  Wenchao Hao <haowenchao2@huawei.com>
  Werner Sembach <wse@tuxedocomputers.com>
  Willem de Bruijn <willemb@google.com>
  Wolfram Sang <wsa@kernel.org>
  Yi Yang <yiyang13@huawei.com>
  Yonglong Liu <liuyonglong@huawei.com>
  Zhang Rui <rui.zhang@intel.com>
  Zhang Yi <yi.zhang@huawei.com>
  ZhengHan Wang <wzhmmmmm@gmail.com>
  Zhihao Cheng <chengzhihao1@huawei.com>
  zhujun2 <zhujun2@cmss.chinamobile.com>
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
 test-armhf-armhf-libvirt-qcow2                               fail    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 fail    
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
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      pass    
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


Not pushing.

(No revision log; it would be 5034 lines long.)

