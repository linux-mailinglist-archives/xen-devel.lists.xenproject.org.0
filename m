Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C81A326C1F
	for <lists+xen-devel@lfdr.de>; Sat, 27 Feb 2021 08:38:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90700.171699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFuA3-0005V8-Hi; Sat, 27 Feb 2021 07:37:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90700.171699; Sat, 27 Feb 2021 07:37:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFuA3-0005Uh-DO; Sat, 27 Feb 2021 07:37:11 +0000
Received: by outflank-mailman (input) for mailman id 90700;
 Sat, 27 Feb 2021 07:37:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lFuA1-0005UZ-KU; Sat, 27 Feb 2021 07:37:09 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lFuA1-0000Rw-BZ; Sat, 27 Feb 2021 07:37:09 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lFuA1-0004YY-1R; Sat, 27 Feb 2021 07:37:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lFuA1-0004p5-0x; Sat, 27 Feb 2021 07:37:09 +0000
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
	bh=DYeCbdRwCIjB+WJ690vVBrdWnc2jg3M1Y019hpP72rI=; b=ZEs+eD8/dyktgyS59xJF0tQq18
	DZU6UVyJn6zKPGDrHsVhNNxiURxcexxLjrouFnQur1ZHTEYmcJdOT9SvVWSLQ5AjZHO0ZqUlPbn8W
	YSyYmW/v1kgMvzWlK+kzmeLsjqgNrVnd8oeGOIzz1l2NvHXE3gl/dRpifoADHe9PLyz8=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159717-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 159717: regressions - FAIL
X-Osstest-Failures:
    xen-unstable:test-amd64-amd64-examine:memdisk-try-append:fail:regression
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=109e8177fd4a225e7025c4c17d2c9537b550b4ed
X-Osstest-Versions-That:
    xen=fc8fb368515391374e5f170a1e07205d914bc14a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 27 Feb 2021 07:37:09 +0000

flight 159717 xen-unstable real [real]
flight 159724 xen-unstable real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/159717/
http://logs.test-lab.xenproject.org/osstest/logs/159724/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-examine      4 memdisk-try-append       fail REGR. vs. 159692

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 159692
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 159692
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 159692
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 159692
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 159692
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 159692
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 159692
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 159692
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 159692
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 159692
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 159692
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  109e8177fd4a225e7025c4c17d2c9537b550b4ed
baseline version:
 xen                  fc8fb368515391374e5f170a1e07205d914bc14a

Last test of basis   159692  2021-02-26 03:53:29 Z    1 days
Testing same since   159717  2021-02-26 17:38:57 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dario Faggioli <dfaggioli@suse.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-prev                                             pass    
 build-i386-prev                                              pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-xtf-amd64-amd64-1                                       pass    
 test-xtf-amd64-amd64-2                                       pass    
 test-xtf-amd64-amd64-3                                       pass    
 test-xtf-amd64-amd64-4                                       pass    
 test-xtf-amd64-amd64-5                                       pass    
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
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
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
 test-amd64-amd64-livepatch                                   pass    
 test-amd64-i386-livepatch                                    pass    
 test-amd64-amd64-migrupgrade                                 pass    
 test-amd64-i386-migrupgrade                                  pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-amd64-pvgrub                                pass    
 test-amd64-amd64-i386-pvgrub                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
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


Not pushing.

------------------------------------------------------------
commit 109e8177fd4a225e7025c4c17d2c9537b550b4ed
Author: Julien Grall <jgrall@amazon.com>
Date:   Sat Feb 20 19:22:34 2021 +0000

    xen/sched: Add missing memory barrier in vcpu_block()
    
    The comment in vcpu_block() states that the events should be checked
    /after/ blocking to avoids wakeup waiting race. However, from a generic
    perspective, set_bit() doesn't prevent re-ordering. So the following
    could happen:
    
    CPU0  (blocking vCPU A)         |   CPU1 ( unblock vCPU A)
                                    |
    A <- read local events          |
                                    |   set local events
                                    |   test_and_clear_bit(_VPF_blocked)
                                    |       -> Bail out as the bit if not set
                                    |
    set_bit(_VFP_blocked)           |
                                    |
    check A                         |
    
    The variable A will be 0 and therefore the vCPU will be blocked when it
    should continue running.
    
    vcpu_block() is now gaining an smp_mb__after_atomic() to prevent the CPU
    to read any information about local events before the flag _VPF_blocked
    is set.
    
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Ash Wilding <ash.j.wilding@gmail.com>
    Acked-by: Stefano Stabellini <sstabellini@kernel.org>
    Acked-by: Dario Faggioli <dfaggioli@suse.com>
    Release-Acked-by: Ian Jackson <iwj@xenproject.org>

commit 79b6574f8ecea39c14557bdd7049c7e2d21ddcbd
Author: Julien Grall <jgrall@amazon.com>
Date:   Thu Feb 25 17:08:49 2021 +0000

    tools/xenstore-control: Don't leak buf in live_update_start()
    
    All the error paths but one will free buf. Cover the remaining path so
    buf can't be leaked.
    
    This bug was discovered and resolved using Coverity Static Analysis
    Security Testing (SAST) by Synopsys, Inc.
    
    Fixes: 7f97193e6aa8 ("tools/xenstore: add live update command to xenstore-control")
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    Reviewed-by: Juergen Gross <jgross@suse.com>
    Release-Acked-by: Ian Jackson <iwj@xenproject.org>

commit 11d9933f6bf0cdb69cdd82c5ad2213fcbe73502f
Author: Julien Grall <jgrall@amazon.com>
Date:   Thu Feb 25 16:33:23 2021 +0000

    tools/xenstored: control: Store the save filename in lu_dump_state
    
    The function lu_close_dump_state() will use talloc_asprintf() without
    checking whether the allocation succeeded. In the unlikely case we are
    out of memory, we would dereference a NULL pointer.
    
    As we already computed the filename in lu_get_dump_state(), we can store
    the name in the lu_dump_state. This is avoiding to deal with memory file
    in the close path and also reduce the risk to use the different
    filename.
    
    This bug was discovered and resolved using Coverity Static Analysis
    Security Testing (SAST) by Synopsys, Inc.
    
    Fixes: c0dc6a3e7c41 ("tools/xenstore: read internal state when doing live upgrade")
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    Reviewed-by: Juergen Gross <jgross@suse.com>
    Release-Acked-by: Ian Jackson <iwj@xenproject.org>

commit 702b44be43b431695dd9ab49ca4a89ea50e31711
Author: Julien Grall <jgrall@amazon.com>
Date:   Thu Feb 25 15:43:04 2021 +0000

    tools/xenstored: Avoid unnecessary talloc_strdup() in do_lu_start()
    
    At the moment, the return of talloc_strdup() is not checked. This means
    we may dereference a NULL pointer if the allocation failed.
    
    However, it is pointless to allocate the memory as send_reply() will
    copy the data to a different buffer. So drop the use of talloc_strdup().
    
    This bug was discovered and resolved using Coverity Static Analysis
    Security Testing (SAST) by Synopsys, Inc.
    
    Fixes: af216a99fb4a ("tools/xenstore: add the basic framework for doing the live update")
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    Reviewed-by: Juergen Gross <jgross@suse.com>
    Release-Acked-by: Ian Jackson <iwj@xenproject.org>

commit 2fc7939e26d223b2a8ce37204ea479d013444b7f
Author: Julien Grall <jgrall@amazon.com>
Date:   Thu Feb 25 15:15:23 2021 +0000

    tools/xenstored: Avoid unnecessary talloc_strdup() in do_control_lu()
    
    At the moment, the return of talloc_strdup() is not checked. This means
    we may dereference a NULL pointer if the allocation failed.
    
    However, it is pointless to allocate the memory as send_reply() will
    copy the data to a different buffer. So drop the use of talloc_strdup().
    
    This bug was discovered and resolved using Coverity Static Analysis
    Security Testing (SAST) by Synopsys, Inc.
    
    Fixes: fecab256d474 ("tools/xenstore: add basic live-update command parsing")
    Signed-off-by: Julien Grall <jgrall@amazon.com>
    Reviewed-by: Juergen Gross <jgross@suse.com>
    Release-Acked-by: Ian Jackson <iwj@xenproject.org>

commit 68b92ee7fef27f85846ef892e3d2e1763807b72d
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Feb 26 10:18:59 2021 +0100

    VMX: delay p2m insertion of APIC access page
    
    Inserting the mapping at domain creation time leads to a memory leak
    when the creation fails later on and the domain uses separate CPU and
    IOMMU page tables - the latter requires intermediate page tables to be
    allocated, but there's no freeing of them at present in this case. Since
    we don't need the p2m insertion to happen this early, avoid the problem
    altogether by deferring it until the last possible point. This comes at
    the price of not being able to handle an error other than by crashing
    the domain.
    
    Reported-by: Julien Grall <julien@xen.org>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Kevin Tian <kevin.tian@intel.com>
    Release-Acked-by: Ian Jackson <iwj@xenproject.org>
(qemu changes not included)

