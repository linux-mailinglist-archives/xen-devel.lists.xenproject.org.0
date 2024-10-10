Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CDB997D86
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 08:42:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815460.1229216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1symrg-0000jm-ON; Thu, 10 Oct 2024 06:41:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815460.1229216; Thu, 10 Oct 2024 06:41:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1symrg-0000hT-Lb; Thu, 10 Oct 2024 06:41:36 +0000
Received: by outflank-mailman (input) for mailman id 815460;
 Thu, 10 Oct 2024 06:41:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1symrf-0000hJ-4s; Thu, 10 Oct 2024 06:41:35 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1symre-0004eQ-UN; Thu, 10 Oct 2024 06:41:34 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1symre-0001wo-9m; Thu, 10 Oct 2024 06:41:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1symre-00078b-9H; Thu, 10 Oct 2024 06:41:34 +0000
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
	bh=/aFEowOpWuHRLfJO3VKg/9YeRo5k7DMu7vedQs0iLS8=; b=eRhpaZ27bwt9X53InZvofEIHG8
	n/nv7ot65dt2tXi0UY2ViUis5Qyq/X0vNAF41jwE9ejVcTXztLMS7pqTTV6CaE3dkkzomOmE2ejPS
	WT39iXroqh8qPEeZIe9SiVDvjAAUUY1HsI66wy8Wb0PDGDAlerWEAKafHZzOnUuha02Y=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-188026-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-upstream-4.18-testing test] 188026: tolerable FAIL - PUSHED
X-Osstest-Failures:
    qemu-upstream-4.18-testing:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.18-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-upstream-4.18-testing:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-upstream-4.18-testing:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    qemu-upstream-4.18-testing:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    qemu-upstream-4.18-testing:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.18-testing:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    qemu-upstream-4.18-testing:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-upstream-4.18-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-upstream-4.18-testing:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    qemu-upstream-4.18-testing:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.18-testing:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    qemu-upstream-4.18-testing:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.18-testing:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-upstream-4.18-testing:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.18-testing:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    qemu-upstream-4.18-testing:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.18-testing:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-upstream-4.18-testing:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.18-testing:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-upstream-4.18-testing:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.18-testing:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    qemu-upstream-4.18-testing:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    qemu-upstream-4.18-testing:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.18-testing:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    qemu-upstream-4.18-testing:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-upstream-4.18-testing:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.18-testing:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.18-testing:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    qemu-upstream-4.18-testing:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.18-testing:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-upstream-4.18-testing:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.18-testing:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    qemu-upstream-4.18-testing:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-upstream-4.18-testing:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    qemu-upstream-4.18-testing:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-upstream-4.18-testing:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.18-testing:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-upstream-4.18-testing:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.18-testing:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    qemu-upstream-4.18-testing:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.18-testing:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    qemu-upstream-4.18-testing:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.18-testing:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    qemu-upstream-4.18-testing:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    qemuu=bdf719c4c535cf14ec4fe8e9cb7a798a5a73fb23
X-Osstest-Versions-That:
    qemuu=0df9387c8983e1b1e72d8c574356f572342c03e6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 10 Oct 2024 06:41:34 +0000

flight 188026 qemu-upstream-4.18-testing real [real]
http://logs.test-lab.xenproject.org/osstest/logs/188026/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 183557
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 183557
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 183557
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 183557
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass

version targeted for testing:
 qemuu                bdf719c4c535cf14ec4fe8e9cb7a798a5a73fb23
baseline version:
 qemuu                0df9387c8983e1b1e72d8c574356f572342c03e6

Last test of basis   183557  2023-10-27 13:11:22 Z  348 days
Testing same since   188026  2024-10-09 10:11:40 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Akihiko Odaki <akihiko.odaki@daynix.com>
  Alexander Bulekov <alxndr@bu.edu>
  Alistair Francis <alistair.francis@wdc.com>
  Andrew Jones <andrew.jones@linux.dev>
  Ankit Kumar <ankit.kumar@samsung.com>
  Anthony PERARD <anthony.perard@citrix.com>
  BALATON Zoltan <balaton@eik.bme.hu>
  Bernhard Beschow <shentey@gmail.com>
  Claudio Fontana <cfontana@suse.de>
  Colton Lewis <coltonlewis@google.com>
  Conor Dooley <conor.dooley@microchip.com>
  Cédric Le Goater <clg@kaod.org>
  Daniel Henrique Barboza <danielhb413@gmail.com>
  Daniel Henrique Barboza <dbarboza@ventanamicro.com>
  David Hildenbrand <david@redhat.com>
  Dongli Zhang <dongli.zhang@oracle.com>
  Fabiano Rosas <farosas@suse.de>
  Guenter Roeck <linux@roeck-us.net>
  Hang Yu <francis_yuu@stu.pku.edu.cn>
  Ilya Leoshkevich <iii@linux.ibm.com>
  Janosch Frank <frankja@linux.ibm.com>
  Jason Chien <jason.chien@sifive.com>
  John Snow <jsnow@redhat.com>
  Kevin Wolf <kwolf@redhat.com>
  Klaus Jensen <k.jensen@samsung.com>
  Leon Schuermann <leons@opentitan.org>
  LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
  Luca Bonissi <qemu@bonslack.org>
  Maksim Kostin <maksim.kostin@ispras.ru>
  Marc-André Lureau <marcandre.lureau@redhat.com>
  Markus Armbruster <armbru@redhat.com>
  Michael S. Tsirkin <mst@redhat.com>
  Michael Tokarev <mjt@tls.msk.ru>
  Nathan Egge <negge@xiph.org>
  Nicholas Piggin <npiggin@gmail.com>
  Niklas Cassel <niklas.cassel@wdc.com>
  Peter Maydell <peter.maydell@linaro.org>
  Philippe Mathieu-Daudé <philmd@linaro.org>
  Richard Henderson <richard.henderson@linaro.org>
  Song Gao <gaosong@loongson.cn>
  Stefan Berger <stefanb@linux.ibm.com>
  Stefan Hajnoczi <stefanha@redhat.com>
  Thomas Huth <thuth@redhat.com>
  Zhao Liu <zhao1.liu@intel.com>

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
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
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


Pushing revision :

To xenbits.xen.org:/home/xen/git/qemu-xen.git
   0df9387c89..bdf719c4c5  bdf719c4c535cf14ec4fe8e9cb7a798a5a73fb23 -> stable-4.18

