Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 330E160D843
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 01:58:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430271.681766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onTo3-0008V0-DV; Tue, 25 Oct 2022 23:58:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430271.681766; Tue, 25 Oct 2022 23:58:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onTo3-0008TE-AF; Tue, 25 Oct 2022 23:58:03 +0000
Received: by outflank-mailman (input) for mailman id 430271;
 Tue, 25 Oct 2022 23:58:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1onTo2-0008T4-Ha; Tue, 25 Oct 2022 23:58:02 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1onTo2-0006Xl-Di; Tue, 25 Oct 2022 23:58:02 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1onTo2-0004T2-1i; Tue, 25 Oct 2022 23:58:02 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1onTo2-0002yl-1G; Tue, 25 Oct 2022 23:58:02 +0000
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
	bh=wXg/42mEeLYeuY6fe5Y1aeDpqH/efs5Y9qm7Z1tLdcQ=; b=WQ+M6olEo8HJ9pn4tTDs51dYBi
	7LjNFzdtUsO3jk8ixzDaoCy5aOMhNHRv070AgvRpUE02jtQzxFuTv8/ihVhFvQsXFMMbtFKZbLSJW
	TNZ1QwU3JEx4nBPzKAGYQVkzQI6VtvD0+0OlZf0DinRqHbri2qpCCqw7vZrs21n2qh6c=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-174412-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 174412: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=56035d1c8b255b33b34cd4625c26bc7d38504e30
X-Osstest-Versions-That:
    ovmf=db2c22633f3c761975d8f469a0e195d8b79e1287
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 25 Oct 2022 23:58:02 +0000

flight 174412 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/174412/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 56035d1c8b255b33b34cd4625c26bc7d38504e30
baseline version:
 ovmf                 db2c22633f3c761975d8f469a0e195d8b79e1287

Last test of basis   174393  2022-10-25 08:22:32 Z    0 days
Testing same since   174412  2022-10-25 17:42:05 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Oliver Steffen <osteffen@redhat.com>
  Rebecca Cran <rebecca@quicinc.com>

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
   db2c22633f..56035d1c8b  56035d1c8b255b33b34cd4625c26bc7d38504e30 -> xen-tested-master

