Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B90468D29
	for <lists+xen-devel@lfdr.de>; Sun,  5 Dec 2021 21:19:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.238504.413292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mtxye-0006gp-Fp; Sun, 05 Dec 2021 20:19:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 238504.413292; Sun, 05 Dec 2021 20:19:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mtxye-0006ef-9n; Sun, 05 Dec 2021 20:19:16 +0000
Received: by outflank-mailman (input) for mailman id 238504;
 Sun, 05 Dec 2021 20:19:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mtxyc-0006eV-9m; Sun, 05 Dec 2021 20:19:14 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mtxyc-0001NU-0T; Sun, 05 Dec 2021 20:19:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mtxyb-0000YG-MB; Sun, 05 Dec 2021 20:19:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mtxyb-0002Dj-Lg; Sun, 05 Dec 2021 20:19:13 +0000
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
	bh=otsZXy9j3AMHurgc8BOpSjr/x8SC8XH4dA7qH0XoSqk=; b=tn8O83pfh3iPrwJwW8drO3PdtI
	VRIh+UlvW+Dh2Ibkj9gwQ4edi2Ng1V6S/kVfYDj3MUUtCgSusZBSkr4IP7ix3ZPC2VlpZXPLVr34O
	XYD80yFHtAVCT+mhDpkccXtWjvzJhpC5HGlJ1k8FVwi6eaQSlRoB5q35wQOs11A/kNgs=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-167118-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 167118: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-libvirt:guest-start/debian.repeat:fail:heisenbug
    linux-linus:test-arm64-arm64-xl-xsm:xen-boot:fail:heisenbug
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=23b55d673d7527b093cd97b7c217c82e70cd1af0
X-Osstest-Versions-That:
    linux=c5c17547b778975b3d83a73c8d84e8fb5ecf3ba5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 05 Dec 2021 20:19:13 +0000

flight 167118 linux-linus real [real]
flight 167164 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/167118/
http://logs.test-lab.xenproject.org/osstest/logs/167164/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-libvirt 20 guest-start/debian.repeat fail pass in 167164-retest
 test-arm64-arm64-xl-xsm       8 xen-boot            fail pass in 167164-retest

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-xsm     15 migrate-support-check fail in 167164 never pass
 test-arm64-arm64-xl-xsm 16 saverestore-support-check fail in 167164 never pass
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 166942
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 166942
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 166942
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 166942
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 166942
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 166942
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 166942
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 166942
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass

version targeted for testing:
 linux                23b55d673d7527b093cd97b7c217c82e70cd1af0
baseline version:
 linux                c5c17547b778975b3d83a73c8d84e8fb5ecf3ba5

Last test of basis   166942  2021-11-27 18:11:40 Z    8 days
Failing since        166963  2021-11-30 20:54:02 Z    4 days    7 attempts
Testing same since   167118  2021-12-04 23:14:16 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aaro Koskinen <aaro.koskinen@iki.fi>
  Adrian Hunter <adrian.hunter@intel.com>
  Akhil P Oommen <akhilpo@codeaurora.org>
  Alain Volmat <alain.volmat@foss.st.com>
  Alex Bee <knaerzche@gmail.com>
  Alex Deucher <aleander.deucher@amd.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alex Williamson <alex.williamson@redhat.com>
  Alexandra Winter <wintera@linux.ibm.com>
  Amir Tzin <amirtz@nvidia.com>
  Andreas Gruenbacher <agruenba@redhat.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Anup Patel <anup.patel@wdc.com>
  Ard Biesheuvel <ardb@kernel.org>
  Arnd Bergmann <arnd@arndb.de>
  Aya Levin <ayal@nvidia.com>
  Baokun Li <libaokun1@huawei.com>
  Bean Huo <beanhuo@micron.com>
  Ben Ben-Ishay <benishay@nvidia.com>
  Ben Gardon <bgardon@google.com>
  Benjamin Coddington <bcodding@redhat.com>
  Benjamin Poirier <bpoirier@nvidia.com>
  Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
  Borislav Petkov <bp@suse.de>
  Catalin Marinas <catalin.marinas@arm.com>
  Chen Jun <chenjun102@huawei.com>
  chongjiapeng <jiapeng.chong@linux.alibaba.com>
  Christian Borntraeger <borntraeger@de.ibm.com>
  Christoph Hellwig <hch@lst.de>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Christophe Leroy <christophe.leroy@csgroup.eu>
  Colin Xu <colin.xu@gmail.com>
  Corey Minyard <cminyard@mvista.com>
  Damien Le Moal <damien.lemoal@opensource.wdc.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Dan Johansen <strit@manjaro.org>
  Daniel Lezcano <daniel.lezcano@linaro.org>
  Daniel Wheeler <daniel.wheeler@amd.com>
  Darrick J. Wong <djwong@kernel.org>
  Dave Airlie <airlied@redhat.com>
  David Howells <dhowells@redhat.com>
  David S. Miller <davem@davemloft.net>
  David Woodhouse <dwmw@amazon.co.uk>
  Deren Wu <deren.wu@mediatek.com>
  Dmitry Bogdanov <dbezrukov@marvell.com>
  Dmytro Linkin <dlinkin@nvidia.com>
  Dongliang Mu <mudongliangabcd@gmail.com>
  Doug Smythies <dsmythies@telus.net>
  Douglas Anderson <dianders@chromium.org>
  Douglas Gilbert <dgilbert@interlog.com>
  Dust Li <dust.li@linux.alibaba.com>
  Eiichi Tsukata <eiichi.tsukata@nutanix.com>
  Eric Dumazet <edumazet@google.com>
  Erik Ekman <erik@kryo.se>
  Felix Fietkau <nbd@nbd.name>
  Finn Thain <fthain@linux-m68k.org>
  Flora Cui <flora.cui@amd.com>
  Florian Fainelli <f.fainelli@gmail.com>
  Florian Fischer <florian.fl.fischer@fau.de>
  Fuad Tabba <tabba@google.com>
  Gal Pressman <gal@nvidia.com>
  Gao Xiang <xiang@kernel.org>
  George Kennedy <george.kennedy@oracle.com>
  George Shen <George.Shen@amd.com>
  Gerd Hoffmann <kraxel@redhat.com>
  Giovanni Cabiddu <giovanni.cabiddu@intel.com>
  Guangming <Guangming.Cao@mediatek.com>
  Guchun Chen <guchun.chen@amd.com>
  Guenter Roeck <linux@roeck-us.net>
  Gurchetan Singh <gurchetansingh@chromium.org>
  Gustavo A. R. Silva <gustavoars@kernel.org>
  Hangbin Liu <liuhangbin@gmail.com>
  Hans de Goede <hdegoede@redhat.com>
  Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
  Heiko Carstens <hca@linux.ibm.com>
  Hou Wenlong <houwenlong93@linux.alibaba.com>
  Huang Jianan <huangjianan@oppo.com>
  Huang Pei <huangpei@loongson.cn>
  Hyunchul Lee <hyc.lee@gmail.com>
  Igor Russkikh <irusskikh@marvell.com>
  Ilie Halip <ilie.halip@gmail.com>
  Ioanna Alifieraki <ioanna-maria.alifieraki@canonical.com>
  Jakub Kicinski <kuba@kernel.org>
  James Smart <jsmart2021@gmail.com>
  Jane Jian <Jane.Jian@amd.com>
  Jani Nikula <jani.nikula@intel.com>
  Jason A. Donenfeld <Jason@zx2c4.com>
  Jason Wang <jasowang@redhat.com>
  Jens Axboe <axboe@kernel.dk>
  Jeremy Kerr <jk@codeconstruct.com.au>
  Jian-Hong Pan <jhp@endlessos.org>
  Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
  Jimmy Kizito <Jimmy.Kizito@amd.com>
  Joerg Roedel <jroedel@suse.de>
  José Roberto de Souza <jose.souza@intel.com>
  Juergen Gross <jgross@suse.com>
  Kai Vehmanen <kai.vehmanen@linux.intel.com>
  Kalle Valo <kvalo@codeaurora.org>
  Karsten Graul <kgraul@linux.ibm.com>
  Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
  Lai Jiangshan <laijs@linux.alibaba.com>
  Larry Finger <Larry.Finger@lwfinger.net>
  Li Zhijian <lizhijian@cn.fujitsu.com>
  Lijo Lazar <lijo.lazar@amd.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Longpeng <longpeng2@huawei.com>
  Lorenzo Bianconi <lorenzo@kernel.org>
  Lu Baolu <baolu.lu@linux.intel.com>
  Luca Coelho <luciano.coelho@intel.com>
  Lucas Tanure <tanureal@opensource.cirrus.com>
  Luiz Angelo Daros de Luca <luizluca@gmail.com>
  Lyude Paul <lyude@redhat.com>
  Maciej Fijalkowski <maciej.fijalkowski@intel.com>
  Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
  Maor Dickman <maord@nvidia.com>
  Maor Gottlieb <maorg@nvidia.com>
  Marc Zyngier <maz@kernel.org>
  Marco Elver <elver@google.com>
  Marek Behún <kabel@kernel.org>
  Mark Bloch <mbloch@nvidia.com>
  Mark Brown <broonie@kernel.org>
  Mark Rutland <mark.rutland@arm.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Masami Hiramatsu <mhiramat@kernel.org>
  Matt Johnston <matt@codeconstruct.com.au>
  Matthew Wilcox (Oracle) <willy@infradead.org>
  Max Filippov <jcmvbkbc@gmail.com>
  Maxime Ripard <maxime@cerno.tech>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael S. Tsirkin <mst@redhat.com>
  Michael Stapelberg <michael@stapelberg.ch>
  Mike Christie <michael.christie@oracle.com>
  Miklos Szeredi <mszeredi@redhat.com>
  Mordechay Goodstein <mordechay.goodstein@intel.com>
  Moshe Shemesh <moshe@nvidia.com>
  msizanoen1 <msizanoen@qtmlabs.xyz>
  Muchun Song <songmuchun@bytedance.com>
  Mustapha Ghaddar <mghaddar@amd.com>
  Mustapha Ghaddar <mustapha.ghaddar@amd.com>
  Namjae Jeon <linkinjeon@kernel.org>
  NeilBrown <neilb@suse.de>
  Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
  Nicholas Piggin <npiggin@gmail.com>
  Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
  Nikita Danilov <ndanilov@aquantia.com>
  Niklas Schnelle <schnelle@linux.ibm.com>
  Ole Ernst <olebowle@gmx.com>
  Olga Kornievskaia <kolga@netapp.com>
  Ondrej Jirman <megous@megous.com>
  Paolo Abeni <pabeni@redhat.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Paul Cercueil <paul@crapouillou.net>
  Paul Ely <paul.ely@broadcom.com>
  Paulo Alcantara (SUSE) <pc@cjr.nz>
  Paulo Alcantara <pc@cjr.nz>
  Pavel Begunkov <asml.silence@gmail.com>
  Perry Yuan <Perry.Yuan@amd.com>
  Peter Geis <pgwipeout@gmail.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Philip Chen <philipchen@chromium.org>
  Philip Yang <Philip.Yang@amd.com>
  Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
  Ping-Ke Shih <pkshih@realtek.com>
  Qian Cai <quic_qiancai@quicinc.com>
  Raed Salem <raeds@nvidia.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Randy Dunlap <rdunlap@infradead.org>
  Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
  Rob Clark <robdclark@chromium.org>
  Rob Clark <robdclark@gmail.com>
  Rodrigo Vivi <rodrigo.vivi@intel.com>
  Saeed Mahameed <saeedm@nvidia.com>
  Salvatore Bonaccorso <carnil@debian.org>
  Sameer Pujar <spujar@nvidia.com>
  Sameer Saurabh <ssaurabh@marvell.com>
  Santosh Shilimkar <santosh.shilimkar@oracle.com>
  Sean Christopherson <seanjc@google.com>
  shaoyunl <shaoyun.liu@amd.com>
  Shen, George <George.Shen@amd.com>
  Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
  Shyam Prasad N <sprasad@microsoft.com>
  Sreekanth Reddy <sreekanth.reddy@broadcom.com>
  Stanislaw Gruszka <stf_xl@wp.pl>
  Steev Klimaszewski <steev@kali.org>
  Stefan Binding <sbinding@opensource.cirrus.com>
  Stefano Garzarella <sgarzare@redhat.com>
  Stephen Boyd <swboyd@chromium.org>
  Stephen Suryaputra <ssuryaextr@gmail.com>
  Steve French <stfrench@microsoft.com>
  Steven Rostedt (VMware) <rostedt@goodmis.org>
  Sudarsana Reddy Kalluru <skalluru@marvell.com>
  Sukadev Bhattiprolu <sukadev@linux.ibm.com>
  Sumit Semwal <sumit.semwal@linaro.org>
  Sven Schuchmann <schuchmann@schleissheimer.de>
  Takashi Iwai <tiwai@suse.de>
  Tang Yizhou <tangyizhou@huawei.com>
  Tariq Toukan <tariqt@nvidia.com>
  Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
  Thiago Rafael Becker <trbecker@gmail.com>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Tianhao Chai <cth451@gmail.com>
  Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
  Tiezhu Yang <yangtiezhu@loongson.cn>
  Tony Lu <tonylu@linux.alibaba.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Trond Myklebust <trond.myklebust@hammerspace.com>
  Vincent Whitchurch <vincent.whitchurch@axis.com>
  Viresh Kumar <viresh.kumar@linaro.org>
  Vitaly Kuznetsov <vkuznets@redhat.com>
  Vitaly Rodionov <vitalyr@opensource.cirrus.com>
  Waiman Long <longman@redhat.com>
  Wei Yongjun <weiyongjun1@huawei.com>
  Wenjia Zhang <wenjia@linux.ibm.com>
  Will Deacon <will@kernel.org>
  William Kucharski <william.kucharski@oracle.com>
  Wolfram Sang <wsa@kernel.org>
  Wu Zongyong <wuzongyong@linux.alibaba.com>
  Xiayu Zhang <Xiayu.Zhang@mediatek.com>
  Xiongfeng Wang <wangxiongfeng2@huawei.com>
  Yang Guang <yang.guang5@zte.com.cn>
  Yang Xu <xuyang2018.jy@fujitsu.com>
  Ye Bin <yebin10@huawei.com>
  Ye Guojin <ye.guojin@zte.com.cn>
  Zhenyu Wang <zhenyuw@linux.intel.com>
  Zhou Qingyang <zhou1615@umn.edu>
  Łukasz Bartosik <lb@semihalf.com>

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
 test-arm64-arm64-xl-xsm                                      fail    
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
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     fail    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-amd64-xl-multivcpu                                pass    
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
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 pass    
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
   c5c17547b778..23b55d673d75  23b55d673d7527b093cd97b7c217c82e70cd1af0 -> tested/linux-linus

