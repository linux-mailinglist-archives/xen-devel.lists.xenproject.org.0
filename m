Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D327833594
	for <lists+xen-devel@lfdr.de>; Sat, 20 Jan 2024 18:52:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669442.1041902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRFUu-0000KC-9E; Sat, 20 Jan 2024 17:51:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669442.1041902; Sat, 20 Jan 2024 17:51:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRFUu-0000Ic-5K; Sat, 20 Jan 2024 17:51:12 +0000
Received: by outflank-mailman (input) for mailman id 669442;
 Sat, 20 Jan 2024 17:51:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rRFUs-0000IS-Kf; Sat, 20 Jan 2024 17:51:10 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rRFUs-0005w8-7H; Sat, 20 Jan 2024 17:51:10 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rRFUr-0001tb-Pg; Sat, 20 Jan 2024 17:51:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rRFUr-0001Wl-PJ; Sat, 20 Jan 2024 17:51:09 +0000
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
	bh=LhGEJ0AUEgw1qkIhwYKjECpbEzAtY/91Ut99qecJy9s=; b=Jt03vyDsd1LwmH/u6pR5lp/pmt
	8IRFc66oj0LhsOdTUYZ711Jsh1AZ52kbGDMRQ95mcOyUpCcVFDDZpPs5VoZMQ3BXNqjuZkzosvpVg
	A9kUqVDaORCCqo5riKsGxnXM0/9D3HTp/w55exD4mRc/a9tUMosS9ooK0ucbQfjtldlo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184410-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 184410: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-libvirt:host-ping-check-xen:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-multivcpu:guest-start/debian.repeat:fail:heisenbug
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=9d64bf433c53cab2f48a3fff7a1f2a696bc5229a
X-Osstest-Versions-That:
    linux=556e2d17cae620d549c5474b1ece053430cd50bc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 20 Jan 2024 17:51:09 +0000

flight 184410 linux-linus real [real]
flight 184412 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/184410/
http://logs.test-lab.xenproject.org/osstest/logs/184412/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-libvirt     10 host-ping-check-xen fail pass in 184412-retest
 test-amd64-amd64-xl-multivcpu 22 guest-start/debian.repeat fail pass in 184412-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt 16 saverestore-support-check fail in 184412 like 184405
 test-armhf-armhf-libvirt    15 migrate-support-check fail in 184412 never pass
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 184405
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 184405
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 184405
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 184405
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 184405
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 184405
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 184405
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass

version targeted for testing:
 linux                9d64bf433c53cab2f48a3fff7a1f2a696bc5229a
baseline version:
 linux                556e2d17cae620d549c5474b1ece053430cd50bc

Last test of basis   184405  2024-01-19 18:44:05 Z    0 days
Testing same since   184410  2024-01-20 04:27:32 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
  Adrian Hunter <adrian.hunter@intel.com>
  Ahelenia Ziemiańska <nabijaczleweli@nabijaczleweli.xyz>
  Alex Deucher <alexander.deucher@amd.com>
  Alex Hung <alex.hung@amd.com>
  Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
  Ammy Yi <ammy.yi@intel.com>
  Andrew Davis <afd@ti.com>
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Ard Biesheuvel <ardb@kernel.org>
  Aric Cyr <aric.cyr@amd.com>
  Arnaldo Carvalho de Melo <acme@kernel.org>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Asmaa Mnebhi <asmaa@nvidia.com>
  Athira Jajeev <atrajeev@linux.vnet.ibm.com>
  Athira Rajeev <atrajeev@linux.vnet.ibm.com>
  Ben Gainey <ben.gainey@arm.com>
  Benjamin Gray <bgray@linux.ibm.com>
  Bin Li <bin.li@canonical.com>
  Binbin Zhou <zhoubinbin@loongson.cn>
  Brian Welty <brian.welty@intel.com>
  Candice Li <candice.li@amd.com>
  Chancel Liu <chancel.liu@nxp.com>
  Charalampos Mitrodimas <charmitro@posteo.net>
  Charlene Liu <charlene.liu@amd.com>
  Chengen Du <chengen.du@canonical.com>
  ChiYuan Huang <cy_huang@richtek.com>
  Christian König <christian.koenig@amd.com>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Colin Ian King <colin.i.king@gmail.com>
  Conor Dooley <conor.dooley@microchip.com>
  Dafna Hirschfeld <dhirschfeld@habana.ai>
  Dan Carpenter <dan.carpenter@linaro.org>
  Daniel Miess <daniel.miess@amd.com>
  Daniel Wheeler <daniel.wheeler@amd.com>
  Dave Airlie <airlied@redhat.com>
  Dillon Varone <dillon.varone@amd.com>
  Dimitri John Ledkov <dimitri.ledkov@canonical.com>
  Disha Goel <disgoel@linux.ibm.com>
  Elliot Berman <quic_eberman@quicinc.com>
  Fedor Pchelkin <pchelkin@ispras.ru>
  Felix Kuehling <felix.kuehling@amd.com>
  Flora Cui <flora.cui@amd.com>
  Gaosheng Cui <cuigaosheng1@huawei.com>
  George Shen <george.shen@amd.com>
  Guo Ren <guoren@kernel.org>
  Hamza Mahfooz <hamza.mahfooz@amd.com>
  Hawking Zhang <Hawking.Zhang@amd.com>
  Hector Martin <marcan@marcan.st>
  Heiner Kallweit <hkallweit1@gmail.com>
  Hengqi Chen <hengqi.chen@gmail.com>
  Hermes Zhang <chenhuiz@axis.com>
  Hongliang Wang <wanghongliang@loongson.cn>
  Huacai Chen <chenhuacai@loongson.cn>
  Ian Rogers <irogers@google.com>
  Ilkka Koskinen <ilkka@os.amperecomputing.com>
  Ilya Bakoulin <ilya.bakoulin@amd.com>
  Ilya Leoshkevich <iii@linux.ibm.com>
  Ingo Molnar <mingo@elte.hu>
  Ingo Molnar <mingo@redhat.com>
  Inochi Amaoto <inochiama@outlook.com>
  Ivan Lipski <ivlipski@amd.com>
  James Clark <james.clark@arm.com>
  James Zhu <James.Zhu@amd.com>
  Jan Palus <jpalus@fastmail.com>
  Jani Nikula <jani.nikula@intel.com>
  Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
  JiaLong.Yang <jialong.yang@shingroup.cn>
  Jiaxun Yang <jiaxun.yang@flygoat.com>
  Jing Zhang <renyu.zj@linux.alibaba.com>
  Jiri Olsa <jolsa@kernel.org>
  Johan Hovold <johan+linaro@kernel.org>
  John Johansen <john.johansen@canonical.com>
  José Roberto de Souza <jose.souza@intel.com>
  Kai Vehmanen <kai.vehmanen@linux.intel.com>
  Kan Liang <kan.liang@linux.intel.com>
  Kees Cook <keescook@chromium.org>
  Konrad Dybcio <konrad.dybcio@linaro.org>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  Kunwu Chan <chentao@kylinos.cn>
  Le Ma <le.ma@amd.com>
  Leo Yan <leo.yan@linaro.org>
  Lijo Lazar <lijo.lazar@amd.com>
  Likhitha Korrapati <likhitha@linux.ibm.com>
  Likun Gao <Likun.Gao@amd.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Luca Weiss <luca.weiss@fairphone.com>
  Lucas De Marchi <lucas.demarchi@intel.com>
  Ma Jun <Jun.Ma2@amd.com>
  Marc Zyngier <maz@kernel.org>
  Marco Elver <elver@google.com>
  Marek Vasut <marex@denx.de>
  Mark Brown <broonie@kernel.org>
  Mark Rutland <mark.rutland@arm.com>
  Martin Leung <martin.leung@amd.com>
  Martin Tsai <martin.tsai@amd.com>
  Masami Hiramatsu (Google) <mhiramat@kernel.org>
  Matthew Brost <matthew.brost@intel.com>
  Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>
  Melissa Wen <mwen@igalia.com>
  Michal Simek <michal.simek@amd.com>
  Miguel Ojeda <ojeda@kernel.org>
  Namhyung Kim <namhyung@kernel.org>
  Nathan Chancellor <nathan@kernel.org>
  Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
  Nick Desaulniers <ndesaulniers@google.com>
  Nick Forrington <nick.forrington@arm.com>
  Nicolas Ferre <nicolas.ferre@microchip.com>
  Nícolas F. R. A. Prado <nfraprado@collabora.com>
  Ori Messinger <Ori.Messinger@amd.com>
  Ovidiu Bunea <ovidiu.bunea@amd.com>
  Palmer Dabbelt <palmer@rivosinc.com>
  Paran Lee <p4ranlee@gmail.com>
  Paul E. McKenney <paulmck@kernel.org>
  Peichen Huang <peichen.huang@amd.com>
  Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
  Philip Yang <Philip.Yang@amd.com>
  Rander Wang <rander.wang@intel.com>
  Ravi Bangoria <ravi.bangoria@amd.com>
  Rob Herring <robh@kernel.org>
  Robin Murphy <robin.murphy@arm.com>
  Rodrigo Siqueira <rodrigo.siqueira@amd.com>
  Rodrigo Vivi <rodrigo.vivi@intel.com>
  Ruidong Tian <tianruidong@linux.alibaba.com>
  Sandipan Das <sandipan.das@amd.com>
  Sebastian Reichel <sebastian.reichel@collabora.com>
  Shenghao Ding <shenghao-ding@ti.com>
  Song Liu <song@kernel.org>
  Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
  Stephen Rothwell <sfr@canb.auug.org.au>
  Su Hui <suhui@nfschina.com>
  Sumanth Korikkar <sumanthk@linux.ibm.com>
  Takashi Iwai <tiwai@suse.de>
  Thomas Hellström <thomas.hellstrom@linux.intel.com>
  Thomas Richter <tmricht@linux.ibm.com>
  Tiezhu Yang <yangtiezhu@loongson.cn>
  Tudor Ambarus <tudor.ambarus@linaro.org>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Veronika Molnarova <vmolnaro@redhat.com>
  Victor Lu <victorchengchi.lu@amd.com>
  Vinay Belgaumkar <vinay.belgaumkar@intel.com>
  WANG Rui <wangrui@loongson.cn>
  WANG Xuerui <git@xen0n.name>
  Wayne Lin <Wayne.Lin@amd.com>
  Will Deacon <will@kernel.org>
  Xi Ruoyao <xry111@xry111.site>
  Yang Jihong <yangjihong1@huawei.com>
  Yicong Yang <yangyicong@hisilicon.com>
  Yifan Zhang <yifan1.zhang@amd.com>
  Yo-Jung Lin <leo.lin@canonical.com>
  Youling Tang <tangyouling@kylinos.cn>
  zhaimingbing <zhaimingbing@cmss.chinamobile.com>
  zhujun2 <zhujun2@cmss.chinamobile.com>
  Çağhan Demir <caghandemir@marun.edu.tr>

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
 test-armhf-armhf-libvirt                                     fail    
 test-amd64-amd64-xl-multivcpu                                fail    
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
   556e2d17cae6..9d64bf433c53  9d64bf433c53cab2f48a3fff7a1f2a696bc5229a -> tested/linux-linus

