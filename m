Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A02C19315F3
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 15:41:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758906.1168440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTLwa-0004Ff-5z; Mon, 15 Jul 2024 13:40:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758906.1168440; Mon, 15 Jul 2024 13:40:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTLwa-0004Cz-3B; Mon, 15 Jul 2024 13:40:44 +0000
Received: by outflank-mailman (input) for mailman id 758906;
 Mon, 15 Jul 2024 13:40:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sTLwY-0004Ch-NS; Mon, 15 Jul 2024 13:40:42 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sTLwY-0006Ms-Kh; Mon, 15 Jul 2024 13:40:42 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sTLwY-0002gQ-77; Mon, 15 Jul 2024 13:40:42 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sTLwY-0001rf-6e; Mon, 15 Jul 2024 13:40:42 +0000
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
	bh=FC7tSKH1l7dZBhE3fDAgBOLu6fr2QpbY1e4COZXOxHo=; b=sgzCDPPKzFkSPllTRND7ezNtNQ
	SldpHC+tQmmAjx7MkzkcmKf+lyRvn2ggI0bpsG+j7MJyvz9sxyad4YJ2kKvhWkoc1mW8sLIkM6jhQ
	HvoqB/xh3hUg35SwqlhMmOJr3WYJK2VM7FDAe7VuNUE9axqnfmdhF+HNbza4i3/wx6w8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186806-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [seabios test] 186806: tolerable FAIL - PUSHED
X-Osstest-Failures:
    seabios:test-amd64-amd64-qemuu-freebsd11-amd64:guest-start/freebsd.repeat:fail:heisenbug
    seabios:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    seabios:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    seabios:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    seabios:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    seabios=ec0bc256ae0ea08a32d3e854e329cfbc141f07ad
X-Osstest-Versions-That:
    seabios=e5f2e4c69643bc3cd385306a9e5d29e11578148c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 15 Jul 2024 13:40:42 +0000

flight 186806 seabios real [real]
flight 186807 seabios real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/186806/
http://logs.test-lab.xenproject.org/osstest/logs/186807/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-qemuu-freebsd11-amd64 21 guest-start/freebsd.repeat fail pass in 186807-retest

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 185623
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 185623
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 185623
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass

version targeted for testing:
 seabios              ec0bc256ae0ea08a32d3e854e329cfbc141f07ad
baseline version:
 seabios              e5f2e4c69643bc3cd385306a9e5d29e11578148c

Last test of basis   185623  2024-04-15 19:11:57 Z   90 days
Testing same since   186806  2024-07-15 09:11:09 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>

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
 test-amd64-amd64-qemuu-freebsd11-amd64                       fail    
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
   e5f2e4c..ec0bc25  ec0bc256ae0ea08a32d3e854e329cfbc141f07ad -> xen-tested-master

