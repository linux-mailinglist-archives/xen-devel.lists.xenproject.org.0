Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA365EE5CA
	for <lists+xen-devel@lfdr.de>; Wed, 28 Sep 2022 21:37:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413448.657094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odcqa-0005qv-K9; Wed, 28 Sep 2022 19:35:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413448.657094; Wed, 28 Sep 2022 19:35:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odcqa-0005oV-H7; Wed, 28 Sep 2022 19:35:56 +0000
Received: by outflank-mailman (input) for mailman id 413448;
 Wed, 28 Sep 2022 19:35:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1odcqZ-0005oL-CD; Wed, 28 Sep 2022 19:35:55 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1odcqZ-0005XP-1m; Wed, 28 Sep 2022 19:35:55 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1odcqY-0007i4-FH; Wed, 28 Sep 2022 19:35:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1odcqY-0000UH-Eq; Wed, 28 Sep 2022 19:35:54 +0000
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
	bh=/X9cdJgvQEX5TzfJLF5dChBev6jzTByJS+zmjcHXffM=; b=VMFXq31Fj9D3F5l1ex/+5vcJjZ
	w02qZI+4C21PIs9TULFh1Q9jl2+j/u7w3oPkjBF6PB6xdKtvn0V3Rn1AfKI5V5Y/z+mwRlOt60GIt
	/Gn0I9VWHhxAeR5BeelsYbj4NOweFqLkOFX3DbsiEWmP7Nn6rHVCzHXA0/fIeOJd0dsI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173353-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 173353: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-5.4:test-amd64-i386-libvirt-pair:xen-install/dst_host:fail:heisenbug
    linux-5.4:test-amd64-i386-libvirt-pair:xen-install/src_host:fail:heisenbug
    linux-5.4:test-armhf-armhf-libvirt-qcow2:guest-start:fail:heisenbug
    linux-5.4:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-credit2:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:guest-start.2:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=6215647d9699cb8f1bf7333ec849242c4a9cf9a6
X-Osstest-Versions-That:
    linux=9f02aa34e179d1b0185a27980dd5bafd0f2e6e59
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 28 Sep 2022 19:35:54 +0000

flight 173353 linux-5.4 real [real]
flight 173359 linux-5.4 real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/173353/
http://logs.test-lab.xenproject.org/osstest/logs/173359/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-i386-libvirt-pair 11 xen-install/dst_host fail in 173359 pass in 173353
 test-amd64-i386-libvirt-pair 10 xen-install/src_host fail pass in 173359-retest
 test-armhf-armhf-libvirt-qcow2 13 guest-start       fail pass in 173359-retest
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail pass in 173359-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-credit2 18 guest-start/debian.repeat fail blocked in 173260
 test-armhf-armhf-xl-credit1 18 guest-start/debian.repeat fail blocked in 173260
 test-armhf-armhf-xl-multivcpu 19 guest-start.2          fail blocked in 173260
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check fail in 173359 like 173260
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check fail in 173359 never pass
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 173260
 test-armhf-armhf-xl-rtds     18 guest-start/debian.repeat    fail  like 173260
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 173260
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 173260
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 173260
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 173260
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 173260
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 173260
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 173260
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 173260
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 173260
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 173260
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                6215647d9699cb8f1bf7333ec849242c4a9cf9a6
baseline version:
 linux                9f02aa34e179d1b0185a27980dd5bafd0f2e6e59

Last test of basis   173260  2022-09-20 10:44:01 Z    8 days
Testing same since   173353  2022-09-28 09:15:02 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Adrian Hunter <adrian.hunter@intel.com>
  Alan Stern <stern@rowland.harvard.edu>
  Alex Deucher <alexander.deucher@amd.com>
  Alexander Sverdlin <alexander.sverdlin@nokia.com>
  Andrii Staikov <andrii.staikov@intel.com>
  Ard Biesheuvel <ardb@kernel.org>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Bartosz Golaszewski <brgl@bgdev.pl>
  Benjamin Poirier <bpoirier@nvidia.com>
  Bharathi Sreenivas <bharathi.sreenivas@intel.com>
  Bjørn Mork <bjorn@mork.no>
  Borislav Petkov <bp@suse.de>
  Brett Creeley <brett.creeley@intel.com>
  Brian Foster <bfoster@redhat.com>
  Brian Norris <briannorris@chromium.org>
  Callum Osmotherly <callum.osmotherly@gmail.com>
  Carl Yin <carl.yin@quectel.com>
  Carl Yin(殷张成) <carl.yin@quectel.com>
  Chandan Babu R <chandan.babu@oracle.com>
  Chao Yu <chao.yu@oppo.com>
  Christoph Hellwig <hch@lst.de>
  Chunfeng Yun <chunfeng.yun@mediatek.com>
  Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
  Codrin.Ciubotariu@microchip.com <Codrin.Ciubotariu@microchip.com>
  Daniel Dao <dqminh@cloudflare.com>
  Daniel Wheeler <daniel.wheeler@amd.com>
  Darrick J. Wong <darrick.wong@oracle.com>
  Darrick J. Wong <djwong@kernel.org>
  Dave Chinner <dchinner@redhat.com>
  David Howells <dhowells@redhat.com>
  David Leadbeater <dgl@dgl.cx>
  David Rientjes <rientjes@google.com>
  David S. Miller <davem@davemloft.net>
  Fabio Estevam <festevam@denx.de>
  Felipe Balbi <balbi@kernel.org>
  Florian Fainelli <f.fainelli@gmail.com>
  Florian Westphal <fw@strlen.de>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Hamza Mahfooz <hamza.mahfooz@amd.com>
  Hangyu Hua <hbh25y@gmail.com>
  Heiko Stuebner <heiko@sntech.de>
  Helge Deller <deller@gmx.de>
  huangwenhui <huangwenhuia@uniontech.com>
  Hulk Robot <hulkrobot@huawei.com>
  Hyunwoo Kim <imv4bel@gmail.com>
  Igor Ryzhov <iryzhov@nfware.com>
  Ikjoon Jang <ikjn@chromium.org>
  Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
  Jakub Kicinski <kuba@kernel.org>
  Jan Kara <jack@suse.cz>
  Jean-Francois Le Fillatre <jflf_kernel@gmx.com>
  Jens Axboe <axboe@kernel.dk>
  jerry meng <jerry-meng@foxmail.com>
  jerry.meng <jerry-meng@foxmail.com>
  Johan Hovold <johan@kernel.org>
  Johannes Berg <johannes.berg@intel.com>
  Jon Hunter <jonathanh@nvidia.com>
  Kai Vehmanen <kai.vehmanen@linux.intel.com>
  kaixuxia <kaixuxia@tencent.com>
  kaixuxia <xiakaixu1987@gmail.com>
  Keguang Zhang <keguang.zhang@gmail.com>
  Konrad Jankowski <konrad0.jankowski@intel.com>
  Leo Yan <leo.yan@linaro.org>
  Liang He <windhl@126.com>
  Lieven Hey <lieven.hey@kdab.com>
  Lino Sanfilippo <LinoSanfilippo@gmx.de>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Lu Wei <luwei32@huawei.com>
  Luke D. Jones <luke@ljones.dev>
  Luís Henriques <lhenriques@suse.de>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Mark Brown <broonie@kernel.org>
  Masahiro Yamada <masahiroy@kernel.org>
  Mateusz Palczewski <mateusz.palczewski@intel.com>
  Miaoqian Lin <linmq006@gmail.com>
  Michal Jaron <michalx.jaron@intel.com>
  Mohan Kumar <mkumard@nvidia.com>
  Namhyung Kim <namhyung@kernel.org>
  Nathan Huckleberry <nhuck@google.com>
  Neil Armstrong <narmstrong@baylibre.com>
  Norbert Zulinski <norbertx.zulinski@intel.com>
  Ojaswin Mujoo <ojaswin@linux.ibm.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Pali Rohár <pali@kernel.org>
  Paolo Abeni <pabeni@redhat.com>
  Pavle Kotarac <Pavle.Kotarac@amd.com>
  Pawel Laszczak <pawell@cadence.com>
  Peter Chen <peter.chen@kernel.org>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Piyush Mehta <piyush.mehta@amd.com>
  Randy Dunlap <rdunlap@infradead.org>
  Richard Genoud <richard.genoud@gmail.com>
  Rob Herring <robh@kernel.org>
  Ronnie Sahlberg <lsahlber@redhat.com>
  Sasha Levin <sashal@kernel.org>
  Sean Anderson <seanga2@gmail.com>
  Serge Semin <Sergey.Semin@baikalelectronics.ru>
  Sergey Shtylyov <s.shtylyov@omp.ru>
  Sergiu Moga <sergiu.moga@microchip.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Siddh Raman Pant <code@siddh.me>
  Stefan Haberland <sth@linux.ibm.com>
  Stefan Metzmacher <metze@samba.org>
  Stefan Wahren <stefan.wahren@i2se.com>
  Steve French <stfrench@microsoft.com>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Stuart Menefy <stuart.menefy@mathembedded.com>
  Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
  Takashi Iwai <tiwai@suse.de>
  Tejun Heo <tj@kernel.org>
  Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
  Theodore Ts'o <tytso@mit.edu>
  Thinh Nguyen <Thinh.Nguyen@synopsys.com>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Trond Myklebust <trond.myklebust@hammerspace.com>
  Vitaly Kuznetsov <vkuznets@redhat.com>
  Vladimir Oltean <vladimir.oltean@nxp.com>
  Vlastimil Babka <vbabka@suse.cz>
  Wei Liu <wei.liu@kernel.org>
  Wesley Cheng <quic_wcheng@quicinc.com>
  Wesley Cheng <wcheng@codeaurora.org>
  Xiaolei Wang <xiaolei.wang@windriver.com>
  Yang Yingliang <yangyingliang@huawei.com>
  Yao Wang1 <Yao.Wang1@amd.com>
  Yipeng Zou <zouyipeng@huawei.com>
  Youling Tang <tangyouling@loongson.cn>
  zain wang <wzz@rock-chips.com>

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
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 fail    
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
 test-armhf-armhf-xl-multivcpu                                fail    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 fail    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               fail    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  pass    
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


Pushing revision :

hint: The 'hooks/update' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
hint: The 'hooks/post-receive' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
hint: The 'hooks/post-update' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
To xenbits.xen.org:/home/xen/git/linux-pvops.git
   9f02aa34e179..6215647d9699  6215647d9699cb8f1bf7333ec849242c4a9cf9a6 -> tested/linux-5.4

