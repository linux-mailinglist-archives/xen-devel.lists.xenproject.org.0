Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0F21AE3F1
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 19:46:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPV3T-0001Cy-6w; Fri, 17 Apr 2020 17:45:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=piBF=6B=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jPV3Q-0001Cq-VV
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 17:45:29 +0000
X-Inumbo-ID: 349175c0-80d3-11ea-8d67-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 349175c0-80d3-11ea-8d67-12813bfff9fa;
 Fri, 17 Apr 2020 17:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2N8BLgZKxd/iUXSKCuOxSAQnBFOXc6R6Q6wATt+ISms=; b=BIM/eDLxNUjXnY2BYB1U9GqAJ
 FF47vRj2nWZI2TpARdZWbsbM/uwCGNmFweQtg5idjo+22uLyh/CPXByl7ilKT6JFdM3+vsZLzUvFQ
 WiHgNj57JagHv2s2ewbqV/HgGfVxx+HSgTwA4qPjl3cql0fcvC/8J8cwAiykR2JjxykMQ=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jPV3H-000463-Ba; Fri, 17 Apr 2020 17:45:19 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jPV3H-000830-1g; Fri, 17 Apr 2020 17:45:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jPV3H-0007GV-0q; Fri, 17 Apr 2020 17:45:19 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149700-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 149700: regressions - FAIL
X-Osstest-Failures: linux-5.4:test-amd64-amd64-examine:memdisk-try-append:fail:regression
 linux-5.4:test-amd64-amd64-xl-rtds:guest-localmigrate/x10:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
X-Osstest-Versions-This: linux=dc4059d21d87e87054714d51a5325984f91c04b3
X-Osstest-Versions-That: linux=bc844d58f697dff3ded4b410094ee89f5cedc04c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 17 Apr 2020 17:45:19 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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

flight 149700 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149700/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-examine      4 memdisk-try-append       fail REGR. vs. 149637

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-rtds     18 guest-localmigrate/x10  fail blocked in 149637
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop             fail never pass
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop              fail never pass
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop              fail never pass
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop             fail never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop             fail never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail   never pass
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop             fail never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass

version targeted for testing:
 linux                dc4059d21d87e87054714d51a5325984f91c04b3
baseline version:
 linux                bc844d58f697dff3ded4b410094ee89f5cedc04c

Last test of basis   149637  2020-04-13 09:10:52 Z    4 days
Testing same since   149700  2020-04-17 09:09:37 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Eric W. Biederman" <ebiederm@xmission.com>
  Aaron Liu <aaron.liu@amd.com>
  Adrian Hunter <adrian.hunter@intel.com>
  Ahmed S. Darwish <a.darwish@linutronix.de>
  Ajay Singh <ajay.kathat@microchip.com>
  Alain Volmat <avolmat@me.com>
  Alan Maguire <alan.maguire@oracle.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alex Williamson <alex.williamson@redhat.com>
  Alexander Sverdlin <alexander.sverdlin@nokia.com>
  Alexei Starovoitov <ast@kernel.org>
  Alexey Dobriyan (SK hynix) <adobriyan@gmail.com>
  Alexey Dobriyan <adobriyan@gmail.com>
  Andre Przywara <andre.przywara@arm.com>
  Andrei Botila <andrei.botila@nxp.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andrzej Pietrasiewicz <andrzej.p@collabora.com>
  Andy Lutomirski <luto@kernel.org>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
  Anssi Hannula <anssi.hannula@bitwise.fi>
  Ard Biesheuvel <ardb@kernel.org>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Arvind Sankar <nivedita@alum.mit.edu>
  Bart Van Assche <bvanassche@acm.org>
  Benoit Parrot <bparrot@ti.com>
  Bjorn Andersson <bjorn.andersson@linaro.org>
  Bjorn Helgaas <bhelgaas@google.com>
  Bob Liu <bob.liu@oracle.com>
  Bob Peterson <rpeterso@redhat.com>
  Boqun Feng <boqun.feng@gmail.com>
  Borislav Petkov <bp@suse.de>
  Catalin Marinas <catalin.marinas@arm.com>
  Changwei Ge <chge@linux.alibaba.com>
  Chen-Yu Tsai <wens@csie.org>
  chenqiwu <chenqiwu@xiaomi.com>
  Chris Down <chris@chrisdown.name>
  Chris Packham <chris.packham@alliedtelesis.co.nz>
  Chris Wilson <chris@chris-wilson.co.uk>
  Christian Borntraeger <borntraeger@de.ibm.com>
  Christian Gmeiner <christian.gmeiner@gmail.com>
  Christoph Hellwig <hch@lst.de>
  Christoph Niedermaier <cniedermaier@dh-electronics.com>
  Christophe Leroy <christophe.leroy@c-s.fr>
  Chuck Lever <chuck.lever@oracle.com>
  cki-project@redhat.com
  Clement Courbet <courbet@google.com>
  Corey Minyard <cminyard@mvista.com>
  Cédric Le Goater <clg@kaod.org>
  Dan Carpenter <dan.carpenter@oracle.com>
  Daniel Axtens <dja@axtens.net>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniel Lezcano <daniel.lezcano@linaro.org>
  Dave Gerlach <d-gerlach@ti.com>
  David Gibson <david@gibson.dropbear.id.au>
  David Hildenbrand <david@redhat.com>
  David Howells <dhowells@redhat.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Dick Kennedy <dick.kennedy@broadcom.com>
  Dietmar Eggemann <dietmar.eggemann@arm.com>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Dongchun Zhu <dongchun.zhu@mediatek.com>
  Eric Auger <eric.auger@redhat.com>
  Eric Biggers <ebiggers@google.com>
  Eric W. Biederman <ebiederm@xmission.com>
  Ezequiel Garcia <ezequiel@collabora.com>
  Faiz Abbas <faiz_abbas@ti.com>
  Feilong Lin <linfeilong@huawei.com>
  Felipe Balbi <balbi@kernel.org>
  Filipe Manana <fdmanana@suse.com>
  Fredrik Strupe <fredrik@strupe.net>
  Frieder Schrempf <frieder.schrempf@kontron.de>
  Gao Xiang <gaoxiang25@huawei.com>
  Gary Lin <glin@suse.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Gilad Ben-Yossef <gilad@benyossef.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Grigore Popescu <grigore.popescu@nxp.com>
  Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
  Gustavo A. R. Silva <gustavo@embeddedor.com>
  Gyeongtaek Lee <gt82.lee@samsung.com>
  Hans de Goede <hdegoede@redhat.com>
  Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Harshini Shetty <harshini.x.shetty@sony.com>
  He Zhe <zhe.he@windriver.com>
  Herbert Xu <herbert@gondor.apana.org.au>
  Horia Geantă <horia.geanta@nxp.com>
  Huacai Chen <chenhc@lemote.com>
  Huang Rui <ray.huang@amd.com>
  Hui Wang <hui.wang@canonical.com>
  Ilan Peer <ilan.peer@intel.com>
  Imre Deak <imre.deak@intel.com>
  Ingo Molnar <mingo@kernel.org>
  J. Bruce Fields <bfields@redhat.com>
  Jakub Kicinski <kuba@kernel.org>
  James Morse <james.morse@arm.com>
  James Smart <jsmart2021@gmail.com>
  Jan Engelhardt <jengelh@inai.de>
  Jann Horn <jannh@google.com>
  Janosch Frank <frankja@linux.ibm.com>
  Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
  Jeff Mahoney <jeffm@suse.com>
  Jens Axboe <axboe@kernel.dk>
  Jiri Olsa <jolsa@redhat.com>
  Johannes Berg <johannes.berg@intel.com>
  John Garry <john.garry@huawei.com>
  Josef Bacik <josef@toxicpanda.com>
  Juergen Gross <jgross@suse.com>
  Julia Lawall <Julia.Lawall@inria.fr>
  Junyong Sun <sunjunyong@xiaomi.com>
  Junyong Sun <sunjy516@gmail.com>
  Kai-Heng Feng <kai.heng.feng@canonical.com>
  Kalle Valo <kvalo@codeaurora.org>
  Kar Hin Ong <kar.hin.ong@ni.com>
  Kees Cook <keescook@chromium.org>
  Keith Busch <kbusch@kernel.org>
  Kishon Vijay Abraham I <kishon@ti.com>
  Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
  Kristian Klausen <kristian@klausen.dk>
  Krzysztof Kozlowski <krzk@kernel.org>
  Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  Laurentiu Tudor <laurentiu.tudor@nxp.com>
  Lee Jones <lee.jones@linaro.org>
  Li Yang <leoyang.li@nxp.com>
  Libor Pechacek <lpechacek@suse.cz>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Logan Gunthorpe <logang@deltatee.com>
  Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
  Luca Coelho <luciano.coelho@intel.com>
  Lucas Stach <l.stach@pengutronix.de>
  Luis Chamberlain <mcgrof@kernel.org>
  Lukas Wunner <lukas@wunner.de>
  Luo bin <luobin9@huawei.com>
  Lyude Paul <lyude@redhat.com>
  Marc Zyngier <maz@kernel.org>
  Marek Szyprowski <m.szyprowski@samsung.com>
  Mark Brown <broonie@kernel.org>
  Markus Fuchs <mklntf@gmail.com>
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Masami Hiramatsu <mhiramat@kernel.org>
  Mathias Nyman <mathias.nyman@linux.intel.com>
  Matt Ranostay <matt.ranostay@konsulko.com>
  Matthew Garrett <matthewgarrett@google.com>
  Matthew Wilcox (Oracle) <willy@infradead.org>
  Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  Maxime Ripard <maxime@cerno.tech>
  Mengbing Wang <Mengbing.Wang@amd.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael Mueller <mimu@linux.ibm.com>
  Michael Tretter <m.tretter@pengutronix.de>
  Michael Walle <michael@walle.cc>
  Michael Wang <yun.wang@linux.alibaba.com>
  Michal Hocko <mhocko@suse.com>
  Michal Suchanek <msuchanek@suse.de>
  Mike Snitzer <snitzer@redhat.com>
  Mikulas Patocka <mpatocka@redhat.com>
  Miquel Raynal <miquel.raynal@bootlin.com>
  Mohammad Rasim <mohammad.rasim96@gmail.com>
  Nathan Chancellor <natechancellor@gmail.com>
  Neeraj Upadhyay <neeraju@codeaurora.org>
  Neil Armstrong <narmstrong@baylibre.com>
  Neil Horman <nhorman@tuxdriver.com>
  Nick Reitemeyer <nick.reitemeyer@web.de>
  Nikita Shubin <NShubin@topcon.com>
  Nikos Tsironis <ntsironis@arrikto.com>
  Oliver O'Halloran <oohall@gmail.com>
  Olivier Moysan <olivier.moysan@st.com>
  Ondrej Jirman <megous@megous.com>
  Ondřej Caletka <ondrej@caletka.cz>
  Paolo Bonzini <pbonzini@redhat.com>
  Paolo Valente <paolo.valente@linaro.org>
  Paul Cercueil <paul@crapouillou.net>
  Pei Huang <huangpei@loongson.cn>
  Peng Fan <peng.fan@nxp.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Pradeep P V K <ppvk@codeaurora.org>
  Prike Liang <Prike.Liang@amd.com>
  Qian Cai <cai@lca.pw>
  Qu Wenruo <wqu@suse.com>
  Rafael Aquini <aquini@redhat.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Raju Rangoju <rajur@chelsio.com>
  Remi Pommarel <repk@triplefau.lt>
  Robbie Ko <robbieko@synology.com>
  Rodrigo Vivi <rodrigo.vivi@intel.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Roger Quadros <rogerq@ti.com>
  Ronnie Sahlberg <lsahlber@redhat.com>
  Rosioru Dragos <dragos.rosioru@nxp.com>
  Sagi Grimberg <sagi@grimberg.me>
  Sahitya Tummala <stummala@codeaurora.org>
  Sakari Ailus <sakari.ailus@linux.intel.com>
  Sam Lunt <samuel.j.lunt@gmail.com>
  Sam Lunt <samueljlunt@gmail.com>
  Sasha Levin <sashal@kernel.org>
  Scott Wood <oss@buserror.net>
  Scott Wood <swood@redhat.com>
  Sean Christopherson <sean.j.christopherson@intel.com>
  Sean Tranchetti <stranche@codeaurora.org>
  Sean V Kelley <sean.v.kelley@linux.intel.com>
  Sean Young <sean@mess.org>
  Shetty, Harshini X (EXT-Sony Mobile) <Harshini.X.Shetty@sony.com>
  Sibi Sankar <sibis@codeaurora.org>
  Simon Gander <simon@tuxera.com>
  Song Liu <songliubraving@fb.com>
  Sreekanth Reddy <sreekanth.reddy@broadcom.com>
  Sriharsha Allenki <sallenki@codeaurora.org>
  Stanimir Varbanov <stanimir.varbanov@linaro.org>
  Stanimir Varbanov <svarbanov@mm-sol.com>
  Stanley Chu <stanley.chu@mediatek.com>
  Steffen Maier <maier@linux.ibm.com>
  Stephan Gerhold <stephan@gerhold.net>
  Stephen Boyd <sboyd@kernel.org>
  Steve French <stfrench@microsoft.com>
  Steven Rostedt (VMware) <rostedt@goodmis.org>
  Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>
  Sungbo Eo <mans0n@gorani.run>
  Sven Schnelle <svens@linux.ibm.com>
  Taehee Yoo <ap420073@gmail.com>
  Takashi Iwai <tiwai@suse.de>
  Tero Kristo <t-kristo@ti.com>
  Theodore Ts'o <tytso@mit.edu>
  Thinh Nguyen <Thinh.Nguyen@synopsys.com>
  Thinh Nguyen <thinhn@synopsys.com>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Thomas Gleixner <tglx@linutronix.de>
  Thomas Hebb <tommyhebb@gmail.com>
  Thomas Hellstrom <thellstrom@vmware.com>
  Thomas Zimmermann <tzimmermann@suse.de>
  Tom Lendacky <thomas.lendacky@amd.com>
  Tomasz Figa <tfiga@chromium.org>
  Tony Lindgren <tony@atomide.com>
  Trond Myklebust <trond.myklebust@hammerspace.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Valentin Ciocoi Radulescu <valentin.ciocoi@nxp.com>
  Vasily Averin <vvs@virtuozzo.com>
  Vasily Gorbik <gor@linux.ibm.com>
  Vincent Guittot <vincent.guittot@linaro.org>
  Viresh Kumar <viresh.kumar@linaro.org>
  Vitaly Kuznetsov <vkuznets@redhat.com>
  Vladimir Oltean <vladimir.oltean@nxp.com>
  Wen Yang <wenyang@linux.alibaba.com>
  Wolfram Sang <wsa@the-dreams.de>
  Xu Wang <vulab@iscas.ac.cn>
  Yang Xu <xuyang2018.jy@cn.fujitsu.com>
  Yangbo Lu <yangbo.lu@nxp.com>
  Yicong Yang <yangyicong@hisilicon.com>
  Yilu Lin <linyilu@huawei.com>
  Yintian Tao <yttao@amd.com>
  Yonghong Song <yhs@fb.com>
  YueHaibing <yuehaibing@huawei.com>
  Yuxian Dai <Yuxian.Dai@amd.com>
  Zheng Wei <wei.zheng@vivo.com>
  Zhiqiang Liu <liuzhiqiang26@huawei.com>
  이경택 <gt82.lee@samsung.com>

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
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           pass    
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
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
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
 test-amd64-amd64-xl-rtds                                     fail    
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


Not pushing.

(No revision log; it would be 8200 lines long.)

