Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67ADA9776B9
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 04:05:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797890.1207950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sovft-0007Ec-3k; Fri, 13 Sep 2024 02:04:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797890.1207950; Fri, 13 Sep 2024 02:04:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sovft-0007CN-0L; Fri, 13 Sep 2024 02:04:41 +0000
Received: by outflank-mailman (input) for mailman id 797890;
 Fri, 13 Sep 2024 02:04:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sovfs-0007CD-E4; Fri, 13 Sep 2024 02:04:40 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sovfs-0002II-98; Fri, 13 Sep 2024 02:04:40 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sovfr-0005ZV-Rd; Fri, 13 Sep 2024 02:04:39 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sovfr-0001lQ-Qc; Fri, 13 Sep 2024 02:04:39 +0000
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
	bh=1YbMPx7u3R30OKSoMSWbWfT/RB9NHCJY6huiqb5runM=; b=DxvhDhlMLOVCuL9lY2BRP7Zqk4
	/xMmzTeHuZtQQnrwyYIDKxCLfZaz6dSYFHHNtVlmn9HF7DuS3/Bw5Z2O+A5WDNtae/975NSyvlzml
	yqt64QUqTu+WGq/PROhCrRps9n4KvEVLOFAlZ1DcsMuVzAoAGilwdSne+YrYNspzFLMc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187674-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-6.1 test] 187674: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-6.1:test-armhf-armhf-xl-rtds:host-ping-check-xen:fail:allowable
    linux-6.1:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=5f55cad62cc9d8d29dd3556e0243b14355725ffb
X-Osstest-Versions-That:
    linux=5ca5b389fddfe4ce3a698cbc1321fac3d8e3e5b1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 13 Sep 2024 02:04:39 +0000

flight 187674 linux-6.1 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187674/

Failures :-/ but no regressions.

Regressions which are regarded as allowable (not blocking):
 test-armhf-armhf-xl-rtds     10 host-ping-check-xen      fail REGR. vs. 187566

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 187566
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 187566
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 187566
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 187566
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 187566
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 187566
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                5f55cad62cc9d8d29dd3556e0243b14355725ffb
baseline version:
 linux                5ca5b389fddfe4ce3a698cbc1321fac3d8e3e5b1

Last test of basis   187566  2024-09-08 06:13:26 Z    4 days
Testing same since   187674  2024-09-12 09:43:20 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Achal Verma <a-verma1@ti.com>
  Adrian Hunter <adrian.hunter@intel.com>
  Aleksandr Mishin <amishin@t-argos.ru>
  Alex Deucher <alexander.deucher@amd.com>
  Alex Hung <alex.hung@amd.com>
  Alexandre Belloni <alexandre.belloni@bootlin.com>
  Alexey Dobriyan <adobriyan@gmail.com>
  Alice Ryhl <aliceryhl@google.com>
  Alistair Popple <apopple@nvidia.com>
  Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
  Andre Przywara <andre.przywara@arm.com>
  Andreas Hindborg <a.hindborg@samsung.com>
  Andreas Ziegler <ziegler.andreas@siemens.com>
  Andrew Jeffery <andrew@codeconstruct.com.au>
  Andrew Morton <akpm@linux-foundation.org>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Anna Schumaker <Anna.Schumaker@Netapp.com>
  Anton Ivanov <anton.ivanov@cambridgegreys.com>
  Arend van Spriel <arend.vanspriel@broadcom.com>
  Aurabindo Pillai <aurabindo.pillai@amd.com>
  Barry Song <baohua@kernel.org>
  Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Basavaraj Natikar <Basavaraj.Natikar@amd.com>
  Benjamin Marzinski <bmarzins@redhat.com>
  Bernd Schubert <bschubert@ddn.com>
  Bjorn Andersson <andersson@kernel.org>
  Bjorn Helgaas <bhelgaas@google.com>
  Borislav Petkov (AMD) <bp@alien8.de>
  Brian Johannesmeyer <bjohannesmeyer@gmail.com>
  Brian Norris <briannorris@chromium.org>
  Camila Alvarez <cam.alvarez.i@gmail.com>
  Carlos Llamas <cmllamas@google.com>
  Casey Schaufler <casey@schaufler-ca.com>
  Catalin Marinas <catalin.marinas@arm.com>
  Chandan Kumar Rout <chandanx.rout@intel.com>
  Chandan Kumar Rout <chandanx.rout@intel.com> (A Contingent Worker at Intel)
  Chen Ni <nichen@iscas.ac.cn>
  Chen-Yu Tsai <wenst@chromium.org>
  Christian Brauner <brauner@kernel.org>
  Christoffer Sandberg <cs@tuxedo.de>
  Christoph Hellwig <hch@lst.de>
  Christophe Leroy <christophe.leroy@csgroup.eu>
  Cong Wang <cong.wang@bytedance.com>
  Corentin Labbe <clabbe@baylibre.com>
  Daiwei Li <daiweili@google.com>
  Damien Le Moal <dlemoal@kernel.org>
  Dan Carpenter <dan.carpenter@linaro.org>
  Dan Williams <dan.j.williams@intel.com>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniel Lezcano <daniel.lezcano@linaro.org>
  Daniel Vetter <daniel.vetter@ffwll.ch>
  Daniel Wheeler <daniel.wheeler@amd.com>
  Danijel Slivka <danijel.slivka@amd.com>
  Dave Hansen <dave.hansen@linux.intel.com>
  David Fernandez Gonzalez <david.fernandez.gonzalez@oracle.com>
  David Howells <dhowells@redhat.com>
  David Lechner <dlechner@baylibre.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Dawid Osuchowski <dawid.osuchowski@linux.intel.com>
  Dharmendra Singh <dsingh@ddn.com>
  Diogo Jahchan Koike <djahchankoike@gmail.com>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Dominik Brodowski <linux@dominikbrodowski.net>
  Douglas Anderson <dianders@chromium.org>
  Dumitru Ceclan <dumitru.ceclan@analog.com>
  Dumitru Ceclan <mitrutzceclan@gmail.com>
  Eric Dumazet <edumazet@google.com>
  Faisal Hassan <quic_faisalh@quicinc.com>
  Felix Moessbauer <felix.moessbauer@siemens.com>
  Filipe Manana <fdmanana@suse.com>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Foster Snowhill <forst@pen.gy>
  Frank Li <Frank.Li@nxp.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Geert Uytterhoeven <geert@linux-m68k.org>
  Georg Gottleuber <ggo@tuxedocomputers.com>
  Georgi Valkov <gvalkov@gmail.com>
  Giovanni Cabiddu <giovanni.cabiddu@intel.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Guillaume Nault <gnault@redhat.com>
  Guillaume Stols <gstols@baylibre.com>
  Hanjun Guo <guohanjun@huawei.com>
  Hans de Goede <hdegoede@redhat.com>
  Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Hareshx Sankar Raj <hareshx.sankar.raj@intel.com>
  Hawking Zhang <Hawking.Zhang@amd.com>
  Heiko Carstens <hca@linux.ibm.com>
  Herbert Xu <herbert@gondor.apana.org.au>
  Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
  Ingo Molnar <mingo@kernel.org>
  Jacky Bai <ping.bai@nxp.com>
  Jacob Pan <jacob.jun.pan@linux.intel.com>
  Jakub Kicinski <kuba@kernel.org>
  James Morse <james.morse@arm.com>
  Jan Kara <jack@suse.cz>
  Jan Kiszka <jan.kiszka@siemens.com>
  Jani Nikula <jani.nikula@intel.com>
  Jann Horn <jannh@google.com>
  Jarkko Nikula <jarkko.nikula@linux.intel.com>
  Jens Axboe <axboe@kernel.dk>
  Jernej Skrabec <jernej.skrabec@gmail.com>
  Jerry Zuo <jerry.zuo@amd.com>
  Jianyong Wu <jianyong.wu@arm.com>
  Jiaxun Yang <jiaxun.yang@flygoat.com>
  Jiri Kosina <jkosina@suse.com>
  Joanne Koong <joannelkoong@gmail.com>
  Joerg Roedel <jroedel@suse.de>
  Johannes Berg <johannes.berg@intel.com>
  Johannes Weiner <hannes@cmpxchg.org>
  Jon Hunter <jonathanh@nvidia.com>
  Jonas Gorski <jonas.gorski@bisdn.de>
  Jonathan Bell <jonathan@raspberrypi.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
  Josef Bacik <josef@toxicpanda.com>
  Jules Irenge <jbi.octave@gmail.com>
  Kalle Valo <kvalo@kernel.org>
  Kan Liang <kan.liang@linux.intel.com>
  Kees Cook <kees@kernel.org>
  Keita Aihara <keita.aihara@sony.com>
  Keith Busch <kbusch@kernel.org>
  Kent Overstreet <kent.overstreet@linux.dev>
  Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
  Kishon Vijay Abraham I <kishon@ti.com>
  Konstantin Andreev <andreev@swemel.ru>
  Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
  Krishna Kumar <krishnak@linux.ibm.com>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Krzysztof Wilczyński <kwilczynski@kernel.org>
  Kuniyuki Iwashima <kuniyu@amazon.com>
  Larysa Zaremba <larysa.zaremba@intel.com>
  Lee Jones <lee@kernel.org>
  Li Nan <linan122@huawei.com>
  Liao Chen <liaochen4@huawei.com>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Lu Baolu <baolu.lu@linux.intel.com>
  Luis Henriques (SUSE) <luis.henriques@linux.dev>
  Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Ma Ke <make24@iscas.ac.cn>
  Maciej Fijalkowski <maciej.fijalkowski@intel.com>
  Madalin Bucur <madalin.bucur@oss.nxp.com>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Marek Behún <kabel@kernel.org>
  Marek Olšák <marek.olsak@amd.com>
  Mark Brown <broonie@kernel.org>
  Martin KaFai Lau <martin.lau@kernel.org>
  Matt Johnston <matt@codeconstruct.com.au>
  Matteo Martelli <matteomartelli3@gmail.com>
  Matthew Maurer <mmaurer@google.com>
  Matthieu Baerts (NGI0) <matttbe@kernel.org>
  Maurizio Lombardi <mlombard@redhat.com>
  Max Ramanouski <max8rr8@gmail.com>
  Maxim Levitsky <mlevitsk@redhat.com>
  Maximilien Perreault <maximilienperreault@gmail.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michal Koutný <mkoutny@suse.com>
  Miguel Luis <miguel.luis@oracle.com>
  Miguel Ojeda <ojeda@kernel.org>
  Miklos Szeredi <mszeredi@redhat.com>
  Mikulas Patocka <mpatocka@redhat.com>
  Mitchell Levy <levymitchell0@gmail.com>
  Mohan Kumar <mkumard@nvidia.com>
  Muchun Song <muchun.song@linux.dev>
  Naman Jain <namjain@linux.microsoft.com>
  Namjae Jeon <linkinjeon@kernel.org>
  Nicholas Piggin <npiggin@gmail.com>
  Nikolay Aleksandrov <razor@blackwall.org>
  Oleg Nesterov <oleg@redhat.com>
  Oliver Neukum <oneukum@suse.com>
  Olivier Sobrie <olivier@sobrie.be>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Pali Rohár <pali@kernel.org>
  Palmer Dabbelt <palmer@rivosinc.com>
  Paolo Abeni <pabeni@redhat.com>
  Paul E. McKenney <paulmck@kernel.org>
  Pavel Machek (CIP) <pavel@denx.de>
  Pawel Dembicki <paweldembicki@gmail.com>
  Peng Wu <wupeng58@huawei.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Peter Zijlstra <peterz@infradead.org>
  Phillip Lougher <phillip@squashfs.org.uk>
  Pucha Himasekhar Reddy <himasekharx.reddy.pucha@intel.com> (A Contingent worker at Intel)
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Ravi Bangoria <ravi.bangoria@amd.com>
  Reijer Boekhoff <reijerboekhoff@protonmail.com>
  Richard Fitzgerald <rf@opensource.cirrus.com>
  Ritu Chaudhary <rituc@nvidia.com>
  Rob Herring (Arm) <robh@kernel.org>
  robelin <robelin@nvidia.com>
  Rodrigo Siqueira <rodrigo.siqueira@amd.com>
  Roland Xu <mu001999@outlook.com>
  Ron Economos <re@w6rz.net>
  Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
  Ryusuke Konishi <konishi.ryusuke@gmail.com>
  Salvatore Bonaccorso <carnil@debian.org>
  Sam Protsenko <semen.protsenko@linaro.org>
  Sameer Pujar <spujar@nvidia.com>
  Sascha Hauer <s.hauer@pengutronix.de>
  Sasha Levin <sashal@kernel.org>
  Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
  Saurabh Sengar <ssengar@linux.microsoft.com>
  Sean Anderson <sean.anderson@linux.dev>
  Sean Christopherson <seanjc@google.com>
  Serge Semin <fancer.lancer@gmail.com>
  Seunghwan Baek <sh8267.baek@samsung.com>
  Shakeel Butt <shakeel.butt@linux.dev>
  Shantanu Goel <sgoel01@yahoo.com>
  Shawn Anastasio <sanastasio@raptorengineering.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Simon Arlott <simon@octiron.net>
  Simon Horman <horms@kernel.org>
  Souradeep Chakrabarti <schakrabarti@linux.microsoft.com>
  Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
  Stefan Althöfer <Stefan.Althoefer@janztec.com>
  Stefan Wiehler <stefan.wiehler@nokia.com>
  Stephen Hemminger <stephen@networkplumber.org>
  Steve French <stfrench@microsoft.com>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Sven Schnelle <svens@linux.ibm.com>
  Takashi Iwai <tiwai@suse.de>
  Tejun Heo <tj@kernel.org>
  Terry Cheong <htcheong@chromium.org>
  Theodore Ts'o <tytso@mit.edu>
  Thinh Nguyen <Thinh.Nguyen@synopsys.com>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Thomas Gleixner <tglx@linutronix.de>
  Thomas Kopp <thomas.kopp@microchip.com>
  Toke Høiland-Jørgensen <toke@redhat.com>
  Tomas Krcka <krckatom@amazon.de>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Trond Myklebust <trond.myklebust@hammerspace.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Uros Bizjak <ubizjak@gmail.com>
  Vasily Gorbik <gor@linux.ibm.com>
  Vignesh Raghavendra <vigneshr@ti.com>
  Vinicius Costa Gomes <vinicius.gomes@intel.com>
  Vinod Koul <vkoul@kernel.org>
  Vishnu Pajjuri <vishnu@os.amperecomputing.com>
  Vladimir Oltean <vladimir.oltean@nxp.com>
  Waiman Long <longman@redhat.com>
  Werner Sembach <wse@tuxedocomputers.com>
  Will Deacon <will@kernel.org>
  yang.zhang <yang.zhang@hexintek.com>
  yangyun <yangyun50@huawei.com>
  Yicong Yang <yangyicong@hisilicon.com>
  Yifan Zha <Yifan.Zha@amd.com>
  Yonghong Song <yhs@fb.com>
  Yunjian Wang <wangyunjian@huawei.com>
  Zenghui Yu <yuzenghui@huawei.com>
  Zheng Qixing <zhengqixing@huawei.com>
  Zheng Yejian <zhengyejian@huaweicloud.com>
  Zijun Hu <quic_zijuhu@quicinc.com>
  Zqiang <qiang.zhang1211@gmail.com>

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
 test-armhf-armhf-xl-rtds                                     fail    
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
   5ca5b389fddfe..5f55cad62cc9d  5f55cad62cc9d8d29dd3556e0243b14355725ffb -> tested/linux-6.1

