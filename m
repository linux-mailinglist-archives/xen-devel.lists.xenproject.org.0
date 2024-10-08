Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A22B7995682
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 20:26:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813416.1226350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syEtw-0008Td-FL; Tue, 08 Oct 2024 18:25:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813416.1226350; Tue, 08 Oct 2024 18:25:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syEtw-0008Qu-CQ; Tue, 08 Oct 2024 18:25:40 +0000
Received: by outflank-mailman (input) for mailman id 813416;
 Tue, 08 Oct 2024 18:25:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1syEtv-0008Qj-72; Tue, 08 Oct 2024 18:25:39 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1syEtv-0007wr-58; Tue, 08 Oct 2024 18:25:39 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1syEtu-0008Bp-Mq; Tue, 08 Oct 2024 18:25:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1syEtu-0003NT-MM; Tue, 08 Oct 2024 18:25:38 +0000
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
	bh=M4CTojDBsbbU6AKsCG/qyUAda2JGMEnEYwF4YyakC6Q=; b=iljFJE7Gp01VWy+4Y0BetKbIew
	BPqqogBRDYIZ+rV/N8Tt/cgnVNutbViyfwH8ijTmJPfyo3R+sWjymR/JMMPeUptziHgEK+0oYx/Sd
	vsdUwE/kd7K9GwgU3W89TABXGKJQjL6+480UHD3kMmpX+tAFHB4/fnHoGIG+NCjhG048=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-188008-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [libvirt test] 188008: regressions - FAIL
X-Osstest-Failures:
    libvirt:test-arm64-arm64-libvirt-qcow2:leak-check/check:fail:regression
    libvirt:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt:saverestore-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    libvirt=9c962b3902cf4b480fcdd1da7e300911c0288287
X-Osstest-Versions-That:
    libvirt=215cada34395b6b2caad507393e043594d6c86fc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 08 Oct 2024 18:25:38 +0000

flight 188008 libvirt real [real]
flight 188014 libvirt real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/188008/
http://logs.test-lab.xenproject.org/osstest/logs/188014/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-arm64-arm64-libvirt-qcow2 20 leak-check/check       fail REGR. vs. 187961

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 187961
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt     16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-arm64-arm64-libvirt-qcow2 15 saverestore-support-check    fail never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass

version targeted for testing:
 libvirt              9c962b3902cf4b480fcdd1da7e300911c0288287
baseline version:
 libvirt              215cada34395b6b2caad507393e043594d6c86fc

Last test of basis   187961  2024-10-04 04:22:33 Z    4 days
Testing same since   188008  2024-10-08 04:20:35 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Göran Uddeborg <goeran@uddeborg.se>

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
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-amd64-libvirt                                     pass    
 test-arm64-arm64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-amd64-libvirt-qcow2                               pass    
 test-arm64-arm64-libvirt-qcow2                               fail    
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-libvirt-vhd                                 pass    


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
commit 9c962b3902cf4b480fcdd1da7e300911c0288287
Author: Göran Uddeborg <goeran@uddeborg.se>
Date:   Sun Oct 6 08:13:05 2024 +0000

    Translated using Weblate (Swedish)
    
    Currently translated at 90.0% (9474 of 10516 strings)
    
    Translation: libvirt/libvirt
    Translate-URL: https://translate.fedoraproject.org/projects/libvirt/libvirt/sv/
    
    Signed-off-by: Göran Uddeborg <goeran@uddeborg.se>

