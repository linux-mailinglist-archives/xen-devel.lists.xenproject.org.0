Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FF269022D
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 09:31:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492230.761674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ2L1-0007wf-Ap; Thu, 09 Feb 2023 08:31:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492230.761674; Thu, 09 Feb 2023 08:31:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ2L1-0007to-7x; Thu, 09 Feb 2023 08:31:27 +0000
Received: by outflank-mailman (input) for mailman id 492230;
 Thu, 09 Feb 2023 08:31:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pQ2L0-0007te-6u; Thu, 09 Feb 2023 08:31:26 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pQ2L0-00068C-2M; Thu, 09 Feb 2023 08:31:26 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pQ2Kz-0004vl-SO; Thu, 09 Feb 2023 08:31:25 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pQ2Kz-0002Bd-Rt; Thu, 09 Feb 2023 08:31:25 +0000
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
	bh=uz7PrT8gO7+W8w4Tgm69uR9hWN+q3xaxqaVkh+lrhcw=; b=guCW9ZWnv6aDn1AasM0XOJ45BW
	wzoyO9g/TS6c0jB5h7EHuWi35TqGdKvVlz+lPktsTqfKWeAA+E+sPtiSw44ZdS5/gAuNNToUEOI/5
	xFUdyStYRZlXYvXAHDuSSbX6eke8xNrMElWOqSYdae9zfQ6zMKH3oPO2ELhH8M4zWqCQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-176653-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 176653: regressions - trouble: fail/pass/starved
X-Osstest-Failures:
    linux-5.4:test-amd64-amd64-pair:<job status>:broken:regression
    linux-5.4:build-arm64-pvops:kernel-build:fail:regression
    linux-5.4:test-amd64-amd64-pair:host-install/src_host(6):broken:heisenbug
    linux-5.4:test-amd64-i386-libvirt-raw:xen-install:fail:heisenbug
    linux-5.4:test-amd64-i386-qemuu-rhel6hvm-amd:xen-install:fail:heisenbug
    linux-5.4:test-amd64-i386-qemut-rhel6hvm-amd:xen-install:fail:heisenbug
    linux-5.4:test-amd64-i386-xl-vhd:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-amd64-i386-examine:xen-install:fail:heisenbug
    linux-5.4:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:guest-localmigrate/x10:fail:heisenbug
    linux-5.4:test-arm64-arm64-libvirt-raw:guest-start/debian.repeat:fail:heisenbug
    linux-5.4:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    linux-5.4:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    linux-5.4:test-arm64-arm64-examine:build-check(1):blocked:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:build-check(1):blocked:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:build-armhf-libvirt:build-check(1):starved:nonblocking
    linux-5.4:test-armhf-armhf-examine:build-check(1):starved:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:build-check(1):starved:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:build-check(1):starved:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:build-check(1):starved:nonblocking
    linux-5.4:test-armhf-armhf-xl:build-check(1):starved:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:build-check(1):starved:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:build-check(1):starved:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:build-check(1):starved:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:build-check(1):starved:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:build-check(1):starved:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:build-check(1):starved:nonblocking
    linux-5.4:build-armhf:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    linux=59342376e8f0c704299dc7a2c14fed07ffb962e2
X-Osstest-Versions-That:
    linux=90245959a5b936ee013266e5d1e6a508ed69274e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 09 Feb 2023 08:31:25 +0000

flight 176653 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/176653/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-pair           <job status>                 broken  in 176460
 build-arm64-pvops             6 kernel-build   fail in 176438 REGR. vs. 176106

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-pair 6 host-install/src_host(6) broken in 176460 pass in 176653
 test-amd64-i386-libvirt-raw   7 xen-install      fail in 176438 pass in 176653
 test-amd64-i386-qemuu-rhel6hvm-amd 7 xen-install fail in 176460 pass in 176653
 test-amd64-i386-qemut-rhel6hvm-amd 7 xen-install fail in 176460 pass in 176653
 test-amd64-i386-xl-vhd 21 guest-start/debian.repeat fail in 176460 pass in 176653
 test-amd64-i386-examine       6 xen-install                fail pass in 176438
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm 18 guest-localmigrate/x10 fail pass in 176460
 test-arm64-arm64-libvirt-raw 17 guest-start/debian.repeat  fail pass in 176460

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-thunderx  1 build-check(1)           blocked in 176438 n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)           blocked in 176438 n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)           blocked in 176438 n/a
 test-arm64-arm64-xl           1 build-check(1)           blocked in 176438 n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)           blocked in 176438 n/a
 test-arm64-arm64-examine      1 build-check(1)           blocked in 176438 n/a
 test-arm64-arm64-xl-vhd       1 build-check(1)           blocked in 176438 n/a
 test-arm64-arm64-libvirt-raw  1 build-check(1)           blocked in 176438 n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)           blocked in 176438 n/a
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 176106
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 176106
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 176106
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 176106
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 176106
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 176106
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 176106
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 176106
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 176106
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 build-armhf-libvirt           1 build-check(1)               starved  n/a
 test-armhf-armhf-examine      1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt-qcow2  1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               starved  n/a
 test-armhf-armhf-xl           1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-credit1   1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-credit2   1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-cubietruck  1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-multivcpu  1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-rtds      1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-vhd       1 build-check(1)               starved  n/a
 build-armhf                   2 hosts-allocate               starved  n/a

version targeted for testing:
 linux                59342376e8f0c704299dc7a2c14fed07ffb962e2
baseline version:
 linux                90245959a5b936ee013266e5d1e6a508ed69274e

Last test of basis   176106  2023-01-24 20:10:07 Z   15 days
Testing same since   176413  2023-02-06 07:13:34 Z    3 days    4 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Eric W. Biederman" <ebiederm@xmission.com>
  Adrian Hunter <adrian.hunter@intel.com>
  Ajith Nayak <Ajith.Nayak@amd.com>
  Alexander Potapenko <glider@google.com>
  Alexey V. Vissarionov <gremlin@altlinux.org>
  Andrew Halaney <ahalaney@redhat.com> # sa8540p-ride
  Andrew Lunn <andrew@lunn.ch>
  Andrew Morton <akpm@linux-foundation.org>
  Andrey Konovalov <andreyknvl@google.com>
  Archie Pusaka <apusaka@chromium.org>
  Arnd Bergmann <arnd@arndb.de>
  Baoquan He <bhe@redhat.com>
  Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Borislav Petkov (AMD) <bp@alien8.de>
  Chancel Liu <chancel.liu@nxp.com>
  Chen Zhongjin <chenzhongjin@huawei.com>
  Christian Borntraeger <borntraeger@linux.ibm.com>
  Christoph Hellwig <hch@lst.de>
  Chuck Lever <chuck.lever@oracle.com>
  Claudiu Beznea <claudiu.beznea@microchip.com> # on SAMA7G5
  Colin Ian King <colin.i.king@gmail.com>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniel Vetter <daniel.vetter@ffwll.ch>
  Dario Binacchi <dario.binacchi@amarulasolutions.com>
  David Christensen <drc@linux.vnet.ibm.com>
  David Gow <davidgow@google.com>
  David Howells <dhowells@redhat.com>
  David Morley <morleyd@google.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Dean Luick <dean.luick@cornelisnetworks.com>
  Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Don Brace <don.brace@microchip.com>
  Dongliang Mu <mudongliangabcd@gmail.com>
  Eric Biggers <ebiggers@google.com>
  Eric Dumazet <edumazet@google.com>
  Eric W. Biederman <ebiederm@xmission.com>
  Esina Ekaterina <eesina@astralinux.ru>
  Fabio Estevam <festevam@denx.de>
  Fabio Estevam <festevam@gmail.com>
  Fedor Pchelkin <pchelkin@ispras.ru>
  Florian Fainelli <f.fainelli@gmail.com>
  Florian Westphal <fw@strlen.de>
  Gaosheng Cui <cuigaosheng1@huawei.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Giulio Benetti <giulio.benetti@benettiengineering.com>
  Gong, Sishuai <sishuai@purdue.edu>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Haibo Chen <haibo.chen@nxp.com>
  Hans de Goede <hdegoede@redhat.com>
  Hao Sun <sunhao.th@gmail.com>
  Heiko Carstens <hca@linux.ibm.com>
  Heiner Kallweit <hkallweit1@gmail.com>
  Hendrik Borghorst <hborghor@amazon.de>
  Henriette Hofmeier <henriette.hofmeier@rub.de>
  Hui Wang <hui.wang@canonical.com>
  Hulk Robot <hulkrobot@huawei.com>
  Ian Rogers <irogers@google.com>
  Ingo Molnar <mingo@kernel.org>
  Jakub Kicinski <kuba@kernel.org>
  Jakub Sitnicki <jakub@cloudflare.com>
  Jan Kara <jack@suse.cz>
  Jann Horn <jannh@google.com>
  Jason Xing <kernelxing@tencent.com>
  Jens Axboe <axboe@kernel.dk>
  Jerome Brunet <jbrunet@baylibre.com>
  Jiasheng Jiang <jiasheng@iscas.ac.cn>
  Jiri Kosina <jkosina@suse.cz>
  Jisoo Jang <jisoo.jang@yonsei.ac.kr>
  Joel Fernandes (Google) <joel@joelfernandes.org>
  Joel Savitz <jsavitz@redhat.com>
  Kalle Valo <kvalo@kernel.org>
  Kees Cook <keescook@chromium.org>
  Kim Phillips <kim.phillips@amd.com>
  Koba Ko <koba.ko@canonical.com>
  Krishna Kurapati <quic_kriskura@quicinc.com>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Kuniyuki Iwashima <kuniyu@amazon.com>
  Leon Romanovsky <leon@kernel.org>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Liu Shixin <liushixin2@huawei.com>
  Luis Chamberlain <mcgrof@kernel.org>
  Luis Gerhorst <gerhorst@cs.fau.de>
  Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
  Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
  Marek Szyprowski <m.szyprowski@samsung.com>
  Marek Vasut <marex@denx.de>
  Mark Brown <broonie@kernel.org>
  Mark Rutland <mark.rutland@arm.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Martin Wilck <mwilck@suse.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Mateusz Guzik <mjguzik@gmail.com>
  Mathias Nyman <mathias.nyman@linux.intel.com>
  Matthias Kaehlcke <mka@chromium.org>
  Miaoqian Lin <linmq006@gmail.com>
  Michael Klein <m.klein@mvz-labor-lb.de>
  Mikulas Patocka <mpatocka@redhat.com>
  Miles Chen <miles.chen@mediatek.com>
  Natalia Petrova <n.petrova@fintech.ru>
  Nathan Chancellor <nathan@kernel.org>
  Neal Cardwell <ncardwell@google.com>
  Nicholas Piggin <npiggin@gmail.com> # powerpc
  Niklas Schnelle <schnelle@linux.ibm.com>
  Nikos Tsironis <ntsironis@arrikto.com>
  Ovidiu Panait <ovidiu.panait@eng.windriver.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Abeni <pabeni@redhat.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Patrick Thompson <ptf@google.com>
  Peter Chen <peter.chen@nxp.com>
  Peter Korsgaard <peter@korsgaard.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Peter Zijlstra <peterz@infradead.org>
  Petr Pavlu <petr.pavlu@suse.com>
  Pietro Borrello <borrello@diag.uniroma1.it>
  Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Raju Rangoju <Raju.Rangoju@amd.com>
  Rakesh Sankaranarayanan <rakesh.sankaranarayanan@microchip.com>
  Randy Dunlap <rdunlap@infradead.org>
  Robert Hancock <robert.hancock@calian.com>
  Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
  Saeed Mahameed <saeedm@nvidia.com>
  Sasha Levin <sashal@kernel.org>
  Shang XiaoJing <shangxiaojing@huawei.com>
  Shawn Guo <shawnguo@kernel.org>
  Shengjiu Wang <shengjiu.wang@gmail.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
  Sishuai Gong <sishuai@purdue.edu>
  Soenke Huster <soenke.huster@eknoes.de>
  Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
  Sriram Yagnaraman <sriram.yagnaraman@est.tech>
  Stanislav Fomichev <sdf@google.com>
  Steev Klimaszewski <steev@kali.org> # Thinkpad X13s
  Stephen Boyd <sboyd@kernel.org>
  Steve French <stfrench@microsoft.com>
  Steven Price <steven.price@arm.com>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Sudheesh Mavila <sudheesh.mavila@amd.com>
  Sumit Gupta <sumitg@nvidia.com>
  Swati Agarwal <swati.agarwal@xilinx.com>
  Szymon Heidrich <szymon.heidrich@gmail.com>
  Tejun Heo <tj@kernel.org>
  Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
  Thomas Gleixner <tglx@linutronix.de>
  Tiezhu Yang <yangtiezhu@loongson.cn>
  Tim Harvey <tharvey@gateworks.com>
  Tom Talpey <tom@talpey.com>
  Tony Luck <tony.luck@intel.com> # ia64
  Trond Myklebust <trond.myklebust@hammerspace.com>
  Tudor Ambarus <tudor.ambarus@linaro.org>
  Udipto Goswami <quic_ugoswami@quicinc.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Vinod Koul <vkoul@kernel.org>
  Viresh Kumar <viresh.kumar@linaro.org>
  Will Deacon <will@kernel.org> # arm64
  Xiang Chen <chenxiang66@hisilicon.com>
  Xiaoming Ni <nixiaoming@huawei.com>
  Yang Yingliang <yangyingliang@huawei.com>
  Yihang Li <liyihang9@huawei.com>
  Yonatan Nachum <ynachum@amazon.com>
  Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Yu Kuai <yukuai3@huawei.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  starved 
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          starved 
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          starved 
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  fail    
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
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-i386-examine-bios                                 pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  starved 
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  starved 
 test-armhf-armhf-xl-cubietruck                               starved 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     starved 
 test-amd64-i386-examine                                      fail    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     starved 
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                starved 
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               starved 
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 fail    
 test-armhf-armhf-libvirt-raw                                 starved 
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     starved 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-i386-examine-uefi                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      starved 
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

broken-job test-amd64-amd64-pair broken

Not pushing.

(No revision log; it would be 4165 lines long.)

