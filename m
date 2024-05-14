Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A71468C4E8D
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 11:15:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721293.1124614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6oFy-0001GX-3I; Tue, 14 May 2024 09:15:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721293.1124614; Tue, 14 May 2024 09:15:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6oFy-0001Fi-03; Tue, 14 May 2024 09:15:34 +0000
Received: by outflank-mailman (input) for mailman id 721293;
 Tue, 14 May 2024 09:15:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s6oFx-0001FY-3m; Tue, 14 May 2024 09:15:33 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s6oFw-0002gX-W6; Tue, 14 May 2024 09:15:33 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s6oFw-0006vN-KY; Tue, 14 May 2024 09:15:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1s6oFw-0006fz-Jy; Tue, 14 May 2024 09:15:32 +0000
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
	bh=4VusIsNXfx3BdSMM6BE7rFczZTrFhyUKPhJ9GmTJ8NE=; b=JOAFkzLNIwr4ON3Ed6JE2Rpnck
	WJZaQU3jbt2dDRwv3t38n5jBxOQNd14R+dL3uM39WK2Gap4IHTXBPkVIA07VGZNDhCLpulzCzJ/DX
	r+Sz785YMviwqKi4BgTc80E1J5QAb/Q3Di+PmBzqb0KkQC46e+gYw2afb/nM1Ibmjhfs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185992-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 185992: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-libvirt:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-xl-credit2:xen-boot:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-raw:xen-boot:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:xen-boot:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=a7c840ba5fa78d7761b9fedc33d69cef44986d79
X-Osstest-Versions-That:
    linux=6d1346f1bcbf2724dee8af013cdab9f7b581435b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 14 May 2024 09:15:32 +0000

flight 185992 linux-linus real [real]
flight 185995 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/185992/
http://logs.test-lab.xenproject.org/osstest/logs/185995/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-libvirt      8 xen-boot                 fail REGR. vs. 185990

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-xl-credit2   8 xen-boot            fail pass in 185995-retest
 test-armhf-armhf-xl-raw       8 xen-boot            fail pass in 185995-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-credit2 15 migrate-support-check fail in 185995 never pass
 test-armhf-armhf-xl-credit2 16 saverestore-support-check fail in 185995 never pass
 test-armhf-armhf-xl-raw     14 migrate-support-check fail in 185995 never pass
 test-armhf-armhf-xl-raw 15 saverestore-support-check fail in 185995 never pass
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 185990
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 185990
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 185990
 test-armhf-armhf-xl-credit1   8 xen-boot                     fail  like 185990
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 185990
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 185990
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                a7c840ba5fa78d7761b9fedc33d69cef44986d79
baseline version:
 linux                6d1346f1bcbf2724dee8af013cdab9f7b581435b

Last test of basis   185990  2024-05-13 16:43:50 Z    0 days
Testing same since   185992  2024-05-14 00:41:54 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Adam Guerin <adam.guerin@intel.com>
  Ai Chao <aichao@kylinos.cn>
  Akhil R <akhilrajeev@nvidia.com>
  Akira Yokosawa <akiyks@gmail.com>
  Al Viro <viro@zeniv.linux.org.uk>
  Aleksandr Mishin <amishin@t-argos.ru>
  Alexander Lobakin <aleksander.lobakin@intel.com>
  Alexey Dobriyan (Yandex) <adobriyan@gmail.com>
  Alexey Dobriyan <adobriyan@gmail.com>
  Alice Ryhl <aliceryhl@google.com>
  Allen Pais <apais@linux.microsoft.com>
  Andrea Parri <parri.andrea@gmail.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Animesh Agarwal <animeshagarwal28@gmail.com>
  Anuj Gupta <anuj20.g@samsung.com>
  Ard Biesheuvel <ardb@kernel.org>
  Arnd Bergmann <arnd@arndb.de>
  Arnd Bergmann <arnd@kernel.org>
  Avadhut Naik <avadhut.naik@amd.com>
  Bagas Sanjaya <bagasdotme@gmail.com>
  Benno Lossin <benno.lossin@proton.me>
  Bilbao, Carlos <carlos.bilbao@amd.com>
  Bill O'Donnell <bodonnel@redhat.com>
  Bird, Tim <Tim.Bird@sony.com>
  Boqun Feng <boqun.feng@gmail.com>
  Breno Leitao <leitao@debian.org>
  Brian Kubisiak <brian@kubisiak.com>
  Carlos Bilbao <carlos.bilbao@amd.com>
  Chang S. Bae <chang.seok.bae@intel.com>
  Chen Jun <chenjun102@huawei.com>
  Chen Ni <nichen@iscas.ac.cn>
  Chenghai Huang <huangchenghai2@huawei.com>
  Christian Brauner <brauner@kernel.org>
  Christoph Hellwig <hch@lst.de>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Chuck Lever <chuck.lever@oracle.com>
  Colin Ian King <colin.i.king@gmail.com>
  Coly Li <colyli@suse.de>
  Conor Dooley <conor.dooley@microchip.com>
  Corentin Labbe <clabbe@baylibre.com>
  Damian Muszynski <damian.muszynski@intel.com>
  Damien Le Moal <dlemoal@kernel.org>
  Dan Carpenter <dan.carpenter@linaro.org>
  Daniel Jordan <daniel.m.jordan@oracle.com>
  Danilo Krummrich <dakr@redhat.com>
  David Gstir <david@sigma-star.at>
  David Howells <dhowells@redhat.com>
  David Oberhollenzer <david.oberhollenzer@sigma-star.at>
  David Rientjes <rientjes@google.com>
  David Sterba <dsterba@suse.com>
  David Wei <dw@davidwei.uk>
  Dawid Osuchowski <linux@osuchow.ski>
  Dennis Lam <dennis.lamerice@gmail.com>
  Dennis Maisenbacher <dennis.maisenbacher@wdc.com>
  Dirk Behme <dirk.behme@de.bosch.com>
  Dongliang Mu <dzm91@hust.edu.cn>
  Dustin L. Howett <dustin@howett.net>
  Edward Adam Davis <eadavis@qq.com>
  Eric Biggers <ebiggers@google.com>
  Eric Sandeen <sandeen@redhat.com>
  Erick Archer <erick.archer@outlook.com>
  Federico Vaga <federico.vaga@vaga.pv.it>
  Florian-Ewald Mueller <florian-ewald.mueller@ionos.com>
  Frank Li <Frank.Li@nxp.com>
  Frederic Weisbecker <frederic@kernel.org>
  Gabriel Krisman Bertazi <krisman@suse.de>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Giovanni Cabiddu <giovanni.cabiddu@intel.com>
  Guenter Roeck <linux@roeck-us.net>
  Gustavo A. R. Silva <gustavoars@kernel.org>
  Haifeng Xu <haifeng.xu@shopee.com>
  Hailey Mothershead <hailmo@amazon.com>
  Hans Holmberg <hans.holmberg@wdc.com>
  Haoyang Liu <tttturtleruss@hust.edu.cn>
  Herbert Xu <herbert@gondor.apana.org.au>
  Hyunmin Lee <hyunminlr@gmail.com>
  Ilya Denisyev <dev@elkcl.ru>
  INAGAKI Hiroshi <musashino.open@gmail.com>
  Ivan Orlov <ivan.orlov0322@gmail.com>
  Ivan Orlov <ivan.orlov@codethink.co.uk>
  Jack Wang <jinpu.wang@ionos.com>
  Jakub Kicinski <kuba@kernel.org>
  James Bottomley <James.Bottomley@HansenPartnership.com>
  Jarkko Sakkinen <jarkko.sakkinen@kernel.org>
  Jarkko Sakkinen <jarkko@kernel.org>
  Jarkko Sakkinen <jarkko@kernel.org> # for TRUSTED_KEYS_TPM
  Jens Axboe <axboe@kernel.dk>
  Jerry Snitselaar <jsnitsel@redhat.com>
  Jeungwoo Yoo <casionwoo@gmail.com>
  Jia Jie Ho <jiajie.ho@starfivetech.com>
  Jianfeng Wang <jianfeng.w.wang@oracle.com>
  Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
  Jini Susan George <jinisusan.george@amd.com>
  Joachim Vandersmissen <git@jvdsn.com>
  Joel Fernandes (Google) <joel@joelfernandes.org>
  Joel Granados <j.granados@samsung.com>
  Johannes Berg <johannes.berg@intel.com>
  Johannes Thumshirn <johannes.thumshirn@wdc.com>
  Johannes Weiner <hannes@cmpxchg.org>
  John Garry <john.g.garry@oracle.com>
  Jonathan Corbet <corbet@lwn.net>
  Justin Stitt <justinstitt@google.com>
  Karel Balej <balejk@matfyz.cz>
  Karthikeyan Ramasubramanian <kramasub@chromium.org>
  Kees Cook <keescook@chromium.org>
  Kefeng Wang <wangkefeng.wang@huawei.com>
  Keith Busch <kbusch@kernel.org>
  Kemeng Shi <shikemeng@huaweicloud.com>
  Kent Overstreet <kent.overstreet@linux.dev>
  Krzysztof Błaszkowski <kb@sysmikro.com.pl>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Laura Nao <laura.nao@collabora.com>
  Li Hua <lihua@email.com>
  Li Nan <linan122@huawei.com>
  Li Zhijian <lizhijian@fujitsu.com>
  linke li <lilinke99@qq.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Lothar Rubusch <l.rubusch@gmail.com>
  Luca Weiss <luca.weiss@fairphone.com>
  Lucas Segarra Fernandez <lucas.segarra.fernandez@intel.com>
  Luis Henriques (SUSE) <luis.henriques@linux.dev>
  Luis Henriques <lhenriques@suse.de>
  Lukas Bulwahn <lukas.bulwahn@redhat.com>
  Lukas Wunner <lukas@wunner.de>
  Maki Hatano <Maki.Y.Hatano@gmail.com>
  Marco Elver <elver@google.com>
  Marek Vasut <marex@denx.de>
  Mario Limonciello <superm1@gmail.com>
  Mark Rutland <mark.rutland@arm.com>
  Matt Turner <mattst88@gmail.com>
  Matthew Mirvish <matthew@mm12.xyz>
  Matthew Wilcox (Oracle) <willy@infradead.org>
  Max Filippov <jcmvbkbc@gmail.com>
  Maxime Méré <maxime.mere@foss.st.com>
  Maíra Canal <mcanal@igalia.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael Haener <michael.haener@siemens.com>
  Miguel Ojeda <ojeda@kernel.org>
  Mikko Perttunen <mperttunen@nvidia.com>
  Ming Lei <ming.lei@redhat.com>
  Nathan Chancellor <nathan@kernel.org>
  Neeraj Upadhyay (AMD) <neeraj.iitr10@gmail.com>
  Neeraj Upadhyay <neeraj.upadhyay@kernel.org>
  Nell Shamrell-Harrington <nells@linux.microsoft.com>
  Nhat Pham <nphamcs@gmail.com>
  Nikita Kiryushin <kiryushin@ancud.ru>
  Niklas Schnelle <schnelle@linux.ibm.com>
  Pankaj Gupta <pankaj.gupta@nxp.com>
  Paul E. McKenney <paulmck@kernel.org>
  Pavel Begunkov <asml.silence@gmail.com>
  Prashant Malani <pmalani@chromium.org>
  Raghav Narang <dev@raxyte.com>
  Remington Brasga <rbrasga@uci.edu>
  Richard Weinberger <richard@nod.at>
  Roman Smirnov <r.smirnov@omp.ru>
  Ruyi Zhang <ruyi.zhang@samsung.com>
  Ryusuke Konishi <konishi.ryusuke@gmail.com>
  Sangyun Kim <sangyun.kim@snu.ac.kr>
  Sarat Mandava <mandavasarat@gmail.com>
  Saurav Shah <sauravshah.31@gmail.com>
  Silvio Gissi <sifonsec@amazon.com>
  Siming Wan <siming.wan@intel.com>
  Song Liu <song@kernel.org>
  Stefan Berger <stefanb@linux.ibm.com>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  syzbot+0a3683a0a6fecf909244@syzkaller.appspotmail.com
  Tejun Heo <tj@kernel.org>
  Thierry Reding <treding@nvidia.com>
  Thomas Weißschuh <linux@weissschuh.net>
  Thorsten Blum <thorsten.blum@toblux.com>
  Thorsten Leemhuis <linux@leemhuis.info>
  Tim Bird <tim.bird@sony.com>
  Tim Chen <tim.c.chen@linux.intel.com>
  Tom Lendacky <thomas.lendacky@amd.com>
  Tom Zanussi <tom.zanussi@linux.intel.com>
  Tyler Hicks (Microsoft) <code@tyhicks.com>
  Tzung-Bi Shih <tzungbi@kernel.org>
  Uladzislau Rezki (Sony) <urezki@gmail.com>
  Usama Arif <usamaarif642@gmail.com>
  Utkarsh Tripathi <utripathi2002@gmail.com>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Vignesh Balasubramanian <vigbalas@amd.com>
  Vijay Nag <nagvijay@microsoft.com>
  Vitaly Chikunov <vt@altlinux.org>
  Vlastimil Babka <vbabka@suse.cz>
  Wedson Almeida Filho <walmeida@microsoft.com>
  Wenkai Lin <linwenkai6@hisilicon.com>
  Wolfram Sang <wsa+renesas@sang-engineering.com>
  Xin Zeng <xin.zeng@intel.com>
  Xiongwei Song <xiongwei.song@windriver.com>
  Xiu Jianfeng <xiujianfeng@huawei.com>
  Yang Li <yang.lee@linux.alibaba.com>
  Yanteng Si <siyanteng@loongson.cn>
  Yu Kuai <yukuai3@huawei.com>
  Yujie Liu <yujie.liu@intel.com>
  Zenghui Yu <zenghui.yu@linux.dev>
  Zhang Yi <yi.zhang@huawei.com>
  Zhu Yanjun <yanjun.zhu@linux.dev>
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
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  fail    
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
 test-armhf-armhf-xl-raw                                      fail    
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


Not pushing.

(No revision log; it would be 15941 lines long.)

