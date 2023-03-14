Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D7F6B8808
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 03:06:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509428.785161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbu32-0006a7-12; Tue, 14 Mar 2023 02:05:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509428.785161; Tue, 14 Mar 2023 02:05:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbu31-0006Wq-Tt; Tue, 14 Mar 2023 02:05:55 +0000
Received: by outflank-mailman (input) for mailman id 509428;
 Tue, 14 Mar 2023 02:05:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pbu30-0006Wg-NZ; Tue, 14 Mar 2023 02:05:54 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pbu30-0004xn-K3; Tue, 14 Mar 2023 02:05:54 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pbu30-0000e4-7n; Tue, 14 Mar 2023 02:05:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pbu30-0007y4-7L; Tue, 14 Mar 2023 02:05:54 +0000
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
	bh=sTteaFZVK2z8AXodgB1xhi6Z705yFUVab3BHvwvqAQM=; b=dSG+lDgsuV+igCHL5SdAbfch9v
	sVYWydh23ZUB+KrfFmEQnzypibkSDJX6EI9Wai99+ZyIca6GStywwu3lOZ1k92RVg43V1HN90K0WV
	/FUEFJGZpIuvqzQqIco3sP6nxn2b08bABEBcZtNIa6Xy0ufjhQQM2eI1MSkvzepITeHg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-179610-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 179610: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=e4c1d8d2317984bd9cb447eba916956841063ec4
X-Osstest-Versions-That:
    ovmf=d2bfe289668e32940cca5da12bc201bf9b6c84d8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 14 Mar 2023 02:05:54 +0000

flight 179610 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/179610/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e4c1d8d2317984bd9cb447eba916956841063ec4
baseline version:
 ovmf                 d2bfe289668e32940cca5da12bc201bf9b6c84d8

Last test of basis   179552  2023-03-11 06:49:36 Z    2 days
Testing same since   179610  2023-03-13 22:40:48 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael D Kinney <michael.d.kinney@intel.com>

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
   d2bfe28966..e4c1d8d231  e4c1d8d2317984bd9cb447eba916956841063ec4 -> xen-tested-master

