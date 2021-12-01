Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D216C4649B0
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 09:30:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235663.408791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msL01-0004W5-TD; Wed, 01 Dec 2021 08:29:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235663.408791; Wed, 01 Dec 2021 08:29:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msL01-0004TT-Q1; Wed, 01 Dec 2021 08:29:57 +0000
Received: by outflank-mailman (input) for mailman id 235663;
 Wed, 01 Dec 2021 08:29:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1msL00-0004TJ-Lc; Wed, 01 Dec 2021 08:29:56 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1msL00-0007dG-CX; Wed, 01 Dec 2021 08:29:56 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1msL00-0005LP-2Y; Wed, 01 Dec 2021 08:29:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1msL00-0001on-1z; Wed, 01 Dec 2021 08:29:56 +0000
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
	bh=xjzMo4u2cXPBDU9ezLfysIPyNcXJFLP0/wdPxXk5sjA=; b=Mowvwgj1BWC0hOTQqkLf2Ewnla
	jQHeX5itGAx7vtBrjU+FrHN8d/vyKe8OXIntaqFDcSuHWUbOGKWJXA1vKUqWXl6zzskh4KxrSiNj4
	fm3aAG3uIs1dQhgmPuaVrrFt9UHgx3GdpLXm9rXVNkriZ+THC66k+Am78yVdS6MDK4/k=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-166963-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 166963: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-xl-pvhv2-amd:guest-start/debian.repeat:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
    linux-linus:test-amd64-amd64-dom0pvh-xl-amd:guest-start/debian.repeat:fail:regression
    linux-linus:test-amd64-amd64-xl-multivcpu:guest-start/debian.repeat:fail:regression
    linux-linus:test-amd64-amd64-libvirt:guest-start/debian.repeat:fail:regression
    linux-linus:test-amd64-amd64-xl:guest-start/debian.repeat:fail:regression
    linux-linus:test-amd64-amd64-xl-pvhv2-intel:guest-start/debian.repeat:fail:regression
    linux-linus:test-amd64-amd64-xl-credit1:guest-start/debian.repeat:fail:regression
    linux-linus:test-amd64-amd64-dom0pvh-xl-intel:guest-start/debian.repeat:fail:regression
    linux-linus:test-amd64-amd64-freebsd12-amd64:guest-start/freebsd.repeat:fail:regression
    linux-linus:test-amd64-amd64-pygrub:guest-start/debian.repeat:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-amd64:guest-start/debianhvm.repeat:fail:regression
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:guest-start/debianhvm.repeat:fail:regression
    linux-linus:test-amd64-amd64-xl-rtds:guest-start/debian.repeat:fail:allowable
    linux-linus:test-armhf-armhf-xl-rtds:guest-start:fail:allowable
    linux-linus:test-armhf-armhf-xl-vhd:guest-start/debian.repeat:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=f080815fdb3e3cff5a004ca83b3815ac17ef71b1
X-Osstest-Versions-That:
    linux=c5c17547b778975b3d83a73c8d84e8fb5ecf3ba5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 01 Dec 2021 08:29:56 +0000

flight 166963 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/166963/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-pvhv2-amd 22 guest-start/debian.repeat fail REGR. vs. 166942
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 12 debian-hvm-install fail REGR. vs. 166942
 test-amd64-amd64-dom0pvh-xl-amd 22 guest-start/debian.repeat fail REGR. vs. 166942
 test-amd64-amd64-xl-multivcpu 22 guest-start/debian.repeat fail REGR. vs. 166942
 test-amd64-amd64-libvirt    20 guest-start/debian.repeat fail REGR. vs. 166942
 test-amd64-amd64-xl         22 guest-start/debian.repeat fail REGR. vs. 166942
 test-amd64-amd64-xl-pvhv2-intel 22 guest-start/debian.repeat fail REGR. vs. 166942
 test-amd64-amd64-xl-credit1 22 guest-start/debian.repeat fail REGR. vs. 166942
 test-amd64-amd64-dom0pvh-xl-intel 22 guest-start/debian.repeat fail REGR. vs. 166942
 test-amd64-amd64-freebsd12-amd64 21 guest-start/freebsd.repeat fail REGR. vs. 166942
 test-amd64-amd64-pygrub     21 guest-start/debian.repeat fail REGR. vs. 166942
 test-amd64-amd64-xl-qemut-debianhvm-amd64 20 guest-start/debianhvm.repeat fail REGR. vs. 166942
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 20 guest-start/debianhvm.repeat fail REGR. vs. 166942

Regressions which are regarded as allowable (not blocking):
 test-amd64-amd64-xl-rtds    22 guest-start/debian.repeat fail REGR. vs. 166942
 test-armhf-armhf-xl-rtds     14 guest-start              fail REGR. vs. 166942

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-vhd    17 guest-start/debian.repeat fail blocked in 166942
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 166942
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 166942
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 166942
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 166942
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 166942
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 166942
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 166942
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 166942
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass

version targeted for testing:
 linux                f080815fdb3e3cff5a004ca83b3815ac17ef71b1
baseline version:
 linux                c5c17547b778975b3d83a73c8d84e8fb5ecf3ba5

Last test of basis   166942  2021-11-27 18:11:40 Z    3 days
Testing same since   166963  2021-11-30 20:54:02 Z    0 days    1 attempts

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
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          fail    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        fail    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 fail    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                fail    
 test-amd64-amd64-dom0pvh-xl-amd                              fail    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-freebsd11-amd64                             pass    
 test-amd64-amd64-freebsd12-amd64                             fail    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-xl-credit1                                  fail    
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
 test-amd64-amd64-xl-pvhv2-intel                              fail    
 test-amd64-amd64-dom0pvh-xl-intel                            fail    
 test-amd64-amd64-libvirt                                     fail    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-amd64-xl-multivcpu                                fail    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-amd64-pygrub                                      fail    
 test-amd64-amd64-libvirt-qcow2                               pass    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-amd64-xl-rtds                                     fail    
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      fail    


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

(No revision log; it would be 3172 lines long.)

