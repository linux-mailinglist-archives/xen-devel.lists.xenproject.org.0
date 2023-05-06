Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 103F46F94BE
	for <lists+xen-devel@lfdr.de>; Sun,  7 May 2023 00:16:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530999.826708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvQBV-0005oM-MV; Sat, 06 May 2023 22:15:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530999.826708; Sat, 06 May 2023 22:15:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvQBV-0005m4-Id; Sat, 06 May 2023 22:15:21 +0000
Received: by outflank-mailman (input) for mailman id 530999;
 Sat, 06 May 2023 22:15:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pvQBU-0005ld-Em; Sat, 06 May 2023 22:15:20 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pvQBT-0001XJ-Fw; Sat, 06 May 2023 22:15:19 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pvQBT-0002ok-8c; Sat, 06 May 2023 22:15:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pvQBT-00078p-85; Sat, 06 May 2023 22:15:19 +0000
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
	bh=d/oEbbG38Fk474cI3wx2c3jal1laJxMgOQKxRDrOwqg=; b=roV+sMay7T+A63MUTXtf8mbflL
	nDilSdVX7MFTsHUb/Q4gwKKmwAW91VQjBCaak4bH+nzjCsyz8g0DBFkh+hE0f+zbVi6VoEdillhPz
	8SzOZ88m8sNdX1od8FgBKZpSwIAiEsxLxSCem1bim3w3+kkNDlBC/Z2rFs4kTxyLcqgA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180563-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180563: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=4dea9e4a0e9db431240434279be9fbe45fd1651b
X-Osstest-Versions-That:
    ovmf=66494e532450c1205be93015740580c1e7b8877a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 06 May 2023 22:15:19 +0000

flight 180563 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180563/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 4dea9e4a0e9db431240434279be9fbe45fd1651b
baseline version:
 ovmf                 66494e532450c1205be93015740580c1e7b8877a

Last test of basis   180561  2023-05-06 18:10:51 Z    0 days
Testing same since   180563  2023-05-06 20:11:20 Z    0 days    1 attempts

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
   66494e5324..4dea9e4a0e  4dea9e4a0e9db431240434279be9fbe45fd1651b -> xen-tested-master

