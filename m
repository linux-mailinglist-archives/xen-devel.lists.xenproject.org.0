Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E25E848AE8
	for <lists+xen-devel@lfdr.de>; Sun,  4 Feb 2024 04:42:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675489.1050914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWTNZ-0007w0-Gk; Sun, 04 Feb 2024 03:41:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675489.1050914; Sun, 04 Feb 2024 03:41:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWTNZ-0007tA-8x; Sun, 04 Feb 2024 03:41:13 +0000
Received: by outflank-mailman (input) for mailman id 675489;
 Sun, 04 Feb 2024 03:41:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rWTNX-0007sy-Vg; Sun, 04 Feb 2024 03:41:11 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rWTNX-0003iG-RN; Sun, 04 Feb 2024 03:41:11 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rWTNX-00079f-A7; Sun, 04 Feb 2024 03:41:11 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rWTNX-00009B-9g; Sun, 04 Feb 2024 03:41:11 +0000
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
	bh=BVCkm32p8Nn2OwrgWo9LVibIyA5qQEibhVRwk/A46/Y=; b=F09obJZXuOKf052Kr0wzxgaPmU
	M3hOFzCWRwNdQVwB4CWcs+StpxDIvSL9ZfqwqVBGcUu07N0/TzqnodpiGahAlTwwaBvP7gOTvxvRE
	3nqVoXUK13zsqj38SGwBcdqosZWbaZsBsCqiRO3eWCL66U7rr8l6ODKo4X4/UM8CQXVE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184576-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 184576: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-xl-vhd:guest-start:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=56897d51886fa7e9f034ff26128eb09f1b811594
X-Osstest-Versions-That:
    linux=021533194476035883300d60fbb3136426ac8ea5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 04 Feb 2024 03:41:11 +0000

flight 184576 linux-linus real [real]
flight 184582 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/184576/
http://logs.test-lab.xenproject.org/osstest/logs/184582/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-xl-vhd      13 guest-start         fail pass in 184582-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-vhd     14 migrate-support-check fail in 184582 never pass
 test-armhf-armhf-xl-vhd 15 saverestore-support-check fail in 184582 never pass
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 184566
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 184566
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 184566
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 184566
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 184566
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 184566
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 184566
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 184566
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass

version targeted for testing:
 linux                56897d51886fa7e9f034ff26128eb09f1b811594
baseline version:
 linux                021533194476035883300d60fbb3136426ac8ea5

Last test of basis   184566  2024-02-02 15:26:30 Z    1 days
Testing same since   184576  2024-02-03 12:02:13 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alan Adamson <alan.adamson@oracle.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alexander Tsoy <alexander@tsoy.me>
  Andreas Gruenbacher <agruenba@redhat.com>
  Andy Chi <andy.chi@canonical.com>
  Ard Biesheuvel <ardb@kernel.org>
  Badal Nilawar <badal.nilawar@intel.com>
  Bagas Sanjaya <bagasdotme@gmail.com>
  Bjorn Helgaas <bhelgaas@google.com>
  Brenton Simpson <appsforartists@google.com>
  Caleb Sander <csander@purestorage.com>
  Chaitanya Kulkarni <kch@nvidia.com>
  Charlene Liu <charlene.liu@amd.com>
  Chen-Yu Tsai <wens@csie.org>
  Chhayly Leang <clw.leang@gmail.com>
  Christian König <christian.koenig@amd.com>
  Conor Dooley <conor.dooley@microchip.com>
  Daniel Bristot de Oliveira <bristot@kernel.org>
  Daniel Miess <daniel.miess@amd.com>
  Daniel Wagner <dwagner@suse.de>
  Daniel Wheeler <daniel.wheeler@amd.com>
  Dave Airlie <airlied@redhat.com>
  David McFarland <corngood@gmail.com>
  David Senoner <seda18@rolmail.net>
  diogo.ivo@tecnico.ulisboa.pt
  Dmitry Osipenko <dmitry.osipenko@collabora.com>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Dmytro Laktyushkin <dmytro.laktyushkin@amd.com>
  Edson Juliano Drosdeck <edson.drosdeck@gmail.com>
  Fangzhi Zuo <jerry.zuo@amd.com>
  Fei Shao <fshao@chromium.org>
  Friedrich Vock <friedrich.vock@gmx.de>
  Guenter Roeck <linux@roeck-us.net>
  Guixin Liu <kanie@linux.alibaba.com>
  Hannes Reinecke <hare@suse.de>
  Hans de Goede <hdegoede@redhat.com>
  Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
  Hongyu Jin <hongyu.jin@unisoc.com>
  Israel Rukshin <israelr@nvidia.com>
  Ivan Orlov <ivan.orlov0322@gmail.com>
  Jacob Siverskog <jacob@teenage.engineering>
  Jani Nikula <jani.nikula@intel.com>
  Jason Gunthorpe <jgg@nvidia.com>
  Javier Carrasco <javier.carrasco.cruz@gmail.com>
  Jay Cornwall <jay.cornwall@amd.com>
  Jens Axboe <axboe@kernel.dk>
  Joerg Roedel <jroedel@suse.de>
  Johan Hovold <johan+linaro@kernel.org>
  José Relvas <josemonsantorelvas@gmail.com>
  José Roberto de Souza <jose.souza@intel.com>
  Julian Sikorski <belegdol+github@gmail.com>
  Kailang Yang <kailang@realtek.com>
  Keith Busch <kbusch@kernel.org>
  Kenzo Gomez <kenzo.sgomez@gmail.com>
  Kevin Brodsky <kevin.brodsky@arm.com>
  Konstantin Aladyshev <aladyshev22@gmail.com>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Lang Yu <Lang.Yu@amd.com>
  Le Ma <le.ma@amd.com>
  Lennert Buytenhek <kernel@wantstofly.org>
  Li RongQing <lirongqing@baidu.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Lorenzo Pieralisi <lpieralisi@kernel.org>
  Lucas De Marchi <lucas.demarchi@intel.com>
  Luka Guzenko <l.guzenko@web.de>
  Ma Jun <Jun.Ma2@amd.com>
  Maarten van der Schrieck
  Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
  Marian Postevca <posteuca@mutex.one>
  Mario Limonciello <mario.limonciello@amd.com>
  Mark Brown <broonie@kernel.org>
  Matt Roper <matthew.d.roper@intel.com>
  Matthew Brost <matthew.brost@intel.com>
  Max Gurtovoy <mgurtovoy@nvidia.com>
  Maxime Ripard <mripard@redhat.com>
  Mike Snitzer <snitzer@kernel.org>
  Mikulas Patocka <mpatocka@redhat.com>
  Mukul Joshi <mukul.joshi@amd.com>
  Nicholas Susanto <nicholas.susanto@amd.com>
  Niklas Cassel <cassel@kernel.org>
  Nitin U. Yewale <nyewale@redhat.com>
  Ovidiu Panait <ovidiu.panait@windriver.com>
  Paul Menzel <pmenzel@molgen.mpg.de>
  Philip Yang <Philip.Yang@amd.com>
  Richard Fitzgerald <rf@opensource.cirrus.com>
  Rodrigo Vivi <rodrigo.vivi@intel.com>
  Rui Salvaterra <rsalvaterra@gmail.com>
  Saleemkhan Jamadar <saleemkhan.jamadar@amd.com>
  Sami Tolvanen <samitolvanen@google.com>
  Sean Young <sean@mess.org>
  Sebastian Ott <sebott@redhat.com>
  Sebastian Reichel <sebastian.reichel@collabora.com>
  Shivaprasad G Bhat <sbhat@linux.ibm.com>
  Sohaib Nadeem <sohaib.nadeem@amd.com>
  Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Sumit Semwal <sumit.semwal@linaro.org>
  Szilard Fabian <szfabian@bluemarch.art>
  T.J. Mercier <tjmercier@google.com>
  Takashi Iwai <tiwai@suse.de>
  Techno Mooney <techno.mooney@gmail.com>
  Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
  Thomas Hellström <thomas.hellstrom@linux.intel.com>
  Tom Chung <chiahsuan.chung@amd.com>
  Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
  Vincent Donnefort <vdonnefort@google.com>
  Vitaly Prosyak <vitaly.prosyak@amd.com>
  Vitaly Rodionov <vitalyr@opensource.cirrus.com>
  Vivek Kasireddy <vivek.kasireddy@intel.com>
  Wenjing Liu <wenjing.liu@amd.com>
  Werner Sembach <wse@tuxedocomputers.com>
  Will Deacon <will@kernel.org>
  Yibin Ding <yibin.ding@unisoc.com>
  Yifan Zhang <yifan1.zhang@amd.com>
  Zhenyu Zhang <zhenyzha@redhat.com>
  Zhu Ning <zhuning0077@gmail.com>

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
 test-armhf-armhf-xl-vhd                                      fail    


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
   021533194476..56897d51886f  56897d51886fa7e9f034ff26128eb09f1b811594 -> tested/linux-linus

