Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5C78AC1A2
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 00:19:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709652.1108638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryfVb-0006ja-P6; Sun, 21 Apr 2024 22:18:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709652.1108638; Sun, 21 Apr 2024 22:18:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryfVb-0006go-MM; Sun, 21 Apr 2024 22:18:03 +0000
Received: by outflank-mailman (input) for mailman id 709652;
 Sun, 21 Apr 2024 22:18:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ryfVa-0006ge-9e; Sun, 21 Apr 2024 22:18:02 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ryfVa-0005Sm-1t; Sun, 21 Apr 2024 22:18:02 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ryfVZ-0004ny-OU; Sun, 21 Apr 2024 22:18:01 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ryfVZ-0003fj-Nx; Sun, 21 Apr 2024 22:18:01 +0000
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
	bh=fhq7OxPWRRCv0zhvjCYqJxYNFJFW8Za1Was3aGcauIg=; b=Fck728y4YZeDeDaPFr0sG8rxwF
	qObKCoqhAj9WMYcmvgNtfl1PKwj3ar7jrujXOHuNxjGa1NdAcAMCNib61rqr4UkS0wJX3+Z7xtgm7
	79JVzdajBMPJwR4G6X458uPr79W8mMS0fFQYQbEyvB2K2ZzzrWuw1rLpiyqHXhgmWmFE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185750-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 185750: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-libvirt:xen-boot:fail:heisenbug
    linux-linus:test-armhf-armhf-xl:host-ping-check-native:fail:heisenbug
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=977b1ef51866aa7170409af80740788d4f9c4841
X-Osstest-Versions-That:
    linux=586b5dfb51b962c1b6c06495715e4c4f76a7fc5a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 21 Apr 2024 22:18:01 +0000

flight 185750 linux-linus real [real]
flight 185752 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/185750/
http://logs.test-lab.xenproject.org/osstest/logs/185752/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-libvirt      8 xen-boot            fail pass in 185752-retest
 test-armhf-armhf-xl        6 host-ping-check-native fail pass in 185752-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt 16 saverestore-support-check fail in 185752 like 185347
 test-armhf-armhf-xl         15 migrate-support-check fail in 185752 never pass
 test-armhf-armhf-xl     16 saverestore-support-check fail in 185752 never pass
 test-armhf-armhf-libvirt    15 migrate-support-check fail in 185752 never pass
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 185347
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 185347
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 185347
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 185347
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 185347
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                977b1ef51866aa7170409af80740788d4f9c4841
baseline version:
 linux                586b5dfb51b962c1b6c06495715e4c4f76a7fc5a

Last test of basis   185347  2024-04-12 05:19:23 Z    9 days
Failing since        185442  2024-04-13 14:48:28 Z    8 days    6 attempts
Testing same since   185750  2024-04-21 12:13:57 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aaro Koskinen <aaro.koskinen@iki.fi>
  Abhinav Kumar <quic_abhinavk@quicinc.com>
  Adam Dunlap <acdunlap@google.com>
  Adrian Hunter <adrian.hunter@intel.com>
  Ai Chao <aichao@kylinos.cn>
  Al Viro <viro@zeniv.linux.org.uk>
  Alex Constantino <dreaming.about.electric.sheep@gmail.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alex Hung <alex.hung@amd.com>
  Alexander Gordeev <agordeev@linux.ibm.com>
  Alexandre Ghiti <alexghiti@rivosinc.com>
  Alexey Izbyshev <izbyshev@ispras.ru>
  Amir Goldstein <amir73il@gmail.com>
  Amit Pundir <amit.pundir@linaro.org>
  Andrew Jones <ajones@ventanamicro.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Animesh Manna <animesh.manna@intel.com>
  Anshuman Khandual <anshuman.khandual@arm.com>
  Ard Biesheuvel <ardb@kernel.org>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Arnd Bergmann <arnd@arndb.de>
  Arınç ÜNAL <arinc.unal@arinc9.com>
  Asbjørn Sloth Tønnesen <ast@fiberby.net>
  Ashutosh Dixit <ashutosh.dixit@intel.com>
  Bart Van Assche <bvanassche@acm.org>
  Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Bharath SM <bharathsm@microsoft.com>
  Bjorn Helgaas <bhelgaas@google.com>
  Boris Brezillon <boris.brezillon@collabora.com>
  Borislav Petkov (AMD) <bp@alien8.de>
  Carolina Jubran <cjubran@nvidia.com>
  Catalin Marinas <catalin.marinas@arm.com>
  Chao Yu <chao@kernel.org>
  Christian König <christian.koenig@amd.com>
  Christian König <christian.koenig@amd.com> (v1)
  Christian König <ckoenig.leichtzumerken@gmail.com>
  Christoph Hellwig <hch@lst.de>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Chuck Lever <chuck.lever@oracle.com>
  Coly Li <colyli@suse.de>
  Conor Dooley <conor.dooley@microchip.com>
  Cristian Marussi <cristian.marussi@arm.com>
  Damien Le Moal <dlemoal@kernel.org>
  Daniel Golle <daniel@makrotopia.org>
  Daniel Machon <daniel.machon@microchip.com>
  Daniel Sneddon <daniel.sneddon@linux.intel.com>
  Danilo Krummrich <dakr@redhat.com>
  Danny Lin <danny@orbstack.dev>
  Dapeng Mi <dapeng1.mi@linux.intel.com>
  Dave Airlie <airlied@redhat.com>
  David Hildenbrand <david@redhat.com>
  David Matlack <dmatlack@google.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Dexuan Cui <decui@microsoft.com>
  Dillon Varone <dillon.varone@amd.com>
  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Dmitry Osipenko <dmitry.osipenko@collabora.com>
  Dmitry Safonov <0x7f454c46@gmail.com>
  Eric Dumazet <edumazet@google.com>
  Eric Van Hensbergen <ericvh@kernel.org>
  Fabio Estevam <festevam@denx.de>
  Felix Fietkau <nbd@nbd.name>
  Felix Kuehling <felix.kuehling@amd.com>
  Florian Westphal <fw@strlen.de>
  Frank Li <Frank.Li@nxp.com>
  Fudongwang <fudong.wang@amd.com>
  Gavin Shan <gshan@redhat.com>
  Geert Uytterhoeven <geert@linux-m68k.org>
  Gerd Bayer <gbayer@linux.ibm.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Haiyue Wang <haiyue.wang@intel.com>
  Hamza Mahfooz <hamza.mahfooz@amd.com>
  Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>
  Harish Kasiviswanthan <Harish.Kasiviswanthan@amd.com>
  Harry Wentland <harry.wentland@amd.com>
  Herbert Xu <herbert@gondor.apana.org.au>
  Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
  Huayu Zhang <zhanghuayu1233@qq.com>
  Igor Pylypiv <ipylypiv@google.com>
  Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
  Ilya Dryomov <idryomov@gmail.com>
  Ilya Maximets <i.maximets@ovn.org>
  Ingo Molnar <mingo@kernel.org>
  Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
  Jacob Pan <jacob.jun.pan@linux.intel.com>
  Jakub Kicinski <kuba@kernel.org>
  Jamal Hadi Salim <jhs@mojatatu.com>
  James Bottomley <James.Bottomley@HansenPartnership.com>
  Jammy Huang <jammy_huang@aspeedtech.com>
  Jason A. Donenfeld <Jason@zx2c4.com>
  Jason Gunthorpe <jgg@nvidia.com>
  Jason Wang <jasowang@redhat.com>
  Jeff Johnson <quic_jjohnson@quicinc.com> (v2)
  Jeff Layton <jlayton@kernel.org>
  Jens Axboe <axboe@kernel.dk>
  Jens Wiklander <jens.wiklander@linaro.org>
  Jeongjun Park <aha310510@gmail.com>
  Jiaxun Yang <jiaxun.yang@flygoat.com>
  Joakim Sindholt <opensource@zhasha.com>
  Joerg Roedel <jroedel@suse.de>
  Johan Hovold <johan+linaro@kernel.org>
  John Harrison <John.C.Harrison@Intel.com>
  John Stultz <jstultz@google.com>
  Jon Hunter <jonathanh@nvidia.com>
  Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
  Josh Poimboeuf <jpoimboe@kernel.org>
  Jouni Högander <jouni.hogander@intel.com>
  Julian Taylor <julian.taylor@1und1.de>
  Justin Stitt <justinstitt@google.com>
  Karthik Poosa <karthik.poosa@intel.com>
  Kees Cook <keescook@chromium.org>
  Kefeng Wang <wangkefeng.wang@huawei.com>
  Kenneth Feng <kenneth.feng@amd.com>
  Kent Overstreet <kent.overstreet@linux.dev>
  Kevin Loughlin <kevinloughlin@google.com>
  Krzysztof Kozlowski <krzk@kernel.org>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Kuniyuki Iwashima <kuniyu@amazon.com>
  Kuogee Hsieh <quic_khsieh@quicinc.com>
  Lang Yu <Lang.Yu@amd.com>
  Laura Nao <laura.nao@collabora.com>
  Lei Chen <lei.chen@smartx.com>
  Leon Romanovsky <leon@kernel.org>
  Li Ma <li.ma@amd.com>
  Li Nan <linan122@huawei.com>
  Lijo Lazar <lijo.lazar@amd.com>
  Like Xu <likexu@tencent.com>
  lima1002 <li.ma@amd.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Lokesh Gidra <lokeshgidra@google.com>
  Lu Baolu <baolu.lu@linux.intel.com>
  Luca Weiss <luca.weiss@fairphone.com>
  Lucas De Marchi <lucas.demarchi@intel.com>
  Luke D. Jones <luke@ljones.dev>
  Lyude Paul <lyude@redhat.com>
  Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
  Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
  Marc Ruhmann <ruhmann@luis.uni-hannover.de>
  Marc Zyngier <maz@kernel.org>
  Marcin Szycik <marcin.szycik@linux.intel.com>
  Mario Limonciello <mario.limonciello@amd.com>
  Mark Rutland <mark.rutland@arm.com>
  Mark Zhang <markzhang@nvidia.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Masami Hiramatsu (Google) <mhiramat@kernel.org>
  Matthew Auld <matthew.auld@intel.com>
  Mauro Carvalho Chehab <mchehab@kernel.org>
  Maxim Levitsky <mlevitsk@redhat.com>
  Maxime Ripard <mripard@kernel.org>
  Maíra Canal <mcanal@igalia.com>
  Miaohe Lin <linmiaohe@huawei.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael Guralnik <michaelgur@nvidia.com>
  Michael Kelley <mhklinux@outlook.com>
  Michael S. Tsirkin <mst@redhat.com>
  Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
  Miguel Ojeda <ojeda@kernel.org>
  Mike Rapoport (IBM) <rppt@kernel.org>
  Mikhail Kobuk <m.kobuk@ispras.ru>
  Miklos Szeredi <mszeredi@redhat.com>
  Ming Lei <ming.lei@redhat.com>
  Mingwei Zhang <mizhang@google.com>
  Muhammad Usama Anjum <usama.anjum@collabora.com>
  Namhyung Kim <namhyung@kernel.org>
  Naohiro Aota <naohiro.aota@wdc.com>
  Naoya Horiguchi <nao.horiguchi@gmail.com>
  Nathan Chancellor <nathan@kernel.org>
  Nathan Lynch <nathanl@linux.ibm.com>
  NeilBrown <neilb@suse.de>
  Nianyao Tang <tangnianyao@huawei.com>
  Oleg Nesterov <oleg@redhat.com>
  Oscar Salvador <osalvador@suse.de>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Abeni <pabeni@redhat.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Paul Barker <paul.barker.ct@bp.renesas.com>
  Paulo Alcantara (Red Hat) <pc@manguebit.com>
  Paulo Alcantara <pc@manguebit.com>
  Pavel Begunkov <asml.silence@gmail.com>
  Pekka Paalanen <pekka.paalanen@collabora.com>
  Peter Oberparleiter <oberpar@linux.ibm.com>
  Peter Xu <peterx@redhat.com>
  Petr Tesarik <petr.tesarik1@huawei-partners.com>
  Phillip Lougher <phillip@squashfs.org.uk>
  Pierre Gondois <pierre.gondois@arm.com>
  Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
  Pin-yen Lin <treapking@chromium.org>
  Prasad Pandit <pjp@fedoraproject.org>
  Qiang Zhang <qiang4.zhang@intel.com>
  Qu Wenruo <wqu@suse.com>
  Raag Jadav <raag.jadav@intel.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Rahul Rameshbabu <rrameshbabu@nvidia.com>
  Rick Edgecombe <rick.p.edgecombe@intel.com>
  Rik van Riel <riel@surriel.com>
  Rob Clark <robdclark@chromium.org>
  Rob Clark <robdclark@gmail.com>
  Rodrigo Vivi <rodrigo.vivi@intel.com>
  Roman Li <roman.li@amd.com>
  Ryusuke Konishi <konishi.ryusuke@gmail.com>
  Samuel Holland <samuel.holland@sifive.com>
  Sandipan Das <sandipan.das@amd.com>
  Sean Anderson <sean.anderson@seco.com>
  Sean Christopherson <seanjc@google.com>
  Sebastian Andrzej Siewior <bigeasy@linutronix.de>
  Serge Semin <fancer.lancer@gmail.com>
  shaoyunl <shaoyun.liu@amd.com>
  Shawn Guo <shawnguo@kernel.org>
  Shay Drory <shayd@nvidia.com>
  Shenghao Ding <shenghao-ding@ti.com>
  Shengyu Li <shengyu.li.evgeny@gmail.com>
  Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
  Shivaprasad G Bhat <sbhat@linux.ibm.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Siddharth Vadapalli <s-vadapalli@ti.com>
  Song Liu <song@kernel.org>
  Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
  Stephen Boyd <sboyd@kernel.org>
  Stephen Boyd <swboyd@chromium.org>
  Steve French <stfrench@microsoft.com>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Sudeep Holla <sudeep.holla@arm.com>
  Sujai Buvaneswaran <sujai.buvaneswaran@intel.com>
  Sumanth Korikkar <sumanthk@linux.ibm.com>
  Suraj Kandpal <suraj.kandpal@intel.com>
  Sven Schnelle <svens@linux.ibm.com>
  Takashi Iwai <tiwai@suse.de>
  Tao Su <tao1.su@linux.intel.com>
  Tao Zhou <tao.zhou1@amd.com>
  Tariq Toukan <tariqt@nvidia.com>
  Tejun Heo <tj@kernel.org>
  Thierry Reding <treding@nvidia.com>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Thomas Gleixner <tglx@linutronix.de>
  Thomas Zimmermann <tzimmermann@suse.de>
  Thorsten Blum <thorsten.blum@toblux.com>
  Tim Harvey <tharvey@gateworks.com>
  Tim Huang <Tim.Huang@amd.com>
  Tony Lindgren <tony@atomide.com>
  Tony Luck <tony.luck@intel.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Vanillan Wang <vanillanwang@163.com>
  Vasant Hegde <vasant.hegde@amd.com>
  Vasily Gorbik <gor@linux.ibm.com>
  Vidya Srinivas <vidya.srinivas@intel.com>
  Ville Syrjälä <ville.syrjala@linux.intel.com>
  Vitalii Torshyn <vitaly.torshyn@gmail.com>
  Vitaly Rodionov <vitalyr@opensource.cirrus.com>
  Vlastimil Babka <vbabka@suse.cz>
  Wachowski, Karol <karol.wachowski@intel.com>
  Wenjing Liu <wenjing.liu@amd.com>
  Xianting Tian <xianting.tian@linux.alibaba.com>
  xinhui pan <xinhui.pan@amd.com>
  xiongxin <xiongxin@kylinos.cn>
  Xiubo Li <xiubli@redhat.com>
  Xuchun Shang <xuchun.shang@linux.alibaba.com>
  Yang Li <yang.lee@linux.alibaba.com>
  Yanjun.Zhu <yanjun.zhu@linux.dev>
  Yaxiong Tian <tianyaxiong@kylinos.cn>
  Ye Li <ye.li@broadcom.com>
  Yifan Zhang <yifan1.zhang@amd.com>
  Yu Kuai <yukuai3@huawei.com>
  Yuanhe Shu <xiangzao@linux.alibaba.com>
  Yuntao Wang <ytcoode@gmail.com>
  Yuri Benditovich <yuri.benditovich@daynix.com>
  Zack Rusin <zack.rusin@broadcom.com>
  ZhenGuo Yin <zhenguo.yin@amd.com>
  Zhigang Luo <Zhigang.Luo@amd.com>
  Zhongwei <zhongwei.zhang@amd.com>
  Ziyang Xuan <william.xuanziyang@huawei.com>

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
 test-armhf-armhf-xl                                          fail    
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
   586b5dfb51b9..977b1ef51866  977b1ef51866aa7170409af80740788d4f9c4841 -> tested/linux-linus

