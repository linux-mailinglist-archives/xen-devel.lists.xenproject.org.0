Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 549B677A177
	for <lists+xen-devel@lfdr.de>; Sat, 12 Aug 2023 19:45:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582910.912903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUsen-0003wq-24; Sat, 12 Aug 2023 17:44:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582910.912903; Sat, 12 Aug 2023 17:44:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUsem-0003ul-VW; Sat, 12 Aug 2023 17:44:08 +0000
Received: by outflank-mailman (input) for mailman id 582910;
 Sat, 12 Aug 2023 17:44:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qUsel-0003ub-B3; Sat, 12 Aug 2023 17:44:07 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qUsel-0004hB-2c; Sat, 12 Aug 2023 17:44:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qUsek-0004eX-N9; Sat, 12 Aug 2023 17:44:06 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qUsek-0007kZ-Ma; Sat, 12 Aug 2023 17:44:06 +0000
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
	bh=vEMw1pVja6Aa4Gm5D8FP9k1GV1x5Y4rqKRAKMuXZZLo=; b=dAJ8iV03h5DVeQtyh2TYFKhE2g
	jLLIuJZFmK9PLQwkmfLUOR5TXmGbDr4z3x4paikic3+uNSh3tZwoNK+fjVx7hlbl2ES3am7qvAq+O
	nGg+MFD/Y9ZVEy0/Sz1xOdu8CgyqZHsnEQI32Acu1YgwRsVpU9yO/Vk00a/aX/3NP1no=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182286-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 182286: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:xen-boot:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-credit1:xen-boot:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:guest-localmigrate/x10:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=190bf7b14b0cf3df19c059061be032bd8994a597
X-Osstest-Versions-That:
    linux=25aa0bebba72b318e71fe205bfd1236550cc9534
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 12 Aug 2023 17:44:06 +0000

flight 182286 linux-linus real [real]
flight 182300 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/182286/
http://logs.test-lab.xenproject.org/osstest/logs/182300/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 8 xen-boot fail pass in 182300-retest
 test-armhf-armhf-xl-credit1   8 xen-boot            fail pass in 182300-retest
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 18 guest-localmigrate/x10 fail pass in 182300-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-credit1 15 migrate-support-check fail in 182300 never pass
 test-armhf-armhf-xl-credit1 16 saverestore-support-check fail in 182300 never pass
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 182266
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 182266
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 182266
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 182266
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 182266
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 182266
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 182266
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 182266
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass

version targeted for testing:
 linux                190bf7b14b0cf3df19c059061be032bd8994a597
baseline version:
 linux                25aa0bebba72b318e71fe205bfd1236550cc9534

Last test of basis   182266  2023-08-10 23:16:26 Z    1 days
Testing same since   182286  2023-08-11 22:14:05 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aleksa Sarai <cyphar@cyphar.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alex Hung <alex.hung@amd.com>
  Alexandre Ghiti <alexghiti@rivosinc.com>
  Amit Pundir <amit.pundir@linaro.org>
  Andrea Parri <parri.andrea@gmail.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andrew Yang <andrew.yang@mediatek.com>
  Arnd Bergmann <arnd@arndb.de>
  August Wikerfors <git@augustwikerfors.se>
  Ayush Jain <ayush.jain3@amd.com>
  Bjorn Helgaas <bhelgaas@google.com>
  Boris Brezillon <boris.brezillon@collabora.com>
  Chengming Zhou <zhouchengming@bytedance.com>
  Christian König <christian.koenig@amd.com>
  Christoph Hellwig <hch@lst.de>
  Colin Ian King <colin.i.king@gmail.com>
  Daniel Stone <daniels@collabora.com>
  Dave Airlie <airlied@redhat.com>
  David Howells <dhowells@redhat.com>
  Dmitry Baryshkov <dmitry.baryshkov@linaro.org> #fix db845c
  Evan Quan <evan.quan@amd.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guangwu Zhang <guazhang@redhat.com>
  Hans de Goede <hdegoede@redhat.com>
  Heiko Stuebner <heiko@sntech.de>
  Helge Deller <deller@gmx.de>
  Igor Mammedov <imammedo@redhat.com>
  Jens Axboe <axboe@kernel.dk>
  Jiri Olsa <jolsa@kernel.org>
  Johan Hovold <johan+linaro@kernel.org>
  Johannes Weiner <hannes@cmpxchg.org>
  John David Anglin <dave.anglin@bell.net>
  Karol Herbst <kherbst@redhat.com>
  Karol Wachowski <karol.wachowski@linux.intel.com>
  Keith Busch <kbusch@kernel.org>
  Kenneth Feng <kenneth.feng@amd.com>
  Krzysztof Wilczyński <kwilczynski@kernel.org>
  Liam R. Howlett <Liam.Howlett@oracle.com>
  Lijo Lazar <lijo.lazar@amd.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Lorenzo Stoakes <lstoakes@gmail.com>
  Lyude Paul <lyude@redhat.com>
  Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
  Mario Limonciello <mario.limonciello@amd.com>
  Maulik Shah <quic_mkshah@quicinc.com>
  Maxime Ripard <mripard@redhat.com>
  Mel Gorman <mgorman@techsingularity.net>
  Melissa Wen <mwen@igalia.com>
  Miaohe Lin <linmiaohe@huawei.com>
  Michael S. Tsirkin <mst@redhat.com>
  Michal Koutný <mkoutny@suse.com>
  Mike Kravetz <mike.kravetz@oracle.com>
  Mike Lothian <mike@fireburn.co.uk>
  Ming Lei <ming.lei@redhat.com>
  Naoya Horiguchi <naoya.horiguchi@nec.com>
  Neil Armstrong <neil.armstrong@linaro.org>
  Nick Desaulniers <ndesaulniers@google.com>
  Palmer Dabbelt <palmer@rivosinc.com>
  Paul E. McKenney <paulmck@kernel.org>
  Petr Tesarik <petr.tesarik.ext@huawei.com>
  Pin-yen Lin <treapking@chromium.org>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Rafael J. Wysocki <rafael@kernel.org>
  Roman Stratiienko <r.stratiienko@gmail.com>
  Ryusuke Konishi <konishi.ryusuke@gmail.com>
  Samuel Holland <samuel.holland@sifive.com>
  SeongJae Park <sj@kernel.org>
  Sergey Senozhatsky <senozhatsky@chromium.org>
  Song Shuai <suagrfillet@gmail.com>
  Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
  Steve French <stfrench@microsoft.com>
  Tejun Heo <tj@kernel.org>
  Thomas Weißschuh <linux@weissschuh.net>
  Tim Huang <Tim.Huang@amd.com>
  Torsten Duwe <duwe@suse.de>
  Ulf Hansson <ulf.hansson@linaro.org>
  Vlastimil Babka <vbabka@suse.cz>
  Will Deacon <will@kernel.org>
  Woody Suwalski <terraluna977@gmail.com>
  Yang Yingliang <yangyingliang@huawei.com>
  Yi Zhang <yi.zhang@redhat.com>

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
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        fail    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 fail    
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
 test-armhf-armhf-xl-credit1                                  fail    
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
   25aa0bebba72..190bf7b14b0c  190bf7b14b0cf3df19c059061be032bd8994a597 -> tested/linux-linus

