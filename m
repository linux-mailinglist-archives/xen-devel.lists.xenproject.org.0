Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D49D8A6145
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 05:04:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706559.1103769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwZ7D-000797-9H; Tue, 16 Apr 2024 03:04:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706559.1103769; Tue, 16 Apr 2024 03:04:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwZ7D-000761-5j; Tue, 16 Apr 2024 03:04:11 +0000
Received: by outflank-mailman (input) for mailman id 706559;
 Tue, 16 Apr 2024 03:04:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rwZ7B-00075r-Gd; Tue, 16 Apr 2024 03:04:09 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rwZ7B-0003Hb-4b; Tue, 16 Apr 2024 03:04:09 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rwZ7A-0000Re-Od; Tue, 16 Apr 2024 03:04:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rwZ7A-0005Tm-O4; Tue, 16 Apr 2024 03:04:08 +0000
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
	bh=rZLItHXrJKmWiNNBpZdOaSFf3/AEcZ1DPQDaJP7NQ/4=; b=iD+sOWmiSy8FqlR4HTamJJhyRB
	HjIuoMWZVmLv5hwtVZMSoPnx8JmBTH+V0kt4HzjbVVY79JPr7yXoKHZiF8fmwQNR1IJK83mN9nxRb
	Y4avLmXqt/s6k/YyKWV0k8UmyCY/RrhIoGOIU0vinFEWIJlUWVVIJc3XCifRXh/uzg8w=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185623-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [seabios test] 185623: tolerable FAIL - PUSHED
X-Osstest-Failures:
    seabios:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    seabios:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    seabios:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    seabios:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    seabios=e5f2e4c69643bc3cd385306a9e5d29e11578148c
X-Osstest-Versions-That:
    seabios=c5a361c09a19e3b1a83557b01f11f04b27181a11
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 16 Apr 2024 03:04:08 +0000

flight 185623 seabios real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185623/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 185287
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 185287
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 185287
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass

version targeted for testing:
 seabios              e5f2e4c69643bc3cd385306a9e5d29e11578148c
baseline version:
 seabios              c5a361c09a19e3b1a83557b01f11f04b27181a11

Last test of basis   185287  2024-04-09 15:42:58 Z    6 days
Testing same since   185604  2024-04-15 13:42:35 Z    0 days    3 attempts

------------------------------------------------------------
People who touched revisions under test:
  Daniil Tatianin <d-tatianin@yandex-team.ru>
  Kevin O'Connor <kevin@koconnor.net>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    


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

To xenbits.xen.org:/home/xen/git/osstest/seabios.git
   c5a361c..e5f2e4c  e5f2e4c69643bc3cd385306a9e5d29e11578148c -> xen-tested-master

