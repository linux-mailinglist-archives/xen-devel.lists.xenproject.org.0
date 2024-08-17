Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7EC9556C2
	for <lists+xen-devel@lfdr.de>; Sat, 17 Aug 2024 11:32:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778936.1188900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sfFlo-0002Lu-Kk; Sat, 17 Aug 2024 09:30:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778936.1188900; Sat, 17 Aug 2024 09:30:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sfFlo-0002Jb-Hu; Sat, 17 Aug 2024 09:30:48 +0000
Received: by outflank-mailman (input) for mailman id 778936;
 Sat, 17 Aug 2024 09:30:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sfFln-0002JO-FU; Sat, 17 Aug 2024 09:30:47 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sfFln-0005SB-AY; Sat, 17 Aug 2024 09:30:47 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sfFlm-0005gH-I3; Sat, 17 Aug 2024 09:30:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sfFlm-0006cf-HP; Sat, 17 Aug 2024 09:30:46 +0000
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
	bh=Hk7p/5pNrAuD4Ifqw7FkQKKYUJXpbpYJZFt8OzYIysU=; b=K0uskW/TGiciEENIpRZ0/kfCJB
	SKTuuaol1SjQ41liD/HSnBi4yd3KVe0RAQjV/B82OYA13b1sx2MRsXA08Bldok00taRrfTnfebR5b
	EC9MiV3zTBOMdYr4lS9MPC87jyl+PwOWIyj48x/GxCmHjSyPr2z+iDWWPV4bBxc0jPZw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187257-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 187257: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-libvirt:host-ping-check-xen:fail:heisenbug
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=85652baa895b59b94bea29c77cb9b51cf7120deb
X-Osstest-Versions-That:
    linux=e724918b3786252b985b0c2764c16a57d1937707
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 17 Aug 2024 09:30:46 +0000

flight 187257 linux-linus real [real]
flight 187266 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/187257/
http://logs.test-lab.xenproject.org/osstest/logs/187266/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-libvirt     10 host-ping-check-xen fail pass in 187266-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt 16 saverestore-support-check fail in 187266 like 187251
 test-armhf-armhf-libvirt    15 migrate-support-check fail in 187266 never pass
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 187251
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 187251
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 187251
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 187251
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 187251
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                85652baa895b59b94bea29c77cb9b51cf7120deb
baseline version:
 linux                e724918b3786252b985b0c2764c16a57d1937707

Last test of basis   187251  2024-08-15 23:14:47 Z    1 days
Failing since        187254  2024-08-16 11:03:05 Z    0 days    2 attempts
Testing same since   187257  2024-08-16 23:12:36 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alex Bee <knaerzche@gmail.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alexandre Ghiti <alexghiti@rivosinc.com>
  Alice Ryhl <aliceryhl@google.com>
  Alison Schofield <alison.schofield@intel.com>
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
  Asmaa Mnebhi <asmaa@nvidia.com>
  Baojun Xu <baojun.xu@ti.com>
  Barak Biber <bbiber@nvidia.com>
  Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
  Benno Lossin <benno.lossin@proton.me>
  Boqun Feng <boqun.feng@gmail.com>
  Bouke Sybren Haarsma <boukehaarsma23@gmail.com>
  Caleb Sander Mateos <csander@purestorage.com>
  Celeste Liu <CoelacanthusHex@gmail.com>
  Chun-Kuang Hu <chunkuang.hu@kernel.org>
  Dan Carpenter <dan.carpenter@linaro.org>
  Daniel Wheeler <daniel.wheeler@amd.com>
  Daniel Yang <danielyangkang@gmail.com>
  Dave Airlie <airlied@redhat.com>
  David (Ming Qiang) Wu <David.Wu3@amd.com>
  David Gstir <david@sigma-star.at>
  Dirk Behme <dirk.behme@de.bosch.com>
  Douglas Anderson <dianders@chromium.org>
  Eric Farman <farman@linux.ibm.com>
  Evan Green <evan@rivosinc.com>
  Fangzhi Zuo <Jerry.Zuo@amd.com>
  Fei Shao <fshao@chromium.org>
  Francesco Dolcini <francesco.dolcini@toradex.com>
  Haibo Xu <haibo1.xu@intel.com>
  Hamza Mahfooz <hamza.mahfooz@amd.com>
  Hans de Goede <hdegoede@redhat.com>
  Heiko Stuebner <heiko@sntech.de>
  Ira Weiny <ira.weiny@intel.com>
  Jack Xiao <Jack.Xiao@amd.com>
  Jarkko Sakkinen <jarkko@kernel.org>
  Jason Gunthorpe <jgg@nvidia.com>
  Jens Axboe <axboe@kernel.dk>
  Joerg Roedel <jroedel@suse.de>
  Juan José Arboleda <soyjuanarbol@gmail.com>
  Kenneth Feng <kenneth.feng@amd.com>
  Khazhismel Kumykov <khazhy@google.com>
  Konrad Dybcio <konrad.dybcio@linaro.org>
  Konrad Dybcio <konradybcio@kernel.org>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Li Lingfeng <lilingfeng3@huawei.com>
  Lianqin Hu <hulianqin@vivo.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Loan Chen <lo-an.chen@amd.com>
  Lucas De Marchi <lucas.demarchi@intel.com>
  Mark Brown <broonie@kernel.org>
  Masahiro Yamada <masahiroy@kernel.org>
  Matthew Brost <matthew.brost@intel.com>
  Maxime Ripard <mripard@kernel.org>
  Maíra Canal <mcanal@igalia.com>
  Melissa Wen <mwen@igalia.com>
  Michal Wajdeczko <michal.wajdeczko@intel.com>
  Miguel Ojeda <ojeda@kernel.org>
  Mikulas Patocka <mpatocka@redhat.com>
  Nam Cao <namcao@linutronix.de>
  Namhyung Kim <namhyung@kernel.org>
  Olivier Langlois <olivier@trillion01.com>
  Palmer Dabbelt <palmer@rivosinc.com>
  Parsa Poorshikhian <parsa.poorsh@gmail.com>
  Peter Kästle <peter@piie.net>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Richard Fitzgerald <rf@opensource.cirrus.com>
  Rob Herring (Arm) <robh@kernel.org>
  Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
  Rodrigo Vivi <rodrigo.vivi@intel.com>
  Sarthak Singh <sarthak.singh99@gmail.com>
  Shibu kumar <shibukumar.bit@gmail.com>
  Simon Trimmer <simont@opensource.cirrus.com>
  Song Liu <song@kernel.org>
  Stefan Haberland <sth@linux.ibm.com>
  Stefan Wiehler <stefan.wiehler@nokia.com>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Steven Rostedt <rostedt@goodmis.org>
  Takashi Iwai <tiwai@suse.de>
  Thomas Zimmermann <tzimmermann@suse.de>
  Tom Chung <chiahsuan.chung@amd.com>
  Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
  Wayne Lin <wayne.lin@amd.com>
  Yinjie Yao <yinjie.yao@amd.com>
  Yu Kuai <yukuai3@huawei.com>
  Yue Haibing <yuehaibing@huawei.com>
  Zehui Xu <zehuixu@whu.edu.cn>
  Zhihao Cheng <chengzhihao1@huawei.com>

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
 test-armhf-armhf-libvirt                                     fail    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
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
   e724918b3786..85652baa895b  85652baa895b59b94bea29c77cb9b51cf7120deb -> tested/linux-linus

