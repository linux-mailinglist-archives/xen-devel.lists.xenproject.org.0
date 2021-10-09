Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A11D427DFF
	for <lists+xen-devel@lfdr.de>; Sun, 10 Oct 2021 00:54:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205224.360472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZLDL-0001at-9Z; Sat, 09 Oct 2021 22:53:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205224.360472; Sat, 09 Oct 2021 22:53:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZLDL-0001Xy-5C; Sat, 09 Oct 2021 22:53:11 +0000
Received: by outflank-mailman (input) for mailman id 205224;
 Sat, 09 Oct 2021 22:53:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mZLDJ-0001Xo-QS; Sat, 09 Oct 2021 22:53:09 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mZLDJ-0005H5-LX; Sat, 09 Oct 2021 22:53:09 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mZLDJ-0002Gl-AW; Sat, 09 Oct 2021 22:53:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mZLDJ-00041L-A0; Sat, 09 Oct 2021 22:53:09 +0000
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
	bh=ZfgZjn+5UrjbdA3mED0AB/B1/AC9BWeeR7L0QqLI9Io=; b=ifdDA51LunZN+oj6ahd/PMfg30
	1OdyuOQPzjilY1XuFzVtA2FVUgOeb/1/69neixfAGVp+M00TwqtniALeGdzr25VgfV1qLt8s2+pXX
	kkhwtiLMOBwrgIkEUYBoqtklrhOntWp6IyckTaGZZDAyAHoVXwFRKsCS4vAaP+BylCGY=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165443-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 165443: regressions - FAIL
X-Osstest-Failures:
    linux-5.4:test-armhf-armhf-xl-credit1:guest-start:fail:regression
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:guest-start/debian.repeat:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=31cdcb6d430f07760dd2f540a354b11e6bb6a4a4
X-Osstest-Versions-That:
    linux=e74e2950a0d6f800858e54860d7124c86e494f62
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 09 Oct 2021 22:53:09 +0000

flight 165443 linux-5.4 real [real]
flight 165448 linux-5.4 real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/165443/
http://logs.test-lab.xenproject.org/osstest/logs/165448/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl-credit1  14 guest-start              fail REGR. vs. 165206

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 165206
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 165206
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 165206
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 165206
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 165206
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 165206
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 165206
 test-arm64-arm64-libvirt-raw 17 guest-start/debian.repeat    fail  like 165206
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 165206
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 165206
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 165206
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 165206
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 165206
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                31cdcb6d430f07760dd2f540a354b11e6bb6a4a4
baseline version:
 linux                e74e2950a0d6f800858e54860d7124c86e494f62

Last test of basis   165206  2021-09-26 12:42:13 Z   13 days
Failing since        165346  2021-10-04 12:42:32 Z    5 days    6 attempts
Testing same since   165414  2021-10-07 14:32:19 Z    2 days    3 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alan Stern <stern@rowland.harvard.edu>
  Alex Deucher <alexander.deucher@amd.com>
  Alexei Starovoitov <ast@kernel.org>
  Anders Roxell <anders.roxell@linaro.org>
  Andrea Claudi <aclaudi@redhat.com>
  Andreas Larsson <andreas@gaisler.com>
  Andrej Shadura <andrew.shadura@collabora.co.uk>
  Andrew Morton <akpm@linux-foundation.org>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Anirudh Rayabharam <mail@anirudhrb.com>
  Anson Jacob <Anson.Jacob@amd.com>
  Antoine Tenart <atenart@kernel.org>
  Anton Eidelman <anton.eidelman@gmail.com>
  Anton Eidelman <anton@lightbitslabs.com>
  Ariel Elior <aelior@marvell.com>
  Arnd Bergmann <arnd@arndb.de>
  Aswath Govindraju <a-govindraju@ti.com>
  Aya Levin <ayal@nvidia.com>
  Baokun Li <libaokun1@huawei.com>
  Bartosz Golaszewski <brgl@bgdev.pl>
  Bixuan Cui <cuibixuan@huawei.com>
  Bjorn Helgaas <bhelgaas@google.com>
  Borislav Petkov <bp@suse.de>
  Carlo Lobrano <c.lobrano@gmail.com>
  Catalin Marinas <catalin.marinas@arm.com>
  Charlene Liu <Charlene.Liu@amd.com>
  Chen Jingwen <chenjingwen6@huawei.com>
  Chih-Kang Chang <gary.chang@realtek.com>
  Chris Chiu <chris.chiu@canonical.com>
  Christian Brauner <christian.brauner@ubuntu.com>
  Christoph Hellwig <hch@lst.de>
  Claudiu Manoil <claudiu.manoil@nxp.com>
  Cong Wang <cong.wang@bytedance.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Dan Li <ashimida@linux.alibaba.com>
  Dan Williams <dan.j.williams@intel.com>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniel Lezcano <daniel.lezcano@linaro.org>
  Daniel Wheeler <daniel.wheeler@amd.com>
  David Howells <dhowells@redhat.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Dmitry Bogdanov <d.bogdanov@yadro.com>
  Dongliang Mu <mudongliangabcd@gmail.com>
  Eric Biggers <ebiggers@google.com>
  Eric Dumazet <edumazet@google.com>
  F.A. SULAIMAN <asha.16@itfac.mrt.ac.lk>
  F.A.Sulaiman <asha.16@itfac.mrt.ac.lk>
  Felipe Balbi <balbi@kernel.org>
  Florian Fainelli <f.fainelli@gmail.com>
  Gao Xiang <hsiangkao@linux.alibaba.com>
  Geert Uytterhoeven <geert@linux-m68k.org>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Gregory CLEMENT <gregory.clement@bootlin.com>
  Guangbin Huang <huangguangbin2@huawei.com>
  Guenter Roeck <linux@roeck-us.net>
  Hans de Goede <hdegoede@redhat.com>
  Helge Deller <deller@gmx.de>
  Herbert Xu <herbert@gondor.apana.org.au>
  Hulk Robot <hulkrobot@huawei.com>
  Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
  Jacob Keller <jacob.e.keller@intel.com>
  James Morse <james.morse@arm.com>
  Jan Beulich <jbeulich@suse.com>
  Jeffle Xu <jefflexu@linux.alibaba.com>
  Jens Axboe <axboe@kernel.dk>
  Jesper Nilsson <jesper.nilsson@axis.com>
  Jian Shen <shenjian15@huawei.com>
  Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
  Jiri Benc <jbenc@redhat.com>
  Jiri Kosina <jkosina@suse.cz>
  Jiri Slaby <jslaby@suse.cz>
  Johan Hovold <johan@kernel.org>
  Johannes Berg <johannes.berg@intel.com>
  Johannes Thumshirn <jth@kernel.org>
  John Allen <john.allen@amd.com>
  Jon Hunter <jonathanh@nvidia.com>
  Jonathan Hsu <jonathan.hsu@mediatek.com>
  Jozsef Kadlecsik <kadlec@netfilter.org>
  Juergen Gross <jgross@suse.com>
  Julian Anastasov <ja@ssi.bg>
  Julian Sikorski <belegdol+github@gmail.com>
  Julian Sikorski <belegdol@gmail.com>
  Kaige Fu <kaige.fu@linux.alibaba.com>
  Kan Liang <kan.liang@linux.intel.com>
  Karsten Graul <kgraul@linux.ibm.com>
  Kevin Hao <haokexin@gmail.com>
  Kishon Vijay Abraham I <kishon@ti.com>
  Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
  Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
  Leon Yu <leoyu@nvidia.com>
  Li Jinlin <lijinlin3@huawei.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Lorenzo Bianconi <lorenzo@kernel.org>
  Marc Zyngier <maz@kernel.org>
  Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
  Mark Rutland <mark.rutland@arm.com>
  Markus Suvanto <markus.suvanto@gmail.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Michael Chan <michael.chan@broadcom.com>
  Michael Chan <michael.chan@broadocm.com>
  Michal Kalderon <mkalderon@marvell.com>
  Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
  Moritz Fischer <mdf@kernel.org>
  Nadezda Lutovinova <lutovinova@ispras.ru>
  Nicolas Ferre <nicolas.ferre@microchip.com>
  Nirmoy Das <nirmoy.das@amd.com>
  Oliver Neukum <oneukum@suse.com>
  Ondrej Zary <linux@zary.sk>
  Ovidiu Panait <ovidiu.panait@windriver.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Pali Rohár <pali@kernel.org>
  Paolo Bonzini <pbonzini@redhat.com>
  Paul Fertser <fercerpav@gmail.com>
  Pawel Laszczak <pawell@cadence.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Ping-Ke Shih <pkshih@realtek.com>
  Qu Wenruo <wqu@suse.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>
  Randy Dunlap <rdunlap@infradead.org>
  Ritesh Harjani <riteshh@linux.ibm.com>
  Rob Herring <robh@kernel.org>
  Ronnie Sahlberg <lsahlber@redhat.com>
  Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
  Samuel Iglesias Gonsalvez <siglesias@igalia.com>
  Sasha Levin <sashal@kernel.org>
  Shai Malin <smalin@marvell.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
  Simon Horman <horms@verge.net.au>
  Slark Xiao <slark_xiao@163.com>
  Song Liu <songliubraving@fb.com>
  Srinivas Pandruvada <srinivas.pI andruvada@linux.intel.com>
  Steve French <stfrench@microsoft.com>
  Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
  sumiyawang <sumiyawang@tencent.com>
  syzbot+47b26cd837ececfc666d@syzkaller.appspotmail.com
  syzbot+fadc0aaf497e6a493b9f@syzkaller.appspotmail.com
  Tariq Toukan <tariqt@nvidia.com>
  Tejun Heo <tj@kernel.org>
  Theodore Ts'o <tytso@mit.edu>
  Todd Kjos <tkjos@google.com>
  Tom Rix <trix@redhat.com>
  Tong Zhang <ztong0001@gmail.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Tyler Hicks <tyhicks@linux.microsoft.com>
  Uwe Brandt <uwe.brandt@gmail.com>
  Vadim Pasternak <vadimp@nvidia.com>
  Viresh Kumar <viresh.kumar@linaro.org>
  Vlad Buslov <vladbu@nvidia.com>
  Wengang Wang <wen.gang.wang@oracle.com>
  Xiao Liang <shaw.leon@gmail.com>
  Xin Long <lucien.xin@gmail.com>
  yangerkun <yangerkun@huawei.com>
  Yonghong Song <yhs@fb.com>
  Zelin Deng <zelin.deng@linux.alibaba.com>
  zhang kai <zhangkaiheb@126.com>
  Zhihao Cheng <chengzhihao1@huawei.com>
  Zong-Zhe Yang <kevin_yang@realtek.com>

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
 test-amd64-i386-libvirt                                      pass    
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
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
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

(No revision log; it would be 3743 lines long.)

