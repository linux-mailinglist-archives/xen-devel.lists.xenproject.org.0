Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E351E4655B9
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 19:43:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236188.409679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msUYy-0003a2-Aq; Wed, 01 Dec 2021 18:42:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236188.409679; Wed, 01 Dec 2021 18:42:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msUYy-0003X0-6F; Wed, 01 Dec 2021 18:42:40 +0000
Received: by outflank-mailman (input) for mailman id 236188;
 Wed, 01 Dec 2021 18:42:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1msUYw-0003Wq-PG; Wed, 01 Dec 2021 18:42:38 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1msUYw-00026q-Ey; Wed, 01 Dec 2021 18:42:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1msUYw-0002FJ-2t; Wed, 01 Dec 2021 18:42:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1msUYw-0007g4-2O; Wed, 01 Dec 2021 18:42:38 +0000
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
	bh=cE3CuXbSlL0EpGHJY/w/jar8tVaqiBNkTDNUSWAE29s=; b=lRQiO6xGYGUds8r3Cib5K0w7W1
	h6bnytwJQHj2LgYl4xXy58DqjQzg2AFvUDd7F6OsMU8KbbaDUcRYpo6csZW8pzWKZpisTIB/LYr6e
	4eSHrAsin1KuNxS96jUH9vzUt0p/NMT4pTlvPUrekLkS+OXucdkT/5RMzjLvVyHZteng=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-166969-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 166969: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-xl:guest-start:fail:regression
    linux-linus:test-amd64-amd64-qemuu-nested-amd:nested-setup:fail:regression
    linux-linus:test-amd64-coresched-amd64-xl:guest-start/debian.repeat:fail:regression
    linux-linus:test-amd64-amd64-xl-pvhv2-amd:guest-start/debian.repeat:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:guest-saverestore:fail:regression
    linux-linus:test-amd64-amd64-dom0pvh-xl-amd:guest-start/debian.repeat:fail:regression
    linux-linus:test-amd64-amd64-dom0pvh-xl-intel:guest-start/debian.repeat:fail:regression
    linux-linus:test-amd64-amd64-xl-multivcpu:guest-start/debian.repeat:fail:regression
    linux-linus:test-amd64-amd64-xl-pvshim:guest-start/debian.repeat:fail:regression
    linux-linus:test-amd64-amd64-xl-shadow:guest-start/debian.repeat:fail:regression
    linux-linus:test-amd64-amd64-libvirt-xsm:guest-start/debian.repeat:fail:regression
    linux-linus:test-amd64-amd64-xl-credit1:guest-start/debian.repeat:fail:regression
    linux-linus:test-amd64-amd64-xl-credit2:guest-start/debian.repeat:fail:regression
    linux-linus:test-amd64-amd64-libvirt:guest-start/debian.repeat:fail:regression
    linux-linus:test-amd64-amd64-xl-pvhv2-intel:guest-start/debian.repeat:fail:regression
    linux-linus:test-armhf-armhf-xl-multivcpu:guest-start:fail:regression
    linux-linus:test-armhf-armhf-xl-arndale:guest-start/debian.repeat:fail:regression
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:guest-start/debianhvm.repeat:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:guest-start/debianhvm.repeat:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-amd64:guest-start/debianhvm.repeat:fail:regression
    linux-linus:test-armhf-armhf-xl-credit2:guest-start/debian.repeat:fail:regression
    linux-linus:test-armhf-armhf-xl-credit1:guest-start/debian.repeat:fail:regression
    linux-linus:test-armhf-armhf-xl:guest-start/debian.repeat:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:guest-start/debianhvm.repeat:fail:regression
    linux-linus:build-arm64-pvops:kernel-build:fail:regression
    linux-linus:test-armhf-armhf-libvirt-qcow2:guest-start/debian.repeat:fail:regression
    linux-linus:test-amd64-amd64-xl-rtds:guest-start/debian.repeat:fail:allowable
    linux-linus:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:allowable
    linux-linus:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-examine:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=58e1100fdc5990b0cc0d4beaf2562a92e621ac7d
X-Osstest-Versions-That:
    linux=c5c17547b778975b3d83a73c8d84e8fb5ecf3ba5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 01 Dec 2021 18:42:38 +0000

flight 166969 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/166969/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl          14 guest-start              fail REGR. vs. 166942
 test-amd64-amd64-qemuu-nested-amd 13 nested-setup        fail REGR. vs. 166942
 test-amd64-coresched-amd64-xl 22 guest-start/debian.repeat fail REGR. vs. 166942
 test-amd64-amd64-xl-pvhv2-amd 22 guest-start/debian.repeat fail REGR. vs. 166942
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 15 guest-saverestore fail REGR. vs. 166942
 test-amd64-amd64-dom0pvh-xl-amd 22 guest-start/debian.repeat fail REGR. vs. 166942
 test-amd64-amd64-dom0pvh-xl-intel 22 guest-start/debian.repeat fail REGR. vs. 166942
 test-amd64-amd64-xl-multivcpu 22 guest-start/debian.repeat fail REGR. vs. 166942
 test-amd64-amd64-xl-pvshim  22 guest-start/debian.repeat fail REGR. vs. 166942
 test-amd64-amd64-xl-shadow  22 guest-start/debian.repeat fail REGR. vs. 166942
 test-amd64-amd64-libvirt-xsm 20 guest-start/debian.repeat fail REGR. vs. 166942
 test-amd64-amd64-xl-credit1 22 guest-start/debian.repeat fail REGR. vs. 166942
 test-amd64-amd64-xl-credit2 22 guest-start/debian.repeat fail REGR. vs. 166942
 test-amd64-amd64-libvirt    20 guest-start/debian.repeat fail REGR. vs. 166942
 test-amd64-amd64-xl-pvhv2-intel 22 guest-start/debian.repeat fail REGR. vs. 166942
 test-armhf-armhf-xl-multivcpu 14 guest-start             fail REGR. vs. 166942
 test-armhf-armhf-xl-arndale 18 guest-start/debian.repeat fail REGR. vs. 166942
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 18 guest-start/debianhvm.repeat fail REGR. vs. 166942
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 20 guest-start/debianhvm.repeat fail REGR. vs. 166942
 test-amd64-amd64-xl-qemut-debianhvm-amd64 20 guest-start/debianhvm.repeat fail REGR. vs. 166942
 test-armhf-armhf-xl-credit2 18 guest-start/debian.repeat fail REGR. vs. 166942
 test-armhf-armhf-xl-credit1 18 guest-start/debian.repeat fail REGR. vs. 166942
 test-armhf-armhf-xl         18 guest-start/debian.repeat fail REGR. vs. 166942
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 20 guest-start/debianhvm.repeat fail REGR. vs. 166942
 build-arm64-pvops             6 kernel-build             fail REGR. vs. 166942
 test-armhf-armhf-libvirt-qcow2 17 guest-start/debian.repeat fail REGR. vs. 166942

Regressions which are regarded as allowable (not blocking):
 test-amd64-amd64-xl-rtds    22 guest-start/debian.repeat fail REGR. vs. 166942
 test-armhf-armhf-xl-rtds    18 guest-start/debian.repeat fail REGR. vs. 166942

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-arm64-arm64-examine      1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-seattle   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-vhd       1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 166942
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 166942
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 166942
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 166942
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 166942
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 166942
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 166942
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass

version targeted for testing:
 linux                58e1100fdc5990b0cc0d4beaf2562a92e621ac7d
baseline version:
 linux                c5c17547b778975b3d83a73c8d84e8fb5ecf3ba5

Last test of basis   166942  2021-11-27 18:11:40 Z    4 days
Failing since        166963  2021-11-30 20:54:02 Z    0 days    2 attempts
Testing same since   166969  2021-12-01 08:33:40 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alex Bee <knaerzche@gmail.com>
  Alex Williamson <alex.williamson@redhat.com>
  Andreas Gruenbacher <agruenba@redhat.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Anup Patel <anup.patel@wdc.com>
  Bean Huo <beanhuo@micron.com>
  Ben Gardon <bgardon@google.com>
  Benjamin Coddington <bcodding@redhat.com>
  Borislav Petkov <bp@suse.de>
  Catalin Marinas <catalin.marinas@arm.com>
  Christoph Hellwig <hch@lst.de>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Christophe Leroy <christophe.leroy@csgroup.eu>
  Dan Carpenter <dan.carpenter@oracle.com>
  Dan Johansen <strit@manjaro.org>
  Darrick J. Wong <djwong@kernel.org>
  David Howells <dhowells@redhat.com>
  David Woodhouse <dwmw@amazon.co.uk>
  Douglas Gilbert <dgilbert@interlog.com>
  Fuad Tabba <tabba@google.com>
  Gao Xiang <xiang@kernel.org>
  George Kennedy <george.kennedy@oracle.com>
  Giovanni Cabiddu <giovanni.cabiddu@intel.com>
  Guenter Roeck <linux@roeck-us.net>
  Hou Wenlong <houwenlong93@linux.alibaba.com>
  Huang Jianan <huangjianan@oppo.com>
  Huang Pei <huangpei@loongson.cn>
  Hyunchul Lee <hyc.lee@gmail.com>
  Jason A. Donenfeld <Jason@zx2c4.com>
  Jason Wang <jasowang@redhat.com>
  Jens Axboe <axboe@kernel.dk>
  Joerg Roedel <jroedel@suse.de>
  Juergen Gross <jgross@suse.com>
  Lai Jiangshan <laijs@linux.alibaba.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Longpeng <longpeng2@huawei.com>
  Lu Baolu <baolu.lu@linux.intel.com>
  Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
  Marc Zyngier <maz@kernel.org>
  Marco Elver <elver@google.com>
  Mark Rutland <mark.rutland@arm.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Matthew Wilcox (Oracle) <willy@infradead.org>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael S. Tsirkin <mst@redhat.com>
  Mike Christie <michael.christie@oracle.com>
  Muchun Song <songmuchun@bytedance.com>
  Namjae Jeon <linkinjeon@kernel.org>
  NeilBrown <neilb@suse.de>
  Nicholas Piggin <npiggin@gmail.com>
  Olga Kornievskaia <kolga@netapp.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Paul Cercueil <paul@crapouillou.net>
  Pavel Begunkov <asml.silence@gmail.com>
  Peter Geis <pgwipeout@gmail.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Qian Cai <quic_qiancai@quicinc.com>
  Salvatore Bonaccorso <carnil@debian.org>
  Sean Christopherson <seanjc@google.com>
  Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
  Sreekanth Reddy <sreekanth.reddy@broadcom.com>
  Stefano Garzarella <sgarzare@redhat.com>
  Steve French <stfrench@microsoft.com>
  Steven Rostedt (VMware) <rostedt@goodmis.org>
  Thiago Rafael Becker <trbecker@gmail.com>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Tiezhu Yang <yangtiezhu@loongson.cn>
  Trond Myklebust <trond.myklebust@hammerspace.com>
  Vitaly Kuznetsov <vkuznets@redhat.com>
  Waiman Long <longman@redhat.com>
  Wu Zongyong <wuzongyong@linux.alibaba.com>
  Yang Xu <xuyang2018.jy@fujitsu.com>
  Ye Bin <yebin10@huawei.com>
  Ye Guojin <ye.guojin@zte.com.cn>

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
 build-arm64-pvops                                            fail    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          fail    
 test-amd64-coresched-amd64-xl                                fail    
 test-arm64-arm64-xl                                          blocked 
 test-armhf-armhf-xl                                          fail    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           fail    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        fail    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 fail    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 fail    
 test-amd64-amd64-libvirt-xsm                                 fail    
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      blocked 
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                fail    
 test-amd64-amd64-dom0pvh-xl-amd                              fail    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-freebsd11-amd64                             pass    
 test-amd64-amd64-freebsd12-amd64                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-armhf-armhf-xl-arndale                                  fail    
 test-amd64-amd64-xl-credit1                                  fail    
 test-arm64-arm64-xl-credit1                                  blocked 
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  fail    
 test-arm64-arm64-xl-credit2                                  blocked 
 test-armhf-armhf-xl-credit2                                  fail    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     blocked 
 test-armhf-armhf-examine                                     pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              fail    
 test-amd64-amd64-dom0pvh-xl-intel                            fail    
 test-amd64-amd64-libvirt                                     fail    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-amd64-xl-multivcpu                                fail    
 test-armhf-armhf-xl-multivcpu                                fail    
 test-amd64-amd64-pair                                        pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-amd64-xl-pvshim                                   fail    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-libvirt-qcow2                               pass    
 test-armhf-armhf-libvirt-qcow2                               fail    
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 blocked 
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-amd64-xl-rtds                                     fail    
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   fail    
 test-arm64-arm64-xl-thunderx                                 blocked 
 test-amd64-amd64-xl-vhd                                      pass    
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

(No revision log; it would be 3187 lines long.)

