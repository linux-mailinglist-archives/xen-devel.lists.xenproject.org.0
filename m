Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF2D5F1BD4
	for <lists+xen-devel@lfdr.de>; Sat,  1 Oct 2022 12:43:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414508.658813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeZwz-0005PP-9w; Sat, 01 Oct 2022 10:42:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414508.658813; Sat, 01 Oct 2022 10:42:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeZwz-0005N7-78; Sat, 01 Oct 2022 10:42:29 +0000
Received: by outflank-mailman (input) for mailman id 414508;
 Sat, 01 Oct 2022 10:42:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oeZwy-0005Mx-J8; Sat, 01 Oct 2022 10:42:28 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oeZwy-0003nI-Ey; Sat, 01 Oct 2022 10:42:28 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oeZwy-0004ss-02; Sat, 01 Oct 2022 10:42:28 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oeZwx-0003hM-Vt; Sat, 01 Oct 2022 10:42:27 +0000
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
	bh=yY+bADkDN7kqSCU/CkpcmKMvNLjTkE0XkFV3UlOnCF4=; b=06RSwj/P+cxU0fgByicZqUoOLa
	6yZTUpVENlcL3KZHLRatD4S15ZBfmmpOYvyVG+TFn3swk5MqbPtWVOMS3teA3i1+UD0gBLY9hz+Tl
	MROIlGdjqfffXXpuXRmBSTiRo37JVno9IXQ8x5wxETatLzorxbzAMPZDaV3Von0bcd0Q=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173391-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 173391: regressions - trouble: broken/fail/pass
X-Osstest-Failures:
    linux-linus:build-i386-pvops:<job status>:broken:regression
    linux-linus:build-i386-xsm:<job status>:broken:regression
    linux-linus:build-i386-xsm:host-install(4):broken:regression
    linux-linus:build-i386-pvops:host-install(4):broken:regression
    linux-linus:test-amd64-amd64-freebsd11-amd64:guest-saverestore.2:fail:regression
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:guest-start/debian.repeat:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=ffb4d94b4314655cea60ab7962756e6bab72fc7e
X-Osstest-Versions-That:
    linux=511cce163b75bc3933fa3de769a82bb7e8663f2b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 01 Oct 2022 10:42:27 +0000

flight 173391 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/173391/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-i386-pvops                <job status>                 broken
 build-i386-xsm                  <job status>                 broken
 build-i386-xsm                4 host-install(4)        broken REGR. vs. 173364
 build-i386-pvops              4 host-install(4)        broken REGR. vs. 173364
 test-amd64-amd64-freebsd11-amd64 18 guest-saverestore.2  fail REGR. vs. 173364

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 173364
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 173364
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 173364
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 173364
 test-armhf-armhf-xl-rtds     18 guest-start/debian.repeat    fail  like 173364
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 173364
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 173364
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 173364
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 173364
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 linux                ffb4d94b4314655cea60ab7962756e6bab72fc7e
baseline version:
 linux                511cce163b75bc3933fa3de769a82bb7e8663f2b

Last test of basis   173364  2022-09-29 15:40:21 Z    1 days
Failing since        173378  2022-09-30 00:41:06 Z    1 days    4 attempts
Testing same since   173391  2022-10-01 03:05:01 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Adrien Grassein <adrien.grassein@gmail.com>
  Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
  Al Viro <viro@zeniv.linux.org.uk>
  Alex Deucher <alexander.deucher@amd.com>
  Alexandre Courbot <acourbot@chromium.org>
  Alvin Lee <Alvin.Lee2@amd.com>
  Andi Shyti <andi.shyti@linux.intel.com>
  Andrzej Hajda <andrzej.hajda@intel.com>
  Angus Chen <angus.chen@jaguarmicro.com>
  Aric Cyr <aric.cyr@amd.com>
  Arnaldo Carvalho de Melo <acme@kernel.org>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Ashutosh Dixit <ashutosh.dixit@intel.com>
  Athira Jajeev <atrajeev@linux.vnet.ibm.com>
  Athira Rajeev <atrajeev@linux.vnet.ibm.com>
  August Wikerfors <git@augustwikerfors.se>
  Bartosz Golaszewski <brgl@bgdev.pl>
  Bokun Zhang <Bokun.Zhang@amd.com>
  Brian Norris <briannorris@chromium.org>
  Chris Wilson <chris@chris-wilson.co.uk>
  Christian König <christian.koenig@amd.com>
  Christoph Hellwig <hch@lst.de>
  Claudiu Beznea <claudiu.beznea@microchip.com>
  Conor Dooley <conor.dooley@microchip.com>
  Daniel Vetter <daniel.vetter@ffwll.ch>
  Daniel Wheeler <daniel.wheeler@amd.com>
  Dave Airlie <airlied@redhat.com>
  David Matlack <dmatlack@google.com>
  Douglas Anderson <dianders@chromium.org>
  Dylan Yudaken <dylany@fb.com>
  Eli Cohen <elic@nvidia.com>
  Emanuele Giuseppe Esposito <eesposit@redhat.com>
  Eric Bernstein <eric.bernstein@amd.com>
  Evan Quan <evan.quan@amd.com>
  Fabio Estevam <festevam@denx.de>
  Florian Fainelli <f.fainelli@gmail.com>
  Francesco Dolcini <francesco.dolcini@toradex.com>
  Graham Sider <Graham.Sider@amd.com>
  Guilherme G. Piccoli <gpiccoli@igalia.com>
  Han Xu <han.xu@nxp.com>
  Hawking Zhang <Hawking.Zhang@amd.com>
  Ian Rogers <irogers@google.com>
  Jasdeep Dhillon <jdhillon@amd.com>
  Jason Wang <jasowang@redhat.com>
  Jens Axboe <axboe@kernel.dk>
  Jernej Skrabec <jernej.skrabec@gmail.com>
  Jiadong.Zhu <Jiadong.Zhu@amd.com>
  Jim Mattson <jmattson@google.com>
  Jing Zhang <renyu.zj@linux.alibaba.com>
  Jiri Olsa <jolsa@kernel.org>
  Kees Cook <keescook@chromium.org>
  lei he <helei.sig11@bytedance.com>
  Leo Li <sunpeng.li@amd.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Maxime Coquelin <maxime.coquelin@redhat.com>
  Michael Kelley <mikelley@microsoft.com>
  Michael S. Tsirkin <mst@redhat.com>
  Namhyung Kim <namhyung@kernel.org>
  Neil Armstrong <neil.armstrong@linaro.org>
  Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
  Pali Rohár <pali@kernel.org>
  Paolo Bonzini <pbonzini@redhat.com>
  Paul Cercueil <paul@crapouillou.net>
  Peng Fan <peng.fan@nxp.com>
  Philippe Schenker <philippe.schenker@toradex.com>
  Rafał Miłecki <rafal@milecki.pl>
  Rodrigo Vivi <rodrigo.vivi@intel.com>
  Samson Tam <samson.tam@amd.com>
  Sean Christopherson <seanjc@google.com>
  Sonny Jiang <sonny.jiang@amd.com>
  Stefan Hajnoczi <stefanha@redhat.com>
  Stephen Boyd <sboyd@kernel.org>
  Suwan Kim <suwan.kim027@gmail.com>
  Taimur Hassan <Syed.Hassan@amd.com>
  Thomas Zimmermann <tzimmermann@suse.de>
  Tina Hsu <tina_hsu@phison.corp-partner.google.com>
  Xing Zhengjun <zhengjun.xing@linux.intel.com>
  Xuan Zhuo <xuanzhuo@linux.alibaba.com>
  Zhengjun Xing <zhengjun.xing@linux.intel.com>
  Zhu Lingshan <lingshan.zhu@intel.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               broken  
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
 build-i386-pvops                                             broken  
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
 test-amd64-amd64-freebsd11-amd64                             fail    
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
 test-amd64-amd64-libvirt-qcow2                               pass    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     fail    
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

broken-job build-i386-pvops broken
broken-job build-i386-xsm broken
broken-step build-i386-xsm host-install(4)
broken-step build-i386-pvops host-install(4)

Not pushing.

(No revision log; it would be 2276 lines long.)

