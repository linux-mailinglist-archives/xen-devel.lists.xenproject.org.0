Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 819215F8583
	for <lists+xen-devel@lfdr.de>; Sat,  8 Oct 2022 15:57:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.418529.663358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohAJN-0007K7-JC; Sat, 08 Oct 2022 13:56:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 418529.663358; Sat, 08 Oct 2022 13:56:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohAJN-0007HL-FS; Sat, 08 Oct 2022 13:56:17 +0000
Received: by outflank-mailman (input) for mailman id 418529;
 Sat, 08 Oct 2022 13:56:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ohAJL-0007HB-Pv; Sat, 08 Oct 2022 13:56:15 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ohAJL-0001j9-O4; Sat, 08 Oct 2022 13:56:15 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ohAJL-0000he-7H; Sat, 08 Oct 2022 13:56:15 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ohAJL-0003ir-6q; Sat, 08 Oct 2022 13:56:15 +0000
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
	bh=XMsdfX9fs+MRL/rJ/JGJ1lgZgHX6GB9zPXHxrGpd30I=; b=4m5FvKBuhzlMylZhUaGnsFDLxy
	IQsAHXNu0/XwPmwUTBUP0+saqNjvACSGTzGal07ly8CKRieWHkczdbV6i0Da6iCbnqz1fQpkZQpAH
	ZGTT8803kuF5zJVYFW0Vpj+5X0ABQZ1BFPJLKOnKvxkivJ2dkr6/7fGa9FUkW+mFTUAA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173472-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 173472: tolerable FAIL - PUSHED
X-Osstest-Failures:
    ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:guest-start/debianhvm.repeat:fail:heisenbug
X-Osstest-Versions-This:
    ovmf=de103f1981cfca90dd19296d4b20449a2b93dc26
X-Osstest-Versions-That:
    ovmf=4364d661685d4806b8fb66ff76eaece7ea6a4426
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 08 Oct 2022 13:56:15 +0000

flight 173472 ovmf real [real]
flight 173473 ovmf real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/173472/
http://logs.test-lab.xenproject.org/osstest/logs/173473/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-qemuu-ovmf-amd64 20 guest-start/debianhvm.repeat fail pass in 173473-retest

version targeted for testing:
 ovmf                 de103f1981cfca90dd19296d4b20449a2b93dc26
baseline version:
 ovmf                 4364d661685d4806b8fb66ff76eaece7ea6a4426

Last test of basis   173471  2022-10-08 08:41:54 Z    0 days
Testing same since   173472  2022-10-08 11:13:08 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Foster Nong <foster.nong@intel.com>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         fail    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    


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
   4364d66168..de103f1981  de103f1981cfca90dd19296d4b20449a2b93dc26 -> xen-tested-master

