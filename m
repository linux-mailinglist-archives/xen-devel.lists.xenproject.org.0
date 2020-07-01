Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEF02114B2
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jul 2020 23:03:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqjsy-0000vO-8S; Wed, 01 Jul 2020 21:03:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r09v=AM=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jqjsw-0000v4-VP
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2020 21:03:15 +0000
X-Inumbo-ID: 412823ec-bbde-11ea-8786-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 412823ec-bbde-11ea-8786-12813bfff9fa;
 Wed, 01 Jul 2020 21:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=awlZpy2hQb4uT+P9TsUbt5ULJdxLkCKKGsTTTVUqmDg=; b=ZMEMVTWn0vIlFh+yzx7kzvVUe
 78XzD1NgDNBYMVjtFQNu+Boowpeym0n1MrD8tLdM3oVasTQzzGURLMY0l/U73uIxSCs02odprfRqx
 wKqPSkZHrs6sEUEBllV//XFLSwvNVkMtsXx5MTkI1PQQB31Su2BLhxxS5Th1rkgIhFxqc=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jqjsl-0003RN-Et; Wed, 01 Jul 2020 21:03:03 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jqjsk-0006Uv-VT; Wed, 01 Jul 2020 21:03:03 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jqjsk-000428-Uk; Wed, 01 Jul 2020 21:03:02 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151503-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 151503: regressions - FAIL
X-Osstest-Failures: linux-5.4:test-amd64-amd64-examine:memdisk-try-append:fail:regression
 linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
X-Osstest-Versions-This: linux=e75220890bf6b37c5f7b1dbd81d8292ed6d96643
X-Osstest-Versions-That: linux=4e9688ad3d36e8f73c73e435f53da5ae1cd91a70
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 01 Jul 2020 21:03:02 +0000
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

flight 151503 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151503/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-examine      4 memdisk-try-append       fail REGR. vs. 151339

Tests which did not succeed, but are not blocking:
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop             fail never pass
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop              fail never pass
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop              fail never pass
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop             fail never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail   never pass
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop             fail never pass
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop             fail never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass

version targeted for testing:
 linux                e75220890bf6b37c5f7b1dbd81d8292ed6d96643
baseline version:
 linux                4e9688ad3d36e8f73c73e435f53da5ae1cd91a70

Last test of basis   151339  2020-06-24 16:09:27 Z    7 days
Testing same since   151503  2020-07-01 09:18:19 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aaron Plattner <aplattner@nvidia.com>
  Aditya Pakki <pakki001@umn.edu>
  Al Cooper <alcooperx@gmail.com>
  Al Viro <viro@zeniv.linux.org.uk>
  Alan Stern <stern@rowland.harvard.edu>
  Alex Deucher <alexander.deucher@amd.com>
  Alexander Lobakin <alobakin@marvell.com>
  Alexei Starovoitov <ast@kernel.org>
  Andrew Morton <akpm@linux-foundation.org>
  Anna Schumaker <Anna.Schumaker@Netapp.com>
  Anton Eidelman <anton@lightbitslabs.com>
  Ard Biesheuvel <ardb@kernel.org>
  Ariel Elior <ariel.elior@marvell.com>
  Bernard Zhao <bernard@vivo.com>
  Borislav Petkov <bp@suse.de>
  Charles Keepax <ckeepax@opensource.cirrus.com>
  Chihhao Chen <chihhao.chen@mediatek.com>
  Christian Brauner <christian.brauner@ubuntu.com>
  Christoph Hellwig <hch@lst.de>
  Chuck Lever <chuck.lever@oracle.com>
  Chuhong Yuan <hslester96@gmail.com>
  Claudiu Manoil <claudiu.manoil@nxp.com>
  Corey Minyard <cminyard@mvista.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniel Gomez <dagmcr@gmail.com>
  Daniel Wagner <dwagner@suse.de>
  Darrick J. Wong <darrick.wong@oracle.com>
  David Christensen <drc@linux.vnet.ibm.com>
  David Howells <dhowells@redhat.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Denis Efremov <efremov@linux.com>
  Denis Kirjanov <denis.kirjanov@suse.com>
  Denis Kirjanov <kda@linux-powerpc.org>
  Dennis Dalessandro <dennis.dalessandro@intel.com>
  Dinghao Liu <dinghao.liu@zju.edu.cn>
  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Doug Berger <opendmb@gmail.com>
  Drew Fustini <drew@beagleboard.org>
  Eddie James <eajames@linux.ibm.com>
  Eric Dumazet <edumazet@google.com>
  Fabian Vogt <fvogt@suse.de>
  Fan Guo <guofan5@huawei.com>
  Felipe Balbi <balbi@kernel.org>
  Felix Kuehling <Felix.Kuehling@amd.com>
  Fenghua Yu <fenghua.yu@intel.com>
  Filipe Manana <fdmanana@suse.com>
  Florian Fainelli <f.fainelli@gmail.com>
  Gao Xiang <hsiangkao@redhat.com>
  Gaurav Singh <gaurav1086@gmail.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  guodeqing <geffrey.guo@huawei.com>
  Hangbin Liu <liuhangbin@gmail.com>
  Heiko Carstens <heiko.carstens@de.ibm.com>
  Herbert Xu <herbert@gondor.apana.org.au>
  Huaisheng Ye <yehs1@lenovo.com>
  Huy Nguyen <huyn@mellanox.com>
  Igor Russkikh <irusskikh@marvell.com>
  Ilya Ponetayev <i.ponetaev@ndmsystems.com>
  Ingo Molnar <mingo@kernel.org>
  Jan Kara <jack@suse.cz>
  Jason A. Donenfeld <Jason@zx2c4.com>
  Jason Gunthorpe <jgg@mellanox.com>
  Jason Gunthorpe <jgg@nvidia.com>
  Jens Axboe <axboe@kernel.dk>
  Jeremy Kerr <jk@ozlabs.org>
  Jesper Dangaard Brouer <brouer@redhat.com>
  Jiping Ma <jiping.ma2@windriver.com>
  Joakim Tjernlund <joakim.tjernlund@infinera.com>
  Joel Stanley <joel@jms.id.au>
  Joerg Roedel <jroedel@suse.de>
  John Fastabend <john.fastabend@gmail.com>
  John Stultz <john.stultz@linaro.org>
  Jozsef Kadlecsik <kadlec@netfilter.org>
  Julian Wiedmann <jwi@linux.ibm.com>
  Junxiao Bi <junxiao.bi@oracle.com>
  Juri Lelli <juri.lelli@redhat.com>
  Kai-Heng Feng <kai.heng.feng@canonical.com>
  Kees Cook <keescook@chromium.org>
  Lalithambika Krishnakumar <lalithambika.krishnakumar@intel.com>
  Laurence Tratt <laurie@tratt.net>
  Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Leon Romanovsky <leonro@mellanox.com>
  Li Jun <jun.li@nxp.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Longfang Liu <liulongfang@huawei.com>
  Lorenzo Bianconi <lorenzo@kernel.org>
  Lu Baolu <baolu.lu@linux.intel.com>
  Luis Chamberlain <mcgrof@kernel.org>
  Macpaul Lin <macpaul.lin@mediatek.com>
  Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
  Mans Rullgard <mans@mansr.com>
  Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
  Marek Vasut <marex@denx.de>
  Mark Brown <broonie@kernel.org>
  Mark Rutland <mark.rutland@arm.com>
  Mark Zhang <markz@mellanox.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Martin Schwidefsky <schwidefsky@de.ibm.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Masami Hiramatsu <mhiramat@kernel.org>
  Mathias Nyman <mathias.nyman@linux.intel.com>
  Matt Fleming <matt@codeblueprint.co.uk>
  Matthew Hagan <mnhagan88@gmail.com>
  Michal Hocko <mhocko@suse.com>
  Michal Kalderon <michal.kalderon@marvell.com>
  Mike Snitzer <snitzer@redhat.com>
  Mikulas Patocka <mpatocka@redhat.com>
  Minas Harutyunyan <hminas@synopsys.com>
  Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
  Muchun Song <songmuchun@bytedance.com>
  Nathan Chancellor <natechancellor@gmail.com>
  Nathan Huckleberry <nhuck@google.com>
  Navid Emamdoost <navid.emamdoost@gmail.com>
  Neal Cardwell <ncardwell@google.com>
  Nikolay Aleksandrov <nikolay@cumulusnetworks.com>
  Olga Kornievskaia <kolga@netapp.com>
  Olga Kornievskaia <olga.kornievskaia@gmail.com>
  Oliver Neukum <oneukum@suse.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Palmer Dabbelt <palmerdabbelt@google.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Peter Chen <peter.chen@nxp.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Qiushi Wu <wu000273@umn.edu>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>
  Reinette Chatre <reinette.chatre@intel.com>
  Ren Xudong <renxudong1@huawei.com>
  Robert Nelson <robertcnelson@gmail.com>
  Robin Gong <yibin.gong@nxp.com>
  Roman Bolshakov <r.bolshakov@yadro.com>
  Roman Gushchin <guro@fb.com>
  Russell King <rmk+kernel@armlinux.org.uk>
  Sabrina Dubroca <sd@queasysnail.net>
  Sagi Grimberg <sagi@grimberg.me>
  Sami Tolvanen <samitolvanen@google.com>
  Sasha Levin <sashal@kernel.org>
  Sean Christopherson <sean.j.christopherson@intel.com>
  SeongJae Park <sjpark@amazon.de>
  Shawn Guo <shawnguo@kernel.org>
  Shay Drory <shayd@mellanox.com>
  Shengjiu Wang <shengjiu.wang@nxp.com>
  Soheil Hassas Yeganeh <soheil@google.com>
  Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
  Stanislav Fomichev <sdf@google.com>
  Steffen Klassert <steffen.klassert@secunet.com>
  Steffen Maier <maier@linux.ibm.com>
  Steve French <stfrench@microsoft.com>
  Steven Rostedt (VMware) <rostedt@goodmis.org>
  Sven Auhagen <sven.auhagen@voleatech.de>
  Sven Schnelle <svens@linux.ibm.com>
  Taehee Yoo <ap420073@gmail.com>
  Takashi Iwai <tiwai@suse.de>
  Tang Bin <tangbin@cmss.chinamobile.com>
  Tariq Toukan <tariqt@mellanox.com>
  Thierry Reding <treding@nvidia.com>
  Thomas Falcon <tlfalcon@linux.ibm.com>
  Thomas Gleixner <tglx@linutronix.de>
  Thomas Martitz <t.martitz@avm.de>
  Todd Kjos <tkjos@google.com>
  Toke Høiland-Jørgensen <toke@redhat.com>
  Tom Seewald <tseewald@gmail.com>
  Tomasz Meresiński <tomasz@meresinski.eu>
  Tony Lindgren <tony@atomide.com>
  Trond Myklebust <trond.myklebust@hammerspace.com>
  Valentin Longchamp <valentin@longchamp.me>
  Vasily Averin <vvs@virtuozzo.com>
  Vasily Gorbik <gor@linux.ibm.com>
  Vidya Sagar <vidyas@nvidia.com>
  Vincent Chen <vincent.chen@sifive.com>
  Vincenzo Frascino <vincenzo.frascino@arm.com>
  Waiman Long <longman@redhat.com>
  Wang Hai <wanghai38@huawei.com>
  Weiping Zhang <zhangweiping@didiglobal.com>
  Wenhui Sheng <Wenhui.Sheng@amd.com>
  Will Deacon <will@kernel.org>
  Willem de Bruijn <willemb@google.com>
  Wolfram Sang <wsa@kernel.org>
  Xiaoyao Li <xiaoyao.li@intel.com>
  Xin Tan <tanxin.ctf@gmail.com>
  Xiyu Yang <xiyuyang19@fudan.edu.cn>
  Yang Yingliang <yangyingliang@huawei.com>
  Yash Shah <yash.shah@sifive.com>
  Ye Bin <yebin10@huawei.com>
  Yick W. Tse <y_w_tse@yahoo.com.hk>
  Yonghong Song <yhs@fb.com>
  Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  yu kuai <yukuai3@huawei.com>
  Zekun Shen <bruceshenzk@gmail.com>
  Zhang Shengju <zhangshengju@cmss.chinamobile.com>
  Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
  Zheng Bin <zhengbin13@huawei.com>

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

(No revision log; it would be 5469 lines long.)

