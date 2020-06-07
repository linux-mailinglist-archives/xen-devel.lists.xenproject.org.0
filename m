Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2FB1F0F39
	for <lists+xen-devel@lfdr.de>; Sun,  7 Jun 2020 21:40:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ji17u-0001VO-2C; Sun, 07 Jun 2020 19:38:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wL1b=7U=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1ji17s-0001VI-OJ
 for xen-devel@lists.xenproject.org; Sun, 07 Jun 2020 19:38:36 +0000
X-Inumbo-ID: 767c7732-a8f6-11ea-9ad7-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 767c7732-a8f6-11ea-9ad7-bc764e2007e4;
 Sun, 07 Jun 2020 19:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QALyNa81wN1+jbk1jaOitCHDLdzVJ6j388dugtZe+10=; b=WV0WD+BJoOsXG8XXEpX9iwxgO
 o80SEip/NhMVmfx0mhnS8R/2rIpk+DbbjjRKZ3WcwkK4rJfNTXM2KwvTfZwCuZhrASjv1wE4C3Dlw
 zvPDBoYQ4AWcKZJyps7YSYTv9qg9NU4h3fW4JBWD7na8G505yKnxvZaVlsDYzhV+qSaG0=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ji17k-0005eY-Nv; Sun, 07 Jun 2020 19:38:28 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ji17k-0000fV-By; Sun, 07 Jun 2020 19:38:28 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1ji17k-0001vZ-BM; Sun, 07 Jun 2020 19:38:28 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150906-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 150906: FAIL
X-Osstest-Failures: linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:<job
 status>:broken:regression
 linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:host-install(4):broken:heisenbug
 linux-linus:test-armhf-armhf-xl-rtds:guest-start:fail:heisenbug
 linux-linus:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:xen-boot:fail:heisenbug
 linux-linus:test-amd64-amd64-xl-qemut-debianhvm-amd64:xen-boot:fail:heisenbug
 linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:capture-logs(5):broken:nonblocking
 linux-linus:test-amd64-amd64-xl-rtds:guest-localmigrate/x10:fail:nonblocking
 linux-linus:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-rtds:guest-localmigrate:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: linux=3b69e8b4571125bec1f77f886174fe6cab6b9d75
X-Osstest-Versions-That: linux=aaa2faab4ed8e5fe0111e04d6e168c028fe2987f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 07 Jun 2020 19:38:28 +0000
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

flight 150906 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150906/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-ws16-amd64    <job status>          broken in 150901

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-qemuu-ws16-amd64 4 host-install(4) broken in 150901 pass in 150906
 test-armhf-armhf-xl-rtds     12 guest-start      fail in 150901 pass in 150906
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 7 xen-boot fail pass in 150901
 test-amd64-amd64-xl-qemut-debianhvm-amd64  7 xen-boot      fail pass in 150901

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-ws16-amd64 5 capture-logs(5) broken in 150901 blocked in 150898
 test-amd64-amd64-xl-rtds  18 guest-localmigrate/x10 fail in 150901 like 150898
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail in 150901 never pass
 test-amd64-amd64-xl-rtds     16 guest-localmigrate           fail  like 150891
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 150898
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 150898
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop            fail like 150898
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 150898
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 150898
 test-armhf-armhf-xl-rtds     16 guest-start/debian.repeat    fail  like 150898
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 150898
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 150898
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 150898
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                3b69e8b4571125bec1f77f886174fe6cab6b9d75
baseline version:
 linux                aaa2faab4ed8e5fe0111e04d6e168c028fe2987f

Last test of basis   150898  2020-06-06 15:40:08 Z    1 days
Testing same since   150901  2020-06-07 02:54:09 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alan Mikhak <alan.mikhak@sifive.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alex Deucher <alexdeucher@gmail.com>
  Alexandru Gagniuc <mr.nuke.me@gmail.com>
  Alexei Starovoitov <ast@kernel.org>
  Aman Sharma <amanharitsh123@gmail.com>
  Anders Roxell <anders.roxell@linaro.org>
  Andrew Murray <andrew.murray@arm.com>
  Ani Sinha <ani@anisinha.ca>
  Ard Biesheuvel <ardb@kernel.org>
  Arnd Bergmann <arnd@arndb.de>
  ashimida <ashimida@linux.alibaba.com>
  Ashok Raj <ashok.raj@intel.com>
  Bin Meng <bin.meng@windriver.com>
  Bjorn Helgaas <bhelgaas@google.com>
  Boris Burkov <boris@bur.io>
  Brian Cain <bcain@codeaurora.org>
  Bryce Willey <Bryce.Steven.Willey@gmail.com>
  Catalin Marinas <catalin.marinas@arm.com>
  Changbin Du <changbin.du@gmail.com>
  Christian König <christian.koenig@amd.com>
  Christoph Hellwig <hch@lst.de>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Colin Ian King <colin.king@canonical.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Darrel Goeddel <dgoeddel@forcepoint.com>
  Dave Jiang <dave.jiang@intel.com>
  David Rientjes <rientjes@google.com>
  David.Laight@aculab.com (big endian system concerns)
  Denis Efremov <efremov@linux.com>
  Dinghao Liu <dinghao.liu@zju.edu.cn>
  Dominik Brodowski <linux@dominikbrodowski.net>
  Erwan Velu <e.velu@criteo.com>
  Florian Fainelli <f.fainelli@gmail.com>
  Gaku Inami <gaku.inami.xw@bp.renesas.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Gustavo A. R. Silva <gustavoars@kernel.org>
  Gustavo Pimentel <gustavo.pimentel@synopsys.com>
  Huang Rui <ray.huang@amd.com>
  Jason Yan <yanaijie@huawei.com>
  Jay Fang <f.fangjian@huawei.com>
  Jean Delvare <jdelvare@suse.de>
  Jim Quinlan <jquinlan@broadcom.com>
  Jingoo Han <jingoohan1@gmail.com>
  Jiri Slaby <jslaby@suse.cz>
  Joerg Roedel <jroedel@suse.de>
  Jon Derrick <jonathan.derrick@intel.com>
  Jonas Zeiger <jonas.zeiger@talpidae.net>
  Josh Poimboeuf <jpoimboe@redhat.com>
  Kai-Heng Feng <kai.heng.feng@canonical.com>
  Kalle Valo <kvalo@codeaurora.org> # wireless
  Kazufumi Ikeda <kaz-ikeda@xc.jp.nec.com>
  Kevin Buettner <kevinb@redhat.com>
  Kishon Vijay Abraham I <kishon@ti.com>
  Krzysztof Kozlowski <krzk@kernel.org>
  Krzysztof Struczynski <krzysztof.struczynski@huawei.com>
  Krzysztof Wilczynski <kw@linux.com>
  Krzysztof Wilczyński <kw@linux.com>
  Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
  Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Lai Jiangshan <laijs@linux.alibaba.com>
  Li Zefan <lizefan@huawei.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
  Lukas Bulwahn <lukas.bulwahn@gmail.com>
  Maninder Singh <maninder1.s@samsung.com>
  Marc Zyngier <maz@kernel.org>
  Marcos Scriven <marcos@scriven.org>
  Marek Behún <marek.behun@nic.cz>
  Marek Szyprowski <m.szyprowski@samsung.com>
  Marek Vasut <marek.vasut+renesas@gmail.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Mathias Nyman <mathias.nyman@linux.intel.com>
  Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
  Mika Westerberg <mika.westerberg@linux.intel.com>
  Mika Westerberg <mika.westerberg@linux.intel.com> # thunderbolt
  Mikulas Patocka <mikulas@twibright.com>
  Mimi Zohar <zohar@linux.ibm.com>
  Nathan Chancellor <natechancellor@gmail.com>
  Nathan Chancellor <natechancellor@gmail.com> [build]
  Nick Desaulniers <ndesaulniers@google.com>
  Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
  Pali Rohár <pali@kernel.org>
  Peter Collingbourne <pcc@google.com>
  Rich Felker <dalias@libc.org>
  Rob Herring <robh@kernel.org>
  Roberto Sassu <roberto.sassu@huawei.com>
  Romain Naour <romain.naour@gmail.com>
  Sam Ravnborg <sam@ravnborg.org>
  Sean Fu <fxinrong@gmail.com>
  Sebastian Andrzej Siewior <bigeasy@linutronix.de>
  Sedat Dilek <sedat.dilek@gmail.com>
  Siddharth Gupta <sidgup@codeaurora.org>
  Stefan Wahren <stefan.wahren@i2se.com>
  Steven Rostedt (VMware) <rostedt@goodmis.org>
  Tejun Heo <tj@kernel.org>
  Thierry Reding <treding@nvidia.com>
  Thomas Petazzoni <thomas.petazzoni@bootlin.com>
  Tom Joseph <tjoseph@cadence.com>
  Tomasz Maciej Nowak <tmn505@gmail.com>
  Valdis Kl ē tnieks <valdis.kletnieks@vt.edu>
  Valdis Kletnieks <valdis.kletnieks@vt.edu>
  Vaneet Narang <v.narang@samsung.com>
  Vidya Sagar <vidyas@nvidia.com>
  Wei Hu <weh@microsoft.com>
  Wei Liu <wei.liu@kernel.org>
  Wei Yongjun <weiyongjun1@huawei.com>
  Will Deacon <will@kernel.org>
  Xiaochun Lee <lixc17@lenovo.com>
  Yicong Yang <yangyicong@hisilicon.com>
  Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Zefan Li <lizefan@huawei.com>
  Zhang Qiang <qiang.zhang@windriver.com>
  Zou Wei <zou_wei@huawei.com>

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
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            fail    
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
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    fail    
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

broken-job test-amd64-amd64-xl-qemuu-ws16-amd64 broken

Not pushing.

(No revision log; it would be 6054 lines long.)

