Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 763E93B943C
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 17:45:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148943.275283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyyqg-0006lA-QL; Thu, 01 Jul 2021 15:43:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148943.275283; Thu, 01 Jul 2021 15:43:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyyqg-0006i4-NK; Thu, 01 Jul 2021 15:43:30 +0000
Received: by outflank-mailman (input) for mailman id 148943;
 Thu, 01 Jul 2021 15:43:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lyyqf-0006hu-It; Thu, 01 Jul 2021 15:43:29 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lyyqf-0008A0-DI; Thu, 01 Jul 2021 15:43:29 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lyyqf-0004FY-43; Thu, 01 Jul 2021 15:43:29 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lyyqf-0000dW-3U; Thu, 01 Jul 2021 15:43:29 +0000
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
	bh=8hDzVsvnQdC8oYQ6Ruqk5A0ejVENUULzYfeJB+I0mKE=; b=MeMcp70Nc3dtLEQnWfCus3vz37
	BrrsF5u5P7SiO8uMlUnMFsi3fbgqCrTS3Y6oDFYgs07IkNdRzIAEnhCHrCT2Fev3U7NMCoexb/R7n
	pwVps4ECx7Td2CTo5y21XDHRVect0DsaHaS1UedikOCSFMRq/vjvEUY3rlSSXcH24d1M=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-163212-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 163212: all pass - PUSHED
X-Osstest-Versions-This:
    xtf=cdef9568c1b1f8831f3b8f644073e635d47f0ec4
X-Osstest-Versions-That:
    xtf=93b29b886e8665e368598c711279d45b7e5d066c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 01 Jul 2021 15:43:29 +0000

flight 163212 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/163212/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xtf                  cdef9568c1b1f8831f3b8f644073e635d47f0ec4
baseline version:
 xtf                  93b29b886e8665e368598c711279d45b7e5d066c

Last test of basis   163016  2021-06-24 11:41:21 Z    7 days
Testing same since   163212  2021-07-01 12:40:06 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Pranjal Singh <008pranjalsingh@gmail.com>

jobs:
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-amd64-pvops                                            pass    
 test-xtf-amd64-amd64-1                                       pass    
 test-xtf-amd64-amd64-2                                       pass    
 test-xtf-amd64-amd64-3                                       pass    
 test-xtf-amd64-amd64-4                                       pass    
 test-xtf-amd64-amd64-5                                       pass    


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

To xenbits.xen.org:/home/xen/git/xtf.git
   93b29b8..cdef956  cdef9568c1b1f8831f3b8f644073e635d47f0ec4 -> xen-tested-master

