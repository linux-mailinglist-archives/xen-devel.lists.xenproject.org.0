Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7962599A71D
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2024 17:05:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.817194.1231276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szHC9-0000Yz-5n; Fri, 11 Oct 2024 15:04:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 817194.1231276; Fri, 11 Oct 2024 15:04:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szHC9-0000WX-2q; Fri, 11 Oct 2024 15:04:45 +0000
Received: by outflank-mailman (input) for mailman id 817194;
 Fri, 11 Oct 2024 15:04:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1szHC7-0000W4-FD; Fri, 11 Oct 2024 15:04:43 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1szHC7-0001fo-CV; Fri, 11 Oct 2024 15:04:43 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1szHC7-0004yN-0B; Fri, 11 Oct 2024 15:04:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1szHC6-0001dB-Vw; Fri, 11 Oct 2024 15:04:42 +0000
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
	bh=xGU6EFzxOZi+0rad9eAPhPEc40sIF84QX63a5eldZ5g=; b=ffF/0G/GX35NLhfOx987wjzqd7
	jQvm1B430B2HqY2NHG8LMCMKQIraZ4dA2WKmWsUnhITxiUF/iiq2UlsoCo5kR/2JIr65Xdkyr52e+
	xUNWvuxVxdx0r6saKSpixFHnqZqn1k+qMEKDOr4bYhRp1Co035DSZK4xZM0V4Ic0xd1Y=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-188051-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [libvirt test] 188051: regressions - FAIL
X-Osstest-Failures:
    libvirt:build-armhf:xen-build:fail:regression
    libvirt:build-armhf-libvirt:build-check(1):blocked:nonblocking
    libvirt:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
    libvirt:test-armhf-armhf-libvirt-vhd:build-check(1):blocked:nonblocking
    libvirt:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt:saverestore-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    libvirt=37800af9a400385801da6d73654249fdb51a93d8
X-Osstest-Versions-That:
    libvirt=215cada34395b6b2caad507393e043594d6c86fc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 11 Oct 2024 15:04:42 +0000

flight 188051 libvirt real [real]
http://logs.test-lab.xenproject.org/osstest/logs/188051/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-armhf                   6 xen-build                fail REGR. vs. 187961

Tests which did not succeed, but are not blocking:
 build-armhf-libvirt           1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-vhd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt     16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-arm64-arm64-libvirt-qcow2 15 saverestore-support-check    fail never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass

version targeted for testing:
 libvirt              37800af9a400385801da6d73654249fdb51a93d8
baseline version:
 libvirt              215cada34395b6b2caad507393e043594d6c86fc

Last test of basis   187961  2024-10-04 04:22:33 Z    7 days
Failing since        188008  2024-10-08 04:20:35 Z    3 days    4 attempts
Testing same since   188051  2024-10-11 04:47:59 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Göran Uddeborg <goeran@uddeborg.se>
  Jim Fehlig <jfehlig@suse.com>
  Jiri Denemark <jdenemar@redhat.com>
  Laine Stump
  Laine Stump <laine@redhat.com>
  Nikolai Barybin <nikolai.barybin@virtuozzo.com>
  Nikolai Barybin via Devel <devel@lists.libvirt.org>
  Peter Krempa <pkrempa@redhat.com>
  김인수 <simmon@nplob.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  fail    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          blocked 
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-amd64-libvirt                                     pass    
 test-arm64-arm64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     blocked 
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-amd64-libvirt-qcow2                               pass    
 test-arm64-arm64-libvirt-qcow2                               pass    
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-libvirt-vhd                                 blocked 


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

(No revision log; it would be 609 lines long.)

