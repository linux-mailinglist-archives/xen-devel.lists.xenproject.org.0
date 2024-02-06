Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D43A84ADB2
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 05:49:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676630.1052841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXDO0-0002TU-Bd; Tue, 06 Feb 2024 04:48:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676630.1052841; Tue, 06 Feb 2024 04:48:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXDO0-0002SH-8e; Tue, 06 Feb 2024 04:48:44 +0000
Received: by outflank-mailman (input) for mailman id 676630;
 Tue, 06 Feb 2024 04:48:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rXDNz-0002S5-0A; Tue, 06 Feb 2024 04:48:43 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rXDNy-0001XJ-TH; Tue, 06 Feb 2024 04:48:42 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rXDNy-0006em-JS; Tue, 06 Feb 2024 04:48:42 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rXDNy-0007OM-Ip; Tue, 06 Feb 2024 04:48:42 +0000
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
	bh=5fAF8OG/r4ibNfyXf02XoeCTkkHvU4crPKIsMKkdGtQ=; b=qN/yV+XkG9ygpNAGHu3c9or0cR
	51oksal6a/0haFAAzgzEuGTsoXWmxYxWHk5EnbSXuu5oAGGaDkMx5KqcNWjeKbBHXKv+D1FVcGfxZ
	/sehHY55aN7nNWsDPYrmDnaKWt5IoJjtsC1li7HxLJj9LW4hjBIYYkPfSyUayiPs6yiY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184595-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-6.1 test] 184595: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-6.1:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-6.1:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-6.1:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-6.1:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=f1bb70486c9c11d7e2d55240d4557f9fc575fbac
X-Osstest-Versions-That:
    linux=e5c3b988b827c76f52d0f62343e863b9133a0cd2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 06 Feb 2024 04:48:42 +0000

flight 184595 linux-6.1 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184595/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 184570
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 184570
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 184570
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 184570
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 184570
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 184570
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 184570
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 184570
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass

version targeted for testing:
 linux                f1bb70486c9c11d7e2d55240d4557f9fc575fbac
baseline version:
 linux                e5c3b988b827c76f52d0f62343e863b9133a0cd2

Last test of basis   184570  2024-02-03 02:27:03 Z    3 days
Testing same since   184595  2024-02-05 20:44:35 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Guilherme G. Piccoli" <gpiccoli@igalia.com>
  Abel Vesa <abel.vesa@linaro.org>
  Abhinav Kumar <quic_abhinavk@quicinc.com>
  Adam Ford <aford173@gmail.com>  #imx8mp-beacon
  Adrian Reber <areber@redhat.com>
  Ahmed Zaki <ahmed.zaki@intel.com>
  Al Viro <viro@zeniv.linux.org.uk>
  Alan Maguire <alan.maguire@oracle.com>
  Aleksandr Loktionov <aleksandr.loktionov@intel.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alex Lyakas <alex.lyakas@zadara.com>
  Alexander Gordeev <agordeev@linux.ibm.com>
  Alexander Potapenko <glider@google.com>
  Alexander Stein <alexander.stein@ew.tq-group.com>
  Alexandre Belloni <alexandre.belloni@bootlin.com>
  Alexei Starovoitov <ast@kernel.org>
  Alvin Lee <alvin.lee2@amd.com>
  Amit Pundir <amit.pundir@linaro.org>
  Andrei Vagin <avagin@gmail.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andrii Nakryiko <andrii@kernel.org>
  Andrii Staikov <andrii.staikov@intel.com>
  Andrzej Hajda <andrzej.hajda@intel.com>
  Anna Schumaker <Anna.Schumaker@Netapp.com>
  Anton Ivanov <anton.ivanov@cambridgegreys.com>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Arnd Bergmann <arnd@arndb.de>
  Aurabindo Pillai <aurabindo.pillai@amd.com>
  Bailey Forrest <bcf@google.com>
  Baochen Qiang <quic_bqiang@quicinc.com>
  Baokun Li <libaokun1@huawei.com>
  Benjamin Berg <benjamin.berg@intel.com>
  Benjamin Berg <benjamin@sipsolutions.net>
  Benjamin Poirier <bpoirier@nvidia.com>
  Bharat Bhushan <bbhushan2@marvell.com>
  Bjorn Andersson <andersson@kernel.org>
  Bjorn Helgaas <bhelgaas@google.com>
  bo liu <bo.liu@senarytech.com>
  Borislav Petkov (AMD) <bp@alien8.de>
  Breno Leitao <leitao@debian.org>
  Catalin Marinas <catalin.marinas@arm.com>
  Celeste Liu <CoelacanthusHex@gmail.com>
  Changye Wu <wuchangye@huawei.com>
  Chanwoo Choi <cw00.choi@samsung.com>
  Chao Yu <chao@kernel.org>
  ching Huang <ching2048@areca.com.tw>
  Chris Riches <chris.riches@nutanix.com>
  Christian Brauner <brauner@kernel.org>
  Christian König <christian.koenig@amd.com>
  Christian Marangi <ansuelsmth@gmail.com>
  Christoph Hellwig <hch@lst.de>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  clancy shang <clancy.shang@quectel.com>
  Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniel Stodden <dns@arista.com>
  Daniel Vacek <neelx@redhat.com>
  Daniel Vetter <daniel@ffwll.ch>
  Daniel Wheeler <daniel.wheeler@amd.com>
  Dave Hansen <dave.hansen@linux.intel.com>
  Dave Kleikamp <dave.kleikamp@oracle.com>
  David Howells <dhowells@redhat.com>
  David S. Miller <davem@davemloft.net>
  Derek Barbosa <debarbos@redhat.com>
  Dmitry Antipov <dmantipov@yandex.ru>
  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Dominique Martinet <asmadeus@codewreck.org>
  Douglas Anderson <dianders@chromium.org>
  Edward Adam Davis <eadavis@qq.com>
  Eric Dumazet <edumazet@google.com>
  Fabio Estevam <festevam@denx.de>
  Fei Shao <fshao@chromium.org>
  Felix Kuehling <Felix.Kuehling@amd.com>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Frédéric Danis <frederic.danis@collabora.com>
  Gabriel Krisman Bertazi <krisman@suse.de>
  Gao Xiang <hsiangkao@linux.alibaba.com>
  Ghanshyam Agrawal <ghanshyam1898@gmail.com>
  Greg KH <gregkh@linuxfoundation.org>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Guilherme G. Piccoli <gpiccoli@igalia.com>
  Guo Ren <guoren@kernel.org>
  Guoqing Jiang <guoqing.jiang@linux.dev>
  H. Nikolaus Schaller <hns@goldelico.com>
  Halil Pasic <pasic@linux.ibm.com>
  Hamza Mahfooz <hamza.mahfooz@amd.com>
  Hannes Reinecke <hare@suse.de>
  Hans de Goede <hdegoede@redhat.com>
  Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Harald Freudenberger <freude@linux.ibm.com>
  Hardik Gajjar <hgajjar@de.adit-jv.com>
  HariBabu Gattem <haribabu.gattem@xilinx.com>
  Harshit Shah <harshitshah.opendev@gmail.com>
  Heiko Carstens <hca@linux.ibm.com>
  Heiko Stuebner <heiko@sntech.de>
  Heiner Kallweit <hkallweit1@gmail.com>
  Helge Deller <deller@gmx.de>
  Helge Deller <deller@kernel.org>
  Herb Wei <weihao.bj@ieisystem.com>
  Herbert Xu <herbert@gondor.apana.org.au>
  Horatiu Vultur <horatiu.vultur@microchip.com>
  Hou Tao <houtao1@huawei.com>
  Hsin-Yi Wang <hsinyi@chromium.org>
  Huacai Chen <chenhuacai@loongson.cn>
  Huang Shijie <shijie@os.amperecomputing.com>
  Ian Rogers <irogers@google.com>
  Ido Schimmel <idosch@nvidia.com>
  Igor Russkikh <irusskikh@marvell.com>
  Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
  Ilya Dryomov <idryomov@gmail.com>
  Ingo Molnar <mingo@kernel.org>
  Inki Dae <inki.dae@samsung.com>
  Jack Wang <jinpu.wang@ionos.com>
  Jaegeuk Kim <jaegeuk@kernel.org>
  Jakub Kicinski <kuba@kernel.org>
  James Clark <james.clark@arm.com>
  Jassi Brar <jaswinder.singh@linaro.org>
  Jay Buddhabhatti <jay.buddhabhatti@amd.com>
  Jay Vosburgh <jay.vosburgh@canonical.com>
  Jedrzej Jagielski <jedrzej.jagielski@intel.com>
  Jeff Johnson <quic_jjohnson@quicinc.com>
  Jens Axboe <axboe@kernel.dk>
  Jesse Brandeburg <jesse.brandeburg@intel.com>
  Jiri Kosina <jkosina@suse.com>
  Jo Van Bulck <jo.vanbulck@cs.kuleuven.be>
  Johan Hovold <johan+linaro@kernel.org>
  Johan Jonker <jbx6244@gmail.com>
  Johannes Berg <johannes.berg@intel.com>
  Jon Hunter <jonathanh@nvidia.com>
  Jonathan Gray <jsg@jsg.id.au>
  Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
  Josip Pavic <josip.pavic@amd.com>
  Juergen Gross <jgross@suse.com>
  Jun'ichi Nomura <junichi.nomura@nec.com>
  Justin Tee <justin.tee@broadcom.com>
  Jérôme Pouiller <jerome.pouiller@silabs.com>
  Kalle Valo <kvalo@kernel.org>
  Kalle Valo <quic_kvalo@quicinc.com>
  Kees Cook <keescook@chromium.org>
  kernelci.org bot <bot@kernelci.org>
  Kieran Bingham <kieran.bingham@ideasonboard.com>
  Konrad Dybcio <konrad.dybcio@linaro.org>
  Kuan-Wei Chiu <visitorckw@gmail.com>
  Kunwu Chan <chentao@kylinos.cn>
  Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  Lee Jones <lee@kernel.org>
  Leo Yan <leo.yan@linaro.org>
  Leon Romanovsky <leon@kernel.org>
  Lin Ma <linma@zju.edu.cn>
  Linus Lüssing <linus.luessing@c0d3.blue>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Ma Wupeng <mawupeng1@huawei.com>
  Manas Ghandat <ghandatmanas@gmail.com>
  Mao Jinlong <quic_jinlmao@quicinc.com>
  Marc Dionne <marc.dionne@auristor.com>
  Marco Elver <elver@google.com>
  Marek Szyprowski <m.szyprowski@samsung.com>
  Mark Brown <broonie@kernel.org>
  Mark Rutland <mark.rutland@arm.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Mateusz Jończyk <mat.jonczyk@o2.pl>
  Matthias May <matthias.may@westermo.com>
  Mauro Carvalho Chehab <mchehab@kernel.org>
  Max Kellermann <max.kellermann@ionos.com>
  Maxime Ripard <mripard@kernel.org>
  Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael Tretter <m.tretter@pengutronix.de>
  Michal Simek <michal.simek@amd.com>
  Michal Vokáč <michal.vokac@ysoft.com>
  Ming Lei <ming.lei@redhat.com>
  Ming Qian <ming.qian@nxp.com>
  Mingyi Zhang <zhangmingyi5@huawei.com>
  Minsuk Kang <linuxlovemin@yonsei.ac.kr>
  Miri Korenblit <miriam.rachel.korenblit@intel.com>
  Mukesh Ojha <quic_mojha@quicinc.com>
  MyungJoo Ham <myungjoo.ham@samsung.com>
  Nathan Chancellor <nathan@kernel.org>
  Naveen N Rao <naveen@kernel.org>
  Neil Armstrong <neil.armstrong@linaro.org>
  Nicolas Dichtel <nicolas.dichtel@6wind.com>
  Nikolay Aleksandrov <razor@blackwall.org>
  Oleg Nesterov <oleg@redhat.com>
  Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
  Oliver F. Brown <oliver.brown@oss.nxp.com>
  Osama Muhammad <osmtendev@gmail.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Palmer Dabbelt <palmer@rivosinc.com>
  Paolo Abeni <pabeni@redhat.com>
  Paul Moore <paul@paul-moore.com>
  Pavel Machek (CIP) <pavel@denx.de>
  Peter Robinson <pbrobinson@gmail.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Peter Zijlstra <peterz@infradead.org>
  Petr Machata <petrm@nvidia.com>
  Philip Yang <Philip.Yang@amd.com>
  Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
  Prarit Bhargava <prarit@redhat.com>
  Praveen Kaligineedi <pkaligineedi@google.com>
  Pucha Himasekhar Reddy <himasekharx.reddy.pucha@intel.com> (A Contingent worker at Intel)
  Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Rafal Romanowski <rafal.romanowski@intel.com>
  Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>
  Richard Weinberger <richard@nod.at>
  Rob Clark <robdclark@chromium.org>
  Robert Foss <rfoss@kernel.org>
  Romain Naour <romain.naour@skf.com>
  Ron Economos <re@w6rz.net>
  Rui Zhang <zr.zhang@vivo.com>
  Ryan Schaefer <ryanschf@amazon.com>
  Sakari Ailus <sakari.ailus@linux.intel.com>
  Salvatore Bonaccorso <carnil@debian.org>
  Sasha Levin <sashal@kernel.org>
  Sathya Prakash Veerichetty <safhya.prakash@broadcom.com>
  SeongJae Park <sj@kernel.org>
  Shannon Nelson <shannon.nelson@amd.com>
  Shawn Guo <shawnguo@kernel.org>
  Shiji Yang <yangshiji66@outlook.com>
  Shuai Xue <xueshuai@linux.alibaba.com>
  Song Liu <song@kernel.org>
  Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
  Stanislaw Gruszka <stf_xl@wp.pl>
  Stanley.Yang <Stanley.Yang@amd.com>
  Stephen Boyd <sboyd@kernel.org>
  Stephen Rothwell <sfr@canb.auug.org.au>
  Su Hui <suhui@nfschina.com>
  Suman Ghosh <sumang@marvell.com>
  Sumit Saxena <sumit.saxena@broadcom.com>
  Sunitha Mekala <sunithax.d.mekala@intel.com> (A Contingent worker at Intel)
  Takashi Iwai <tiwai@suse.de>
  Tanmay Shah <tanmay.shah@xilinx.com>
  Tejun Heo <tj@kernel.org>
  Theodore Ts'o <tytso@mit.edu>
  Thomas Bourgoin <thomas.bourgoin@foss.st.com>
  Thomas Gleixner <tglx@linutronix.de>
  Thomas Richter <tmricht@linux.ibm.com>
  Tobias Waldekranz <tobias@waldekranz.com>
  Toke Høiland-Jørgensen <toke@toke.dk>
  Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
  Tony Krowiak <akrowiak@linux.ibm.com>
  Tony Lindgren <tony@atomide.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
  Venky Shankar <vshankar@redhat.com>
  Ville Syrjälä <ville.syrjala@linux.intel.com>
  Viresh Kumar <viresh.kumar@linaro.org>
  Vladimir Oltean <vladimir.oltean@nxp.com>
  Wang, Beyond <Wang.Beyond@amd.com>
  Wayne Lin <wayne.lin@amd.com>
  Weichen Chen <weichen.chen@mediatek.com>
  Wen Gu <guwen@linux.alibaba.com>
  Wenchao Hao <haowenchao2@huawei.com>
  Werner Fischer <devlists@wefi.net>
  Will Deacon <will@kernel.org>
  Wim Van Sebroeck <wim@linux-watchdog.org>
  Xiang Chen <chenxiang66@hisilicon.com>
  Xianwei Zhao <xianwei.zhao@amlogic.com>
  Xiaowu.ding <xiaowu.ding@jaguarmicro.com>
  Xin Ji <xji@analogixsemi.com>
  Xin Liu <liuxin350@huawei.com>
  Xing Tong Wu <xingtong.wu@siemens.com>
  Xiubo Li <xiubli@redhat.com>
  Yafang Shao <laoar.shao@gmail.com>
  Yann Sionneau <ysionneau@kalrayinc.com>
  Ye Bin <yebin10@huawei.com>
  Yihang Li <liyihang9@huawei.com>
  Yonghong Song <yonghong.song@linux.dev>
  Youquan Song <youquan.song@intel.com>
  Yu-Che Cheng <giver@chromium.org>
  Yuluo Qiu <qyl27@outlook.com>
  Yuntao Wang <ytcoode@gmail.com>
  Zenm Chen <zenmchen@gmail.com>
  Zhengchao Shao <shaozhengchao@huawei.com>
  Zhipeng Lu <alexious@zju.edu.cn>
  Zhiquan Li <zhiquan1.li@intel.com>
  Zhu Yanjun <yanjun.zhu@linux.dev>
  Zijun Hu <quic_zijuhu@quicinc.com>

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
   e5c3b988b827..f1bb70486c9c  f1bb70486c9c11d7e2d55240d4557f9fc575fbac -> tested/linux-6.1

