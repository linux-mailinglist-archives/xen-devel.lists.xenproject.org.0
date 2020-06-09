Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3F91F3A61
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 14:06:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jid1D-00011M-E0; Tue, 09 Jun 2020 12:06:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aKNw=7W=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jid1B-00011H-9w
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 12:06:13 +0000
X-Inumbo-ID: 9979c043-aa49-11ea-b314-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9979c043-aa49-11ea-b314-12813bfff9fa;
 Tue, 09 Jun 2020 12:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uGDCH4ibAOaHLpT9vIFDI4jH+KUgqA+j6v79uOlZbT4=; b=5JdwLHTBawE7/auqzwZmNH7Jj
 i5lUfxhGVNjqQtq9vQ/G4aQzSnKmzADgVsmGBtSLjWN+Ioh0DzP+VIKwQSTdCvar900+ZLvraNsr0
 hjKpilQ37rihL3FrKTXPvjfikhg0adT4E2B9lSv5qKaNiR/5ye2wx+OLE0lgHOWRlbH5s=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jid16-0005v3-8j; Tue, 09 Jun 2020 12:06:08 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jid16-0007Lw-08; Tue, 09 Jun 2020 12:06:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jid15-0004Tu-Vq; Tue, 09 Jun 2020 12:06:07 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150931-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 150931: tolerable FAIL - PUSHED
X-Osstest-Failures: linux-linus:test-amd64-amd64-xl-rtds:guest-localmigrate/x10:fail:nonblocking
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
 linux-linus:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
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
X-Osstest-Versions-This: linux=abfbb29297c27e3f101f348dc9e467b0fe70f919
X-Osstest-Versions-That: linux=9aa900c8094dba7a60dc805ecec1e9f720744ba1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 09 Jun 2020 12:06:07 +0000
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

flight 150931 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150931/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-rtds     18 guest-localmigrate/x10       fail  like 150910
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 150910
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 150910
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop            fail like 150910
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 150910
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 150910
 test-armhf-armhf-xl-rtds     16 guest-start/debian.repeat    fail  like 150910
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 150910
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 150910
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 150910
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
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
 linux                abfbb29297c27e3f101f348dc9e467b0fe70f919
baseline version:
 linux                9aa900c8094dba7a60dc805ecec1e9f720744ba1

Last test of basis   150910  2020-06-07 20:10:01 Z    1 days
Failing since        150920  2020-06-08 03:35:33 Z    1 days    3 attempts
Testing same since   150931  2020-06-09 00:40:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Yan, Zheng" <zyan@redhat.com>
  Ahmed Abdelsalam <ahabdels@gmail.com>
  Ahmed S. Darwish <a.darwish@linutronix.de>
  Aishwarya Ramakrishnan <aishwaryarj100@gmail.com>
  Al Viro <viro@zeniv.linux.org.uk>
  Alex Deucher <alexander.deucher@amd.com>
  Alex Deucher <alexdeucher@gmail.com>
  Alex Elder <elder@linaro.org>
  Alexander Fomichev <fomichev.ru@gmail.com>
  Alexander Lobakin <bloodyreaper@yandex.ru>
  Alexander Schmidt <alexs@linux.ibm.com>
  Alexandra Winter <wintera@linux.ibm.com>
  Alexandre Belloni <alexandre.belloni@bootlin.com>
  Allen Hubbe <allenbh@gmail.com>
  Alok Prasad <palok@marvell.com>
  Amelie Delaunay <amelie.delaunay@st.com>
  Amir Goldstein <amir73il@gmail.com>
  Amit Sahrawat <a.sahrawat@samsung.com>
  Andre Przywara <andre.przywara@arm.com>
  Andreas Gruenbacher <agruenba@redhat.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Anson Huang <Anson.Huang@nxp.com>
  Antoine Tenart <antoine.tenart@bootlin.com>
  Anupam Aggarwal <anupam.al@samsung.com>
  Arindam Nath <arindam.nath@amd.com>
  Arnaud Pouliquen <arnaud.pouliquen@st.com>
  Arnd Bergmann <arnd@arndb.de>
  Baolin Wang <baolin.wang7@gmail.com>
  Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
  Ben Skeggs <bskeggs@redhat.com>
  Ben Skeggs <skeggsb@gmail.com>
  Benjamin Gaignard <benjamin.gaignard@st.com>
  Bjorn Andersson <bjorn.andersson@linaro.org>
  Bjorn Helgaas <bhelgaas@google.com>
  Bob Peterson <rpeterso@redhat.com>
  Brian Cain <bcain@codeaurora.org>
  Bruno Thomsen <bruno.thomsen@gmail.com>
  Catalin Marinas <catalin.marinas@arm.com>
  Chen Zhou <chenzhou10@huawei.com>
  Chris Lew <clew@codeaurora.org>
  Chris Wilson <chris@chris-wilson.co.uk>
  Christian Borntraeger <borntraeger@de.ibm.com>
  Christoph Hellwig <hch@lst.de>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Chuhong Yuan <hslester96@gmail.com>
  Clement Leger <cleger@kalray.eu>
  Cong Wang <xiyou.wangcong@gmail.com>
  Corentin Labbe <clabbe@baylibre.com>
  Cornelia Huck <cohuck@redhat.com>
  Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Dan Murphy <dmurphy@ti.com>
  Daniel Drake <drake@endlessm.com>
  Dave Airlie <airlied@redhat.com>
  Dave Jiang <dave.jiang@intel.com>
  David Hildenbrand <david@redhat.com>
  David S. Miller <davem@davemloft.net>
  Dejin Zheng <zhengdejin5@gmail.com>
  Denis Efremov <efremov@linux.com>
  Ding Xiang <dingxiang@cmss.chinamobile.com>
  Eric Farman <farman@linux.ibm.com>
  Evan Green <evgreen@chromium.org>
  Evan Quan <evan.quan@amd.com>
  Farhan Ali <alifm@linux.ibm.com>
  Florian Fainelli <f.fainelli@gmail.com>
  Fritz Koenig <frkoenig@google.com>
  Fugang Duan <fugang.duan@nxp.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Geert Uytterhoeven <geert@linux-m68k.org>
  Gerald Schaefer <gerald.schaefer@de.ibm.com>
  Giuseppe Scrivano <gscrivan@redhat.com>
  Grace Kao <grace.kao@intel.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Greg Ungerer <gerg@linux-m68k.org>
  Guenter Roeck <linux@roeck-us.net>
  Guilherme G. Piccoli <gpiccoli@canonical.com>
  Gustavo A. R. Silva <gustavoars@kernel.org>
  Harald Freudenberger <freude@linux.ibm.com>
  Harry Wentland <harry.wentland@amd.com>
  Hauke Mehrtens <hauke@hauke-m.de>
  Heiner Kallweit <hkallweit1@gmail.com>
  Herbert Xu <herbert@gondor.apana.org.au>
  Hongbo Yao <yaohongbo@huawei.com>
  Ido Schimmel <idosch@mellanox.com>
  Igor Russkikh <irusskikh@marvell.com>
  Ilya Dryomov <idryomov@gmail.com>
  Jacob Pan <jacob.jun.pan@linux.intel.com>
  Jacopo Mondi <jacopo+renesas@jmondi.org>
  Jakub Kicinski <kuba@kernel.org>
  Jani Nikula <jani.nikula@intel.com>
  Jared Rossi <jrossi@linux.ibm.com>
  Jason J. Herne <jjherne@linux.ibm.com>
  Jason Yan <yanaijie@huawei.com>
  Jean-Philippe Brucker <jean-philippe@linaro.org>
  Jeff Layton <jlayton@kernel.org>
  Jerry Snitselaar <jsnitsel@redhat.com>
  Jesper Dangaard Brouer <brouer@redhat.com>
  Jessica Yu <jeyu@kernel.org>
  Jiasen Lin <linjiasen@hygon.cn>
  Jiri Benc <jbenc@redhat.com>
  Joerg Roedel <jroedel@suse.de>
  Johan Jonker <jbx6244@gmail.com>
  John Hubbard <jhubbard@nvidia.com>
  John Johansen <john.johansen@canonical.com>
  Jon Derrick <jonathan.derrick@intel.com>
  Jon Hunter <jonathanh@nvidia.com>
  Jon Maloy <jmaloy@redhat.com>
  Jon Mason <jdmason@kudzu.us>
  Jonathan Bakker <xc-racer2@live.ca>
  Jonathan Marek <jonathan@marek.ca>
  Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
  Jordan Crouse <jcrouse@codeaurora.org>
  Jules Irenge <jbi.octave@gmail.com>
  Julian Wiedmann <jwi@linux.ibm.com>
  Kalyan Thota <kalyan_t@codeaurora.org>
  kbuild test robot <lkp@intel.com>
  Kees Cook <keescook@chromium.org>
  Kevin P. Fleming <kevin+linux@km6g.us>
  Konrad Dybcio <konradybcio@gmail.com>
  Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
  Krishna Manikandan <mkrishn@codeaurora.org>
  Krzysztof Kozlowski <krzk@kernel.org>
  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Lars Povlsen <lars.povlsen@microchip.com>
  Light Hsieh <light.hsieh@mediatek.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Liu Yi L <yi.l.liu@intel.com>
  Liu, Yi L <yi.l.liu@intel.com>
  Logan Gunthorpe <logang@deltatee.com>
  Loic Pallardy <loic.pallardy@st.com>
  Lu Baolu <baolu.lu@linux.intel.com>
  Luis Chamberlain <mcgrof@kernel.org>
  Luis Henriques <lhenriques@suse.com>
  Maciej Grochowski <maciej.grochowski@pm.me>
  Manfred Spraul <manfred@colorfullife.com>
  Marek Szyprowski <m.szyprowski@samsung.com>
  Mark Salter <msalter@redhat.com>
  Markus Elfring <elfring@users.sourceforge.net>
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Mateusz Nosek <mateusznosek0@gmail.com>
  Mathieu Poirier <mathieu.poirier@linaro.org>
  Mauricio Faria de Oliveira <mfo@canonical.com>
  Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  Max Filippov <jcmvbkbc@gmail.com>
  Maxime Ripard <maxime@cerno.tech>
  Maxime Ripard <mripard@kernel.org>
  Michael S. Tsirkin <mst@redhat.com>
  Michal Hocko <mhocko@suse.com>
  Michal Vokáč <michal.vokac@ysoft.com>
  Mika Westerberg <mika.westerberg@linux.intel.com>
  Mike Rapoport <rppt@linux.ibm.com>
  Nathan Chancellor <natechancellor@gmail.com>
  Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
  Niklas Schnelle <schnelle@linux.ibm.com>
  Nirmoy Das <nirmoy.das@amd.com>
  Orson Zhai <orson.zhai@unisoc.com>
  Palmer Dabbelt <palmerdabbelt@google.com>
  Pankaj Gupta <pankaj.gupta.linux@gmail.com>
  Paolo Abeni <pabeni@redhat.com>
  Paul Cercueil <paul@crapouillou.net>
  Pavel Machek (CIP) <pavel@denx.de>
  Pavel Machek <pavel@ucw.cz>
  Petr Mladek <pmladek@suse.com>
  Petr Tesarik <ptesarik@suse.com>
  Pierre Morel <pmorel@linux.ibm.com>
  Qian Cai <cai@lca.pw>
  Qiushi Wu <wu000273@umn.edu>
  Rafael Aquini <aquini@redhat.com>
  Ran Wang <ran.wang_1@nxp.com>
  Rikard Falkeborn <rikard.falkeborn@gmail.com>
  Rishabh Bhatnagar <rishabhb@codeaurora.org>
  Rob Clark <robdclark@chromium.org>
  Rob Clark <robdclark@gmail.com>
  Rob Herring <robh@kernel.org>
  Robert Jarzmik <robert.jarzmik@free.fr>
  Roberto Sassu <roberto.sassu@huawei.com>
  Robin Murphy <robin.murphy@arm.com>
  Roelof Berg <rberg@berg-solutions.de>
  Rohit Maheshwari <rohitm@chelsio.com>
  Roy Spliet <nouveau@spliet.org>
  Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
  Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>
  Sameeh Jubran <sameehj@amazon.com>
  Samuel Zou <zou_wei@huawei.com>
  Sanjay R Mehta <sanju.mehta@amd.com>
  Sean Wang <sean.wang@mediatek.com>
  SeongJae Park <sjpark@amazon.de>
  Shawn Guo <shawn.guo@linaro.org>
  Sibi Sankar <sibis@codeaurora.org>
  Siddharth Gupta <sidgup@codeaurora.org>
  Sivaprakash Murugesan <sivaprak@codeaurora.org>
  Souptick Joarder <jrdr.linux@gmail.com>
  Stefano Garzarella <sgarzare@redhat.com>
  Suman Anna <s-anna@ti.com>
  Sven Schnelle <svens@linux.ibm.com>
  Tero Kristo <t-kristo@ti.com>
  Tero Kristo via iommu <iommu@lists.linux-foundation.org>
  Thierry Reding <treding@nvidia.com>
  Tiezhu Yang <yangtiezhu@loongson.cn>
  Tom Murphy <murphyt7@tcd.ie>
  Tuong Lien <tuong.t.lien@dektech.com.au>
  Vadim Pasternak <vadimp@mellanox.com>
  Valentin Longchamp <valentin@longchamp.me>
  Vasily Gorbik <gor@linux.ibm.com>
  Vasyl Gomonovych <gomonovych@gmail.com>
  Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
  Ville Syrjälä <ville.syrjala@linux.intel.com>
  Vinay Kumar Yadav <vinay.yadav@chelsio.com>
  Vineeth Vijayan <vneethv@linux.ibm.com>
  Vivek Trivedi <t.vivek@samsung.com>
  Vladimir Zapolskiy <vz@mleia.com>
  Vlastimil Babka <vbabka@suse.cz>
  Wang Hai <wanghai38@huawei.com>
  WANG Wenhu <wenhu.wang@vivo.com>
  Wei Liu <wei.liu@kernel.org>
  Wei Yongjun <weiyongjun1@huawei.com>
  Wesley Sheng <wesley.sheng@amd.com>
  Will Deacon <will@kernel.org>
  Wolfram Sang <wsa@kernel.org>
  Xiubo Li <xiubli@redhat.com>
  Yan, Zheng <zyan@redhat.com>
  Yangtao Li <tiny.windzz@gmail.com>
  Yong Wu <yong.wu@mediatek.com>
  yu kuai <yukuai3@huawei.com>
  YueHaibing <yuehaibing@huawei.com>
  Zhangfei Gao <zhangfei.gao@linaro.org>
  Zhenyu Wang <zhenyuw@linux.intel.com>
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
   9aa900c8094d..abfbb29297c2  abfbb29297c27e3f101f348dc9e467b0fe70f919 -> tested/linux-linus

