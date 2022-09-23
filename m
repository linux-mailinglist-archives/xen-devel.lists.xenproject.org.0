Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEBD5E8030
	for <lists+xen-devel@lfdr.de>; Fri, 23 Sep 2022 18:54:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410909.654078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oblwB-00087u-R1; Fri, 23 Sep 2022 16:54:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410909.654078; Fri, 23 Sep 2022 16:54:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oblwB-00084Y-ND; Fri, 23 Sep 2022 16:54:03 +0000
Received: by outflank-mailman (input) for mailman id 410909;
 Fri, 23 Sep 2022 16:54:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oblwA-00084O-0w; Fri, 23 Sep 2022 16:54:02 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oblw9-0007kn-Ld; Fri, 23 Sep 2022 16:54:01 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oblw9-0001sd-B5; Fri, 23 Sep 2022 16:54:01 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oblw9-0001jc-Ad; Fri, 23 Sep 2022 16:54:01 +0000
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
	bh=+dwptf/aU5sJIYMLr6i1xbaLMS4oZ8mgX+6uMWz98h8=; b=GCo2wHZOzliv6T0eVHn3b1zi7C
	/8iiC/aenUQjGA3+E2+AvjoJ5P54dvpNViY5bxok2138DUAw4Mc7eawBLBT0/xOT+j989fvXa63tv
	ygQDfDNj9wGXTG3XqFkamfVgmYEZf/2Bu3IAo9WKw/2YD0AKZM5uzzq/GTMAdDDJXlBo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173293-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 173293: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=953438e4665c5993dfe5652c43ad43f963075b64
X-Osstest-Versions-That:
    ovmf=5f403cdc6a367d8aad70f25e4286cb3785f2a1a2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 23 Sep 2022 16:54:01 +0000

flight 173293 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/173293/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 953438e4665c5993dfe5652c43ad43f963075b64
baseline version:
 ovmf                 5f403cdc6a367d8aad70f25e4286cb3785f2a1a2

Last test of basis   173289  2022-09-23 09:41:41 Z    0 days
Failing since        173290  2022-09-23 12:13:11 Z    0 days    2 attempts
Testing same since   173293  2022-09-23 14:42:58 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Christopher Zurcher <christopher.zurcher@microsoft.com>
  Christopher Zurcher <zurcher@gmail.com>
  Leif Lindholm <quic_llindhol@quicinc.com>
  Minh Nguyen <minhn@amperecomputing.com>
  Nhi Pham <nhi@os.amperecomputing.com>
  Yi Li <yi1.li@intel.com>

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
   5f403cdc6a..953438e466  953438e4665c5993dfe5652c43ad43f963075b64 -> xen-tested-master

