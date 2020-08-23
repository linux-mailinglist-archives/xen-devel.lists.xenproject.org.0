Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D420624EC71
	for <lists+xen-devel@lfdr.de>; Sun, 23 Aug 2020 11:30:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k9mJO-00042E-R7; Sun, 23 Aug 2020 09:29:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zTdr=CB=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1k9mJM-000429-VP
 for xen-devel@lists.xenproject.org; Sun, 23 Aug 2020 09:29:13 +0000
X-Inumbo-ID: b5434209-0da9-47d5-ac94-8faa61146f42
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b5434209-0da9-47d5-ac94-8faa61146f42;
 Sun, 23 Aug 2020 09:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=KoPf70x2XoYJ0+q2uFO1G+dJGbovO7PcV9/LEMmYYQ4=; b=MQ26z48GdkiwTEtQtb7NUeayAB
 4DDojWvKFg9OEKVcQzEQdR9mtVFiCeQcyqcpdxkcmn0Ueh0ZQ7zJoJdYYUO/dxXZxO/2GWy676gyW
 wDRUIKTC7NdqriApaggogMFyF49PkyABm7mREzgH5T/Gvs2lnUIguzK51pobCRuvwX7I=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k9mJI-0001pq-Uq; Sun, 23 Aug 2020 09:29:09 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k9mJI-0003II-JM; Sun, 23 Aug 2020 09:29:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1k9mJI-0006BF-It; Sun, 23 Aug 2020 09:29:08 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152675-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 152675: tolerable FAIL - PUSHED
X-Osstest-Failures: linux-5.4:test-amd64-i386-libvirt-xsm:guest-destroy:fail:heisenbug
 linux-5.4:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:heisenbug
 linux-5.4:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: linux=77fcb48939fc863d9ba9d808fac9000959e937d3
X-Osstest-Versions-That: linux=f61e1c3638dddaa1a1f3bb59d2bc288d9f0f1b5b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 23 Aug 2020 09:29:08 +0000
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

flight 152675 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152675/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-i386-libvirt-xsm  20 guest-destroy    fail in 152664 pass in 152675
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 10 debian-hvm-install fail pass in 152664

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-rtds   16 guest-start/debian.repeat fail blocked in 152614
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop             fail never pass
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop              fail never pass
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop             fail never pass
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail   never pass
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop             fail never pass
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop             fail never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                77fcb48939fc863d9ba9d808fac9000959e937d3
baseline version:
 linux                f61e1c3638dddaa1a1f3bb59d2bc288d9f0f1b5b

Last test of basis   152614  2020-08-19 09:11:23 Z    4 days
Testing same since   152656  2020-08-21 11:13:28 Z    1 days    3 attempts

------------------------------------------------------------
People who touched revisions under test:
  Adrian Hunter <adrian.hunter@intel.com>
  Ahmad Fatoum <a.fatoum@pengutronix.de>
  Alex Deucher <alexander.deucher@amd.com>
  Alexandru Ardelean <alexandru.ardelean@analog.com>
  Alexei Starovoitov <ast@kernel.org>
  Anand Jain <anand.jain@oracle.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andrii Nakryiko <andriin@fb.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
  Ansuel Smith <ansuelsmth@gmail.com>
  Anton Blanchard <anton@ozlabs.org>
  Ard Biesheuvel <ardb@kernel.org>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Barry Song <baohua@kernel.org>
  Bjorn Andersson <bjorn.andersson@linaro.org>
  Bjorn Helgaas <bhelgaas@google.com>
  Boris Brezillon <boris.brezillon@collabora.com>
  Catalin Marinas <catalin.marinas@arm.com>
  ChangSyun Peng <allenpeng@synology.com>
  Charles Keepax <ckeepax@opensource.cirrus.com>
  Chengming Zhou <zhouchengming@bytedance.com>
  Christian Brauner <christian.brauner@ubuntu.com>
  Christian Eggers <ceggers@arri.de>
  Christophe Leroy <christophe.leroy@csgroup.eu>
  Colin Ian King <colin.king@canonical.com>
  Coly Li <colyli@suse.de>
  Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Dan Williams <dan.j.williams@intel.com>
  Daniel Axtens <dja@axtens.net>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniel Díaz <daniel.diaz@linaro.org>
  Daniel Vetter <daniel.vetter@ffwll.ch>
  dann frazier <dann.frazier@canonical.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Denis Efremov <efremov@linux.com>
  Dhananjay Phadke <dphadke@linux.microsoft.com>
  Dilip Kota <eswara.kota@linux.intel.com>
  Dinghao Liu <dinghao.liu@zju.edu.cn>
  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Enric Balletbo i Serra <enric.balletbo@collabora.com>
  Eric Biggers <ebiggers@google.com>
  Eric Dumazet <edumazet@google.com>
  Eryk Brol <eryk.brol@amd.com>
  Eugeniu Rosca <erosca@de.adit-jv.com>
  Ewan D. Milne <emilne@redhat.com>
  Filipe Manana <fdmanana@suse.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Gregory CLEMENT <gregory.clement@bootlin.com>
  Gregory Herrero <gregory.herrero@oracle.com>
  Guenter Roeck <linux@roeck-us.net>
  Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Herbert Xu <herbert@gondor.apana.org.au>
  Hersen Wu <hersenxs.wu@amd.com>
  Horia Geantă <horia.geanta@nxp.com>
  Huacai Chen <chenhc@lemote.com>
  Hugh Dickins <hughd@google.com>
  Ilya Dryomov <idryomov@gmail.com>
  Ingo Molnar <mingo@kernel.org>
  Jacob Pan <jacob.jun.pan@linux.intel.com>
  Jan Kara <jack@suse.cz>
  Jane Chu <jane.chu@oracle.com>
  Jason Gunthorpe <jgg@nvidia.com>
  Jeff Layton <jlayton@kernel.org>
  Jeffrey Mitchell <jeffrey.mitchell@starlab.io>
  Jens Axboe <axboe@kernel.dk>
  Jesper Dangaard Brouer <brouer@redhat.com>
  Jessica Yu <jeyu@kernel.org>
  Jia He <justin.he@arm.com>
  Jiri Olsa <jolsa@kernel.org>
  Jiri Olsa <jolsa@redhat.com>
  Joerg Roedel <jroedel@suse.de>
  Johan Hovold <johan@kernel.org>
  Johannes Berg <johannes.berg@intel.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Jonathan Marek <jonathan@marek.ca>
  Jonathan McDowell <noodles@earth.li>
  Josef Bacik <josef@toxicpanda.com>
  João Henrique <johnnyonflame@hotmail.com>
  Junxiao Bi <junxiao.bi@oracle.com>
  Kai-Heng Feng <kai.heng.feng@canonical.com>
  Kamal Heib <kamalheib1@gmail.com>
  Kamal Heib <kheib@redhat.com>
  Kees Cook <keescook@chromium.org>
  Kevin Hao <haokexin@gmail.com>
  Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
  Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
  Konrad Dybcio <konradybcio@gmail.com>
  Krzysztof Sobota <krzysztof.sobota@nokia.com>
  Lee Jones <lee.jones@linaro.org>
  Leon Romanovsky <leonro@mellanox.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Liu Yi L <yi.l.liu@intel.com>
  Liu Ying <victor.liu@nxp.com>
  Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
  Lu Baolu <baolu.lu@linux.intel.com>
  Luis Chamberlain <mcgrof@kernel.org>
  Lukas Wunner <lukas@wunner.de>
  Lyude Paul <lyude@redhat.com>
  Marc Zyngier <maz@kernel.org>
  Marius Iacob <themariusus@gmail.com>
  Mark Zhang <markz@mellanox.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Masami Hiramatsu <mhiramat@kernel.org>
  Mathew King <mathewk@chromium.org>
  Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  Max Filippov <jcmvbkbc@gmail.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michal Hocko <mhocko@suse.com>
  Michal Koutný <mkoutny@suse.com>
  Mike Marshall <hubcap@omnibond.com>
  Mike Snitzer <snitzer@redhat.com>
  Mikulas Patocka <mpatocka@redhat.com>
  Ming Lei <ming.lei@redhat.com>
  Miquel Raynal <miquel.raynal@bootlin.com>
  Muchun Song <songmuchun@bytedance.com>
  Nathan Chancellor <natechancellor@gmail.com>
  Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
  Ondrej Mosnacek <omosnace@redhat.com>
  Pali Rohár <pali@kernel.org>
  Patrick Donnelly <pdonnell@redhat.com>
  Paul Aurich <paul@darkrain42.org>
  Paul Cercueil <paul@crapouillou.net>
  Paul Kocialkowski <paul.kocialkowski@bootlin.com>
  Pavel Machek (CIP) <pavel@denx.de>
  Pavel Machek <pavel@denx.de>
  Philipp Zabel <p.zabel@pengutronix.de>
  Qiushi Wu <wu000273@umn.edu>
  Qu Wenruo <wqu@suse.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Rajat Jain <rajatja@google.com>
  Ray Jui <ray.jui@broadcom.com>
  Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
  Rich Felker <dalias@libc.org>
  Richard Weinberger <richard@nod.at>
  Rob Herring <robh@kernel.org>
  Roland Scheidegger <sroland@vmware.com>
  Roman Gushchin <guro@fb.com>
  Sandeep Raghuraman <sandy.8925@gmail.com>
  Sasha Levin <sashal@kernel.org>
  Scott Branden <scott.branden@broadcom.com>
  Scott Mayhew <smayhew@redhat.com>
  Sham Muthayyan <smuthayy@codeaurora.org>
  Shaokun Zhang <zhangshaokun@hisilicon.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Sibi Sankar <sibis@codeaurora.org>
  Song Liu <songliubraving@fb.com>
  Stafford Horne <shorne@gmail.com>
  Stanimir Varbanov <svarbanov@mm-sol.com>
  Stephen Boyd <sboyd@kernel.org>
  Steve French <stfrench@microsoft.com>
  Steve Longerbeam <slongerbeam@gmail.com>
  Steven Price <steven.price@arm.com>
  Steven Rostedt (VMware) <rostedt@goodmis.org>
  Takashi Iwai <tiwai@suse.de>
  Thierry Reding <thierry.reding@gmail.com>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Thomas Gleixner <tglx@linutronix.de>
  Thomas Hebb <tommyhebb@gmail.com>
  Tiezhu Yang <yangtiezhu@loongson.cn>
  Timur Tabi <timur@kernel.org>
  Tom Rix <trix@redhat.com>
  Tomasz Maciej Nowak <tmn505@gmail.com>
  Trond Myklebust <trond.myklebust@hammerspace.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Vincent Whitchurch <vincent.whitchurch@axis.com>
  Vishal Verma <vishal.l.verma@intel.com>
  Vladimir Oltean <vladimir.oltean@nxp.com>
  Wang Hai <wanghai38@huawei.com>
  Will Deacon <will@kernel.org>
  Wim Van Sebroeck <wim@linux-watchdog.org>
  Wolfram Sang <wsa+renesas@sang-engineering.com>
  Wolfram Sang <wsa@kernel.org>
  Xin Tan <tanxin.ctf@gmail.com>
  Xin Xiong <xiongx18@fudan.edu.cn>
  Xiyu Yang <xiyuyang19@fudan.edu.cn>
  Xu Wang <vulab@iscas.ac.cn>
  Yishai Hadas <yishaih@mellanox.com>
  Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Zhang Rui <rui.zhang@intel.com>
  Zhihao Cheng <chengzhihao1@huawei.com>

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
   f61e1c3638dd..77fcb48939fc  77fcb48939fc863d9ba9d808fac9000959e937d3 -> tested/linux-5.4

