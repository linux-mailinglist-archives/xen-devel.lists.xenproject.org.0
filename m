Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8161970CC3
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 06:39:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.793961.1202621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snWAl-00026S-A9; Mon, 09 Sep 2024 04:38:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 793961.1202621; Mon, 09 Sep 2024 04:38:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snWAl-00023x-5w; Mon, 09 Sep 2024 04:38:43 +0000
Received: by outflank-mailman (input) for mailman id 793961;
 Mon, 09 Sep 2024 04:38:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1snWAj-00023n-98; Mon, 09 Sep 2024 04:38:41 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1snWAj-0001KD-1F; Mon, 09 Sep 2024 04:38:41 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1snWAi-0004Kw-Ga; Mon, 09 Sep 2024 04:38:40 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1snWAi-0002CY-G5; Mon, 09 Sep 2024 04:38:40 +0000
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
	bh=BqRohDSX/YHKpYZl3DnyFo+KCPRSDC4ldvxX005l4e4=; b=dXHLxC6cs6HW80qbOgaetTEnrA
	iJt7D0/LImcm3MiO4t2jeIyTrcO0c4NOqhBTXzFaWIuhYe1fGncK02ssp4BXEK6qIupaDanIVA2jr
	2vZdFWPTWpCV6J79XiQqAY6zoLKbJoIguq2N8M2t2ZW2AFA5bab16wmPFV4zp4O5+MUQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187570-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 187570: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-xl-credit1:xen-boot:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=d1f2d51b711a3b7f1ae1b46701c769c1d580fa7f
X-Osstest-Versions-That:
    linux=c763c43396883456ef57e5e78b64d3c259c4babc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 09 Sep 2024 04:38:40 +0000

flight 187570 linux-linus real [real]
flight 187593 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/187570/
http://logs.test-lab.xenproject.org/osstest/logs/187593/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-xl-credit1   8 xen-boot            fail pass in 187593-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-credit1 15 migrate-support-check fail in 187593 never pass
 test-armhf-armhf-xl-credit1 16 saverestore-support-check fail in 187593 never pass
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 187504
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 187504
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 187504
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 187504
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 187504
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 187504
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass

version targeted for testing:
 linux                d1f2d51b711a3b7f1ae1b46701c769c1d580fa7f
baseline version:
 linux                c763c43396883456ef57e5e78b64d3c259c4babc

Last test of basis   187504  2024-09-05 10:21:11 Z    3 days
Failing since        187510  2024-09-05 23:42:38 Z    3 days    5 attempts
Testing same since   187570  2024-09-08 08:48:14 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abel Vesa <abel.vesa@linaro.org>
  Adam Queler <queler+k@gmail.com>
  Adrian Hunter <adrian.hunter@intel.com>
  Adrián Larumbe <adrian.larumbe@collabora.com>
  Aleksandr Mishin <amishin@t-argos.ru>
  Alex Deucher <alexander.deucher@amd.com>
  Alexander Stein <alexander.stein@ew.tq-group.com>
  Alexandre Ghiti <alexghiti@rivosinc.com>
  Alexei Starovoitov <ast@kernel.org>
  Alice Ryhl <aliceryhl@google.com>
  Amandeep Singh <quic_amansing@quicinc.com>
  Amit Pundir <amit.pundir@linaro.org>
  Andreas Hindborg <a.hindborg@kernel.org>
  Andreas Hindborg <a.hindborg@samsung.com>
  Andrew Jeffery <andrew@codeconstruct.com.au>
  Andrii Nakryiko <andrii@kernel.org>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Anton Blanchard <antonb@tenstorrent.com>
  Anuj Gupta <anuj20.g@samsung.com>
  Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
  Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
  Baochen Qiang <quic_bqiang@quicinc.com>
  Bard Liao <yung-chuan.liao@linux.intel.com>
  Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Bjorn Andersson <andersson@kernel.org>
  Bjorn Helgaas <bhelgaas@google.com>
  Boqun Feng <boqun.feng@gmail.com>
  Boris Brezillon <boris.brezillon@collabora.com>
  Breno Leitao <leitao@debian.org>
  Brian Norris <briannorris@chromium.org>
  Bryan O'Donoghue <bryan.odonoghue@linaro.org>
  Catalin Marinas <catalin.marinas@arm.com>
  Chandan Kumar Rout <chandanx.rout@intel.com>
  Charles Han <hanchunchao@inspur.com>
  Charlie Jenkins <charlie@rivosinc.com>
  Chen-Yu Tsai <wenst@chromium.org>
  Cheng-Jui Wang <cheng-jui.wang@mediatek.com>
  Chi Zhiling <chizhiling@kylinos.cn>
  Christian Brauner <brauner@kernel.org>
  Christoffer Sandberg <cs@tuxedo.de>
  Christoph Hellwig <hch@lst.de>
  Christophe Leroy <christophe.leroy@csgroup.eu>
  Cong Wang <cong.wang@bytedance.com>
  Daiwei Li <daiweili@google.com>
  Dan Carpenter <dan.carpenter@linaro.org>
  Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
  Danilo Krummrich <dakr@kernel.org>
  Dave Airlie <airlied@redhat.com>
  David Gow <davidgow@google.com>
  David Howells <dhowells@redhat.com>
  David S. Miller <davem@davemloft.net>
  Dawid Osuchowski <dawid.osuchowski@linux.intel.com>
  devi priya <quic_devipriy@quicinc.com>
  Dillon Varone <dillon.varone@amd.com>
  Dirk Behme <dirk.behme@de.bosch.com>
  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Douglas Anderson <dianders@chromium.org>
  Eduard Zingerman <eddyz87@gmail.com>
  Eric Dumazet <edumazet@google.com>
  Fabio Estevam <festevam@gmail.com>
  Frank Li <Frank.Li@nxp.com>
  Gautham R. Shenoy <gautham.shenoy@amd.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Georg Gottleuber <ggo@tuxedocomputers.com>
  George Kuruvinakunnel <george.kuruvinakunnel@intel.com>
  Guillaume Nault <gnault@redhat.com>
  Hamza Mahfooz <hamza.mahfooz@amd.com>
  Hans de Goede <hdegoede@redhat.com>
  Hayes Wang <hayeswang@realtek.com>
  hongchi.peng <hongchi.peng@siengine.com>
  Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
  Imre Deak <imre.deak@intel.com>
  Jack Xiao <Jack.Xiao@amd.com>
  Jakub Kicinski <kuba@kernel.org>
  Jamie Bainbridge <jamie.bainbridge@gmail.com>
  Jani Nikula <jani.nikula@intel.com>
  Jeff Johnson <quic_jjohnson@quicinc.com>
  Jens Axboe <axboe@kernel.dk>
  Jens Emil Schulz Østergaard <jensemil.schulzostergaard@microchip.com>
  Jeongjun Park <aha310510@gmail.com>
  Jinjie Ruan <ruanjinjie@huawei.com>
  Johan Hovold <johan+linaro@kernel.org>
  Jon Mulder <jon.e.mulder@gmail.com>
  Jonas Gorski <jonas.gorski@bisdn.de>
  Jonathan Bell <jonathan@raspberrypi.com>
  Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
  Jouni Högander <jouni.hogander@intel.com>
  Jubilee Young <workingjubilee@gmail.com>
  Julien Panis <jpanis@baylibre.com>
  Kai Vehmanen <kai.vehmanen@linux.intel.com>
  Kalle Valo <kvalo@kernel.org>
  Kalle Valo <quic_kvalo@quicinc.com>
  Keita Aihara <keita.aihara@sony.com>
  Keith Busch <kbusch@kernel.org>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Kuniyuki Iwashima <kuniyu@amazon.com>
  Larysa Zaremba <larysa.zaremba@intel.com>
  Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
  Leo Li <sunpeng.li@amd.com>
  Leonardo Bras <leobras@redhat.com>
  Li Nan <linan122@huawei.com>
  Liao Chen <liaochen4@huawei.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Liviu Dudau <liviu.dudau@arm.com>
  Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Luke D. Jones <luke@ljones.dev>
  Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
  Maarten Lankhorst,,, <maarten.lankhorst@linux.intel.com>
  Maciej Fijalkowski <maciej.fijalkowski@intel.com>
  Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Mario Limonciello <mario.limonciello@amd.com>
  Mark Brown <broonie@kernel.org>
  Mark Rutland <mark.rutland@arm.com>
  Markus Schneider-Pargmann <msp@baylibre.com>
  Markuss Broks <markuss.broks@gmail.com>
  Martin Jocic <martin.jocic@kvaser.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Martin KaFai Lau <martin.lau@kernel.org>
  Mary Guillemard <mary.guillemard@collabora.com>
  Mary Guillemard <mary@mary.zone>
  Masami Hiramatsu (Google) <mhiramat@kernel.org>
  Matt Coster <matt.coster@imgtec.com>
  Matt Johnston <matt@codeconstruct.com.au>
  Matt Roper <matthew.d.roper@intel.com>
  Matteo Martelli <matteomartelli3@gmail.com>
  Maurizio Lombardi <mlombard@redhat.com>
  Maxim Levitsky <mlevitsk@redhat.com>
  Maxime Ripard <mripard@kernel.org>
  Maxime Ripard <mripard@redhat.com>
  Maximilien Perreault <maximilienperreault@gmail.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael Jeanson <mjeanson@efficios.com>
  Michael Vetter <jubalh@iodoru.org>
  Miguel Ojeda <ojeda@kernel.org>
  Mikko Tiihonen <mikko.tiihonen@iki.fi>
  Mikulas Patocka <mpatocka@redhat.com>
  Mohan Kumar <mkumard@nvidia.com>
  Neil Armstrong <neil.armstrong@linaro.org>
  Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
  Nikolay Aleksandrov <razor@blackwall.org>
  Nysal Jan K.A. <nysal@linux.ibm.com>
  Oliver Neukum <oneukum@suse.com>
  Palmer Dabbelt <palmer@rivosinc.com>
  Paolo Abeni <pabeni@redhat.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Paul E. McKenney <paulmck@kernel.org>
  Paulo Alcantara (Red Hat) <pc@manguebit.com>
  Paulo Alcantara <pc@manguebit.com>
  Pawel Dembicki <paweldembicki@gmail.com>
  Pucha Himasekhar Reddy <himasekharx.reddy.pucha@intel.com> (A Contingent worker at Intel)
  Puranjay Mohan <puranjay@kernel.org>
  Rae Moar <rmoar@google.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Ravi Bangoria <ravi.bangoria@amd.com>
  Rick Edgecombe <rick.p.edgecombe@intel.com>
  Ritu Chaudhary <rituc@nvidia.com>
  Rob Herring (Arm) <robh@kernel.org>
  robelin <robelin@nvidia.com>
  Rodrigo Vivi <rodrigo.vivi@intel.com>
  Roger Quadros <rogerq@kernel.org>
  Ryan Walklin <ryan@testtoast.com>
  Sam Protsenko <semen.protsenko@linaro.org>
  Sameer Pujar <spujar@nvidia.com>
  Samuel Holland <samuel.holland@sifive.com>
  Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
  Sean Anderson <sean.anderson@linux.dev>
  Sean Christopherson <seanjc@google.com>
  Seunghwan Baek <sh8267.baek@samsung.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Simon Arlott <simon@octiron.net>
  Simon Horman <horms@kernel.org>
  Simon Horman <horms@kernel.org> # build-tested
  Souradeep Chakrabarti <schakrabarti@linux.microsoft.com>
  Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
  Stanislav Fomichev <sdf@fomichev.me>
  Stefan Wahren <wahrenst@gmx.net>
  Stephan Gerhold <stephan.gerhold@linaro.org>
  Stephen Boyd <sboyd@kernel.org>
  Stephen Boyd <swboyd@chromium.org>
  Stephen Hemminger <stephen@networkplumber.org>
  Steve French <stfrench@microsoft.com>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Steven Rostedt <rostedt@goodmis.org>
  Takashi Iwai <tiwai@suse.de>
  Terry Cheong <htcheong@chromium.org>
  Thomas Zimmermann <tzimmermann@suse.de>
  Toke Høiland-Jørgensen <toke@redhat.com>
  Tom Dohrmann <erbse.13@gmx.de>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Tvrtko Ursulin <tursulin@igalia.com>
  Tze-nan Wu <Tze-nan.Wu@mediatek.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Uwe Kleine-König <u.kleine-koenig@baylibre.com>
  Uwe Kleine-König <ukleinek@kernel.org>
  Vadim Fedorenko <vadfed@meta.com>
  Vadim Fedorenko <vadim.fedorenko@linux.dev>
  Vasiliy Kovalev <kovalev@altlinux.org>
  Ville Syrjälä <ville.syrjala@linux.intel.com>
  Vincent Woltmann <vincent@woltmann.art>
  Vinicius Costa Gomes <vinicius.gomes@intel.com>
  Vinod Govindapillai <vinod.govindapillai@intel.com>
  Viresh Kumar <viresh.kumar@linaro.org>
  Vitaly Kuznetsov <vkuznets@redhat.com>
  Wedson Almeida Filho <wedsonaf@gmail.com>
  Werner Sembach <wse@tuxedocomputers.com>
  Will Deacon <will@kernel.org>
  xingwei lee <xrivendell7@gmail.com>
  Xingyu Wu <xingyu.wu@starfivetech.com>
  Yan Zhao <yan.y.zhao@intel.com>
  Yanghui Li <yanghui.li@mediatek.com>
  yuxin wang <wang1315768607@163.com>
  Zhang Yi <zhangyi@everest-semi.com>
  Zheng Yejian <zhengyejian@huaweicloud.com>

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
 test-armhf-armhf-xl-credit1                                  fail    
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
   c763c4339688..d1f2d51b711a  d1f2d51b711a3b7f1ae1b46701c769c1d580fa7f -> tested/linux-linus

