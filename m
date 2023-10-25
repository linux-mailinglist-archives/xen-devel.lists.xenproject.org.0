Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF827D76C5
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 23:26:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623337.971126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvlOg-0005Y6-Fj; Wed, 25 Oct 2023 21:26:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623337.971126; Wed, 25 Oct 2023 21:26:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvlOg-0005Vt-Cg; Wed, 25 Oct 2023 21:26:38 +0000
Received: by outflank-mailman (input) for mailman id 623337;
 Wed, 25 Oct 2023 21:26:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qvlOe-0005UE-Ph; Wed, 25 Oct 2023 21:26:36 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qvlOe-0005ox-H2; Wed, 25 Oct 2023 21:26:36 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qvlOe-0002TV-0h; Wed, 25 Oct 2023 21:26:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qvlOe-0000rh-0E; Wed, 25 Oct 2023 21:26:36 +0000
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
	bh=7kmAhyupYIXNhhQNZ+/31IiocsudAk+4K2J7hmKybqQ=; b=yGsjx4gOh9MoujtKDzN/XMfpki
	LcLZcp/aWsE8CzEtM5Zr+JR3lNUNd7iLd979qmq5X5wNBh8J+M5yIqrhz+OtED83LZrPG3QxOTMOZ
	MFBsAwMfhz4EBs406zOCY6P7l8uOb7O/pawaCjNsc2qm5yIx9HdVypop7ZLw1wuJTuwc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183523-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 183523: tolerable trouble: fail/pass/starved - PUSHED
X-Osstest-Failures:
    linux-5.4:test-armhf-armhf-xl-multivcpu:guest-start:fail:heisenbug
    linux-5.4:test-arm64-arm64-libvirt-raw:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-credit2:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-dom0pvh-xl-amd:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    linux=86ea40e6ad22d9d7daa54b9e8167ad1e4a8a48ee
X-Osstest-Versions-That:
    linux=02f78c59a0ed312a41d5d76397ea812c7cb19cb2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 25 Oct 2023 21:26:36 +0000

flight 183523 linux-5.4 real [real]
flight 183531 linux-5.4 real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/183523/
http://logs.test-lab.xenproject.org/osstest/logs/183531/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-xl-multivcpu 14 guest-start        fail pass in 183531-retest
 test-arm64-arm64-libvirt-raw 17 guest-start/debian.repeat fail pass in 183531-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-credit2 18 guest-start/debian.repeat fail blocked in 183335
 test-armhf-armhf-xl-multivcpu 18 guest-start/debian.repeat fail in 183531 like 183335
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check fail in 183531 never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check fail in 183531 never pass
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 183335
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 183335
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 183335
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 183335
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 183335
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 183335
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 183335
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 183335
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 183335
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 183335
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 183335
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 183335
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-dom0pvh-xl-amd  3 hosts-allocate               starved  n/a

version targeted for testing:
 linux                86ea40e6ad22d9d7daa54b9e8167ad1e4a8a48ee
baseline version:
 linux                02f78c59a0ed312a41d5d76397ea812c7cb19cb2

Last test of basis   183335  2023-10-10 20:15:05 Z   15 days
Testing same since   183523  2023-10-25 10:14:26 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abhinav Kumar <quic_abhinavk@quicinc.com>
  Adrian Hunter <adrian.hunter@intel.com>
  Alexander Zangerl <az@breathe-safe.com>
  Amelie Delaunay <amelie.delaunay@foss.st.com>
  Amir Goldstein <amir73il@gmail.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Arkadiusz Bokowy <arkadiusz.bokowy@gmail.com>
  Arnd Bergmann <arnd@arndb.de>
  Artem Chernyshev <artem.chernyshev@red-soft.ru>
  Atish Patra <atishp@rivosinc.com>
  Avri Altman <avri.altman@wdc.com>
  Bagas Sanjaya <bagasdotme@gmail.com>
  Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Benjamin Berg <benjamin.berg@intel.com>
  Benjamin Tissoires <bentiss@kernel.org>
  Benoît Monin <benoit.monin@gmx.fr>
  Bibek Kumar Patro <quic_bibekkum@quicinc.com>
  Borislav Petkov (AMD) <bp@alien8.de>
  Chengfeng Ye <dg573847474@gmail.com>
  Christian Brauner <brauner@kernel.org>
  Christophe Leroy <christophe.leroy@csgroup.eu>
  Clément Léger <cleger@rivosinc.com>
  Damien Le Moal <dlemoal@kernel.org>
  Dan Carpenter <dan.carpenter@linaro.org>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Dinghao Liu <dinghao.liu@zju.edu.cn>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Duoming Zhou <duoming@zju.edu.cn>
  Dzmitry <wrkedm@gmail.com>
  Edward AD <twuufnxlz@gmail.com>
  Eric Dumazet <edumazet@google.com>
  Fabio Porcedda <fabio.porcedda@gmail.com>
  Filipe Manana <fdmanana@suse.com>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Florian Westphal <fw@strlen.de>
  Gavrilov Ilia <Ilia.Gavrilov@infotecs.ru>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Haibo Chen <haibo.chen@nxp.com>
  Hans de Goede <hdegoede@redhat.com>
  Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
  Heiner Kallweit <hkallweit1@gmail.com>
  Herbert Xu <herbert@gondor.apana.org.au>
  Hui Wang <hui.wang@canonical.com>
  Ilya Dryomov <idryomov@gmail.com>
  Jacob Keller <jacob.e.keller@intel.com>
  Jakub Kicinski <kuba@kernel.org>
  Jamal Hadi Salim <jhs@mojatatu.com>
  Jan Kara <jack@suse.cz>
  Jason Wang <jasowang@redhat.com>
  Javier Carrasco <javier.carrasco.cruz@gmail.com>
  Jeff Layton <jlayton@kernel.org>
  Jeffery Miller <jefferymiller@google.com>
  Jens Axboe <axboe@kernel.dk>
  Jeremy Cline <jeremy@jcline.org>
  Jesse Brandeburg <jesse.brandeburg@intel.com>
  Jim Mattson <jmattson@google.com>
  Jiri Kosina <jkosina@suse.cz>
  Johan Hovold <johan+linaro@kernel.org>
  Johan Hovold <johan@kernel.org>
  Johannes Berg <johannes.berg@intel.com>
  John Garry <john.garry@huawei.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Jordan Rife <jrife@google.com>
  Jorge Sanjuan Garcia <jorge.sanjuangarcia@duagon.com>
  Jose Javier Rodriguez Barbarin <JoseJavier.Rodriguez@duagon.com>
  Josef Bacik <josef@toxicpanda.com>
  Josua Mayer <josua@solid-run.com>
  Kai Uwe Broulik <foss-linux@broulik.de>
  Kees Cook <keescook@chromium.org>
  Kellen Renshaw <kellen.renshaw@canonical.com>
  Kenta Sato <tosainu.maple@gmail.com>
  Konstantin Meskhidze <konstantin.meskhidze@huawei.com>
  Krishna Kurapati <quic_kriskura@quicinc.com>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Lakshmi Yadlapati <lakshmiy@us.ibm.com>
  Lee, Chun-Yi <jlee@suse.com>
  Leon Romanovsky <leon@kernel.org>
  Linus Walleij <linus.walleij@linaro.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Liviu Dudau <liviu.dudau@arm.com>
  Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Ma Ke <make_ruc2021@163.com>
  Manish Chopra <manishc@marvell.com>
  Manuel Krause <manuelkrause@netscape.net>
  Marc Zyngier <maz@kernel.org>
  Mark Brown <broonie@kernel.org>
  Martin Fuzzey <martin.fuzzey@flowbird.group>
  Martin Kurbanov <mmkurbanov@sberdevices.ru>
  Mathias Nyman <mathias.nyman@linux.intel.com>
  Matthias Berndt <matthias_berndt@gmx.de>
  Michael Ellerman <mpe@ellerman.id.au>
  Michal Koutný <mkoutny@suse.com>
  Michal Schmidt <mschmidt@redhat.com>
  Michał Mirosław <mirq-linux@rere.qmqm.pl>
  Mingwei Zhang <mizhang@google.com>
  Miquel Raynal <miquel.raynal@bootlin.com>
  Nathan Chancellor <nathan@kernel.org>
  Neal Cardwell <ncardwell@google.com>
  Nicolas Dichtel <nicolas.dichtel@6wind.com>
  Niklas Schnelle <schnelle@linux.ibm.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Abeni <pabeni@redhat.com>
  Paul Menzel <pmenzel@molgen.mpg.de>
  Pedro Tammela <pctammela@mojatatu.com>
  Peter Korsgaard <peter@korsgaard.com>
  Peter Rosin <peda@axentia.se>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Peter Zijlstra <peterz@infradead.org>
  Phil Elwell <phil@raspberrypi.com>
  Piyush Mehta <piyush.mehta@amd.com>
  Pucha Himasekhar Reddy <himasekharx.reddy.pucha@intel.com> (A Contingent worker at Intel)
  Puliang Lu <puliang.lu@fibocom.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Rahul Rameshbabu <sergeantsagara@protonmail.com>
  René Rebe <rene@exactcode.de>
  Ricardo Cañuelo <ricardo.canuelo@collabora.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Sasha Levin <sashal@kernel.org>
  Sean Christopherson <seanjc@google.com>
  Simon Horman <horms@kernel.org> # build-tested
  Slade Watkins <srw@sladewatkins.net>
  Stefan Schmidt <stefan@datenfreihafen.org>
  Stefan Wahren <wahrenst@gmx.net>
  Steffen Klassert <steffen.klassert@secunet.com>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
  Sunand <sunandchakradhar@gmail.com>
  Sunil V L <sunilvl@ventanamicro.com>
  Tamim Khan <tamim@fusetak.com>
  Tejun Heo <tj@kernel.org>
  Thierry Reding <thierry.reding@gmail.com>
  Thinh Nguyen <Thinh.Nguyen@synopsys.com>
  Thorsten Leemhuis <linux@leemhuis.info>
  Tony Lindgren <tony@atomide.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Vasily Gorbik <gor@linux.ibm.com>
  Vinod Koul <vkoul@kernel.org>
  Waiman Long <longman@redhat.com>
  Wei Liu <wei.liu@kernel.org>
  Wen Gong <quic_wgong@quicinc.com>
  Wesley Cheng <quic_wcheng@quicinc.com>
  Wolfram Sang <wsa@kernel.org>
  Xingxing Luo <xingxing.luo@unisoc.com>
  Xiubo Li <xiubli@redhat.com>
  Ying Hsu <yinghsu@chromium.org>
  Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Yuchung Cheng <ycheng@google.com>
  Zack Rusin <zackr@vmware.com>
  zelenat <zelenat@gmail.com>
  Zhang Changzhong <zhangchangzhong@huawei.com>
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
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemut-rhel6hvm-amd                           pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-dom0pvh-xl-amd                              starved 
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
 test-arm64-arm64-xl-credit2                                  pass    
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
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 fail    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-i386-examine-uefi                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      pass    
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
   02f78c59a0ed..86ea40e6ad22  86ea40e6ad22d9d7daa54b9e8167ad1e4a8a48ee -> tested/linux-5.4

