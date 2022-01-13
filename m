Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F9448E04F
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 23:34:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257416.442257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n88eu-0001hP-U6; Thu, 13 Jan 2022 22:33:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257416.442257; Thu, 13 Jan 2022 22:33:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n88eu-0001e7-Px; Thu, 13 Jan 2022 22:33:28 +0000
Received: by outflank-mailman (input) for mailman id 257416;
 Thu, 13 Jan 2022 22:33:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n88et-0001dx-P6; Thu, 13 Jan 2022 22:33:27 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n88et-0007iK-LC; Thu, 13 Jan 2022 22:33:27 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n88et-0001nV-D9; Thu, 13 Jan 2022 22:33:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1n88et-0000vm-CB; Thu, 13 Jan 2022 22:33:27 +0000
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
	bh=znODPzWfRMul3P4wzRVzvl+HHrlFE95OWQzRw3rYmyQ=; b=fFQjEXjBssd0VeYHciZWsfd4cy
	w408d42xZpN5EZ6xDkmF26sdf33rDuPAdWZob+bK9NfObRth3As2LJxIKOZaGVRJIn5pu7v62dsw0
	OrYAw49cRnRP3DqZnbubalKBLNc8E3KfcdNqnGKvscT1nuRaCMQ5Cy51kwg85N8ycyqk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-167684-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 167684: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-arm64-arm64-xl-vhd:xen-boot:fail:heisenbug
    linux-linus:test-amd64-amd64-freebsd12-amd64:guest-localmigrate/x10:fail:heisenbug
    linux-linus:test-amd64-amd64-libvirt:guest-start/debian.repeat:fail:heisenbug
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:leak-check/check:fail:heisenbug
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=455e73a07f6e288b0061dfcf4fcf54fa9fe06458
X-Osstest-Versions-That:
    linux=81ff0be4b9e3bcfee022d71cf89d72f7e2ed41ba
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 13 Jan 2022 22:33:27 +0000

flight 167684 linux-linus real [real]
flight 167691 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/167684/
http://logs.test-lab.xenproject.org/osstest/logs/167691/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-arm64-arm64-xl-vhd       8 xen-boot            fail pass in 167691-retest
 test-amd64-amd64-freebsd12-amd64 19 guest-localmigrate/x10 fail pass in 167691-retest
 test-amd64-amd64-libvirt 20 guest-start/debian.repeat fail pass in 167691-retest
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 21 leak-check/check fail pass in 167691-retest

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-vhd     14 migrate-support-check fail in 167691 never pass
 test-arm64-arm64-xl-vhd 15 saverestore-support-check fail in 167691 never pass
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 167679
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 167679
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 167679
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 167679
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 167679
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 167679
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 167679
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 167679
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
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
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                455e73a07f6e288b0061dfcf4fcf54fa9fe06458
baseline version:
 linux                81ff0be4b9e3bcfee022d71cf89d72f7e2ed41ba

Last test of basis   167679  2022-01-12 19:42:44 Z    1 days
Testing same since   167684  2022-01-13 07:47:42 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abel Vesa <abel.vesa@nxp.com>
  Adam Ford <aford173@gmail.com>
  Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
  Alain Volmat <avolmat@me.com>
  Alison Schofield <alison.schofield@intel.com>
  Amir Goldstein <amir73il@gmail.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
  Anton Bambura <jenneron@protonmail.com> # ASUS TF701T
  Ard Biesheuvel <ardb@kernel.org>
  Bartosz Golaszewski <brgl@bgdev.pl>
  Baruch Siach <baruch@tkos.co.il>
  Ben Widawsky <ben.widawsky@intel.com>
  Biju Das <biju.das.jz@bp.renesas.com>
  Bjorn Andersson <bjorn.andersson@linaro.org>
  Bjorn Helgaas <bhelgaas@google.com>
  Borislav Petkov <bp@suse.de>
  Cai Huoqing <caihuoqing@baidu.com>
  Changcheng Deng <deng.changcheng@zte.com.cn>
  Chanwoo Choi <cw00.choi@samsung.com>
  ChiYuan Huang <cy_huang@richtek.com>
  Christian Hewitt <christianshewitt@gmail.com>
  Christoph Hellwig <hch@lst.de>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Colin Ian King <colin.i.king@gmail.com>
  Colin Ian King <colin.i.king@googlemail.com>
  Conor Dooley <conor.dooley@microchip.com>
  Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
  Daire Byrne <daire@dneg.com> # nfs
  Damien Le Moal <damien.lemoal@opensource.wdc.com>
  Dan Williams <dan.j.williams@intel.com>
  Dave Hansen <dave.hansen@linux.intel.com>
  Dave Kleikamp <dave.kleikamp@oracle.com>
  Dave Wysochanski <dwysocha@redhat.com>
  Dave Wysochanski <dwysocha@redhat.com> # nfs
  David Heidelberg <david@ixit.cz>
  David Howells <dhowells@redhat.com>
  David Mosberger-Tang <davidm@egauge.net>
  David Virag <virag.david003@gmail.com>
  Dillon Min <dillon.minfei@gmail.com>
  Dinh Nguyen <dinguyen@kernel.org>
  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Dmitry Osipenko <digetx@gmail.com>
  Dominique Martinet <asmadeus@codewreck.org>
  Dominique Martinet <asmadeus@codewreck.org> # 9p
  Eric Dumazet <edumazet@google.com>
  Florian Fainelli <f.fainelli@gmail.com>
  Frank Rowand <frank.rowand@sony.com>
  Gabriel Fernandez <gabriel.fernandez@foss.st.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Geert Uytterhoeven <geert@linux-m68k.org>
  Gene Chen <gene_chen@richtek.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Gregory Fong <gregory.0xf0@gmail.com>
  Guenter Roeck <linux@roeck-us.net>
  Guo Ren <guoren@linux.alibaba.com>
  Hans de Goede <hdegoede@redhat.com>
  Hector Martin <marcan@marcan.st>
  Horatiu Vultur <horatiu.vultur@microchip.com>
  Hui Wang <hui.wang@canonical.com>
  Ira Weiny <ira.weiny@intel.com>
  Jacek Anaszewski <jacek.anaszewski@gmail.com>
  Jan Beulich <jbeulich@suse.com>
  Jan Kara <jack@suse.cz>
  Jason Wang <jasowang@redhat.com>
  Jean-Philippe Brucker <jean-philippe@linaro.org>
  Jeff Layton <jlayton@kernel.org>
  Jeff Layton <jlayton@kernel.org> # ceph
  Jeffle Xu <jefflexu@linux.alibaba.com>
  Jerome Brunet <jbrunet@baylibre.com>
  Jim Quinlan <jim2101024@gmail.com>
  Joerg Roedel <jroedel@suse.de>
  John Donnelly <john.p.donnelly@oracle.com>
  John Garry <john.garry@huawei.com>
  John Garry via iommu <iommu@lists.linux-foundation.org>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Juergen Gross <jgross@suse.com>
  kafs-testing@auristor.com
  kafs-testing@auristor.com # afs
  Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>
  Kees Cook <keescook@chromium.org>
  Kefeng Wang <wangkefeng.wang@huawei.com>
  Konrad Dybcio <konrad.dybcio@somainline.org>
  Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Lee Jones <lee.jones@linaro.org>
  Like Xu <like.xu@linux.intel.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Lu Baolu <baolu.lu@linux.intel.com>
  Marc Zyngier <maz@kernel.org>
  Marek Szyprowski <m.szyprowski@samsung.com>
  Marijn Suijten <marijn.suijten@somainline.org>
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>
  Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
  Matthew Wilcox (Oracle) <willy@infradead.org>
  Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
  Maxim Levitsky <mlevitsk@redhat.com>
  Maxime Ripard <maxime@cerno.tech>
  Maíra Canal <maira.canal@usp.br>
  Merlijn Wajer <merlijn@wizzup.org>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael S. Tsirkin <mst@redhat.com>
  Michael Turquette <mturquette@baylibre.com>
  Mike Rapoport <rppt@kernel.org>
  Mike Snitzer <snitzer@redhat.com>
  Miklos Szeredi <mszeredi@redhat.com>
  Nathan Chancellor <nathan@kernel.org>
  NeilBrown <neilb@suse.de>
  Nick Desaulniers <ndesaulniers@google.com>
  Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20 and TK1 T124
  Nicolas Ferre <nicolas.ferre@microchip.com>
  Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
  Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
  Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Paul Cercueil <paul@crapouillou.net>
  Paul Fertser <fercerpav@gmail.com> # PAZ00 T20
  Paul Menzel <pmenzel@molgen.mpg.de>
  Pavel Machek <pavel@ucw.cz>
  Peng Fan <peng.fan@nxp.com>
  Peter Geis <pgwipeout@gmail.com> # Ouya T30
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Peter Zijlstra <peterz@infradead.org>
  Philipp Zabel <p.zabel@pengutronix.de>
  Pingfan Liu <kernelfans@gmail.com>
  Qin Jian <qinjian@cqplus1.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Rafał Miłecki <rafal@milecki.pl>
  Randy Dunlap <rdunlap@infradead.org>
  Rikard Falkeborn <rikard.falkeborn@gmail.com>
  Rob Clark <robdclark@chromium.org>
  Rob Herring <robh@kernel.org>
  Robin Murphy <robin.muephy@arm.com>
  Robin Murphy <robin.murphy@arm.com>
  Sai Prakash Ranjan <quic_saipraka@quicinc.com>
  Sam Protsenko <semen.protsenko@linaro.org>
  Sam Ravnborg <sam@ravnborg.org>
  Sam Shih <sam.shih@mediatek.com>
  Samuel Holland <samuel@sholland.org>
  Sander Vanheule <sander@svanheule.net>
  Sean Christopherson <seanjc@google.com>
  Sergio Paracuellos <sergio.paracuellos@gmail.com>
  Shawn Guo <shawn.guo@linaro.org>
  Shiyang Ruan <ruansy.fnst@fujitsu.com>
  Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
  Sicelo A. Mhlongo <absicsz@gmail.com>
  Stanislav Jakubek <stano.jakubek@gmail.com>
  Stephen Boyd <sboyd@kernel.org>
  Stephen Boyd <swboyd@chromium.org>
  Sudeep Holla <sudeep.holla@arm.com>
  Suzuki K Poulose <suzuki.poulose@arm.com>
  Sven Schuchmann <schuchmann@schleissheimer.de>
  Sylwester Nawrocki <s.nawrocki@samsung.com>
  Taniya Das <tdas@codeaurora.org>
  Thierry Reding <treding@nvidia.com>
  Tony Lindgren <tony@atomide.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Ulf Hansson <ulf.hansson@linaro.org> # For MMC
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
  Vinod Koul <vkoul@kernel.org>
  Vishal Verma <vishal.l.verma@intel.com>
  Vivek Goyal <vgoyal@redhat.com>
  Will Deacon <will@kernel.org>
  Will McVicker <willmcvicker@google.com>
  Wolfram Sang <wsa+renesas@sang-engineering.com>
  Xiang wangx <wangxiang@cdjrlc.com>
  Xie Yongji <xieyongji@bytedance.com>
  Xiongfeng Wang <wangxiongfeng2@huawei.com>
  Yang Li <yang.lee@linux.alibaba.com>
  Yihao Han <hanyihao@vivo.com>
  Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Yunfei Wang <yf.wang@mediatek.com>
  Yury Norov <yury.norov@gmail.com>
  Zhen Lei <thunder.leizhen@huawei.com>
  Zhou Wang <wangzhou1@hisilicon.com>
  Zhu Lingshan <lingshan.zhu@intel.com>

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
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           fail    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-freebsd11-amd64                             pass    
 test-amd64-amd64-freebsd12-amd64                             fail    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     fail    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-libvirt-qcow2                               pass    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      fail    
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
   81ff0be4b9e3..455e73a07f6e  455e73a07f6e288b0061dfcf4fcf54fa9fe06458 -> tested/linux-linus

