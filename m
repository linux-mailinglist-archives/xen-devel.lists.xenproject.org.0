Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D26C4559776
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 12:15:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355436.583095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4gKm-0002A0-6H; Fri, 24 Jun 2022 10:14:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355436.583095; Fri, 24 Jun 2022 10:14:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4gKm-00027g-39; Fri, 24 Jun 2022 10:14:40 +0000
Received: by outflank-mailman (input) for mailman id 355436;
 Fri, 24 Jun 2022 10:14:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o4gKj-00027U-QG; Fri, 24 Jun 2022 10:14:37 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o4gKj-0003H8-MM; Fri, 24 Jun 2022 10:14:37 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o4gKj-0003Of-7G; Fri, 24 Jun 2022 10:14:37 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1o4gKj-0006VN-6m; Fri, 24 Jun 2022 10:14:37 +0000
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
	bh=t7I2SDmmxiG6OTYI3Ytixl0rcGMROxhfKTQjJ1Xn7c8=; b=P0KjzMosGyb+BcX+w3s9vK5W9j
	gmaxI2mLUdNwTi7JrTqhCA9i9zAG5J96npymsqR9NPK4UOtFTz1EnqG3IeJkBMyAPqvMa+wDIViBC
	J1FyvAh0YccX6XZWjYbA3EXw3pM3F9AJ4taPzATTYBiMD8fvRqTHuDSXvgXnlLkzpq0w=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171337-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 171337: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-dom0pvh-xl-intel:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-freebsd11-amd64:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-pygrub:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-dom0pvh-xl-amd:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-qemuu-nested-amd:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-ovmf-amd64:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-xsm:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-credit1:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-libvirt-qcow2:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-shadow:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-libvirt:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-credit2:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-multivcpu:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-vhd:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-qemuu-nested-intel:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-libvirt-raw:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-libvirt-pair:xen-boot/src_host:fail:regression
    linux-linus:test-amd64-amd64-libvirt-pair:xen-boot/dst_host:fail:regression
    linux-linus:test-amd64-amd64-pair:xen-boot/src_host:fail:regression
    linux-linus:test-amd64-amd64-pair:xen-boot/dst_host:fail:regression
    linux-linus:test-amd64-amd64-libvirt-xsm:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-freebsd12-amd64:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-pvshim:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-xl-pvhv2-amd:xen-boot:fail:regression
    linux-linus:test-amd64-amd64-examine:reboot:fail:regression
    linux-linus:test-amd64-amd64-examine-uefi:reboot:fail:regression
    linux-linus:test-amd64-amd64-examine-bios:reboot:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-amd64:xen-boot:fail:regression
    linux-linus:test-amd64-coresched-amd64-xl:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-xl-credit2:xen-boot:fail:regression
    linux-linus:build-arm64:xen-build:fail:regression
    linux-linus:test-amd64-amd64-xl-pvhv2-intel:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-libvirt:guest-start/debian.repeat:fail:regression
    linux-linus:test-amd64-amd64-xl-rtds:xen-boot:fail:allowable
    linux-linus:test-arm64-arm64-examine:build-check(1):blocked:nonblocking
    linux-linus:build-arm64-libvirt:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=92f20ff72066d8d7e2ffb655c2236259ac9d1c5d
X-Osstest-Versions-That:
    linux=354c6e071be986a44b956f7b57f1884244431048
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 24 Jun 2022 10:14:37 +0000

flight 171337 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171337/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-dom0pvh-xl-intel  8 xen-boot            fail REGR. vs. 171277
 test-amd64-amd64-xl-qemuu-ws16-amd64  8 xen-boot         fail REGR. vs. 171277
 test-amd64-amd64-xl-qemut-win7-amd64  8 xen-boot         fail REGR. vs. 171277
 test-amd64-amd64-freebsd11-amd64  8 xen-boot             fail REGR. vs. 171277
 test-amd64-amd64-pygrub       8 xen-boot                 fail REGR. vs. 171277
 test-amd64-amd64-dom0pvh-xl-amd  8 xen-boot              fail REGR. vs. 171277
 test-amd64-amd64-qemuu-nested-amd  8 xen-boot            fail REGR. vs. 171277
 test-amd64-amd64-xl-qemuu-win7-amd64  8 xen-boot         fail REGR. vs. 171277
 test-amd64-amd64-xl-qemut-ws16-amd64  8 xen-boot         fail REGR. vs. 171277
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm  8 xen-boot fail REGR. vs. 171277
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm  8 xen-boot fail REGR. vs. 171277
 test-amd64-amd64-xl-qemuu-ovmf-amd64  8 xen-boot         fail REGR. vs. 171277
 test-amd64-amd64-xl-xsm       8 xen-boot                 fail REGR. vs. 171277
 test-amd64-amd64-xl           8 xen-boot                 fail REGR. vs. 171277
 test-amd64-amd64-xl-credit1   8 xen-boot                 fail REGR. vs. 171277
 test-amd64-amd64-libvirt-qcow2  8 xen-boot               fail REGR. vs. 171277
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow 8 xen-boot fail REGR. vs. 171277
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 8 xen-boot fail REGR. vs. 171277
 test-amd64-amd64-xl-shadow    8 xen-boot                 fail REGR. vs. 171277
 test-amd64-amd64-libvirt      8 xen-boot                 fail REGR. vs. 171277
 test-amd64-amd64-xl-credit2   8 xen-boot                 fail REGR. vs. 171277
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 8 xen-boot fail REGR. vs. 171277
 test-amd64-amd64-xl-multivcpu  8 xen-boot                fail REGR. vs. 171277
 test-amd64-amd64-xl-vhd       8 xen-boot                 fail REGR. vs. 171277
 test-amd64-amd64-qemuu-nested-intel  8 xen-boot          fail REGR. vs. 171277
 test-amd64-amd64-libvirt-raw  8 xen-boot                 fail REGR. vs. 171277
 test-amd64-amd64-libvirt-pair 12 xen-boot/src_host       fail REGR. vs. 171277
 test-amd64-amd64-libvirt-pair 13 xen-boot/dst_host       fail REGR. vs. 171277
 test-amd64-amd64-pair        12 xen-boot/src_host        fail REGR. vs. 171277
 test-amd64-amd64-pair        13 xen-boot/dst_host        fail REGR. vs. 171277
 test-amd64-amd64-libvirt-xsm  8 xen-boot                 fail REGR. vs. 171277
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 8 xen-boot fail REGR. vs. 171277
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  8 xen-boot    fail REGR. vs. 171277
 test-amd64-amd64-freebsd12-amd64  8 xen-boot             fail REGR. vs. 171277
 test-amd64-amd64-xl-pvshim    8 xen-boot                 fail REGR. vs. 171277
 test-amd64-amd64-xl-pvhv2-amd  8 xen-boot                fail REGR. vs. 171277
 test-amd64-amd64-examine      8 reboot                   fail REGR. vs. 171277
 test-amd64-amd64-examine-uefi  8 reboot                  fail REGR. vs. 171277
 test-amd64-amd64-examine-bios  8 reboot                  fail REGR. vs. 171277
 test-amd64-amd64-xl-qemut-debianhvm-amd64  8 xen-boot    fail REGR. vs. 171277
 test-amd64-coresched-amd64-xl  8 xen-boot                fail REGR. vs. 171277
 test-armhf-armhf-xl-credit2   8 xen-boot                 fail REGR. vs. 171277
 build-arm64                   6 xen-build                fail REGR. vs. 171277
 test-amd64-amd64-xl-pvhv2-intel  8 xen-boot              fail REGR. vs. 171277
 test-armhf-armhf-libvirt    18 guest-start/debian.repeat fail REGR. vs. 171277

Regressions which are regarded as allowable (not blocking):
 test-amd64-amd64-xl-rtds      8 xen-boot                 fail REGR. vs. 171277

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-examine      1 build-check(1)               blocked  n/a
 build-arm64-libvirt           1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-seattle   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-vhd       1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 171277
 test-armhf-armhf-xl-rtds     18 guest-start/debian.repeat    fail  like 171277
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 171277
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 171277
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 linux                92f20ff72066d8d7e2ffb655c2236259ac9d1c5d
baseline version:
 linux                354c6e071be986a44b956f7b57f1884244431048

Last test of basis   171277  2022-06-19 03:11:35 Z    5 days
Failing since        171280  2022-06-19 15:12:25 Z    4 days   14 attempts
Testing same since   171337  2022-06-23 22:42:50 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
  Alexander Usyskin <alexander.usyskin@intel.com>
  Alexei Starovoitov <ast@kernel.org>
  Ali Saidi <alisaidi@amazon.com>
  Alistair Popple <apopple@nvidia.com>
  Anatolii Gerasymenko <anatolii.gerasymenko@intel.com>
  Andrii Nakryiko <andrii@kernel.org>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Antoine Tenart <atenart@kernel.org>
  Ard Biesheuvel <ardb@kernel.org>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Arnd Bergmann <arnd@arndb.de>
  Athira Jajeev <atrajeev@linux.vnet.ibm.com>
  Athira Rajeev <atrajeev@linux.vnet.ibm.com>
  Bart Van Assche <bvanassche@acm.org>
  Brian Foster <bfoster@redhat.com>
  Carlos Llamas <cmllamas@google.com>
  Chevron Li <chevron.li@bayhubtech.com>
  Chevron Li<chevron.li@bayhubtech.com>
  Christian Marangi <ansuelsmth@gmail.com>
  Christian Schoenebeck <linux_oss@crudebyte.com>
  Christoph Lameter <cl@linux.com>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Ciara Loftus <ciara.loftus@intel.com>
  Claudiu Manoil <claudiu.manoil@nxp.com>
  Curtis Taylor <cutaylor-pub@yahoo.com>
  Damien Le Moal <damien.lemoal@opensource.wdc.com>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniil Dementev <d.dementev@ispras.ru>
  Darrick J. Wong <djwong@kernel.org>
  Dave Hansen <dave.hansen@linux.intel.com>
  David Howells <dhowells@redhat.com>
  David Rientjes <rientjes@google.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Ding Xiang <dingxiang@cmss.chinamobile.com>
  Dmitry Osipenko <dmitry.osipenko@collabora.com>
  Dominique Martinet <asmadeus@codewreck.org>
  Douglas Gilbert <dgilbert@interlog.com>
  Eelco Chaudron <echaudro@redhat.com>
  Eric Dumazet <edumazet@google.com>
  Evgeniy Baskov <baskov@ispras.ru>
  Filipe Manana <fdmanana@suse.com>
  Florian Westphal <fw@strlen.de>
  Gautam Menghani <gautammenghani201@gmail.com>
  Genjian Zhang <zhanggenjian@kylinos.cn>
  Gerd Hoffmann <kraxel@redhat.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Gurucharan <gurucharanx.g@intel.com> (A Contingent worker at Intel)
  Hoang Le <hoang.h.le@dektech.com.au>
  huhai <huhai@kylinos.cn>
  Hyeonggon Yoo <42.hyeyoo@gmail.com>
  Ian Abbott <abbotti@mev.co.uk>
  Ian Rogers <irogers@google.com>
  Ivan Vecera <ivecera@redhat.com>
  Jakub Kicinski <kuba@kernel.org>
  Jakub Sitnicki <jakub@cloudflare.com>
  Jamie Iles <jamie@jamieiles.com>
  Jann Horn <jannh@google.com>
  Jarkko Nikula <jarkko.nikula@linux.intel.com>
  Jason A. Donenfeld <Jason@zx2c4.com>
  Jason Wang <jasowang@redhat.com>
  Javier Martinez Canillas <javierm@redhat.com>
  Jay Vosburgh <jay.vosburgh@canonical.com>
  Jesper Dangaard Brouer <brouer@redhat.com>
  Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
  Jiasheng Jiang <jiasheng@iscas.ac.cn>
  Jiaxun Yang <jiaxun.yang@flygoat.com>
  Jie2x Zhou <jie2x.zhou@intel.com>
  Jing-Ting Wu <jing-ting.wu@mediatek.com>
  Jiri Olsa <jolsa@kernel.org>
  Joe Damato <jdamato@fastly.com>
  Joel Savitz <jsavitz@redhat.com>
  John Fastabend <john.fastabend@gmail.com>
  Jon Maloy <jmaloy@redhat.com>
  Jon Maxwell <jmaxwell37@gmail.com>
  Jonathan Lemon <jonathan.lemon@gmail.com>
  Jonathan Toppins <jtoppins@redhat.com>
  Josh Poimboeuf <jpoimboe@kernel.org>
  Kai Vehmanen <kai.vehmanen@linux.intel.com>
  Kai-Heng Feng <kai.heng.feng@canonical.com>
  Kailang Yang <kailang@realtek.com>
  Kees Cook <keescook@chromium.org>
  Ken Moffat <zarniwhoop@ntlworld.com>
  Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
  Kumar Kartikeya Dwivedi <memxor@gmail.com>
  Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
  Leo Yan <leo.yan@linaro.org>
  Liang He <windhl@126.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Liu Ying <victor.liu@nxp.com>
  Lorenzo Bianconi <lorenzo@kernel.org>
  Lukas Bulwahn <lukas.bulwahn@gmail.com>
  Lukas Wunner <lukas@wunner.de>
  Maciej Fijalkowski <maciej.fijalkowski@intel.com>
  Magnus Karlsson <magnus.karlsson@intel.com>
  Marc Dionne <marc.dionne@auristor.com>
  Marc Zyngier <maz@kernel.org>
  Marcin Szycik <marcin.szycik@linux.intel.com>
  Mark Brown <broonie@kernel.org>
  Martin K. Petersen <martin.petersen@oracle.com>
  Masami Hiramatsu (Google) <mhiramat@kernel.org>
  Matthew Wilcox (Oracle) <willy@infradead.org>
  Mengqi Zhang <mengqi.zhang@mediatek.com>
  Miaoqian Lin <linmq006@gmail.com>
  Michael Petlan <mpetlan@redhat.com>
  Michal Simek <michal.simek@amd.com>
  Nathan Chancellor <nathan@kernel.org>
  Nathan Chancellor <nathan@kernel.org> # build
  Nico Pache <npache@redhat.com>
  nikitashvets@flyium.com
  Oleksij Rempel <o.rempel@pengutronix.de>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Abeni <pabeni@redhat.com>
  Peilin Ye <peilin.ye@bytedance.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Peter Zijlstra <peterz@infradead.org>
  Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
  Qu Wenruo <wqu@suse.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Riccardo Paolo Bestetti <pbl@bestov.io>
  Rob Herring <robh@kernel.org>
  Ron Economos <re@w6rz.net>
  Rosemarie O'Riorden <roriorden@redhat.com>
  Sandeep Penigalapati <sandeep.penigalapati@intel.com>
  Saurabh Sengar <ssengar@linux.microsoft.com>
  Sebastian Andrzej Siewior <bigeasy@linutronix.de>
  Sedat Dilek <sedat.dilek@gmail.com> # LLVM-14 (x86-64)
  Serge Semin <Sergey.Semin@baikalelectronics.ru>
  Sergey Gorenko <sergeygo@nvidia.com>
  Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Soham Sen <contact@sohamsen.me>
  Song Liu <songliubraving@fb.com>
  Stephan Gerhold <stephan.gerhold@kernkonzept.com>
  Stephen Hemminger <stephen@networkplumber.org>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  sunliming <sunliming@kylinos.cn>
  Takashi Iwai <tiwai@suse.de>
  Takashi Sakamoto <o-takashi@sakamocchi.jp>
  Tali Perry <tali.perry1@gmail.com>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Thomas Gleixner <tglx@linutronix.de>
  Thomas Richter <tmricht@linux.ibm.com>
  Tim Crawford <tcrawford@system76.com>
  Tomas Winkler <tomas.winkler@intel.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Tyler Hicks <tyhicks@linux.microsoft.com>
  Tyrel Datwyler <tyreld@linux.ibm.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Vadim Fedorenko <vadfed@fb.com>
  Vlastimil Babka <vbabka@suse.cz>
  Wentao_Liang <Wentao_Liang_g@163.com>
  Wojciech Drewek <wojciech.drewek@intel.com>
  Wolfram Sang <wsa@kernel.org>
  Xiang wangx <wangxiang@cdjrlc.com>
  Xiubo Li <xiubli@redhat.com>
  Xu Jia <xujia39@huawei.com>
  Ying Xue <ying.xue@windriver.com>
  Yonghong Song <yhs@fb.com>
  Yu Liao <liaoyu15@huawei.com>
  Ziyang Xuan <william.xuanziyang@huawei.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  fail    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          blocked 
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          fail    
 test-amd64-coresched-amd64-xl                                fail    
 test-arm64-arm64-xl                                          blocked 
 test-armhf-armhf-xl                                          pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           fail    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        fail    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 fail    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 fail    
 test-amd64-amd64-libvirt-xsm                                 fail    
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-amd64-amd64-xl-xsm                                      fail    
 test-arm64-arm64-xl-xsm                                      pass    
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
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-examine-bios                                fail    
 test-amd64-amd64-xl-credit1                                  fail    
 test-arm64-arm64-xl-credit1                                  blocked 
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  fail    
 test-arm64-arm64-xl-credit2                                  blocked 
 test-armhf-armhf-xl-credit2                                  fail    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        fail    
 test-amd64-amd64-examine                                     fail    
 test-arm64-arm64-examine                                     blocked 
 test-armhf-armhf-examine                                     pass    
 test-amd64-amd64-qemuu-nested-intel                          fail    
 test-amd64-amd64-xl-pvhv2-intel                              fail    
 test-amd64-amd64-dom0pvh-xl-intel                            fail    
 test-amd64-amd64-libvirt                                     fail    
 test-armhf-armhf-libvirt                                     fail    
 test-amd64-amd64-xl-multivcpu                                fail    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        fail    
 test-amd64-amd64-libvirt-pair                                fail    
 test-amd64-amd64-xl-pvshim                                   fail    
 test-amd64-amd64-pygrub                                      fail    
 test-amd64-amd64-libvirt-qcow2                               fail    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-libvirt-raw                                 fail    
 test-arm64-arm64-libvirt-raw                                 blocked 
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-amd64-xl-rtds                                     fail    
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             fail    
 test-amd64-amd64-xl-shadow                                   fail    
 test-arm64-arm64-xl-thunderx                                 blocked 
 test-amd64-amd64-examine-uefi                                fail    
 test-amd64-amd64-xl-vhd                                      fail    
 test-arm64-arm64-xl-vhd                                      blocked 
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

(No revision log; it would be 5108 lines long.)

