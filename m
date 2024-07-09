Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4B292B55E
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 12:31:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756057.1164625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR887-0006wD-Jb; Tue, 09 Jul 2024 10:31:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756057.1164625; Tue, 09 Jul 2024 10:31:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR887-0006u9-Gh; Tue, 09 Jul 2024 10:31:27 +0000
Received: by outflank-mailman (input) for mailman id 756057;
 Tue, 09 Jul 2024 10:31:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sR886-0006tt-1W; Tue, 09 Jul 2024 10:31:26 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sR885-0000sy-UP; Tue, 09 Jul 2024 10:31:25 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sR885-0002RM-BE; Tue, 09 Jul 2024 10:31:25 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sR885-0006SU-8p; Tue, 09 Jul 2024 10:31:25 +0000
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
	bh=aacRO91cqfeOmDQpsh+WJD7r5BR7pXS+2RqyQNH+A2U=; b=QVe9WsTNpfSSov9g9y/4aHapdZ
	wncmIsfvtiCCak2KCY9MgS+G5EnPq9+d4IZ/Ao57grT5YrsO0jAZMaN2mWmfXxcRoqkLEjbLulAM0
	SQqvRD5tBxL/YHa4phubccqwuO224zzpO1YI4q68GKWnII6AISG5PEbOMXEDI18rq0CA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186736-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [libvirt test] 186736: trouble: broken/pass
X-Osstest-Failures:
    libvirt:test-armhf-armhf-libvirt:<job status>:broken:regression
    libvirt:test-armhf-armhf-libvirt:host-install(5):broken:regression
    libvirt:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt:saverestore-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    libvirt:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    libvirt=9fade1d6fb66673daecd4349ad651351993b5210
X-Osstest-Versions-That:
    libvirt=893800be49d2d58f78c96e4f06d9f24188cb8946
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 09 Jul 2024 10:31:25 +0000

flight 186736 libvirt real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186736/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-libvirt        <job status>                 broken
 test-armhf-armhf-libvirt      5 host-install(5)        broken REGR. vs. 186728

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-libvirt     16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-arm64-arm64-libvirt-qcow2 15 saverestore-support-check    fail never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass

version targeted for testing:
 libvirt              9fade1d6fb66673daecd4349ad651351993b5210
baseline version:
 libvirt              893800be49d2d58f78c96e4f06d9f24188cb8946

Last test of basis   186728  2024-07-08 04:18:44 Z    1 days
Testing same since   186736  2024-07-09 04:18:46 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Göran Uddeborg <goeran@uddeborg.se>
  Martin Kletzander <mkletzan@redhat.com>

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
 test-armhf-armhf-libvirt                                     broken  
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-amd64-libvirt-qcow2                               pass    
 test-arm64-arm64-libvirt-qcow2                               pass    
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

broken-job test-armhf-armhf-libvirt broken
broken-step test-armhf-armhf-libvirt host-install(5)

Not pushing.

------------------------------------------------------------
commit 9fade1d6fb66673daecd4349ad651351993b5210
Author: Göran Uddeborg <goeran@uddeborg.se>
Date:   Sat Jul 6 13:36:02 2024 +0200

    Translated using Weblate (Swedish)
    
    Currently translated at 78.2% (8227 of 10516 strings)
    
    Translation: libvirt/libvirt
    Translate-URL: https://translate.fedoraproject.org/projects/libvirt/libvirt/sv/
    
    Co-authored-by: Göran Uddeborg <goeran@uddeborg.se>
    Signed-off-by: Göran Uddeborg <goeran@uddeborg.se>

commit db622081e0fa55b481da1fc7fb81279224a60f88
Author: Martin Kletzander <mkletzan@redhat.com>
Date:   Mon Jul 8 13:04:13 2024 +0200

    vmx: Do not require all ID data for VMWare Distributed Switch
    
    Similarly to commit 2482801608b8 we can safely ignore connectionId,
    portId and portgroupId in both XML and VMX as they are only a blind
    pass-through between XML and VMX and an ethernet without such parameters
    was spotted in the wild.  On top of that even our documentation says the
    whole VMWare Distrubuted Switch configuration is a best-effort.
    
    Resolves: https://issues.redhat.com/browse/RHEL-46099
    
    Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
    Reviewed-by: Jiri Denemark <jdenemar@redhat.com>

