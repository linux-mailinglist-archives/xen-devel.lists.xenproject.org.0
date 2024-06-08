Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A1B901111
	for <lists+xen-devel@lfdr.de>; Sat,  8 Jun 2024 11:17:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736696.1142791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFsAl-0003Q7-Ki; Sat, 08 Jun 2024 09:15:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736696.1142791; Sat, 08 Jun 2024 09:15:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFsAl-0003O9-Fl; Sat, 08 Jun 2024 09:15:39 +0000
Received: by outflank-mailman (input) for mailman id 736696;
 Sat, 08 Jun 2024 09:15:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sFsAj-0003Nz-NF; Sat, 08 Jun 2024 09:15:37 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sFsAj-0003GC-KF; Sat, 08 Jun 2024 09:15:37 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sFsAj-0003y7-AX; Sat, 08 Jun 2024 09:15:37 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sFsAj-0001in-A4; Sat, 08 Jun 2024 09:15:37 +0000
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
	bh=BVzSpyu2zNZOXlmaU2aKUFYcDn8s5BJTsO0ZH9oa4q4=; b=FWJc5BuAe+NF3LKATU/uiQfMKZ
	AdkHHnLid74aZnQKLU5pAjaCJVrMvaB939sD+pqKnytZMS7wNF9xRc3vFQJn9f/xz6vvRzB4LBDWZ
	zC3RTCJ74IR84UuTKxpkp/QWJGn4FRDntMIkQn4vDZMaNP2FrONmWyIFm9YkZ38ThrOw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186284-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 186284: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-xl:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-libvirt:xen-boot:fail:regression
    linux-linus:test-armhf-armhf-examine:reboot:fail:regression
    linux-linus:test-armhf-armhf-xl-credit2:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:xen-boot:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=dc772f8237f9b0c9ea3f34d0dc4a57d1f6a5070d
X-Osstest-Versions-That:
    linux=8a92980606e3585d72d510a03b59906e96755b8a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 08 Jun 2024 09:15:37 +0000

flight 186284 linux-linus real [real]
flight 186287 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/186284/
http://logs.test-lab.xenproject.org/osstest/logs/186287/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl           8 xen-boot                 fail REGR. vs. 186282
 test-armhf-armhf-libvirt      8 xen-boot                 fail REGR. vs. 186282
 test-armhf-armhf-examine      8 reboot                   fail REGR. vs. 186282

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-credit2   8 xen-boot                     fail  like 186270
 test-armhf-armhf-libvirt-vhd  8 xen-boot                     fail  like 186278
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 186282
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 186282
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 186282
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 186282
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 186282
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                dc772f8237f9b0c9ea3f34d0dc4a57d1f6a5070d
baseline version:
 linux                8a92980606e3585d72d510a03b59906e96755b8a

Last test of basis   186282  2024-06-07 18:13:19 Z    0 days
Testing same since   186284  2024-06-08 00:43:36 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alex Deucher <alexander.deucher@amd.com>
  Alexander Gordeev <agordeev@linux.ibm.com>
  Alexander Potapenko <glider@google.com>
  Andreas Hindborg <a.hindborg@samsung.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andy Shevchenko <andy.shevchenko@gmail.com>
  Armin Wolf <W_Armin@gmx.de>
  Arnd Bergmann <arnd@arndb.de>
  Baolin Wang <baolin.wang@linux.alibaba.com>
  Barry Song <baohua@kernel.org>
  Barry Song <v-songbaohua@oppo.com>
  Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Björn Töpel <bjorn@rivosinc.com>
  Borislav Petkov (AMD) <bp@alien8.de>
  Borislav Petkov <bp@alien8.de>
  Brian Johannesmeyer <bjohannesmeyer@gmail.com>
  Chen Ni <nichen@iscas.ac.cn>
  Chengming Zhou <chengming.zhou@linux.dev>
  Chris Bainbridge <chris.bainbridge@gmail.com>
  Chris Li <chrisl@kernel.org>
  Christian Borntraeger <borntraeger@linux.ibm.com>
  Christoph Hellwig <hch@lst.de>
  Chuck Lever <chuck.lever@oracle.com>
  Chunguang Xu <chunguang.xu@shopee.com>
  Cong Wang <cong.wang@bytedance.com>
  Dave Airlie <airlied@redhat.com>
  David Hildenbrand <david@redhat.com>
  David Sterba <dsterba@suse.com>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Dr. David Alan Gilbert <linux@treblig.org>
  Filipe Manana <fdmanana@suse.com>
  Gregor Herburger <gregor.herburger@tq-group.com>
  Hagar Hemdan <hagarhem@amazon.com>
  Hans de Goede <hdegoede@redhat.com>
  Heiko Carstens <hca@linux.ibm.com>
  Huisong Li <lihuisong@huawei.com>
  Ian Forbes <ian.forbes@broadcom.com>
  Jean-Christophe Guillain <jean-christophe@guillain.net>
  Jeff Johnson <quic_jjohnson@quicinc.com>
  Jens Axboe <axboe@kernel.dk>
  Jerry Snitselaar <jsnitsel@redhat.com>
  Jessica Zhang <quic_jesszhan@quicinc.com>
  Joerg Roedel <jroedel@suse.de>
  Johannes Weiner <hannes@cmpxchg.org>
  Keith Busch <kbusch@kernel.org>
  Kun(llfl) <llfl@linux.alibaba.com>
  Lance Yang <ioworker0@gmail.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Liviu Dudau <liviu.dudau@arm.com>
  Lu Baolu <baolu.lu@linux.intel.com>
  Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
  Mario Limonciello <mario.limonciello@amd.com>
  Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michal Hocko <mhocko@suse.com>
  Michal Wajdeczko <michal.wajdeczko@intel.com>
  Mike Rapoport (IBM) <rppt@kernel.org>
  Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
  Mikhail Zaslonko <zaslonko@linux.ibm.com>
  Muhammad Usama Anjum <usama.anjum@collabora.com>
  Nam Cao <namcao@linutronix.de>
  Neil Armstrong <neil.armstrong@linaro.org>
  Niklas Cassel <cassel@kernel.org>
  Omar Sandoval <osandov@fb.com>
  Oscar Salvador <osalvador@suse.de>
  Palmer Dabbelt <palmer@rivosinc.com>
  Qu Wenruo <wqu@suse.com>
  Robin Murphy <robin.murphy@arm.com>
  Ryusuke Konishi <konishi.ryusuke@gmail.com>
  Sebastian Andrzej Siewior <bigeasy@linutronix.de>
  Shakeel Butt <shakeel.butt@linux.dev>
  Su Hui <suhui@nfschina.com>
  Suma Hegde <suma.hegde@amd.com>
  Suren Baghdasaryan <surenb@google.com>
  Tasos Sahanidis <tasos@tasossah.com>
  Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
  Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
  Thomas Hellström <thomas.hellstrom@linux.intel.com>
  Vasant Hegde <vasant.hegde@amd.com>
  Vlastimil Babka <vbabka@suse.cz>
  Wei Li <liwei391@huawei.com>
  Weiwen Hu <huweiwen@linux.alibaba.com>
  Will Deacon <will@kernel.org>
  Yujie Liu <yujie.liu@intel.com>
  Zack Rusin <zack.rusin@broadcom.com>

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
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
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
 test-armhf-armhf-xl-credit2                                  fail    
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
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-xl-qcow2                                    pass    
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-amd64-amd64-xl-raw                                      pass    
 test-armhf-armhf-xl-raw                                      pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-libvirt-vhd                                 fail    
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      pass    


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

(No revision log; it would be 2462 lines long.)

