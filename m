Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9902426E5
	for <lists+xen-devel@lfdr.de>; Wed, 12 Aug 2020 10:44:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5mMJ-0002LM-0y; Wed, 12 Aug 2020 08:43:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OV9a=BW=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1k5mMG-0002K6-TU
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2020 08:43:40 +0000
X-Inumbo-ID: b53ac766-6aa6-4ef8-b18c-8163278107ab
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b53ac766-6aa6-4ef8-b18c-8163278107ab;
 Wed, 12 Aug 2020 08:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pVX8QpPomszbmTzvUNr9sqsMktYFGihiQoBSJ5meEm4=; b=sPEeSGJMsD8QmtB6lUpNJaGj3
 n7yuP5wXUFzKkpYApTSlcM+AfE4UZGIOgLFZiRILaG919t4kXs3ov5LWtaU5BQkdEF4Whh6BbloEE
 kYFwetCLrEsRifH8D6Brfe53I9N/QScRGAW2O4TSnTyBNM3PMlrx49hxBvsFMkARvl7rg=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k5mM9-0008Sz-3r; Wed, 12 Aug 2020 08:43:33 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k5mM8-0000Ca-SL; Wed, 12 Aug 2020 08:43:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1k5mM8-0005N1-Pm; Wed, 12 Aug 2020 08:43:32 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152562-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 152562: tolerable FAIL - PUSHED
X-Osstest-Failures: linux-5.4:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
X-Osstest-Versions-This: linux=cad17feaf0d05e60f7fe3c29908f9e2d07fbb7ee
X-Osstest-Versions-That: linux=d9939285fc818425ae92bd99f8c97b6b9ef3bb88
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 12 Aug 2020 08:43:32 +0000
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

flight 152562 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152562/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-rtds     16 guest-start/debian.repeat    fail  like 152514
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop             fail never pass
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop              fail never pass
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop              fail never pass
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop             fail never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop             fail never pass
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop             fail never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass

version targeted for testing:
 linux                cad17feaf0d05e60f7fe3c29908f9e2d07fbb7ee
baseline version:
 linux                d9939285fc818425ae92bd99f8c97b6b9ef3bb88

Last test of basis   152514  2020-08-07 07:44:50 Z    5 days
Testing same since   152562  2020-08-11 13:43:24 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aaron Brown <aaron.f.brown@intel.com>
  Adam Ford <aford173@gmail.com>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
  Ben Skeggs <bskeggs@redhat.com>
  Bruno Meneguele <bmeneg@redhat.com>
  Casey Schaufler <casey@schaufler-ca.com>
  Christoph Hellwig <hch@lst.de>
  Christophe Leroy <christophe.leroy@csgroup.eu>
  Chuck Lever <chuck.lever@oracle.com>
  Colin Ian King <colin.king@canonical.com>
  Cong Wang <xiyou.wangcong@gmail.com>
  Connor McAdams <conmanx360@gmail.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  David Howells <dhowells@redhat.com>
  David S. Miller <davem@davemloft.net>
  David Woodhouse <dwmw2@infradead.org>
  Dean Nelson <dnelson@redhat.com>
  Dexuan Cui <decui@microsoft.com>
  Dinghao Liu <dinghao.liu@zju.edu.cn>
  Dominique Martinet <asmadeus@codewreck.org>
  Eric Biggers <ebiggers@google.com>
  Eric Dumazet <edumazet@google.com>
  Erik Ekman <erik@kryo.se>
  Forest Crossman <cyrozap@gmail.com>
  Francesco Ruggeri <fruggeri@arista.com>
  Frank van der Linden <fllinden@amazon.com>
  Frank Wunderlich <frank-w@public-files.de>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guillaume Nault <gnault@redhat.com>
  Guoyu Huang <hgy5945@gmail.com>
  Hangbin Liu <liuhangbin@gmail.com>
  Huacai Chen <chenhc@lemote.com>
  Hui Wang <hui.wang@canonical.com>
  Ido Schimmel <idosch@mellanox.com>
  Jann Horn <jannh@google.com>
  Jens Axboe <axboe@kernel.dk>
  Jianfeng Wang <jfwang@google.com>
  Johan Hovold <johan@kernel.org>
  Johannes Berg <johannes.berg@intel.com>
  Julia Lawall <julia.lawall@inria.fr>
  Julian Squires <julian@cipht.net>
  Kai-Heng Feng <kai.heng.feng@canonical.com>
  Kan Liang <kan.liang@linux.intel.com>
  Kevin Yang <yyd@google.com>
  Landen Chao <landen.chao@mediatek.com>
  Liu Yong <pkfxxxing@gmail.com>
  Lorenzo Bianconi <lorenzo@kernel.org>
  Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
  Lukas Wunner <lukas@wunner.de>
  Marcel Holtmann <marcel@holtmann.org>
  Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
  Mathias Nyman <mathias.nyman@linux.intel.com>
  Matthias Maennich <maennich@google.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael S. Tsirkin <mst@redhat.com>
  Mimi Zohar <zohar@linux.ibm.com>
  Neal Cardwell <ncardwell@google.com>
  Nicolas Chauvet <kwizart@gmail.com>
  Pavel Machek <pavel@ucw.cz>
  Peilin Ye <yepeilin.cs@gmail.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Peter Zijlstra <peterz@infradead.org>
  Philippe Duplessis-Guindon <pduplessis@efficios.com>
  Qiushi Wu <wu000273@umn.edu>
  Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
  René van Dorst <opensource@vdorst.com>
  Richard Weinberger <richard@nod.at>
  Rustam Kovhaev <rkovhaev@gmail.com>
  Sam Ravnborg <sam@ravnborg.org>
  Sasha Levin <sashal@kernel.org>
  Shuah Khan <skhan@linuxfoundation.org>
  Stephen Hemminger <stephen@networkplumber.org>
  Suren Baghdasaryan <surenb@google.com>
  Takashi Iwai <tiwai@suse.de>
  Todd Kjos <tkjos@google.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Vincent Duvert <vincent.ldev@duvert.net>
  Willem de Bruijn <willemb@google.com>
  Wolfram Sang <wsa+renesas@sang-engineering.com>
  Wolfram Sang <wsa@kernel.org>
  Xin Long <lucien.xin@gmail.com>
  Xin Tan <tanxin.ctf@gmail.com>
  Xin Xiong <xiongx18@fudan.edu.cn>
  Xiyu Yang <xiyuyang19@fudan.edu.cn>
  Yuchung Cheng <ycheng@google.com>
  YueHaibing <yuehaibing@huawei.com>
  Yunhai Zhang <zhangyunhai@nsfocus.com>

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
 test-armhf-armhf-xl-rtds                                     fail    
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
   d9939285fc81..cad17feaf0d0  cad17feaf0d05e60f7fe3c29908f9e2d07fbb7ee -> tested/linux-5.4

