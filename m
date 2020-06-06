Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 011571F0787
	for <lists+xen-devel@lfdr.de>; Sat,  6 Jun 2020 17:23:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhafF-0006a5-Ih; Sat, 06 Jun 2020 15:23:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LUo7=7T=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jhafD-0006Zz-CS
 for xen-devel@lists.xenproject.org; Sat, 06 Jun 2020 15:23:15 +0000
X-Inumbo-ID: 9d645db2-a809-11ea-b0fe-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9d645db2-a809-11ea-b0fe-12813bfff9fa;
 Sat, 06 Jun 2020 15:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yCkmslixqAmIdq4tin0KK7AQuLDGhdvnKgSGQNCmF/E=; b=wqEx7u5j2Dyhp7Tc8LtFWU4u0
 9QVHgE/F02o1WimLidd5+sy4six7b2zmHEICmWEIv/QB++R7Hd8j6IqaiHKwdHzKqpyb0y/HvaNjG
 LXbdpTNy0eif/98yGzauBL6JWKgnVTooMKh1vPJpEXqxRQsEfbXiuMMKbx/OKQcusFDsg=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jhaf1-0008LB-Go; Sat, 06 Jun 2020 15:23:03 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jhaf1-0002Ud-7v; Sat, 06 Jun 2020 15:23:03 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jhaf1-0004Ym-7B; Sat, 06 Jun 2020 15:23:03 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150891-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 150891: regressions - FAIL
X-Osstest-Failures: linux-linus:test-amd64-i386-libvirt:xen-boot:fail:regression
 linux-linus:test-armhf-armhf-xl-vhd:leak-check/check:fail:regression
 linux-linus:test-amd64-amd64-xl-rtds:guest-localmigrate:fail:allowable
 linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This: linux=aaa2faab4ed8e5fe0111e04d6e168c028fe2987f
X-Osstest-Versions-That: linux=7ae77150d94d3b535c7b85e6b3647113095e79bf
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 06 Jun 2020 15:23:03 +0000
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

flight 150891 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150891/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-libvirt       7 xen-boot                 fail REGR. vs. 150871
 test-armhf-armhf-xl-vhd      18 leak-check/check         fail REGR. vs. 150871

Regressions which are regarded as allowable (not blocking):
 test-amd64-amd64-xl-rtds     16 guest-localmigrate       fail REGR. vs. 150871

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 150871
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 150871
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop            fail like 150871
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 150871
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 150871
 test-armhf-armhf-xl-rtds     16 guest-start/debian.repeat    fail  like 150871
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 150871
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 150871
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 150871
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass

version targeted for testing:
 linux                aaa2faab4ed8e5fe0111e04d6e168c028fe2987f
baseline version:
 linux                7ae77150d94d3b535c7b85e6b3647113095e79bf

Last test of basis   150871  2020-06-05 21:09:12 Z    0 days
Testing same since   150879  2020-06-06 06:52:55 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Adam Ford <aford173@gmail.com>
  Aharon Landau <aharonl@mellanox.com>
  Al Viro <viro@zeniv.linux.org.uk> (fs/inode.c part)
  Alex Dewar <alex.dewar@gmx.co.uk>
  Alex Williamson <alex.williamson@redhat.com>
  André Almeida <andrealmeid@collabora.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Anna Pendleton <pendleton@google.com>
  Arnd Bergmann <arnd@arndb.de>
  Arun Easi <aeasi@marvell.com>
  Asmaa Mnebhi <Asmaa@mellanox.com>
  Asutosh Das <asutoshd@codeaurora.org>
  Aurelien Aptel <aaptel@suse.com>
  Avri Altman <Avri.Altman@wdc.com>
  Bart Van Assche <bvanassche@acm.org>
  Bartosz Golaszewski <bgolaszewski@baylibre.com>
  Bean Huo <beanhuo@micron.com>
  Benjamin Block <bblock@linux.ibm.com>
  Bob Liu <bob.liu@oracle.com>
  Bodo Stroesser <bstroesser@ts.fujitsu.com>
  Borislav Petkov <bp@suse.de>
  Brian Masney <bmasney@redhat.com>
  Can Guo <cang@codeaurora.org>
  Carlos Guerrero Álvarez <carlosteniswarrior@gmail.com>
  Chad Dupuis <cdupuis@marvell.com>
  Chandrakanth Patil <chandrakanth.patil@broadcom.com>
  Chen Tao <chentao107@huawei.com>
  ChenTao <chentao107@huawei.com>
  Christoph Hellwig <hch@lst.de>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Chuck Lever <chuck.lever@oracle.com>
  Colin Ian King <colin.king@canonical.com>
  Colin Ian King <colin.king@canonical.com> # fix leak in dmz_insert
  Corey Minyard <cminyard@mvista.com>
  Damien Le Moal <damien.lemoal@wdc.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Daniel Wagner <dwagner@suse.de>
  Danil Kipnis <danil.kipnis@cloud.ionos.com>
  Danit Goldberg <danitg@mellanox.com>
  Daria Velikovsky <daria@mellanox.com>
  David Howells <dhowells@redhat.com>
  David Teigland <teigland@redhat.com>
  Dejin Zheng <zhengdejin5@gmail.com>
  Dennis Dalessandro <dennis.dalessandro@intel.com>
  Devesh Sharma <devesh.sharma@broadcom.com>
  Dick Kennedy <dick.kennedy@broadcom.com>
  Dinghao Liu <dinghao.liu@zju.edu.cn>
  Dmitry Baryshkov <dmitry_baryshkov@mentor.com>
  Douglas Anderson <dianders@chromium.org>
  Douglas Gilbert <dgilbert@interlog.com>
  Eric Biggers <ebiggers@google.com>
  Eric Whitney <enwlinux@gmail.com>
  Eugeniu Rosca <erosca@de.adit-jv.com>
  Feng Tang <feng.tang@intel.com>
  Gabriel Krisman Bertazi <krisman@collabora.com>
  Gal Pressman <galpress@amazon.com>
  Gary Leshner <Gary.S.Leshner@intel.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Geert Uytterhoeven <geert@linux-m68k.org>
  Grzegorz Andrejczuk <grzegorz.andrejczuk@intel.com>
  Gustavo A. R. Silva <gustavo@embeddedor.com>
  Gustavo A. R. Silva <gustavoars@kernel.org>
  Hannes Reinecke <hare@suse.de>
  Hans de Goede <hdegoede@redhat.com>
  Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Harshad Shirwadkar <harshadshirwadkar@gmail.com>
  Heinz Mauelshagen <heinzm@redhat.com>
  Israel Rukshin <israelr@mellanox.com>
  Jack Wang <jinpu.wang@cloud.ionos.com>
  James Smart <jsmart2021@gmail.com>
  Jan Kara <jack@suse.cz>
  Jason Gunthorpe <jgg@mellanox.com>
  Jason Yan <yanaijie@huawei.com>
  Javed Hasan <jhasan@marvell.com>
  Jeffle Xu <jefflexu@linux.alibaba.com>
  Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
  Jens Axboe <axboe@kernel.dk>
  Joe Perches <joe@perches.com>
  Johannes Thumshirn <johannes.thumshirn@wdc.com>
  John Garry <john.garry@huawei.com>
  John Hubbard <jhubbard@nvidia.com>
  Jonathan Grant <jg@jguk.org>
  Jules Irenge <jbi.octave@gmail.com>
  Ka-Cheong Poon <ka-cheong.poon@oracle.com>
  Kai Mäkisara <kai.makisara@kolumbus.fi>
  Kaike Wan <kaike.wan@intel.com>
  Kaixu Xia <kaixuxia@tencent.com>
  Kamal Heib <kamalheib1@gmail.com>
  Kashyap Desai <kashyap.desai@broadcom.com>
  Kees Cook <keescook@chromium.org>
  Kenneth D'souza <kdsouza@redhat.com>
  Kent Gibson <warthog618@gmail.com>
  Khalid Aziz <khalid@gonehiking.org>
  Khazhismel Kumykov <khazhy@google.com>
  Kirti Wankhede <kwankhede@nvidia.com>
  Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
  Lance Digby <lance.digby@gmail.com>
  Lang Cheng <chenglang@huawei.com>
  Lee Jones <lee.jones@linaro.org>
  Leon Romanovsky <leonro@mellanox.com>
  Lijun Ou <oulijun@huawei.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Luo Jiaxing <luojiaxing@huawei.com>
  Manish Rangankar <mrangankar@marvell.com>
  Maor Gottlieb <maorg@mellanox.com>
  Marcel Gudert <m.gudert@eckelmann.de>
  Mark Bloch <markb@mellanox.com>
  Mark Zhang <markz@mellanox.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Martin Wilck <mwilck@suse.com>
  Matthew R. Ochs <mrochs@linux.ibm.com>
  Maulik Shah <mkshah@codeaurora.org>
  Maurizio Lombardi <mlombard@redhat.com>
  Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  Max Gurtovoy <maxg@mellanox.com>
  Md Haris Iqbal <haris.phnx@gmail.com>
  Mian Yousaf Kaukab <ykaukab@suse.de>
  Michael Walle <michael@walle.cc>
  Mika Westerberg <mika.westerberg@linux.intel.com>
  Mike Christie <mchristi@redhat.com>
  Mike Marshall <hubcap@omnibond.com>
  Mike Snitzer <snitzer@redhat.com>
  Mikulas Patocka <mpatocka@redhat.com>
  Ming Lei <ming.lei@redhat.com>
  Nathan Chancellor <natechancellor@gmail.com>
  Nilesh Javali <njavali@marvell.com>
  Paul Thomas <pthomas8589@gmail.com>
  Paulo Alcantara (SUSE) <pc@cjr.nz>
  Paulo Alcantara <pc@cjr.nz>
  Petteri Jokinen <petteri@kiho.fi>
  Piotr Stankiewicz <piotr.stankiewicz@intel.com>
  Potnuri Bharat Teja <bharat@chelsio.com>
  Qian Cai <cai@lca.pw>
  Qiushi Wu <wu000273@umn.edu>
  Randy Dunlap <rdunlap@infradead.org>
  Randy Dunlap <rdunlap@infradead.org> # build-tested
  Randy Dunlap <rdunlap@infradead.org> [Kconfig fixes]
  Ritesh Harjani <riteshh@linux.ibm.com>
  Rob Herring <robh@kernel.org>
  Roberto Bergantinos Corpas <rbergant@redhat.com>
  Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
  Roman Pen <roman.penyaev@profitbricks.com>
  Ronnie Sahlberg <lsahlber@redhat.com>
  Ross Lagerwall <ross.lagerwall@citrix.com>
  Sachin Agarwal <asachin591@gmail.com>
  Sadanand Warrier <sadanand.warrier@intel.com>
  Samuel Zou <zou_wei@huawei.com>
  Saurav Kashyap <skashyap@marvell.com>
  Serge Semin <fancer.lancer@gmail.com>
  Serge Semin <Sergey.Semin@baikalelectronics.ru>
  Shay Drory <shayd@mellanox.com>
  Shengju Zhang <zhangshengju@cmss.chinamobile.com>
  Shiraz Saleem <shiraz.saleem@intel.com>
  Shivasharan S <shivasharan.srikanteshwara@broadcom.com>
  Sreekanth Reddy <sreekanth.reddy@broadcom.com>
  Stanley Chu <stanley.chu@mediatek.com>
  Stephen Boyd <swboyd@chromium.org>
  Steve French <stfrench@microsoft.com>
  Stuart Hayes <stuart.w.hayes@gmail.com>
  Subhash Jadavani <subhashj@codeaurora.org>
  Sudarsana Reddy Kalluru <skalluru@marvell.com>
  Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>
  Suganath Prabu <suganath-prabu.subramani@broadcom.com>
  Suganath Prabu S <suganath-prabu.subramani@broadcom.com>
  Sumit Saxena <sumit.saxena@broadcom.com>
  Tang Bin <tangbin@cmss.chinamobile.com>
  Tejun Heo <tj@kernel.org>
  Theodore Ts'o <tytso@mit.edu>
  Tiezhu Yang <yangtiezhu@loongson.cn>
  Ursula Braun <ubraun@linux.ibm.com>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Viacheslav Dubeyko <v.dubeiko@yadro.com>
  Vignesh Raghavendra <vigneshr@ti.com>
  Wang Hai <wanghai38@huawei.com>
  Wei Yongjun <weiyongjun1@huawei.com>
  Weihang Li <liweihang@huawei.com>
  Wenpeng Liang <liangwenpeng@huawei.com>
  Wu Bo <wubo40@huawei.com>
  Xi Wang <wangxi11@huawei.com>
  Xie XiuQi <xiexiuqi@huawei.com>
  Xin Tan <tanxin.ctf@gmail.com>
  Xiongfeng Wang <wangxiongfeng2@huawei.com>
  Xiyu Yang <xiyuyang19@fudan.edu.cn>
  Xu Wang <vulab@iscas.ac.cn>
  Yamin Friedman <yaminf@mellanox.com>
  Yangyang Li <liyangyang20@huawei.com>
  Ye Bin <yebin10@huawei.com>
  Yishai Hadas <yishaih@mellanox.com>
  Yixian Liu <liuyixian@huawei.com>
  YueHaibing <yuehaibing@huawei.com>
  Zheng Bin <zhengbin13@huawei.com> [static fixes]
  Zhiqiang Liu <liuzhiqiang26@huawei.com>
  Zhu Yanjun <yanjunz@mellanox.com>
  Zou Wei <zou_wei@huawei.com>

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
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
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
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
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
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      fail    
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
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
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

(No revision log; it would be 14988 lines long.)

