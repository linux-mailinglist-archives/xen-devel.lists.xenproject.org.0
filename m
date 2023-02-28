Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 311AC6A5981
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 13:53:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503339.775580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWzTI-0007rD-Ju; Tue, 28 Feb 2023 12:52:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503339.775580; Tue, 28 Feb 2023 12:52:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWzTI-0007oI-H8; Tue, 28 Feb 2023 12:52:44 +0000
Received: by outflank-mailman (input) for mailman id 503339;
 Tue, 28 Feb 2023 12:52:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pWzTH-0007o8-10; Tue, 28 Feb 2023 12:52:43 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pWzTG-0000i4-Ug; Tue, 28 Feb 2023 12:52:42 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pWzTG-0000Xu-HX; Tue, 28 Feb 2023 12:52:42 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pWzTG-00076v-H2; Tue, 28 Feb 2023 12:52:42 +0000
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
	bh=BFOgKVIoX9N2+KgaJyVJVQWXxuvDTjljsSTGnMrozcw=; b=a1txpWa3fUunPYxwgAPrcSaroH
	ECqwkpl2URPpthhFhmju4gR4TJFyaIfkHiwLiJME774k9hwP8PueIw5IsgPWlxe46FJCfZSB0nt84
	IsYIAdZ8NqJ3bTBNlXdMLNsO11rw6bbJY+WAHNP89YOTprEWC9PDCx57F+cybIDSc3IY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-178726-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable test] 178726: regressions - trouble: broken/fail/pass/starved
X-Osstest-Failures:
    xen-unstable:test-amd64-coresched-amd64-xl:<job status>:broken:regression
    xen-unstable:test-amd64-coresched-amd64-xl:host-install(5):broken:regression
    xen-unstable:test-amd64-i386-qemut-rhel6hvm-amd:xen-install:fail:regression
    xen-unstable:test-amd64-amd64-qemuu-freebsd12-amd64:guest-localmigrate/x10:fail:regression
    xen-unstable:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:guest-start/debian.repeat:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-vhd:guest-start/debian.repeat:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    xen-unstable:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    xen-unstable:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    xen-unstable:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    xen-unstable:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable:build-armhf-libvirt:build-check(1):starved:nonblocking
    xen-unstable:test-armhf-armhf-examine:build-check(1):starved:nonblocking
    xen-unstable:test-armhf-armhf-libvirt:build-check(1):starved:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-qcow2:build-check(1):starved:nonblocking
    xen-unstable:test-armhf-armhf-libvirt-raw:build-check(1):starved:nonblocking
    xen-unstable:test-armhf-armhf-xl:build-check(1):starved:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit1:build-check(1):starved:nonblocking
    xen-unstable:test-armhf-armhf-xl-credit2:build-check(1):starved:nonblocking
    xen-unstable:test-armhf-armhf-xl-cubietruck:build-check(1):starved:nonblocking
    xen-unstable:test-armhf-armhf-xl-multivcpu:build-check(1):starved:nonblocking
    xen-unstable:test-armhf-armhf-xl-rtds:build-check(1):starved:nonblocking
    xen-unstable:test-armhf-armhf-xl-vhd:build-check(1):starved:nonblocking
    xen-unstable:build-armhf:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    xen=bfc3780f23ded229f42a2565783e21c32083bbfd
X-Osstest-Versions-That:
    xen=608f85a1818697156b72ace4913a17c8178a0ef5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 28 Feb 2023 12:52:42 +0000

flight 178726 xen-unstable real [real]
http://logs.test-lab.xenproject.org/osstest/logs/178726/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-coresched-amd64-xl    <job status>                 broken
 test-amd64-coresched-amd64-xl  5 host-install(5)       broken REGR. vs. 178616
 test-amd64-i386-qemut-rhel6hvm-amd  7 xen-install        fail REGR. vs. 178616
 test-amd64-amd64-qemuu-freebsd12-amd64 19 guest-localmigrate/x10 fail REGR. vs. 178616

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 178616
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 178616
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 178616
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 178616
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 178616
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 178616
 test-amd64-amd64-libvirt-vhd 19 guest-start/debian.repeat    fail  like 178616
 test-amd64-i386-xl-vhd       21 guest-start/debian.repeat    fail  like 178616
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 178616
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 178616
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 178616
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 build-armhf-libvirt           1 build-check(1)               starved  n/a
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
 build-armhf                   2 hosts-allocate               starved  n/a

version targeted for testing:
 xen                  bfc3780f23ded229f42a2565783e21c32083bbfd
baseline version:
 xen                  608f85a1818697156b72ace4913a17c8178a0ef5

Last test of basis   178616  2023-02-27 01:53:22 Z    1 days
Failing since        178673  2023-02-27 15:09:21 Z    0 days    2 attempts
Testing same since   178726  2023-02-28 02:47:08 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Edwin Török <edwin.torok@cloud.com>
  Jan Beulich <jbeulich@suse.com>
  Michal Orzel <michal.orzel@amd.com>
  Stefano Stabellini <stefano.stabellini@amd.com>
  Xenia Ragiadakou <burzalodowa@gmail.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  starved 
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          starved 
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
 test-amd64-coresched-amd64-xl                                broken  
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          starved 
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
 test-amd64-i386-qemut-rhel6hvm-amd                           fail    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       fail    
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
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-i386-examine-bios                                 pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  starved 
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  starved 
 test-armhf-armhf-xl-cubietruck                               starved 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     starved 
 test-amd64-i386-examine                                      pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     starved 
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-livepatch                                   pass    
 test-amd64-i386-livepatch                                    pass    
 test-amd64-amd64-migrupgrade                                 pass    
 test-amd64-i386-migrupgrade                                  pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                starved 
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               starved 
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 starved 
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     starved 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-i386-examine-uefi                                 pass    
 test-amd64-amd64-libvirt-vhd                                 fail    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      starved 
 test-amd64-i386-xl-vhd                                       fail    


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

broken-job test-amd64-coresched-amd64-xl broken
broken-step test-amd64-coresched-amd64-xl host-install(5)

Not pushing.

------------------------------------------------------------
commit bfc3780f23ded229f42a2565783e21c32083bbfd
Author: Michal Orzel <michal.orzel@amd.com>
Date:   Mon Feb 27 14:12:35 2023 -0800

    automation: Add container and build jobs to run cppcheck analysis
    
    Add a debian container with cppcheck installation routine inside,
    capable of performing cppcheck analysis on Xen-only build including
    cross-builds for arm32 and x86_64.
    
    Populate build jobs making use of that container to run cppcheck
    analysis to produce a text report (xen-cppcheck.txt) containing the list
    of all the findings.
    
    This patch does not aim at performing any sort of bisection. Cppcheck is
    imperfect and for now, our goal is to at least be aware of its reports,
    so that we can compare them with the ones produced by better tools and
    to be able to see how these reports change as a result of further
    infrastructure improvements (e.g. exception list, rules exclusion).
    
    Signed-off-by: Michal Orzel <michal.orzel@amd.com>
    Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

commit 6342f96689a5a112c3becedbccecef681e010b5d
Author: Stefano Stabellini <stefano.stabellini@amd.com>
Date:   Fri Feb 17 16:07:47 2023 -0800

    automation: expand arm32 dom0 test adding xl domain creation
    
    As part of the arm32 dom0 test, also create a simple domU using xl. To
    do that, we need the toolstack installed in the dom0 rootfs. We switch
    to using the kernel and rootfs built by the Yocto arm32 job.
    
    Remove the PCI node from the host device tree: it is unused but causes a
    Linux hang at boot.
    
    Use xen-watchdog to trigger the domU creation for convience
    (/etc/local.d is not handled by rootfs.)
    
    Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
    Reviewed-by: Michal Orzel <michal.orzel@amd.com>

commit a0c3b87a764bcbd433f5f248c5ae2e2ca60a1321
Author: Stefano Stabellini <stefano.stabellini@amd.com>
Date:   Fri Feb 17 16:07:46 2023 -0800

    automation: add binaries/ to artifacts for Yocto arm32 job
    
    Copy the build output of Yocto builds to binaries/ for the arm32 target,
    and export binaries/ among the jobs artifacts so that they can be reused
    by other jobs.
    
    Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
    Reviewed-by: Michal Orzel <michal.orzel@amd.com>

commit adfb590ec384f92a4b5aebb111af25abbd1e026e
Author: Stefano Stabellini <stefano.stabellini@amd.com>
Date:   Fri Feb 17 16:07:45 2023 -0800

    automation: move yocto jobs to build stage
    
    We are going to use artifacts produced by the Yocto builds in test jobs.
    
    Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
    Reviewed-by: Michal Orzel <michal.orzel@amd.com>

commit 49b1cb27413034c81023d1faf7af43690e87291a
Author: Xenia Ragiadakou <burzalodowa@gmail.com>
Date:   Fri Feb 24 20:50:08 2023 +0200

    x86/vmx: declare nvmx_enqueue_n2_exceptions() static
    
    Reduce the scope of nvmx_enqueue_n2_exceptions() to static because it is used
    only in this file.
    
    Take the opportunity to remove a trailing space.
    
    Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit fdc25bd5da5e69e57286c97685ce9f862510253b
Author: Xenia Ragiadakou <burzalodowa@gmail.com>
Date:   Fri Feb 24 20:50:04 2023 +0200

    x86/vmx: move vmx_update_debug_state() in vmcs.c and declare it static
    
    Move vmx_update_debug_state() in vmcs.c because it is used only in this
    file and limit its scope to this file by declaring it static and removing
    its declaration from vmx.h.
    
    No functional change intended.
    
    Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 275d13184cfa52ebe4336ed66526ce93716adbe0
Author: Edwin Török <edwin.torok@cloud.com>
Date:   Fri Feb 24 13:03:44 2023 +0000

    libs/guest: Fix leak on realloc failure in backup_ptes()
    
    From `man 2 realloc`:
    
      If realloc() fails, the original block is left untouched; it is not freed or moved.
    
    Found using GCC -fanalyzer:
    
      |  184 |         backup->entries = realloc(backup->entries,
      |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |      |         |               | |
      |      |         |               | (91) when ‘realloc’ fails
      |      |         |               (92) ‘old_ptes.entries’ leaks here; was allocated at (44)
      |      |         (90) ...to here
    
    Signed-off-by: Edwin Török <edwin.torok@cloud.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 1868d7f22660c8980bd0a7e53f044467e8b63bb5
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Mon Feb 27 14:51:20 2023 +0000

    libs/guest: Fix resource leaks in xc_core_arch_map_p2m_tree_rw()
    
    Edwin, with the help of GCC's -fanalyzer, identified that p2m_frame_list_list
    gets leaked.  What fanalyzer can't see is that the live_p2m_frame_list_list
    and live_p2m_frame_list foreign mappings are leaked too.
    
    Rework the logic so the out path is executed unconditionally, which cleans up
    all the intermediate allocations/mappings appropriately.
    
    Fixes: bd7a29c3d0b9 ("tools/libs/ctrl: fix xc_core_arch_map_p2m() to support linear p2m table")
    Reported-by: Edwin Török <edwin.torok@cloud.com>
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Juergen Gross <jgross@suse.com>

commit 35b3208a741f182ad95ad252944a82f4899f3816
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Feb 24 15:29:01 2023 +0000

    CI: Simplify RISCV smoke testing
    
    Use a single fairly generic string as the "all done" message to look for,
    which avoids the need to patch qemu-smoke-riscv64.sh each time a new feature
    is added.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

commit 5f74a1a198a986c566a11a1873ecc1b3c703789f
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Feb 24 20:58:25 2023 +0000

    x86/svm: Decouple types in struct nestedsvm
    
    struct nestedvm uses mostly plain integer types, except for virt_ext_t which
    is a union wrapping two bitfield names.
    
    However, it turns out that this is a write-only variable.  Delete it, allowing
    us to drop the include of vmcb.h
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit 4d6df4ec7544d7c912ffab6b6edb4cbefaa01f4c
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Feb 27 13:37:27 2023 +0100

    x86/setup: drop stale declarations of __bss_{start,end}[]
    
    There are no references anymore as of c9a4a1c419ce ("x86/layout: Correct
    Xen's idea of its own memory layout"). For what's left, switch to
    "unsigned char" as here we're not dealing with strings of any kind.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit db3897746cf8a0b77b13c589897237867800b023
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Feb 27 13:36:58 2023 +0100

    x86/shadow: drop dead code from HVM-only sh_page_fault() pieces
    
    The shadow_mode_refcounts() check immediately ahead of the "emulate"
    label renders redundant two subsequent is_hvm_domain() checks (the
    latter of which was already redundant with the former).
    
    Also guest_mode() checks are pointless when we already know we're
    dealing with a HVM domain.
    
    Finally style-adjust a comment which otherwise would be fully visible as
    patch context anyway.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 1950d8c351c3dd2ba9e4cc283ec91cb580824fd4
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Feb 27 13:36:01 2023 +0100

    x86/shadow: mark more of sh_page_fault() HVM-only
    
    The types p2m_is_readonly() checks for aren't applicable to PV;
    specifically get_gfn() won't ever return any such type for PV domains.
    Extend the HVM-conditional block of code, also past the subsequent HVM-
    only if(). This way the "emulate_readonly" also becomes unreachable when
    !HVM, so move the conditional there upwards as well. Noticing the
    earlier shadow_mode_refcounts() check, move it up even further, right
    after that check. With that, the "done" label also needs marking as
    potentially unused.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 4e8205f4fdb9a043170439c9c63542ddff816849
Author: Jan Beulich <jbeulich@suse.com>
Date:   Mon Feb 27 13:34:30 2023 +0100

    x86/shadow: move dm-mmio handling code in sh_page_fault()
    
    Do away with the partly mis-named "mmio" label there, which really is
    only about emulated MMIO. Move the code to the place where the sole
    "goto" was. Re-order steps slightly: Assertion first, perfc increment
    outside of the locked region, and "gpa" calculation closer to the first
    use of the variable. Also make the HVM conditional cover the entire
    if(), as p2m_mmio_dm isn't applicable to PV; specifically get_gfn()
    won't ever return this type for PV domains.
    
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
(qemu changes not included)

