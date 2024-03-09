Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF9C876FBD
	for <lists+xen-devel@lfdr.de>; Sat,  9 Mar 2024 09:12:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690539.1076598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rirnm-0005Ug-6n; Sat, 09 Mar 2024 08:11:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690539.1076598; Sat, 09 Mar 2024 08:11:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rirnm-0005TA-3m; Sat, 09 Mar 2024 08:11:30 +0000
Received: by outflank-mailman (input) for mailman id 690539;
 Sat, 09 Mar 2024 08:11:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rirnk-0005T0-Ot; Sat, 09 Mar 2024 08:11:28 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rirnk-0005td-KB; Sat, 09 Mar 2024 08:11:28 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rirnk-0005Lh-AL; Sat, 09 Mar 2024 08:11:28 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rirnk-0006aJ-9v; Sat, 09 Mar 2024 08:11:28 +0000
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
	bh=CLmO8gDKZrODaSwxlsMfcoO5P6d91FeMnsLf0WWyE38=; b=Cxg1gQQP1W8yavCsHWBiC2ZKlR
	LA1hm0VTKsxoQVxALENzfkHX+Tu41KO06RBlyFzpE+5bhcfbLEhXy2SaBn/frUV5y2jKGR5LPJ2ED
	aB5Q1OIzeABuuyHAjcbOzppFgX0lp7+Fla/o42/X9RiBxfZkScldPvZsTfzp+sbfQKHc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184946-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 184946: regressions - trouble: fail/pass/starved
X-Osstest-Failures:
    xen-unstable:test-amd64-amd64-livepatch:livepatch-run:fail:regression
    xen-unstable:test-amd64-i386-livepatch:livepatch-run:fail:regression
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:hosts-allocate:starved:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:hosts-allocate:starved:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    xen=90173fc5a2a826bbcabde22af405d0a617818b70
X-Osstest-Versions-That:
    xen=66c8e9b76c61ff52cfc0b186a38208907845d093
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 09 Mar 2024 08:11:28 +0000

flight 184946 xen-unstable real [real]
flight 184970 xen-unstable real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/184946/
http://logs.test-lab.xenproject.org/osstest/logs/184970/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-livepatch   13 livepatch-run            fail REGR. vs. 184927
 test-amd64-i386-livepatch    13 livepatch-run            fail REGR. vs. 184927

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop      fail blocked in 184927
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 184927
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 184927
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 184927
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 184927
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 184927
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 184927
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 184927
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 184927
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 184927
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 184927
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 184927
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-arm64-arm64-xl-xsm       3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl-vhd       3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl-credit2   3 hosts-allocate               starved  n/a

version targeted for testing:
 xen                  90173fc5a2a826bbcabde22af405d0a617818b70
baseline version:
 xen                  66c8e9b76c61ff52cfc0b186a38208907845d093

Last test of basis   184927  2024-03-07 00:10:52 Z    2 days
Testing same since   184940  2024-03-07 19:47:48 Z    1 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Henry Wang <xin.wang2@amd.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Oleksii Kurochko <oleksii.kurochko@gmail.com>

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
 test-arm64-arm64-xl-xsm                                      starved 
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
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-i386-examine-bios                                 pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  starved 
 test-armhf-armhf-xl-credit2                                  pass    
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
 test-amd64-amd64-livepatch                                   fail    
 test-amd64-i386-livepatch                                    fail    
 test-amd64-amd64-migrupgrade                                 pass    
 test-amd64-i386-migrupgrade                                  pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-i386-examine-uefi                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      starved 
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
commit 90173fc5a2a826bbcabde22af405d0a617818b70
Author: Henry Wang <xin.wang2@amd.com>
Date:   Thu Mar 7 21:56:16 2024 +0800

    tools/9pfsd: Fix build error caused by strerror_r
    
    Below error can be seen when doing Yocto build of the toolstack:
    
    | io.c: In function 'p9_error':
    | io.c:684:5: error: ignoring return value of 'strerror_r' declared
      with attribute 'warn_unused_result' [-Werror=unused-result]
    |   684 |     strerror_r(err, ring->buffer, ring->ring_size);
    |       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    | cc1: all warnings being treated as errors
    
    Using strerror_r() without special casing different build environments
    is impossible due to the different return types (int vs char *)
    depending on the environment. As p9_error() is not on a performance
    critical path, using strerror() with a mutex ought to be fine. So,
    fix the build by using strerror() to replace strerror_r(). The steps
    would then become: Acquire the mutex first, invoke strerror(), copy
    the string from strerror() to the designated buffer and then drop the
    mutex.
    
    Fixes: f4900d6d69b5 ("9pfsd: allow building with old glibc")
    Signed-off-by: Henry Wang <xin.wang2@amd.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Juergen Gross <jgross@suse.com>
    Acked-by: Anthony PERARD <anthony.perard@citrix.com>

commit b52c45b1bdf04469495dd046ba15dd35a8becfa5
Author: Juergen Gross <jgross@suse.com>
Date:   Wed Mar 6 12:16:31 2024 +0100

    MAINTAINERS: add an entry for tools/9pfsd
    
    Add me as the maintainer for the tools/9pfsd directory.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit b083b1c393dc8961acf0959b1d2e0ad459985ae3
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Mar 5 11:39:19 2024 +0000

    x86/livepatch: Relax permissions on rodata too
    
    This reinstates the capability to patch .rodata in load/unload hooks, which
    was lost when we stopped using CR0.WP=0 to patch.
    
    This turns out to be rather less of a large TODO than I thought at the time.
    
    Fixes: 8676092a0f16 ("x86/livepatch: Fix livepatch application when CET is active")
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

commit ef969144a425e39f5b214a875b5713d0ea8575fb
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Mar 5 11:35:12 2024 +0000

    xen/virtual-region: Include rodata pointers
    
    These are optional.  .init doesn't distinguish types of data like this, and
    livepatches don't necesserily have any .rodata either.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

commit 989556c6f8ca080f5f202417af97d1188b9ba52a
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Tue Mar 5 11:28:33 2024 +0000

    xen/virtual-region: Rename the start/end fields
    
    ... to text_{start,end}.  We're about to introduce another start/end pair.
    
    Despite it's name, struct virtual_region has always been a module-ish
    description.  Call this out specifically.
    
    As minor cleanup, replace ROUNDUP(x, PAGE_SIZE) with the more concise
    PAGE_ALIGN() ahead of duplicating the example.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

commit 08bb338f09a54d3b39f0d952bbd67461d8e5d0ed
Author: Juergen Gross <jgross@suse.com>
Date:   Thu Mar 7 09:18:04 2024 +0100

    SUPPORT.md: add xen-9pfsd
    
    Add a support statement for the new xen-9pfsd backend. Set it to
    "Experimental", as some functionality for Linux guests is missing
    (only tested to work with Xenstore-stubdom).
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 49b664f5bffa3a86734c66491d7dcdebbdecfb26
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Mar 7 09:17:26 2024 +0100

    x86/asm: add commas to further macros definitions/invocations
    
    In light of recent observations with how macros are handled by gas,
    let's play by what we informally set for ourselves as a guideline: Use
    commas to separate parameters/arguments.
    
    Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 4ad4df0964aa374562fa574d4671d278f54f5d32
Author: Juergen Gross <jgross@suse.com>
Date:   Thu Mar 7 09:16:53 2024 +0100

    CHANGELOG: add an entry for 9pfsd
    
    Add an entry to CHANGELOG.md regarding the new xen-9pfsd daemon.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

commit 9249a441c98ff063c0c065538b419a3bf1dac24a
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Mar 7 09:16:13 2024 +0100

    x86/asm: add commas to BUILD_BUG_ON
    
    In light of recent observations with how macros are handled by gas,
    let's play by what we informally set for ourselves as a guideline: Use
    commas to separate parameters/arguments.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 5daf46b439454921c19ca30840bb39424b36444b
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Mar 7 09:15:17 2024 +0100

    Kbuild: simplify as-insn a little
    
    As of 732571959f17 ("xen/build: use new $(c_flags) and $(a_flags)
    instead of $(CFLAGS)") -M options aren't part of CFLAGS anymore, and
    c_flags isn't supposed to be passed to this macro. Drop the now dead
    part of filtering.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

commit 2f7481d59255680c1de98f43467d3862453dd50a
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Mar 7 09:14:55 2024 +0100

    x86/EFI: correct compiler probing
    
    Passing in $(CFLAGS) means also requesting inclusion of certain headers
    (via -include command line options). That's particularly xen/config.h,
    which in turn requires generated/autoconf.h. This has not caused any
    problems so far only because arch.mk is processed twice, and the missing
    header on the 1st pass would be there on the 2nd. Having added an
    inclusion of asm/asm-macros.h to x86'es asm/config.h, the 2nd pass then
    also fails on an initial, pristine build.
    
    As per dd40177c1bc8 ("x86-64/EFI: add CFLAGS to check compile") dropping
    the use of $(CFLAGS) altogether isn't an option, though. Hence remove
    the problematic options only.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
(qemu changes not included)

