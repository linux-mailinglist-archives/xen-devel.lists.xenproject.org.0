Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A04586F64D
	for <lists+xen-devel@lfdr.de>; Sun,  3 Mar 2024 18:00:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688098.1071940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rgpB7-0002oG-7B; Sun, 03 Mar 2024 16:59:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688098.1071940; Sun, 03 Mar 2024 16:59:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rgpB7-0002mT-3t; Sun, 03 Mar 2024 16:59:09 +0000
Received: by outflank-mailman (input) for mailman id 688098;
 Sun, 03 Mar 2024 16:59:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rgpB6-0002mJ-3Y; Sun, 03 Mar 2024 16:59:08 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rgpB5-0002K7-QR; Sun, 03 Mar 2024 16:59:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rgpB5-0003by-KC; Sun, 03 Mar 2024 16:59:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rgpB5-0006qj-JX; Sun, 03 Mar 2024 16:59:07 +0000
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
	bh=xV4wX6E0RA+ivw4P+d9xZ9RG5jAdkF3HP/FKyc26QeY=; b=H/5X5NVCKYF0nP8WRSwrDQBT+M
	qHieZ9E6Xr+pk25hZINuyMILY7vMADKAXRsuKsFzadhdKtq0YjU/Pi2WqtOpBlyqHKrP+HL7cVch6
	oZ1kyjTemFmxPKN1YnMeNmMCwt21CL0CKaX4xXO8ZdteJg1VQrEu49zUahDWr1xmkypY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184861-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 184861: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:debian-hvm-install:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=04b8076df2534f08bb4190f90a24e0f7f8930aca
X-Osstest-Versions-That:
    linux=87adedeba51a822533649b143232418b9e26d08b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 03 Mar 2024 16:59:07 +0000

flight 184861 linux-linus real [real]
flight 184877 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/184861/
http://logs.test-lab.xenproject.org/osstest/logs/184877/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 12 debian-hvm-install fail pass in 184877-retest

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 184835
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 184835
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 184835
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 184835
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 184835
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 184835
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 184835
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 184835
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass

version targeted for testing:
 linux                04b8076df2534f08bb4190f90a24e0f7f8930aca
baseline version:
 linux                87adedeba51a822533649b143232418b9e26d08b

Last test of basis   184835  2024-03-01 17:44:20 Z    1 days
Testing same since   184861  2024-03-03 00:29:43 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Adam Goldman <adamg@pobox.com>
  Adrian Hunter <adrian.hunter@intel.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alex Hung <alex.hung@amd.com>
  Alexandre Ghiti <alexghiti@rivosinc.com>
  Alexandru Gagniuc <alexandru.gagniuc@hp.com>
  Andy Chiu <andybnac@gmail.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Ard Biesheuvel <ardb@kernel.org>
  Arnd Bergmann <arnd@arndb.de>
  Arturas Moskvinas <arturas.moskvinas@gmail.com>
  Bart Van Assche <bvanassche@acm.org>
  Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Bjorn Andersson <quic_bjorande@quicinc.com>
  Chandan Babu R <chandanbabu@kernel.org>
  Christian Brauner <brauner@kernel.org>
  Christian König <christian.koenig@amd.com>
  Christophe Kerello <christophe.kerello@foss.st.com>
  Colin Ian King <colin.i.king@gmail.com>
  Conor Dooley <conor.dooley@microchip.com>
  Conor Dooley <conor@kernel.org>
  Cristian Marussi <cristian.marussi@arm.com>
  Dan Williams <dan.j.williams@intel.com>
  Daniel Vetter <daniel.vetter@ffwll.ch>
  Dave Airlie <airlied@redhat.com>
  David Howells <dhowells@redhat.com>
  David Sterba <dsterba@suse.com>
  Dimitris Vlachos <dvlachos@ics.forth.gr>
  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Elad Nachman <enachman@marvell.com>
  Eniac Zhang <eniac-xw.zhang@hp.com>
  Eric Biggers <ebiggers@google.com>
  Fei Wu <fei2.wu@intel.com>
  Filipe Manana <fdmanana@suse.com>
  Francois Dugast <francois.dugast@intel.com>
  Gergo Koteles <soyer@irl.hu>
  Guo Ren <guoren@kernel.org>
  Hans de Goede <hdegoede@redhat.com>
  Hans Peter <flurry123@gmx.ch>
  Ilya Dryomov <idryomov@gmail.com>
  Ivan Semenov <ivan@semenov.dev>
  Jaroslav Kysela <perex@perex.cz>
  Jason Gunthorpe <jgg@nvidia.com>
  Jay Ajit Mate <jay.mate15@gmail.com>
  Jiawei Wang <me@jwang.link>
  Jiri Olsa <olsajiri@gmail.com>
  Jiri Slaby (SUSE) <jirislaby@kernel.org>
  Jisheng Zhang <jszhang@kernel.org>
  Joerg Roedel <jroedel@suse.de>
  Johan Hovold <johan+linaro@kernel.org>
  John Garry <john.g.garry@oracle.com> #build only
  Johnny Hsieh <mnixry@outlook.com>
  Jon Hunter <jonathanh@nvidia.com>
  José Roberto de Souza <jose.souza@intel.com>
  Kailang Yang <kailang@realtek.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Luca Ceresoli <luca.ceresoli@bootlin.com>
  Lucas De Marchi <lucas.demarchi@intel.com>
  Ma Jun <Jun.Ma2@amd.com>
  Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
  Mark Brown <broonie@kernel.org>
  Martin K. Petersen <martin.petersen@oracle.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Masami Hiramatsu (Google) <mhiramat@kernel.org>
  Matthew Auld <matthew.auld@intel.com>
  Matthew Brost <matthew.brost@intel.com>
  Maxime Ripard <mripard@kernel.org>
  Maxime Ripard <mripard@redhat.com>
  Mika Kuoppala <mika.kuoppala@linux.intel.com>
  Mikko Perttunen <mperttunen@nvidia.com>
  Ming Lei <ming.lei@redhat.com>
  Namjae Jeon <linkinjeon@kernel.org>
  Nathan Chancellor <nathan@kernel.org>
  Neil Armstrong <neil.armstrong@linaro.org>
  Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
  Nicolin Chen <nicolinc@nvidia.com>
  Palmer Dabbelt <palmer@rivosinc.com>
  Paloma Arellano <quic_parellan@quicinc.com>
  Paul Walmsley <paul.walmsley@sifive.com>
  Paulo Zanoni <paulo.r.zanoni@intel.com>
  Prike Liang <Prike.Liang@amd.com>
  Priyanka Dandamudi <priyanka.dandamudi@intel.com>
  Ranjan Kumar <ranjan.kumar@broadcom.com>
  Richard Fitzgerald <rf@opensource.cirrus.com>
  Rob Clark <robdclark@chromium.org>
  Rob Clark <robdclark@gmail.com>
  Rob Herring <robh@kernel.org>
  Robert Foss <rfoss@kernel.org>
  Rodrigo Vivi <rodrigo.vivi@intel.com>
  Ryan Lin <tsung-hua.lin@amd.com>
  Samuel Holland <samuel.holland@sifive.com>
  Saravana Kannan <saravanak@google.com>
  Sebastian Reichel <sebastian.reichel@collabora.com>
  Shiyang Ruan <ruansy.fnst@fujitsu.com>
  Sid Pranjale <sidpranjale127@protonmail.com>
  Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
  Takashi Iwai <tiwai@suse.de>
  Takashi Sakamoto <o-takashi@sakamocchi.jp>
  Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
  Thierry Reding <treding@nvidia.com>
  Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
  Thomas Hellström <thomas.hellstrom@linux.intel.com>
  Thomas Weißschuh <linux@weissschuh.net>
  Tim Schumacher <timschumi@gmx.de>
  Ulf Hansson <ulf.hansson@linaro.org>
  Vadim Shakirov <vadim.shakirov@syntacore.com>
  Willian Wang <git@willian.wang>
  Xiubo Li <xiubli@redhat.com>
  Yangyu Chen <cyy@cyyself.name>
  Yuezhang Mo <Yuezhang.Mo@sony.com>
  Zhangfei Gao <zhangfei.gao@linaro.org>
  Zong Li <zong.li@sifive.com>

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
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 fail    
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
 test-amd64-amd64-freebsd12-amd64                             pass    
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
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
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
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      pass    
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
   87adedeba51a8..04b8076df2534  04b8076df2534f08bb4190f90a24e0f7f8930aca -> tested/linux-linus

