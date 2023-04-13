Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 298A96E07B5
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 09:29:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520547.808274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmrOD-0007Nq-3E; Thu, 13 Apr 2023 07:29:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520547.808274; Thu, 13 Apr 2023 07:29:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmrOD-0007LT-09; Thu, 13 Apr 2023 07:29:05 +0000
Received: by outflank-mailman (input) for mailman id 520547;
 Thu, 13 Apr 2023 07:29:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pmrOC-0007LJ-1N; Thu, 13 Apr 2023 07:29:04 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pmrOB-0002So-Sf; Thu, 13 Apr 2023 07:29:03 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pmrOB-0007Jg-AZ; Thu, 13 Apr 2023 07:29:03 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pmrOB-0007Sy-A9; Thu, 13 Apr 2023 07:29:03 +0000
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
	bh=Uv7ypzs0/6mNaD/KTbc1L7eBNl1ONLFO4trSnEXMadI=; b=zEtUQ9lbjVAGPPe5FwuZV17nXO
	vxDPVS3LWWI0bdJKHRUX5RqbT9r/OVhBtHMwzgzusbpqkrpGx2VIK0vDi+6J2MNKlKCT+gg9djluj
	zKvFn1Yx/8rY31z7np73Ithj4bhPrSPCXAgHyHFUepxKt1OKHSd6DrlH22TDu+mf7AZw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180222-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 180222: regressions - trouble: fail/pass/starved
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-xl-vhd:guest-start/debian.repeat:fail:regression
    linux-linus:test-amd64-amd64-libvirt-qcow2:guest-start/debian.repeat:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:build-check(1):starved:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:build-check(1):starved:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:build-check(1):starved:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:build-check(1):starved:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:build-check(1):starved:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:build-check(1):starved:nonblocking
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
    linux-linus:test-arm64-arm64-examine:build-check(1):starved:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:build-check(1):starved:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:build-check(1):starved:nonblocking
    linux-linus:build-arm64-pvops:hosts-allocate:starved:nonblocking
    linux-linus:build-armhf:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    linux=0bcc4025550403ae28d2984bddacafbca0a2f112
X-Osstest-Versions-That:
    linux=e62252bc55b6d4eddc6c2bdbf95a448180d6a08d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 13 Apr 2023 07:29:03 +0000

flight 180222 linux-linus real [real]
flight 180228 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/180222/
http://logs.test-lab.xenproject.org/osstest/logs/180228/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-vhd     21 guest-start/debian.repeat fail REGR. vs. 180208

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-libvirt-qcow2 19 guest-start/debian.repeat fail pass in 180228-retest

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 180208
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 180208
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 180208
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 180208
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 180208
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl           1 build-check(1)               starved  n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)               starved  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               starved  n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)               starved  n/a
 test-arm64-arm64-xl-vhd       1 build-check(1)               starved  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               starved  n/a
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
 test-arm64-arm64-examine      1 build-check(1)               starved  n/a
 test-arm64-arm64-libvirt-raw  1 build-check(1)               starved  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               starved  n/a
 build-arm64-pvops             2 hosts-allocate               starved  n/a
 build-armhf                   2 hosts-allocate               starved  n/a

version targeted for testing:
 linux                0bcc4025550403ae28d2984bddacafbca0a2f112
baseline version:
 linux                e62252bc55b6d4eddc6c2bdbf95a448180d6a08d

Last test of basis   180208  2023-04-11 19:10:17 Z    1 days
Testing same since   180222  2023-04-12 16:43:41 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  David Howells <dhowells@redhat.com>
  Linus Torvalds <torvalds@linux-foundation.org>

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
 build-arm64-pvops                                            starved 
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          starved 
 test-armhf-armhf-xl                                          starved 
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 starved 
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      starved 
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
 test-arm64-arm64-xl-credit1                                  starved 
 test-armhf-armhf-xl-credit1                                  starved 
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  starved 
 test-armhf-armhf-xl-credit2                                  starved 
 test-armhf-armhf-xl-cubietruck                               starved 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     starved 
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
 test-amd64-amd64-libvirt-qcow2                               fail    
 test-armhf-armhf-libvirt-qcow2                               starved 
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 starved 
 test-armhf-armhf-libvirt-raw                                 starved 
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     starved 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 starved 
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-xl-vhd                                      fail    
 test-arm64-arm64-xl-vhd                                      starved 
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


Not pushing.

------------------------------------------------------------
commit 0bcc4025550403ae28d2984bddacafbca0a2f112
Author: David Howells <dhowells@redhat.com>
Date:   Wed Apr 12 13:18:57 2023 +0100

    netfs: Fix netfs_extract_iter_to_sg() for ITER_UBUF/IOVEC
    
    Fix netfs_extract_iter_to_sg() for ITER_UBUF and ITER_IOVEC to set the
    size of the page to the part of the page extracted, not the remaining
    amount of data in the extracted page array at that point.
    
    This doesn't yet affect anything as cifs, the only current user, only
    passes in non-user-backed iterators.
    
    Fixes: 018584697533 ("netfs: Add a function to extract an iterator into a scatterlist")
    Signed-off-by: David Howells <dhowells@redhat.com>
    Reviewed-by: Jeff Layton <jlayton@kernel.org>
    Cc: Steve French <sfrench@samba.org>
    Cc: Shyam Prasad N <nspmangalore@gmail.com>
    Cc: Rohith Surabattula <rohiths.msft@gmail.com>
    Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>

