Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC3189B024
	for <lists+xen-devel@lfdr.de>; Sun,  7 Apr 2024 11:46:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701580.1095946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtP5L-00012J-Gl; Sun, 07 Apr 2024 09:45:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701580.1095946; Sun, 07 Apr 2024 09:45:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtP5L-00010i-DF; Sun, 07 Apr 2024 09:45:11 +0000
Received: by outflank-mailman (input) for mailman id 701580;
 Sun, 07 Apr 2024 09:45:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rtP5J-00010Y-WB; Sun, 07 Apr 2024 09:45:10 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rtP5J-0002vH-O7; Sun, 07 Apr 2024 09:45:09 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rtP5J-0002rZ-Bp; Sun, 07 Apr 2024 09:45:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rtP5J-0001ss-BL; Sun, 07 Apr 2024 09:45:09 +0000
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
	bh=GoMHE5GtpSSSquwZn3uWn377qMJN+yW4a3et51RylTI=; b=EhlNEkRc+4wbXG2X+jgEcJEAZY
	XBCk6y84BebGAdK4UobttwBCuWVabjMvnyTkApB/PDSwt8666GeaOROrZ4OxypTcmntJPx1SCW1Ju
	wMwqDRyXUd9NLF1qr5TEW99dh5eUI8EkN0mtL4hvOBvNosuvEY7wEWkVoochCpkovqtg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185254-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 185254: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-xl-multivcpu:xen-boot:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-arndale:xen-boot:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=104db052b62d3320fd30b23416dd0b2a4ff3b85f
X-Osstest-Versions-That:
    linux=8cb4a9a82b21623dbb4b3051dd30d98356cf95bc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 07 Apr 2024 09:45:09 +0000

flight 185254 linux-linus real [real]
flight 185265 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/185254/
http://logs.test-lab.xenproject.org/osstest/logs/185265/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-xl-multivcpu  8 xen-boot           fail pass in 185265-retest
 test-armhf-armhf-xl-arndale   8 xen-boot            fail pass in 185265-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check fail in 185265 never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check fail in 185265 never pass
 test-armhf-armhf-xl-arndale 15 migrate-support-check fail in 185265 never pass
 test-armhf-armhf-xl-arndale 16 saverestore-support-check fail in 185265 never pass
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 185247
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 185247
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 185247
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 185247
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 185247
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 185247
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass

version targeted for testing:
 linux                104db052b62d3320fd30b23416dd0b2a4ff3b85f
baseline version:
 linux                8cb4a9a82b21623dbb4b3051dd30d98356cf95bc

Last test of basis   185247  2024-04-05 14:43:53 Z    1 days
Testing same since   185254  2024-04-06 03:00:45 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ajay Kaher <ajay.kaher@broadcom.com>
  Alexandre Ghiti <alexghiti@rivosinc.com>
  Alexey Makhalov <alexey.makhalov@broadcom.com>
  Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
  Anders Roxell <anders.roxell@linaro.org>
  Andi Shyti <andi.shyti@linux.intel.com>
  Andreas Schwab <schwab@suse.de>
  Andrew Morton <akpm@linux-foundation.org>
  André Apitzsch <git@apitzsch.eu>
  Andy Chiu <andy.chiu@sifive.com>
  Animesh Manna <animesh.manna@intel.com>
  Ankit Nautiyal <ankit.k.nautiyal@intel.com>
  Arnd Bergmann <arnd@arndb.de>
  Arun R Murthy <arun.r.murthy@intel.com>
  Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Björn Töpel <bjorn@rivosinc.com>
  Bryan Tan <bryan-bt.tan@broadcom.com>
  Carlos Song <carlos.song@nxp.com>
  Catalin Marinas <catalin.marinas@arm.com>
  Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
  Charles Keepax <ckeepax@opensource.cirrus.com>
  Chen Ni <nichen@iscas.ac.cn>
  Chengming Zhou <zhouchengming@bytedance.com>
  Christian Bendiksen <christian@bendiksen.me>
  Christian Brauner <brauner@kernel.org>
  Christian Hewitt <christianshewitt@gmail.com>
  Christoffer Sandberg <cs@tuxedo.de>
  Christoph Hellwig <hch@lst.de>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Colin Ian King <colin.i.king@gmail.com>
  Conor Dooley <conor.dooley@microchip.com>
  Damien Le Moal <dlemoal@kernel.org>
  Daniel Wagner <dwagner@suse.de>
  Danilo Krummrich <dakr@redhat.com>
  Dave Airlie <airlied@redhat.com>
  David Hildenbrand <david@redhat.com>
  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Dominique Martinet <asmadeus@codewreck.org>
  Edward Liaw <edliaw@google.com>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Gergo Koteles <soyer@irl.hu>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Hannes Reinecke <hare@kernel.org>
  Hans de Goede <hdegoede@redhat.com>
  Heiko Carstens <hca@linux.ibm.com>
  Herve Codina <herve.codina@bootlin.com>
  Huai-Yuan Liu <qq810974084@gmail.com>
  I Gede Agastya Darma Laksana <gedeagas22@gmail.com>
  Ilya Leoshkevich <iii@linux.ibm.com>
  Imre Deak <imre.deak@intel.com>
  Ingo Molnar <mingo@kernel.org>
  Iskren Chernev <me@iskren.info>
  Jaewon Kim <jaewon02.kim@samsung.com>
  James Christopher Adduono <jc@adduono.com>
  Jens Axboe <axboe@kernel.dk>
  Jisheng Zhang <jszhang@kernel.org>
  John Sperbeck <jsperbeck@google.com>
  Jouni Högander <jouni.hogander@intel.com>
  Keith Busch <kbusch@kernel.org>
  Kent Gibson <warthog618@gmail.com>
  Kent Overstreet <kent.overstreet@linux.dev>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Li Nan <linan122@huawei.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Luca Ceresoli <luca.ceresoli@bootlin.com>
  Lucas De Marchi <lucas.demarchi@intel.com>
  Luke D. Jones <luke@ljones.dev>
  Marco Elver <elver@google.com>
  Mark Brown <broonie@kernel.org>
  Martin K. Petersen <martin.petersen@oracle.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Matthew Brost <matthew.brost@intel.com>
  Michal Mrozek <michal.mrozek@intel.com>
  Miklos Szeredi <mszeredi@redhat.com>
  Namjae Jeon <linkinjeon@kernel.org>
  Nick Shi <nick.shi@broadcom.com>
  Nikita Travkin <nikita@trvn.ru>
  Nilay Shroff <nilay@linux.ibm.com>
  Oleksandr Natalenko <oleksandr@natalenko.name>
  Omar Sandoval <osandov@fb.com>
  Oscar Salvador <osalvador@suse.de>
  Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
  Palmer Dabbelt <palmer@rivosinc.com>
  Peter Collingbourne <pcc@google.com>
  Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
  Peter Wang <peter.wang@mediatek.com>
  Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
  Pu Lehui <pulehui@huawei.com>
  Puranjay Mohan <puranjay12@gmail.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Rander Wang <rander.wang@intel.com>
  Randy Dunlap <rdunlap@infradead.org>
  Rasmus Karlsson <rasmus.karlsson@pajlada.com>
  Richard Fitzgerald <rf@opensource.cirrus.com>
  Rob Clark <robdclark@chromium.org>
  Rob Herring <robh@kernel.org>
  Rodrigo Vivi <rodrigo.vivi@intel.com>
  Roman Artemev <roman.artemev@syntacore.com>
  Ronak Doshi <ronak.doshi@broadcom.com>
  Sami Tolvanen <samitolvanen@google.com>
  Samuel Holland <samuel.holland@sifive.com>
  Sergey Shtylyov <s.shtylyov@omp.ru>
  Simon Ser <contact@emersion.fr>
  Simon Trimmer <simont@opensource.cirrus.com>
  Stefan O'Rear <sorear@fastmail.com>
  Stephen Boyd <sboyd@kernel.org>
  Stephen Horvath <s.horvath@outlook.com.au>
  Stephen Lee <slee08177@gmail.com>
  Steve French <stfrench@microsoft.com>
  Steven Price <steven.price@arm.com>
  Sumanth Korikkar <sumanthk@linux.ibm.com>
  Sven Schnelle <svens@linux.ibm.com>
  Takashi Iwai <tiwai@suse.de>
  Thomas Hellström <thomas.hellstrom@linux.intel.com>
  Thomas Richter <tmricht@linux.ibm.com>
  Thomas Zimmermann <tzimmermann@suse.de>
  Tony Lindgren <tony@atomide.com>
  Uladzislau Rezki (Sony) <urezki@gmail.com>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Vasily Gorbik <gor@linux.ibm.com>
  Victor Isaev <isv@google.com>
  Victor Isaev <victor@torrio.net>
  Vijendar Mukunda <Vijendar.Mukunda@amd.com>
  Ville Syrjälä <ville.syrjala@linux.intel.com>
  Vincent Guittot <vincent.guittot@linaro.org>
  Vineet Gupta <vineetg@rivosinc.com>
  Vishal Bhakta <vishal.bhakta@broadcom.com>
  Vishnu Dasa <vishnu.dasa@broadcom.com>
  Vladimir Isaev <vladimir.isaev@syntacore.com>
  Vlastimil Babka <vbabka@suse.cz>
  Werner Sembach <wse@tuxedocomputers.com>
  Yihang Li <liyihang9@huawei.com>
  Zhang Yi <zhangyi@everest-semi.com>

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
 test-amd64-amd64-xl-pvhv2-amd                                pass    
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
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                fail    
 test-amd64-amd64-pair                                        pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-xl-qcow2                                    pass    
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
   8cb4a9a82b21..104db052b62d  104db052b62d3320fd30b23416dd0b2a4ff3b85f -> tested/linux-linus

