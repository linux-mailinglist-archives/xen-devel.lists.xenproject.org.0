Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A353C4AAD5F
	for <lists+xen-devel@lfdr.de>; Sun,  6 Feb 2022 02:29:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266190.459888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGWLJ-0008B5-2D; Sun, 06 Feb 2022 01:27:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266190.459888; Sun, 06 Feb 2022 01:27:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGWLI-00089D-TR; Sun, 06 Feb 2022 01:27:52 +0000
Received: by outflank-mailman (input) for mailman id 266190;
 Sun, 06 Feb 2022 01:27:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nGWLG-000893-TU; Sun, 06 Feb 2022 01:27:50 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nGWLG-0002cb-Qn; Sun, 06 Feb 2022 01:27:50 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nGWLG-00070Z-7X; Sun, 06 Feb 2022 01:27:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nGWLG-0006Ys-4i; Sun, 06 Feb 2022 01:27:50 +0000
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
	bh=1KnZMPCcsz97g/9BsGtEnKov35/3K8jes0wjCrol5BE=; b=YHuGUqjU1HMhWV1VPdzDCrtZ8X
	ji2uFwu/PbTGRkJoVrAUOCNNJKMALvE8+p+q1vyV4vhZv2cvk6sYtacEBFXtNe0EacIHtzMZWFoLa
	i3OGV8GxY0VTpy8Utj4GAtwgkMF6NuUgSQlEGsfrBGryOrLVfKdw/fWghH/6ZeDe0qWs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-168022-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 168022: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-libvirt-qcow2:guest-start/debian.repeat:fail:heisenbug
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
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=0457e5153e0e8420134f60921349099e907264ca
X-Osstest-Versions-That:
    linux=dcb85f85fa6f142aae1fe86f399d4503d49f2b60
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 06 Feb 2022 01:27:50 +0000

flight 168022 linux-linus real [real]
flight 168028 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/168022/
http://logs.test-lab.xenproject.org/osstest/logs/168028/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-libvirt-qcow2 19 guest-start/debian.repeat fail pass in 168028-retest

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 168012
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 168012
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 168012
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 168012
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 168012
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 168012
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 168012
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 168012
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass

version targeted for testing:
 linux                0457e5153e0e8420134f60921349099e907264ca
baseline version:
 linux                dcb85f85fa6f142aae1fe86f399d4503d49f2b60

Last test of basis   168012  2022-02-04 16:57:25 Z    1 days
Testing same since   168022  2022-02-05 05:38:07 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aditya Garg <gargaditya08@live.com>
  Agustin Gutierrez <agustin.gutierrez@amd.com>
  Ajish Koshy <Ajish.Koshy@microchip.com>
  Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
  Albert Geantă <albertgeanta@gmail.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alexander Stein <alexander.stein@ew.tq-group.com>
  Andrew Morton <akpm@linux-foundation.org>
  Anitha Chrisanthus <anitha.chrisanthus@intel.com>
  Anton Lundin <glance@acc.umu.se>
  Aun-Ali Zaidi <admin@kodeit.net>
  Bernard Metzler <bmt@zurich.ibm.com>
  Bjorn Helgaas <bhelgaas@google.com>
  Catalin Marinas <catalin.marinas@arm.com>
  Charles Keepax <ckeepax@opensource.cirrus.com>
  Chen Wandun <chenwandun@huawei.com>
  Chris Leech <cleech@redhat.com>
  Christian Gmeiner <christian.gmeiner@gmail.com>
  Christian König <christian.koenig@amd.com>
  Christian Lachner <gladiac@gmail.com>
  Christoph Hellwig <hch@lst.de>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Damien Le Moal <damien.lemoal@opensource.wdc.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Daniel Vetter <daniel.vetter@ffwll.ch>
  Daniel Wheeler <daniel.wheeler@amd.com>
  Dave Airlie <airlied@redhat.com>
  David Hildenbrand <david@redhat.com>
  David Howells <dhowells@redhat.com>
  David Rientjes <rientjes@google.com>
  David Sterba <dsterba@suse.com>
  Dmitry Ivanov <dmitry.ivanov2@hpe.com>
  Dmitry Osipenko <digetx@gmail.com>
  Dominik Brodowski <linux@dominikbrodowski.net>
  Dominique Martinet <asmadeus@codewreck.org>
  Dong Aisheng <aisheng.dong@nxp.com>
  Evan Quan <evan.quan@amd.com>
  Filipe Manana <fdmanana@suse.com>
  Francesco Dolcini <francesco.dolcini@toradex.com>
  Gao Xiang <hsiangkao@linux.alibaba.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Geert Uytterhoeven <geert@linux-m68k.org>
  Guangwu Zhang <guazhang@redhat.com>
  Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
  Guenter Roeck <linux@roeck-us.net>
  Guoqing Jiang <guoqing.jiang@linux.dev>
  Helge Deller <deller@gmx.de>
  Ilya Dryomov <idryomov@gmail.com>
  Imre Deak <imre.deak@intel.com>
  Jack Wang <jinpu.wang@ionos.com>
  Jason A. Donenfeld <Jason@zx2c4.com>
  Jason Gunthorpe <jgg@nvidia.com>
  Jeff Layton <jlayton@kernel.org>
  Jens Axboe <axboe@kernel.dk>
  Jiasheng Jiang <jiasheng@iscas.ac.cn>
  Joerg Roedel <jroedel@suse.de>
  John Garry <john.garry@huawei.com>
  John Harrison <John.C.Harrison@Intel.com>
  John Meneghini <jmeneghi@redhat.com>
  John Stultz <john.stultz@linaro.org>
  Jonas Hahnfeld <hahnjo@hahnjo.de>
  Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
  Jordy Zomer <jordy@pwning.systems>
  Jukka Heikintalo <heikintalo.jukka@gmail.com>
  Julian Braha <julianbraha@gmail.com>
  Karol Herbst <kherbst@redhat.com>
  Lang Yu <Lang.Yu@amd.com>
  Leon Möller <jkhsjdhjs@totally.rip>
  Leon Romanovsky <leonro@nvidia.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Lu Baolu <baolu.lu@linux.intel.com>
  Maor Gottlieb <maorg@nvidia.com>
  Marek Vasut <marex@denx.de>
  Mario Limonciello <mario.limonciello@amd.com>
  Mark Brown <broonie@kernel.org>
  Mark Zhang <markzhang@nvidia.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Martin Wilck <mwilck@suse.com>
  Matthew Brost <matthew.brost@intel.com>
  Miaoqian Lin <linmq006@gmail.com>
  Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>
  Mike Rapoport <rppt@linux.ibm.com>
  Miles Chen <miles.chen@mediatek.com>
  Ming Lei <ming.lei@redhat.com>
  Minghao Chi <chi.minghao@zte.com.cn>
  Nathan Chancellor <nathan@kernel.org>
  Nick Desaulniers <ndesaulniers@google.com>
  Nick Lopez <github@glowingmonkey.org>
  Pasha Tatashin <pasha.tatashin@soleen.com>
  Paul Hsieh <paul.hsieh@amd.com>
  Paweł Susicki <pawel.susicki@gmail.com>
  Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
  Qu Wenruo <wqu@suse.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Randy Dunlap <rdunlap@infradead.org>
  Robert Hancock <robert.hancock@calian.com>
  Rohith Surabattula <rohiths@microsoft.com>
  Ryan Bair <ryandbair@gmail.com>
  Sagi Grimberg <sagi@grimberg.me>
  Saurav Kashyap <skashyap@marvell.com>
  Sergey Shtylyov <s.shtylyov@omp.ru>
  Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Shyam Prasad N <sprasad@microsoft.com>
  Song Liu <song@kernel.org>
  Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
  Steve French <stfrench@microsoft.com>
  Stylon Wang <stylon.wang@amd.com>
  Su Yue <l@damenly.su>
  Sumit Semwal <sumit.semwal@linaro.org>
  Sven Schnelle <svens@stackframe.org>
  Takashi Iwai <tiwai@suse.de>
  Thomas Zimmermann <tzimmermann@suse.de>
  Tom Rix <trix@redhat.com>
  Tvrtko Ursulin <tvrtko.ursulin@intel.com>
  Uday Shankar <ushankar@purestorage.com>
  Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
  Vijayanand Jitta <quic_vjitta@quicinc.com>
  Ville Syrjälä <ville.syrjala@linux.intel.com>
  Viswas G <Viswas.G@microchip.com>
  Vlastimil Babka <vbabka@suse.cz>
  Zhan Liu <Zhan.Liu@amd.com>
  Zi Yan <ziy@nvidia.com>

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
 test-amd64-amd64-pair                                        pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-libvirt-qcow2                               fail    
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
   dcb85f85fa6f1..0457e5153e0e8  0457e5153e0e8420134f60921349099e907264ca -> tested/linux-linus

