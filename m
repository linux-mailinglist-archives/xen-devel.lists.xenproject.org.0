Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD018C8E48
	for <lists+xen-devel@lfdr.de>; Sat, 18 May 2024 00:27:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724496.1129781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s862s-0002Gm-3c; Fri, 17 May 2024 22:27:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724496.1129781; Fri, 17 May 2024 22:27:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s862r-0002DZ-V8; Fri, 17 May 2024 22:27:21 +0000
Received: by outflank-mailman (input) for mailman id 724496;
 Fri, 17 May 2024 22:27:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s862r-0002DP-6A; Fri, 17 May 2024 22:27:21 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s862r-0008LK-0F; Fri, 17 May 2024 22:27:21 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s862q-0006Bw-Oc; Fri, 17 May 2024 22:27:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1s862q-0002lX-OA; Fri, 17 May 2024 22:27:20 +0000
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
	bh=cVdy2naBceOuUp3It3wTtxCPCF/XljMuCp20O5kEwRY=; b=fsZtqjARwuWSROiPhYapS4JebD
	qvjrN/2zqVrhCy32DYNo/TjaBYgIS3YycYdX84FgNk3TGPooxScPaai2anqUWeBm5RTp/fhJZRfma
	9xFDvbc0iQOMV58lLC3lbTRHhqKOvWT8fighFOVWcmr3uCdmvKKVOJhe2MgDhnZ6AbMs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186028-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-6.1 test] 186028: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-6.1:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=4078fa637fcd80c8487680ec2e4ef7c58308e9aa
X-Osstest-Versions-That:
    linux=909ba1f1b4146de529469910c1bd0b1248964536
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 17 May 2024 22:27:20 +0000

flight 186028 linux-6.1 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186028/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 185901
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 185901
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 185901
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 185901
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 185901
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 185901
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                4078fa637fcd80c8487680ec2e4ef7c58308e9aa
baseline version:
 linux                909ba1f1b4146de529469910c1bd0b1248964536

Last test of basis   185901  2024-05-02 15:12:21 Z   15 days
Testing same since   186028  2024-05-17 10:16:47 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Adam Goldman <adamg@pobox.com>
  Al Viro <viro@zeniv.linux.org.uk>
  Alan Stern <stern@rowland.harvard.edu>
  Aleksa Savic <savicaleksa83@gmail.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alexander Gordeev <agordeev@linux.ibm.com>
  Alexander Potapenko <glider@google.com>
  Alexander Stein <alexander.stein@ew.tq-group.com>
  Alexander Usyskin <alexander.usyskin@intel.com>
  Alexandra Winter <wintera@linux.ibm.com>
  Alexei Starovoitov <ast@kernel.org>
  Allen Pais <apais@linux.microsoft.com>
  Aman Dhoot <amandhoot12@gmail.com>
  Amit Sunil Dhamne <amitsd@google.com>
  Anand Jain <anand.jain@oracle.com>
  Andrea Righi <andrea.righi@canonical.com>
  Andrea Righi <andrea.righi@canonical.com> # non-hostprogs
  Andreas Gruenbacher <agruenba@redhat.com>
  Andrei Matei <andreimatei1@gmail.com>
  Andrew Donnellan <ajd@linux.ibm.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andrew Price <anprice@redhat.com>
  Andrey Ryabinin <ryabinin.a.a@gmail.com>
  Andrii Nakryiko <andrii@kernel.org>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Anton Protopopov <aspsk@isovalent.com>
  Arjan van de Ven <arjan@linux.intel.com>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Arnd Bergmann <arnd@arndb.de>
  Asahi Lina <lina@asahilina.net>
  Asbjørn Sloth Tønnesen <ast@fiberby.net>
  Aurabindo Pillai <aurabindo.pillai@amd.com>
  Badhri Jagan Sridharan <badhri@google.com>
  Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Benno Lossin <benno.lossin@proton.me>
  Billy Tsai <billy_tsai@aspeedtech.com>
  Boris Burkov <boris@bur.io>
  Borislav Petkov (AMD) <bp@alien8.de>
  Boy Wu <boy.wu@mediatek.com>
  Boy.Wu <boy.wu@mediatek.com>
  Bui Quang Minh <minhquangbui99@gmail.com>
  Bumyong Lee <bumyong.lee@samsung.com>
  Chad Wagner <wagnerch42@gmail.com>
  Chen Ni <nichen@iscas.ac.cn>
  Chen-Yu Tsai <wenst@chromium.org>
  Chris Wulff <chris.wulff@biamp.com>
  Christian A. Ehrhardt <lk@c--e.de>
  Christian König <christian.koenig@amd.com>
  Christoph Paasch <cpaasch@apple.com>
  Claudio Imbrenda <imbrenda@linux.ibm.com>
  Conor Dooley <conor.dooley@microchip.com>
  Damien Le Moal <dlemoal@kernel.org>
  Dan Carpenter <dan.carpenter@linaro.org>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniel Okazaki <dtokazaki@google.com>
  Daniel Wheeler <daniel.wheeler@amd.com>
  Daniel Xu <dxu@dxuuu.xyz>
  David Bauer <mail@david-bauer.net>
  David Lechner <dlechner@baylibre.com>
  David Rientjes <rientjes@google.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Devyn Liu <liudingyuan@huawei.com>
  Dmitry Antipov <dmantipov@yandex.ru>
  Dominique Martinet <dominique.martinet@atmark-techno.com>
  Doug Berger <opendmb@gmail.com>
  Doug Smythies <dsmythies@telus.net>
  Douglas Anderson <dianders@chromium.org>
  Duoming Zhou <duoming@zju.edu.cn>
  Eric Curtin <ecurtin@redhat.com>
  Eric Dumazet <edumazet@google.com>
  Eric Van Hensbergen <ericvh@kernel.org>
  Felix Fietkau <nbd@nbd.name>
  Florian Fainelli <f.fainelli@gmail.com>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Gabe Teeger <gabe.teeger@amd.com>
  Gaurav Batra <gbatra@linux.ibm.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  George Shen <george.shen@amd.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Guillaume Nault <gnault@redhat.com>
  Hans de Goede <hdegoede@redhat.com>
  Heiko Carstens <hca@linux.ibm.com>
  Heiner Kallweit <hkallweit1@gmail.com>
  Igor Artemiev <Igor.A.Artemiev@mcst.ru>
  Ivan Babrou <ivan@cloudflare.com>
  Jakub Kicinski <kuba@kernel.org>
  James Chapman <jchapman@katalix.com>
  Jan Dakinevich <jan.dakinevich@salutedevices.com>
  Jarkko Sakkinen <jarkko@kernel.org>
  Jason Xing <kernelxing@tencent.com>
  Javier Carrasco <javier.carrasco.cruz@gmail.com>
  Jeff Johnson <quic_jjohnson@quicinc.com>
  Jeff Layton <jlayton@kernel.org>
  Jens Axboe <axboe@kernel.dk>
  Jens Remus <jremus@linux.ibm.com>
  Jeremy Bongio <jbongio@google.com>
  Jernej Skrabec <jernej.skrabec@gmail.com>
  Jerome Brunet <jbrunet@baylibre.com>
  Jesper Dangaard Brouer <hawk@kernel.org>
  Jian Shen <shenjian15@huawei.com>
  Jiaxun Yang <jiaxun.yang@flygoat.com>
  Jijie Shao <shaojijie@huawei.com>
  Jim Cromie <jim.cromie@gmail.com>
  Joakim Sindholt <opensource@zhasha.com>
  Joao Paulo Goncalves <joao.goncalves@toradex.com>
  Joerg Roedel <jroedel@suse.de>
  Johan Hovold <johan+linaro@kernel.org>
  Johannes Berg <johannes.berg@intel.com>
  John Stultz <jstultz@google.com>
  Jon Hunter <jonathanh@nvidia.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Josef Bacik <josef@toxicpanda.com>
  Julian Taylor <julian.taylor@1und1.de>
  Justin Ernst <justin.ernst@hpe.com>
  Justin Tee <justin.tee@broadcom.com>
  Karthikeyan Ramasubramanian <kramasub@chromium.org>
  Kefeng Wang <wangkefeng.wang@huawei.com>
  Keith Busch <kbusch@kernel.org>
  Kent Gibson <warthog618@gmail.com>
  kernelci.org bot <bot@kernelci.org>
  Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
  Krzysztof Kozlowski <krzk@kernel.org>
  Kuniyuki Iwashima <kuniyu@amazon.com>
  Lakshmi Yadlapati <lakshmiy@us.ibm.com>
  Leah Rumancik <leah.rumancik@gmail.com>
  Len Brown <len.brown@intel.com>
  Li Nan <linan122@huawei.com>
  Li Zetao <lizetao1@huawei.com>
  Lijo Lazar <lijo.lazar@amd.com>
  linke li <lilinke99@qq.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Lukasz Majewski <lukma@denx.de>
  Lyude Paul <lyude@redhat.com>
  Maarten Vanraes <maarten@rmail.be>
  Mans Rullgard <mans@mansr.com>
  Marc Zyngier <maz@kernel.org>
  Marek Behún <kabel@kernel.org>
  Marek Vasut <marex@denx.de>
  Mario Limonciello <mario.limonciello@amd.com>
  Marius Zachmann <mail@mariuszachmann.de>
  Mark Brown <broonie@kernel.org>
  Martin K. Petersen <martin.petersen@oracle.com>
  Martin KaFai Lau <martin.lau@kernel.org>
  Martin Rodriguez Reboredo <yakoyoku@gmail.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Matthieu Baerts (NGI0) <matttbe@kernel.org>
  Matti Vaittinen <mazziesaccount@gmail.com>
  Maurizio Lombardi <mlombard@redhat.com>
  Maxime Ripard <mripard@kernel.org>
  Miaohe Lin <linmiaohe@huawei.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael Kelley <mhklinux@outlook.com>
  Miguel Ojeda <ojeda@kernel.org>
  Mika Westerberg <mika.westerberg@linux.intel.com>
  Mike Kravetz <mike.kravetz@oracle.com>
  Mike Rapoport (IBM) <rppt@kernel.org>
  Nageswara R Sastry <rnsastry@linux.ibm.com>
  Namhyung Kim <namhyung@kernel.org>
  Namjae Jeon <linkinjeon@kernel.org>
  Nayna Jain <nayna@linux.ibm.com>
  Neal Cardwell <ncardwell@google.com>
  Neil Armstrong <neil.armstrong@linaro.org>
  Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
  Nikhil Rao <nikhil.rao@intel.com>
  Nikolay Aleksandrov <razor@blackwall.org>
  Nilesh Javali <njavali@marvell.com>
  Oliver Upton <oliver.upton@linux.dev>
  Oscar Salvador <osalvador@suse.de>
  Paolo Abeni <pabeni@redhat.com>
  Paul Davey <paul.davey@alliedtelesis.co.nz>
  Paul Menzel <pmenzel@molgen.mpg.de> # Dell XPS 13
  Pavel Machek (CIP) <pavel@denx.de>
  Peiyang Wang <wangpeiyang1@huawei.com>
  Peng Liu <liupeng17@lenovo.com>
  Peter Korsgaard <peter@korsgaard.com>
  Peter Ujfalusi <peter.ujfalusi@gmail.com>
  Peter Wang <peter.wang@mediatek.com>
  Peter Xu <peterx@redhat.com>
  Phil Elwell <phil@raspberrypi.com>
  Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
  Qu Wenruo <wqu@suse.com>
  Ramona Gradinariu <ramona.bolboaca13@gmail.com>
  Raphael Nestler <raphael.nestler@gmail.com> # non-hostprogs
  Richard Gobert <richardbgobert@gmail.com>
  Rick Edgecombe <rick.p.edgecombe@intel.com>
  Rik van Riel <riel@surriel.com>
  Roded Zats <rzats@paloaltonetworks.com>
  Rodrigo Vivi <rodrigo.vivi@intel.com>
  Ron Economos <re@w6rz.net>
  Ronald Wahl <ronald.wahl@raritan.com> # KS8851 SPI
  Russell Currey <ruscur@russell.cc>
  Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
  Rémi Denis-Courmont <courmisch@gmail.com>
  Salvatore Bonaccorso <carnil@debian.org>
  Sameer Pujar <spujar@nvidia.com>
  Sasha Levin <sashal@kernel.org>
  Saurav Kashyap <skashyap@marvell.com>
  Sebastian Andrzej Siewior <bigeasy@linutronix.de>
  Sebastian Reichel <sebastian.reichel@collabora.com>
  SeongJae Park <sj@kernel.org>
  Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Shyam Prasad N <sprasad@microsoft.com>
  Sidhartha Kumar <sidhartha.kumar@oracle.com>
  Silvio Gissi <sifonsec@amazon.com>
  Song Liu <song@kernel.org>
  Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
  Stanislav Fomichev <sdf@google.com>
  Steffen Klassert <steffen.klassert@secunet.com>
  Stephen Boyd <sboyd@kernel.org>
  Steve French <stfrench@microsoft.com>
  Sungwoo Kim <iam@sung-woo.kim>
  Takashi Iwai <tiwai@suse.de>
  Takashi Sakamoto <o-takashi@sakamocchi.jp>
  Tejun Heo <tj@kernel.org>
  Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
  Thanassis Avgerinos <thanassis.avgerinos@gmail.com>
  Thierry Reding <treding@nvidia.com>
  Thinh Nguyen <Thinh.Nguyen@synopsys.com>
  Thomas Bertschinger <tahbertschinger@gmail.com>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Thomas Gleixner <tglx@linutronix.de>
  Tim Jiang <quic_tjiang@quicinc.com>
  Toke Høiland-Jørgensen <toke@redhat.com>
  Tomas Winkler <tomas.winkler@intel.com>
  Tony Luck <tony.luck@intel.com>
  Trond Myklebust <trond.myklebust@hammerspace.com>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Vanillan Wang <vanillanwang@163.com>
  Viken Dadhaniya <quic_vdadhani@quicinc.com>
  Ville Syrjälä <ville.syrjala@linux.intel.com>
  Vinod Koul <vkoul@kernel.org>
  Vlastimil Babka <vbabka@suse.cz>
  Wedson Almeida Filho <walmeida@microsoft.com>
  Wei Liu <wei.liu@kernel.org>
  Wei Yang <richard.weiyang@gmail.com>
  Wen Gu <guwen@linux.alibaba.com>
  Wyes Karny <wyes.karny@amd.com>
  Xin Long <lucien.xin@gmail.com>
  Xu Kuohai <xukuohai@huawei.com>
  Yang Yingliang <yangyingliang@huawei.com>
  Yann Sionneau <ysionneau@kalrayinc.com>
  Yann Sionneau<ysionneau@kalrayinc.com>
  Yi Zhang <yi.zhang@redhat.com>
  Yonglong Liu <liuyonglong@huawei.com>
  Zack Rusin <zack.rusin@broadcom.com>
  Zeng Heng <zengheng4@huawei.com>

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
   909ba1f1b414..4078fa637fcd  4078fa637fcd80c8487680ec2e4ef7c58308e9aa -> tested/linux-6.1

