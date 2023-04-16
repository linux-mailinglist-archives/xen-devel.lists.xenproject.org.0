Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C70DB6E3B7F
	for <lists+xen-devel@lfdr.de>; Sun, 16 Apr 2023 21:20:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521624.810448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1po7tr-0005p5-P9; Sun, 16 Apr 2023 19:18:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521624.810448; Sun, 16 Apr 2023 19:18:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1po7tr-0005mL-Lb; Sun, 16 Apr 2023 19:18:59 +0000
Received: by outflank-mailman (input) for mailman id 521624;
 Sun, 16 Apr 2023 19:18:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1po7tp-0005m8-CM; Sun, 16 Apr 2023 19:18:57 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1po7tp-0003Tr-3f; Sun, 16 Apr 2023 19:18:57 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1po7to-0002wp-Kj; Sun, 16 Apr 2023 19:18:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1po7to-00020b-KD; Sun, 16 Apr 2023 19:18:56 +0000
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
	bh=tlHDmTMMqfGEaWj3C9rwITNE69pha72RMRJKjLJIZHo=; b=6q2TaeE6XdpBu2idW6vKfTcxHp
	823XE+VLGgKjNelsrntmWO7ylOVNNi9l6/aIEHcDtKM7XwJuDSzxCukATgHw5q4kLfPpP9EAOT/SW
	NzjUKFTKLBTCxPWXLhGecVnWecZ/tKcPxs1MM/m4YJNJNmjG10paqASHfUu5kkyyW4QA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180274-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 180274: trouble: broken/fail/pass
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-xl-multivcpu:<job status>:broken:regression
    linux-linus:test-armhf-armhf-xl-rtds:<job status>:broken:regression
    linux-linus:test-armhf-armhf-xl-multivcpu:host-install(5):broken:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:host-install(5):broken:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:xen-boot:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-examine:reboot:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:xen-boot:fail:nonblocking
X-Osstest-Versions-This:
    linux=3e7bb4f2461710b70887704af7f175383251088e
X-Osstest-Versions-That:
    linux=44149752e9987a9eac5ad78e6d3a20934b5e018d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 16 Apr 2023 19:18:56 +0000

flight 180274 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180274/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl-multivcpu    <job status>                 broken
 test-armhf-armhf-xl-rtds        <job status>                 broken

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-multivcpu  5 host-install(5)      broken starved in 180253
 test-armhf-armhf-xl-rtds      5 host-install(5)       broken starved in 180253
 test-armhf-armhf-xl-arndale   8 xen-boot                fail baseline untested
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 180253
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 180253
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 180253
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 180253
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 180253
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-examine      8 reboot                  fail starved in 180253
 test-armhf-armhf-libvirt      8 xen-boot                fail starved in 180253
 test-armhf-armhf-xl-vhd       8 xen-boot                fail starved in 180253
 test-armhf-armhf-libvirt-qcow2  8 xen-boot              fail starved in 180253
 test-armhf-armhf-xl           8 xen-boot                fail starved in 180253
 test-armhf-armhf-xl-credit2   8 xen-boot                fail starved in 180253
 test-armhf-armhf-libvirt-raw  8 xen-boot                fail starved in 180253

version targeted for testing:
 linux                3e7bb4f2461710b70887704af7f175383251088e
baseline version:
 linux                44149752e9987a9eac5ad78e6d3a20934b5e018d

Last test of basis   180253  2023-04-14 01:13:19 Z    2 days
Failing since        180264  2023-04-14 18:10:06 Z    2 days    5 attempts
Testing same since   180274  2023-04-16 10:58:47 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alexandre Ghiti <alexghiti@rivosinc.com>
  Cheng Xu <chengyou@linux.alibaba.com>
  Christoph Hellwig <hch@lst.de>
  Conor Dooley <conor.dooley@microchip.com>
  David Disseldorp <ddiss@suse.de>
  Duy Truong <dory@dory.moe>
  Erik Brakkee <erik@brakkee.org>
  Gregor Herburger <gregor.herburger@tq-group.com>
  Huang Rui <ray.huang@amd.com>
  Jason Gunthorpe <jgg@nvidia.com>
  Jens Axboe <axboe@kernel.dk>
  Jiri Kosina <jkosina@suse.cz>
  Kai Vehmanen <kai.vehmanen@linux.intel.com>
  Leon Romanovsky <leon@kernel.org>
  Linus Torvalds <torvalds@linux-foundation.org>
  Maher Sanalla <msanalla@nvidia.com>
  Mario Limonciello <mario.limonciello@amd.com>
  Mark Zhang <markzhang@nvidia.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Mathis Salmen <mathis.salmen@matsal.de>
  Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
  Michal Kolar <mich.k@seznam.cz>
  Ming Lei <ming.lei@redhat.com>
  Miquel Raynal <miquel.raynal@bootlin.com> # v5.10, v4.19
  Mustafa Ismail <mustafa.ismail@intel.com>
  Nicolas Schichan <nschichan@freebox.fr>
  Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
  Palmer Dabbelt <palmer@rivosinc.com>
  Paul Menzel <pmenzel@molgen.mpg.de>
  Peter Korsgaard <peter@korsgaard.com>
  Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Richard Weinberger <richard@nod.at>
  Rui Salvaterra <rsalvaterra@gmail.com>
  Saravanan Vajravel <saravanan.vajravel@broadcom.com>
  Shiraz Saleem <shiraz.saleem@intel.com>
  Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
  Stefan Binding <sbinding@opensource.cirrus.com>
  Steve French <stfrench@microsoft.com>
  Takashi Iwai <tiwai@suse.de>
  Takashi Sakamoto <o-takashi@sakamocchi.jp>
  Tatyana Nikolova <tatyana.e.nikolova@intel.com>
  Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>
  Wolfram Sang <wsa@kernel.org>
  Wyes Karny <wyes.karny@amd.com>
  Xu Biang <xubiang@hust.edu.cn>
  ZhaoLong Wang <wangzhaolong1@huawei.com>
  Zhihao Cheng <chengzhihao1@huawei.com>

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
 test-armhf-armhf-xl                                          fail    
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
 test-armhf-armhf-xl-arndale                                  fail    
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  fail    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     fail    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     fail    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                broken  
 test-amd64-amd64-pair                                        pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-libvirt-qcow2                               pass    
 test-armhf-armhf-libvirt-qcow2                               fail    
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 fail    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     broken  
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
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

broken-job test-armhf-armhf-xl-multivcpu broken
broken-job test-armhf-armhf-xl-rtds broken
broken-step test-armhf-armhf-xl-multivcpu host-install(5)
broken-step test-armhf-armhf-xl-rtds host-install(5)

Not pushing.

(No revision log; it would be 1107 lines long.)

