Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DC478EF7B
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 16:21:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593977.927138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbiXn-00012w-FN; Thu, 31 Aug 2023 14:21:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593977.927138; Thu, 31 Aug 2023 14:21:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbiXn-0000zs-AK; Thu, 31 Aug 2023 14:21:11 +0000
Received: by outflank-mailman (input) for mailman id 593977;
 Thu, 31 Aug 2023 14:21:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qbiXl-0000xA-VC; Thu, 31 Aug 2023 14:21:09 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qbiXk-0001vh-Uk; Thu, 31 Aug 2023 14:21:09 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qbiXk-0008Ii-8T; Thu, 31 Aug 2023 14:21:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qbiXk-0001vJ-7j; Thu, 31 Aug 2023 14:21:08 +0000
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
	bh=UTl8sexmQfhv+HLSQr2m15Va3JEv0ow2o9gAK7kiANc=; b=KBngBs2P/GKpl7nSlQjs5vBQC/
	TPi2HRopJNt4VO5/fmqwZ0RGlfqpQyeM0MFICQG4lAtIl/toykJnMNY0nWSeIjna/hAvW05e9eIrf
	C7dRcFDym+Dcq0/l7nmcwjOwp/cLcmpsP1x05Un+OrmfIMmPOnQeGomjtEMDsSmxuR4Y=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182575-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 182575: regressions - FAIL
X-Osstest-Failures:
    linux-5.4:test-armhf-armhf-xl-credit1:guest-start/debian.repeat:fail:regression
    linux-5.4:test-armhf-armhf-xl-multivcpu:guest-start/debian.repeat:fail:regression
    linux-5.4:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:guest-start.2:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-multivcpu:guest-start:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-arndale:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-armhf-armhf-xl-rtds:guest-start:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:hosts-allocate:starved:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:hosts-allocate:starved:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:hosts-allocate:starved:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:hosts-allocate:starved:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:hosts-allocate:starved:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:hosts-allocate:starved:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:hosts-allocate:starved:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    linux=5eb967dd50a5a29952ab6e6b1ef4bf216cf1652c
X-Osstest-Versions-That:
    linux=fd2a1d1f32ea37c57a8b46a0857f06fd7274dd2c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 31 Aug 2023 14:21:08 +0000

flight 182575 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182575/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl-credit1 18 guest-start/debian.repeat fail REGR. vs. 182363
 test-armhf-armhf-xl-multivcpu 18 guest-start/debian.repeat fail in 182569 REGR. vs. 182363

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 15 guest-start.2 fail pass in 182569
 test-armhf-armhf-xl-multivcpu 14 guest-start               fail pass in 182569
 test-armhf-armhf-xl-arndale  18 guest-start/debian.repeat  fail pass in 182569

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-rtds     14 guest-start             fail blocked in 182363
 test-armhf-armhf-xl-rtds 18 guest-start/debian.repeat fail in 182569 blocked in 182363
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check fail in 182569 never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check fail in 182569 never pass
 test-armhf-armhf-xl-rtds    15 migrate-support-check fail in 182569 never pass
 test-armhf-armhf-xl-rtds 16 saverestore-support-check fail in 182569 never pass
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 182363
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 182363
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 182363
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 182363
 test-armhf-armhf-xl-credit2  18 guest-start/debian.repeat    fail  like 182363
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 182363
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 182363
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 182363
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 182363
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 182363
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 182363
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 182363
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 182363
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl           3 hosts-allocate           starved in 182569 n/a
 test-arm64-arm64-libvirt-xsm  3 hosts-allocate           starved in 182569 n/a
 test-arm64-arm64-libvirt-raw  3 hosts-allocate           starved in 182569 n/a
 test-arm64-arm64-xl-credit2   3 hosts-allocate           starved in 182569 n/a
 test-arm64-arm64-xl-thunderx  3 hosts-allocate           starved in 182569 n/a
 test-arm64-arm64-xl-xsm       3 hosts-allocate           starved in 182569 n/a
 test-arm64-arm64-xl-vhd       3 hosts-allocate           starved in 182569 n/a
 test-arm64-arm64-xl-credit1   3 hosts-allocate           starved in 182569 n/a

version targeted for testing:
 linux                5eb967dd50a5a29952ab6e6b1ef4bf216cf1652c
baseline version:
 linux                fd2a1d1f32ea37c57a8b46a0857f06fd7274dd2c

Last test of basis   182363  2023-08-16 16:45:54 Z   14 days
Testing same since   182569  2023-08-30 14:44:38 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abel Wu <wuyun.abel@bytedance.com>
  Adrian Hunter <adrian.hunter@intel.com>
  Alan Liu <haoping.liu@amd.com>
  Aleksandr Loktionov <aleksandr.loktionov@intel.com>
  Alessio Igor Bogani <alessio.bogani@elettra.eu>
  Alex Deucher <alexander.deucher@amd.com>
  Alexander Aring <aahringo@redhat.com>
  Alfred Lee <l00g33k@gmail.com>
  Amir Goldstein <amir73il@gmail.com>
  Andreas Gruenbacher <agruenba@redhat.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andrey Skvortsov <andrej.skvortzov@gmail.com>
  Andrii Staikov <andrii.staikov@intel.com>
  Ankit Nautiyal <ankit.k.nautiyal@intel.com>
  Armin Wolf <W_Armin@gmx.de>
  Arnd Bergmann <arnd@arndb.de>
  Arpana Arland <arpanax.arland@intel.com> (A Contingent worker at Intel)
  Atul Dhudase <adhudase@codeaurora.org>
  Benjamin Coddington <bcodding@redhat.com>
  Benjamin Gray <bgray@linux.ibm.com>
  Biju Das <biju.das.jz@bp.renesas.com>
  Bjorn Helgaas <bhelgaas@google.com>
  Chengfeng Ye <dg573847474@gmail.com>
  Christian Brauner <brauner@kernel.org>
  Christian König <christian.koenig@amd.com>
  Christian Marangi <ansuelsmth@gmail.com>
  Chuck Lever <chuck.lever@oracle.com>
  Clayton Yager <Clayton_Yager@selinc.com>
  Colin Ian King <colin.i.king@gmail.com>
  Cosmin Tanislav <cosmin.tanislav@analog.com>
  Cosmin Tanislav <demonsingur@gmail.com>
  Daniel Vetter <daniel.vetter@ffwll.ch>
  Daniel Wheeler <daniel.wheeler@amd.com>
  Dave Kleikamp <dave.kleikamp@oracle.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  David Teigland <teigland@redhat.com>
  dengxiang <dengxiang@nfschina.com>
  Doug Berger <opendmb@gmail.com>
  Eric Dumazet <edumazet@google.com>
  Eyal Birger <eyal.birger@gmail.com>
  Feng Tang <feng.tang@intel.com>
  Florian Fainelli <florian.fainelli@broadcom.com>
  Florian Westphal <fw@strlen.de>
  Fred Eckert <Frede@cmslaser.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Geert Uytterhoeven <geert@linux-m68k.org>
  Georgi Djakov <georgi.djakov@linaro.org>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Gustavo A. R. Silva <gustavoars@kernel.org>
  hackyzh002 <hackyzh002@gmail.com>
  Hangbin Liu <liuhangbin@gmail.com>
  Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Hariprasad Kelam <hkelam@marvell.com>
  Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
  Helge Deller <deller@gmx.de>
  Ido Schimmel <idosch@nvidia.com>
  Igor Mammedov <imammedo@redhat.com>
  Immad Mir <mirimmad17@gmail.com>
  J. Bruce Fields <bfields@redhat.com>
  Jakob Koschel <jakobkoschel@gmail.com>
  Jakub Kicinski <kuba@kernel.org>
  Jamal Hadi Salim <jhs@mojatatu.com>
  Jan Kara <jack@suse.cz>
  Jani Nikula <jani.nikula@intel.com>
  Jason Wang <jasowang@redhat.com>
  Jason Xing <kernelxing@tencent.com>
  Jay Vosburgh <jay.vosburgh@canonical.com>
  Jerome Brunet <jbrunet@baylibre.com>
  Jiaxun Yang <jiaxun.yang@flygoat.com>
  Jiri Kosina <jkosina@suse.cz>
  Joel Savitz <jsavitz@redhat.com>
  Joerg Roedel <jroedel@suse.de>
  Johan Hovold <johan+linaro@kernel.org>
  Jon Hunter <jonathanh@nvidia.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Josip Pavic <Josip.Pavic@amd.com>
  Julian Anastasov <ja@ssi.bg>
  Justin Chen <justin.chen@broadcom.com>
  Kishon Vijay Abraham I <kvijayab@amd.com>
  Krishna Kurapati <quic_kriskura@quicinc.com>
  Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
  Kuniyuki Iwashima <kuniyu@amazon.com>
  Lee Jones <lee@kernel.org>
  Li Jun <jun.li@nxp.com>
  Lin Ma <linma@zju.edu.cn>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Lu Wei <luwei32@huawei.com>
  Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Marc Zyngier <maz@kernel.org>
  Marco Morandini <marco.morandini@polimi.it>
  Marek Vasut <marex@denx.de>
  Mark Brown <broonie@kernel.org>
  Martin K. Petersen <martin.petersen@oracle.com>
  Martin KaFai Lau <martin.lau@kernel.org>
  Masami Hiramatsu (Google) <mhiramat@kernel.org>
  Masami Hiramatsu <mhiramat@kernel.org>
  Matthieu Baerts <matthieu.baerts@tessares.net>
  Matus Gajdos <matuszpd@gmail.com>
  Mauro Carvalho Chehab <mchehab@kernel.org>
  Maximilian Heyne <mheyne@amazon.de>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael S. Tsirkin <mst@redhat.com>
  Michal Koutný <mkoutny@suse.com>
  Michał Mirosław <mirq-linux@rere.qmqm.pl>
  Mike Snitzer <snitzer@kernel.org>
  Mike Snitzer <snitzer@redhat.com>
  Mikulas Patocka <mpatocka@redhat.com>
  Mimi Zohar <zohar@linux.ibm.com>
  Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>
  Nathan Lynch <nathanl@linux.ibm.com>
  Nicolin Chen <nicoleotsuka@gmail.com>
  Nikolay Aleksandrov <razor@blackwall.org>
  Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Abeni <pabeni@redhat.com>
  Paulo Alcantara (SUSE) <pc@manguebit.com>
  Pavle Kotarac <Pavle.Kotarac@amd.com>
  Peter Chen <peter.chen@kernel.org>
  Petr Machata <petrm@nvidia.com>
  Pina Chen <pina.chen@mediatek.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Rafael J. Wysocki <rafael@kernel.org>
  Randy Dunlap <rdunlap@infradead.org>
  Ray Jui <ray.jui@broadcom.com>
  Remi Pommarel <repk@triplefau.lt>
  Rob Clark <robdclark@chromium.org>
  Ruan Jinjie <ruanjinjie@huawei.com>
  Russell Harmon <russ@har.mn>
  Russell Harmon via samba-technical <samba-technical@lists.samba.org>
  Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>
  Sakari Ailus <sakari.ailus@linux.intel.com>
  Sam Ravnborg <sam@ravnborg.org>
  Sandeep Maheswaram <quic_c_sanm@quicinc.com>
  Sasha Levin <sashal@kernel.org>
  Serge Semin <fancer.lancer@gmail.com>
  Sergey Shtylyov <s.shtylyov@omp.ru>
  Shakeel Butt <shakeelb@google.com>
  shanzhulig <shanzhulig@gmail.com>
  Shawn Guo <shawnguo@kernel.org>
  Shengjiu Wang <shengjiu.wang@gmail.com>
  Shengjiu Wang <shengjiu.wang@nxp.com>
  Sherry Sun <sherry.sun@nxp.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Simon Horman <horms@kernel.org>
  Simon Wunderlich <sw@simonwunderlich.de>
  Sishuai Gong <sishuai.system@gmail.com>
  Stefan Wahren <stefan.wahren@i2se.com>
  Steffen Klassert <steffen.klassert@secunet.com>
  Stephen Boyd <sboyd@kernel.org>
  Steve French <stfrench@microsoft.com>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Steven Rostedt (VMware) <rostedt@goodmis.org>
  Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
  Sunil Goutham <sgoutham@marvell.com>
  Sven Eckelmann <sven@narfation.org>
  Taimur Hassan <syed.hassan@amd.com>
  Takashi Iwai <tiwai@suse.de>
  Tang Bin <tangbin@cmss.chinamobile.com>
  Thinh Nguyen <Thinh.Nguyen@synopsys.com>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Thomas Gleixner <tglx@linutronix.de>
  Thomas Zimmermann <tzimmermann@suse.de>
  Tony Lindgren <tony@atomide.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Trond Myklebust <trond.myklebust@hammerspace.com>
  Tuo Li <islituo@gmail.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Victor Nogueira <victor@mojatatu.com>
  Vijay Khemka <vijaykhemka@fb.com>
  Vladimir Oltean <vladimir.oltean@nxp.com>
  Wei Chen <harperchen1110@gmail.com>
  William Breathitt Gray <william.gray@linaro.org>
  Wolfram Sang <wsa+renesas@sang-engineering.com>
  Wolfram Sang <wsa@kernel.org>
  Woody Suwalski <terraluna977@gmail.com>
  Xiaolei Wang <xiaolei.wang@windriver.com>
  xiaoshoukui <xiaoshoukui@gmail.com>
  xiaoshoukui <xiaoshoukui@ruijie.com.cn>
  Xin Long <lucien.xin@gmail.com>
  Xu Yang <xu.yang_2@nxp.com>
  Yang Yingliang <yangyingliang@huawei.com>
  Yangtao Li <frank.li@vivo.com>
  Yangtao Li <tiny.windzz@gmail.com>
  Ye Bin <yebin10@huawei.com>
  Yibin Ding <yibin.ding@unisoc.com>
  Yogesh <yogi.kernel@gmail.com>
  Yuanjun Gong <ruc_gongyuanjun@163.com>
  Yunfei Dong <yunfei.dong@mediatek.com>
  Zhang Shurong <zhang_shurong@foxmail.com>
  Zheng Yejian <zhengyejian1@huawei.com>
  Zhengchao Shao <shaozhengchao@huawei.com>
  Zhengping Jiang <jiangzp@google.com>
  Zhu Wang <wangzhu9@huawei.com>
  Ziyang Xuan <william.xuanziyang@huawei.com>

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
 test-armhf-armhf-xl-arndale                                  fail    
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-i386-examine-bios                                 pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  fail    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        fail    
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

(No revision log; it would be 4971 lines long.)

