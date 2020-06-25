Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 078DF209868
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2020 04:14:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joHNp-0004Yo-6R; Thu, 25 Jun 2020 02:12:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1CTa=AG=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1joHNo-0004Yj-HK
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2020 02:12:56 +0000
X-Inumbo-ID: 60aaa8ac-b689-11ea-8496-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 60aaa8ac-b689-11ea-8496-bc764e2007e4;
 Thu, 25 Jun 2020 02:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jv6Hn6oXbGqOY30asEod2hhy1A0FsHZq+YrbF16zfs4=; b=LG1jbR6gr63SLJHEZ56OBfKC6
 CN2DyxUBcEGdaKfZMxqhB3wONWq1HJpNfryOwWDh9o/S0W22TjK9G/p8tnWGlp7W4I9udsmRD5Ne2
 hEzJb7yrRSQxRMOBlDb6ZprbKW6SlK7ILPZV/MrvSQAS0OSiUWL+HV3mlPqwxi6Z1Ar4s=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1joHNl-0002Jy-3l; Thu, 25 Jun 2020 02:12:53 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1joHNk-0004HC-Pe; Thu, 25 Jun 2020 02:12:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1joHNk-0008LZ-Od; Thu, 25 Jun 2020 02:12:52 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151323-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 151323: regressions - FAIL
X-Osstest-Failures: linux-linus:test-arm64-arm64-libvirt-xsm:guest-start/debian.repeat:fail:regression
 linux-linus:test-amd64-i386-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:regression
 linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
X-Osstest-Versions-This: linux=3e08a95294a4fb3702bb3d35ed08028433c37fe6
X-Osstest-Versions-That: linux=1b5044021070efa3259f3e9548dc35d1eb6aa844
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 25 Jun 2020 02:12:52 +0000
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

flight 151323 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151323/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-arm64-arm64-libvirt-xsm 16 guest-start/debian.repeat fail REGR. vs. 151214
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm 10 debian-hvm-install fail REGR. vs. 151214

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 151214
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 151214
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop            fail like 151214
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 151214
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 151214
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 151214
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 151214
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 151214
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass

version targeted for testing:
 linux                3e08a95294a4fb3702bb3d35ed08028433c37fe6
baseline version:
 linux                1b5044021070efa3259f3e9548dc35d1eb6aa844

Last test of basis   151214  2020-06-18 02:27:46 Z    6 days
Failing since        151236  2020-06-19 19:10:35 Z    5 days    5 attempts
Testing same since   151323  2020-06-24 00:10:00 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alex Deucher <alexander.deucher@amd.com>
  Alex Deucher <alexdeucher@gmail.com>
  Alexander Stein <alexander.stein@mailbox.org>
  Alexey Budankov <alexey.budankov@linux.intel.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
  Ard Biesheuvel <ardb@kernel.org>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Arnd Bergmann <arnd@arndb.de>
  Arvind Sankar <nivedita@alum.mit.edu>
  Atish Patra <atish.patra@wdc.com>
  Axel Lin <axel.lin@ingics.com>
  Baolin Wang <baolin.wang@linux.alibaba.com>
  Barry Song <song.bao.hua@hisilicon.com>
  Bartosz Golaszewski <bgolaszewski@baylibre.com>
  Charles Keepax <ckeepax@opensource.cirrus.com>
  Chen Zhou <chenzhou10@huawei.com>
  Chris Wilson <chris@chris-wilson.co.uk>
  Christian Zigotzky <chzigotzky@xenosoft.de>
  Christoph Hellwig <hch@lst.de>
  Christophe Leroy <christophe.leroy@csgroup.eu>
  Chunyan Zhang <chunyan.zhang@unisoc.com>
  Coly Li <colyli@suse.de>
  Cornelia Huck <cohuck@redhat.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Dan Williams <dan.j.williams@intel.com>
  Daniel Schaefer <git@danielschaefer.me>
  Daniel Vetter <daniel.vetter@ffwll.ch>
  Dave Airlie <airlied@redhat.com>
  Dave Martin <Dave.Martin@arm.com>
  David Howells <dhowells@redhat.com>
  David Sterba <dsterba@suse.com>
  Denis Efremov <efremov@linux.com>
  Dinghao Liu <dinghao.liu@zju.edu.cn>
  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Dmitry V. Levin <ldv@altlinux.org>
  Drew Fustini <drew@beagleboard.org>
  Eric Biggers <ebiggers@google.com>
  Felix Kuehling <Felix.Kuehling@amd.com>
  Filipe Manana <fdmanana@suse.com>
  Flavio Suligoi <f.suligoi@asem.it>
  Gaurav Singh <gaurav1086@gmail.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Guenter Roeck <linux@roeck-us.net>
  Gustavo A. R. Silva <gustavoars@kernel.org>
  Haibo Chen <haibo.chen@nxp.com>
  Heiko Carstens <heiko.carstens@de.ibm.com>
  Heinrich Schuchardt <xypron.glpk@gmx.de>
  Herbert Xu <herbert@gondor.apana.org.au>
  Hongbo Yao <yaohongbo@huawei.com>
  Ian Rogers <irogers@google.com>
  Ilya Dryomov <idryomov@gmail.com>
  Imre Deak <imre.deak@intel.com>
  Ira Weiny <ira.weiny@intel.com>
  Jack Wang <jinpu.wang@cloud.ionos.com>
  Jan Kara <jack@suse.cz>
  Jason A. Donenfeld <Jason@zx2c4.com>
  Jason Yan <yanaijie@huawei.com>
  Jens Axboe <axboe@kernel.dk>
  Jens Thoms Toerring <jt@toerring.de>
  Jiri Olsa <jolsa@kernel.org>
  Jiri Olsa <jolsa@redhat.com>
  John Garry <john.garry@huawei.com>
  Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
  Julian Wiedmann <jwi@linux.ibm.com>
  Kai-Heng Feng <kai.heng.feng@canonical.com>
  Kaitao Cheng <pilgrimtao@gmail.com>
  Kees Cook <keescook@chromium.org>
  Kefeng Wang <wangkefeng.wang@huawei.com>
  kernel test robot <lkp@intel.com>
  Keyur Patel <iamkeyur96@gmail.com>
  Khaled Almahallawy <khaled.almahallawy@intel.com>
  Krzysztof Kozlowski <krzk@kernel.org>
  Lee Jones <lee.jones@linaro.org>
  Lingling Xu <ling_ling.xu@unisoc.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Loic Poulain <loic.poulain@linaro.org>
  Lorenz Brun <lorenz@brun.one>
  Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
  Luis Chamberlain <mcgrof@kernel.org>
  Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
  Mark Brown <broonie@kernel.org>
  Mark Rutland <mark.rutland@arm.com>
  Martin Fuzzey <martin.fuzzey@flowbird.group>
  Martin K. Petersen <martin.petersen@oracle.com>
  Martin Schwidefsky <schwidefsky@de.ibm.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Masami Hiramatsu <mhiramat@kernel.org>
  Masanari Iida <standby24x7@gmail.com>
  Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
  Mauricio Faria de Oliveira <mfo@canonical.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
  Mike Rapoport <rppt@linux.ibm.com>
  Milian Wolff <milian.wolff@kdab.com>
  Nathan Chancellor <natechancellor@gmail.com>
  Nathan Huckleberry <nhuck@google.com>
  Navid Emamdoost <navid.emamdoost@gmail.com>
  Nicholas Piggin <npiggin@gmail.com>
  Nick Desaulniers <ndesaulniers@google.com>
  Nirmoy Das <nirmoy.das@amd.com>
  Palmer Dabbelt <palmerdabbelt@google.com>
  Patrice Chotard <patrice.chotard@st.com>
  Paul Moore <paul@paul-moore.com>
  Pavel Begunkov <asml.silence@gmail.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Qing Zhang <zhangqing@loongson.cn>
  Qingqing Zhuo <qingqing.zhuo@amd.com>
  Randy Dunlap <rdunlap@infradead.org>
  Robert Foss <robert.foss@linaro.org>
  Robin Gong <yibin.gong@nxp.com>
  Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
  Roman Gushchin <guro@fb.com>
  Sami Tolvanen <samitolvanen@google.com>
  Sandeep Raghuraman <sandy.8925@gmail.com>
  Sedat Dilek <sedat.dilek@gmail.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Shyam Thombre <sthombre@codeaurora.org>
  Sivaprakash Murugesan <sivaprak@codeaurora.org>
  Stephan Mueller <smueller@chronox.de>
  Stephan Müller <smueller@chronox.de>
  Stephen Smalley <stephen.smalley.work@gmail.com>
  Steven Rostedt (VMware) <rostedt@goodmis.org>
  Sumanth Korikkar <sumanthk@linux.ibm.com>
  Sven Schnelle <svens@linux.ibm.com>
  Tiezhu Yang <yangtiezhu@loongson.cn>
  Tom Lendacky <thomas.lendacky@amd.com>
  Tom Rix <trix@redhat.com>
  Uma Shankar <uma.shankar@intel.com>
  Vaibhav Jain <vaibhav@linux.ibm.com>
  Vamshi K Sthambamkadi <vamshi.k.sthambamkadi@gmail.com>
  Vandita Kulkarni <vandita.kulkarni@intel.com>
  Vasily Gorbik <gor@linux.ibm.com>
  Vidya Sagar <vidyas@nvidia.com>
  Vincenzo Frascino <vincenzo.frascino@arm.com>
  Vishal Verma <vishal.l.verma@intel.com>
  Vladimir Oltean <vladimir.oltean@nxp.com>
  Waiman Long <longman@redhat.com>
  Wei Yang <richard.weiyang@linux.alibaba.com>
  Weiping Zhang <zhangweiping@didiglobal.com>
  Will Deacon <will@kernel.org>
  Wolfram Sang <wsa+renesas@sang-engineering.com>
  Wolfram Sang <wsa@kernel.org>
  Xiaoguang Wang <xiaoguang.wang@linux.alibaba.com>
  YangHui <yanghui.def@gmail.com>
  Yash Shah <yash.shah@sifive.com>
  Ye Bin <yebin10@huawei.com>
  Zheng Bin <zhengbin13@huawei.com>
  Zhenzhong Duan <zhenzhong.duan@gmail.com>
  Zhiqiang Liu <liuzhiqiang26@huawei.com>
  Zou Wei <zou_wei@huawei.com>

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
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  fail    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 fail    
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

(No revision log; it would be 7239 lines long.)

