Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D96646EF5DE
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 15:55:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526714.818617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prfby-0000A9-7x; Wed, 26 Apr 2023 13:55:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526714.818617; Wed, 26 Apr 2023 13:55:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prfby-00008J-3w; Wed, 26 Apr 2023 13:55:10 +0000
Received: by outflank-mailman (input) for mailman id 526714;
 Wed, 26 Apr 2023 13:55:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1prfbw-000088-2b; Wed, 26 Apr 2023 13:55:08 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1prfbv-0005NC-SG; Wed, 26 Apr 2023 13:55:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1prfbv-0005wV-Cb; Wed, 26 Apr 2023 13:55:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1prfbv-0007P6-6B; Wed, 26 Apr 2023 13:55:07 +0000
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
	bh=ob/kLy5mW/qWt5rXtU6z2zGsueJsjQ++Wuxs8jLbLDg=; b=KJJ6Eqpa6STN7x9qYxJdA/sELA
	tKoqd62KPFuB085M4pqK2Ot0akwn5hs+ZHdpbMtFF3U4sRFudLdUJ6rHJAKmo3sMmqOmeQNF22VfJ
	YGNqaZm5ko7PALRqXTea3Qgm52iGmA95WvECTBD3qslc7gwl55EpiCqHat8keOLepKfw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180416-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 180416: regressions - FAIL
X-Osstest-Failures:
    xen-unstable:test-amd64-i386-pair:xen-install/src_host:fail:regression
    xen-unstable:test-amd64-i386-freebsd10-amd64:xen-install:fail:heisenbug
    xen-unstable:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:guest-start/debian.repeat:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:windows-install:fail:nonblocking
    xen-unstable:test-amd64-i386-pair:xen-install/dst_host:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=f6c3cb21628f7bed73cb992da400f6b36630f290
X-Osstest-Versions-That:
    xen=c6c8c0808f908911a38bc330cdc7a26ac4bf6d51
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 26 Apr 2023 13:55:07 +0000

flight 180416 xen-unstable real [real]
flight 180430 xen-unstable real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/180416/
http://logs.test-lab.xenproject.org/osstest/logs/180430/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-pair         10 xen-install/src_host     fail REGR. vs. 180401

Tests which are failing intermittently (not blocking):
 test-amd64-i386-freebsd10-amd64  7 xen-install      fail pass in 180430-retest

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail like 180381
 test-amd64-amd64-libvirt-vhd 19 guest-start/debian.repeat    fail  like 180381
 test-amd64-amd64-xl-qemuu-win7-amd64 12 windows-install       fail like 180391
 test-amd64-i386-pair         11 xen-install/dst_host         fail  like 180401
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 180401
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 180401
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 180401
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 180401
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 180401
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 180401
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 180401
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 180401
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 180401
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 180401
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 180401
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass

version targeted for testing:
 xen                  f6c3cb21628f7bed73cb992da400f6b36630f290
baseline version:
 xen                  c6c8c0808f908911a38bc330cdc7a26ac4bf6d51

Last test of basis   180401  2023-04-25 01:51:51 Z    1 days
Testing same since   180416  2023-04-25 18:06:58 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jan Beulich <jbeulich@suse.com>
  Jason Andryuk <jandryuk@gmail.com>
  Juergen Gross <jgross@suse.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>

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
 test-amd64-i386-freebsd10-amd64                              fail    
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
 test-arm64-arm64-xl-credit2                                  pass    
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
 test-amd64-amd64-livepatch                                   pass    
 test-amd64-i386-livepatch                                    pass    
 test-amd64-amd64-migrupgrade                                 pass    
 test-amd64-i386-migrupgrade                                  pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         fail    
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
 test-amd64-amd64-libvirt-vhd                                 fail    
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
commit f6c3cb21628f7bed73cb992da400f6b36630f290
Author: Roger Pau Monne <roger.pau@citrix.com>
Date:   Mon Mar 20 12:08:52 2023 +0100

    x86/shadow: restore dropped check in sh_unshadow_for_p2m_change()
    
    As a result of 241702e064604dbb3e0d9b731aa8f45be448243b the
    mfn_valid() check in sh_unshadow_for_p2m_change() was lost.  That
    allows sh_remove_shadows() to be called with gfns that have no backing
    page, causing an ASSERT to trigger in debug builds or dereferencing an
    arbitrary pointer partially under guest control in non-debug builds:
    
    RIP:    e008:[<ffff82d0402dcf2c>] sh_remove_shadows+0x19f/0x722
    RFLAGS: 0000000000010246   CONTEXT: hypervisor (d0v2)
    [...]
    Xen call trace:
       [<ffff82d0402dcf2c>] R sh_remove_shadows+0x19f/0x722
       [<ffff82d0402e28f4>] F arch/x86/mm/shadow/hvm.c#sh_unshadow_for_p2m_change+0xab/0x2b7
       [<ffff82d040311931>] F arch/x86/mm/p2m-pt.c#write_p2m_entry+0x19b/0x4d3
       [<ffff82d0403131b2>] F arch/x86/mm/p2m-pt.c#p2m_pt_set_entry+0x67b/0xa8e
       [<ffff82d040302c92>] F p2m_set_entry+0xcc/0x149
       [<ffff82d040305a50>] F unmap_mmio_regions+0x17b/0x2c9
       [<ffff82d040241e5e>] F do_domctl+0x11f3/0x195e
       [<ffff82d0402c7e10>] F hvm_hypercall+0x5b1/0xa2d
       [<ffff82d0402adc72>] F vmx_vmexit_handler+0x130f/0x1cd5
       [<ffff82d040203602>] F vmx_asm_vmexit_handler+0xf2/0x210
    
    ****************************************
    Panic on CPU 1:
    Assertion 'mfn_valid(gmfn)' failed at arch/x86/mm/shadow/common.c:2203
    ****************************************
    
    Fix this by restoring the mfn_valid() check in
    sh_unshadow_for_p2m_change(), unifying it with the rest of the checks
    that are done at the start of the function.
    
    This is XSA-430 / CVE-2022-42335
    
    Fixes: 241702e064 ('x86/shadow: slightly consolidate sh_unshadow_for_p2m_change() (part II)')
    Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit ffc3ca75e25024c05bce7afea694a7446e513c03
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Apr 25 12:37:25 2023 +0200

    x86/shadow: "monitor table" is a HVM-only concept
    
    It looks like in the combination of aff8bf94ce65 ('x86/shadow: only
    4-level guest code needs building when !HVM') and 0b841314dace
    ('x86/shadow: sh_{make,destroy}_monitor_table() are "even more" HVM-
    only') I didn't go quite far enough: SH_type_monitor_table is also
    effectively unused when !HVM.
    
    The assertion early in sh_destroy_shadow() can have the type dropped
    altogether: it shouldn't make it here in the first place. Pages of
    this type are freed directly from sh_destroy_monitor_table() only.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit f514bab30ef8d4ade77a27c926e283c9bbbf9ffd
Author: Juergen Gross <jgross@suse.com>
Date:   Tue Apr 25 12:18:37 2023 +0200

    x86: add support for crash dump analysis with xen.efi
    
    Today it is not possible to analyse crash dumps of a system in
    hypervisor mode when it had been booted via EFI, as the crash utility
    doesn't understand the file format of xen.efi.
    
    This can easily be solved by creating an ELF file from xen.efi via
    objcopy. Using that file as name list for crash enables the user to
    analyse the dump in hypervisor mode. Note that crash isn't happy with
    a file containing no text and data, so using --only-keep-debug is not
    an option.
    
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 7c3e99b642d321bfe4eafed4d667e1bdd65ac410
Author: Jan Beulich <jbeulich@suse.com>
Date:   Tue Apr 25 12:17:26 2023 +0200

    x86: detect CMOS aliasing on ports other than 0x70/0x71
    
    ... in order to also intercept Dom0 accesses through the alias ports.
    
    Also stop intercepting accesses to the CMOS ports if we won't ourselves
    use the CMOS RTC, because of there being none. This doesn't go as far as
    covering port 0x70, as that also has the NMI disable bit, which we don't
    want to permit Dom0 to set.
    
    Note that rtc_init() deliberately uses 16 as the upper loop bound,
    despite probe_cmos_alias() using 8: The higher bound is benign now, but
    would save us touching the code (or, worse, missing to touch it) in case
    the lower one was doubled.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

commit 913751d7af6e78d65c1e2adf4887193c827f0c5e
Author: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Date:   Tue Apr 25 12:16:17 2023 +0200

    x86/msi: clear initial MSI-X state on boot
    
    Some firmware/devices are found to not reset MSI-X properly, leaving
    MASKALL set. Jason reports on his machine MASKALL persists through a
    warm reboot, but is cleared on cold boot. Xen relies on initial state
    being MASKALL clear. Especially, pci_reset_msix_state() assumes if
    MASKALL is set, it was Xen setting it due to msix->host_maskall or
    msix->guest_maskall. Clearing just MASKALL is risky if ENABLE is set,
    so clear them both.
    
    Reported-by: Jason Andryuk <jandryuk@gmail.com>
    Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Tested-by: Jason Andryuk <jandryuk@gmail.com>
(qemu changes not included)

