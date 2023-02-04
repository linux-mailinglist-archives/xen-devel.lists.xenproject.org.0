Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BD468AB88
	for <lists+xen-devel@lfdr.de>; Sat,  4 Feb 2023 18:12:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.489566.757898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOM4U-0003tv-FG; Sat, 04 Feb 2023 17:11:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 489566.757898; Sat, 04 Feb 2023 17:11:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOM4U-0003rP-Bc; Sat, 04 Feb 2023 17:11:26 +0000
Received: by outflank-mailman (input) for mailman id 489566;
 Sat, 04 Feb 2023 17:11:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pOM4S-0003rF-IX; Sat, 04 Feb 2023 17:11:24 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pOM4S-0003AE-GC; Sat, 04 Feb 2023 17:11:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pOM4S-0007uQ-27; Sat, 04 Feb 2023 17:11:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pOM4S-0006Je-1d; Sat, 04 Feb 2023 17:11:24 +0000
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
	bh=Cd/qBVe5GkzzaWK5JJph+yqFf7Z2y/jfcxcxzHc9dZo=; b=EX6iO87xvMI9WVT7Ub1y6Pr8fE
	tPFNFfntE9gjauuP8DrnaLC/+fKQ9dvuNuft563NNEsiRX2NeLzODeUC1XTNTY+vFPAgXdpoYWwAN
	yZeInOzIN/qMJA/iBhQr5c6sRS+1ALVb23f3RReMPrcNp7rZEf8SX3agGxJQej6+VWWg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-176355-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 176355: tolerable trouble: fail/pass/starved - PUSHED
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-xl-vhd:guest-start/debian.repeat:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-examine:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-libvirt:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-xl:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:build-check(1):starved:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:build-check(1):starved:nonblocking
    linux-linus:build-armhf-libvirt:build-check(1):starved:nonblocking
    linux-linus:build-armhf:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    linux=0136d86b78522bbd5755f8194c97a987f0586ba5
X-Osstest-Versions-That:
    linux=66a87fff1a87c260452f5a57123891ca5258c449
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 04 Feb 2023 17:11:24 +0000

flight 176355 linux-linus real [real]
flight 176371 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/176355/
http://logs.test-lab.xenproject.org/osstest/logs/176371/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-vhd 21 guest-start/debian.repeat fail pass in 176371-retest

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 176344
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 176344
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 176344
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 176344
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 176344
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-examine      1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt-qcow2  1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               starved  n/a
 test-armhf-armhf-xl           1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-credit1   1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-credit2   1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-cubietruck  1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-multivcpu  1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-rtds      1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-vhd       1 build-check(1)               starved  n/a
 build-armhf-libvirt           1 build-check(1)               starved  n/a
 build-armhf                   2 hosts-allocate               starved  n/a

version targeted for testing:
 linux                0136d86b78522bbd5755f8194c97a987f0586ba5
baseline version:
 linux                66a87fff1a87c260452f5a57123891ca5258c449

Last test of basis   176344  2023-02-03 06:54:13 Z    1 days
Testing same since   176355  2023-02-04 00:13:01 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alex Deucher <alexander.deucher@amd.com>
  Alex Hung <alex.hung@amd.com>
  Alexey Khoroshilov <khoroshilov@ispras.ru>
  Amit Engel <Amit.Engel@dell.com>
  Andreas Schwab <schwab@suse.de>
  Andrew Morton <akpm@linux-foundation.org>
  Anton Gusev <aagusev@ispras.ru>
  Ard Biesheuvel <ardb@kernel.org>
  Arnd Bergmann <arnd@arndb.de>
  Bart Van Assche <bvanassche@acm.org>
  Ben Skeggs <bskeggs@redhat.com>
  Borislav Petkov (AMD) <bp@alien8.de>
  Catalin Marinas <catalin.marinas@arm.com>
  Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
  Christoph Hellwig <hch@lst.de>
  Daniel Miess <Daniel.Miess@amd.com>
  Daniel Wagner <dwagner@suse.de>
  Daniel Wheeler <daniel.wheeler@amd.com>
  Danilo Krummrich <dakr@redhat.com>
  Dave Airlie <airlied@redhat.com>
  David Hildenbrand <david@redhat.com>
  Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
  Douglas Anderson <dianders@chromium.org>
  Eugen Hristev <eugen.hristev@collabora.com>
  Evan Quan <evan.quan@amd.com>
  Fabian Vogt <fvogt@suse.com>
  Fedor Pchelkin <pchelkin@ispras.ru>
  George Shen <george.shen@amd.com>
  Graham Sider <Graham.Sider@amd.com>
  Guo Ren <guoren@kernel.org>
  Guo Ren <guoren@linux.alibaba.com>
  Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Holger Hoffsttte <holger@applied-asynchrony.com>
  Ilya Dryomov <idryomov@gmail.com>
  Isaac J. Manjarres <isaacmanjarres@google.com>
  James Morse <james.morse@arm.com>
  Jani Nikula <jani.nikula@intel.com>
  Jann Horn <jannh@google.com>
  Javier Martinez Canillas <javierm@redhat.com>
  Jens Axboe <axboe@kernel.dk>
  John Harrison <John.C.Harrison@Intel.com>
  John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
  Kefeng Wang <wangkefeng.wang@huawei.com>
  Kirill A. Shutemov <kirill.shutemov@intel.linux.com>
  Liam Howlett <liam.howlett@oracle.com>
  Liam R. Howlett <Liam.Howlett@oracle.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Liu Xiaodong <xiaodong.liu@intel.com>
  Longlong Xia <xialonglong1@huawei.com>
  Lyude Paul <lyude@redhat.com>
  Mario Limonciello <mario.limonciello@amd.com>
  Matthew Wilcox (Oracle) <willy@infradead.org>
  Maurizio Lombardi <mlombard@redhat.com>
  Maxime Ripard <maxime@cerno.tech>
  Michal Hocko <mhocko@suse.com>
  Mike Kravetz <mike.kravetz@oracle.com>
  Mike Rapoport (IBM) <rppt@kernel.org>
  Miko Larsson <mikoxyzzz@gmail.com>
  Ming Lei <ming.lei@redhat.com>
  msizanoen <msizanoen@qtmlabs.xyz>
  Nhat Pham <nphamcs@gmail.com>
  Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
  Nicolas Chauvet <kwizart@gmail.com>
  Palmer Dabbelt <palmer@rivosinc.com>
  Pengfei Xu <pengfei.xu@intel.com>
  Peter Xu <peterx@redhat.com>
  Phillip Lougher <phillip@squashfs.org.uk>
  Randy Dunlap <rdunlap@infradead.org>
  Rob Clark <robdclark@chromium.org>
  Rodrigo Vivi <rodrigo.vivi@intel.com>
  Rutvij Gajjar <Rutvij.Gajjar@amd.com>
  Samuel Holland <samuel@sholland.org>
  Satyanarayana ReddyTVN <Satyanarayana.ReddyTVN@amd.com>
  Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
  Stephen Boyd <swboyd@chromium.org>
  Thomas Zimmermann <tzimmermann@suse.de>
  Tim Huang <tim.huang@amd.com>
  Tom Saeger <tom.saeger@oracle.com>
  Tvrtko Ursulin <tvrtko.ursulin@intel.com>
  Vlastimil Babka <vbabka@suse.cz>
  Wei Yang <richard.weiyang@gmail.com>
  Xiubo Li <xiubli@redhat.com>
  ye xingchen <ye.xingchen@zte.com.cn>
  Yiqing Yao <yiqing.yao@amd.com>
  Yu Kuai <yukuai3@huawei.com>
  Yu Zhao <yuzhao@google.com>
  Zach O'Keefe <zokeefe@google.com>
  Zhaoyang Huang <zhaoyang.huang@unisoc.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  starved 
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          starved 
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          starved 
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
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  starved 
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  starved 
 test-armhf-armhf-xl-cubietruck                               starved 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     starved 
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     starved 
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                starved 
 test-amd64-amd64-pair                                        pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-libvirt-qcow2                               pass    
 test-armhf-armhf-libvirt-qcow2                               starved 
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 starved 
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     starved 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-xl-vhd                                      fail    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      starved 


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
   66a87fff1a87..0136d86b7852  0136d86b78522bbd5755f8194c97a987f0586ba5 -> tested/linux-linus

