Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C53816E3FA5
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 08:21:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521742.810567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poIDr-0000it-LF; Mon, 17 Apr 2023 06:20:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521742.810567; Mon, 17 Apr 2023 06:20:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poIDr-0000g4-IQ; Mon, 17 Apr 2023 06:20:19 +0000
Received: by outflank-mailman (input) for mailman id 521742;
 Mon, 17 Apr 2023 06:20:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1poIDq-0000fo-II; Mon, 17 Apr 2023 06:20:18 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1poIDq-0005GD-3h; Mon, 17 Apr 2023 06:20:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1poIDp-0005BN-Im; Mon, 17 Apr 2023 06:20:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1poIDp-0003yC-I1; Mon, 17 Apr 2023 06:20:17 +0000
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
	bh=nVCdYhR9d9YsueseX9ag/HL8m6lD+nHqrlowDjGB2P8=; b=RFOeSUiGz3n+DvA6lIKdlgvOz6
	kzeH0hDF1Bu8wFXLfc2NCoxduhhS40tN+XKUXguiBWPB9aXmUlUOwNYJ8sEkD/TSJ23U1aqOul9La
	55y1go/q0BM4FV4EtEdsQqudDnxrXajzaMPYrcf9cNEk8PobafoFiOtz5dZFOMjuzU1s=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180278-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 180278: tolerable FAIL - PUSHED
X-Osstest-Failures:
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
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-examine:reboot:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:xen-boot:fail:nonblocking
X-Osstest-Versions-This:
    linux=6c538e1adbfc696ac4747fb10d63e704344f763d
X-Osstest-Versions-That:
    linux=44149752e9987a9eac5ad78e6d3a20934b5e018d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 17 Apr 2023 06:20:17 +0000

flight 180278 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180278/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
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
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-examine      8 reboot                  fail starved in 180253
 test-armhf-armhf-libvirt      8 xen-boot                fail starved in 180253
 test-armhf-armhf-xl-vhd       8 xen-boot                fail starved in 180253
 test-armhf-armhf-libvirt-qcow2  8 xen-boot              fail starved in 180253
 test-armhf-armhf-xl           8 xen-boot                fail starved in 180253
 test-armhf-armhf-xl-rtds      8 xen-boot                fail starved in 180253
 test-armhf-armhf-xl-multivcpu  8 xen-boot               fail starved in 180253
 test-armhf-armhf-xl-credit2   8 xen-boot                fail starved in 180253
 test-armhf-armhf-libvirt-raw  8 xen-boot                fail starved in 180253

version targeted for testing:
 linux                6c538e1adbfc696ac4747fb10d63e704344f763d
baseline version:
 linux                44149752e9987a9eac5ad78e6d3a20934b5e018d

Last test of basis   180253  2023-04-14 01:13:19 Z    3 days
Failing since        180264  2023-04-14 18:10:06 Z    2 days    6 attempts
Testing same since   180278  2023-04-16 19:41:46 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alexandre Ghiti <alexghiti@rivosinc.com>
  Alyssa Ross <hi@alyssa.is>
  Andrew Donnellan <ajd@linux.ibm.com>
  Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
  Benjamin Gray <bgray@linux.ibm.com>
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
  Masahiro Yamada <masahiroy@kernel.org>
  Mathis Salmen <mathis.salmen@matsal.de>
  Matija Glavinic Pecotic <matija.glavinic-pecotic.ext@nokia.com>
  Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michal Kolar <mich.k@seznam.cz>
  Ming Lei <ming.lei@redhat.com>
  Miquel Raynal <miquel.raynal@bootlin.com> # v5.10, v4.19
  Mustafa Ismail <mustafa.ismail@intel.com>
  Namjae Jeon <linkinjeon@kernel.org>
  Nathan Chancellor <nathan@kernel.org>
  Nick Desaulniers <ndesaulniers@google.com>
  Nicolas Schichan <nschichan@freebox.fr>
  Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
  Palmer Dabbelt <palmer@rivosinc.com>
  Paul Menzel <pmenzel@molgen.mpg.de>
  Peter Korsgaard <peter@korsgaard.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
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
  Thomas Gleixner <tglx@linutronix.de>
  Tingjia Cao <tjcao980311@gmail.com>
  Vincent Guittot <vincent.guittot@linaro.org>
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
 test-armhf-armhf-xl-multivcpu                                fail    
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
 test-armhf-armhf-xl-rtds                                     fail    
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


Pushing revision :

hint: The 'hooks/update' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
hint: The 'hooks/post-receive' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
hint: The 'hooks/post-update' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
To xenbits.xen.org:/home/xen/git/linux-pvops.git
   44149752e998..6c538e1adbfc  6c538e1adbfc696ac4747fb10d63e704344f763d -> tested/linux-linus

