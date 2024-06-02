Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 620A38D74F6
	for <lists+xen-devel@lfdr.de>; Sun,  2 Jun 2024 13:30:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734459.1140600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDjOP-0006CK-LW; Sun, 02 Jun 2024 11:28:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734459.1140600; Sun, 02 Jun 2024 11:28:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDjOP-0006AN-IJ; Sun, 02 Jun 2024 11:28:53 +0000
Received: by outflank-mailman (input) for mailman id 734459;
 Sun, 02 Jun 2024 11:28:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sDjON-0006AD-Vo; Sun, 02 Jun 2024 11:28:51 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sDjON-00059k-KA; Sun, 02 Jun 2024 11:28:51 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sDjON-0001K0-81; Sun, 02 Jun 2024 11:28:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sDjON-0000RM-7W; Sun, 02 Jun 2024 11:28:51 +0000
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
	bh=hJVcrryqJIX/J9A4L1qEMv4C8imojOmDyugNFR95Yfk=; b=ffEecPlkYwKqoBkyYasCvu4Tpy
	6PLgxpR7comRvqy+Q9I5Tt94jzNTHsIXs8f4fI3JT3nqkwjyXVlQaSt7QMGh9aIlmG9OGECLyQ/h2
	atsjRTHh2/+HPPvMYxWteH6k70liqUzhBhgufMT9c2c46IYPoHIC22uByHjmgcR+Gx6c=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186226-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 186226: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-xl-raw:debian-di-install:fail:regression
    linux-linus:test-armhf-armhf-xl-multivcpu:host-ping-check-xen:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-raw:xen-boot:fail:heisenbug
    linux-linus:test-armhf-armhf-examine:reboot:fail:heisenbug
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:xen-boot:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=89be4025b0db42db830d72d532437248774cba49
X-Osstest-Versions-That:
    linux=d8ec19857b095b39d114ae299713bd8ea6c1e66a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 02 Jun 2024 11:28:51 +0000

flight 186226 linux-linus real [real]
flight 186230 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/186226/
http://logs.test-lab.xenproject.org/osstest/logs/186230/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl-raw   12 debian-di-install fail in 186230 REGR. vs. 186212

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-xl-multivcpu 10 host-ping-check-xen fail pass in 186230-retest
 test-armhf-armhf-xl-raw       8 xen-boot            fail pass in 186230-retest
 test-armhf-armhf-examine      8 reboot              fail pass in 186230-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt   16 saverestore-support-check fail blocked in 186212
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check fail in 186230 never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check fail in 186230 never pass
 test-armhf-armhf-xl           8 xen-boot                     fail  like 186212
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 186212
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 186212
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 186212
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 186212
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 186212
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                89be4025b0db42db830d72d532437248774cba49
baseline version:
 linux                d8ec19857b095b39d114ae299713bd8ea6c1e66a

Last test of basis   186212  2024-05-31 19:10:39 Z    1 days
Failing since        186217  2024-06-01 02:33:17 Z    1 days    3 attempts
Testing same since   186226  2024-06-02 00:13:49 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Darrick J. Wong" <djwong@kernel.org>
  "Rob Herring (Arm)" <robh@kernel.org>
  Abhinav Kumar <quic_abhinavk@quicinc.com>
  Adrián Larumbe <adrian.larumbe@collabora.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alexandre Belloni <alexandre.belloni@bootlin.com>
  Alexandre Ghiti <alexghiti@rivosinc.com>
  Alina Yu <alina_yu@richtek.com>
  Andi Shyti <andi.shyti@linux.intel.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Armin Wolf <W_Armin@gmx.de>
  Arnd Bergmann <arnd@arndb.de>
  Barry Song <baohua@kernel.org>
  Boris Brezillon <boris.brezillon@collabora.com>
  Breno Leitao <leitao@debian.org>
  Chandan Babu R <chandanbabu@kernel.org>
  Charles Keepax <ckeepax@opensource.cirrus.com>
  Chen-Yu Tsai <wenst@chromium.org>
  Chris Wilson <chris@chris-wilson.co.uk>
  Christian König <christian.koenig@amd.com>
  Christoph Hellwig <hch@lst.de>
  Coly Li <colyli@suse.de>
  Damien Le Moal <dlemoal@kernel.org>
  Daniel Vetter <daniel.vetter@ffwll.ch>
  Danilo Krummrich <dakr@redhat.com>
  Darrick J. Wong <djwong@kernel.org>
  Dave Airlie <airlied@redhat.com>
  Disha Goel<disgoel@linux.ibm.com>
  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Dongsheng Yang <dongsheng.yang@easystack.cn>
  Douglas Anderson <dianders@chromium.org>
  Fedor Pchelkin <pchelkin@ispras.ru>
  Felix Kuehling <felix.kuehling@amd.com>
  Gerald Loacker <gerald.loacker@wolfvision.net>
  Gnattu OC <gnattuoc@me.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Hannes Reinecke <hare@kernel.org>
  Hans de Goede <hdegoede@redhat.com>
  Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
  Hawking Zhang <Hawking.Zhang@amd.com>
  Heiner Kallweit <hkallweit1@gmail.com>
  hexue <xue01.he@samsung.com>
  Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
  hmtheboy154 <buingoc67@gmail.com>
  Imre Deak <imre.deak@intel.com>
  Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
  Jani Nikula <jani.nikula@intel.com>
  Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
  Jassi Brar <jassisinghbrar@gmail.com>
  Javier Carrasco <javier.carrasco.cruz@gmail.com>
  Jeff Johnson <quic_jjohnson@quicinc.com>
  Jens Axboe <axboe@kernel.dk>
  Jesse Zhang <Jesse.Zhang@amd.com>
  Jessica Zhang <quic_jesszhan@quicinc.com>
  Jian Ye <jian.ye@intel.com>
  Jim Wylder <jwylder@google.com>
  John Garry <john.g.garry@oracle.com>
  John Harrison <John.C.Harrison@Intel.com>
  José Roberto de Souza <jose.souza@intel.com>
  Julia Filipchuk <julia.filipchuk@intel.com>
  Kanchan Joshi <joshi.k@samsung.com>
  Keith Busch <kbusch@kernel.org>
  Kent Overstreet <kent.overstreet@linux.dev>
  Kundan Kumar <kundan.kumar@samsung.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Lukas Bulwahn <lukas.bulwahn@redhat.com>
  Luke D. Jones <luke@ljones.dev>
  Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
  Mario Limonciello <mario.limonciello@amd.com>
  Mark Brown <broonie@kernel.org>
  Masahiro Yamada <masahiroy@kernel.org>
  Matthew Auld <matthew.auld@intel.com>
  Matthew Brost <matthew.brost@intel.com>
  Matthew Wilcox (Oracle) <willy@infradead.org>
  Matthias Maennich <maennich@google.com>
  Mickaël Salaün <mic@digikod.net>
  Miguel Ojeda <ojeda@kernel.org>
  Mike Snitzer <snitzer@kernel.org>
  Mingzhe Zou <mingzhe.zou@easystack.cn>
  Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
  Nam Cao <namcao@linutronix.de>
  Neil Armstrong <neil.armstrong@linaro.org>
  Nilay Shroff <nilay@linux.ibm.com>
  Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
  Nirmoy Das <nirmoy.das@intel.com>
  Nícolas F. R. A. Prado <nfraprado@collabora.com>
  Pali Rohár <pali@kernel.org>
  Palmer Dabbelt <palmer@rivosinc.com>
  Peter Colberg <peter.colberg@intel.com>
  Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
  Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
  Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
  Ritesh Harjani (IBM) <ritesh.list@gmail.com>
  Rob Herring (Arm) <robh@kernel.org>
  Robin Murphy <robin.murphy@arm.com>
  Rodrigo Vivi <rodrigo.vivi@intel.com>
  Sagi Grimberg <sagi@grimberg.me>
  Sergey Matyukevich <sergey.matyukevich@syntacore.com>
  Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
  Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
  Steve French <stfrench@microsoft.com>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Takashi Iwai <tiwai@suse.de>
  Tanmay Shah <tanmay.shah@amd.com>
  Tejun Heo <tj@kernel.org>
  Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
  Thierry Reding <treding@nvidia.com>
  Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
  Thomas Hellström <thomas.hellstrom@linux.intel.com>
  Thomas Zimmermann <tzimmermann@suse.de>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Val Packett <val@packett.cool>
  Vidya Srinivas <vidya.srinivas@intel.com>
  Ville Syrjälä <ville.syrjala@linux.intel.com>
  Wachowski, Karol <karol.wachowski@intel.com>
  Waiman Long <longman@redhat.com>
  Witold Sadowski <wsadowski@marvell.com>

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
 test-armhf-armhf-xl-credit2                                  pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     fail    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                fail    
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
 test-armhf-armhf-xl-raw                                      fail    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-libvirt-vhd                                 pass    
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

(No revision log; it would be 4320 lines long.)

