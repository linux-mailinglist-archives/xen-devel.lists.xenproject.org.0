Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC42258AEF9
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 19:35:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381443.616147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oK1EZ-0007jL-LH; Fri, 05 Aug 2022 17:35:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381443.616147; Fri, 05 Aug 2022 17:35:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oK1EZ-0007fj-Hu; Fri, 05 Aug 2022 17:35:39 +0000
Received: by outflank-mailman (input) for mailman id 381443;
 Fri, 05 Aug 2022 17:35:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oK1EX-0007Q0-6p; Fri, 05 Aug 2022 17:35:37 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oK1EX-00064Z-4B; Fri, 05 Aug 2022 17:35:37 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oK1EW-0001oQ-LV; Fri, 05 Aug 2022 17:35:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oK1EW-0006GN-Kz; Fri, 05 Aug 2022 17:35:36 +0000
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
	bh=AA+ORxmhdvUmekmXgKvIz14KzLJvVGZl6hV3sOol+oQ=; b=FiPpxO1ue/Ghre0SEvuzNsC2lJ
	TezDRUWlpeVDKYdEnKIrceNwNp4eFTwN+o9b1s1Y5AlqQIzRRTTLUl9LJ9MZ/RVuzwVHl3Yq+V2Ab
	njUOY4O3J38lKq/wYh/pH4EeBSXu1CHOF+1rw+kxMQe43PuNQpXiVugAIZDzLeuBWj14=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-172164-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 172164: regressions - FAIL
X-Osstest-Failures:
    qemu-mainline:build-amd64-libvirt:libvirt-build:fail:regression
    qemu-mainline:build-i386-libvirt:libvirt-build:fail:regression
    qemu-mainline:build-arm64-libvirt:libvirt-build:fail:regression
    qemu-mainline:test-amd64-amd64-xl-qcow2:guest-start/debian.repeat:fail:regression
    qemu-mainline:build-armhf-libvirt:libvirt-build:fail:regression
    qemu-mainline:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-raw:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-pair:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-libvirt:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-pair:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-vhd:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    qemuu=09ed077d7fae5f825e18ff9a2004dcdd1b165edb
X-Osstest-Versions-That:
    qemuu=2480f3bbd03814b0651a1f74959f5c6631ee5819
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 05 Aug 2022 17:35:36 +0000

flight 172164 qemu-mainline real [real]
http://logs.test-lab.xenproject.org/osstest/logs/172164/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64-libvirt           6 libvirt-build            fail REGR. vs. 172123
 build-i386-libvirt            6 libvirt-build            fail REGR. vs. 172123
 build-arm64-libvirt           6 libvirt-build            fail REGR. vs. 172123
 test-amd64-amd64-xl-qcow2   21 guest-start/debian.repeat fail REGR. vs. 172123
 build-armhf-libvirt           6 libvirt-build            fail REGR. vs. 172123

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-qcow2  1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-xsm   1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-raw   1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-i386-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt       1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-amd64-libvirt-vhd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 172123
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 172123
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 172123
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 172123
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 172123
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 qemuu                09ed077d7fae5f825e18ff9a2004dcdd1b165edb
baseline version:
 qemuu                2480f3bbd03814b0651a1f74959f5c6631ee5819

Last test of basis   172123  2022-08-03 18:10:07 Z    1 days
Failing since        172148  2022-08-04 21:39:38 Z    0 days    2 attempts
Testing same since   172164  2022-08-05 08:54:17 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  BALATON Zoltan <balaton@eik.bme.hu>
  Cornelia Huck <cohuck@redhat.com>
  Daniel Henrique Barboza <danielhb413@gmail.com>
  Eugenio Pérez <eperezma@redhat.com>
  Laurent Vivier <laurent@vivier.eu>
  Richard Henderson <richard.henderson@linaro.org>
  Stefan Hajnoczi <stefanha@redhat.com>
  Stefan Weil <sw@weilnetz.de>
  Thomas Huth <thuth@redhat.com>
  Yonggang Luo <luoyonggang@gmail.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          fail    
 build-arm64-libvirt                                          fail    
 build-armhf-libvirt                                          fail    
 build-i386-libvirt                                           fail    
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
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           blocked 
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-libvirt-xsm                                 blocked 
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-amd64-i386-libvirt-xsm                                  blocked 
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
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
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     blocked 
 test-armhf-armhf-libvirt                                     blocked 
 test-amd64-i386-libvirt                                      blocked 
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                blocked 
 test-amd64-i386-libvirt-pair                                 blocked 
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               blocked 
 test-amd64-amd64-xl-qcow2                                    fail    
 test-arm64-arm64-libvirt-raw                                 blocked 
 test-armhf-armhf-libvirt-raw                                 blocked 
 test-amd64-i386-libvirt-raw                                  blocked 
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 blocked 
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      pass    
 test-amd64-i386-xl-vhd                                       pass    


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

------------------------------------------------------------
commit 09ed077d7fae5f825e18ff9a2004dcdd1b165edb
Merge: 846dcf0ba4 21d4e557e2
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Thu Aug 4 17:21:13 2022 -0700

    Merge tag 'trivial-branch-for-7.1-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging
    
    Pull request trivial branch 20220804
    
    # -----BEGIN PGP SIGNATURE-----
    #
    # iQJGBAABCAAwFiEEzS913cjjpNwuT1Fz8ww4vT8vvjwFAmLsHD8SHGxhdXJlbnRA
    # dml2aWVyLmV1AAoJEPMMOL0/L748y7AP/iXRxiqvnb478I+OuOPRu37PaBEfU3n4
    # Ry4xr1VT+9GV3MKBK1icA065+tTmW4s1ANJBihhGgn0S1oMiSJQk6esAKtjGsdt0
    # OdWPPxVHN2XMs0UgwnONjzgSCbS5boLPK6wk+jMoyb3Vry+moa7JIbRr1ynlWOdN
    # 3S3rDTsyOX0gvuNOjht56g5aGRnnPqU3qIU6AdIOxpZxpb4dHi3g+UDAB5APCZss
    # oUZonuBeiSA+1T2XJc9opNdA56s8ObO41TJ1vMqt4TboYWUo+VXZf5Y21wE85Cx/
    # qUtNiY7rCfBA8EdjmvkunmV0jIc9TghWCBTh3JMWp756dvwIpwl4eWnODFUwyhZs
    # S4EAlPgHEjzqi6dbuKb+MNDkQKjUjP8gDn8ZVPQT+QLl0yjY9sOasKqkI0xnZDfI
    # NVVIhUjpwWfC9jJL7M+ML6+Tg16UpH4vOq9nySZ3G/z61P1+uXnI/M2Fx5LxoELQ
    # Z9eHzphbXgyGialt+Yin0A07rOYG9oRgAKGc2e0RgEPFSO8c6kcy+DdoVgz87xCC
    # PwrfNs/s6vzH11a3MPkYhTadVvaDIXbPgkRdUNKPyaGLvSjkrQ7aMCCGT0dCfDAq
    # 00SAq+KMaSdL9VDgtipGcDOGwbLpI9ixNXvMPNrfVu+Qa6VcZO6synwWaeTMnxzf
    # tx4tSb/W4nB3
    # =y8/X
    # -----END PGP SIGNATURE-----
    # gpg: Signature made Thu 04 Aug 2022 12:21:35 PM PDT
    # gpg:                using RSA key CD2F75DDC8E3A4DC2E4F5173F30C38BD3F2FBE3C
    # gpg:                issuer "laurent@vivier.eu"
    # gpg: Good signature from "Laurent Vivier <lvivier@redhat.com>" [undefined]
    # gpg:                 aka "Laurent Vivier <laurent@vivier.eu>" [undefined]
    # gpg:                 aka "Laurent Vivier (Red Hat) <lvivier@redhat.com>" [undefined]
    # gpg: WARNING: This key is not certified with a trusted signature!
    # gpg:          There is no indication that the signature belongs to the owner.
    # Primary key fingerprint: CD2F 75DD C8E3 A4DC 2E4F  5173 F30C 38BD 3F2F BE3C
    
    * tag 'trivial-branch-for-7.1-pull-request' of https://gitlab.com/laurent_vivier/qemu:
      include/qemu/host-utils.h: Simplify the compiler check in mulu128()
      ppc: Remove redundant macro MSR_BOOK3S_MASK.
      docs/about/removed-features: Move the -soundhw into the right section
      vdpa: Fix file descriptor leak on get features error
      README.rst: fix link formatting
    
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

commit 846dcf0ba4eff824c295f06550b8673ff3f31314
Merge: 0ee33dd0ce 7b0ca31364
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Thu Aug 4 14:06:17 2022 -0700

    Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging
    
    Pull request
    
    - Format string portability fix in virtiofsd
    
    # -----BEGIN PGP SIGNATURE-----
    #
    # iQEzBAABCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLsF9sACgkQnKSrs4Gr
    # c8hAgwf/QPdBt6F1kBZTlSSt2nV2VAlX9HxsWAE5tSbtUTNS9Xr+avX6MHljAU20
    # WN+zZ+4cUHjIqtt6NueqkTczV5PqccvB6H9Cs0FdkKH8unyMSHvSRNuRlAG+LgMF
    # YQdHGGc9tvcIACz4GwWfzXJ/FsaoFHw7qTX3AUxe9nmlZnbB7cdl4Z7v6CQZ6kFL
    # bfXCd2bXcw2XosykGijsiiJ5IV+nshchaVA01DbO+w/KeLaGJgUbiEB6unMGUIBL
    # IMxy9VaP2AS44cGqNkFfWIm2tCfE0uT2qhca4BMk0kXQlwoBAuFGHuGHhbH0dU+w
    # fFN+lSaLs0oBGo1G0Mw+ImLF9XymAw==
    # =k1jb
    # -----END PGP SIGNATURE-----
    # gpg: Signature made Thu 04 Aug 2022 12:02:51 PM PDT
    # gpg:                using RSA key 8695A8BFD3F97CDAAC35775A9CA4ABB381AB73C8
    # gpg: Good signature from "Stefan Hajnoczi <stefanha@redhat.com>" [full]
    # gpg:                 aka "Stefan Hajnoczi <stefanha@gmail.com>" [full]
    
    * tag 'block-pull-request' of https://gitlab.com/stefanha/qemu:
      virtiofsd: Fix format strings
    
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

commit 0ee33dd0cee1f9a239d561f1a91e6ea493d1f5a9
Merge: 2480f3bbd0 ed021daf2d
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Thu Aug 4 11:47:58 2022 -0700

    Merge tag 'pull-ppc-20220804' of https://gitlab.com/danielhb/qemu into staging
    
    ppc patch queue for 2022-08-04:
    
    In this short queue we have a fix in the sam460ex machine where we're
    not storing all GPIO lines in sam460ex_init().
    
    This is not causing problems (as far as we're aware of) at this moment,
    but this is getting in the way of a ppc405 rework we want to do for 7.2,
    so let's fix it now.
    
    # -----BEGIN PGP SIGNATURE-----
    #
    # iHUEABYKAB0WIQQX6/+ZI9AYAK8oOBk82cqW3gMxZAUCYuwOIQAKCRA82cqW3gMx
    # ZN+NAQDDOk4b79khltmrslo4Sa16nu/ARgqMGOsyy0Y5Whs9MgEAyiAVhpQ6C7Ok
    # W2sHeUkv/ZvzWvE7LWXMPZehBgU9DgM=
    # =QrsF
    # -----END PGP SIGNATURE-----
    # gpg: Signature made Thu 04 Aug 2022 11:21:21 AM PDT
    # gpg:                using EDDSA key 17EBFF9923D01800AF2838193CD9CA96DE033164
    # gpg: Good signature from "Daniel Henrique Barboza <danielhb413@gmail.com>" [unknown]
    # gpg: WARNING: This key is not certified with a trusted signature!
    # gpg:          There is no indication that the signature belongs to the owner.
    # Primary key fingerprint: 17EB FF99 23D0 1800 AF28  3819 3CD9 CA96 DE03 3164
    
    * tag 'pull-ppc-20220804' of https://gitlab.com/danielhb/qemu:
      hw/ppc: sam460ex.c: store all GPIO lines in mal_irqs[]
    
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

commit 7b0ca313647532a2c7007379ff800c9a2415c95d
Author: Stefan Weil <sw@weilnetz.de>
Date:   Thu Aug 4 09:48:33 2022 +0200

    virtiofsd: Fix format strings
    
    Signed-off-by: Stefan Weil <sw@weilnetz.de>
    Message-Id: <20220804074833.892604-1-sw@weilnetz.de>
    Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

commit ed021daf2d6c19499ae406055156dc19c073228f
Author: Daniel Henrique Barboza <danielhb413@gmail.com>
Date:   Wed Aug 3 20:32:04 2022 -0300

    hw/ppc: sam460ex.c: store all GPIO lines in mal_irqs[]
    
    We're not storing all GPIO lines we're retrieving with
    qdev_get_gpio_in() in mal_irqs[]. We're storing just the last one in the
    first index:
    
        for (i = 0; i < ARRAY_SIZE(mal_irqs); i++) {
            mal_irqs[0] = qdev_get_gpio_in(uic[2], 3 + i);
        }
        ppc4xx_mal_init(env, 4, 16, mal_irqs);
    
    mal_irqs is used in ppc4xx_mal_init() to assign the IRQs to MAL:
    
        for (i = 0; i < 4; i++) {
            mal->irqs[i] = irqs[i];
        }
    
    Since only irqs[0] has been initialized, mal->irqs[1,2,3] are being
    zeroed.
    
    This doesn´t seem to trigger any apparent issues at this moment, but
    Cedric's QOMification of the MAL device [1] is executing a
    sysbus_connect_irq() that will fail if we do not store all GPIO lines
    properly.
    
    [1] https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg00497.html
    
    Cc: Peter Maydell <peter.maydell@linaro.org>
    Cc: BALATON Zoltan <balaton@eik.bme.hu>
    Fixes: 706e944206d7 ("hw/ppc/sam460ex: Drop use of ppcuic_init()")
    Acked-by: BALATON Zoltan <balaton@eik.bme.hu>
    Reviewed-by: Cédric Le Goater <clg@kaod.org>
    Message-Id: <20220803233204.2724202-1-danielhb413@gmail.com>
    Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

commit 21d4e557e2fd0cb7f10b632b35f51146a1b6d892
Author: Thomas Huth <thuth@redhat.com>
Date:   Thu Jul 21 09:48:09 2022 +0200

    include/qemu/host-utils.h: Simplify the compiler check in mulu128()
    
    We currently require at least GCC 7.4 or Clang 6.0 for compiling QEMU.
    GCC has __builtin_mul_overflow since version 5 already, and Clang 6.0
    also provides this built-in function (see its documentation on this page:
    https://releases.llvm.org/6.0.0/tools/clang/docs/LanguageExtensions.html ).
    So we can simplify the #if statement here.
    
    Signed-off-by: Thomas Huth <thuth@redhat.com>
    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
    Message-Id: <20220721074809.1513357-1-thuth@redhat.com>
    Signed-off-by: Laurent Vivier <laurent@vivier.eu>

commit 1e2dd311491565a58b30f29e71c6e429fc8e7e84
Author: Yonggang Luo <luoyonggang@gmail.com>
Date:   Fri Jul 29 04:11:35 2022 +0800

    ppc: Remove redundant macro MSR_BOOK3S_MASK.
    
    Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
    Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
    Message-Id: <20220728201135.223-1-luoyonggang@gmail.com>
    Signed-off-by: Laurent Vivier <laurent@vivier.eu>

commit 9878fbf3424015da93e0a8e8cec40a2d45323fad
Author: Thomas Huth <thuth@redhat.com>
Date:   Tue Aug 2 09:56:11 2022 +0200

    docs/about/removed-features: Move the -soundhw into the right section
    
    The note about the removal of '-soundhw' has been accidentally added
    to the section of removed "linux-user mode CPUs" ... it should reside
    in the section about removed "System emulator command line arguments"
    instead.
    
    Fixes: 039a68373c ("introduce -audio as a replacement for -soundhw")
    Signed-off-by: Thomas Huth <thuth@redhat.com>
    Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
    Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
    Message-Id: <20220802075611.346835-1-thuth@redhat.com>
    Signed-off-by: Laurent Vivier <laurent@vivier.eu>

commit aed5da45daf734ddc543c0791e877dac75e16f61
Author: Eugenio Pérez <eperezma@redhat.com>
Date:   Tue Aug 2 13:24:46 2022 +0200

    vdpa: Fix file descriptor leak on get features error
    
    File descriptor vdpa_device_fd is not free in the case of returning
    error from vhost_vdpa_get_features. Fixing it by making all errors go to
    the same error path.
    
    Resolves: Coverity CID 1490785
    Fixes: 8170ab3f43 ("vdpa: Extract get features part from vhost_vdpa_get_max_queue_pairs")
    
    Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
    Reviewed-by: Laurent Vivier <lvivier@redhat.com>
    Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
    Message-Id: <20220802112447.249436-2-eperezma@redhat.com>
    Signed-off-by: Laurent Vivier <laurent@vivier.eu>

commit 9567fc1665b6649d2aff0184f68377a9e7c30dd9
Author: Cornelia Huck <cohuck@redhat.com>
Date:   Wed Aug 3 11:02:50 2022 +0200

    README.rst: fix link formatting
    
    Make the links render correctly.
    
    Signed-off-by: Cornelia Huck <cohuck@redhat.com>
    Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
    Message-Id: <20220803090250.136556-1-cohuck@redhat.com>
    Signed-off-by: Laurent Vivier <laurent@vivier.eu>

