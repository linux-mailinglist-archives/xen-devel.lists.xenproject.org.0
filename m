Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEEA2001A5
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 07:32:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jm9cW-0007km-AH; Fri, 19 Jun 2020 05:31:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v0l0=AA=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jm9cU-0007kS-3G
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 05:31:18 +0000
X-Inumbo-ID: 13e054e4-b1ee-11ea-bb33-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 13e054e4-b1ee-11ea-bb33-12813bfff9fa;
 Fri, 19 Jun 2020 05:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TrpeFcUMBuc4o3QpgBylh6slwC3QKDJJsPb2+GEmsuI=; b=Q+Zqrjo2VyIO3fIyPO0LsnAXb
 +gSUqHVwLWmqy3r/ubV7zWaYTeiEvCe5G0+U+sEv0qYXbiDLUw7LNfiCFvcb4PmdzcNy0y2IPYyEo
 6fMtan8gS4iDN5U8+CWv2bbHGwM9e7AUdC8NU5dLZ+3rd+HvqVcaBdjG7clvyT61NzxRQ=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jm9cJ-0006gy-QU; Fri, 19 Jun 2020 05:31:07 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jm9cJ-0000S0-Id; Fri, 19 Jun 2020 05:31:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jm9cJ-0003Hd-Hz; Fri, 19 Jun 2020 05:31:07 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151200-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 151200: regressions - FAIL
X-Osstest-Failures: linux-5.4:test-amd64-amd64-libvirt-vhd:guest-start/debian.repeat:fail:regression
 linux-5.4:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:regression
 linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
X-Osstest-Versions-This: linux=fd8cd8ac940c8b45b75474415291a3b941c865ab
X-Osstest-Versions-That: linux=5e3c511539228fa03c8d00d61b5b5f32333ed0b0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 19 Jun 2020 05:31:07 +0000
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

flight 151200 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151200/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-libvirt-vhd 17 guest-start/debian.repeat fail REGR. vs. 151022
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 10 debian-hvm-install fail REGR. vs. 151022

Tests which did not succeed, but are not blocking:
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop             fail never pass
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop              fail never pass
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop              fail never pass
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop             fail never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop             fail never pass
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop             fail never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass

version targeted for testing:
 linux                fd8cd8ac940c8b45b75474415291a3b941c865ab
baseline version:
 linux                5e3c511539228fa03c8d00d61b5b5f32333ed0b0

Last test of basis   151022  2020-06-10 18:39:22 Z    8 days
Testing same since   151200  2020-06-17 16:10:55 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Eric W. Biederman" <ebiederm@xmission.com>
  Alexander Potapenko <glider@google.com>
  Alexandre Belloni <alexandre.belloni@bootlin.com>
  Alla Segal <allas@mellanox.com>
  Amir Goldstein <amir73il@gmail.com>
  Andi Shyti <andi.shyti@intel.com>
  Andreas Gruenbacher <agruenba@redhat.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andrii Nakryiko <andriin@fb.com>
  Anson Huang <Anson.Huang@nxp.com>
  Anthony Steinhauser <asteinhauser@google.com>
  Ard Biesheuvel <ardb@kernel.org>
  Aristeu Rozanski <aris@redhat.com>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Arnaud Pouliquen <arnaud.pouliquen@st.com>
  Arnd Bergmann <arnd@arndb.de>
  Barret Rhoden <brho@google.com>
  Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
  Bjorn Andersson <bjorn.andersson@linaro.org>
  Bjorn Helgaas <bhelgaas@google.com>
  Bob Haarman <inglorion@google.com>
  Boris Ostrovsky <boris.ostrovsky@oracle.com>
  Borislav Petkov <bp@suse.de>
  Breno Lima <breno.lima@nxp.com>
  Casey Schaufler <casey@schaufler-ca.com>
  Chandrakanth Patil <chandrakanth.patil@broadcom.com>
  Chris Wilson <chris@chris-wilson.co.uk>
  Christoph Hellwig <hch@lst.de>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Christophe Leroy <christophe.leroy@csgroup.eu>
  Chuhong Yuan <hslester96@gmail.com>
  Cédric Le Goater <clg@kaod.org>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniel Jordan <daniel.m.jordan@oracle.com>
  Dave Rodgman <dave.rodgman@arm.com>
  David Howells <dhowells@redhat.com>
  David S. Miller <davem@davemloft.net>
  Denis Efremov <efremov@linux.com>
  Dennis Kadioglu <denk@eclipso.email>
  Dick Kennedy <dick.kennedy@broadcom.com>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Eiichi Tsukata <eiichi.tsukata@nutanix.com>
  Eric Biggers <ebiggers@google.com>
  Eric W. Biederman <ebiederm@xmission.com>
  Ezequiel Garcia <ezequiel@collabora.com>
  Fabio Estevam <festevam@gmail.com>
  Fangrui Song <maskray@google.com>
  Felipe Franciosi <felipe@nutanix.com>
  Florian Fainelli <f.fainelli@gmail.com>
  Franck LENORMAND <franck.lenormand@nxp.com>
  Fredrik Strupe <fredrik@strupe.net>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Giuseppe Scrivano <gscrivan@redhat.com>
  Gonglei <arei.gonglei@huawei.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Guo Ren <guoren@linux.alibaba.com>
  Hangbin Liu <liuhangbin@gmail.com>
  Hans de Goede <hdegoede@redhat.com>
  Herbert Xu <herbert@gondor.apana.org.au>
  Hill Ma <maahiuzeon@gmail.com>
  Huacai Chen <chenhc@lemote.com>
  Hui Wang <hui.wang@canonical.com>
  Ido Schimmel <idosch@mellanox.com>
  Ingo Molnar <mingo@kernel.org>
  James Morse <james.morse@arm.com>
  James Smart <jsmart2021@gmail.com>
  Jan Kara <jack@suse.cz>
  Jason Gunthorpe <jgg@mellanox.com>
  Jens Axboe <axboe@kernel.dk>
  Jiri Kosina <jkosina@suse.cz>
  Jue Wang <juew@google.com>
  Juergen Gross <jgross@suse.com>
  Justin Chen <justinpopo6@gmail.com>
  Kai-Heng Feng <kai.heng.feng@canonical.com>
  Kalle Valo <kvalo@codeaurora.org>
  Kamal Dasu <kdasu.kdev@gmail.com>
  Kan Liang <kan.liang@linux.intel.com>
  Kim Phillips <kim.phillips@amd.com>
  Kirill Shutemov <kirill@shutemov.name>
  Leonard Crestez <leonard.crestez@nxp.com>
  Libor Pechacek <lpechacek@suse.cz>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Longpeng(Mike) <longpeng2@huawei.com>
  Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
  Luca Coelho <luciano.coelho@intel.com>
  Ludovic Barre <ludovic.barre@st.com>
  Ludovic Desroches <ludovic.desroches@microchip.com>
  Lukas Wunner <lukas@wunner.de>
  Marc Zyngier <maz@kernel.org>
  Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
  Marcelo Ricardo Leitner <mleitner@redhat.com>
  Maria Teguiani <teguiani@google.com>
  Mark Brown <broonie@kernel.org>
  Martin K. Petersen <martin.petersen@oracle.com>
  Masahiro Yamada <yamada.masahiro@socionext.com>
  Masami Hiramatsu <mhiramat@kernel.org>
  Masashi Honma <masashi.honma@gmail.com>
  Matthias Maennich <maennich@google.com>
  Maxim Mikityanskiy <maximmi@mellanox.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael Ellerman <mpe@ellerman.id.au> (powerpc)
  Michael S. Tsirkin <mst@redhat.com>
  Michał Mirosław <mirq-linux@rere.qmqm.pl>
  Miklos Szeredi <mszeredi@redhat.com>
  Namjae Jeon <namjae.jeon@samsung.com>
  Nick Desaulniers <ndesaulniers@google.com>
  Nikolay Aleksandrov <nikolay@cumulusnetworks.com>
  OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
  Oleg Nesterov <oleg@redhat.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Pavel Dobias <dobias@2n.cz>
  Peng Fan <peng.fan@nxp.com>
  Petar Penkov <ppenkov@google.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Peter Zijlstra <peterz@infradead.org>
  Petr Tesarik <ptesarik@suse.com>
  Qian Cai <cai@lca.pw>
  Qiujun Huang <hqjagain@gmail.com>
  Qiushi Wu <wu000273@umn.edu>
  Qiuxu Zhuo <qiuxu.zhuo@intel.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
  Russell King <rmk+kernel@armlinux.org.uk>
  Ryusuke Konishi <konishi.ryusuke@gmail.com>
  Saeed Mahameed <saeedm@mellanox.com>
  Sam Ravnborg <sam@ravnborg.org>
  Sasha Levin <sashal@kernel.org>
  Sean Christopherson <sean.j.christopherson@intel.com>
  Sedat Dilek <sedat.dilek@gmail.com> # build+boot on
  Serge Semin <Sergey.Semin@baikalelectronics.ru>
  Shawn Guo <shawnguo@kernel.org>
  Shay Drory <shayd@mellanox.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Stanislav Fomichev <sdf@google.com>
  Stephan Gerhold <stephan@gerhold.net>
  Steve French <stfrench@microsoft.com>
  Suman Anna <s-anna@ti.com>
  Sumit Saxena <sumit.saxena@broadcom.com>
  Takashi Iwai <tiwai@suse.de>
  Takashi Sakamoto <o-takashi@sakamocchi.jp>
  Tanner Love <tannerlove@google.com>
  tannerlove <tannerlove@google.com>
  Tero Kristo <t-kristo@ti.com>
  Thomas Falcon <tlfalcon@linux.ibm.com>
  Thomas Gleixner <tglx@linutronix.de>
  Tony Luck <tony.luck@intel.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Vadim Pasternak <vadimp@mellanox.com>
  Vasily Averin <vvs@virtuozzo.com>
  Vasily Gorbik <gor@linux.ibm.com>
  Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
  Viresh Kumar <viresh.kumar@linaro.org>
  Vlad Buslov <vladbu@mellanox.com>
  Waiman Long <longman@redhat.com>
  Wang Hai <wanghai38@huawei.com>
  Wei Yongjun <weiyongjun1@huawei.com>
  Will Deacon <will@kernel.org>
  Willem de Bruijn <willemb@google.com>
  Wim Van Sebroeck <wim@linux-watchdog.org>
  Wolfram Sang <wsa+renesas@sang-engineering.com>
  Xiaochun Lee <lixc17@lenovo.com>
  Xin Long <lucien.xin@gmail.com>
  Xing Li <lixing@loongson.cn>
  youling257@gmail.com
  Yuxuan Shui <yshuiv7@gmail.com>

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
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 fail    
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

(No revision log; it would be 4147 lines long.)

