Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 632465F83CE
	for <lists+xen-devel@lfdr.de>; Sat,  8 Oct 2022 08:19:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.418434.663247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oh3AE-0005GR-42; Sat, 08 Oct 2022 06:18:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 418434.663247; Sat, 08 Oct 2022 06:18:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oh3AE-0005Di-0l; Sat, 08 Oct 2022 06:18:22 +0000
Received: by outflank-mailman (input) for mailman id 418434;
 Sat, 08 Oct 2022 06:18:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oh3AC-0005DY-2q; Sat, 08 Oct 2022 06:18:20 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oh3AB-0000lF-W6; Sat, 08 Oct 2022 06:18:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oh3AB-0001sc-Fa; Sat, 08 Oct 2022 06:18:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oh3AB-0006v3-F8; Sat, 08 Oct 2022 06:18:19 +0000
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
	bh=6U86gp7GEfzxoHIRnsKF0boqBLUy7A59jueEPzDTD1A=; b=uR34gs+/xaAGU9WDRn33obbGKw
	Wd9sk6e8dbmiBDtckhDxHHazYZAWgj/Ov+ZTTIXHky3OCyQF5sRiCAltfvKhDN+Z5pbYcnhPrnJZv
	fq+Fzeg4am3nQF69V+LUXdpNunC5xhPeBAe8GsNkjlHxDxsz7vfWNFi0k18pJWztLcjc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173462-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 173462: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-pair:debian-fixup/dst_host:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=9d84bb40bcb30a7fa16f33baa967aeb9953dda78
X-Osstest-Versions-That:
    linux=4c86114194e644b6da9107d75910635c9e87179e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 08 Oct 2022 06:18:19 +0000

flight 173462 linux-linus real [real]
flight 173467 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/173462/
http://logs.test-lab.xenproject.org/osstest/logs/173467/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-pair      21 debian-fixup/dst_host fail pass in 173467-retest

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 173456
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 173456
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 173456
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 173456
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 173456
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 173456
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 173456
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 173456
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass

version targeted for testing:
 linux                9d84bb40bcb30a7fa16f33baa967aeb9953dda78
baseline version:
 linux                4c86114194e644b6da9107d75910635c9e87179e

Last test of basis   173456  2022-10-07 08:23:54 Z    0 days
Testing same since   173462  2022-10-07 18:41:45 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Al Viro <viro@zeniv.linux.org.uk>
  Anuj Gupta <anuj20.g@samsung.com>
  Atte Heikkilä <atteh.mailbox@gmail.com>
  Bart Van Assche <bvanassche@acm.org>
  Christian Brauner (Microsoft) <brauner@kernel.org>
  Christian Brauner <brauner@kernel.org>
  Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
  Christoph Hellwig <hch@lst.de>
  Coly Li <colyli@suse.de>
  Daniel Wagner <dwagner@suse.de>
  Dave Airlie <airlied@redhat.com>
  David Sloan <david.sloan@eideticom.com>
  David Sterba <dsterba@suse.com>
  Douglas Miller <dougmill@linux.vnet.ibm.com>
  dougmill@linux.vnet.ibm.com <dougmill@linux.vnet.ibm.com>
  Dylan Yudaken <dylany@fb.com>
  Fabio M. De Francesco <fmdefrancesco@gmail.com>
  Gao Xiang <hsiangkao@linux.alibaba.com>
  Gaosheng Cui <cuigaosheng1@huawei.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Genjian Zhang <zhanggenjian@kylinos.cn>
  Geoff Levand <geoff@infradead.org>
  Guixin Liu <kanie@linux.alibaba.com>
  Guoqing Jiang <guoqing.jiang@linux.dev>
  Hannes Reinecke <hare@suse.de>
  Hugh Dickins <hughd@google.com>
  Hyunchul Lee <hyc.lee@gmail.com>
  Jack Wang <jinpu.wang@ionos.com>
  Jackie Liu <liuyun01@kylinos.cn>
  Jan Kara <jack@suse.cz>
  Jens Axboe <axboe@kernel.dk>
  Jiangshan Yi <yijiangshan@kylinos.cn>
  Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
  Jilin Yuan <yuanjilin@cdjrlc.com>
  Johannes Weiner <hannes@cmpxchg.org>
  Jules Maselbas <jmaselbas@kalray.eu>
  Kanchan Joshi <joshi.k@samsung.com>
  Keith Busch <kbusch@kernel.org>
  Li Jinlin <lijinlin3@huawei.com>
  Li Lei <lilei@szsandstone.com>
  Li zeming <zeming@nfschina.com>
  Lin Feng <linf@wangsu.com>
  Linjun Bao <meljbao@gmail.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Liu Shixin <liushixin2@huawei.com>
  Liu Song <liusong@linux.alibaba.com>
  Logan Gunthorpe <logang@deltatee.com>
  Luca Boccassi <bluca@debian.org>
  Martin Belanger <martin.belanger@dell.com>
  Md Haris Iqbal <haris.iqbal@ionos.com>
  Miaohe Lin <linmiaohe@huawei.com>
  Mickaël Salaün <mic@digikod.net>
  Minghao Chi <chi.minghao@zte.com.cn>
  Mingzhe Zou <mingzhe.zou@easystack.cn>
  Namjae Jeon <linkinjeon@kernel.org>
  Pankaj Raghav <p.raghav@samsung.com>
  Paul Menzel <pmenzel@molgen.mpg.de>
  Pavel Begunkov <asml.silence@gmail.com>
  Ping-Xiang Chen <p.x.chen.1005@gmail.com>
  Ping-Xiang Chen <p.x.chen@uci.edu>
  Rishabh Bhatnagar <risbhat@amazon.com>
  Sagi Grimberg <sagi@grimberg.me>
  Santosh Pradhan <santosh.pradhan@ionos.com>
  Saurabh Sengar <ssengar@linux.microsoft.com>
  Shigeru Yoshida <syoshida@redhat.com>
  Song Liu <song@kernel.org>
  Stefan Haberland <sth@linux.ibm.com>
  Stefan Metzmacher <metze@samba.org>
  Steve French <stfrench@microsoft.com>
  Tejun Heo <tj@kernel.org>
  Tom Talpey <tom@talpey.com>
  Uros Bizjak <ubizjak@gmail.com>
  Varun Prakash <varun@chelsio.com>
  Wolfram Sang <wsa+renesas@sang-engineering.com>
  XU pengfei <xupengfei@nfschina.com>
  ye xingchen <ye.xingchen@zte.com.cn>
  Yu Kuai <yukuai3@huawei.com>
  Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
  zhenwei pi <pizhenwei@bytedance.com>
  Zhihao Cheng <chengzhihao1@huawei.com>
  Zhou nan <zhounan@nfschina.com>
  ZiyangZhang <ZiyangZhang@linux.alibaba.com>

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
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
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
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
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
 test-amd64-amd64-pair                                        fail    
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
 test-arm64-arm64-xl-seattle                                  pass    
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
   4c86114194e6..9d84bb40bcb3  9d84bb40bcb30a7fa16f33baa967aeb9953dda78 -> tested/linux-linus

