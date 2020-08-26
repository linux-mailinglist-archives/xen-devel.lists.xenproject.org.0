Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B01B253A55
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 00:44:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kB48l-0002AN-9X; Wed, 26 Aug 2020 22:43:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Ngk=CE=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kB48j-0002AG-84
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 22:43:33 +0000
X-Inumbo-ID: 85095c06-5559-49d4-81c4-9220f9d7ecfb
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 85095c06-5559-49d4-81c4-9220f9d7ecfb;
 Wed, 26 Aug 2020 22:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=+kHiuhd+8y6FNgyvqeKEp7qo/TZINfsQz+wfC8UYe3Y=; b=TV8xdzxLDGCTdjQ3g2Tmv6BDIr
 mTogx+DUhhGK+qCAoJ1AX61E56bjVo58dTJhK/ay1t/b1paNul3aUpe8ozovGs7BWbWdaSr1qiWtI
 GhD8GobpZ/BZSublE84aAxcVl9WyDZHBLNNV0blGd82GkjBXlAVFsRZCVVcXU3SzYjP0=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kB48d-00073I-TM; Wed, 26 Aug 2020 22:43:27 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kB48d-00084R-KP; Wed, 26 Aug 2020 22:43:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kB48d-0003Gv-Jw; Wed, 26 Aug 2020 22:43:27 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152853-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 152853: tolerable FAIL - PUSHED
X-Osstest-Failures: linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: linux=6576d69aac94cd8409636dfa86e0df39facdf0d2
X-Osstest-Versions-That: linux=77fcb48939fc863d9ba9d808fac9000959e937d3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 26 Aug 2020 22:43:27 +0000
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

flight 152853 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152853/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop             fail never pass
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop              fail never pass
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop              fail never pass
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop             fail never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail   never pass
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop             fail never pass
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop             fail never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                6576d69aac94cd8409636dfa86e0df39facdf0d2
baseline version:
 linux                77fcb48939fc863d9ba9d808fac9000959e937d3

Last test of basis   152675  2020-08-22 16:52:51 Z    4 days
Testing same since   152853  2020-08-26 09:09:53 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aaron Brown <aaron.f.brown@intel.com>
  Al Viro <viro@zeniv.linux.org.uk>
  Alain Volmat <alain.volmat@st.com>
  Aleksandr Loktionov <aleksandr.loktionov@intel.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alex Williamson <alex.williamson@redhat.com>
  Alexandre Belloni <alexandre.belloni@bootlin.com>
  Amelie Delaunay <amelie.delaunay@st.com>
  Andreas Gruenbacher <agruenba@redhat.com>
  Andrew Bowers <andrewx.bowers@intel.com>
  Andrew Morton <akpm@linux-foundation.org>
  Anton Vasilyev <vasilyev@ispras.ru>
  Ard Biesheuvel <ardb@kernel.org>
  Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
  Bob Peterson <rpeterso@redhat.com>
  Bodo Stroesser <bstroesser@ts.fujitsu.com>
  Boris Ostrovsky <boris.ostrovsky@oracle.com>
  Catalin Marinas <catalin.marinas@arm.com>
  Chanho Park <chanho61.park@samsung.com>
  Charan Teja Reddy <charante@codeaurora.org>
  Chris Brannon <cmb@prgmr.com>
  Chris Wilson <chris@chris-wilson.co.uk>
  Christian König <christian.koenig@amd.com>
  Chuck Lever <chuck.lever@oracle.com>
  Chuhong Yuan <hslester96@gmail.com>
  Coly Li <colyli@suse.de>
  Cong Wang <xiyou.wangcong@gmail.com>
  Corey Minyard <cminyard@mvista.com>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniel Kolesa <daniel@octaforge.org>
  Daniel Meyerholt <dxm523@gmail.com>
  Darrick J. Wong <darrick.wong@oracle.com>
  David Hildenbrand <david@redhat.com>
  David Howells <dhowells@redhat.com>
  David Rientjes <rientjes@google.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Dinghao Liu <dinghao.liu@zju.edu.cn>
  Dmitry Golovin <dima@golovin.in>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Doug Berger <opendmb@gmail.com>
  Eiichi Tsukata <devel@etsukata.com>
  Eric Dumazet <edumazet@google.com>
  Eric Sandeen <sandeen@redhat.com>
  Evgeny Novikov <novikov@ispras.ru>
  Fangrui Song <maskray@google.com>
  Felix Kuehling <Felix.Kuehling@amd.com>
  Florian Fainelli <f.fainelli@gmail.com>
  Fugang Duan <fugang.duan@nxp.com>
  Gaurav Singh <gaurav1086@gmail.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Greg Ungerer <gerg@linux-m68k.org>
  Grzegorz Szczurek <grzegorzx.szczurek@intel.com>
  Guenter Roeck <linux@roeck-us.net>
  Haiyang Zhang <haiyangz@microsoft.com>
  Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Heiko Carstens <hca@linux.ibm.com>
  Helge Deller <deller@gmx.de>
  Huacai Chen <chenhc@lemote.com>
  Hugh Dickins <hughd@google.com>
  Ilya Dryomov <idryomov@gmail.com>
  Jan Kara <jack@suse.cz>
  Jann Horn <jannh@google.com>
  Jarod Wilson <jarod@redhat.com>
  Jason Gunthorpe <jgg@nvidia.com>
  Jason Wang <jasowang@redhat.com>
  Javed Hasan <jhasan@marvell.com>
  Jay Vosburgh <jay.vosburgh@canonical.com>
  Jens Axboe <axboe@kernel.dk>
  JiangYu <lnsyyj@hotmail.com>
  Jiaxun Yang <jiaxun.yang@flygoat.com>
  Jim Mattson <jmattson@google.com>
  Jinyang He <hejinyang@loongson.cn>
  Jiri Wiesner <jwiesner@suse.com>
  John Fastabend <john.fastabend@gmail.com>
  Jon Hunter <jonathanh@nvidia.com>
  Josef Bacik <josef@toxicpanda.com>
  Juergen Gross <jgross@suse.com>
  Kaike Wan <kaike.wan@intel.com>
  Krunoslav Kovac <Krunoslav.Kovac@amd.com>
  Laurent Morichetti <laurent.morichetti@amd.com>
  Li Heng <liheng40@huawei.com>
  Liang Chen <cl@rock-chips.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
  Lukas Wunner <lukas@wunner.de>
  Mao Wenan <wenan.mao@linux.alibaba.com>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Marc Zyngier <maz@kernel.org>
  Marcos Paulo de Souza <mpdesouza@suse.com>
  Mark Brown <broonie@kernel.org>
  Martin K. Petersen <martin.petersen@oracle.com>
  Martin KaFai Lau <kafai@fb.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Masami Hiramatsu <mhiramat@kernel.org>
  Matthias Kaehlcke <mka@chromium.org>
  Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael S. Tsirkin <mst@redhat.com>
  Michal Hocko <mhocko@suse.com>
  Mike Christie <michael.christie@oracle.com>
  Mike Kravetz <mike.kravetz@oracle.com>
  Mike Marciniszyn <mike.marciniszyn@intel.com>
  Mike Pozulp <pozulp.kernel@gmail.com>
  Nathan Chancellor <natechancellor@gmail.com>
  Nathan Chancellor <natechancellor@gmail.com> # build
  Nick Desaulniers <ndesaulniers@google.com>
  Nilesh Javali <njavali@marvell.com>
  Oleg Nesterov <oleg@redhat.com>
  Oleksij Rempel <o.rempel@pengutronix.de>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Bonzini <pbonzini@redhat.com>
  Peter Xu <peterx@redhat.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
  Przemyslaw Patynowski <przemyslawx.patynowski@intel.com>
  Qingqing Zhuo <qingqing.zhuo@amd.com>
  Quinn Tran <qutran@marvell.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Rajendra Nayak <rnayak@codeaurora.org>
  Randy Dunlap <rdunlap@infradead.org>
  Richard Weinberger <richard@nod.at>
  Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
  Roman Shaposhnik <roman@zededa.com>
  Sasha Levin <sashal@kernel.org>
  Sean Young <sean@mess.org>
  Selvin Xavier <selvin.xavier@broadcom.com>
  Shay Agroskin <shayagr@amazon.com>
  Song Liu <songliubraving@fb.com>
  Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
  Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
  Stanley Chu <stanley.chu@mediatek.com>
  Stefano Stabellini <stefano.stabellini@xilinx.com>
  Steffen Maier <maier@linux.ibm.com>
  Stephan Gerhold <stephan@gerhold.net>
  Stephen Boyd <swboyd@chromium.org>
  Stephen Suryaputra <ssuryaextr@gmail.com>
  Stylon Wang <stylon.wang@amd.com>
  Takashi Iwai <tiwai@suse.de>
  Theodore Ts'o <tytso@mit.edu>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Tom Rix <trix@redhat.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
  Viresh Kumar <viresh.kumar@linaro.org>
  Wang Hai <wanghai38@huawei.com>
  Wei Yongjun <weiyongjun1@huawei.com>
  Will Deacon <will@kernel.org>
  Xiongfeng Wang <wangxiongfeng2@huawei.com>
  Xiubo Li <xiubli@redhat.com>
  Yang Shi <shy828301@gmail.com>
  Zhang Changzhong <zhangchangzhong@huawei.com>
  zhangyi (F) <yi.zhang@huawei.com>
  Zhe Li <lizhe67@huawei.com>
  Zhiyi Guo <zhguo@redhat.com>

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


Pushing revision :

hint: The 'hooks/update' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
hint: The 'hooks/post-receive' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
hint: The 'hooks/post-update' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
To xenbits.xen.org:/home/xen/git/linux-pvops.git
   77fcb48939fc..6576d69aac94  6576d69aac94cd8409636dfa86e0df39facdf0d2 -> tested/linux-5.4

