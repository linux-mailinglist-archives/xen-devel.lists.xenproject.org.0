Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C6D6486B3
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 17:45:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.458091.715958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3gTk-00027n-6V; Fri, 09 Dec 2022 16:44:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 458091.715958; Fri, 09 Dec 2022 16:44:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3gTk-00025G-2y; Fri, 09 Dec 2022 16:44:04 +0000
Received: by outflank-mailman (input) for mailman id 458091;
 Fri, 09 Dec 2022 16:44:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p3gTi-000256-MC; Fri, 09 Dec 2022 16:44:02 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p3gTi-0007CM-Jc; Fri, 09 Dec 2022 16:44:02 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p3gTi-0001JM-7j; Fri, 09 Dec 2022 16:44:02 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p3gTi-0007vl-7G; Fri, 09 Dec 2022 16:44:02 +0000
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
	bh=ivoM9NKBlGO1cCCUaCqYUh8UI+qLJRLFESAs+9UYL0Q=; b=Vbe0zPjTLknDsXLJc4dioy2Slk
	TW12ZIW3jTiVmSvjqZFLKEb7LdeiVuQTvtFlUaXd89LsqH3gH1QaJdTnFpphYAEHCiCXKs7WW5ivS
	3co96oOIQUvF7t6I/tbruqvjXhLbWkXmiYShzcHXhEdGqIMtYDSozmbSUZ6nxEbM3wuY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175106-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 175106: regressions - FAIL
X-Osstest-Failures:
    linux-5.4:test-armhf-armhf-xl-multivcpu:guest-start/debian.repeat:fail:regression
    linux-5.4:test-armhf-armhf-xl-rtds:guest-start:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-vhd:guest-start:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-credit2:guest-start:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-multivcpu:guest-start:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:allowable
    linux-5.4:test-armhf-armhf-xl-credit1:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:guest-start:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=316cdfc48d4db2c425370ef8575dd7d81283515d
X-Osstest-Versions-That:
    linux=4d2a309b5c28a2edc0900542d22fec3a5a22243b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 09 Dec 2022 16:44:02 +0000

flight 175106 linux-5.4 real [real]
flight 175127 linux-5.4 real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/175106/
http://logs.test-lab.xenproject.org/osstest/logs/175127/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl-multivcpu 18 guest-start/debian.repeat fail in 175092 REGR. vs. 174962

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-xl-rtds     14 guest-start      fail in 175092 pass in 175106
 test-armhf-armhf-xl 18 guest-start/debian.repeat fail in 175092 pass in 175106
 test-armhf-armhf-xl-vhd      13 guest-start      fail in 175092 pass in 175106
 test-armhf-armhf-xl-credit2  14 guest-start      fail in 175092 pass in 175106
 test-armhf-armhf-xl-multivcpu 14 guest-start               fail pass in 175092

Regressions which are regarded as allowable (not blocking):
 test-armhf-armhf-xl-rtds    18 guest-start/debian.repeat fail REGR. vs. 174962

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-credit1 18 guest-start/debian.repeat fail blocked in 174962
 test-armhf-armhf-xl-credit1  14 guest-start         fail in 175092 like 174962
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check fail in 175092 never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check fail in 175092 never pass
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 174962
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 174962
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 174962
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 174962
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 174962
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 174962
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 174962
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 174962
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 174962
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 174962
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 174962
 test-armhf-armhf-xl-credit2  18 guest-start/debian.repeat    fail  like 174962
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 174962
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                316cdfc48d4db2c425370ef8575dd7d81283515d
baseline version:
 linux                4d2a309b5c28a2edc0900542d22fec3a5a22243b

Last test of basis   174962  2022-11-25 17:13:53 Z   13 days
Testing same since   175092  2022-12-08 10:44:18 Z    1 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Adrian Hunter <adrian.hunter@intel.com>
  Al Viro <viro@zeniv.linux.org.uk>
  Alejandro Concepcion-Rodriguez <asconcepcion@acoro.eu>
  Alejandro Concepción Rodríguez <asconcepcion@acoro.eu>
  Alessandro Astone <ales.astone@gmail.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alexander Gordeev <agordeev@linux.ibm.com>
  Alexandre Belloni <alexandre.belloni@bootlin.com>
  Allen Pais <apais@linux.microsoft.com>
  Aman Dhoot <amandhoot12@gmail.com>
  Anand Jain <anand.jain@oracle.com>
  Andreas Kemnade <andreas@kemnade.info>
  Andrew Davis <afd@ti.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andrii Nakryiko <andrii@kernel.org>
  Andrzej Hajda <andrzej.hajda@intel.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Arnd Bergmann <arnd@arndb.de>
  Bjørn Mork <bjorn@mork.no>
  Borislav Petkov (AMD) <bp@alien8.de>
  Borislav Petkov <bp@suse.de>
  Brian Norris <briannorris@chromium.org>
  Carlos Llamas <cmllamas@google.com>
  Catalin Marinas <catalin.marinas@arm.com>
  Chen Zhongjin <chenzhongjin@huawei.com>
  ChenXiaoSong <chenxiaosong2@huawei.com>
  Christian Brauner <christian.brauner@ubuntu.com>
  Christian König <christian.koenig@amd.com>
  Christian Loehle <cloehle@hyperstone.com>
  Christian Löhle <CLoehle@hyperstone.com>
  Christoph Hellwig <hch@lst.de>
  Claudio Suarez <cssk@net-c.es>
  Claudiu Beznea <claudiu.beznea@microchip.com>
  Conor Dooley <conor.dooley@microchip.com>
  Daniel Vetter <daniel.vetter@ffwll.ch>
  Dave Hansen <dave.hansen@linux.intel.com>
  David Ahern <dsahern@kernel.org>
  David Howells <dhowells@redhat.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Detlev Casanova <detlev.casanova@collabora.com>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Dominik Haller <d.haller@phytec.de>
  Dominique Martinet <asmadeus@codewreck.org>
  Duoming Zhou <duoming@zju.edu.cn>
  Enrico Sau <enrico.sau@gmail.com>
  Eric Dumazet <edumazet@google.com>
  Fabio Estevam <festevam@gmail.com>
  Felix Kuehling <Felix.Kuehling@amd.com>
  Florian Fainelli <f.fainelli@gmail.com>
  Frieder Schrempf <frieder.schrempf@kontron.de>
  Gaosheng Cui <cuigaosheng1@huawei.com>
  Gleb Mazovetskiy <glex.spb@gmail.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guantao Liu <guantaol@google.com>
  Guenter Roeck <linux@roeck-us.net>
  Haibo Chen <haibo.chen@nxp.com>
  Hans de Goede <hdegoede@redhat.com>
  Hans Verkuil <hverkuil@xs4all.nl>
  Heiko Carstens <hca@linux.ibm.com>
  Heiko Stuebner <heiko@sntech.de>
  Helge Deller <deller@gmx.de>
  Herbert Xu <herbert@gondor.apana.org.au>
  Hugh Dickins <hughd@google.com>
  Hulk Robot <hulkrobot@huawei.com>
  Ido Schimmel <idosch@nvidia.com>
  Ilya Dryomov <idryomov@gmail.com>
  Jaco Coetzee <jaco.coetzee@corigine.com>
  Jakob Unterwurzacher <jakob.unterwurzacher@theobroma-systems.com>
  Jakub Kicinski <kuba@kernel.org>
  James Morse <james.morse@arm.com>
  Jan Dabros <jsd@semihalf.com>
  Jann Horn <jannh@google.com>
  Jason A. Donenfeld <Jason@zx2c4.com>
  Jens Axboe <axboe@kernel.dk>
  Jens Wiklander <jens.wiklander@linaro.org>
  Jernej Skrabec <jernej.skrabec@gmail.com>
  Jerry Ray <jerry.ray@microchip.com>
  Joanne Koong <joannelkoong@gmail.com>
  Joerg Roedel <jroedel@suse.de>
  Johannes Berg <johannes.berg@intel.com>
  Jon Hunter <jonathanh@nvidia.com>
  Jon Maloy <jmaloy@redhat.com>
  Jonas Gorski <jonas.gorski@gmail.com>
  Jonas Jelonek <jelonek.jonas@gmail.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Josef Bacik <josef@toxicpanda.com>
  Josh Poimboeuf <jpoimboe@kernel.org>
  Juergen Gross <jgross@suse.com>
  Kai-Heng Feng <kai.heng.feng@canonical.com>
  Keith Busch <kbusch@kernel.org>
  Kuniyuki Iwashima <kuniyu@amazon.com>
  Lars-Peter Clausen <lars@metafoo.de>
  Lee Jones <lee@kernel.org>
  Leon Romanovsky <leonro@nvidia.com>
  Lin Ma <linma@zju.edu.cn>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Liu Shixin <liushixin2@huawei.com>
  Lu Baolu <baolu.lu@linux.intel.com>
  Luben Tuikov <luben.tuikov@amd.com>
  Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Lukas Wunner <lukas@wunner.de>
  Lyude Paul <lyude@redhat.com>
  Marc Dionne <marc.dionne@auristor.com>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Marek Szyprowski <m.szyprowski@samsung.com>
  Marek Vasut <marex@denx.de>
  Mark Brown <broonie@kernel.org>
  Martin Faltesek <mfaltesek@google.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Masahiro Yamada <yamada.masahiro@socionext.com>
  Masami Hiramatsu (Google) <mhiramat@kernel.org>
  Matt Ranostay <matt.ranostay@konsulko.com>
  Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
  Mauro Carvalho Chehab <mchehab@kernel.org>
  Maxim Korotkov <korotkov.maxim.s@gmail.com>
  Michael Grzeschik <m.grzeschik@pengutronix.de>
  Michael Kelley <mikelley@microsoft.com>
  Mika Westerberg <mika.westerberg@linux.intel.com>
  Mike Snitzer <snitzer@kernel.org>
  Miklos Szeredi <mszeredi@redhat.com>
  Mikulas Patocka <mpatocka@redhat.com>
  Mitja Spes <mitja@lxnav.com>
  Moshe Shemesh <moshe@nvidia.com>
  Mukesh Ojha <quic_mojha@quicinc.com>
  Nathan Chancellor <nathan@kernel.org>
  Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
  Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
  Nikolay Aleksandrov <razor@blackwall.org>
  Nikolay Borisov <nborisov@suse.com>
  Ovidiu Panait <ovidiu.panait@windriver.com>
  Palmer Dabbelt <palmer@rivosinc.com>
  Paolo Abeni <pabeni@redhat.com>
  Patrick Rudolph <patrick.rudolph@9elements.com>
  Paul Gazzillo <paul@pgazz.com>
  Paul Moore <paul@paul-moore.com>
  Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
  Peter Kosyh <pkosyh@yandex.ru>
  Peter Oberparleiter <oberpar@linux.ibm.com>
  Peter Zijlstra <peterz@infradead.org>
  Phil Auld <pauld@redhat.com>
  Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
  Quentin Schulz <quentin.schulz@theobroma-systems.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Randy Dunlap <rdunlap@infradead.org>
  Randy Dunlap <rdunlap@infradead.org> # build-tested
  Rishabh Bhatnagar <risbhat@amazon.com>
  Rob Herring <robh@kernel.org>
  Roi Dayan <roid@nvidia.com>
  Roman Penyaev <rpenyaev@suse.de>
  ruanjinjie <ruanjinjie@huawei.com>
  Ryusuke Konishi <konishi.ryusuke@gmail.com>
  Saeed Mahameed <saeedm@nvidia.com>
  Samuel Holland <samuel@sholland.org>
  Sasha Levin <sashal@kernel.org>
  Sean Nyekjaer <sean@geanix.com>
  Sebastian Falbesoner <sebastian.falbesoner@gmail.com>
  Sergey Senozhatsky <senozhatsky@chromium.org>
  Shawn Guo <shawnguo@kernel.org>
  Shigeru Yoshida <syoshida@redhat.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Simon Horman <simon.horman@corigine.com>
  Simon Ser <contact@emersion.fr>
  Soheil Hassas Yeganeh <soheil@google.com>
  Srikar Dronamraju <srikar@linux.vnet.ibm.com>
  Stefan Haberland <sth@linux.ibm.com>
  Steffen Klassert <steffen.klassert@secunet.com>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
  taozhang <taozhang@bestechnic.com>
  Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
  Thinh Nguyen <Thinh.Nguyen@synopsys.com>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Thomas Gleixner <tglx@linutronix.de>
  Tiezhu Yang <yangtiezhu@loongson.cn>
  Todd Kjos <tkjos@google.com>
  Tony Lindgren <tony@atomide.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Vlastimil Babka <vbabka@suse.cz>
  Wang Hai <wanghai38@huawei.com>
  Wei Liu <wei.liu@kernel.org>
  Wei Yongjun <weiyongjun1@huawei.com>
  Wenchao Chen <wenchao.chen@unisoc.com>
  Willem de Bruijn <willemb@google.com>
  Xin Long <lucien.xin@gmail.com>
  Xiongfeng Wang <wangxiongfeng2@huawei.com>
  Xiubo Li <xiubli@redhat.com>
  Yang Yingliang <yangyingliang@huawei.com>
  Ye Bin <yebin10@huawei.com>
  Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Yu Kuai <yukuai3@huawei.com>
  Yu Liao <liaoyu15@huawei.com>
  Yuan Can <yuancan@huawei.com>
  YueHaibing <yuehaibing@huawei.com>
  Yuri Karpov <YKarpov@ispras.ru>
  Zeng Heng <zengheng4@huawei.com>
  Zhang Changzhong <zhangchangzhong@huawei.com>
  ZhangPeng <zhangpeng362@huawei.com>
  Zhen Lei <thunder.leizhen@huawei.com>
  Zheng Yongjun <zhengyongjun3@huawei.com>
  Zhengchao Shao <shaozhengchao@huawei.com>

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
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  pass    
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


Not pushing.

(No revision log; it would be 4985 lines long.)

