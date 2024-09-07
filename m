Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC0C970320
	for <lists+xen-devel@lfdr.de>; Sat,  7 Sep 2024 18:19:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.792313.1202241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smy7p-0001di-Ut; Sat, 07 Sep 2024 16:17:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 792313.1202241; Sat, 07 Sep 2024 16:17:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smy7p-0001bb-Rc; Sat, 07 Sep 2024 16:17:25 +0000
Received: by outflank-mailman (input) for mailman id 792313;
 Sat, 07 Sep 2024 16:17:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1smy7o-0001bR-L4; Sat, 07 Sep 2024 16:17:24 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1smy7o-0007wb-1b; Sat, 07 Sep 2024 16:17:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1smy7n-0002bg-I4; Sat, 07 Sep 2024 16:17:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1smy7n-0008Jf-Hg; Sat, 07 Sep 2024 16:17:23 +0000
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
	bh=37WBEcbyXz2clmwaBC0wo4vwA+ozeR+oR4bwJQzLMW4=; b=JR5fhLDZD8IjM4iOtExbRajIr5
	kpEZjta+mvJnH+qaxQlHjuK8ayU9pCA7GC9BqwzfM1eUvnHn6gOrWWe+CBxOU2WsPW8idDysMs4qh
	QWyblw6Wki3AfsvyA5mdo3Lc+FbvMYG6UpP3nrgaecnJTkvbZ2OpXTyar513xFBxwlEA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187546-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 187546: regressions - FAIL
X-Osstest-Failures:
    linux-linus:build-armhf:xen-build:fail:regression
    linux-linus:build-armhf-libvirt:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-examine:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=b31c4492884252a8360f312a0ac2049349ddf603
X-Osstest-Versions-That:
    linux=c763c43396883456ef57e5e78b64d3c259c4babc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 07 Sep 2024 16:17:23 +0000

flight 187546 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187546/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-armhf                   6 xen-build                fail REGR. vs. 187504

Tests which did not succeed, but are not blocking:
 build-armhf-libvirt           1 build-check(1)               blocked  n/a
 test-armhf-armhf-examine      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-vhd  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-arndale   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit1   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit2   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-multivcpu  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-qcow2     1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-raw       1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-rtds      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 187504
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 187504
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 187504
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 187504
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 187504
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                b31c4492884252a8360f312a0ac2049349ddf603
baseline version:
 linux                c763c43396883456ef57e5e78b64d3c259c4babc

Last test of basis   187504  2024-09-05 10:21:11 Z    2 days
Failing since        187510  2024-09-05 23:42:38 Z    1 days    3 attempts
Testing same since   187546  2024-09-07 03:27:08 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Adam Queler <queler+k@gmail.com>
  Adrian Hunter <adrian.hunter@intel.com>
  Adrián Larumbe <adrian.larumbe@collabora.com>
  Aleksandr Mishin <amishin@t-argos.ru>
  Alex Deucher <alexander.deucher@amd.com>
  Alexander Stein <alexander.stein@ew.tq-group.com>
  Alexandre Ghiti <alexghiti@rivosinc.com>
  Alexei Starovoitov <ast@kernel.org>
  Alice Ryhl <aliceryhl@google.com>
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
  Martin KaFai Lau <martin.lau@kernel.org>
  Mary Guillemard <mary.guillemard@collabora.com>
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
  Michael Vetter <jubalh@iodoru.org>
  Miguel Ojeda <ojeda@kernel.org>
  Mikko Tiihonen <mikko.tiihonen@iki.fi>
  Mikulas Patocka <mpatocka@redhat.com>
  Mohan Kumar <mkumard@nvidia.com>
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
 build-armhf                                                  fail    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          blocked 
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          blocked 
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
 test-armhf-armhf-xl-arndale                                  blocked 
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  blocked 
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  blocked 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     blocked 
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     blocked 
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                blocked 
 test-amd64-amd64-pair                                        pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-xl-qcow2                                    blocked 
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-amd64-amd64-xl-raw                                      pass    
 test-armhf-armhf-xl-raw                                      blocked 
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-libvirt-vhd                                 blocked 
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


Not pushing.

(No revision log; it would be 6620 lines long.)

