Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9857D4F6B
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 14:04:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621867.968721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvG8d-00039d-Im; Tue, 24 Oct 2023 12:03:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621867.968721; Tue, 24 Oct 2023 12:03:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvG8d-00037K-Fn; Tue, 24 Oct 2023 12:03:59 +0000
Received: by outflank-mailman (input) for mailman id 621867;
 Tue, 24 Oct 2023 12:03:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qvG8c-00037A-Fi; Tue, 24 Oct 2023 12:03:58 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qvG8c-0007Qq-83; Tue, 24 Oct 2023 12:03:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qvG8b-0001qE-W1; Tue, 24 Oct 2023 12:03:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qvG8b-0004On-VS; Tue, 24 Oct 2023 12:03:57 +0000
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
	bh=/GxjEiy8GZNvUcKGyFOJ+W8GQR1OYijSOJ9gphqWHmg=; b=ORFDEQ6dhhpfZ1w7aoQigp1oiG
	A8pjThpWe7aAKdniQPZYoKZDzARQ3PL6eOkU5Ko/fitWnLlQZZRHkLho8p/mK8FPjfx1emzHRmS+x
	yxxSv0nmkKSVKnLp+pQY7lNMtsEjbobdVRMiHis3hOjkWDNiwHb73Y/Ot8+t1Ost5Vlg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183506-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183506: tolerable FAIL - PUSHED
X-Osstest-Failures:
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:xen-install:fail:heisenbug
X-Osstest-Versions-This:
    ovmf=fb044b7fe893a4545995bfe2701fd38e593355d9
X-Osstest-Versions-That:
    ovmf=da73578bf7afee1fdd1abe97eaf733aa1e4bdefe
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 24 Oct 2023 12:03:57 +0000

flight 183506 ovmf real [real]
flight 183508 ovmf real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/183506/
http://logs.test-lab.xenproject.org/osstest/logs/183508/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-i386-xl-qemuu-ovmf-amd64  7 xen-install  fail pass in 183508-retest

version targeted for testing:
 ovmf                 fb044b7fe893a4545995bfe2701fd38e593355d9
baseline version:
 ovmf                 da73578bf7afee1fdd1abe97eaf733aa1e4bdefe

Last test of basis   183504  2023-10-24 03:10:51 Z    0 days
Testing same since   183506  2023-10-24 08:12:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Nickle Wang <nicklew@nvidia.com>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          fail    


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

To xenbits.xen.org:/home/xen/git/osstest/ovmf.git
   da73578bf7..fb044b7fe8  fb044b7fe893a4545995bfe2701fd38e593355d9 -> xen-tested-master

