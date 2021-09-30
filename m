Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B54B241E011
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 19:22:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200180.354619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVzl2-00065V-Eb; Thu, 30 Sep 2021 17:22:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200180.354619; Thu, 30 Sep 2021 17:22:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVzl2-00063X-AG; Thu, 30 Sep 2021 17:22:08 +0000
Received: by outflank-mailman (input) for mailman id 200180;
 Thu, 30 Sep 2021 17:22:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mVzl0-00063L-Jx; Thu, 30 Sep 2021 17:22:06 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mVzl0-000545-D2; Thu, 30 Sep 2021 17:22:06 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mVzl0-0003Rk-5r; Thu, 30 Sep 2021 17:22:06 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mVzl0-0004lX-5I; Thu, 30 Sep 2021 17:22:06 +0000
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
	bh=siwnnwy3UaYdeVgDKglqP7hmeR5rej2qyPoDrDaxjpg=; b=OEhxtnOTofUbhGSrfEwgDhiwrv
	AojMmkESzlo9hLXEuTa18tMR0YxkT4LiZSdtGZEmlQVTjyqVV6qpi8RlL3DXc/qAJP/eV7p+7YJih
	tux3viVeUK9iQZxW79UloTxkeFG06RsqBni3xm8EPwuD1+oAnhQpKkF8qe/G/tyjM7wo=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165329-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 165329: regressions - trouble: fail/pass/preparing/running
X-Osstest-Failures:
    linux-5.4:test-armhf-armhf-xl-credit1:guest-start:fail:regression
    linux-5.4:test-amd64-coresched-i386-xl:hosts-allocate:running:regression
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:hosts-allocate:running:regression
    linux-5.4:test-amd64-i386-qemut-rhel6hvm-amd:hosts-allocate:running:regression
    linux-5.4:test-amd64-coresched-amd64-xl:hosts-allocate:running:regression
    linux-5.4:test-amd64-i386-qemuu-rhel6hvm-amd:hosts-allocate:running:regression
    linux-5.4:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:hosts-allocate:running:regression
    linux-5.4:test-amd64-i386-libvirt-xsm:host-install(5):running:regression
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:host-install(5):running:regression
    linux-5.4:test-amd64-i386-libvirt:debian-install:running:regression
    linux-5.4:test-amd64-i386-xl-qemuu-debianhvm-amd64:debian-hvm-install:running:regression
    linux-5.4:test-armhf-armhf-libvirt-raw:host-install(5):running:regression
    linux-5.4:test-amd64-i386-xl:guest-start/debian.repeat:running:regression
    linux-5.4:test-amd64-i386-xl:syslog-server:running:regression
    linux-5.4:test-amd64-i386-libvirt-xsm:syslog-server:running:regression
    linux-5.4:test-amd64-amd64-xl-pvhv2-amd:capture-logs(26):running:regression
    linux-5.4:test-amd64-amd64-xl-pvhv2-amd:syslog-server:running:regression
    linux-5.4:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:running:regression
    linux-5.4:test-amd64-i386-xl-shadow:guest-start/debian.repeat:running:regression
    linux-5.4:test-amd64-amd64-qemuu-freebsd11-amd64:syslog-server:running:regression
    linux-5.4:test-amd64-amd64-qemuu-freebsd11-amd64:capture-logs(25):running:regression
    linux-5.4:test-amd64-i386-xl-shadow:syslog-server:running:regression
    linux-5.4:test-amd64-i386-libvirt:syslog-server:running:regression
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:running:regression
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:syslog-server:running:regression
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:windows-install:running:regression
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:syslog-server:running:regression
    linux-5.4:test-amd64-i386-xl-qemuu-debianhvm-amd64:syslog-server:running:regression
    linux-5.4:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:syslog-server:running:regression
    linux-5.4:test-armhf-armhf-libvirt-raw:syslog-server:running:regression
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:syslog-server:running:regression
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=3a7dc5b4cfbdfd8da37cb0e54f439d84cf5a5123
X-Osstest-Versions-That:
    linux=e74e2950a0d6f800858e54860d7124c86e494f62
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 30 Sep 2021 17:22:06 +0000

flight 165329 linux-5.4 running [real]
http://logs.test-lab.xenproject.org/osstest/logs/165329/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl-credit1  14 guest-start              fail REGR. vs. 165206
 test-amd64-coresched-i386-xl  3 hosts-allocate               running
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm  3 hosts-allocate    running
 test-amd64-i386-qemut-rhel6hvm-amd  3 hosts-allocate               running
 test-amd64-coresched-amd64-xl  3 hosts-allocate               running
 test-amd64-i386-qemuu-rhel6hvm-amd  3 hosts-allocate               running
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow  3 hosts-allocate      running
 test-amd64-i386-libvirt-xsm   5 host-install(5)              running
 test-amd64-amd64-qemuu-nested-amd  5 host-install(5)              running
 test-amd64-i386-libvirt      12 debian-install               running
 test-amd64-i386-xl-qemuu-debianhvm-amd64 12 debian-hvm-install         running
 test-armhf-armhf-libvirt-raw  5 host-install(5)              running
 test-amd64-i386-xl           22 guest-start/debian.repeat    running
 test-amd64-i386-xl            4 syslog-server                running
 test-amd64-i386-libvirt-xsm   4 syslog-server                running
 test-amd64-amd64-xl-pvhv2-amd 26 capture-logs(26)             running
 test-amd64-amd64-xl-pvhv2-amd  4 syslog-server                running
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install      running
 test-amd64-i386-xl-shadow    22 guest-start/debian.repeat    running
 test-amd64-amd64-qemuu-freebsd11-amd64  4 syslog-server                running
 test-amd64-amd64-qemuu-freebsd11-amd64 25 capture-logs(25)             running
 test-amd64-i386-xl-shadow     4 syslog-server                running
 test-amd64-i386-libvirt       4 syslog-server                running
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop                   running
 test-amd64-i386-xl-qemut-win7-amd64  4 syslog-server                running
 test-amd64-i386-xl-qemuu-ws16-amd64 12 windows-install              running
 test-amd64-amd64-qemuu-nested-amd  4 syslog-server                running
 test-amd64-i386-xl-qemuu-debianhvm-amd64  4 syslog-server              running
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm  4 syslog-server           running
 test-armhf-armhf-libvirt-raw  4 syslog-server                running
 test-amd64-i386-xl-qemuu-ws16-amd64  4 syslog-server                running

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 165206
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 165206
 test-arm64-arm64-libvirt-raw 17 guest-start/debian.repeat    fail  like 165206
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 165206
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 165206
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 165206
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 165206
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 165206
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 165206
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                3a7dc5b4cfbdfd8da37cb0e54f439d84cf5a5123
baseline version:
 linux                e74e2950a0d6f800858e54860d7124c86e494f62

Last test of basis   165206  2021-09-26 12:42:13 Z    4 days
Testing same since                          (not found)         0 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alan Stern <stern@rowland.harvard.edu>
  Alexei Starovoitov <ast@kernel.org>
  Andreas Larsson <andreas@gaisler.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Antoine Tenart <atenart@kernel.org>
  Anton Eidelman <anton.eidelman@gmail.com>
  Anton Eidelman <anton@lightbitslabs.com>
  Ariel Elior <aelior@marvell.com>
  Arnd Bergmann <arnd@arndb.de>
  Aya Levin <ayal@nvidia.com>
  Baokun Li <libaokun1@huawei.com>
  Bartosz Golaszewski <brgl@bgdev.pl>
  Bixuan Cui <cuibixuan@huawei.com>
  Borislav Petkov <bp@suse.de>
  Carlo Lobrano <c.lobrano@gmail.com>
  Catalin Marinas <catalin.marinas@arm.com>
  Chris Chiu <chris.chiu@canonical.com>
  Christian Brauner <christian.brauner@ubuntu.com>
  Christoph Hellwig <hch@lst.de>
  Claudiu Manoil <claudiu.manoil@nxp.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Dan Li <ashimida@linux.alibaba.com>
  Daniel Lezcano <daniel.lezcano@linaro.org>
  David Howells <dhowells@redhat.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Dmitry Bogdanov <d.bogdanov@yadro.com>
  Felipe Balbi <balbi@kernel.org>
  Florian Fainelli <f.fainelli@gmail.com>
  Gao Xiang <hsiangkao@linux.alibaba.com>
  Geert Uytterhoeven <geert@linux-m68k.org>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Gregory CLEMENT <gregory.clement@bootlin.com>
  Guenter Roeck <linux@roeck-us.net>
  Hans de Goede <hdegoede@redhat.com>
  Helge Deller <deller@gmx.de>
  Hulk Robot <hulkrobot@huawei.com>
  Jan Beulich <jbeulich@suse.com>
  Jens Axboe <axboe@kernel.dk>
  Jesper Nilsson <jesper.nilsson@axis.com>
  Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
  Jiri Slaby <jslaby@suse.cz>
  Johan Hovold <johan@kernel.org>
  Johannes Thumshirn <jth@kernel.org>
  Jon Hunter <jonathanh@nvidia.com>
  Juergen Gross <jgross@suse.com>
  Julian Sikorski <belegdol+github@gmail.com>
  Julian Sikorski <belegdol@gmail.com>
  Kaige Fu <kaige.fu@linux.alibaba.com>
  Karsten Graul <kgraul@linux.ibm.com>
  Kishon Vijay Abraham I <kishon@ti.com>
  Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
  Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
  Li Jinlin <lijinlin3@huawei.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Marc Zyngier <maz@kernel.org>
  Mark Rutland <mark.rutland@arm.com>
  Markus Suvanto <markus.suvanto@gmail.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Michael Chan <michael.chan@broadcom.com>
  Michael Chan <michael.chan@broadocm.com>
  Michal Kalderon <mkalderon@marvell.com>
  Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
  Moritz Fischer <mdf@kernel.org>
  Nicolas Ferre <nicolas.ferre@microchip.com>
  Oliver Neukum <oneukum@suse.com>
  Ondrej Zary <linux@zary.sk>
  Pali Rohár <pali@kernel.org>
  Qu Wenruo <wqu@suse.com>
  Randy Dunlap <rdunlap@infradead.org>
  Ronnie Sahlberg <lsahlber@redhat.com>
  Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
  Sasha Levin <sashal@kernel.org>
  Shai Malin <smalin@marvell.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
  Slark Xiao <slark_xiao@163.com>
  Song Liu <songliubraving@fb.com>
  Srinivas Pandruvada <srinivas.pI andruvada@linux.intel.com>
  Steve French <stfrench@microsoft.com>
  Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
  syzbot+fadc0aaf497e6a493b9f@syzkaller.appspotmail.com
  Tariq Toukan <tariqt@nvidia.com>
  Tejun Heo <tj@kernel.org>
  Todd Kjos <tkjos@google.com>
  Tom Rix <trix@redhat.com>
  Tong Zhang <ztong0001@gmail.com>
  Uwe Brandt <uwe.brandt@gmail.com>
  Wengang Wang <wen.gang.wang@oracle.com>
  Yonghong Song <yhs@fb.com>
  zhang kai <zhangkaiheb@126.com>
  Zhihao Cheng <chengzhihao1@huawei.com>

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
 test-amd64-coresched-amd64-xl                                preparing
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           running 
 test-amd64-coresched-i386-xl                                 preparing
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            preparing
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  running 
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  running 
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            running 
 test-amd64-amd64-xl-pvhv2-amd                                running 
 test-amd64-i386-qemut-rhel6hvm-amd                           preparing
 test-amd64-i386-qemuu-rhel6hvm-amd                           preparing
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     running 
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       running 
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-i386-xl-qemut-win7-amd64                          running 
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-i386-xl-qemut-ws16-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          running 
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  fail    
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
 test-amd64-i386-libvirt                                      running 
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 fail    
 test-armhf-armhf-libvirt-raw                                 running 
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              preparing
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    running 
 test-arm64-arm64-xl-thunderx                                 pass    
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

(No revision log; it would be 1974 lines long.)

