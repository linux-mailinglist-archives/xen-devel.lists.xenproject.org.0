Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7C8861F57
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 23:06:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684945.1065221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rddgL-0002Y3-Th; Fri, 23 Feb 2024 22:06:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684945.1065221; Fri, 23 Feb 2024 22:06:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rddgL-0002Vv-PQ; Fri, 23 Feb 2024 22:06:13 +0000
Received: by outflank-mailman (input) for mailman id 684945;
 Fri, 23 Feb 2024 22:06:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rddgJ-0002Vl-Kx; Fri, 23 Feb 2024 22:06:11 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rddgJ-0004tP-Gh; Fri, 23 Feb 2024 22:06:11 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rddgJ-00073v-6Y; Fri, 23 Feb 2024 22:06:11 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rddgJ-0001da-63; Fri, 23 Feb 2024 22:06:11 +0000
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
	bh=NvygsFnjEAKi3A7Ke4kNeyLbloeAaUVt9XhSU2Qpa50=; b=lJZIUDYjASTP8SjlAybEG/IXp8
	UKZMGxrcRUMt8wK4wvW0v0WJpUMqqEFQpoXmlT1qm1JjichVywZd6fjU4zlY55aMIRZU1+Y9NwhL8
	S6z25thD9spvCUnZ+MnsFv2RUgdrjJ3Oo+Zg01qkIjQyiWKTJ2M7Cf20MLhysKQEFrKA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184733-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 184733: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-5.4:test-armhf-armhf-xl-credit1:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:guest-start:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=6e1f54a4985b63bc1b55a09e5e75a974c5d6719b
X-Osstest-Versions-That:
    linux=f0602893f43a54097fcf22bd8c2f7b8e75ca643e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 23 Feb 2024 22:06:11 +0000

flight 184733 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184733/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-credit1  18 guest-start/debian.repeat    fail  like 184511
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 184523
 test-armhf-armhf-xl-credit2  14 guest-start                  fail  like 184523
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 184523
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 184523
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 184523
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 184523
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 184523
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 184523
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 184523
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 184523
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 184523
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 184523
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 184523
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 linux                6e1f54a4985b63bc1b55a09e5e75a974c5d6719b
baseline version:
 linux                f0602893f43a54097fcf22bd8c2f7b8e75ca643e

Last test of basis   184523  2024-01-29 23:43:48 Z   24 days
Testing same since   184733  2024-02-23 07:45:41 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Guilherme G. Piccoli" <gpiccoli@igalia.com>
  Adrian Hunter <adrian.hunter@intel.com>
  Ajay Kaher <ajay.kaher@broadcom.com>
  Akinobu Mita <akinobu.mita@gmail.com>
  Al Viro <viro@zeniv.linux.org.uk>
  Alan Maguire <alan.maguire@oracle.com>
  Aleksander Mazur <deweloper@wp.pl>
  Alex Deucher <alexander.deucher@amd.com>
  Alex Henrie <alexhenrie24@gmail.com>
  Alex Lyakas <alex.lyakas@zadara.com>
  Alexander Gordeev <agordeev@linux.ibm.com>
  Alexander Hansen <alexander.hansen@9elements.com>
  Alexander Stein <alexander.stein@ew.tq-group.com>
  Alexandre Belloni <alexandre.belloni@bootlin.com>
  Alexei Starovoitov <ast@kernel.org>
  Alexey Khoroshilov <khoroshilov@ispras.ru>
  Alfred Piccioni <alpic@google.com>
  Amir Goldstein <amir73il@gmail.com>
  Amit Pundir <amit.pundir@linaro.org>
  Andi Shyti <andi.shyti@kernel.org>
  Andrew Morton <akpm@linux-foundation.org>
  Andrii Nakryiko <andrii@kernel.org>
  Anna Schumaker <Anna.Schumaker@Netapp.com>
  Anton Ivanov <anton.ivanov@cambridgegreys.com>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Arnd Bergmann <arnd@arndb.de>
  Avri Altman <avri.altman@wdc.com>
  Baokun Li <libaokun1@huawei.com>
  Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Benjamin Berg <bberg@redhat.com>
  Benjamin Berg <benjamin.berg@intel.com>
  Benjamin Berg <benjamin@sipsolutions.net>
  Bjorn Andersson <andersson@kernel.org>
  Bjorn Helgaas <bhelgaas@google.com>
  bo liu <bo.liu@senarytech.com>
  Boris Burkov <boris@bur.io>
  Borislav Petkov (AMD) <bp@alien8.de>
  Borislav Petkov <bp@alien8.de>
  Brad Spengler <spender@grsecurity.net>
  Breno Leitao <leitao@debian.org>
  Carlos Llamas <cmllamas@google.com>
  Celeste Liu <CoelacanthusHex@gmail.com>
  Chao Yu <chao@kernel.org>
  Chris Riches <chris.riches@nutanix.com>
  Christian A. Ehrhardt <lk@c--e.de>
  Christian Brauner (Microsoft) <brauner@kernel.org>
  Christoph Hellwig <hch@lst.de>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Chung-Chiang Cheng <cccheng@synology.com>
  Chunyan Zhang <zhang.lyra@gmail.com>
  Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
  Dan Carpenter <dan.carpenter@linaro.org>
  Daniel Basilio <daniel.basilio@corigine.com>
  Daniel de Villiers <daniel.devilliers@corigine.com>
  Daniel Lezcano <daniel.lezcano@linaro.org>
  Daniel Stodden <dns@arista.com>
  Daniel Vacek <neelx@redhat.com>
  Dave Airlie <airlied@redhat.com>
  Dave Hansen <dave.hansen@linux.intel.com>
  Dave Kleikamp <dave.kleikamp@oracle.com>
  Dave Switzer <david.switzer@intel.com>
  David Howells <dhowells@redhat.com>
  David S. Miller <davem@davemloft.net>
  David Schiller <david.schiller@jku.at>
  David Sterba <dsterba@suse.com>
  David Wang <00107082@163.com>
  Denis Efremov <efremov@linux.com>
  Dmitry Antipov <dmantipov@yandex.ru>
  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Doug Berger <opendmb@gmail.com>
  Douglas Anderson <dianders@chromium.org>
  Edson Juliano Drosdeck <edson.drosdeck@gmail.com>
  Edward Adam Davis <eadavis@qq.com>
  Ekansh Gupta <quic_ekangupt@quicinc.com>
  Eric Biggers <ebiggers@google.com>
  Eric Dumazet <edumazet@google.com>
  Fabio Estevam <festevam@denx.de>
  Fedor Pchelkin <pchelkin@ispras.ru>
  Felix Kuehling <Felix.Kuehling@amd.com>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Florian Westphal <fw@strlen.de>
  Frank Li <Frank.Li@nxp.com>
  Frank Rowand <frank.rowand@sony.com>
  Frederic Weisbecker <frederic@kernel.org>
  free5lot <mail@free5lot.com>
  Furong Xu <0x1207@gmail.com>
  Gabriel Krisman Bertazi <krisman@suse.de>
  Ghanshyam Agrawal <ghanshyam1898@gmail.com>
  Greg KH <gregkh@linuxfoundation.org>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Gregory CLEMENT <gregory.clement@bootlin.com>
  Guenter Roeck <linux@roeck-us.net>
  Guilherme G. Piccoli <gpiccoli@igalia.com>
  H. Nikolaus Schaller <hns@goldelico.com>
  H. Peter Anvin <hpa@zytor.com>
  Hannes Reinecke <hare@suse.de>
  Hans de Goede <hdegoede@redhat.com>
  Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Hardik Gajjar <hgajjar@de.adit-jv.com>
  Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
  Harshit Shah <harshitshah.opendev@gmail.com>
  Heiko Carstens <hca@linux.ibm.com>
  Heiko Stuebner <heiko@sntech.de>
  Heiner Kallweit <hkallweit1@gmail.com>
  Helge Deller <deller@gmx.de>
  Helge Deller <deller@kernel.org>
  Herbert Xu <herbert@gondor.apana.org.au>
  Hongchen Zhang <zhanghongchen@loongson.cn>
  Hou Tao <houtao1@huawei.com>
  Hugo Villeneuve <hvilleneuve@dimonoff.com>
  Ian Rogers <irogers@google.com>
  Ido Schimmel <idosch@nvidia.com>
  Ilya Dryomov <idryomov@gmail.com>
  Inki Dae <inki.dae@samsung.com>
  Ivan Vecera <ivecera@redhat.com>
  Jack Wang <jinpu.wang@ionos.com>
  JackBB Wu <wojackbb@gmail.com>
  Jaegeuk Kim <jaegeuk@kernel.org>
  JaimeLiao <jaimeliao@mxic.com.tw>
  Jakub Kicinski <kuba@kernel.org>
  Jan Beulich <jbeulich@suse.com>
  Jason Gerecke <jason.gerecke@wacom.com>
  Jason Gerecke <killertofu@gmail.com>
  Javier Martinez Canillas <javierm@redhat.com>
  Jay Vosburgh <jay.vosburgh@canonical.com>
  Jean Delvare <jdelvare@suse.de>
  Jedrzej Jagielski <jedrzej.jagielski@intel.com>
  Jens Axboe <axboe@kernel.dk>
  Jianjun Wang <jianjun.wang@mediatek.com>
  Jiri Kosina <jkosina@suse.com>
  Jiri Kosina <jkosina@suse.cz>
  Johan Hovold <johan+linaro@kernel.org>
  Johan Hovold <johan@kernel.org>
  Johan Jonker <jbx6244@gmail.com>
  Johannes Berg <johannes.berg@intel.com>
  Jon Hunter <jonathanh@nvidia.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Jozsef Kadlecsik <kadlec@netfilter.org>
  Julian Wiedmann <jwi@linux.ibm.com>
  Junxiao Bi <junxiao.bi@oracle.com>
  Justin Tee <justin.tee@broadcom.com>
  Kalle Valo <kvalo@kernel.org>
  Kalle Valo <quic_kvalo@quicinc.com>
  Kamal Dasu <kamal.dasu@broadcom.com>
  Karsten Graul <kgraul@linux.ibm.com>
  Kees Cook <keescook@chromium.org>
  kernelci.org bot <bot@kernelci.org>
  Konrad Dybcio <konrad.dybcio@linaro.org>
  Krzysztof Wilczyński <kwilczynski@kernel.org>
  Kuan-Wei Chiu <visitorckw@gmail.com>
  Kuniyuki Iwashima <kuniyu@amazon.com>
  Kunwu Chan <chentao@kylinos.cn>
  Lee Duncan <lduncan@suse.com>
  Lee Jones <lee@kernel.org>
  Leon Romanovsky <leon@kernel.org>
  Leonard Dallmayr <leonard.dallmayr@mailbox.org>
  Lin Ma <linma@zju.edu.cn>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Torvalds <torvalds@linuxfoundation.org>
  Loic Prylli <lprylli@netflix.com>
  Louis Peens <louis.peens@corigine.com>
  Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
  Mahmoud Adam <mngyadam@amazon.com>
  Manas Ghandat <ghandatmanas@gmail.com>
  Mao Jinlong <quic_jinlmao@quicinc.com>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Marc Zyngier <maz@kernel.org>
  Marek Szyprowski <m.szyprowski@samsung.com>
  Mario Limonciello <mario.limonciello@amd.com>
  Mark Brown <broonie@kernel.org>
  Martin K. Petersen <martin.petersen@oracle.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Masami Hiramatsu (Google) <mhiramat@kernel.org>
  Mathieu Poirier <mathieu.poirier@linaro.org>
  Matthew Wilcox (Oracle) <willy@infradead.org>
  Max Kellermann <max.kellermann@ionos.com>
  Max Krummenacher <max.krummenacher@toradex.com>
  Maxime Ripard <mripard@kernel.org>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael S. Tsirkin <mst@redhat.com>
  Michael Tretter <m.tretter@pengutronix.de>
  Mike Rapoport <rppt@linux.ibm.com>
  Ming Lei <ming.lei@redhat.com>
  Minsuk Kang <linuxlovemin@yonsei.ac.kr>
  Miquel Raynal <miquel.raynal@bootlin.com>
  Miri Korenblit <miriam.rachel.korenblit@intel.com>
  Nathan Chancellor <nathan@kernel.org>
  Naveen N Rao <naveen@kernel.org>
  Nikolay Borisov <nik.borisov@suse.com>
  Oleg Nesterov <oleg@redhat.com>
  Oleksij Rempel <o.rempel@pengutronix.de>
  Oliver Neukum <oneukum@suse.com>
  Oliver Upton <oliver.upton@linux.dev>
  Osama Muhammad <osmtendev@gmail.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Abeni <pabeni@redhat.com>
  Paul E. McKenney <paulmck@kernel.org>
  Paul Menzel <pmenzel@molgen.mpg.de>
  Paul Moore <paul@paul-moore.com>
  Peter Robinson <pbrobinson@gmail.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Peter Zijlstra <peterz@infradead.org>
  Petr Machata <petrm@nvidia.com>
  Petr Pavlu <petr.pavlu@suse.com>
  Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
  Piotr Skajewski <piotrx.skajewski@intel.com>
  Prarit Bhargava <prarit@redhat.com>
  Prathu Baronia <prathubaronia2011@gmail.com>
  Pucha Himasekhar Reddy <himasekharx.reddy.pucha@intel.com> (A Contingent worker at Intel)
  Puliang Lu <puliang.lu@fibocom.com>
  qizhong cheng <qizhong.cheng@mediatek.com>
  Qu Wenruo <wqu@suse.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Rafael J. Wysocki <rafael@kernel.org>
  Richard Palethorpe <rpalethorpe@suse.com>
  Richard Weinberger <richard@nod.at>
  Rob Clark <robdclark@chromium.org>
  Rob Herring <robh@kernel.org>
  Robert Foss <rfoss@kernel.org>
  Rui Zhang <zr.zhang@vivo.com>
  Ryusuke Konishi <konishi.ryusuke@gmail.com>
  Saeed Mahameed <saeedm@mellanox.com>
  Saeed Mahameed <saeedm@nvidia.com>
  Salvatore Dipietro <dipiets@amazon.com>
  Sasha Levin <sashal@kernel.org>
  Serge Semin <fancer.lancer@gmail.com>
  Sharath Srinivasan <sharath.srinivasan@oracle.com>
  Shawn Guo <shawnguo@kernel.org>
  Shenwei Wang <shenwei.wang@nxp.com>
  Shigeru Yoshida <syoshida@redhat.com>
  Shiji Yang <yangshiji66@outlook.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Simon Horman <horms@kernel.org>
  Sjoerd Simons <sjoerd@collabora.com>
  Song Liu <song@kernel.org>
  Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
  Stanislaw Gruszka <stf_xl@wp.pl>
  Stephen Boyd <sboyd@kernel.org>
  Stephen Rothwell <sfr@canb.auug.org.au>
  Steve Wahl <steve.wahl@hpe.com>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Su Hui <suhui@nfschina.com>
  Sunitha Mekala <sunithax.d.mekala@intel.com> (A Contingent worker at Intel)
  Suraj Jitindar Singh <surajjs@amazon.com>
  Takashi Iwai <tiwai@suse.de>
  Takashi Sakamoto <o-takashi@sakamocchi.jp>
  Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>
  Tejun Heo <tj@kernel.org>
  Theodore Ts'o <tytso@mit.edu>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Thomas Bourgoin <thomas.bourgoin@foss.st.com>
  Thomas Gleixner <tglx@linutronix.de>
  Thomas Richter <tmricht@linux.ibm.com>
  Tim Chen <tim.c.chen@linux.intel.com>
  Toke Høiland-Jørgensen <toke@toke.dk>
  Tom Rix <trix@redhat.com>
  Tom Zanussi <tom.zanussi@linux.intel.com>
  Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
  Tony Lindgren <tony@atomide.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Ville Syrjälä <ville.syrjala@linux.intel.com>
  Vincent Donnefort <vdonnefort@google.com>
  Vinod Koul <vkoul@kernel.org>
  Weichen Chen <weichen.chen@mediatek.com>
  Weihao Li <liweihao@loongson.cn>
  Wen Gu <guwen@linux.alibaba.com>
  Wenhua Lin <Wenhua.Lin@unisoc.com>
  Wolfram Sang <wsa@kernel.org>
  Xi Ruoyao <xry111@xry111.site>
  Xiaolei Wang <xiaolei.wang@windriver.com>
  Xiubo Li <xiubli@redhat.com>
  Yang Xu <xuyang2018.jy@fujitsu.com>
  Ye Bin <yebin10@huawei.com>
  Yevgeny Kliteynik <kliteyn@nvidia.com>
  Yonghong Song <yonghong.song@linux.dev>
  Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Youquan Song <youquan.song@intel.com>
  yuan linyu <yuanlinyu@hihonor.com>
  Yuluo Qiu <qyl27@outlook.com>
  Zach O'Keefe <zokeefe@google.com>
  Zakhar Semenov <mail@free5lot.com>
  Zenm Chen <zenmchen@gmail.com>
  Zhang Rui <rui.zhang@intel.com>
  Zhengchao Shao <shaozhengchao@huawei.com>
  Zhihao Cheng <chengzhihao1@huawei.com>
  zhili.liu <zhili.liu@ucas.com.cn>
  Zhipeng Lu <alexious@zju.edu.cn>
  Zhiquan Li <zhiquan1.li@intel.com>
  Zhu Yanjun <yanjun.zhu@linux.dev>
  Стас Ничипорович <stasn77@gmail.com>

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
 test-armhf-armhf-xl-credit1                                  fail    
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
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 pass    
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
   f0602893f43a5..6e1f54a4985b6  6e1f54a4985b63bc1b55a09e5e75a974c5d6719b -> tested/linux-5.4

