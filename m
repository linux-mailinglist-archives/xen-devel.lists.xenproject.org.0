Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD5C7C542B
	for <lists+xen-devel@lfdr.de>; Wed, 11 Oct 2023 14:41:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615470.956710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqYVp-0004Rv-Sg; Wed, 11 Oct 2023 12:40:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615470.956710; Wed, 11 Oct 2023 12:40:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqYVp-0004QR-PZ; Wed, 11 Oct 2023 12:40:29 +0000
Received: by outflank-mailman (input) for mailman id 615470;
 Wed, 11 Oct 2023 12:40:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qqYVo-0004QF-Ck; Wed, 11 Oct 2023 12:40:28 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qqYVo-0004LY-98; Wed, 11 Oct 2023 12:40:28 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qqYVn-0005rw-PK; Wed, 11 Oct 2023 12:40:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qqYVn-0007WP-OP; Wed, 11 Oct 2023 12:40:27 +0000
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
	bh=e4sHSm9jatFWZofQuVmlnmaRXxtq17eq4JHRZ5f0zRI=; b=tLI7HZIVPZFDXCXn393JcArfhf
	577l0xUfz+uVDf5d2eH3PbR6fi0TvjnCVCFcx/xzNy8o6GdfaRW+0Hhl2965aYPDZBT3iP4gNnEKr
	8iSLyTuYIvOllYmLyLGH/GH807RzfD9Gf9Opm9SFdhmbN6NBmfEYWasu6FDv3sDRTq5g=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183335-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 183335: tolerable trouble: fail/pass/starved - PUSHED
X-Osstest-Failures:
    linux-5.4:test-armhf-armhf-xl-multivcpu:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:guest-start:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:hosts-allocate:starved:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:hosts-allocate:starved:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    linux=02f78c59a0ed312a41d5d76397ea812c7cb19cb2
X-Osstest-Versions-That:
    linux=a140610d8aff1a06d36f8e4e9e66079b561d043d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 11 Oct 2023 12:40:27 +0000

flight 183335 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183335/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-multivcpu 18 guest-start/debian.repeat    fail like 183199
 test-armhf-armhf-xl-credit2  14 guest-start                  fail  like 183205
 test-armhf-armhf-xl-rtds     18 guest-start/debian.repeat    fail  like 183220
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 183220
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 183226
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 183226
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 183226
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 183226
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 183226
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 183226
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 183226
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 183226
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 183226
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 183226
 test-armhf-armhf-libvirt-qcow2 17 guest-start/debian.repeat   fail like 183226
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 183226
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2   3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl-vhd       3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl-xsm       3 hosts-allocate               starved  n/a

version targeted for testing:
 linux                02f78c59a0ed312a41d5d76397ea812c7cb19cb2
baseline version:
 linux                a140610d8aff1a06d36f8e4e9e66079b561d043d

Last test of basis   183226  2023-09-30 15:31:03 Z   10 days
Testing same since   183335  2023-10-10 20:15:05 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aaron Brown <aaron.f.brown@intel.com>
  Aleksandr Loktionov <aleksandr.loktionov@intel.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alexandra Diupina <adiupina@astralinux.ru>
  Alexei Starovoitov <ast@kernel.org>
  Amanda Liu <amanda.liu@amd.com>
  Andrew Bowers <andrewx.bowers@intel.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Anna Schumaker <Anna.Schumaker@Netapp.com>
  Anthony Koo <Anthony.Koo@amd.com>
  Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
  Arnd Bergmann <arnd@arndb.de>
  Artem Chernyshev <artem.chernyshev@red-soft.ru>
  Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Ben Wolsieffer <ben.wolsieffer@hefring.com>
  Benjamin Block <bblock@linux.ibm.com>
  Benjamin Gray <bgray@linux.ibm.com>
  Bernard Metzler <bmt@zurich.ibm.com>
  Brian Norris <briannorris@chromium.org>
  Casey Schaufler <casey@schaufler-ca.com>
  Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
  Christoph Hellwig <hch@lst.de>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Chuck Lever <chuck.lever@oracle.com>
  Damien Le Moal <dlemoal@kernel.org>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniel P. Berrangé <berrange@redhat.com>
  David Howells <dhowells@redhat.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Dhruva Gole <d-gole@ti.com>
  Dinghao Liu <dinghao.liu@zju.edu.cn>
  Disha Goel <disgoel@linux.ibm.com>
  Dmitry Monakhov <dmtrmonakhov@yandex-team.ru>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Duje Mihanović <duje.mihanovic@skole.hr>
  Eric Dumazet <edumazet@google.com>
  Fabio Estevam <festevam@denx.de>
  Felix Fietkau <nbd@nbd.name>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Florian Westphal <fw@strlen.de>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Greg Ungerer <gerg@kernel.org>
  Gregory Greenman <gregory.greenman@intel.com>
  Grzegorz Szczurek <grzegorzx.szczurek@intel.com>
  Guenter Roeck <linux@roeck-us.net>
  Gustavo A. R. Silva <gustavoars@kernel.org>
  Hamza Mahfooz <hamza.mahfooz@amd.com>
  Han Xu <han.xu@nxp.com>
  Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
  Heiner Kallweit <hkallweit1@gmail.com>
  Helge Deller <deller@gmx.de>
  Himanshu Madhani <hmadhani@marvell.com>
  Hsin-Wei Hung <hsinweih@uci.edu>
  Ilya Dryomov <idryomov@gmail.com>
  Ivan Babrou <ivan@cloudflare.com>
  Ivan Vecera <ivecera@redhat.com>
  Ivanov Mikhail <ivanov.mikhail1@huawei-partners.com>
  Jakub Kicinski <kuba@kernel.org>
  Jan Kara <jack@suse.cz>
  Jeff Kirsher <jeffrey.t.kirsher@intel.com>
  Jeremy Cline <jeremy@jcline.org>
  Jerome Brunet <jbrunet@baylibre.com>
  Jie Wang <wangjie125@huawei.com>
  Jijie Shao <shaojijie@huawei.com>
  Johannes Berg <johannes.berg@intel.com>
  John David Anglin <dave.anglin@bell.net>
  John David Anglin <dave@parisc-linux.org>
  John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
  Johnathan Mantey <johnathanx.mantey@intel.com>
  Jon Hunter <jonathanh@nvidia.com>
  Jordan Rife <jrife@google.com>
  Josef Bacik <josef@toxicpanda.com>
  Jozsef Kadlecsik <kadlec@netfilter.org>
  Juergen Gross <jgross@suse.com>
  Julia Lawall <julia.lawall@inria.fr>
  Junxiao Bi <junxiao.bi@oracle.com>
  Kailang Yang <kailang@realtek.com>
  Kajol Jain <kjain@linux.ibm.com>
  Kalle Valo <kvalo@kernel.org>
  Karen Sornek <karen.sornek@intel.com>
  Kees Cook <keescook@chromium.org>
  Keith Busch <kbusch@kernel.org>
  Kemeng Shi <shikemeng@huaweicloud.com>
  Kevin Hilman <khilman@baylibre.com>
  Konrad Jankowski <konrad0.jankowski@intel.com>
  Konstantin Meskhidze <konstantin.meskhidze@huawei.com>
  Kyle Zeng <zengyhkyle@gmail.com>
  Leon Romanovsky <leon@kernel.org>
  Leon Romanovsky <leonro@nvidia.com>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Lukas Bulwahn <lukas.bulwahn@gmail.com>
  Lukas Czerner <lczerner@redhat.com>
  Mark Brown <broonie@kernel.org>
  Martin K. Petersen <martin.petersen@oracle.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Masami Hiramatsu (Google) <mhiramat@kernel.org>
  Matthias Schiffer <mschiffer@universe-factory.net>
  Mauricio Faria de Oliveira <mfo@canonical.com>
  Max Filippov <jcmvbkbc@gmail.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Mika Westerberg <mika.westerberg@linux.intel.com>
  Mikko Perttunen <mperttunen@nvidia.com>
  Mimi Zohar <zohar@linux.ibm.com>
  Naresh Kamboju <naresh.kamboju@linaro.org>
  Neal Cardwell <ncardwell@google.com>
  Niklas Cassel <niklas.cassel@wdc.com>
  Nikolay Aleksandrov <razor@blackwall.org>
  Nilesh Javali <njavali@marvell.com>
  Oleksandr Tymoshenko <ovt@google.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Pan Bian <bianpan2016@163.com>
  Paolo Abeni <pabeni@redhat.com>
  Pin-yen Lin <treapking@chromium.org>
  Pratyush Yadav <ptyadav@amazon.de>
  Qingqing Zhuo <qingqing.zhuo@amd.com>
  Quinn Tran <qutran@marvell.com>
  Rafal Romanowski <rafal.romanowski@intel.com>
  Randy Dunlap <rdunlap@infradead.org>
  Randy Dunlap <rdunlap@infradead.org> # build-tested
  Richard Fitzgerald <rf@opensource.cirrus.com>
  Richard Weinberger <richard@nod.at>
  Roberto Sassu <roberto.sassu@huawei.com>
  Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
  Ryusuke Konishi <konishi.ryusuke@gmail.com>
  Sabrina Dubroca <sd@queasysnail.net>
  Sasha Levin <sashal@kernel.org>
  Shay Drory <shayd@nvidia.com>
  Shengjiu Wang <shengjiu.wang@nxp.com>
  Shigeru Yoshida <syoshida@redhat.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Stanislav Fomichev <sdf@google.com>
  Stefan Assmann <sassmann@kpanic.de>
  Stephen Boyd <sboyd@kernel.org>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Sylwia Wnuczko <sylwia.wnuczko@intel.com>
  Szuying Chen <chensiying21@gmail.com>
  Szuying Chen <Chloe_Chen@asmedia.com.tw>
  Takashi Iwai <tiwai@suse.de>
  Theodore Ts'o <tytso@mit.edu>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Thomas Zimmermann <tzimmermann@suse.de>
  Timo Alho <talho@nvidia.com>
  Toke Høiland-Jørgensen <toke@redhat.com>
  Tony Brelinski <tony.brelinski@intel.com>
  Tony Lindgren <tony@atomide.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Trond Myklebust <trond.myklebust@hammerspace.com>
  Vishal Goel <vishal.goel@samsung.com>
  Wang Jianchao <wangjianchao@kuaishou.com>
  Wenhua Lin <Wenhua.Lin@unisoc.com>
  Werner Sembach <wse@tuxedocomputers.com>
  Wim Van Sebroeck <wim@linux-watchdog.org>
  Wolfram Sang <wsa@kernel.org>
  Xiaoke Wang <xkernel.wang@foxmail.com>
  Xin Long <lucien.xin@gmail.com>
  Zheng Yejian <zhengyejian1@huawei.com>
  Zhihao Cheng <chengzhihao1@huawei.com>
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
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      starved 
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemut-rhel6hvm-amd                           pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-i386-xl-qemut-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-i386-xl-qemut-ws16-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-i386-examine-bios                                 pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  starved 
 test-armhf-armhf-xl-credit2                                  fail    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-i386-examine                                      pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                fail    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               fail    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-i386-examine-uefi                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      starved 
 test-armhf-armhf-xl-vhd                                      pass    
 test-amd64-i386-xl-vhd                                       pass    


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
   a140610d8aff..02f78c59a0ed  02f78c59a0ed312a41d5d76397ea812c7cb19cb2 -> tested/linux-5.4

