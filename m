Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B2C400768
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 23:25:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178509.324558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMGg2-0001pL-9x; Fri, 03 Sep 2021 21:24:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178509.324558; Fri, 03 Sep 2021 21:24:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMGg2-0001mO-6c; Fri, 03 Sep 2021 21:24:46 +0000
Received: by outflank-mailman (input) for mailman id 178509;
 Fri, 03 Sep 2021 21:24:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mMGg1-0001mE-4n; Fri, 03 Sep 2021 21:24:45 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mMGg0-0005Wh-To; Fri, 03 Sep 2021 21:24:44 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mMGg0-00056A-Ij; Fri, 03 Sep 2021 21:24:44 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mMGg0-0007C3-Ht; Fri, 03 Sep 2021 21:24:44 +0000
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
	bh=tiBMzIEwgeeuAYbfzs9FxQCxkvjLao1jbvXSqezZC2s=; b=sXGHIOkIKVwMBdEVYmM03H9ykc
	wPoqjPOGtQjqH3ugxSa6bOr7yNKL4JdvgQATV1k+hBxH4Zjlaq1eShyLzoX/rSe+HNh23m69OxgZP
	qwy5DesM8JEi9vGJVmwXy9xenscLMeRVn/JmTsPIKOJYI2iW1lOd/S25Tn/ghYRI0fsw=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164793-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 164793: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=c6bf0ed9d1a727fcd98f6a52bbdd2afbdfb44924
X-Osstest-Versions-That:
    linux=fd80923202c6bfd723742fc32426a7aa3632abaa
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 03 Sep 2021 21:24:44 +0000

flight 164793 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164793/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 164501
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 164501
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 164501
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 164501
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 164501
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 164501
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 164501
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 164501
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 164501
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 164501
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 164501
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                c6bf0ed9d1a727fcd98f6a52bbdd2afbdfb44924
baseline version:
 linux                fd80923202c6bfd723742fc32426a7aa3632abaa

Last test of basis   164501  2021-08-26 13:42:10 Z    8 days
Testing same since   164793  2021-09-03 08:40:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Adrian Hunter <adrian.hunter@intel.com>
  Anand Jain <anand.jain@oracle.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andrey Ignatov <rdna@fb.com>
  Andrii Nakryiko <andriin@fb.com>
  Ariel Elior <aelior@marvell.com>
  Ben Skeggs <bskeggs@redhat.com>
  Bjorn Andersson <bjorn.andersson@linaro.org>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Colin Ian King <colin.king@canonical.com>
  Daniel Borkmann <daniel@iogearbox.net>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  DENG Qingfang <dqfext@gmail.com>
  Denis Efremov <efremov@linux.com>
  Dvora Fuxbrumer <dvorax.fuxbrumer@linux.intel.com>
  Felipe Balbi <balbi@kernel.org>
  Filipe Manana <fdmanana@suse.com>
  Florian Fainelli <f.fainelli@gmail.com>
  Florian Westphal <fw@strlen.de>
  Gal Pressman <galpress@amazon.com>
  Gerd Rausch <gerd.rausch@oracle.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guangbin Huang <huangguangbin2@huawei.com>
  Guenter Roeck <linux@roeck-us.net>
  Guojia Liao <liaoguojia@huawei.com>
  Hannes Frederic Sowa <hannes@stressinduktion.org>
  Helge Deller <deller@gmx.de>
  Hulk Robot <hulkrobot@huawei.com>
  Ingo Molnar <mingo@kernel.org>
  Jakub Kicinski <kuba@kernel.org>
  Jason Gunthorpe <jgg@nvidia.com>
  Jason Wang <jasowang@redhat.com>
  Jerome Brunet <jbrunet@baylibre.com>
  Johan Hovold <johan@kernel.org>
  John Harrison <John.C.Harrison@Intel.com>
  Jon Hunter <jonathanh@nvidia.com>
  Kefeng Wang <wangkefeng.wang@huawei.com>
  Li Jinlin <lijinlin3@huawei.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Mark Yacoub <markyacoub@chromium.org>
  Mark Yacoub <markyacoub@google.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Martin KaFai Lau <kafai@fb.com>
  Matthew Brost <matthew.brost@intel.com>
  Maxim Kiselev <bigunclemax@gmail.com>
  Michael S. Tsirkin <mst@redhat.com>
  Michal Hocko <mhocko@suse.com>
  Michał Mirosław <mirq-linux@rere.qmqm.pl>
  Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>
  Miklos Szeredi <mszeredi@redhat.com>
  Naresh Kamboju <naresh.kamboju@linaro.org>
  Naresh Kumar PBS <nareshkumar.pbs@broadcom.com>
  Neeraj Upadhyay <neeraju@codeaurora.org>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Bonzini <pbonzini@redhat.com>
  Parav Pandit <parav@nvidia.com>
  Paul Moore <paul@paul-moore.com>
  Peter Collingbourne <pcc@google.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Petr Vorel <petr.vorel@gmail.com>
  Qiu Laibin <qiulaibin@huawei.com>
  Qu Wenruo <wqu@suse.com>
  Rafael David Tinoco <rafaeldtinoco@gmail.com>
  Richard Guy Briggs <rgb@redhat.com>
  Rodrigo Vivi <rodrigo.vivi@intel.com>
  Salil Mehta <salil.mehta@huawei.com>
  Santosh Shilimkar <santosh.shilimkar@oracle.com>
  Sasha Levin <sashal@kernel.org>
  Sasha Neftin <sasha.neftin@intel.com>
  Sean Christopherson <seanjc@google.com>
  Sean Paul <seanpaul@chromium.org>
  Selvin Xavier <selvin.xavier@broadcom.com>
  Shai Malin <smalin@marvell.com>
  Shaik Sajida Bhanu <sbhanu@codeaurora.org>
  Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Stefan Mätje <stefan.maetje@esd.eu>
  Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
  Sudip Mukherjee <sudipm.mukherjee@gmail.com>
  Thinh Nguyen <Thinh.Nguyen@synopsys.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Tuo Li <islituo@gmail.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Vineet Gupta <vgupta@synopsys.com>
  Viresh Kumar <viresh.kumar@linaro.org>
  Wesley Cheng <wcheng@codeaurora.org>
  Xiaolong Huang <butterflyhuangxx@gmail.com>
  Yafang Shao <laoar.shao@gmail.com>
  Yufeng Mo <moyufeng@huawei.com>
  Zhengjun Zhang <zhangzhengjun@aicrobo.com>

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
   fd80923202c6..c6bf0ed9d1a7  c6bf0ed9d1a727fcd98f6a52bbdd2afbdfb44924 -> tested/linux-5.4

