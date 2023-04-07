Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E096DA865
	for <lists+xen-devel@lfdr.de>; Fri,  7 Apr 2023 07:00:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519025.806162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkeC6-0002sT-OW; Fri, 07 Apr 2023 04:59:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519025.806162; Fri, 07 Apr 2023 04:59:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkeC6-0002ql-JN; Fri, 07 Apr 2023 04:59:26 +0000
Received: by outflank-mailman (input) for mailman id 519025;
 Fri, 07 Apr 2023 04:59:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pkeC5-0002qb-9t; Fri, 07 Apr 2023 04:59:25 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pkeC5-0000g0-5I; Fri, 07 Apr 2023 04:59:25 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pkeC4-00032O-MI; Fri, 07 Apr 2023 04:59:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pkeC4-0000hf-Ju; Fri, 07 Apr 2023 04:59:24 +0000
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
	bh=A17r9BwFn8tKWcPnBxRaVzrXm191/qaVotDZdHCHaAc=; b=EqLnsqEiW14TNhJ5IRpjfNF4wb
	1eOdLoQkho2d4Z2qqXPl3VpHu5EdM2+ilrjdjO3x+MgSj9JgL8X+24boOtLLuQvAJkFjSKqHxQIYW
	SnFx1jED6MxgvmC0DYPHTiWxfttE6WsgZmO1vILb5ykBido4uPrT7vOrKuNsER00HFYY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180172-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 180172: tolerable trouble: fail/pass/starved - PUSHED
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
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
    linux=f2afccfefe7be1f7346564fe619277110d341f9b
X-Osstest-Versions-That:
    linux=99ddf2254febae9eab7fb0bcc02c5322243f5c49
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 07 Apr 2023 04:59:24 +0000

flight 180172 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180172/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 180159
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 180159
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 180159
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 180159
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 180159
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
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
 linux                f2afccfefe7be1f7346564fe619277110d341f9b
baseline version:
 linux                99ddf2254febae9eab7fb0bcc02c5322243f5c49

Last test of basis   180159  2023-04-05 18:14:53 Z    1 days
Testing same since   180172  2023-04-06 19:10:15 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Amit Pundir <amit.pundir@linaro.org>
  Andrea Righi <andrea.righi@canonical.com>
  Andy Chi <andy.chi@canonical.com>
  Andy Roulin <aroulin@nvidia.com>
  Anh Tuan Phan <tuananhlfc@gmail.com>
  Armin Wolf <W_Armin@gmx.de>
  Arnd Bergmann <arnd@arndb.de>
  Arseniy Krasnov <AVKrasnov@sberdevices.ru>
  Bard Liao <yung-chuan.liao@linux.intel.com>
  Ben Greear <greearb@candelatech.com>
  Benjamin Asbach <asbachb.kernel@impl.it>
  Bobby Eshleman <bobby.eshleman@bytedance.com>
  Boris Brezillon <boris.brezillon@collabora.com>
  chowtom <chowtom@gmail.com>
  Christian Brauner <brauner@kernel.org>
  Christian König <christian.koenig@amd.com>
  Christian König <ckoenig.leichtzumerken@gmail.com>
  Corinna Vinschen <vinschen@redhat.com>
  Daniel Golle <daniel@makrotopia.org>
  Daniel Vetter <daniel.vetter@ffwll.ch>
  Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
  David S. Miller <davem@davemloft.net>
  Duy Nguyen <duy.nguyen.rh@renesas.com>
  Eric Dumazet <edumazet@google.com>
  Eugene Huang <eugene.huang99@gmail.com>
  Felix Fietkau <nbd@nbd.name>
  Frank Wunderlich <frank-w@public-files.de>
  Ge-org Brohammer <gbrohammer@outlook.com>
  Greg Ungerer <gerg@linux-m68k.org>
  Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
  Guenter Roeck <linux@roeck-us.net>
  Guillaume Nault <gnault@redhat.com>
  Gustav Ekelund <gustaek@axis.com>
  Hangbin Liu <liuhangbin@gmail.com>
  Hans de Goede <hdegoede@redhat.com>
  Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
  Jakub Kicinski <kuba@kernel.org>
  Jani Nikula <jani.nikula@intel.com>
  Jason Gunthorpe <jgg@nvidia.com>
  Jason Montleon <jmontleo@redhat.com>
  Jeremy Soller <jeremy@system76.com>
  Jiri Slaby (SUSE) <jirislaby@kernel.org>
  Johannes Berg <johannes.berg@intel.com>
  Junfeng Guo <junfeng.guo@intel.com>
  Kalle Valo <kvalo@kernel.org>
  Kalle Valo <quic_kvalo@quicinc.com>
  Karol Herbst <kherbst@redhat.com>
  Karol Wachowski <karol.wachowski@linux.intel.com>
  Khanh Le <khanh.le.xr@renesas.com>
  Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  Kuniyuki Iwashima <kuniyu@amazon.com>
  Lai Peter Jun Ann <peter.jun.ann.lai@intel.com>
  Lingyu Liu <lingyu.liu@intel.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Lorenzo Bianconi <lorenzo@kernel.org>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Marek Szyprowski <m.szyprowski@samsung.com>
  Mario Limonciello <mario.limonciello@amd.com>
  Mark Brown <broonie@kernel.org>
  Mark Pearson <mpearson-lenovo@squebb.ca>
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>
  Matthew Auld <matthew.auld@intel.com>
  Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
  Michal Sojka <michal.sojka@cvut.cz>
  Min Li <lm0963hack@gmail.com>
  Mirsad Goran Todorovac <mirsad.todorovac@alu.unizg.hr>
  Oleksij Rempel <o.rempel@pengutronix.de>
  Oliver Hartkopp <socketcan@hartkopp.net>
  Paolo Abeni <pabeni@redhat.com>
  Pengfei Xu <pengfei.xu@intel.com>
  Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
  Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
  Rafal Romanowski <rafal.romanowski@intel.com>
  Ram Kumar Dharuman <quic_ramd@quicinc.com>
  Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
  Ryder Lee <ryder.lee@mediatek.com>
  Shahab Vahedi <shahab@synopsys.com>
  Shailend Chand <shailend@google.com>
  Shengjiu Wang <shengjiu.wang@nxp.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Shuangpeng Bai <sjb7183@psu.edu>
  Siddharth Vadapalli <s-vadapalli@ti.com>
  Simei Su <simei.su@intel.com>
  Song Yoong Siang <yoong.siang.song@intel.com>
  Sricharan Ramabadhran <quic_srichara@quicinc.com>
  Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
  Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
  Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
  Takashi Iwai <tiwai@suse.de>
  Thierry Reding <thierry.reding@gmail.com>
  Thomas Zimmermann <tzimmermann@suse.de>
  Tim Crawford <tcrawford@system76.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Tvrtko Ursulin <tvrtko.ursulin@intel.com>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Vladimir Oltean <vladimir.oltean@nxp.com>
  Wojciech Drewek <wojciech.drewek@intel.com>
  Xin Long <lucien.xin@gmail.com>
  Ziyang Xuan <william.xuanziyang@huawei.com>

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
 test-amd64-amd64-xl-vhd                                      pass    
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
   99ddf2254feb..f2afccfefe7b  f2afccfefe7be1f7346564fe619277110d341f9b -> tested/linux-linus

