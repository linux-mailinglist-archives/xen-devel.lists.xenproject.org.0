Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2681A913C06
	for <lists+xen-devel@lfdr.de>; Sun, 23 Jun 2024 17:16:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746051.1153012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLOvb-0001J3-92; Sun, 23 Jun 2024 15:14:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746051.1153012; Sun, 23 Jun 2024 15:14:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLOvb-0001H5-5x; Sun, 23 Jun 2024 15:14:51 +0000
Received: by outflank-mailman (input) for mailman id 746051;
 Sun, 23 Jun 2024 15:14:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sLOvZ-0001Gv-Sn; Sun, 23 Jun 2024 15:14:49 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sLOvZ-00012W-H3; Sun, 23 Jun 2024 15:14:49 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sLOvZ-0000Oh-6n; Sun, 23 Jun 2024 15:14:49 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sLOvZ-00060E-6E; Sun, 23 Jun 2024 15:14:49 +0000
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
	bh=Khvq6iy5qh+FUFe5hd2DG7tQg+K1Yye2wNjQIO7wgGA=; b=6NUzigmeFjHNmplm6t7HUoivPW
	UPyNukvYSOV+UgYxvOzkvdoyqXxIXl9ixK0Mp6KKIxIJwFC8u1/6ZEJXUin1tisZn+mG0amLH7onQ
	xEJQofz+tqkqFZZT3Xmgg68wzOVfedX9qAs6TZPS78Di4L9pQIZDDVSBkzL8U2Ph9RWc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186460-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 186460: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-xl-raw:xen-boot:fail:heisenbug
    linux-linus:test-armhf-armhf-libvirt:xen-boot:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-pvhv2-amd:guest-start/debian.repeat:fail:heisenbug
    linux-linus:test-armhf-armhf-libvirt-vhd:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-examine:reboot:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:xen-boot:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=5f583a3162ffd9f7999af76b8ab634ce2dac9f90
X-Osstest-Versions-That:
    linux=50736169ecc8387247fe6a00932852ce7b057083
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 23 Jun 2024 15:14:49 +0000

flight 186460 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186460/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-xl-raw       8 xen-boot         fail in 186457 pass in 186460
 test-armhf-armhf-libvirt      8 xen-boot                   fail pass in 186457
 test-amd64-amd64-xl-pvhv2-amd 22 guest-start/debian.repeat fail pass in 186457

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt-vhd  8 xen-boot            fail in 186457 like 186437
 test-armhf-armhf-xl-credit1   8 xen-boot            fail in 186457 like 186437
 test-armhf-armhf-libvirt 16 saverestore-support-check fail in 186457 like 186437
 test-armhf-armhf-examine      8 reboot              fail in 186457 like 186437
 test-armhf-armhf-xl-rtds      8 xen-boot            fail in 186457 like 186437
 test-armhf-armhf-libvirt    15 migrate-support-check fail in 186457 never pass
 test-armhf-armhf-xl-qcow2   14 migrate-support-check fail in 186457 never pass
 test-armhf-armhf-xl-qcow2 15 saverestore-support-check fail in 186457 never pass
 test-armhf-armhf-xl-arndale   8 xen-boot                     fail  like 186437
 test-armhf-armhf-xl-qcow2     8 xen-boot                     fail  like 186437
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 186437
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 186437
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 186437
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 186437
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 186437
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass

version targeted for testing:
 linux                5f583a3162ffd9f7999af76b8ab634ce2dac9f90
baseline version:
 linux                50736169ecc8387247fe6a00932852ce7b057083

Last test of basis   186437  2024-06-20 20:10:42 Z    2 days
Failing since        186449  2024-06-21 18:42:38 Z    1 days    4 attempts
Testing same since   186457  2024-06-23 00:44:09 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abel Vesa <abel.vesa@linaro.org>
  Alan Stern <stern@rowland.harvard.edu>
  Alex Deucher <alexander.deucher@amd.com>
  Alexey Dobriyan <adobriyan@gmail.com>
  Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
  Andre Przywara <andre.przywara@arm.com>
  Andrew Jones <ajones@ventanamicro.com>
  Andy Shevchenko <andy.shevchenko@gmail.com>
  Anup Patel <anup@brainfault.org>
  Arnd Bergmann <arnd@arndb.de>
  Babu Moger <babu.moger@amd.com>
  Bard Liao <yung-chuan.liao@linux.intel.com>
  Bart Van Assche <bvanassche@acm.org>
  Bibo Mao <maobibo@loongson.cn>
  Biju Das <biju.das.jz@bp.renesas.com>
  Breno Leitao <leitao@debian.org>
  Chandan Babu R <chandanbabu@kernel.org>
  Charles Keepax <ckeepax@opensource.cirrus.com>
  Chen Wang <unicorn_wang@outlook.com>
  Chenliang Li <cliang01.li@samsung.com>
  Christian König <christian.koenig@amd.com>
  Chuck Lever <chuck.lever@oracle.com>
  Colin Ian King <colin.i.king@gmail.com>
  Daniel Lezcano <daniel.lezcano@linaro.org>
  Daniel Miess <daniel.miess@amd.com>
  Daniel Wheeler <daniel.wheeler@amd.com>
  Dave Airlie <airlied@redhat.com>
  Dave Chinner <dchinner@redhat.com>
  Dave Jiang <dave.jiang@intel.com>
  Fabio Estevam <festevam@gmail.com>
  fhortner@yahoo.de
  Frank Li <Frank.Li@nxp.com>
  Hamza Mahfooz <hamza.mahfooz@amd.com>
  Hans de Goede <hdegoede@redhat.com>
  Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>
  Haylen Chu <heylenay@outlook.com>
  Honggang LI <honggangli@163.com>
  Huacai Chen <chenhuacai@loongson.cn>
  Hui Li <lihui@loongson.cn>
  Inochi Amaoto <inochiama@outlook.com>
  Jani Nikula <jani.nikula@intel.com>
  Jason Gunthorpe <jgg@nvidia.com>
  Jeff Layton <jlayton@kernel.org>
  Jens Axboe <axboe@kernel.dk>
  Joao Paulo Goncalves <joao.goncalves@toradex.com>
  Joel Slebodnick <jslebodn@redhat.com>
  Julien Panis <jpanis@baylibre.com>
  Kalle Niemi <kaleposti@gmail.com>
  Kent Overstreet <kent.overstreet@linux.dev>
  Konstantin Taranov <kotaranov@microsoft.com>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Kuogee Hsieh <quic_khsieh@quicinc.com>
  Leon Romanovsky <leon@kernel.org>
  Li RongQing <lirongqing@baidu.com>
  Likun Gao <Likun.Gao@amd.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Liu Ying <victor.liu@nxp.com>
  Lorenzo Bianconi <lorenzo@kernel.org>
  Louis Chauvet <louis.chauvet@bootlin.com>
  Luis Chamberlain <mcgrof@kernel.org>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Marc Zyngier <maz@kernel.org>
  Marek Vasut <marex@denx.de>
  Mark Brown <broonie@kernel.org>
  Mark Rutland <mark.rutland@arm.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Max Krummenacher <max.krummenacher@toradex.com>
  Michael Roth <michael.roth@amd.com>
  Michael Strauss <michael.strauss@amd.com>
  Michal Wajdeczko <michal.wajdeczko@intel.com>
  Miguel Ojeda <ojeda@kernel.org>
  Miklos Szeredi <mszeredi@redhat.com>
  Nathan Chancellor <nathan@kernel.org>
  Nikita Shubin <n.shubin@yadro.com>
  Niklas Cassel <cassel@kernel.org>
  Nishanth Menon <nm@ti.com>
  Pablo Caño <pablocpascual@gmail.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Patrice Chotard <patrice.chotard@foss.st.com>
  Patrisious Haddad <phaddad@nvidia.com>
  Paul Hsieh <paul.hsieh@amd.com>
  Peng Fan <peng.fan@nxp.com>
  Peter Ujfalusi <peter.ujfalusi@gmail.com>
  Peter Ujfalusi@gmail.com
  Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Raju Rangoju <Raju.Rangoju@amd.com>
  Rob Herring (Arm) <robh@kernel.org>
  Roman Li <roman.li@amd.com>
  Sanath S <Sanath.S@amd.com>
  Sean Christopherson <seanjc@google.com>
  Selvin Xavier <selvin.xavier@broadcom.com>
  Shawn Guo <shawnguo@kernel.org>
  Siddharth Vadapalli <s-vadapalli@ti.com>
  Sourabh Jain <sourabhjain@linux.ibm.com>
  Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
  Sudeep Holla <sudeep.holla@arm.com>
  Takashi Iwai <tiwai@suse.de>
  Tao Su <tao1.su@linux.intel.com>
  Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
  Thomas Hellström <thomas.hellstrom@linux.intel.com>
  Thomas Richard <thomas.richard@bootlin.com>
  Thorsten Scherer <t.scherer@eckelmann.de>
  Tim Harvey <tharvey@gateworks.com>
  Uwe Kleine-König <u.kleine-koenig@baylibre.com>
  Uwe Kleine-König <ukleinek@kernel.org>
  Vincent Donnefort <vdonnefort@google.com>
  Vinod Koul <vkoul@kernel.org>
  Xi Ruoyao <xry111@xry111.site>
  Yang Li <yang.lee@linux.alibaba.com>
  Yi Lai <yi1.lai@intel.com>
  Yishai Hadas <yishaih@nvidia.com>
  Youling Tang <tangyouling@kylinos.cn>
  Yunxiang Li <Yunxiang.Li@amd.com>
  Zaeem Mohamed <zaeem.mohamed@amd.com>

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
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                fail    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-armhf-armhf-xl-arndale                                  fail    
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     fail    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-xl-qcow2                                    fail    
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-amd64-amd64-xl-raw                                      pass    
 test-armhf-armhf-xl-raw                                      pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-libvirt-vhd                                 pass    
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      pass    


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
   50736169ecc8..5f583a3162ff  5f583a3162ffd9f7999af76b8ab634ce2dac9f90 -> tested/linux-linus

