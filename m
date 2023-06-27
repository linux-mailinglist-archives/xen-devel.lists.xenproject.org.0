Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D622873FF4B
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 17:08:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556173.868480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEAHV-0005mz-FZ; Tue, 27 Jun 2023 15:07:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556173.868480; Tue, 27 Jun 2023 15:07:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEAHV-0005kC-Cl; Tue, 27 Jun 2023 15:07:01 +0000
Received: by outflank-mailman (input) for mailman id 556173;
 Tue, 27 Jun 2023 15:07:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qEAHU-0005k2-Hf; Tue, 27 Jun 2023 15:07:00 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qEAHU-0004yJ-A1; Tue, 27 Jun 2023 15:07:00 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qEAHT-0001xR-Pk; Tue, 27 Jun 2023 15:06:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qEAHT-0007EZ-PE; Tue, 27 Jun 2023 15:06:59 +0000
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
	bh=cAPnId0tnbGmhFC5iZ1i7jU0lu9AX5ocRTZn/855+GI=; b=i5NWbAriKAb3EHwuURZL6CkUNG
	gaW7bUPDt+7TTSsSlJCbQ4eiMhw3wonz6B6J5NPMIsr1zDLrSI0poISDvtBJq0LA90sSX87vUEZ4c
	J9d9jzzgWq7tjGZBL1mrv/PN+HFULTGS4Orm3Cwrh/lpJcP9vrSUwIiu+J9RDnetRkuA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181610-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [libvirt test] 181610: tolerable FAIL - PUSHED
X-Osstest-Failures:
    libvirt:test-arm64-arm64-libvirt-qcow2:guest-start.2:fail:heisenbug
    libvirt:test-armhf-armhf-libvirt-qcow2:guest-start.2:fail:heisenbug
    libvirt:test-armhf-armhf-libvirt-raw:guest-start:fail:heisenbug
    libvirt:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt:saverestore-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    libvirt:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    libvirt=ceb4dc8e17aa077a3254bace82554015d72bd71c
X-Osstest-Versions-That:
    libvirt=1dddd444519717c785a9fd93f393c3313c87c342
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 27 Jun 2023 15:06:59 +0000

flight 181610 libvirt real [real]
flight 181614 libvirt real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/181610/
http://logs.test-lab.xenproject.org/osstest/logs/181614/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-arm64-arm64-libvirt-qcow2 18 guest-start.2     fail pass in 181614-retest
 test-armhf-armhf-libvirt-qcow2 18 guest-start.2     fail pass in 181614-retest
 test-armhf-armhf-libvirt-raw 13 guest-start         fail pass in 181614-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check fail in 181614 like 181560
 test-armhf-armhf-libvirt-raw 14 migrate-support-check fail in 181614 never pass
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 181560
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 181560
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt     16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-arm64-arm64-libvirt-qcow2 15 saverestore-support-check    fail never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass

version targeted for testing:
 libvirt              ceb4dc8e17aa077a3254bace82554015d72bd71c
baseline version:
 libvirt              1dddd444519717c785a9fd93f393c3313c87c342

Last test of basis   181560  2023-06-23 04:18:49 Z    4 days
Testing same since   181610  2023-06-27 04:18:54 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jean-Louis Dupond <jean-louis@dupond.be>
  Michal Privoznik <mprivozn@redhat.com>
  Oleg Vasilev <oleg.vasilev@virtuozzo.com>
  Peter Krempa <pkrempa@redhat.com>
  zuo boqun <zuoboqun@baidu.com>
  zuoboqun <zuoboqun@baidu.com>

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
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-libvirt                                     pass    
 test-arm64-arm64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-arm64-arm64-libvirt-qcow2                               fail    
 test-armhf-armhf-libvirt-qcow2                               fail    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 fail    
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-libvirt-vhd                                 pass    


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

To xenbits.xen.org:/home/xen/git/libvirt.git
   1dddd44451..ceb4dc8e17  ceb4dc8e17aa077a3254bace82554015d72bd71c -> xen-tested-master

