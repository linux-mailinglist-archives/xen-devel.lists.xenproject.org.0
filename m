Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5298CA76C
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 06:36:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726492.1130775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9HDq-0006FU-EL; Tue, 21 May 2024 04:35:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726492.1130775; Tue, 21 May 2024 04:35:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9HDq-0006Dw-BV; Tue, 21 May 2024 04:35:34 +0000
Received: by outflank-mailman (input) for mailman id 726492;
 Tue, 21 May 2024 04:35:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s9HDo-0006Dm-LE; Tue, 21 May 2024 04:35:32 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s9HDo-0002PM-JG; Tue, 21 May 2024 04:35:32 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s9HDo-0005wS-8V; Tue, 21 May 2024 04:35:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1s9HDo-00085m-89; Tue, 21 May 2024 04:35:32 +0000
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
	bh=0ekCUrFjnAwt2wPQ4FTzVgXGEYFFTflLLhg5gr8mLqI=; b=hSpMlQq2YGdQY0oc668A0FQyJV
	HrxQCrqwtpILBZyvgaah9r4cpEmAEvWEVYYoogLC5XIool67ZTOHBBGu8HLdPB2U2WAPQEqvF8TJe
	bIt5S0k+hoVWguiaksMZcHhiw6aTH0+2qIoxb71EvazG8i0PjmuNxtzQSh793Iks+PyY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186054-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186054: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=7142e648416ff5d3eac6c6d607874805f5de0ca8
X-Osstest-Versions-That:
    ovmf=284dbac43da752ee34825c8b3f6f9e8281cb5a19
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 21 May 2024 04:35:32 +0000

flight 186054 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186054/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7142e648416ff5d3eac6c6d607874805f5de0ca8
baseline version:
 ovmf                 284dbac43da752ee34825c8b3f6f9e8281cb5a19

Last test of basis   186026  2024-05-17 05:43:05 Z    3 days
Testing same since   186054  2024-05-21 02:43:06 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael Kubacki <michael.kubacki@microsoft.com>

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
   284dbac43d..7142e64841  7142e648416ff5d3eac6c6d607874805f5de0ca8 -> xen-tested-master

