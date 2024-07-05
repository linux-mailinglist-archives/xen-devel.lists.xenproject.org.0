Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0BF927F7C
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2024 02:56:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.754072.1162373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPXEd-0006OD-RR; Fri, 05 Jul 2024 00:55:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 754072.1162373; Fri, 05 Jul 2024 00:55:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPXEd-0006MK-Oo; Fri, 05 Jul 2024 00:55:35 +0000
Received: by outflank-mailman (input) for mailman id 754072;
 Fri, 05 Jul 2024 00:55:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sPXEc-0006MA-Vc; Fri, 05 Jul 2024 00:55:34 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sPXEc-0008EI-TI; Fri, 05 Jul 2024 00:55:34 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sPXEc-0000RW-LH; Fri, 05 Jul 2024 00:55:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sPXEc-0005AC-Kj; Fri, 05 Jul 2024 00:55:34 +0000
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
	bh=0REteKmsaVRN3FR8CQVJD9wV+af67fgMy0oOW+Thv8I=; b=YAs+BeZLQwcjlUEoevXfAZrdlk
	pUI8Pe94Qxpbm99INyKyQfn/j/yFyb9x2RopHCAvv/BphGtqIL/xCTW8upvJCPB7NbT/6aQGyhuqD
	WjaPhnNYsc1xEftUWV2DmGeOFZni8VWs8xhtcGxnTuHqDTnbfpAFKnS3HsRSCUVTS4XU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186669-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186669: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=6852f6984bdab86a1662e89e1ef0f3abc39559b6
X-Osstest-Versions-That:
    ovmf=cdffb638c85da87f6b9d61194513a24cd6a73c6a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 05 Jul 2024 00:55:34 +0000

flight 186669 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186669/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 6852f6984bdab86a1662e89e1ef0f3abc39559b6
baseline version:
 ovmf                 cdffb638c85da87f6b9d61194513a24cd6a73c6a

Last test of basis   186660  2024-07-04 17:43:01 Z    0 days
Testing same since   186669  2024-07-04 20:12:59 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Lee, Chun-Yi" <jlee@suse.com>
  Chun-Yi Lee <jlee@suse.com>
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
   cdffb638c8..6852f6984b  6852f6984bdab86a1662e89e1ef0f3abc39559b6 -> xen-tested-master

