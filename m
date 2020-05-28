Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 951A71E5531
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 06:50:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeAUA-0004GY-RZ; Thu, 28 May 2020 04:49:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P1kI=7K=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jeAU9-0004GT-Ip
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 04:49:41 +0000
X-Inumbo-ID: a03b7312-a09e-11ea-81bc-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a03b7312-a09e-11ea-81bc-bc764e2007e4;
 Thu, 28 May 2020 04:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+Id1cnZ2mJkIE7iCCCFdw7A8EsQYJVsBC48K6wxE02E=; b=R0QNmDNRV4Kaoa4Smm2utI93L
 wQA0UDZLtztUP1d3yoUy26asXGwZU3yJVbZV1KOe+wpm0MFN4rNwZ29qZlzkxcW4N1ADxZjHEc0A1
 aWiQVsnBkqgDHx8mKYvtb67iwJ+XdI2f2wt24e0WUtLdpinEvbf0tEurMFBafSHmO8tcM=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jeAU1-0000qX-Mk; Thu, 28 May 2020 04:49:33 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jeAU1-0000Em-Bn; Thu, 28 May 2020 04:49:33 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jeAU1-0001S9-B5; Thu, 28 May 2020 04:49:33 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150410-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 150410: regressions - trouble:
 blocked/fail/pass/starved
X-Osstest-Failures: linux-5.4:build-amd64-libvirt:libvirt-build:fail:regression
 linux-5.4:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-vhd:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-pair:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-xsm:build-check(1):blocked:nonblocking
 linux-5.4:test-amd64-amd64-xl-rtds:guest-saverestore:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-thunderx:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This: linux=e0d81ce760044efd3f26004aa32821c34968512a
X-Osstest-Versions-That: linux=1cdaf895c99d319c0007d0b62818cf85fc4b087f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 28 May 2020 04:49:33 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

flight 150410 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150410/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64-libvirt           6 libvirt-build            fail REGR. vs. 150294

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-amd64-libvirt-vhd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-rtds     15 guest-saverestore            fail  like 150294
 test-armhf-armhf-xl-rtds     16 guest-start/debian.repeat    fail  like 150294
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop             fail never pass
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop              fail never pass
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop              fail never pass
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop             fail never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop             fail never pass
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop             fail never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-arm64-arm64-xl-thunderx  2 hosts-allocate               starved  n/a

version targeted for testing:
 linux                e0d81ce760044efd3f26004aa32821c34968512a
baseline version:
 linux                1cdaf895c99d319c0007d0b62818cf85fc4b087f

Last test of basis   150294  2020-05-21 07:55:33 Z    6 days
Testing same since   150410  2020-05-27 16:09:38 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Al Viro <viro@zeniv.linux.org.uk>
  Alain Volmat <alain.volmat@st.com>
  Alan Maguire <alan.maguire@oracle.com>
  Alan Stern <stern@rowland.harvard.edu>
  Alex Deucher <alexander.deucher@amd.com>
  Alexander Monakov <amonakov@ispras.ru>
  Alexander Usyskin <alexander.usyskin@intel.com>
  Alexandru Ardelean <alexandru.ardelean@analog.com>
  Alexei Starovoitov <ast@kernel.org>
  Andreas Färber <afaerber@suse.de>
  Andrew Morton <akpm@linux-foundation.org>
  Andrii Nakryiko <andriin@fb.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Ard Biesheuvel <ardb@kernel.org>
  Artem Borisov <dedsa2002@gmail.com>
  Arun Easi <aeasi@marvell.com>
  Aurabindo Pillai <aurabindo.pillai@amd.com>
  Aymeric Agon-Rambosson <aymeric.agon@yandex.com>
  Babu Moger <babu.moger@amd.com>
  Bin Lu <Bin.Lu@arm.com>
  Bob Peterson <rpeterso@redhat.com>
  Bodo Stroesser <bstroesser@ts.fujitsu.com>
  Brent Lu <brent.lu@intel.com>
  Bryant G. Ly <bryangly@gmail.com>
  Catalin Marinas <catalin.marinas@arm.com>
  Chris Chiu <chiu@endlessm.com>
  Chris Wilson <chris@chris-wilson.co.uk>
  Christian Borntraeger <borntraeger@de.ibm.com>
  Christian Gmeiner <christian.gmeiner@gmail.com>
  Christian Lachner <gladiac@gmail.com>
  Christoph Hellwig <hch@lst.de>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Colin Xu <colin.xu@intel.com>
  Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniel Drake <drake@endlessm.com>
  Daniel Playfair Cal <daniel.playfair.cal@gmail.com>
  David Hildenbrand <david@redhat.com>
  David Howells <dhowells@redhat.com>
  David S. Miller <davem@davemloft.net>
  Dragos Bogdan <dragos.bogdan@analog.com>
  Eric Biggers <ebiggers@google.com>
  Ewan D. Milne <emilne@redhat.com>
  Fabrice Gasnier <fabrice.gasnier@st.com>
  Frédéric Pierret (fepitre) <frederic.pierret@qubes-os.org>
  Gavin Shan <gshan@redhat.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Gerald Schaefer <gerald.schaefer@de.ibm.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Gregory CLEMENT <gregory.clement@bootlin.com>
  Hans de Goede <hdegoede@redhat.com>
  Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Igor Russkikh <irusskikh@marvell.com>
  Ilya Dryomov <idryomov@gmail.com>
  Ingo Molnar <mingo@kernel.org>
  Jakub Sitnicki <jakub@cloudflare.com>
  James Hilliard <james.hilliard1@gmail.com>
  Jian-Hong Pan <jian-hong@endlessm.com>
  Jiri Kosina <jkosina@suse.cz>
  Joerg Roedel <jroedel@suse.de>
  John Hubbard <jhubbard@nvidia.com>
  John Johansen <john.johansen@canonical.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Josh Poimboeuf <jpoimboe@redhat.com>
  Juliet Kim <julietk@linux.vnet.ibm.com>
  Kai Vehmanen <kai.vehmanen@linux.intel.com>
  Kailang Yang <kailang@realtek.com>
  Kees Cook <keescook@chromium.org>
  Keno Fischer <keno@juliacomputing.com>
  Kevin Hao <haokexin@gmail.com>
  Klaus Doth <kdlnx@doth.eu>
  Krzysztof Struczynski <krzysztof.struczynski@huawei.com>
  Lianbo Jiang <lijiang@redhat.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Loïc Yhuel <loic.yhuel@gmail.com>
  Lucas Stach <l.stach@pengutronix.de>
  Marco Elver <elver@google.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Masami Hiramatsu <mhiramat@kernel.org>
  Mauro Carvalho Chehab <mchehab@kernel.org>
  Maxim Petrov <mmrmaximuzz@gmail.com>
  Mel Gorman <mgorman@techsingularity.net>
  Miaohe Lin <linmiaohe@huawei.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michał Mirosław <mirq-linux@rere.qmqm.pl>
  Mike Pozulp <pozulp.kernel@gmail.com>
  Mimi Zohar <zohar@linux.ibm.com>
  Miquel Raynal <miquel.raynal@bootlin.com>
  Navid Emamdoost <navid.emamdoost@gmail.com>
  Neil Horman <nhorman@tuxdriver.com>
  Niklas Schnelle <schnelle@linux.ibm.com>
  Nilesh Javali <njavali@marvell.com>
  Olivier Moysan <olivier.moysan@st.com>
  Oscar Carter <oscar.carter@gmx.com>
  Palmer Dabbelt <palmerdabbelt@google.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Paul Cercueil <paul@crapouillou.net>
  PeiSen Hou <pshou@realtek.com>
  Peter Ujfalusi <peter.ujfalusi@ti.com>
  Peter Xu <peterx@redhat.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Peter Zijlstra <a.p.zijlstra@chello.nl>
  Phil Auld <pauld@redhat.com>
  Philipp Rudo <prudo@linux.ibm.com>
  Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
  Qian Cai <cai@lca.pw>
  Qiushi Wu <wu000273@umn.edu>
  Quinn Tran <qutran@marvell.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Ricardo Ribalda Delgado <ribalda@kernel.org>
  Richard Clark <richard.xnu.clark@gmail.com>
  Richard Weinberger <richard@nod.at>
  Rick Edgecombe <rick.p.edgecombe@intel.com>
  Roberto Sassu <roberto.sassu@huawei.com>
  Rodrigo Vivi <rodrigo.vivi@intel.com>
  Russell Currey <ruscur@russell.cc>
  Sagar Shrikant Kadam <sagar.kadam@sifive.com>
  Samuel Iglesias Gonsalvez <siglesias@igalia.com>
  Sascha Hauer <s.hauer@pengutronix.de>
  Sasha Levin <sashal@kernel.org>
  Scott Bahling <sbahling@suse.com>
  Sebastian Reichel <sebastian.reichel@collabora.com>
  Shay Agroskin <shayagr@amazon.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Stefano Garzarella <sgarzare@redhat.com>
  Steven Rostedt (VMware) <rostedt@goodmis.org>
  Sudeep Holla <sudeep.holla@arm.com>
  Takashi Iwai <tiwai@suse.de>
  Thierry Reding <treding@nvidia.com>
  Thomas Gleixner <tglx@linutronix.de>
  Tomas Winkler <tomas.winkler@intel.com>
  Tyrel Datwyler <tyreld@linux.ibm.com>
  Vasily Gorbik <gor@linux.ibm.com>
  Vincent Guittot <vincent.guittot@linaro.org>
  Vinod Koul <vkoul@kernel.org>
  Vladimir Murzin <vladimir.murzin@arm.com>
  Wei Yongjun <weiyongjun1@huawei.com>
  Will Deacon <will@kernel.org>
  Wolfram Sang <wsa@kernel.org>
  Wolfram Sang <wsa@the-dreams.de>
  Wu Bo <wubo40@huawei.com>
  Xin Tan <tanxin.ctf@gmail.com>
  Xiyu Yang <xiyuyang19@fudan.edu.cn>
  Yoshiyuki Kurauchi <ahochauwaaaaa@gmail.com>
  Zhenyu Wang <zhenyuw@linux.intel.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          fail    
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
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           blocked 
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-libvirt-xsm                                 blocked 
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemut-rhel6hvm-amd                           pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
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
 test-amd64-amd64-libvirt                                     blocked 
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                blocked 
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-amd64-pvgrub                                pass    
 test-amd64-amd64-i386-pvgrub                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-xl-raw                                       pass    
 test-amd64-amd64-xl-rtds                                     fail    
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 starved 
 test-amd64-amd64-libvirt-vhd                                 blocked 
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

(No revision log; it would be 3181 lines long.)

