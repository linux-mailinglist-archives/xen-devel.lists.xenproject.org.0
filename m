Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A2C2B0ABF
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 17:53:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25969.54065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdFq8-0004Pi-I1; Thu, 12 Nov 2020 16:52:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25969.54065; Thu, 12 Nov 2020 16:52:52 +0000
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
	id 1kdFq8-0004PL-Ed; Thu, 12 Nov 2020 16:52:52 +0000
Received: by outflank-mailman (input) for mailman id 25969;
 Thu, 12 Nov 2020 16:52:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=44Nj=ES=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kdFq7-0004PG-9Z
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 16:52:51 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f95de658-2f84-4869-be7a-d190eba5c352;
 Thu, 12 Nov 2020 16:52:48 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kdFq3-0003JE-RY; Thu, 12 Nov 2020 16:52:47 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kdFq3-0007py-JK; Thu, 12 Nov 2020 16:52:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kdFq3-0007Qu-Iq; Thu, 12 Nov 2020 16:52:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=44Nj=ES=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kdFq7-0004PG-9Z
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 16:52:51 +0000
X-Inumbo-ID: f95de658-2f84-4869-be7a-d190eba5c352
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f95de658-2f84-4869-be7a-d190eba5c352;
	Thu, 12 Nov 2020 16:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=au2oHQ4Z8uL+LkWIUsrMSd4DM+Y8eqZTuhPH6fYZxHE=; b=1lsgNxoVDXMjlw491a7yl7XNoe
	grWOq7aYM/VS2XoYiH2cwQNEQArdVO+CCx9VHeJqGh9Xy1KkgM7vS0tr08UXH+T5yejh1uLE6o6yN
	1VsaOuRXRrDTyu+9bTfGQJB1LKO43iK69R1ASWfNlnbNeCmRjiH28SDBIvsmgAF5tAlQ=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kdFq3-0003JE-RY; Thu, 12 Nov 2020 16:52:47 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kdFq3-0007py-JK; Thu, 12 Nov 2020 16:52:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kdFq3-0007Qu-Iq; Thu, 12 Nov 2020 16:52:47 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156677-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 156677: regressions - FAIL
X-Osstest-Failures:
    linux-5.4:test-amd64-i386-xl-xsm:guest-localmigrate/x10:fail:regression
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=2544d06afd8d060f35b159809274e4b7477e63e8
X-Osstest-Versions-That:
    linux=6e97ed6efa701db070da0054b055c085895aba86
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 12 Nov 2020 16:52:47 +0000

flight 156677 linux-5.4 real [real]
flight 156721 linux-5.4 real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/156677/
http://logs.test-lab.xenproject.org/osstest/logs/156721/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl-xsm       20 guest-localmigrate/x10   fail REGR. vs. 156412

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 156412
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 156412
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 156412
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 156412
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 156412
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 156412
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 156412
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 156412
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 156412
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 156412
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 156412
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 linux                2544d06afd8d060f35b159809274e4b7477e63e8
baseline version:
 linux                6e97ed6efa701db070da0054b055c085895aba86

Last test of basis   156412  2020-11-05 11:13:59 Z    7 days
Failing since        156620  2020-11-10 12:10:31 Z    2 days    2 attempts
Testing same since   156677  2020-11-11 07:50:18 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "kiyin(尹亮)" <kiyin@tencent.com>
  Alan Stern <stern@rowland.harvard.edu>
  Alex Deucher <alexander.deucher@amd.com>
  Alexander Aring <aahringo@redhat.com>
  Alexander Sverdlin <alexander.sverdlin@nokia.com>
  Andreas Gruenbacher <agruenba@redhat.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andy Strohman <astroh@amazon.com>
  Artem Lapkin <art@khadas.com>
  Baurzhan Ismagulov <ibr@radix50.net>
  Ben Skeggs <bskeggs@redhat.com>
  Bjørn Mork <bjorn@mork.no>
  Boris Brezillon <boris.brezillon@collabora.com>
  Borislav Petkov <bp@suse.de>
  Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
  Chris Wilson <chris@chris-wilson.co.uk>
  Christoph Hellwig <hch@lst.de>
  Chunfeng Yun <chunfeng.yun@mediatek.com>
  Claire Chang <tientzu@chromium.org>
  Claudiu Manoil <claudiu.manoil@nxp.com>
  Clément Péron <peron.clem@gmail.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Daniel Vetter <daniel.vetter@ffwll.ch>
  Daniel Vetter <daniel.vetter@intel.com>
  Daniele Palmas <dnlplm@gmail.com>
  Dany Madden <drt@linux.ibm.com>
  Darrick J. Wong <darrick.wong@oracle.com>
  David S. Miller <davem@davemloft.net>
  Eddy Wu <eddy_wu@trendmicro.com>
  Eddy Wu <itseddy0402@gmail.com>
  Fangrui Song <maskray@google.com>
  Felipe Balbi <balbi@kernel.org>
  Frank Slotta <frank.slotta@posteo.de>
  Gabriel Krisman Bertazi <krisman@collabora.com>
  Geoffrey D. Bennett <g@b4.vu>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Gregory CLEMENT <gregory.clement@bootlin.com>
  Guenter Roeck <linux@roeck-us.net>
  Harald Freudenberger <freude@linux.ibm.com>
  Heiko Carstens <hca@linux.ibm.com>
  Hoang Huu Le <hoang.h.le@dektech.com.au>
  Hoegeun Kwon <hoegeun.kwon@samsung.com>
  Ingo Molnar <mingo@kernel.org>
  Jakub Kicinski <kuba@kernel.org>
  Jason Gunthorpe <jgg@nvidia.com>
  Jeff Vander Stoep <jeffv@google.com>
  Jens Axboe <axboe@kernel.dk>
  Jernej Skrabec <jernej.skrabec@siol.net>
  Jiri Slaby <jslaby@suse.cz>
  Johan Hovold <johan@kernel.org>
  Jon Hunter <jonathanh@nvidia.com>
  Jon Maloy <jmaloy@redhat.com>
  Kailang Yang <kailang@realtek.com>
  Kairui Song <kasong@redhat.com>
  Karol Herbst <kherbst@redhat.com>
  Keith Winstein <keithw@cs.stanford.edu>
  Kevin Hilman <khilman@baylibre.com>
  kiyin(尹亮) <kiyin@tencent.com>
  Lee Jones <lee.jones@linaro.org>
  Len Brown <len.brown@intel.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Macpaul Lin <macpaul.lin@mediatek.com>
  Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
  Mark Brown <broonie@kernel.org>
  Mark Deneen <mdeneen@saucontech.com>
  Martin Hundebøll <martin@geanix.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Mateusz Gorski <mateusz.gorski@linux.intel.com>
  Matija Glavinic Pecotic <matija.glavinic-pecotic.ext@nokia.com>
  Maxime Ripard <maxime@cerno.tech>
  Miaohe Lin <linmiaohe@huawei.com>
  Michael Walle <michael@walle.cc>
  Michal Hocko <mhocko@suse.com>
  Michał Mirosław <mirq-linux@rere.qmqm.pl>
  Mika Kuoppala <mika.kuoppala@linux.intel.com>
  Mike Galbraith <efault@gmx.de>
  Ming Lei <ming.lei@redhat.com>
  Nick Desaulniers <ndesaulniers@google.com>
  Oleg Nesterov <oleg@redhat.com>
  Ondřej Jirman <megous@megous.com>
  Pali Rohár <pali@kernel.org>
  Paul E. McKenney <paulmck@kernel.org>
  Peilin Ye <yepeilin.cs@gmail.com>
  Peter Chen <peter.chen@nxp.com>
  Petr Malat <oss@malat.biz>
  Qian Cai <cai@redhat.com>
  Qinglang Miao <miaoqinglang@huawei.com>
  Qiujun Huang <hqjagain@gmail.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Ralph Campbell <rcampbell@nvidia.com>
  Rob Herring <robh@kernel.org>
  Rodrigo Vivi <rodrigo.vivi@intel.com>
  Sami Tolvanen <samitolvanen@google.com>
  Sasha Levin <sashal@kernel.org>
  Scott K Logan <logans@cottsay.net>
  Shannon Nelson <snelson@pensando.io>
  Shijie Luo <luoshijie1@huawei.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Steven Rostedt (VMware) <rostedt@goodmis.org>
  Sukadev Bhattiprolu <sukadev@linux.ibm.com>
  Takashi Iwai <tiwai@suse.de>
  Tejun Heo <tj@kernel.org>
  Thinh Nguyen <Thinh.Nguyen@synopsys.com>
  Thomas Gleixner <tglx@linutronix.de>
  Tianci.Yin <tianci.yin@amd.com>
  Tyrel Datwyler <tyreld@linux.ibm.com>
  Vasily Gorbik <gor@linux.ibm.com>
  Vignesh Raghavendra <vigneshr@ti.com>
  Vinay Kumar Yadav <vinay.yadav@chelsio.com>
  Vincent Whitchurch <vincent.whitchurch@axis.com>
  Vineet Gupta <vgupta@synopsys.com>
  Vladimir Oltean <vladimir.oltean@nxp.com>
  wenxu <wenxu@ucloud.cn>
  Will Deacon <will@kernel.org>
  Xiang Chen <chenxiang66@hisilicon.com>
  YueHaibing <yuehaibing@huawei.com>
  Zhang Qilong <zhangqilong3@huawei.com>
  zhenwei pi <pizhenwei@bytedance.com>
  Ziyi Cao <kernel@septs.pw>
  Zqiang <qiang.zhang@windriver.com>

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
 test-amd64-i386-xl-xsm                                       fail    
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


Not pushing.

(No revision log; it would be 2687 lines long.)

