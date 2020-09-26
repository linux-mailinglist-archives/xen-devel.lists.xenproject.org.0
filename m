Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE79027974F
	for <lists+xen-devel@lfdr.de>; Sat, 26 Sep 2020 08:44:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kM3wL-0004Yk-AU; Sat, 26 Sep 2020 06:44:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+vXn=DD=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kM3wK-0004Ye-03
 for xen-devel@lists.xenproject.org; Sat, 26 Sep 2020 06:44:12 +0000
X-Inumbo-ID: 2a14157f-1b89-467d-ba1f-f3a1c757ffc0
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2a14157f-1b89-467d-ba1f-f3a1c757ffc0;
 Sat, 26 Sep 2020 06:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=DAWogHE0YhwzQY7Yfsffv6L3v0hIvpUkMRnW2KPDiUs=; b=TBpJzwRTucKeWw5FJ4bjreqRhU
 pkjWOLQEqbjwXtiOOazluVKS3EXAbKeZoP33tMToQXHtm4H4LESt1gxuemKrWIMGafvAin8SoLFLI
 C5IX/m/r9OhYOZfyFUU/U0y1EcT4UYsfQ0sMe56SHnXSjMfHFPCPWpqW+q7bAMXOoPB0=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kM3wF-0006qn-EF; Sat, 26 Sep 2020 06:44:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kM3wF-0002tv-4e; Sat, 26 Sep 2020 06:44:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kM3wF-0007Ow-4B; Sat, 26 Sep 2020 06:44:07 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-154718-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 154718: tolerable FAIL - PUSHED
X-Osstest-Failures: linux-5.4:test-amd64-amd64-examine:memdisk-try-append:fail:heisenbug
 linux-5.4:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:heisenbug
 linux-5.4:test-armhf-armhf-xl-credit1:guest-start/debian.repeat:fail:heisenbug
 linux-5.4:test-amd64-amd64-pygrub:guest-start/debian.repeat:fail:heisenbug
 linux-5.4:test-armhf-armhf-xl-multivcpu:guest-start/debian.repeat:fail:heisenbug
 linux-5.4:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
X-Osstest-Versions-This: linux=a4bea6a4f1e0e5132fdedb5c0a74cbba696342fd
X-Osstest-Versions-That: linux=bdc3a8f6a8e8b798c46683a98b97d52b3a5708e4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 26 Sep 2020 06:44:07 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

flight 154718 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/154718/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-examine    4 memdisk-try-append fail in 154644 pass in 154718
 test-armhf-armhf-xl-rtds 16 guest-start/debian.repeat fail in 154644 pass in 154718
 test-armhf-armhf-xl-credit1 16 guest-start/debian.repeat fail in 154644 pass in 154718
 test-amd64-amd64-pygrub      19 guest-start/debian.repeat  fail pass in 154644
 test-armhf-armhf-xl-multivcpu 16 guest-start/debian.repeat fail pass in 154644

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 10 debian-hvm-install fail like 154428
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop             fail never pass
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop              fail never pass
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop             fail never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop             fail never pass
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop             fail never pass
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop              fail never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass

version targeted for testing:
 linux                a4bea6a4f1e0e5132fdedb5c0a74cbba696342fd
baseline version:
 linux                bdc3a8f6a8e8b798c46683a98b97d52b3a5708e4

Last test of basis   154428  2020-09-17 12:09:47 Z    8 days
Testing same since   154644  2020-09-23 11:15:18 Z    2 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aaron Brown <aaron.f.brown@intel.com>
  Adrian Huang <ahuang12@lenovo.com>
  Alan Stern <stern@rowland.harvard.edu>
  Alexey Kardashevskiy <aik@ozlabs.ru>
  Andreas Gruenbacher <agruenba@redhat.com>
  Andrew Lunn <andrew@lunn.ch>
  Andrew Morton <akpm@linux-foundation.org>
  Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
  Ard Biesheuvel <ardb@kernel.org>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Arvind Sankar <nivedita@alum.mit.edu>
  Bob Peterson <rpeterso@redhat.com>
  Catalin Marinas <catalin.marinas@arm.com>
  Chris Wilson <chris@chris-wilson.co.uk>
  Christoph Hellwig <hch@lst.de>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Christophe Leroy <christophe.leroy@csgroup.eu>
  Chuck Lever <chuck.lever@oracle.com>
  Chun-Kuang Hu <chunkuang.hu@kernel.org>
  Dan Carpenter <dan.carpenter@oracle.com>
  Dan Williams <dan.j.williams@intel.com>
  Daniel Mack <daniel@zonque.org>
  David Hildenbrand <david@redhat.com>
  David Milburn <dmilburn@redhat.com>
  David Rientjes <rientjes@google.com>
  David S. Miller <davem@davemloft.net>
  Dennis Zhou <dennis@kernel.org>
  Dexuan Cui <decui@microsoft.com>
  Dick Kennedy <dick.kennedy@broadcom.com>
  Dinghao Liu <dinghao.liu@zju.edu.cn>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Evan Nimmo <evan.nimmo@alliedtelesis.co.nz>
  Gabriel Krisman Bertazi <krisman@collabora.com>
  Greentime Hu <greentime.hu@sifive.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guenter Roeck <linux@roeck-us.net>
  Gustav Wiklander <gustavwi@axis.com>
  Haiyang Zhang <haiyangz@microsoft.com>
  Hans de Goede <hdegoede@redhat.com>
  Harald Freudenberger <freude@linux.ibm.com>
  Heikki Krogerus <heikki.krogerus@linux.intel.com>
  Huacai Chen <chenhc@lemote.com>
  Hui Wang <hui.wang@canonical.com>
  Ilias Apalodimas <ilias.apalodimas@linaro.org>
  Ingo Molnar <mingo@kernel.org>
  J. Bruce Fields <bfields@redhat.com>
  Jack Wang <jinpu.wang@cloud.ionos.com>
  Jaegeuk Kim <jaegeuk@kernel.org>
  James Smart <james.smart@broadcom.com>
  Jan Kara <jack@suse.cz>
  Jani Nikula <jani.nikula@intel.com>
  Jason Gunthorpe <jgg@nvidia.com>
  Javed Hasan <jhasan@marvell.com>
  Jean Delvare <jdelvare@suse.de>
  Jean-Philippe Brucker <jean-philippe@linaro.org>
  Jeff Kirsher <jeffrey.t.kirsher@intel.com>
  Jens Axboe <axboe@kernel.dk>
  Jerome Brunet <jbrunet@baylibre.com>
  Jiri Olsa <jolsa@kernel.org>
  Jiri Olsa <jolsa@redhat.com>
  Joao Martins <joao.m.martins@oracle.com>
  Joerg Roedel <jroedel@suse.de>
  John Garry <john.garry@huawei.com>
  Jon Hunter <jonathanh@nvidia.com>
  Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
  Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Luke D Jones <luke@ljones.dev>
  Marc Zyngier <maz@kernel.org>
  Mark Brown <broonie@kernel.org>
  Martin K. Petersen <martin.petersen@oracle.com>
  Matthias Kaehlcke <mka@chromium.org>
  Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
  Miaohe Lin <linmiaohe@huawei.com>
  Michael Ellerman <mpe@ellerman.id.au>
  Michael Kelley <mikelley@microsoft.com>
  Michal Hocko <mhocko@suse.com>
  Mike Snitzer <snitzer@redhat.com>
  Namhyung Kim <namhyung@kernel.org>
  Naresh Kumar PBS <nareshkumar.pbs@broadcom.com>
  Nathan Chancellor <natechancellor@gmail.com>
  Nick Desaulniers <ndesaulniers@google.com>
  Olga Kornievskaia <kolga@netapp.com>
  Oliver Neukum <oneukum@suse.com>
  Omar Sandoval <osandov@fb.com>
  Palmer Dabbelt <palmerdabbelt@google.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Pavel Tatashin <pasha.tatashin@soleen.com>
  Penghao <penghao@uniontech.com>
  Prateek Sood <prsood@codeaurora.org>
  Quentin Perret <qperret@google.com>
  Randy Dunlap <rdunlap@infradead.org>
  Rodrigo Vivi <rodrigo.vivi@intel.com>
  Ronnie Sahlberg <lsahlber@redhat.com>
  Sahitya Tummala <stummala@codeaurora.org>
  Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
  Sasha Levin <sashal@kernel.org>
  Sasha Neftin <sasha.neftin@intel.com>
  Sedat Dilek <sedat.dilek@gmail.com>
  Selvin Xavier <selvin.xavier@broadcom.com>
  Stafford Horne <shorne@gmail.com>
  Stephan Gerhold <stephan@gerhold.net>
  Stephen Boyd <sboyd@kernel.org>
  Steve French <stfrench@microsoft.com>
  Sunghyun Jin <mcsmonk@gmail.com>
  Syven Wang <syven.wang@sifive.com>
  Takashi Iwai <tiwai@suse.de>
  Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Tobias Diedrich <tobiasdiedrich@gmail.com>
  Trond Myklebust <trond.myklebust@hammerspace.com>
  Vasily Gorbik <gor@linux.ibm.com>
  Vincent Huang <vincent.huang@tw.synaptics.com>
  Vincent Whitchurch <vincent.whitchurch@axis.com>
  Vlastimil Babka <vbabka@suse.cz>
  Volker Rümelin <vr_qemu@t-online.de>
  Wei Liu <wei.liu@kernel.org>
  Will Deacon <will@kernel.org>
  Wolfram Sang <wsa@kernel.org>
  Yauheni Kaliuta <yauheni.kaliuta@redhat.com>
  Yu Kuai <yukuai3@huawei.com>

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
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 fail    
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
 test-armhf-armhf-xl-multivcpu                                fail    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-amd64-pvgrub                                pass    
 test-amd64-amd64-i386-pvgrub                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      fail    
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
   bdc3a8f6a8e8..a4bea6a4f1e0  a4bea6a4f1e0e5132fdedb5c0a74cbba696342fd -> tested/linux-5.4

