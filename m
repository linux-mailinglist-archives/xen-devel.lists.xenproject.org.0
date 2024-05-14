Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A57228C5BB4
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 21:33:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721719.1125325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6xtQ-0005fW-Im; Tue, 14 May 2024 19:32:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721719.1125325; Tue, 14 May 2024 19:32:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6xtQ-0005d6-Fv; Tue, 14 May 2024 19:32:56 +0000
Received: by outflank-mailman (input) for mailman id 721719;
 Tue, 14 May 2024 19:32:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s6xtO-0005cw-TM; Tue, 14 May 2024 19:32:54 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s6xtO-0005WO-Qy; Tue, 14 May 2024 19:32:54 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s6xtO-0008Rs-Fb; Tue, 14 May 2024 19:32:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1s6xtO-0005hO-FF; Tue, 14 May 2024 19:32:54 +0000
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
	bh=sMsBWQZusE4UF1HQYkg32gYYz1t9lVRXSlJ4tcbSzlw=; b=riXDHiFY+AiJU8GQ6NmQ3kqh8T
	5/EhsL1lFtq5FB2/N7UB7s5rthQEs1SwCuTLcRRfQvFUSRSoKUEUfH1jBJXVBNYoLyxlolCtsv8UY
	4NlB9Ikqrgr+PsAy70rOZpt5PmBqjON61fyhcCo8IVV/yg65DVeVIKKCDNeX+RdBMWsg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185996-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 185996: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-qemuu-freebsd11-amd64:guest-localmigrate/x10:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-arndale:xen-boot:fail:heisenbug
    linux-linus:test-armhf-armhf-examine:reboot:fail:heisenbug
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:xen-boot:fail:nonblocking
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
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=a5131c3fdf2608f1c15f3809e201cf540eb28489
X-Osstest-Versions-That:
    linux=6d1346f1bcbf2724dee8af013cdab9f7b581435b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 14 May 2024 19:32:54 +0000

flight 185996 linux-linus real [real]
flight 185997 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/185996/
http://logs.test-lab.xenproject.org/osstest/logs/185997/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-qemuu-freebsd11-amd64 19 guest-localmigrate/x10 fail pass in 185997-retest
 test-armhf-armhf-xl-arndale   8 xen-boot            fail pass in 185997-retest
 test-armhf-armhf-examine      8 reboot              fail pass in 185997-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt   16 saverestore-support-check fail blocked in 185990
 test-armhf-armhf-xl-arndale 15 migrate-support-check fail in 185997 never pass
 test-armhf-armhf-xl-arndale 16 saverestore-support-check fail in 185997 never pass
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 185990
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 185990
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 185990
 test-armhf-armhf-libvirt-vhd  8 xen-boot                     fail  like 185990
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
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                a5131c3fdf2608f1c15f3809e201cf540eb28489
baseline version:
 linux                6d1346f1bcbf2724dee8af013cdab9f7b581435b

Last test of basis   185990  2024-05-13 16:43:50 Z    1 days
Failing since        185992  2024-05-14 00:41:54 Z    0 days    2 attempts
Testing same since   185996  2024-05-14 09:18:32 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>
  Adam Guerin <adam.guerin@intel.com>
  Ai Chao <aichao@kylinos.cn>
  Akhil R <akhilrajeev@nvidia.com>
  Akira Yokosawa <akiyks@gmail.com>
  Al Viro <viro@zeniv.linux.org.uk>
  Aleksandr Mishin <amishin@t-argos.ru>
  Alex Shi <alexs@kernel.org>
  Alexander Gordeev <agordeev@linux.ibm.com>
  Alexander Lobakin <aleksander.lobakin@intel.com>
  Alexey Dobriyan (Yandex) <adobriyan@gmail.com>
  Alexey Dobriyan <adobriyan@gmail.com>
  Alice Ryhl <aliceryhl@google.com>
  Allen Pais <apais@linux.microsoft.com>
  Andrea Parri <parri.andrea@gmail.com>
  Andrii Nakryiko <andrii@kernel.org>
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
  Bingsong Si <sibs@chinatelecom.cn>
  Bird, Tim <Tim.Bird@sony.com>
  Boqun Feng <boqun.feng@gmail.com>
  Borislav Petkov (AMD) <bp@alien8.de>
  Breno Leitao <leitao@debian.org>
  Brian Gerst <brgerst@gmail.com>
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
  Dave Hansen <dave.hansen@linux.intel.com>
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
  Dr. David Alan Gilbert <linux@treblig.org>
  Dustin L. Howett <dustin@howett.net>
  Edward Adam Davis <eadavis@qq.com>
  Eric Biggers <ebiggers@google.com>
  Eric Sandeen <sandeen@redhat.com>
  Erick Archer <erick.archer@gmx.com>
  Erick Archer <erick.archer@outlook.com>
  Federico Vaga <federico.vaga@vaga.pv.it>
  Florian-Ewald Mueller <florian-ewald.mueller@ionos.com>
  Frank Li <Frank.Li@nxp.com>
  Frederic Weisbecker <frederic@kernel.org>
  Gabriel Krisman Bertazi <krisman@suse.de>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Giovanni Cabiddu <giovanni.cabiddu@intel.com>
  Guenter Roeck <linux@roeck-us.net>
  Guixiong Wei <weiguixiong@bytedance.com>
  Gustavo A. R. Silva <gustavoars@kernel.org>
  H. Peter Anvin (Intel) <hpa@zytor.com>
  H.J. Lu <hjl.tools@gmail.com>
  Haifeng Xu <haifeng.xu@shopee.com>
  Hailey Mothershead <hailmo@amazon.com>
  Hans Holmberg <hans.holmberg@wdc.com>
  Haoyang Liu <tttturtleruss@hust.edu.cn>
  Heiko Carstens <hca@linux.ibm.com>
  Herbert Xu <herbert@gondor.apana.org.au>
  Hyunmin Lee <hyunminlr@gmail.com>
  Ilya Denisyev <dev@elkcl.ru>
  INAGAKI Hiroshi <musashino.open@gmail.com>
  Ingo Molnar <mingo@kernel.org>
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
  Jiri Olsa <jolsa@kernel.org>
  Joachim Vandersmissen <git@jvdsn.com>
  Joel Fernandes (Google) <joel@joelfernandes.org>
  Joel Granados <j.granados@samsung.com>
  Johannes Berg <johannes.berg@intel.com>
  Johannes Thumshirn <johannes.thumshirn@wdc.com>
  Johannes Weiner <hannes@cmpxchg.org>
  John Garry <john.g.garry@oracle.com>
  Jonathan Corbet <corbet@lwn.net>
  Josh Poimboeuf <jpoimboe@kernel.org>
  Juergen Gross <jgross@suse.com>
  Julian Stecklina <julian.stecklina@cyberus-technology.de>
  Justin Stitt <justinstitt@google.com>
  K Prateek Nayak <kprateek.nayak@amd.com>
  Karel Balej <balejk@matfyz.cz>
  Karthikeyan Ramasubramanian <kramasub@chromium.org>
  Kees Cook <keescook@chromium.org>
  Kefeng Wang <wangkefeng.wang@huawei.com>
  Keith Busch <kbusch@kernel.org>
  Kemeng Shi <shikemeng@huaweicloud.com>
  Kent Overstreet <kent.overstreet@linux.dev>
  Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
  Krzysztof Błaszkowski <kb@sysmikro.com.pl>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Kyle Huey <khuey@kylehuey.com>
  Kyle Huey <me@kylehuey.com>
  Lai Jiangshan <jiangshan.ljs@antgroup.com>
  Laura Nao <laura.nao@collabora.com>
  Li Hua <lihua@email.com>
  Li Nan <linan122@huawei.com>
  Li RongQing <lirongqing@baidu.com>
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
  Lukasz Luba <lukasz.luba@arm.com>
  Maki Hatano <Maki.Y.Hatano@gmail.com>
  Marco Elver <elver@google.com>
  Marek Vasut <marex@denx.de>
  Mario Limonciello <superm1@gmail.com>
  Mark Rutland <mark.rutland@arm.com>
  Masahiro Yamada <masahiroy@kernel.org>
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
  Mingwei Zhang <mizhang@google.com>
  Muhammad Usama Anjum <usama.anjum@collabora.com>
  Namhyung Kim <namhyung@kernel.org>
  Nathan Chancellor <nathan@kernel.org>
  Neeraj Upadhyay (AMD) <neeraj.iitr10@gmail.com>
  Neeraj Upadhyay <neeraj.upadhyay@kernel.org>
  Nell Shamrell-Harrington <nells@linux.microsoft.com>
  Nhat Pham <nphamcs@gmail.com>
  Nicholas Piggin <npiggin@gmail.com>
  Nick Desaulniers <ndesaulniers@google.com>
  Nikita Kiryushin <kiryushin@ancud.ru>
  Niklas Schnelle <schnelle@linux.ibm.com>
  Pankaj Gupta <pankaj.gupta@nxp.com>
  Paul E. McKenney <paulmck@kernel.org>
  Paul Menzel <pmenzel@molgen.mpg.de>
  Pavel Begunkov <asml.silence@gmail.com>
  Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Peter Zijlstra <peterz@infradead.org>
  Prashant Malani <pmalani@chromium.org>
  Qais Yousef <qyousef@layalina.io>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Rafael J. Wysocki <rafael@kernel.org>
  Raghav Narang <dev@raxyte.com>
  Remington Brasga <rbrasga@uci.edu>
  Richard Weinberger <richard@nod.at>
  Roman Smirnov <r.smirnov@omp.ru>
  Ruyi Zhang <ruyi.zhang@samsung.com>
  Ryusuke Konishi <konishi.ryusuke@gmail.com>
  Sangyun Kim <sangyun.kim@snu.ac.kr>
  Sarat Mandava <mandavasarat@gmail.com>
  Saurabh Sengar <ssengar@linux.microsoft.com>
  Saurav Shah <sauravshah.31@gmail.com>
  Shrikanth Hegde <sshegde@linux.ibm.com>
  Silvio Gissi <sifonsec@amazon.com>
  Siming Wan <siming.wan@intel.com>
  Song Liu <song@kernel.org>
  Stefan Berger <stefanb@linux.ibm.com>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  syzbot+0a3683a0a6fecf909244@syzkaller.appspotmail.com
  Tejun Heo <tj@kernel.org>
  Thierry Reding <treding@nvidia.com>
  Thomas Gleixner <tglx@linutronix.de>
  Thomas Weißschuh <linux@weissschuh.net>
  Thorsten Blum <thorsten.blum@toblux.com>
  Thorsten Leemhuis <linux@leemhuis.info>
  Tim Bird <tim.bird@sony.com>
  Tim Chen <tim.c.chen@linux.intel.com>
  Tom Lendacky <thomas.lendacky@amd.com>
  Tom Zanussi <tom.zanussi@linux.intel.com>
  Tong Tiangen <tongtiangen@huawei.com>
  Tony Luck <tony.luck@intel.com>
  Tyler Hicks (Microsoft) <code@tyhicks.com>
  Tzung-Bi Shih <tzungbi@kernel.org>
  Uladzislau Rezki (Sony) <urezki@gmail.com>
  Uros Bizjak <ubizjak@gmail.com>
  Usama Arif <usamaarif642@gmail.com>
  Utkarsh Tripathi <utripathi2002@gmail.com>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Valentin Schneider <vschneid@redhat.com>
  Vignesh Balasubramanian <vigbalas@amd.com>
  Vijay Nag <nagvijay@microsoft.com>
  Vincent Guittot <vincent.guittot@linaro.org>
  Viresh Kumar <viresh.kumar@linaro.org>
  Vitaly Chikunov <vt@altlinux.org>
  Vlastimil Babka <vbabka@suse.cz>
  Waiman Long <longman@redhat.com>
  Wedson Almeida Filho <walmeida@microsoft.com>
  Wei Yang <richard.weiyang@gmail.com>
  Wenkai Lin <linwenkai6@hisilicon.com>
  Will Deacon <will@kernel.org>
  Wolfram Sang <wsa+renesas@sang-engineering.com>
  Xin Li (Intel) <xin@zytor.com>
  Xin Zeng <xin.zeng@intel.com>
  Xiongwei Song <xiongwei.song@windriver.com>
  Xiu Jianfeng <xiujianfeng@huawei.com>
  Yang Li <yang.lee@linux.alibaba.com>
  Yanteng Si <siyanteng@loongson.cn>
  Yu Kuai <yukuai3@huawei.com>
  YueHaibing <yuehaibing@huawei.com>
  Yujie Liu <yujie.liu@intel.com>
  Yuntao Wang <ytcoode@gmail.com>
  Zenghui Yu <zenghui.yu@linux.dev>
  Zhang Rui <rui.zhang@intel.com>
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
 test-amd64-amd64-qemuu-freebsd11-amd64                       fail    
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
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     fail    
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
 test-armhf-armhf-libvirt-vhd                                 fail    
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
   6d1346f1bcbf..a5131c3fdf26  a5131c3fdf2608f1c15f3809e201cf540eb28489 -> tested/linux-linus

