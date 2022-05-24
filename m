Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADB0533320
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 23:45:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336749.561139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntcKb-0006Ov-J8; Tue, 24 May 2022 21:44:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336749.561139; Tue, 24 May 2022 21:44:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntcKb-0006M6-F6; Tue, 24 May 2022 21:44:45 +0000
Received: by outflank-mailman (input) for mailman id 336749;
 Tue, 24 May 2022 21:44:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ntcKa-0006Lw-9c; Tue, 24 May 2022 21:44:44 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ntcKa-0001Hh-3F; Tue, 24 May 2022 21:44:44 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ntcKZ-0007Op-DG; Tue, 24 May 2022 21:44:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ntcKZ-0000B5-Cp; Tue, 24 May 2022 21:44:43 +0000
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
	bh=s5s42NHHBRuOhW5mhKPPEt9/gxr9mWpImwCsFe67wFM=; b=lJEaaL+fHasHynqAwVAsL0/+hD
	Tb5gOVKPBGze4LWAESTtyO7surRWJYmfQPLj7eYqU4TDHg2f+SXNY/bwDhkytEuM/7bCiRl9joUI6
	cYuUq6sYmJ/5x1FYZUVet+HnEaqy+ke6oPXgG/2bthr+0TvfjgKmtddmBEutOT5itNlc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-170717-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 170717: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-dom0pvh-xl-amd:guest-start:fail:regression
    linux-linus:test-amd64-amd64-dom0pvh-xl-intel:guest-start:fail:regression
    linux-linus:test-arm64-arm64-xl-seattle:guest-start:fail:regression
    linux-linus:test-amd64-amd64-xl-pvhv2-intel:guest-start:fail:regression
    linux-linus:test-amd64-amd64-xl-pvshim:guest-start:fail:regression
    linux-linus:test-amd64-amd64-xl-shadow:guest-start:fail:regression
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
    linux-linus:test-amd64-coresched-amd64-xl:guest-start:fail:regression
    linux-linus:test-arm64-arm64-xl:guest-start:fail:regression
    linux-linus:test-arm64-arm64-xl-credit1:guest-start:fail:regression
    linux-linus:test-arm64-arm64-xl-credit2:guest-start:fail:regression
    linux-linus:test-arm64-arm64-xl-thunderx:guest-start:fail:regression
    linux-linus:test-arm64-arm64-xl-xsm:guest-start:fail:regression
    linux-linus:test-arm64-arm64-libvirt-xsm:guest-start:fail:regression
    linux-linus:test-armhf-armhf-xl-arndale:guest-start:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-libvirt-pair:guest-start/debian:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install:fail:regression
    linux-linus:test-armhf-armhf-xl-credit1:guest-start:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-amd64:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:debian-hvm-install:fail:regression
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
    linux=143a6252e1b8ab424b4b293512a97cca7295c182
X-Osstest-Versions-That:
    linux=d6ecaa0024485effd065124fe774de2e22095f2d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 24 May 2022 21:44:43 +0000

flight 170717 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/170717/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-dom0pvh-xl-amd 14 guest-start           fail REGR. vs. 170714
 test-amd64-amd64-dom0pvh-xl-intel 14 guest-start         fail REGR. vs. 170714
 test-arm64-arm64-xl-seattle  14 guest-start              fail REGR. vs. 170714
 test-amd64-amd64-xl-pvhv2-intel 14 guest-start           fail REGR. vs. 170714
 test-amd64-amd64-xl-pvshim   14 guest-start              fail REGR. vs. 170714
 test-amd64-amd64-xl-shadow   14 guest-start              fail REGR. vs. 170714
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
 test-amd64-coresched-amd64-xl 14 guest-start             fail REGR. vs. 170714
 test-arm64-arm64-xl          14 guest-start              fail REGR. vs. 170714
 test-arm64-arm64-xl-credit1  14 guest-start              fail REGR. vs. 170714
 test-arm64-arm64-xl-credit2  14 guest-start              fail REGR. vs. 170714
 test-arm64-arm64-xl-thunderx 14 guest-start              fail REGR. vs. 170714
 test-arm64-arm64-xl-xsm      14 guest-start              fail REGR. vs. 170714
 test-arm64-arm64-libvirt-xsm 14 guest-start              fail REGR. vs. 170714
 test-armhf-armhf-xl-arndale  14 guest-start              fail REGR. vs. 170714
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 12 debian-hvm-install fail REGR. vs. 170714
 test-amd64-amd64-libvirt-pair 25 guest-start/debian      fail REGR. vs. 170714
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 12 debian-hvm-install fail REGR. vs. 170714
 test-amd64-amd64-qemuu-nested-amd 12 debian-hvm-install  fail REGR. vs. 170714
 test-armhf-armhf-xl-credit1  14 guest-start              fail REGR. vs. 170714
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 170714
 test-amd64-amd64-xl-qemut-debianhvm-amd64 12 debian-hvm-install fail REGR. vs. 170714
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 12 debian-hvm-install fail REGR. vs. 170714
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 12 debian-hvm-install fail REGR. vs. 170714
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
 linux                143a6252e1b8ab424b4b293512a97cca7295c182
baseline version:
 linux                d6ecaa0024485effd065124fe774de2e22095f2d

Last test of basis   170714  2022-05-24 03:27:44 Z    0 days
Testing same since   170716  2022-05-24 11:12:06 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Eric W. Biederman" <ebiederm@xmission.com>
  Alexander Egorenkov <egorenar@linux.ibm.com>
  Alexander Gordeev <agordeev@linux.ibm.com>
  Alexandre Belloni <alexandre.belloni@bootlin.com>
  Alexandru Elisei <alexandru.elisei@arm.com>
  Andre Przywara <andre.przywara@arm.com>
  Anshuman Khandual <anshuman.khandual@arm.com>
  Ard Biesheuvel <ardb@kernel.org>
  Baolin Wang <baolin.wang@linux.alibaba.com>
  Baoquan He <bhe@redhat.com>
  Borislav Petkov <bp@suse.de>
  Catalin Marinas <catalin.marinas@arm.com>
  Chen Zhongjin <chenzhongjin@huawei.com>
  Chen Zhou <chenzhou10@huawei.com>
  Chengming Zhou <zhouchengming@bytedance.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Daniel Beer <daniel.beer@tirotech.co.nz>
  Daniel Lezcano <daniel.lezcano@linaro.org>
  Darryn Anton Jordan <darrynjordan@icloud.com>
  Dave Hansen <dave.hansen@linux.intel.com>
  Dave Kleikamp <dave.kleikamp@oracle.com>
  David Arcari <darcari@redhat.com>
  David E. Box <david.e.box@linux.intel.com>
  David Sterba <dsterba@suse.com>
  Deyan Wang <wonder_rock@126.com>
  Frank Crawford <frank@crawford.emu.id.au>
  Gabriele Mazzotta <gabriele.mzt@gmail.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Geert Uytterhoeven <geert@linux-m68k.org>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guilherme G. Piccoli <gpiccoli@igalia.com>
  Guo Ren <guoren@kernel.org>
  Guo Ren <guoren@linux.alibaba.com>
  Guo Zhengkui <guozhengkui@vivo.com>
  Haitao Huang <haitao.huang@intel.com>
  Hans de Goede <hdegoede@redhat.com>
  Haowen Bai <baihaowen@meizu.com>
  Harald Freudenberger <freude@linux.ibm.com>
  Hector Martin <marcan@marcan.st>
  Heikki Krogerus <heikki.krogerus@linux.intel.com>
  Heiko Carstens <hca@linux.ibm.com>
  Ilkka Koskinen <ilkka@os.amperecomputing.com>
  Ilya Leoshkevich <iii@linux.ibm.com>
  Jakob Koschel <jakobkoschel@gmail.com>
  Jarkko Sakkinen <jarkko@kernel.org>
  Jason Wang <wangborong@cdjrlc.com>
  Jithu Joseph <jithu.joseph@intel.com>
  John Donnelly  <john.p.donnelly@oracle.com>
  Jorge Lopez <jorge.lopez2@hp.com>
  Juerg Haefliger <juerg.haefliger@canonical.com>
  Juerg Haefliger <juergh@canonical.com>
  Juergen Gross <jgross@suse.com>
  Julia Lawall <Julia.Lawall@inria.fr>
  Kefeng Wang <wangkefeng.wang@huawei.com>
  Laurent Vivier <laurent@vivier.eu>
  Linu Cherian <lcherian@marvell.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Luca Miccio <lucmiccio@gmail.com>
  Luca Stefani <luca.stefani.ge1@gmail.com>
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
  Matteo Croce <mcroce@microsoft.com>
  Max Filippov <jcmvbkbc@gmail.com>
  Maximilian Heyne <mheyne@amazon.de>
  Maximilian Luz <luzmaximilian@gmail.com>
  Michael Niewöhner <linux@mniewoehner.de>
  Michael Schmitz <schmitzmic@gmail.com>
  Michael Shych <michaelsh@nvidia.com>
  Michal Orzel <michal.orzel@arm.com>
  Minghao Chi <chi.minghao@zte.com.cn>
  Naresh Kamboju <naresh.kamboju@linaro.org>
  Nathan Chancellor <nathan@kernel.org>
  Naveen Krishna Chatradhi <nchatrad@amd.com>
  Nick Desaulniers <ndesaulniers@google.com>
  Nick Hawkins <nick.hawkins@hpe.com>
  Niklas Schnelle <schnelle@linux.ibm.com>
  Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com> # Arm64 only
  Pali Rohár <pali@kernel.org>
  Palmer Dabbelt <palmer@rivosinc.com>
  Paul Gortmaker <paul.gortmaker@windriver.com>
  Peter Collingbourne <pcc@google.com>
  Peter Oberparleiter <oberpar@linux.ibm.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Peter Zijlstra <peterz@infradead.org>
  Pingfan Liu <kernelfans@gmail.com>
  Prarit Bhargava <prarit@redhat.com>
  Qi Liu <liuqi115@huawei.com>
  Randy Dunlap <rdunlap@infradead.org>
  Reinette Chatre <reinette.chatre@intel.com>
  Ren Yu <renyu@nfschina.com>
  Ren Zhijie <renzhijie2@huawei.com>
  Rob Herring <robh@kernel.org>
  Robin Murphy <robin.murphy@arm.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
  Sebastian Andrzej Siewior <bigeasy@linutronix.de>
  SeongJae Park <sj@kernel.org>
  Shaokun Zhang <zhangshaokun@hisilicon.com>
  Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
  Stefano Stabellini <stefano.stabellini@xilinx.com>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Suma Hegde <suma.hegde@amd.com>
  Sumanth Korikkar <sumanthk@linux.ibm.com>
  Sven Schnelle <svens@linux.ibm.com>
  Tanmay Jagdale <tanmay@marvell.com>
  Thomas Huth <thuth@redhat.com>
  Thomas Richter <tmricht@linux.ibm.com>
  Thomas Weißschuh <thomas@weissschuh.net>
  Tom Rix <trix@redhat.com>
  Tong Tiangen <tongtiangen@huawei.com>
  Tony Luck <tony.luck@intel.com>
  Valentin Schneider <valentin.schneider@arm.com>
  Vasily Gorbik <gor@linux.ibm.com>
  Wan Jiabing <wanjiabing@vivo.com>
  Wang Kefeng <wangkefeng.wang@huawei.com>
  Will Deacon <will@kernel.org>
  Yang Li <yang.lee@linux.alibaba.com>
  Yi Yang <yiyang13@huawei.com>
  Zhen Lei <thunder.leizhen@huawei.com>

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

(No revision log; it would be 7627 lines long.)

