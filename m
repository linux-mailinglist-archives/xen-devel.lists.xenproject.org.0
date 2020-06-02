Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 328B11EC247
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 21:00:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgC95-0004Ph-Ew; Tue, 02 Jun 2020 19:00:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NiWU=7P=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jgC93-0004Pc-Kp
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 19:00:17 +0000
X-Inumbo-ID: 47b0d0b6-a503-11ea-9dbe-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 47b0d0b6-a503-11ea-9dbe-bc764e2007e4;
 Tue, 02 Jun 2020 19:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uH0QPGIkMyONMWaImU6Lm4OTgfA37BRk4Ro+WsL24qY=; b=G/JsNR71NbP4VZL3+a3PlZwkj
 VFCOKDGUyF0Qjn2rYJi7B0iBMWuxkmoaEUSBXkjWSPRgoHCmrg1CYPYEcelu5ycrU/4vmI8Ig2WV7
 ghnLgPu2Gdz3Gx+38deX+KydT+XdbpH4Xmy2CUKy8RGMmSLJQVVEAY5TP9ZHOvUEYvObg=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jgC8v-0003x4-6D; Tue, 02 Jun 2020 19:00:09 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jgC8u-0004fS-UI; Tue, 02 Jun 2020 19:00:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jgC8u-00023S-Tb; Tue, 02 Jun 2020 19:00:08 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150613-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 150613: regressions - trouble:
 blocked/fail/pass/starved
X-Osstest-Failures: linux-linus:build-arm64-pvops:kernel-build:fail:regression
 linux-linus:test-arm64-arm64-xl-seattle:build-check(1):blocked:nonblocking
 linux-linus:test-arm64-arm64-examine:build-check(1):blocked:nonblocking
 linux-linus:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
 linux-linus:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
 linux-linus:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
 linux-linus:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
 linux-linus:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
 linux-linus:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
 linux-linus:test-amd64-amd64-xl-rtds:guest-saverestore:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemut-win7-amd64:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This: linux=f359287765c04711ff54fbd11645271d8e5ff763
X-Osstest-Versions-That: linux=9bf9511e3d9f328c03f6f79bfb741c3d18f2f2c0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 02 Jun 2020 19:00:08 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

flight 150613 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150613/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64-pvops             6 kernel-build             fail REGR. vs. 150606

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-seattle   1 build-check(1)               blocked  n/a
 test-arm64-arm64-examine      1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-rtds     15 guest-saverestore            fail  like 150606
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 150606
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 150606
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop            fail like 150606
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 150606
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 150606
 test-armhf-armhf-xl-rtds     16 guest-start/debian.repeat    fail  like 150606
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 150606
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 150606
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-xl-qemut-win7-amd64  2 hosts-allocate              starved n/a

version targeted for testing:
 linux                f359287765c04711ff54fbd11645271d8e5ff763
baseline version:
 linux                9bf9511e3d9f328c03f6f79bfb741c3d18f2f2c0

Last test of basis   150606  2020-06-01 19:40:10 Z    0 days
Testing same since   150613  2020-06-02 05:14:57 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Eric W. Biederman" <ebiederm@xmission.com>
  "Paul E. McKenney" <paulmck@kernel.org>
  Adrian Freund <adrian@freund.io>
  Adrian Hunter <adrian.hunter@intel.com>
  Al Viro <viro@zeniv.linux.org.uk>
  Alessia Mantegazza <amantegazza@vaga.pv.it>
  Alex Shi <alex.shi@linux.alibaba.com>
  Alex Shi <alex.shi@linux.alibaba.com> # translations/zh_CN
  Alexander Stein <alexander.stein@systec-electronic.com>
  Alexandre Chartre <alexandre.chartre@oracle.com>
  Alexey Budankov <alexey.budankov@linux.intel.com>
  Amit Daniel Kachhap <amit.kachhap@arm.com>
  Andreas Gerstmayr <agerstmayr@redhat.com>
  Andrei Vagin <avagin@openvz.org>
  Andrew Donnellan <ajd@linux.ibm.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andrew Scull <ascull@google.com>
  Andy Lutomirski <luto@kernel.org>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Anju T Sudhakar <anju@linux.vnet.ibm.com>
  Anshuman Khandual <anshuman.khandual@arm.com>
  Ard Biesheuvel <ardb@kernel.org>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Arnd Bergmann <arnd@arndb.de
  Arnd Bergmann <arnd@arndb.de>
  Arvind Sankar <nivedita@alum.mit.edu>
  Atish Patra <atish.patra@wdc.com>
  Babu Moger <babu.moger@amd.com>
  Barret Rhoden <brho@google.com>
  Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
  Benjamin Thiel <b.thiel@posteo.de>
  Bjorn Helgaas <bhelgaas@google.com>
  Björn Töpel <bjorn.topel@gmail.com>
  Borislav Petkov <bp@alien8.de>
  Borislav Petkov <bp@suse.de>
  Bumsik Kim <k.bumsik@gmail.com>
  Bumsik Kim <kbumsik@gmail.com>
  Casey Schaufler <casey@schaufler-ca.com>
  Catalin Marinas <catalin.marinas@arm.com>
  Christian Brauner <christian.brauner@ubuntu.com>
  Christoph Hellwig <hch@lst.de>
  Christophe Leroy <christophe.leroy@c-s.fr>
  Chucheng Luo <luochucheng@vivo.com>
  CodyYao-oc <CodyYao-oc@zhaoxin.com>
  Corentin Labbe <clabbe.montjoie@gmail.com>
  Cristian Souza <cristianmsbr@gmail.com>
  Dan Williams <dan.j.williams@intel.com>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniel Kiss <daniel.kiss@arm.com>
  Daniel Thompson <daniel.thompson@linaro.org>
  Dave Hansen <dave.hansen@intel.com>
  Dave Hansen <dave.hansen@linux.intel.com>
  Dave Martin <Dave.Martin@arm.com>
  David Howells <dhowells@redhat.com>
  David Sterba <dsterba@suse.com> # fs/affs/Kconfig
  Dimitri Sivanich <sivanich@hpe.com>
  Dmitry Safonov <dima@arista.com>
  Doug Berger <opendmb@gmail.com>
  Douglas Anderson <dianders@chromium.org>
  Eric W. Biederman <ebiederm@xmission.com>
  Ethon Paul <ethp@qq.com>
  Etienne Carriere <etienne.carriere@st.com>
  Fangrui Song <maskray@google.com>
  Federico Vaga <federico.vaga@vaga.pv.it>
  Federico Vaga <federico.vaga@vaga.pv.it> # translations/it_IT
  Fenghua Yu <fenghua.yu@intel.com>
  Finn Thain <fthain@telegraphics.com.au>
  Flavio Suligoi <f.suligoi@asem.it>
  Florian Fainelli <f.fainelli@gmail.com>
  Frederic Weisbecker <frederic@kernel.org>
  Gal Pressman <galpress@amazon.com>
  Gavin Shan <gshan@redhat.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Geert Uytterhoeven <geert@linux-m68k.org>
  George Spelvin <lkml@sdf.org>
  Giuseppe Scrivano <gscrivan@redhat.com>
  Gregory Fong <gregory.0xf0@gmail.com>
  Guixiong Wei <guixiongwei@gmail.com>
  Gustavo A. R. Silva <gustavo@embeddedor.com>
  Gustavo A. R. Silva <gustavoars@kernel.org>
  Hanjun Guo <guohanjun@huawei.com>
  Hans Verkuil <hverkuil-cisco@xs4all.nl>
  He Zhe <zhe.he@windriver.com>
  Helge Deller <deller@gmx.de>
  Ian Rogers <irogers@google.com>
  Ingo Molnar <mingo@kernel.org>
  Jagadeesh Pagadala <jagdsh.linux@gmail.com>
  James Morris <jamorris@linux.microsoft.com>
  James Morse <james.morse@arm.com>
  Jan Kara <jack@suse.cz>
  Jason Wang <jasowang@redhat.com>
  Jason Yan <yanaijie@huawei.com>
  Jean-Philippe Brucker <jean-philippe@linaro.org>
  Jeremy Kerr <jk@ozlabs.org>
  Jessica Yu <jeyu@kernel.org>
  Jian Cai <caij2003@gmail.com>
  Jimmy Assarsson <jimmyassarsson@gmail.com>
  Jin Yao <yao.jin@linux.intel.com>
  Jiri Olsa <jolsa@kernel.org>
  Jiri Olsa <jolsa@redhat.com>
  Jiri Slaby <jslaby@suse.cz>
  Joe Perches <joe@perches.com>
  Joel Fernandes (Google) <joel@joelfernandes.org>
  Joerg Roedel <jroedel@suse.de>
  Johan Hovold <johan@kernel.org>
  Jonathan Corbet <corbet@lwn.net>
  Jonathan Neuschäfer <j.neuschaefer@gmx.net>
  Josh Poimboeuf <jpoimboe@redhat.com>
  Joshua Abraham <j.abraham1776@gmail.com>
  Joshua Abraham <sinisterpatrician@gmail.com>
  Juan Manuel Méndez Rey <vejeta@gmail.com>
  Jules Irenge <jbi.octave@gmail.com>
  Julia Cartwright <julia@ni.com>
  Julien Thierry <jthierry@redhat.com>
  Kairui Song <kasong@redhat.com>
  Kaitao Cheng <pilgrimtao@gmail.com>
  Kajol Jain <kjain@linux.ibm.com>
  Kan Liang <kan.liang@linux.intel.com>
  Kees Cook <keescook@chromium.org>
  Kevin Cernekee <cernekee@gmail.com>
  Kevin Hao <haokexin@gmail.com>
  Kim Phillips <kim.phillips@amd.com>
  Konstantin Kharlamov <hi-angel@yandex.ru>
  Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
  Lai Jiangshan <laijs@linux.alibaba.com>
  Leo Yan <leo.yan@linaro.org>
  Leonardo Bras <leobras.c@gmail.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Lionel Landwerlin <lionel.g.landwerlin@intel.com>
  Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
  Luke Nelson <luke.r.nels@gmail.com>
  Luke Nelson <lukenels@cs.washington.edu>
  Marc Zyngier <maz@kernel.org>
  Marc Zyngier <maz@kernel.org> # kvm/arm64
  Mark Brown <broonie@kernel.org>
  Mark Gross <mgross@linux.intel.com>
  Mark Rutland <mark.rutland@arm.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Masami Hiramatsu <mhiramat@kernel.org>
  Matt Helsley <mhelsley@vmware.com>
  Matthew Wilcox (Oracle) <willy@infradead.org>
  Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael S. Tsirkin <mst@redhat.com>
  Michal Hocko <mhocko@suse.com>
  Michal Suchanek <msuchanek@suse.de>
  Michel Lespinasse <walken@google.com>
  Mike Galbraith <umgwanakikbuti@gmail.com>
  Mike Leach <mike.leach@linaro.org>
  Mike Rapoport <mike.rapoport@gmail.com>
  Mike Rapoport <rppt@linux.ibm.com>
  Miklos Szeredi <mszeredi@redhat.com>
  Miroslav Benes <mbenes@suse.cz>
  Muchun Song <songmuchun@bytedance.com>
  Namhyung Kim <namhyung@kernel.org>
  Nick Desaulniers <ndesaulniers@google.com>
  Oded Gabbay <oded.gabbay@gmail.com>
  Paul E. McKenney <paulmck@kernel.org>
  Paul Gortmaker <paul.gortmaker@windriver.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Peter Zijlstra <peterz@infradead.org>
  Petr Mladek <pmladek@suse.com>
  Qais Yousef <qais.yousef@arm.com>
  Qi Liu <liuqi115@huawei.com>
  Qi Zheng <arch0.zheng@gmail.com>
  Randy Dunlap <rdunlap@infradead.org>
  Raphael Gault <raphael.gault@arm.com>
  Ricardo Cañuelo <ricardo.canuelo@collabora.com>
  Ricardo Ribalda <ribalda@kernel.org>
  Ricardo Ribalda Delgado <ricardo@ribalda.com>
  Rikard Falkeborn <rikard.falkeborn@gmail.com>
  Rob Herring <robh@kernel.org>
  Ronald G. Minnich <rminnich@gmail.com>
  Russell King <rmk+kernel@armlinux.org.uk>
  Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
  Sam Ravnborg <sam@ravnborg.org>
  Sami Tolvanen <samitolvanen@google.com>
  Sandipan Das <sandipan@linux.ibm.com>
  Sebastian Andrzej Siewior <bigeasy@linutronix.de>
  Sedat Dilek <sedat.dilek@gmail.com>
  Serge E. Hallyn <serge@hallyn.com>
  Shaokun Zhang <zhangshaokun@hisilicon.com>
  Song Liu <songliubraving@fb.com>
  Stan Johnson <userm57@yahoo.com>
  Stefan Richter <stefanr@s5r6.in-berlin.de>
  Stephane Eranian <eranian@google.com>
  Stephen Boyd <sboyd@codeaurora.org>
  Stephen Kitt <steve@sk2.org>
  Stephen Smalley <sds@tycho.nsa.gov>
  Steve Wahl <steve.wahl@hpe.com>
  Steven Rostedt (VMware) <rostedt@goodmis.org>
  Sudeep Holla <sudeep.holla@arm.com>
  Sumanth Korikkar <sumanthk@linux.ibm.com>
  Suzuki K Poulose <suzuki.poulose@arm.com>
  Tamas Zsoldos <tamas.zsoldos@arm.com>
  Tang Bin <tangbin@cmss.chinamobile.com>
  Thomas Backlund <tmb@mageia.org>
  Thomas Gleixner <tglx@linutronix.de>
  Thomas Richter <tmricht@linux.ibm.com>
  Tom Zanussi <zanussi@kernel.org>
  Tommi Rantala <tommi.t.rantala@nokia.com>
  Tuan Phan <tuanphan@os.amperecomputing.com>
  Uros Bizjak <ubizjak@gmail.com>
  Vamshi K Sthambamkadi <vamshi.k.sthambamkadi@gmail.com>
  Vincent Whitchurch <vincent.whitchurch@axis.com>
  Vincenzo Frascino <vincenzo.frascino@arm.com>
  Vitor Massaru Iha <vitor@massaru.org>
  Vlastimil Babka <vbabka@suse.cz>
  Waiman Long <longman@redhat.com>
  Wang Wenhu <wenhu.wang@vivo.com>
  Will Deacon <will@kernel.org>
  Wolfram Sang <wsa+renesas@sang-engineering.com>
  Wolfram Sang <wsa@kernel.org>
  Wolfram Sang <wsa@the-dreams.de>
  Xi Wang <xi.wang@gmail.com>
  Yu-cheng Yu <yu-cheng.yu@intel.com>
  YueHaibing <yuehaibing@huawei.com>
  Yunfeng Ye <yeyunfeng@huawei.com>
  Zenghui Yu <yuzenghui@huawei.com>
  Zhaolong Zhang <zhangzl2013@126.com>
  Zhou Wang <wangzhou1@hisilicon.com>
  Zou Wei <zou_wei@huawei.com>
  Łukasz Stelmach <l.stelmach@samsung.com>

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
 build-arm64-pvops                                            fail    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          blocked 
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      blocked 
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemut-rhel6hvm-amd                           pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-i386-xl-qemut-win7-amd64                          starved 
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-i386-xl-qemut-ws16-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  blocked 
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  blocked 
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     blocked 
 test-armhf-armhf-examine                                     pass    
 test-amd64-i386-examine                                      pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-amd64-pvgrub                                pass    
 test-amd64-amd64-i386-pvgrub                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-xl-raw                                       pass    
 test-amd64-amd64-xl-rtds                                     fail    
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 blocked 
 test-amd64-amd64-libvirt-vhd                                 pass    
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


Not pushing.

(No revision log; it would be 20159 lines long.)

