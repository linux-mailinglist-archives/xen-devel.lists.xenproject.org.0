Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F19262C0216
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 10:15:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.33674.64805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kh7vV-0005Zy-Hu; Mon, 23 Nov 2020 09:14:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 33674.64805; Mon, 23 Nov 2020 09:14:25 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kh7vV-0005ZT-D0; Mon, 23 Nov 2020 09:14:25 +0000
Received: by outflank-mailman (input) for mailman id 33674;
 Mon, 23 Nov 2020 09:14:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kh7vT-0005ZL-PC; Mon, 23 Nov 2020 09:14:23 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kh7vT-0003UN-GZ; Mon, 23 Nov 2020 09:14:23 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kh7vT-0005ev-6s; Mon, 23 Nov 2020 09:14:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kh7vT-0005pu-6M; Mon, 23 Nov 2020 09:14:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kh7vT-0005ZL-PC; Mon, 23 Nov 2020 09:14:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=6pxuZMBpF8BaWn1GBU1ybljZjoiqRjgIvmhFqEHyNHg=; b=wY8A7g4Yheuo2LUfnKbTf0Q+tQ
	Zc0LcGqVLHxMbS3slNZN/j2LAq6bZR0BbsXxz3d1LjEQ9mm++CWQcJ1tMID4P0lvI16y6fGLOkHhT
	tXfGp3h6xgdn7Duvu3Wu+L7n6lKzlEIGsaBDroSgT6YVfsAlPMifgtK51zd4IX3xes+w=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kh7vT-0003UN-GZ; Mon, 23 Nov 2020 09:14:23 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kh7vT-0005ev-6s; Mon, 23 Nov 2020 09:14:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kh7vT-0005pu-6M; Mon, 23 Nov 2020 09:14:23 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156953-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 156953: regressions - FAIL
X-Osstest-Failures:
    qemu-mainline:test-amd64-amd64-libvirt-vhd:guest-start/debian.repeat:fail:regression
    qemu-mainline:test-amd64-amd64-xl-qcow2:guest-start/debian.repeat:fail:regression
    qemu-mainline:test-armhf-armhf-xl-vhd:guest-start/debian.repeat:fail:regression
    qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    qemuu=8cc30eb1400fc01f2b139cdd3dc524f8b84dbe07
X-Osstest-Versions-That:
    qemuu=1d806cef0e38b5db8347a8e12f214d543204a314
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 23 Nov 2020 09:14:23 +0000

flight 156953 qemu-mainline real [real]
flight 156960 qemu-mainline real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/156953/
http://logs.test-lab.xenproject.org/osstest/logs/156960/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-libvirt-vhd 19 guest-start/debian.repeat fail REGR. vs. 152631
 test-amd64-amd64-xl-qcow2   21 guest-start/debian.repeat fail REGR. vs. 152631
 test-armhf-armhf-xl-vhd     17 guest-start/debian.repeat fail REGR. vs. 152631

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 152631
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 152631
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 152631
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 152631
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 152631
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 152631
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 152631
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass

version targeted for testing:
 qemuu                8cc30eb1400fc01f2b139cdd3dc524f8b84dbe07
baseline version:
 qemuu                1d806cef0e38b5db8347a8e12f214d543204a314

Last test of basis   152631  2020-08-20 09:07:46 Z   95 days
Failing since        152659  2020-08-21 14:07:39 Z   93 days  199 attempts
Testing same since   156953  2020-11-23 00:08:31 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
    Aaron Lindsay <aaron@os.amperecomputing.com>
  Alberto Garcia <berto@igalia.com>
  Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
  Alex Bennée <alex.bennee@linaro.org>
  Alex Chen <alex.chen@huawei.com>
  Alex Williamson <alex.williamson@redhat.com>
  Alexander Bulekov <alxndr@bu.edu>
  Alexander von Gluck IV <kallisti5@unixzen.com>
  AlexChen <alex.chen@huawei.com>
  Alexey Kirillov <lekiravi@yandex-team.ru>
  Alistair Francis <alistair.francis@wdc.com>
  Alistair Francis <alistair.francis@xilinx.com>
  Amey Narkhede <ameynarkhede03@gmail.com>
  Ana Pazos <apazos@quicinc.com>
  Andreas Gustafsson <gson@gson.org>
  Andrew Jones <drjones@redhat.com>
  Andrey Konovalov <andreyknvl@google.com>
  Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
  Ani Sinha <ani@anisinha.ca>
  Anthony PERARD <anthony.perard@citrix.com>
  Anton Blanchard <anton@ozlabs.org>
  Anup Patel <anup.patel@wdc.com>
  Artyom Tarasenko <atar4qemu@gmail.com>
  Babu Moger <babu.moger@amd.com>
  BALATON Zoltan <balaton@eik.bme.hu>
  Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
  Ben Widawsky <ben.widawsky@intel.com>
  Bharat Bhushan <bbhushan2@marvell.com>
  Bihong Yu <yubihong@huawei.com>
  Bin Meng <bin.meng@windriver.com>
  Brad Smith <brad@comstyle.com>
  Bruce Rogers <brogers@suse.com>
  Carlo Marcelo Arenas Belón <carenas@gmail.com>
  Chen Gang <chengang@emindsoft.com.cn>
  Chen Qun <kuhn.chenqun@huawei.com>
  Chetan Pant <chetan4windows@gmail.com>
  Chih-Min Chao <chihmin.chao@sifive.com>
  Christian Borntraeger <borntraeger@de.ibm.com>
  Christian Schoenebeck <qemu_oss@crudebyte.com>
  Chuan Zheng <zhengchuan@huawei.com>
  Cindy Lu <lulu@redhat.com>
  Claudio Fontana <cfontana@suse.de>
  Claudio Imbrenda <imbrenda@linux.ibm.com>
  Cleber Rosa <crosa@redhat.com>
  Coiby Xu <coiby.xu@gmail.com>
  Colin Xu <colin.xu@intel.com>
  Collin Walling <walling@linux.ibm.com>
  Connor Kuehl <ckuehl@redhat.com>
  Corey Minyard <cminyard@mvista.com>
  Cornelia Huck <cohuck@redhat.com>
  Cédric Le Goater <clg@kaod.org>
  César Belley <cesar.belley@lse.epita.fr>
  Daniel Henrique Barboza <danielhb413@gmail.com>
  Daniel P. Berrangé <berrange@redhat.com>
  Daniele Buono <dbuono@linux.vnet.ibm.com>
  David Carlier <devnexen@gmail.com>
  David Edmondson <david.edmondson@oracle.com>
  David Gibson <david@gibson.dropbear.id.au>
  David Hildenbrand <david@redhat.com>
  Derek Su <dereksu@qnap.com>
  Dima Stepanov <dimastep@yandex-team.ru>
  Ding Hui <dinghui@sangfor.com.cn>
  Dmitry Fomichev <dmitry.fomichev@wdc.com>
  Douglas Crosher <dtc-ubuntu@scieneer.com>
  Dov Murik <dovmurik@linux.vnet.ibm.com>
  Dr. David Alan Gilbert <dgilbert@redhat.com>
  Edgar E. Iglesias <edgar.iglesias@xilinx.com>
  Eduardo Habkost <ehabkost@redhat.com>
  Eduardo Otubo <otubo@redhat.com>
  Elena Afanasova <eafanasova@gmail.com>
  Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>
  Emmanuel Blot <eblot.ml@gmail.com>
  Eric Auger <eric.auger@redhat.com>
  Eric Blake <eblake@redhat.com>
  Erik Kline <ek@google.com>
  Erik Smit <erik.lucas.smit@gmail.com>
  Fabiano Rosas <farosas@linux.ibm.com>
  Fam Zheng <fam@euphon.net>
  Fan Yang <Fan_Yang@sjtu.edu.cn>
  Felipe Franciosi <felipe@nutanix.com>
  Filip Bozuta <Filip.Bozuta@syrmia.com>
  Finn Thain <fthain@telegraphics.com.au>
  Frajo <franz.haider@jolla.com>
  Frank Chang <frank.chang@sifive.com>
  Franz-Josef Haider <franz.haider@jolla.com>
  Frediano Ziglio <freddy77@gmail.com>
  Gan Qixin <ganqixin@huawei.com>
  Geoffrey McRae <geoff@hostfission.com>
  Georg Kotheimer <georg.kotheimer@kernkonzept.com>
  Gerd Hoffmann <kraxel@redhat.com>
  Giuseppe Musacchio <thatlemon@gmail.com>
  Gollu Appalanaidu <anaidu.gollu@samsung.com>
  Gonglei <arei.gonglei@huawei.com>
  Graeme Gregory <graeme@nuviainc.com>
  Green Wan <green.wan@sifive.com>
  Greg Kurz <groug@kaod.org>
  Guenter Roeck <linux@roeck-us.net>
  Guoqing Zhang <zhangguoqing.kernel@bytedance.com>
  Guoyi Tu <tu.guoyi@h3c.com>
  Gustavo Romero <gromero@linux.ibm.com>
  haibinzhang(张海斌) <haibinzhang@tencent.com>
  Halil Pasic <pasic@linux.ibm.com>
  Han Han <hhan@redhat.com>
  Hao Wu <wuhaotsh@google.com>
  Haotian Li <lihaotian9@huawei.com>
  Harry G. Coin <hgcoin@gmail.com>
  Havard Skinnemoen <hskinnemoen@google.com>
  Helge Deller <deller@gmx.de>
  Heyi Guo <guoheyi@huawei.com>
  Hongzheng-Li <Ethan.Lee.QNL@gmail.com>
  Hou Weiying <weiying_hou@outlook.com>
  Huacai Chen <chenhc@lemote.com>
  Huacai Chen <zltjiangshi@gmail.com>
  Igor Kononenko <i.kononenko@yadro.com>
  Igor Mammedov <imammedo@redhat.com>
  James Hogan <jhogan@kernel.org>
  Jan Charvat <charvj10@fel.cvut.cz>
  Jan Henrik Weinstock <jan.weinstock@rwth-aachen.de>
  Janosch Frank <frankja@linux.ibm.com>
  Jason Andryuk <jandryuk@gmail.com>
  Jason J. Herne <jjherne@linux.ibm.com>
  Jason Wang <jasowang@redhat.com>
  Jean-Philippe Brucker <jean-philippe@linaro.org>
  Jens Freimann <jfreimann@redhat.com>
  Jessica Clarke <jrtc27@jrtc27.com>
  Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>
  Jiaxun Yang <jiaxun.yang@flygoat.com>
  Jin Yu <jin.yu@intel.com>
  Joel Stanley <joel@jms.id.au>
  John Snow <jsnow@redhat.com>
  Jon Doron <arilou@gmail.com>
  Josh DuBois <josh@joshdubois.com>
  Julia Suvorova <jusual@redhat.com>
  Kai Deng <dengkai1@huawei.com>
  Kashyap Chamarthy <kchamart@redhat.com>
  Keith Busch <kbusch@kernel.org>
  Kele Huang <kele.hwang@gmail.com>
  Kenta Ishiguro <kentaishiguro@slowstart.org>
  Kevin Wolf <kwolf@redhat.com>
  Kirti Wankhede <kwankhede@nvidia.com>
  Kito Cheng <kito.cheng@sifive.com>
  Klaus Jensen <k.jensen@samsung.com>
  Klaus Jensen <klaus.jensen@cnexlabs.com>
  Laszlo Ersek <lersek@redhat.com>
  Laurent Vivier <laurent@vivier.eu>
  Laurent Vivier <lvivier@redhat.com>
  Lei Rao <lei.rao@intel.com>
  Lei YU <yulei.sh@bytedance.com>
  Leif Lindholm <leif@nuviainc.com>
  LemonBoy <thatlemon@gmail.com>
  Li Feng <fengli@smartx.com>
  Li Qiang <liq3ea@163.com>
  Li Zhijian <lizhijian@cn.fujitsu.com>
  Liao Pingfang <liao.pingfang@zte.com.cn>
  Liao Pingfang <liao.pingfang@zte.com.cn>a
  Lichang Zhao <zhaolichang@huawei.com>
  lichun <lichun@ruijie.com.cn>
  Lijun Pan <ljp@linux.ibm.com>
  LIU Zhiwei <zhiwei_liu@c-sky.com>
  Liyang Shi <shiliyang@huawei.com>
  Longpeng(Mike) <longpeng2@huawei.com>
  Luc Michel <luc@lmichel.fr>
  Lukas Straub <lukasstraub2@web.de>
  Marc Hartmayer <mhartmay@linux.ibm.com>
  Marc-André Lureau <marcandre.lureau@redhat.com>
  Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
  Markus Armbruster <armbru@redhat.com>
  Matthew Rosato <mjrosato@linux.ibm.com>
  Matthieu Bucchianeri <matthieu.bucchianeri@leostella.com>
  Matus Kysel <mkysel@tachyum.com>
  Mauro Matteo Cascella <mcascell@redhat.com>
  Max Filippov <jcmvbkbc@gmail.com>
  Max Reitz <mreitz@redhat.com>
  Maxim Levitsky <mlevitsk@redhat.com>
  Michael Rolnik <mrolnik@gmail.com>
  Michael Roth <mdroth@linux.vnet.ibm.com>
  Michael Roth <michael.roth@amd.com>
  Michael S. Tsirkin <mst@redhat.com>
  Michael Tokarev <mjt@tls.msk.ru>
  Michael Walle <michael@walle.cc>
  Michal Privoznik <mprivozn@redhat.com>
  Mike Gelfand <mikedld@mikedld.com>
  Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
  Myriad-Dreamin <camiyoru@gmail.com>
  Nathan Chancellor <natechancellor@gmail.com>
  Niek Linnenbank <nieklinnenbank@gmail.com>
  Niklas Schnelle <schnelle@linux.ibm.com>
  Nikola Pavlica <pavlica.nikola@gmail.com>
  Nir Soffer <nirsof@gmail.com>
  Nir Soffer <nsoffer@redhat.com>
  Pan Nengyuan <pannengyuan@huawei.com>
  Pankaj Gupta <pankaj.gupta.linux@gmail.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Paul Burton <paulburton@kernel.org>
  Paul Durrant <paul@xen.org>
  Paul Durrant <pdurrant@amazon.com>
  Paul Zimmerman <pauldzim@gmail.com>
  Pavel Dovgalyuk <Pavel.Dovgaluk@gmail.com>
  Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>
  Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
  Pavel Pisa <pisa@cmp.felk.cvut.cz>
  Peng Liang <liangpeng10@huawei.com>
  Peter Krempa <pkrempa@redhat.com>
  Peter Lieven <pl@kamp.de>
  Peter Maydell <peter.maydell@linaro.org>
  Peter Xu <peterx@redhat.com>
  Philippe Mathieu-Daude <philmd@redhat.com>
  Philippe Mathieu-Daudé <1892540@bugs.launchpad.net>
  Philippe Mathieu-Daudé <f4bug@amsat.org>
  Philippe Mathieu-Daudé <philmd@redhat.com>
  Pierre Morel <pmorel@linux.ibm.com>
  Prasad J Pandit <pjp@fedoraproject.org>
  Rao, Lei <lei.rao@intel.com>
  Raphael Norwitz <raphael.norwitz@nutanix.com>
  Rebecca Cran <rebecca@nuviainc.com>
  Richard Henderson <richard.henderson@linaro.org>
  Robert Hoo <robert.hu@linux.intel.com>
  Roman Bolshakov <r.bolshakov@yadro.com>
  Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
  Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
  Samuel Thibault <samuel.thibault@ens-lyon.org>
  Sergei Trofimovich <slyfox@gentoo.org>
  Sergey Nizovtsev <snizovtsev@gmail.com>
  Sergio Lopez <slp@redhat.com>
  Shashi Mallela <shashi.mallela@linaro.org>
  shiliyang <shiliyang@huawei.com>
  Si-Wei Liu <si-wei.liu@oracle.com>
  Stafford Horne <shorne@gmail.com>
  Stefan Berger <stefanb@linux.ibm.com>
  Stefan Hajnoczi <stefanha@redhat.com>
  Stefan Reiter <s.reiter@proxmox.com>
  Stefan Weil <sw@weilnetz.de>
  Stefano Garzarella <sgarzare@redhat.com>
  Stephen Long <steplong@quicinc.com>
  Subbaraya Sundeep <sundeep.lkml@gmail.com>
  Sunil Muthuswamy <sunilmut@microsoft.com>
  Sven Schnelle <svens@stackframe.org>
  Swapnil Ingle <swapnil.ingle@nutanix.com>
  Thiago Jung Bauermann <bauerman@linux.ibm.com>
  Thomas Huth <huth@tuxfamily.org>
  Thomas Huth <thuth@redhat.com>
  Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
  Timothy Baldwin <T.E.Baldwin99@members.leeds.ac.uk>
  Timothy E Baldwin <T.E.Baldwin99@members.leeds.ac.uk>
  Tom Lendacky <thomas.lendacky@amd.com>
  Tomáš Golembiovský <tgolembi@redhat.com>
  Tuguoyi <tu.guoyi@h3c.com>
  Vincenzo Frascino <vincenzo.frascino@arm.com>
  Vitaly Cheptsov <vit9696@protonmail.com>
  Vitaly Kuznetsov <vkuznets@redhat.com>
  Vivek Goyal <vgoyal@redhat.com>
  Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
  Volker Rümelin <vr_qemu@t-online.de>
  Xiaoyao Li <xiaoyao.li@intel.com>
  Xinhao Zhang <zhangxinhao1@huawei.com>
  Xinyu Li <precinct@mail.ustc.edu.cn>
  Xu Zou <iwatchnima@gmail.com>
  Yan Jin <jinyan12@huawei.com>
  YanYing Zhuang <ann.zhuangyanying@huawei.com>
  Yi Li <yili@winhong.com>
  Yi Wang <wang.yi59@zte.com.cn>
  Yifei Jiang <jiangyifei@huawei.com>
  Ying Fang <fangying1@huawei.com>
  Yipeng Yin <yinyipeng1@huawei.com>
  Yonggang Luo <luoyonggang@gmail.com>
  Yoshinori Sato <ysato@users.sourceforge.jp>
  Zenghui Yu <yuzenghui@huawei.com>
  Zhang Chen <chen.zhang@intel.com>
  zhaolichang <zhaolichang@huawei.com>
  Zhengui <lizhengui@huawei.com>
  Zhengui li <lizhengui@huawei.com>
  zhenwei pi <pizhenwei@bytedance.com>
  Zhenyu Wang <zhenyuw@linux.intel.com>
  Zhenyu Ye <yezhenyu2@huawei.com>
  Zhiqiang Liu <liuzhiqiang26@huawei.com>
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
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
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
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
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
 test-amd64-amd64-amd64-pvgrub                                pass    
 test-amd64-amd64-i386-pvgrub                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-xl-qcow2                                    fail    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-xl-raw                                       pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 fail    
 test-armhf-armhf-xl-vhd                                      fail    


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

(No revision log; it would be 67462 lines long.)

