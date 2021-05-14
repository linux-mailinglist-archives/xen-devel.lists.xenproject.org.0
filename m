Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 110B1381370
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 23:56:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127595.239833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhfmz-0004bP-1Y; Fri, 14 May 2021 21:56:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127595.239833; Fri, 14 May 2021 21:56:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhfmy-0004ZP-S6; Fri, 14 May 2021 21:56:08 +0000
Received: by outflank-mailman (input) for mailman id 127595;
 Fri, 14 May 2021 21:56:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lhfmx-0004ZF-BP; Fri, 14 May 2021 21:56:07 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lhfmx-00027L-51; Fri, 14 May 2021 21:56:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lhfmw-0006qr-Mf; Fri, 14 May 2021 21:56:06 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lhfmw-0003Nd-MC; Fri, 14 May 2021 21:56:06 +0000
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
	bh=PBq8CQWLVDaiYCYkQW6BWiCc3Xm2xjsazOUG0Gr2vas=; b=AUpwWYslMLUbdudj4lvLy7+RRA
	DW0oQsftrdG8DSGks4wD1PlYctJFxhKNYnu3clRaKrUD6mCrHgRmGC5LxNUmmvF1h/vpU9SpUVQ2q
	E2cMUXNWqAShBp45FJuqsBBPmSLUAZMTYJ6Zp/JhbFPhWxPa3KUGzUl4ylyt1f0SQado=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161947-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 161947: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-5.4:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:allowable
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
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
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=b82e5721a17325739adef83a029340a63b53d4ad
X-Osstest-Versions-That:
    linux=16022114de9869743d6304290815cdb8a8c7deaa
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 14 May 2021 21:56:06 +0000

flight 161947 linux-5.4 real [real]
flight 161951 linux-5.4 real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/161947/
http://logs.test-lab.xenproject.org/osstest/logs/161951/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail pass in 161951-retest

Regressions which are regarded as allowable (not blocking):
 test-armhf-armhf-xl-rtds    18 guest-start/debian.repeat fail REGR. vs. 161918

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 161918
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 161918
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 161918
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 161918
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 161918
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 161918
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 161918
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 161918
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 161918
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 161918
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 161918
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
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
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 linux                b82e5721a17325739adef83a029340a63b53d4ad
baseline version:
 linux                16022114de9869743d6304290815cdb8a8c7deaa

Last test of basis   161918  2021-05-12 12:31:47 Z    2 days
Testing same since   161947  2021-05-14 08:11:45 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alain Volmat <alain.volmat@foss.st.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alex Williamson <alex.williamson@redhat.com>
  Alexander Lobakin <alobakin@pm.me>
  Alexandre Belloni <alexandre.belloni@bootlin.com>
  Anders Trier Olesen <anders.trier.olesen@gmail.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andrew Scull <ascull@google.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Antonio Borneo <antonio.borneo@foss.st.com>
  Archie Pusaka <apusaka@chromium.org>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Arnd Bergmann <arnd@arndb.de>
  Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
  Arun Easi <aeasi@marvell.com>
  Ashok Raj <ashok.raj@intel.com>
  Athira Rajeev <atrajeev@linux.vnet.ibm.com>
  Badhri Jagan Sridharan <badhri@google.com>
  Bard Liao <yung-chuan.liao@linux.intel.com>
  Bjorn Andersson <bjorn.andersson@linaro.org>
  Bjorn Helgaas <bhelgaas@google.com>
  Boris Brezillon <boris.brezillon@collabora.com>
  Borislav Petkov <bp@suse.de>
  Brian King <brking@linux.vnet.ibm.com>
  Brian Norris <computersforpeace@gmail.com>
  Chanwoo Choi <cw00.choi@samsung.com>
  Chen Huang <chenhuang5@huawei.com>
  Chen Hui <clare.chenhui@huawei.com>
  Chen-Yu Tsai <wens@csie.org>
  Christian Borntraeger <borntraeger@de.ibm.com>
  Christian König <christian.koenig@amd.com>
  Christoph Hellwig <hch@lst.de>
  Christophe Leroy <christophe.leroy@csgroup.eu>
  Chunfeng Yun <chunfeng.yun@mediatek.com>
  Claudio Imbrenda <imbrenda@linux.ibm.com>
  Colin Ian King <colin.king@canonical.com>
  Cédric Le Goater <clg@kaod.org>
  Dan Carpenter <dan.carpenter@oracle.com>
  David Hildenbrand <david@redhat.com>
  David S. Miller <davem@davemloft.net>
  Devesh Sharma <devesh.sharma@broadcom.com>
  Dong Aisheng <aisheng.dong@nxp.com>
  Eric Dumazet <edumazet@google.com>
  Erwan Le Ray <erwan.leray@foss.st.com>
  Fabian Vogt <fabian@ritter-vogt.de>
  Fabrice Gasnier <fabrice.gasnier@foss.st.com>
  Felix Kuehling <Felix.Kuehling@amd.com>
  Finn Thain <fthain@telegraphics.com.au>
  Florian Fainelli <f.fainelli@gmail.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Geert Uytterhoeven <geert@linux-m68k.org>
  gexueyuan <gexueyuan@gmail.com>
  Giovanni Cabiddu <giovanni.cabiddu@intel.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Greg Kurz <groug@kaod.org>
  Gregory CLEMENT <gregory.clement@bootlin.com>
  Hannes Reinecke <hare@suse.de>
  Hans de Goede <hdegoede@redhat.com>
  Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Harry Wentland <harry.wentland@amd.com>
  He Ying <heying24@huawei.com>
  Heikki Krogerus <heikki.krogerus@linux.intel.com>
  Heiko Carstens <hca@linux.ibm.com>
  Heming Zhao <heming.zhao@suse.com>
  Herbert Xu <herbert@gondor.apana.org.au>
  Hulk Robot <hulkrobot@huawei.com>
  Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
  Ingo Molnar <mingo@kernel.org>
  Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
  Jakub Kicinski <kubakici@wp.pl>
  Jan Glauber <jglauber@digitalocean.com>
  Jane Chu <jane.chu@oracle.com>
  Jason Gunthorpe <jgg@nvidia.com>
  Jason Self <jason@bluehome.net>
  Jens Axboe <axboe@kernel.dk>
  Jia Zhou <zhou.jia2@zte.com.cn>
  Jia-Ju Bai <baijiaju1990@gmail.com>
  Jiri Kosina <jkosina@suse.cz>
  Joel Stanley <joel@jms.id.au>
  Johan Hovold <johan@kernel.org>
  Johannes Berg <johannes.berg@intel.com>
  John Cox <jc@kynesim.co.uk>
  John Garry <john.garry@huawei.com>
  Jon Hunter <jonathanh@nvidia.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Jonathon Reinhart <jonathon.reinhart@gmail.com>
  Jordan Niethe <jniethe5@gmail.com>
  Juergen Gross <jgross@suse.com>
  Kai-Heng Feng <kai.heng.feng@canonical.com>
  Kalle Valo <kvalo@codeaurora.org>
  Krzysztof Kozlowski <krzk@kernel.org>
  Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
  Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
  Larry Finger <Larry.Finger@lwfinger.net>
  Lee Jones <lee.jones@linaro.org>
  Lin Ma <linma@zju.edu.cn>
  Linus Lüssing <linus.luessing@c0d3.blue>
  Linus Torvalds <torvalds@linux-foundation.org>
  Lukasz Majczak <lma@semihalf.com>
  Lv Yunlong <lyl2019@mail.ustc.edu.cn>
  Maciej W. Rozycki <macro@orcam.me.uk>
  Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
  Marc Zyngier <maz@kernel.org>
  Marcel Holtmann <marcel@holtmann.org>
  Marek Behún <kabel@kernel.org>
  Mark Brown <broonie@kernel.org>
  Martin K. Petersen <martin.petersen@oracle.com>
  Martin Schiller <ms@dev.tdt.de>
  Masami Hiramatsu <mhiramat@kernel.org>
  Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  Maxim Mikityanskiy <maxtram95@gmail.com>
  Meng Li <Meng.Li@windriver.com>
  Michael Chan <michael.chan@broadcom.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael Kelley <mikelley@microsoft.com>
  Michael Walle <michael@walle.cc>
  Michal Kalderon <michal.kalderon@marvell.com>
  Miklos Szeredi <mszeredi@redhat.com>
  Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
  Miquel Raynal <miquel.raynal@bootlin.com>
  Nathan Chancellor <nathan@kernel.org>
  Nicholas Piggin <npiggin@gmail.com>
  Niklas Cassel <niklas.cassel@wdc.com>
  Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Oliver Neukum <oneukum@suse.com>
  Or Cohen <orcohen@paloaltonetworks.com>
  Otavio Pontes <otavio.pontes@intel.com>
  Pali Rohár <pali@kernel.org>
  Pan Bian <bianpan2016@163.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Paul Durrant <pdurrant@amazon.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Petr Machata <petrm@nvidia.com>
  Philip Soares <philips@netisense.com>
  Phillip Potter <phil@philpotter.co.uk>
  Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
  Ping-Ke Shih <pkshih@realtek.com>
  Potnuri Bharat Teja <bharat@chelsio.com>
  Qinglang Miao <miaoqinglang@huawei.com>
  Quanyang Wang <quanyang.wang@windriver.com>
  Quentin Perret <qperret@google.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Rafał Miłecki <rafal@milecki.pl>
  Rander Wang <rander.wang@intel.com>
  Randy Dunlap <rdunlap@infradead.org>
  Randy Dunlap <rdunlap@infradead.org> # build-tested
  Richard Weinberger <richard@nod.at>
  Sabrina Dubroca <sd@queasysnail.net>
  Sagi Grimberg <sagi@grimberg.me>
  Salil Mehta <salil.mehta@huawei.com>
  Sameer Pujar <spujar@nvidia.com>
  Sami Loone <sami@loone.fi>
  Sasha Levin <sashal@kernel.org>
  Sean Christopherson <seanjc@google.com>
  Sebastian Reichel <sebastian.reichel@collabora.com>
  Sergey Shtylyov <s.shtylyov@omprussia.ru>
  Shawn Guo <shawn.guo@linaro.org>
  Shengjiu Wang <shengjiu.wang@nxp.com>
  Shiraz Saleem <shiraz.saleem@intel.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Sindhu Devale <sindhu.devale@intel.com>
  Song Liu <song@kernel.org>
  Song Liu <songliubraving@fb.com>
  Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
  Stanislav Yakovlev <stas.yakovlev@gmail.com>
  Stefano Garzarella <sgarzare@redhat.com>
  Steffen Dirkwinkel <s.dirkwinkel@beckhoff.com>
  Stephen Boyd <sboyd@kernel.org>
  Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>
  Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
  syzbot <syzbot+43e93968b964e369db0b@syzkaller.appspotmail.com>
  Taehee Yoo <ap420073@gmail.com>
  Takashi Iwai <tiwai@suse.de>
  Tao Ren <rentao.bupt@gmail.com>
  Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Toke Høiland-Jørgensen <toke@redhat.com>
  Tomasz Maciej Nowak <tmn505@gmail.com>
  Tong Zhang <ztong0001@gmail.com>
  Tyrel Datwyler <tyreld@linux.ibm.com>
  Vinod Koul <vkoul@kernel.org>
  Viresh Kumar <viresh.kumar@linaro.org>
  Vitaly Chikunov <vt@altlinux.org>
  Vladimir Barinov <vladimir.barinov@cogentembedded.com>
  Waiman Long <longman@redhat.com>
  Wang Li <wangli74@huawei.com>
  Wang Wensheng <wangwensheng4@huawei.com>
  Wei Liu <wei.liu@kernel.org>
  Will Deacon <will@kernel.org>
  William A. Kennington III <wak@google.com>
  William Breathitt Gray <vilhelm.gray@gmail.com>
  Wolfram Sang <wsa@kernel.org>
  Xie He <xie.he.0141@gmail.com>
  Xin Long <lucien.xin@gmail.com>
  Yang Yingliang <yangyingliang@huawei.com>
  Yaqii Wu <yaqii.wu@mediatek.com>
  Ye Bin <yebin10@huawei.com>
  Yi Wang <wang.yi59@zte.com.cn>
  Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Zhao Heming <heming.zhao@suse.com>
  Zhenyu Wang <zhenyuw@linux.intel.com>
  Álvaro Fernández Rojas <noltari@gmail.com>

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
   16022114de98..b82e5721a173  b82e5721a17325739adef83a029340a63b53d4ad -> tested/linux-5.4

