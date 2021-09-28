Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D4041BAF5
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 01:22:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198533.352080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVMQA-0006qY-SI; Tue, 28 Sep 2021 23:21:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198533.352080; Tue, 28 Sep 2021 23:21:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVMQA-0006o9-NJ; Tue, 28 Sep 2021 23:21:58 +0000
Received: by outflank-mailman (input) for mailman id 198533;
 Tue, 28 Sep 2021 23:21:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mVMQ9-0006nx-5D; Tue, 28 Sep 2021 23:21:57 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mVMQ8-0002vA-Pg; Tue, 28 Sep 2021 23:21:56 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mVMQ8-00063A-F5; Tue, 28 Sep 2021 23:21:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mVMQ8-00021V-EZ; Tue, 28 Sep 2021 23:21:56 +0000
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
	bh=Vv5s9w5gMjZXQFG8qF0PSrnSYDK4YgiFl+0YmGZKXlM=; b=xz723aoyTPqlYemIGdJ3sjVi9V
	eRx1qQV/X++yvpqhp4huZvTgEUtNB4vtoxRLHdXwegIh1vEFg8I5LrkE+2hntywwDetpA4bNAaIsZ
	UUckRmMi5qcFnnMY3WwpI6be9eAxRFIAhJkGP/gsUfLMZzQnuiKwG8mDLbK5G/4iy0lQ=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165234-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 165234: regressions - trouble: blocked/broken/fail/pass
X-Osstest-Failures:
    qemu-mainline:test-armhf-armhf-xl:<job status>:broken:regression
    qemu-mainline:test-armhf-armhf-xl-credit2:<job status>:broken:regression
    qemu-mainline:test-armhf-armhf-xl-cubietruck:<job status>:broken:regression
    qemu-mainline:test-armhf-armhf-xl-multivcpu:<job status>:broken:regression
    qemu-mainline:test-armhf-armhf-xl-rtds:<job status>:broken:regression
    qemu-mainline:test-armhf-armhf-xl-vhd:<job status>:broken:regression
    qemu-mainline:test-amd64-i386-qemuu-rhel6hvm-amd:<job status>:broken:regression
    qemu-mainline:test-amd64-coresched-i386-xl:<job status>:broken:regression
    qemu-mainline:test-armhf-armhf-xl-credit1:<job status>:broken:regression
    qemu-mainline:test-armhf-armhf-xl-arndale:<job status>:broken:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:<job status>:broken:regression
    qemu-mainline:test-amd64-i386-xl-vhd:<job status>:broken:regression
    qemu-mainline:test-armhf-armhf-xl-credit2:host-install(5):broken:regression
    qemu-mainline:test-armhf-armhf-xl-multivcpu:host-install(5):broken:regression
    qemu-mainline:test-armhf-armhf-xl-arndale:host-install(5):broken:regression
    qemu-mainline:test-armhf-armhf-xl-vhd:host-install(5):broken:regression
    qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:host-install(5):broken:regression
    qemu-mainline:test-amd64-coresched-i386-xl:host-install(5):broken:regression
    qemu-mainline:test-amd64-i386-qemuu-rhel6hvm-amd:host-install(5):broken:regression
    qemu-mainline:test-armhf-armhf-xl-credit1:host-install(5):broken:regression
    qemu-mainline:test-armhf-armhf-xl:host-install(5):broken:regression
    qemu-mainline:test-armhf-armhf-xl-cubietruck:host-install(5):broken:regression
    qemu-mainline:test-amd64-i386-xl-xsm:debian-install:fail:regression
    qemu-mainline:test-amd64-i386-xl-vhd:debian-di-install:fail:regression
    qemu-mainline:test-arm64-arm64-libvirt-raw:guest-start/debian.repeat:fail:regression
    qemu-mainline:build-armhf-libvirt:libvirt-build:fail:regression
    qemu-mainline:test-armhf-armhf-xl-rtds:host-install(5):broken:allowable
    qemu-mainline:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-vhd:capture-logs(13):broken:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    qemuu=14f02d8a9ec1746823c106933a4c8f062f9e0f95
X-Osstest-Versions-That:
    qemuu=99c44988d5ba1866a411450c877ed818b1b70081
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 28 Sep 2021 23:21:56 +0000

flight 165234 qemu-mainline real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165234/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl             <job status>                 broken
 test-armhf-armhf-xl-credit2     <job status>                 broken
 test-armhf-armhf-xl-cubietruck    <job status>                 broken
 test-armhf-armhf-xl-multivcpu    <job status>                 broken
 test-armhf-armhf-xl-rtds        <job status>                 broken
 test-armhf-armhf-xl-vhd         <job status>                 broken
 test-amd64-i386-qemuu-rhel6hvm-amd    <job status>                 broken
 test-amd64-coresched-i386-xl    <job status>                 broken
 test-armhf-armhf-xl-credit1     <job status>                 broken
 test-armhf-armhf-xl-arndale     <job status>                 broken
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm    <job status>             broken
 test-amd64-i386-xl-vhd          <job status>                 broken
 test-armhf-armhf-xl-credit2   5 host-install(5)        broken REGR. vs. 164950
 test-armhf-armhf-xl-multivcpu  5 host-install(5)       broken REGR. vs. 164950
 test-armhf-armhf-xl-arndale   5 host-install(5)        broken REGR. vs. 164950
 test-armhf-armhf-xl-vhd       5 host-install(5)        broken REGR. vs. 164950
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 5 host-install(5) broken REGR. vs. 164950
 test-amd64-coresched-i386-xl  5 host-install(5)        broken REGR. vs. 164950
 test-amd64-i386-qemuu-rhel6hvm-amd  5 host-install(5)  broken REGR. vs. 164950
 test-armhf-armhf-xl-credit1   5 host-install(5)        broken REGR. vs. 164950
 test-armhf-armhf-xl           5 host-install(5)        broken REGR. vs. 164950
 test-armhf-armhf-xl-cubietruck  5 host-install(5)      broken REGR. vs. 164950
 test-amd64-i386-xl-xsm       12 debian-install           fail REGR. vs. 164950
 test-amd64-i386-xl-vhd       12 debian-di-install        fail REGR. vs. 164950
 test-arm64-arm64-libvirt-raw 17 guest-start/debian.repeat fail REGR. vs. 164950
 build-armhf-libvirt           6 libvirt-build            fail REGR. vs. 164950

Regressions which are regarded as allowable (not blocking):
 test-armhf-armhf-xl-rtds      5 host-install(5)        broken REGR. vs. 164950

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-qcow2  1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-vhd       13 capture-logs(13)             broken never pass
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 164950
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 164950
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 164950
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 164950
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 164950
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 qemuu                14f02d8a9ec1746823c106933a4c8f062f9e0f95
baseline version:
 qemuu                99c44988d5ba1866a411450c877ed818b1b70081

Last test of basis   164950  2021-09-11 18:57:22 Z   17 days
Failing since        164967  2021-09-13 13:06:52 Z   15 days   30 attempts
Testing same since   165234  2021-09-28 12:56:38 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alex Chen <alex.chen@huawei.com>
  Alexander Graf <agraf@csgraf.de>
  Alexandra Clifford <aclifford@draper.com>
  AlexChen <alex.chen@huawei.com>
  Alistair Francis <alistair.francis@wdc.com>
  Amanda Strnad <astrnad@draper.com>
  Andrew Jeffery <andrew@aj.id.au>
  Anup Patel <anup.patel@wdc.com>
  Bin Meng <bmeng.cn@gmail.com>
  Cai Huoqing <caihuoqing@baidu.com>
  Chris Rauer <crauer@google.com>
  Cleber Rosa <crosa@redhat.com>
  Cédric Le Goater <clg@kaod.org>
  Daniel P. Berrangé <berrange@redhat.com>
  David Gibson <david@gibson.dropbear.id.au>
  Dongli Zhang <dongli.zhang@oracle.com>
  Dr. David Alan Gilbert <dgilbert@redhat.com>
  Eric Blake <eblake@redhat.com>
  Frank Chang <frank.chang@sifive.com>
  Gerd Hoffmann <kraxel@redhat.com>
  Green Wan <green.wan@sifive.com>
  Guenter Roeck <linux@roeck-us.net>
  Hanna Reitz <hreitz@redhat.com>
  Igor Mammedov <imammedo@redhat.com>
  Ilya Leoshkevich <iii@linux.ibm.com>
  Jason Wang <jasowang@redhat.com>
  Joel Stanley <joel@jms.id.au>
  John Arbuckle <programmingkidx@gmail.com>
  John Snow <jsnow@redhat.com>
  Jose R. Ziviani <jziviani@suse.de>
  Justin Restivo <jrestivo@draper.com>
  Kirill Tkhai <ktkhai@virtuozzo.com>
  Klaus Jensen <k.jensen@samsung.com>
  Lara Lazier <laramglazier@gmail.com>
  Laurent Vivier <laurent@vivier.eu>
  LIU Zhiwei <zhiwei_liu@c-sky.com>
  Luc Michel <lmichel@kalray.eu>
  Marc Zyngier <maz@kernel.org>
  Marc-André Lureau <marcandre.lureau@redhat.com>
  Markus Armbruster <armbru@redhat.com>
  Max Hsu <max.hsu@sifive.com>
  Max Reitz <mreitz@redhat.com>
  Michael Tokarev <mjt@tls.msk.ru>
  Michal Privoznik <mprivozn@redhat.com>
  Naveen Nagar <naveen.n1@samsung.com>
  Neil Armstrong <narmstrong@baylibre.com>
  Pankaj Gupta <pankaj.gupta.linux@gmail.com>
  Pankaj Raghav <p.raghav@samsung.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>
  Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
  Peter Collingbourne <pcc@google.com>
  Peter Delevoryas <pdel@fb.com>
  Peter Maydell <peter.maydell@linaro.org>
  Peter Xu <peterx@redhat.com>
  Philippe Mathieu-Daudé <f4bug@amsat.org>
  Philippe Mathieu-Daudé <philmd@redhat.com>
  Reinoud Zandijk <Reinoud@NetBSD.org>
  Richard Henderson <richard.henderson@linaro.org>
  Richard W.M. Jones <rjones@redhat.com>
  Roman Bolshakov <r.bolshakov@yadro.com>
  Roman Bolshakov <r.bolshakov@yadro.com> (x86 only)
  Sergio Lopez <slp@redhat.com>
  Shashi Mallela <shashi.mallela@linaro.org>
  Stefan Berger <stefanb@linux.ibm.com>
  Stefan Weil <sw@weilnetz.de>
  Stefano Garzarella <sgarzare@redhat.com>
  Thomas Huth <thuth@redhat.com>
  Viktor Prutyanov <viktor.prutyanov@phystech.edu>
  Vivek Kasireddy <vivek.kasireddy@intel.com>
  Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
  Wainer dos Santos Moschetta <wainersm@redhat.com>
  Willian Rampazzo <willianr@redhat.com>

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
 build-armhf-libvirt                                          fail    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          broken  
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 broken  
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  broken  
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       fail    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           broken  
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-armhf-armhf-xl-arndale                                  broken  
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  broken  
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  broken  
 test-armhf-armhf-xl-cubietruck                               broken  
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     blocked 
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                broken  
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               blocked 
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 fail    
 test-armhf-armhf-libvirt-raw                                 blocked 
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     broken  
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      broken  
 test-amd64-i386-xl-vhd                                       broken  


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

broken-job test-armhf-armhf-xl broken
broken-job test-armhf-armhf-xl-credit2 broken
broken-job test-armhf-armhf-xl-cubietruck broken
broken-job test-armhf-armhf-xl-multivcpu broken
broken-job test-armhf-armhf-xl-rtds broken
broken-job test-armhf-armhf-xl-vhd broken
broken-job test-amd64-i386-qemuu-rhel6hvm-amd broken
broken-job test-amd64-coresched-i386-xl broken
broken-job test-armhf-armhf-xl-credit1 broken
broken-job test-armhf-armhf-xl-arndale broken
broken-job test-amd64-i386-xl-qemuu-debianhvm-i386-xsm broken
broken-job test-amd64-i386-xl-vhd broken
broken-step test-amd64-i386-xl-vhd capture-logs(13)
broken-step test-armhf-armhf-xl-credit2 host-install(5)
broken-step test-armhf-armhf-xl-multivcpu host-install(5)
broken-step test-armhf-armhf-xl-arndale host-install(5)
broken-step test-armhf-armhf-xl-rtds host-install(5)
broken-step test-armhf-armhf-xl-vhd host-install(5)
broken-step test-amd64-i386-xl-qemuu-debianhvm-i386-xsm host-install(5)
broken-step test-amd64-coresched-i386-xl host-install(5)
broken-step test-amd64-i386-qemuu-rhel6hvm-amd host-install(5)
broken-step test-armhf-armhf-xl-credit1 host-install(5)
broken-step test-armhf-armhf-xl host-install(5)
broken-step test-armhf-armhf-xl-cubietruck host-install(5)

Not pushing.

(No revision log; it would be 6138 lines long.)

