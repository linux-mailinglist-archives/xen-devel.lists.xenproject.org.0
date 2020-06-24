Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BA9206BB6
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 07:31:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnxzq-0000zR-Pu; Wed, 24 Jun 2020 05:30:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cRKl=AF=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jnxzp-0000z4-5A
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 05:30:53 +0000
X-Inumbo-ID: da3c9aee-b5db-11ea-8496-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id da3c9aee-b5db-11ea-8496-bc764e2007e4;
 Wed, 24 Jun 2020 05:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rcymPY35vkCY8cxa1TwX0vZgR1PF/LmfB3CG7/cDR8M=; b=x50E2yhn4ifBAECzoLJ07x0Y5
 bA4DremgJVKZJxmk7A87IoF0Do6L6up1ViqtaoVmWzYgflzgCOzSl+PRZ53kpxS4JpNgoRLgy5N6O
 KFn0DP59joWxR9JQ+uL9PyDQJdxVRoGixcb9wBE9V5rdSYsUlt0YNmGVd7uh51FBJWdvg=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jnxzg-0000wm-Ts; Wed, 24 Jun 2020 05:30:44 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jnxzg-0000pl-KP; Wed, 24 Jun 2020 05:30:44 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jnxzg-000698-JR; Wed, 24 Jun 2020 05:30:44 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151307-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 151307: tolerable FAIL - PUSHED
X-Osstest-Failures: linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
X-Osstest-Versions-This: linux=67cb016870e2fa9ffc8d34cf20db5331e6f2cf4d
X-Osstest-Versions-That: linux=fd8cd8ac940c8b45b75474415291a3b941c865ab
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 24 Jun 2020 05:30:44 +0000
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

flight 151307 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151307/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop             fail never pass
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop              fail never pass
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop              fail never pass
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop             fail never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail   never pass
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop             fail never pass
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop             fail never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass

version targeted for testing:
 linux                67cb016870e2fa9ffc8d34cf20db5331e6f2cf4d
baseline version:
 linux                fd8cd8ac940c8b45b75474415291a3b941c865ab

Last test of basis   151232  2020-06-19 05:33:37 Z    4 days
Testing same since   151288  2020-06-22 07:40:16 Z    1 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aaron Brown <aaron.f.brown@intel.com>
  Adrian Hunter <adrian.hunter@intel.com>
  Al Viro <viro@zeniv.linux.org.uk>
  Alan Maguire <alan.maguire@oracle.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alexander Monakov <amonakov@ispras.ru>
  Alexander Sverdlin <alexander.sverdlin@nokia.com>
  Alexandre Belloni <alexandre.belloni@bootlin.com>
  Alexei Starovoitov <ast@kernel.org>
  Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
  Anand Jain <anand.jain@oracle.com>
  Anders Roxell <anders.roxell@linaro.org>
  Andrea Arcangeli <aarcange@redhat.com>
  Andrea Parri (Microsoft) <parri.andrea@gmail.com>
  Andrew Bowers <andrewx.bowers@intel.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andrii Nakryiko <andriin@fb.com>
  Andrzej Hajda <a.hajda@samsung.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Anton Protopopov <a.s.protopopov@gmail.com>
  Ard Biesheuvel <ardb@kernel.org>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Arnd Bergmann <arnd@arndb.de>
  Arthur Kiyanovski <akiyano@amazon.com>
  Arvind Sankar <nivedita@alum.mit.edu>
  Ashok Raj <ashok.raj@intel.com>
  Ayush Sawal <ayush.sawal@chelsio.com>
  Bart van Assche <bvanassche@acm.org>
  Bhupesh Sharma <bhsharma@redhat.com>
  Bingbu Cao <bingbu.cao@intel.com>
  Bjorn Andersson <bjorn.andersson@linaro.org>
  Bjorn Helgaas <bhelgaas@google.com>
  Bjorn Helgaas <helgaas@kernel.org>
  Bob Moore <robert.moore@intel.com>
  Bogdan Togorean <bogdan.togorean@analog.com>
  Boris Brezillon <boris.brezillon@collabora.com>
  Borislav Petkov <bp@suse.de>
  Brad Love <brad@nextdimension.cc>
  Brian Foster <bfoster@redhat.com>
  chen gong <curry.gong@amd.com>
  Chih-Min Chen <chih-min.chen@mediatek.com>
  Chris Chiu <chiu@endlessm.com>
  Christian König <christian.koenig@amd.com>
  Christian Lamparter <chunkeey@gmail.com>
  Christoph Hellwig <hch@lst.de>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Christophe Leroy <christophe.leroy@csgroup.eu>
  Chuhong Yuan <hslester96@gmail.com>
  Chun-Kuang Hu <chunkuang.hu@kernel.org>
  Colin Ian King <colin.king@canonical.com>
  Coly Li <colyli@suse.de>
  Corentin Labbe <clabbe@baylibre.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Daniel Axtens <dja@axtens.net>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniel Jordan <daniel.m.jordan@oracle.com>
  Daniel Lezcano <daniel.lezcano@linaro.org>
  Daniel Thompson <daniel.thompson@linaro.org>
  Darrel Goeddel <dgoeddel@forcepoint.com>
  Darrick J. Wong <darrick.wong@oracle.com>
  Dave Hansen <dave.hansen@intel.com>
  Dave Jiang <dave.jiang@intel.com>
  David Gow <davidgow@google.com>
  David Hildenbrand <david@redhat.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  David.Laight@aculab.com (big endian system concerns)
  Dejin Zheng <zhengdejin5@gmail.com>
  Devulapally Shiva Krishna <shiva@chelsio.com>
  Dmitry Osipenko <digetx@gmail.com>
  Doug Berger <opendmb@gmail.com>
  Douglas Anderson <dianders@chromium.org>
  Eelco Chaudron <echaudro@redhat.com>
  Erez Shitrit <erezsh@mellanox.com>
  Erhard F. <erhard_f@mailbox.org>
  Eric Biggers <ebiggers@google.com>
  Erik Kaneda <erik.kaneda@intel.com>
  Evan Green <evgreen@chromium.org>
  Felix Fietkau <nbd@nbd.name>
  Felix Kuehling <Felix.Kuehling@amd.com>
  Feng Tang <feng.tang@intel.com>
  Filipe Manana <fdmanana@suse.com>
  Finn Thain <fthain@telegraphics.com.au>
  Florian Fainelli <f.fainelli@gmail.com>
  Ganapathi Bhat <ganapathi.bhat@nxp.com>
  Gavin Shan <gshan@redhat.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Geert Uytterhoeven <geert@linux-m68k.org>
  Georgy Vlasov <Georgy.Vlasov@baikalelectronics.ru>
  Govindaraj Saminathan <gsamin@codeaurora.org>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
  H. Nikolaus Schaller <hns@goldelico.com>
  Haibo Chen <haibo.chen@nxp.com>
  Hans de Goede <hdegoede@redhat.com>
  Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Hari Bathini <hbathini@linux.ibm.com>
  Harshad Shirwadkar <harshadshirwadkar@gmail.com>
  Herbert Xu <herbert@gondor.apana.org.au>
  Hsin-Yu Chao <hychao@chromium.org>
  Huaixin Chang <changhuaixin@linux.alibaba.com>
  Ian Rogers <irogers@google.com>
  Ingo Molnar <mingo@kernel.org>
  Ioana Ciornei <ioana.ciornei@nxp.com>
  Ivan Kokshaysky <ink@jurassic.park.msu.ru>
  J. Bruce Fields <bfields@redhat.com>
  Jacob Keller <jacob.e.keller@intel.com>
  Jaegeuk Kim <jaegeuk@kernel.org>
  Jaehoon Chung <jh80.chung@samsung.com>
  Jakub Sitnicki <jakub@cloudflare.com>
  James Morris <jmorris@namei.org>
  Jann Horn <jannh@google.com>
  Jay Cornwall <Jay.Cornwall@amd.com>
  Jean-Philippe Brucker <jean-philippe@linaro.org>
  Jeff Kirsher <jeffrey.t.kirsher@intel.com>
  Jeffle Xu <jefflexu@linux.alibaba.com>
  Jens Axboe <axboe@kernel.dk>
  Jeremy Cline <jcline@redhat.com>
  Jeremy Kerr <jk@ozlabs.org>
  Jernej Skrabec <jernej.skrabec@siol.net>
  Jesper Dangaard Brouer <brouer@redhat.com>
  Jia-Ju Bai <baijiaju1990@gmail.com>
  Jiaxun Yang <jiaxun.yang@flygoat.com>
  Jiri Olsa <jolsa@redhat.com>
  Jitao Shi <jitao.shi@mediatek.com>
  Johan Hovold <johan@kernel.org>
  John Fastabend <john.fastabend@gmail.com>
  Jon Derrick <jonathan.derrick@intel.com>
  Jon Doron <arilou@gmail.com>
  Jonathan Bakker <xc-racer2@live.ca>
  Josef Bacik <josef@toxicpanda.com>
  Josh Poimboeuf <jpoimboe@redhat.com>
  Julien Thierry <jthierry@redhat.com>
  Juxin Gao <gaojuxin@loongson.cn>
  Kai-Heng Feng <kai.heng.feng@canonical.com>
  Kaige Li <likaige@loongson.cn>
  Kalle Valo <kvalo@codeaurora.org>
  Kees Cook <keescook@chromium.org>
  Kevin Buettner <kevinb@redhat.com>
  Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
  Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
  Koba Ko <koba.ko@canonical.com>
  Krzysztof Kozlowski <krzk@kernel.org>
  Krzysztof Struczynski <krzysztof.struczynski@huawei.com>
  Larry Finger <Larry.Finger@lwfinger.net>
  Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  limingyu <limingyu@uniontech.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
  Luca Coelho <luciano.coelho@intel.com>
  Ludovic Desroches <ludovic.desroches@microchip.com>
  Lukas Wunner <lukas@wunner.de>
  Luke Nelson <luke.r.nels@gmail.com>
  Luke Nelson <lukenels@cs.washington.edu>
  Maharaja Kennadyrajan <mkenna@codeaurora.org>
  Marcel Holtmann <marcel@holtmann.org>
  Marcos Paulo de Souza <mpdesouza@suse.com>
  Marcos Scriven <marcos@scriven.org>
  Marek Szyprowski <m.szyprowski@samsung.com>
  Mark Brown <broonie@kernel.org>
  Mark Starovoytov <mstarovoitov@marvell.com>
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Masami Hiramatsu <mhiramat@kernel.org>
  Matt Turner <mattst88@gmail.com>
  Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael Ellerman <mpe@ellerman.id.au> (powerpc)
  Michal Hocko <mhocko@suse.com>
  Michał Mirosław <mirq-linux@rere.qmqm.pl>
  Mike Snitzer <snitzer@redhat.com>
  Mikulas Patocka <mpatocka@redhat.com>
  Mimi Zohar <zohar@linux.ibm.com>
  Ming Lei <ming.lei@redhat.com>
  Miquel Raynal <miquel.raynal@bootlin.com>
  Mordechay Goodstein <mordechay.goodstein@intel.com>
  Nathan Chancellor <natechancellor@gmail.com>
  NeilBrown <neilb@suse.de>
  Nick Desaulniers <ndesaulniers@google.com>
  Nickolai Kozachenko <daemongloom@gmail.com>
  Nicolas Chauvet <kwizart@gmail.com>
  Nicolas Toromanoff <nicolas.toromanoff@st.com>
  Nikolay Borisov <nborisov@suse.com>
  Omar Sandoval <osandov@fb.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Pali Rohár <pali@kernel.org>
  Paolo Bonzini <pbonzini@redhat.com>
  Paul Moore <paul@paul-moore.com>
  Pavel Tatashin <pasha.tatashin@soleen.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Peter Zijlstra <peterz@infradead.org>
  Punit Agrawal <punit1.agrawal@toshiba.co.jp>
  Qian Cai <cai@lca.pw>
  Qiushi Wu <wu000273@umn.edu>
  Qu Wenruo <wqu@suse.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Rajmohan Mani <rajmohan.mani@intel.com>
  Rakesh Pillai <pillair@codeaurora.org>
  Rob Herring <robh@kernel.org>
  Roberto Sassu <roberto.sassu@huawei.com>
  Rui Miguel Silva <rmfrfs@gmail.com>
  Russell King <rmk+kernel@armlinux.org.uk>
  Ryder Lee <ryder.lee@mediatek.com>
  Saeed Mahameed <saeedm@mellanox.com>
  Sagi Grimberg <sagi@grimberg.me>
  Sakari Ailus <sakari.ailus@linux.intel.com>
  Sameeh Jubran <sameehj@amazon.com>
  Samuel Holland <samuel@sholland.org>
  Sasha Levin <sashal@kernel.org>
  Sean Young <sean@mess.org>
  Sebastian Reichel <sebastian.reichel@collabora.com>
  Serge Semin <Sergey.Semin@baikalelectronics.ru>
  Shaokun Zhang <zhangshaokun@hisilicon.com>
  Sharon <sara.sharon@intel.com>
  Simon Wunderlich <sw@simonwunderlich.de>
  Song Liu <songliubraving@fb.com>
  Stephane Eranian <eranian@google.com>
  Stephen Boyd <sboyd@kernel.org>
  Surabhi Boob <surabhi.boob@intel.com>
  Sven Eckelmann <sven@narfation.org>
  Tejun Heo <tj@kernel.org>
  Theodore Ts'o <tytso@mit.edu>
  Thierry Reding <treding@nvidia.com>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Tiezhu Yang <yangtiezhu@loongson.cn>
  Tobias Baumann <017623705678@o2online.de>
  Toke Høiland-Jørgensen <toke@redhat.com>
  Tom Lendacky <thomas.lendacky@amd.com>
  Tomasz Figa <tfiga@chromium.org>
  Tomi Valkeinen <tomi.valkeinen@ti.com>
  Tomohito Esaki <etom@igel.co.jp>
  Tony Lindgren <tony@atomide.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Toshiaki Makita <toshiaki.makita1@gmail.com>
  Tuan Phan <tuanphan@os.amperecomputing.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
  Venkateswara Naralasetty <vnaralas@codeaurora.org>
  Vinod Koul <vkoul@kernel.org>
  Vladimir Zapolskiy <vz@mleia.com>
  Vlastimil Babka <vbabka@suse.cz>
  Wei Liu <wei.liu@kernel.org>
  Wei Yongjun <weiyongjun1@huawei.com>
  Weiping Zhang <zhangweiping@didiglobal.com>
  Weiyi Lu <weiyi.lu@mediatek.com>
  Wen Gong <wgong@codeaurora.org>
  Will Deacon <will@kernel.org>
  Xi Wang <xi.wang@gmail.com>
  Xie XiuQi <xiexiuqi@huawei.com>
  Yan-Hsuan Chuang <yhchuang@realtek.com>
  Yazen Ghannam <yazen.ghannam@amd.com>
  YuanJunQing <yuanjunqing66@163.com>
  Yunjian Wang <wangyunjian@huawei.com>
  zhoubinbin <zhoubinbin@uniontech.com>
  Álvaro Fernández Rojas <noltari@gmail.com>

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
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
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


Pushing revision :

hint: The 'hooks/update' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
hint: The 'hooks/post-receive' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
hint: The 'hooks/post-update' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
To xenbits.xen.org:/home/xen/git/linux-pvops.git
   fd8cd8ac940c..67cb016870e2  67cb016870e2fa9ffc8d34cf20db5331e6f2cf4d -> tested/linux-5.4

