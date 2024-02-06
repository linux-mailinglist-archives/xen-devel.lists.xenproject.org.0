Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F7F84B40A
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 12:58:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676848.1053162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXK5H-0004Q1-PI; Tue, 06 Feb 2024 11:57:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676848.1053162; Tue, 06 Feb 2024 11:57:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXK5H-0004OO-MU; Tue, 06 Feb 2024 11:57:51 +0000
Received: by outflank-mailman (input) for mailman id 676848;
 Tue, 06 Feb 2024 11:57:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rXK5F-0004OE-W5; Tue, 06 Feb 2024 11:57:50 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rXK5F-0001cY-SV; Tue, 06 Feb 2024 11:57:49 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rXK5F-0004Iu-En; Tue, 06 Feb 2024 11:57:49 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rXK5F-000682-EL; Tue, 06 Feb 2024 11:57:49 +0000
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
	bh=EfsWaFnNOwQqPKi19KQOat83X4jntJfvzutvd911vvw=; b=Tax1GryZnXZAGl11p10tbeosKQ
	yxNASnbbt9qId4kyh0iBdEYVBMvk55MLgW0CIW3qQ5Jpes5hNMaap8PBXP7CDV4O2a96iqyV3donM
	UUpWg6sg+3MiqjEZJXf6fK0zSv2PfVsLBrnSPWZ4q3BybM+Y/eWb0WSmMBSpRVKiaG5A=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184603-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184603: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ae59b8ba4166384cbfa32a921aac289bcff2aef9
X-Osstest-Versions-That:
    ovmf=056b4bf74bf5cfa2c0c9c5e44a7c5f3f461d17c0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 06 Feb 2024 11:57:49 +0000

flight 184603 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184603/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ae59b8ba4166384cbfa32a921aac289bcff2aef9
baseline version:
 ovmf                 056b4bf74bf5cfa2c0c9c5e44a7c5f3f461d17c0

Last test of basis   184587  2024-02-04 13:41:21 Z    1 days
Testing same since   184603  2024-02-06 09:15:38 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dun Tan <dun.tan@intel.com>
  Zhou Jianfeng <jianfeng.zhou@intel.com>

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
   056b4bf74b..ae59b8ba41  ae59b8ba4166384cbfa32a921aac289bcff2aef9 -> xen-tested-master

