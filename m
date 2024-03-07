Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 789218749E7
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 09:41:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689677.1074905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ri9Jq-0002Ad-TX; Thu, 07 Mar 2024 08:41:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689677.1074905; Thu, 07 Mar 2024 08:41:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ri9Jq-00027i-P3; Thu, 07 Mar 2024 08:41:38 +0000
Received: by outflank-mailman (input) for mailman id 689677;
 Thu, 07 Mar 2024 08:41:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ri9Jp-00027Q-5W; Thu, 07 Mar 2024 08:41:37 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ri9Jp-0006ns-0k; Thu, 07 Mar 2024 08:41:37 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ri9Jo-0005dJ-IW; Thu, 07 Mar 2024 08:41:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ri9Jo-0004IY-I6; Thu, 07 Mar 2024 08:41:36 +0000
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
	bh=qAlLGBl71XiqBGjZ2Jy/MDAgGXrpk+/ttchQNXAR5Xo=; b=FzwOffd1peFR6MMwY0VrMZY0P8
	Mau8lYYtiTIfzMgL9qerRdcCuCaES8fiv1q63q94nA+KnWo0eLasxsaN+AoVK0Kv4+R53NQl5Qd7f
	B4q4Y1CdL87gdoQtGMgZNO9JdcyWJxopZlSxNeyRIpY2VE3WkJcuaakD48VErtjyHlas=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184922-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-6.1 test] 184922: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-6.1:test-amd64-amd64-xl-multivcpu:guest-localmigrate/x10:fail:heisenbug
    linux-6.1:test-armhf-armhf-xl-credit1:xen-boot:fail:heisenbug
    linux-6.1:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=61adba85cc40287232a539e607164f273260e0fe
X-Osstest-Versions-That:
    linux=a3eb3a74aa8c94e6c8130b55f3b031f29162868c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 07 Mar 2024 08:41:36 +0000

flight 184922 linux-6.1 real [real]
flight 184929 linux-6.1 real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/184922/
http://logs.test-lab.xenproject.org/osstest/logs/184929/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-multivcpu 20 guest-localmigrate/x10 fail pass in 184929-retest
 test-armhf-armhf-xl-credit1   8 xen-boot            fail pass in 184929-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-credit1 15 migrate-support-check fail in 184929 never pass
 test-armhf-armhf-xl-credit1 16 saverestore-support-check fail in 184929 never pass
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 184831
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 184841
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 184841
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 184841
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 184841
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 184841
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 184841
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 184841
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                61adba85cc40287232a539e607164f273260e0fe
baseline version:
 linux                a3eb3a74aa8c94e6c8130b55f3b031f29162868c

Last test of basis   184841  2024-03-02 08:11:10 Z    5 days
Testing same since   184922  2024-03-06 15:13:36 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abdun Nihaal <abdun.nihaal@gmail.com>
  Adrian Hunter <adrian.hunter@intel.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alexander Lobakin <alexandr.lobakin@intel.com>
  Alexander Ofitserov <oficerovas@altlinux.org>
  Alexander Stein <alexander.stein@ew.tq-group.com>
  Alexandru Gagniuc <alexandru.gagniuc@hp.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Anna Schumaker <Anna.Schumaker@Netapp.com>
  Ard Biesheuvel <ardb+git@google.com>
  Ard Biesheuvel <ardb@kernel.org>
  Arnd Bergmann <arnd@arndb.de>
  Arturas Moskvinas <arturas.moskvinas@gmail.com>
  Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Bjorn Andersson <andersson@kernel.org>
  Bjorn Andersson <quic_bjorande@quicinc.com>
  Bjorn Helgaas <bhelgaas@google.com>
  Borislav Petkov (AMD) <bp@alien8.de>
  Borislav Petkov <bp@suse.de>
  Christian Brauner <brauner@kernel.org>
  Christian König <christian.koenig@amd.com>
  Christophe Kerello <christophe.kerello@foss.st.com>
  Chuck Lever <chuck.lever@oracle.com>
  Chunyan Zhang <chunyan.zhang@unisoc.com>
  Clancy Shang <clancy.shang@quectel.com>
  Colin Ian King <colin.i.king@gmail.com>
  Curtis Klein <curtis.klein@hpe.com>
  Dai Ngo <dai.ngo@oracle.com>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniel Vetter <daniel.vetter@ffwll.ch>
  Dave Hansen <dave.hansen@linux.intel.com>
  David Disseldorp <ddiss@suse.de>
  David Howells <dhowells@redhat.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Davide Caratti <dcaratti@redhat.com>
  Dimitris Vlachos <dvlachos@ics.forth.gr>
  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Doug Smythies <dsmythies@telus.net>
  Edward Lo <edward.lo@ambergroup.io>
  Elad Nachman <enachman@marvell.com>
  Elson Roy Serrao <quic_eserrao@quicinc.com>
  Eniac Zhang <eniac-xw.zhang@hp.com>
  Eric Dumazet <edumazet@google.com>
  Evgeniy Baskov <baskov@ispras.ru>
  Filipe Manana <fdmanana@suse.com>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Florian Westphal <fw@strlen.de>
  Frank Li <Frank.Li@nxp.com>
  Gaurav Batra <gbatra@linux.vnet.ibm.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Geliang Tang <tanggeliang@kylinos.cn>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Gustavo A. R. Silva <gustavoars@kernel.org>
  Han Xu <han.xu@nxp.com>
  Hans de Goede <hdegoede@redhat.com>
  Hans Peter <flurry123@gmx.ch>
  Herbert Xu <herbert@gondor.apana.org.au>
  Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
  Ido Schimmel <idosch@nvidia.com>
  Ignat Korchagin <ignat@cloudflare.com>
  Ingo Molnar <mingo@kernel.org>
  Ivan Semenov <ivan@semenov.dev>
  Jakub Kicinski <kuba@kernel.org>
  Jakub Raczynski <j.raczynski@samsung.com>
  Janaki Ramaiah Thota <quic_janathot@quicinc.com>
  Javier Carrasco <javier.carrasco.cruz@gmail.com>
  Jeff Layton <jlayton@kernel.org>
  Jeremy Kerr <jk@codeconstruct.com.au>
  Jia-Ju Bai <baijiaju1990@gmail.com>
  Jiri Bohac <jbohac@suse.cz>
  Jiri Slaby (SUSE) <jirislaby@kernel.org>
  Jiri Slaby <jirislaby@kernel.org>
  Joerg Roedel <jroedel@suse.de>
  Johan Hovold <johan+linaro@kernel.org>
  Johannes Berg <johannes.berg@intel.com>
  Jon Hunter <jonathanh@nvidia.com>
  Jonas Dreßler <verdre@v0yd.nl>
  Juergen Gross <jgross@suse.com>
  Justin Iurman <justin.iurman@uliege.be>
  Kai-Heng Feng <kai.heng.feng@canonical.com>
  Kees Cook <keescook@chromium.org>
  Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
  Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Kuniyuki Iwashima <kuniyu@amazon.com>
  Leon Romanovsky <leon@kernel.org>
  Leon Romanovsky <leonro@nvidia.com>
  Lin Ma <linma@zju.edu.cn>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Lorenzo Pieralisi <lpieralisi@kernel.org>
  Louis DeLosSantos <louis.delos.devel@gmail.com>
  Luca Ceresoli <luca.ceresoli@bootlin.com>
  Luca Weiss <luca.weiss@fairphone.com>
  Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Lukasz Majewski <lukma@denx.de>
  Manivannan Sadhasivam <mani@kernel.org>
  Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
  Marek Vasut <marex@denx.de>
  Mario Limonciello <mario.limonciello@amd.com>
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Martin KaFai Lau <martin.lau@kernel.org>
  Martynas Pumputis <m@lambda.lt>
  Mateusz Jończyk <mat.jonczyk@o2.pl>
  Matthew Auld <matthew.auld@intel.com>
  Matthieu Baerts (NGI0) <matttbe@kernel.org>
  Maximilian Heyne <mheyne@amazon.de>
  Michael Ellerman <mpe@ellerman.id.au>
  Mickaël Salaün <mic@digikod.net>
  Mike Christie <michael.christie@oracle.com>
  Min-Hua Chen <minhuadotchen@gmail.com>
  Ming Lei <ming.lei@redhat.com>
  Miquel Raynal <miquel.raynal@bootlin.com>
  Neil Armstrong <neil.armstrong@linaro.org>
  NeilBrown <neilb@suse.de>
  Nicolas Belin <nbelin@baylibre.com>
  Nikolay Aleksandrov <razor@blackwall.org>
  Oleksij Rempel <o.rempel@pengutronix.de>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Palmer Dabbelt <palmer@rivosinc.com>
  Paolo Abeni <pabeni@redhat.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Patrisious Haddad <phaddad@nvidia.com>
  Pavel Machek (CIP) <pavel@denx.de>
  Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
  Peng Ma <peng.ma@nxp.com>
  Petr Machata <petrm@nvidia.com>
  Pucha Himasekhar Reddy <himasekharx.reddy.pucha@intel.com> (A Contingent worker at Intel)
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Rob Herring <robh@kernel.org>
  Robert Foss <rfoss@kernel.org>
  Ron Economos <re@w6rz.net>
  Ryosuke Yasuoka <ryasuoka@redhat.com>
  Sabrina Dubroca <sd@queasysnail.net>
  Salvatore Bonaccorso <carnil@debian.org>
  Saravana Kannan <saravanak@google.com>
  Sasha Levin <sashal@kernel.org>
  Sean Christopherson <seanjc@google.com>
  Sebastian Reichel <sebastian.reichel@collabora.com>
  SeongJae Park <sj@kernel.org>
  Shawn Guo <shawnguo@kernel.org>
  Shiraz Saleem <shiraz.saleem@intel.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Steev Klimaszewski <steev@kali.org>
  Stefan Wahren <stefan.wahren@i2se.com>
  Stephen Boyd <sboyd@kernel.org>
  Steve Morvai <stevemorvai@hotmail.com>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Suren Baghdasaryan <surenb@google.com>
  Tadeusz Struk <tstruk@gigaio.com>
  Takashi Iwai <tiwai@suse.de>
  Takashi Sakamoto <o-takashi@sakamocchi.jp>
  Tasos Sahanidis <tasos@tasossah.com>
  Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
  Thierry Reding <treding@nvidia.com>
  Tim Schumacher <timschumi@gmx.de>
  Tomas Krcka <krckatom@amazon.de>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Vicki Pfau <vi@endrift.com>
  Vinod Koul <vkoul@kernel.org>
  Will Deacon <will@kernel.org>
  Xiaowei Bao <xiaowei.bao@nxp.com>
  Xiu Jianfeng <xiujianfeng@huawei.com>
  Yang Shi <yang@os.amperecomputing.com>
  Yann Sionneau <ysionneau@kalrayinc.com>
  Ye Bin <yebin10@huawei.com>
  Yi Zhao <yi.zhao@nxp.com>
  Ying Hsu <yinghsu@chromium.org>
  Yunjian Wang <wangyunjian@huawei.com>
  Yuntao Wang <ytcoode@gmail.com>
  Zijun Hu <quic_zijuhu@quicinc.com>
  Zong Li <zong.li@sifive.com>

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
   a3eb3a74aa8c9..61adba85cc402  61adba85cc40287232a539e607164f273260e0fe -> tested/linux-6.1

