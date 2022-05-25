Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAF3533674
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 07:34:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336840.561265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntjeR-0007wr-2g; Wed, 25 May 2022 05:33:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336840.561265; Wed, 25 May 2022 05:33:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntjeQ-0007u1-Vj; Wed, 25 May 2022 05:33:42 +0000
Received: by outflank-mailman (input) for mailman id 336840;
 Wed, 25 May 2022 05:33:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ntjeP-0007tr-5M; Wed, 25 May 2022 05:33:41 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ntjeP-0000KJ-2a; Wed, 25 May 2022 05:33:41 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ntjeO-0001sj-Ji; Wed, 25 May 2022 05:33:40 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ntjeO-00010Z-J6; Wed, 25 May 2022 05:33:40 +0000
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
	bh=bBNVKI8qnzTl+4PeXbCeOjb/Vr2JvKzl9aMF2rvdGwU=; b=f0aIqNx2BZmO2pcfStdnGDyE5X
	pQeUH2hF+oy48B9/eAnYQ5FfGVCMEDD7O2LPLyfEhA3AUs/mxxes2say7NRHXi2QnIZnCIKzl2SQA
	fotVZsajbmL8Blmqv6vdj7ltkDVioDLHmK7Hxd6WPookhY2nnymfyxYo1LKhaE1m1K7c=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-170718-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 170718: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-dom0pvh-xl-amd:guest-start:fail:regression
    linux-linus:test-amd64-amd64-dom0pvh-xl-intel:guest-start:fail:regression
    linux-linus:test-arm64-arm64-xl-seattle:guest-start:fail:regression
    linux-linus:test-amd64-amd64-xl-pvhv2-intel:guest-start:fail:regression
    linux-linus:test-amd64-amd64-xl-pvshim:guest-start:fail:regression
    linux-linus:test-amd64-amd64-xl-pvhv2-amd:guest-start:fail:regression
    linux-linus:test-amd64-amd64-libvirt:guest-start:fail:regression
    linux-linus:test-amd64-amd64-libvirt-xsm:guest-start:fail:regression
    linux-linus:test-amd64-amd64-xl:guest-start:fail:regression
    linux-linus:test-amd64-amd64-pair:guest-start/debian:fail:regression
    linux-linus:test-amd64-amd64-freebsd11-amd64:guest-start:fail:regression
    linux-linus:test-amd64-amd64-xl-credit2:guest-start:fail:regression
    linux-linus:test-amd64-amd64-xl-multivcpu:guest-start:fail:regression
    linux-linus:test-amd64-amd64-xl-credit1:guest-start:fail:regression
    linux-linus:test-amd64-amd64-xl-xsm:guest-start:fail:regression
    linux-linus:test-amd64-amd64-xl-shadow:guest-start:fail:regression
    linux-linus:test-amd64-coresched-amd64-xl:guest-start:fail:regression
    linux-linus:test-arm64-arm64-xl:guest-start:fail:regression
    linux-linus:test-arm64-arm64-xl-credit1:guest-start:fail:regression
    linux-linus:test-arm64-arm64-xl-credit2:guest-start:fail:regression
    linux-linus:test-arm64-arm64-xl-thunderx:guest-start:fail:regression
    linux-linus:test-arm64-arm64-libvirt-xsm:guest-start:fail:regression
    linux-linus:test-arm64-arm64-xl-xsm:guest-start:fail:regression
    linux-linus:test-armhf-armhf-xl-arndale:guest-start:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-libvirt-pair:guest-start/debian:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install:fail:regression
    linux-linus:test-armhf-armhf-xl-credit1:guest-start:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-amd64:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64:debian-hvm-install:fail:regression
    linux-linus:test-armhf-armhf-xl-multivcpu:guest-start:fail:regression
    linux-linus:test-amd64-amd64-qemuu-nested-intel:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-freebsd12-amd64:guest-start:fail:regression
    linux-linus:test-armhf-armhf-xl-cubietruck:guest-start:fail:regression
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-pygrub:debian-di-install:fail:regression
    linux-linus:test-armhf-armhf-xl-credit2:guest-start:fail:regression
    linux-linus:test-amd64-amd64-libvirt-qcow2:debian-di-install:fail:regression
    linux-linus:test-amd64-amd64-libvirt-raw:debian-di-install:fail:regression
    linux-linus:test-amd64-amd64-xl-vhd:debian-di-install:fail:regression
    linux-linus:test-armhf-armhf-libvirt:guest-start:fail:regression
    linux-linus:test-arm64-arm64-xl-vhd:debian-di-install:fail:regression
    linux-linus:test-arm64-arm64-libvirt-raw:debian-di-install:fail:regression
    linux-linus:test-armhf-armhf-libvirt-raw:debian-di-install:fail:regression
    linux-linus:test-armhf-armhf-libvirt-qcow2:debian-di-install:fail:regression
    linux-linus:test-armhf-armhf-xl:guest-start:fail:regression
    linux-linus:test-armhf-armhf-xl-vhd:debian-di-install:fail:regression
    linux-linus:test-amd64-amd64-xl-rtds:guest-start:fail:allowable
    linux-linus:test-armhf-armhf-xl-rtds:guest-start:fail:allowable
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
X-Osstest-Versions-This:
    linux=0350785b0a092c99c5ddd2ace0260dbe7b3f919f
X-Osstest-Versions-That:
    linux=d6ecaa0024485effd065124fe774de2e22095f2d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 25 May 2022 05:33:40 +0000

flight 170718 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/170718/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-dom0pvh-xl-amd 14 guest-start           fail REGR. vs. 170714
 test-amd64-amd64-dom0pvh-xl-intel 14 guest-start         fail REGR. vs. 170714
 test-arm64-arm64-xl-seattle  14 guest-start              fail REGR. vs. 170714
 test-amd64-amd64-xl-pvhv2-intel 14 guest-start           fail REGR. vs. 170714
 test-amd64-amd64-xl-pvshim   14 guest-start              fail REGR. vs. 170714
 test-amd64-amd64-xl-pvhv2-amd 14 guest-start             fail REGR. vs. 170714
 test-amd64-amd64-libvirt     14 guest-start              fail REGR. vs. 170714
 test-amd64-amd64-libvirt-xsm 14 guest-start              fail REGR. vs. 170714
 test-amd64-amd64-xl          14 guest-start              fail REGR. vs. 170714
 test-amd64-amd64-pair        25 guest-start/debian       fail REGR. vs. 170714
 test-amd64-amd64-freebsd11-amd64 13 guest-start          fail REGR. vs. 170714
 test-amd64-amd64-xl-credit2  14 guest-start              fail REGR. vs. 170714
 test-amd64-amd64-xl-multivcpu 14 guest-start             fail REGR. vs. 170714
 test-amd64-amd64-xl-credit1  14 guest-start              fail REGR. vs. 170714
 test-amd64-amd64-xl-xsm      14 guest-start              fail REGR. vs. 170714
 test-amd64-amd64-xl-shadow   14 guest-start              fail REGR. vs. 170714
 test-amd64-coresched-amd64-xl 14 guest-start             fail REGR. vs. 170714
 test-arm64-arm64-xl          14 guest-start              fail REGR. vs. 170714
 test-arm64-arm64-xl-credit1  14 guest-start              fail REGR. vs. 170714
 test-arm64-arm64-xl-credit2  14 guest-start              fail REGR. vs. 170714
 test-arm64-arm64-xl-thunderx 14 guest-start              fail REGR. vs. 170714
 test-arm64-arm64-libvirt-xsm 14 guest-start              fail REGR. vs. 170714
 test-arm64-arm64-xl-xsm      14 guest-start              fail REGR. vs. 170714
 test-armhf-armhf-xl-arndale  14 guest-start              fail REGR. vs. 170714
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 12 debian-hvm-install fail REGR. vs. 170714
 test-amd64-amd64-libvirt-pair 25 guest-start/debian      fail REGR. vs. 170714
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 12 debian-hvm-install fail REGR. vs. 170714
 test-amd64-amd64-qemuu-nested-amd 12 debian-hvm-install  fail REGR. vs. 170714
 test-armhf-armhf-xl-credit1  14 guest-start              fail REGR. vs. 170714
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 170714
 test-amd64-amd64-xl-qemut-debianhvm-amd64 12 debian-hvm-install fail REGR. vs. 170714
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 12 debian-hvm-install fail REGR. vs. 170714
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 12 debian-hvm-install fail REGR. vs. 170714
 test-armhf-armhf-xl-multivcpu 14 guest-start             fail REGR. vs. 170714
 test-amd64-amd64-qemuu-nested-intel 12 debian-hvm-install fail REGR. vs. 170714
 test-amd64-amd64-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail REGR. vs. 170714
 test-amd64-amd64-freebsd12-amd64 13 guest-start          fail REGR. vs. 170714
 test-armhf-armhf-xl-cubietruck 14 guest-start            fail REGR. vs. 170714
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 12 debian-hvm-install fail REGR. vs. 170714
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 170714
 test-amd64-amd64-pygrub      12 debian-di-install        fail REGR. vs. 170714
 test-armhf-armhf-xl-credit2  14 guest-start              fail REGR. vs. 170714
 test-amd64-amd64-libvirt-qcow2 12 debian-di-install      fail REGR. vs. 170714
 test-amd64-amd64-libvirt-raw 12 debian-di-install        fail REGR. vs. 170714
 test-amd64-amd64-xl-vhd      12 debian-di-install        fail REGR. vs. 170714
 test-armhf-armhf-libvirt     14 guest-start              fail REGR. vs. 170714
 test-arm64-arm64-xl-vhd      12 debian-di-install        fail REGR. vs. 170714
 test-arm64-arm64-libvirt-raw 12 debian-di-install        fail REGR. vs. 170714
 test-armhf-armhf-libvirt-raw 12 debian-di-install        fail REGR. vs. 170714
 test-armhf-armhf-libvirt-qcow2 12 debian-di-install      fail REGR. vs. 170714
 test-armhf-armhf-xl          14 guest-start              fail REGR. vs. 170714
 test-armhf-armhf-xl-vhd      12 debian-di-install        fail REGR. vs. 170714

Regressions which are regarded as allowable (not blocking):
 test-amd64-amd64-xl-rtds     14 guest-start              fail REGR. vs. 170714
 test-armhf-armhf-xl-rtds     14 guest-start              fail REGR. vs. 170714

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 170714
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 170714
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 170714
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 170714

version targeted for testing:
 linux                0350785b0a092c99c5ddd2ace0260dbe7b3f919f
baseline version:
 linux                d6ecaa0024485effd065124fe774de2e22095f2d

Last test of basis   170714  2022-05-24 03:27:44 Z    1 days
Failing since        170716  2022-05-24 11:12:06 Z    0 days    3 attempts
Testing same since   170718  2022-05-24 22:12:03 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
    "Eric W. Biederman" <ebiederm@xmission.com>
  Aditya Garg <gargaditya08@live.com>
  Ahmad Fatoum <a.fatoum@pengutronix.de>
  Alexander Egorenkov <egorenar@linux.ibm.com>
  Alexander Gordeev <agordeev@linux.ibm.com>
  Alexandre Belloni <alexandre.belloni@bootlin.com>
  Alexandru Elisei <alexandru.elisei@arm.com>
  Andre Przywara <andre.przywara@arm.com>
  Andreas Rammhold <andreas@rammhold.de>
  Anshuman Khandual <anshuman.khandual@arm.com>
  Ard Biesheuvel <ardb@kernel.org>
  Baolin Wang <baolin.wang@linux.alibaba.com>
  Baoquan He <bhe@redhat.com>
  Barry Song <baohua@kernel.org>
  Bill Wendling <morbo@google.com>
  Borislav Petkov <bp@suse.de>
  Casey Schaufler <casey@schaufler-ca.com>
  Catalin Marinas <catalin.marinas@arm.com>
  Chen Zhongjin <chenzhongjin@huawei.com>
  Chen Zhou <chenzhou10@huawei.com>
  Chengming Zhou <zhouchengming@bytedance.com>
  Christian Göttsche <cgzones@googlemail.com>
  Christoph Hellwig <hch@lst.de>
  Colin Ian King <colin.i.king@gmail.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Daniel Beer <daniel.beer@tirotech.co.nz>
  Daniel Lezcano <daniel.lezcano@linaro.org>
  Daniel Thompson <daniel.thompson@linaro.org>
  Darryn Anton Jordan <darrynjordan@icloud.com>
  Dave Hansen <dave.hansen@linux.intel.com>
  Dave Kleikamp <dave.kleikamp@oracle.com>
  David Arcari <darcari@redhat.com>
  David E. Box <david.e.box@linux.intel.com>
  David Sterba <dsterba@suse.com>
  David Yang <davidcomponentone@gmail.com>
  Deyan Wang <wonder_rock@126.com>
  Dietmar Eggemann <dietmar.eggemann@arm.com>
  Dinh Nguyen <dinguyen@kernel.org>
  Dmitry Vyukov <dvyukov@google.com>
  Eric Biggers <ebiggers@google.com>
  Eric W. Biederman <ebiederm@xmission.com>
  Frank Crawford <frank@crawford.emu.id.au>
  Frederic Weisbecker <frederic@kernel.org>
  Gabriele Mazzotta <gabriele.mzt@gmail.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Geert Uytterhoeven <geert@linux-m68k.org>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Greg Ungerer <gerg@linux-m68k.org>
  Guilherme G. Piccoli <gpiccoli@igalia.com>
  Guo Ren <guoren@kernel.org>
  Guo Ren <guoren@linux.alibaba.com>
  Guo Zhengkui <guozhengkui@vivo.com>
  GUO Zihua <guozihua@huawei.com>
  Hailong Liu <liuhailong@linux.alibaba.com>
  Haitao Huang <haitao.huang@intel.com>
  Hans de Goede <hdegoede@redhat.com>
  Hao Jia <jiahao.os@bytedance.com>
  Haowen Bai <baihaowen@meizu.com>
  Harald Freudenberger <freude@linux.ibm.com>
  Hector Martin <marcan@marcan.st>
  Heikki Krogerus <heikki.krogerus@linux.intel.com>
  Heiko Carstens <hca@linux.ibm.com>
  Helge Deller <deller@gmx.de>
  Hyeonggon Yoo <42.hyeyoo@gmail.com>
  Ilkka Koskinen <ilkka@os.amperecomputing.com>
  Ilya Leoshkevich <iii@linux.ibm.com>
  Ingo Molnar <mingo@kernel.org>
  Jakob Koschel <jakobkoschel@gmail.com>
  Jakub Kicinski <kuba@kernel.org>
  Jann Horn <jannh@google.com>
  Jarkko Sakkinen <jarkko@kernel.org>
  Jason A. Donenfeld <Jason@zx2c4.com>
  Jason Wang <wangborong@cdjrlc.com>
  Jens Axboe <axboe@kernel.dk>
  Jes B. Klinke <jbk@chromium.org>
  Jithu Joseph <jithu.joseph@intel.com>
  Johannes Berg <johannes@sipsolutions.net>
  Johannes Holland <johannes.holland@infineon.com>
  Johannes Weiner <hannes@cmpxchg.org>
  John Donnelly  <john.p.donnelly@oracle.com>
  John Ernberg <john.ernberg@actia.se> # iMX8QXP
  John Johansen <john.johansen@canonical.com>
  Jorge Lopez <jorge.lopez2@hp.com>
  Josh Poimboeuf <jpoimboe@kernel.org>
  Josh Poimboeuf <jpoimboe@redhat.com>
  Juerg Haefliger <juerg.haefliger@canonical.com>
  Juerg Haefliger <juergh@canonical.com>
  Juergen Gross <jgross@suse.com>
  Julia Lawall <Julia.Lawall@inria.fr>
  Kan Liang <kan.liang@linux.intel.com>
  Kees Cook <keescook@chromium.org>
  Kefeng Wang <wangkefeng.wang@huawei.com>
  Kuniyuki Iwashima <kuniyu@amazon.co.jp>
  Laurent Vivier <laurent@vivier.eu>
  Linu Cherian <lcherian@marvell.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Luca Miccio <lucmiccio@gmail.com>
  Luca Stefani <luca.stefani.ge1@gmail.com>
  Maciej W. Rozycki <macro@orcam.me.uk>
  Madhavan T. Venkataraman <madvenka@linux.microsoft.com>
  Marc Zyngier <maz@kernel.org>
  Marco Elver <elver@google.com>
  Marek Szyprowski <m.szyprowski@samsung.com>
  Mario Limonciello <mario.limonciello@amd.com>
  Mark Brown <broonie@kernel.org>
  Mark Pearson <markpearson@lenovo.com>
  Mark Pearson <markpearson@lenvo.com>
  Mark Rutland <mark.rutland@arm.com
  Mark Rutland <mark.rutland@arm.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Matt Turner <mattst88@gmail.com>
  Matteo Croce <mcroce@microsoft.com>
  Matthew Wilcox (Oracle) <willy@infradead.org>
  Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
  Max Filippov <jcmvbkbc@gmail.com>
  Maximilian Heyne <mheyne@amazon.de>
  Maximilian Luz <luzmaximilian@gmail.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael Niewöhner <linux@mniewoehner.de>
  Michael Schmitz <schmitzmic@gmail.com>
  Michael Shych <michaelsh@nvidia.com>
  Michael Walle <michael@walle.cc>
  Michael Walle <michael@walle.cc> # on ls1028a (non-E and E)
  Michal Orzel <michal.orzel@arm.com>
  Michal Orzel <michalorzel.eng@gmail.com>
  Mickaël Salaün <mic@digikod.net>
  Mickaël Salaün <mic@linux.microsoft.com>
  Mikulas Patocka <mpatocka@redhat.com>
  Mimi Zohar <zohar@linux.ibm.com>
  Minghao Chi <chi.minghao@zte.com.cn>
  Namhyung Kim <namhyung@kernel.org>
  Naresh Kamboju <naresh.kamboju@linaro.org>
  Nathan Chancellor <nathan@kernel.org>
  Naveen Krishna Chatradhi <nchatrad@amd.com>
  Nick Desaulniers <ndesaulniers@google.com>
  Nick Hawkins <nick.hawkins@hpe.com>
  Niklas Cassel <niklas.cassel@wdc.com>
  Niklas Schnelle <schnelle@linux.ibm.com>
  Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com> # Arm64 only
  Pali Rohár <pali@kernel.org>
  Palmer Dabbelt <palmer@rivosinc.com>
  Pankaj Gupta <pankaj.gupta@nxp.com>
  Patrice Chotard <patrice.chotard@foss.st.com>
  Paul Gortmaker <paul.gortmaker@windriver.com>
  Paul Moore <paul@paul-moore.com>
  Peter Collingbourne <pcc@google.com>
  Peter Oberparleiter <oberpar@linux.ibm.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Peter Zijlstra <peterz@infradead.org>
  Petr Mladek <pmladek@suse.com> # for vsprintf.c
  Pingfan Liu <kernelfans@gmail.com>
  Prarit Bhargava <prarit@redhat.com>
  Qais Yousef <qais.yousef@arm.com>
  Qi Liu <liuqi115@huawei.com>
  Randy Dunlap <rdunlap@infradead.org>
  Ravi Bangoria <ravi.bangoria@amd.com>
  Reinette Chatre <reinette.chatre@intel.com>
  Ren Yu <renyu@nfschina.com>
  Ren Zhijie <renzhijie2@huawei.com>
  Rob Herring <robh@kernel.org>
  Robin Murphy <robin.murphy@arm.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
  Sami Tolvanen <samitolvanen@google.com>
  Sandipan Das <sandipan.das@amd.com>
  Sargun Dhillon <sargun@sargun.me>
  Sebastian Andrzej Siewior <bigeasy@linutronix.de>
  SeongJae Park <sj@kernel.org>
  Shaokun Zhang <zhangshaokun@hisilicon.com>
  Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
  Stafford Horne <shorne@gmail.com>
  Stefan Berger <stefanb@linux.ibm.com>
  Stefan Mahnke-Hartmann <stefan.mahnke-hartmann@infineon.com>
  Stefano Stabellini <stefano.stabellini@xilinx.com>
  Steffen Trumtrar <s.trumtrar@pengutronix.de>
  Stephane Eranian <eranian@google.com>
  Stephen Brennan <stephen.s.brennan@oracle.com>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Suma Hegde <suma.hegde@amd.com>
  Sumanth Korikkar <sumanthk@linux.ibm.com>
  Sumit Garg <sumit.garg@linaro.org>
  Suren Baghdasaryan <surenb@google.com>
  Sven Schnelle <svens@linux.ibm.com>
  Tanmay Jagdale <tanmay@marvell.com>
  Tao Zhou <tao.zhou@linux.dev>
  Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
  Theodore Ts'o <tytso@mit.edu>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Thomas Gleixner <tglx@linutronix.de>
  Thomas Huth <thuth@redhat.com>
  Thomas Richter <tmricht@linux.ibm.com>
  Thomas Weißschuh <thomas@weissschuh.net>
  Tiezhu Yang <yangtiezhu@loongson.cn>
  Tim Harvey <tharvey@gateworks.com>
  Tom Rix <trix@redhat.com>
  Tong Tiangen <tongtiangen@huawei.com>
  Tony Luck <tony.luck@intel.com>
  Tycho Andersen <tycho@tycho.pizza>
  Uros Bizjak <ubizjak@gmail.com>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Valentin Schneider <valentin.schneider@arm.com>
  Valentin Schneider <vschneid@redhat.com>
  Vasily Gorbik <gor@linux.ibm.com>
  Vladimir Murzin <vladimir.murzin@arm.com> # ARM
  Waiman Long <longman@redhat.com>
  Wan Jiabing <wanjiabing@vivo.com>
  Wang Kefeng <wangkefeng.wang@huawei.com>
  Will Deacon <will@kernel.org>
  Will Deacon <will@kernel.org> # arm64
  Xiu Jianfeng <xiujianfeng@huawei.com>
  Yang Guang <yang.guang5@zte.com.cn>
  Yang Jihong <yangjihong1@huawei.com>
  Yang Li <yang.lee@linux.alibaba.com>
  Yi Yang <yiyang13@huawei.com>
  Yuanzheng Song <songyuanzheng@huawei.com>
  zgpeng <zgpeng.linux@gmail.com>
  zgpeng <zgpeng@tencent.com>
  Zhang Jianhua <chris.zjh@huawei.com>
  Zhen Lei <thunder.leizhen@huawei.com>
  Zucheng Zheng <zhengzucheng@huawei.com>

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
 test-amd64-amd64-xl                                          fail    
 test-amd64-coresched-amd64-xl                                fail    
 test-arm64-arm64-xl                                          fail    
 test-armhf-armhf-xl                                          fail    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           fail    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        fail    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 fail    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 fail    
 test-amd64-amd64-libvirt-xsm                                 fail    
 test-arm64-arm64-libvirt-xsm                                 fail    
 test-amd64-amd64-xl-xsm                                      fail    
 test-arm64-arm64-xl-xsm                                      fail    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                fail    
 test-amd64-amd64-dom0pvh-xl-amd                              fail    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    fail    
 test-amd64-amd64-freebsd11-amd64                             fail    
 test-amd64-amd64-freebsd12-amd64                             fail    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         fail    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-armhf-armhf-xl-arndale                                  fail    
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  fail    
 test-arm64-arm64-xl-credit1                                  fail    
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  fail    
 test-arm64-arm64-xl-credit2                                  fail    
 test-armhf-armhf-xl-credit2                                  fail    
 test-armhf-armhf-xl-cubietruck                               fail    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        fail    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-amd64-qemuu-nested-intel                          fail    
 test-amd64-amd64-xl-pvhv2-intel                              fail    
 test-amd64-amd64-dom0pvh-xl-intel                            fail    
 test-amd64-amd64-libvirt                                     fail    
 test-armhf-armhf-libvirt                                     fail    
 test-amd64-amd64-xl-multivcpu                                fail    
 test-armhf-armhf-xl-multivcpu                                fail    
 test-amd64-amd64-pair                                        fail    
 test-amd64-amd64-libvirt-pair                                fail    
 test-amd64-amd64-xl-pvshim                                   fail    
 test-amd64-amd64-pygrub                                      fail    
 test-amd64-amd64-libvirt-qcow2                               fail    
 test-armhf-armhf-libvirt-qcow2                               fail    
 test-amd64-amd64-libvirt-raw                                 fail    
 test-arm64-arm64-libvirt-raw                                 fail    
 test-armhf-armhf-libvirt-raw                                 fail    
 test-amd64-amd64-xl-rtds                                     fail    
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             fail    
 test-amd64-amd64-xl-shadow                                   fail    
 test-arm64-arm64-xl-thunderx                                 fail    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-xl-vhd                                      fail    
 test-arm64-arm64-xl-vhd                                      fail    
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

(No revision log; it would be 14800 lines long.)

