Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 038EF839D4B
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 00:39:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670636.1043555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSQM8-0007HT-JU; Tue, 23 Jan 2024 23:39:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670636.1043555; Tue, 23 Jan 2024 23:39:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSQM8-0007F5-G2; Tue, 23 Jan 2024 23:39:00 +0000
Received: by outflank-mailman (input) for mailman id 670636;
 Tue, 23 Jan 2024 23:38:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rSQM6-0007Ev-WF; Tue, 23 Jan 2024 23:38:59 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rSQM6-0002Qh-Rw; Tue, 23 Jan 2024 23:38:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rSQM6-0000di-Db; Tue, 23 Jan 2024 23:38:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rSQM6-0001Wn-D3; Tue, 23 Jan 2024 23:38:58 +0000
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
	bh=IQOOe6EwbC0iwKptFSjogpCUXpHUCDVzgdlJvz05Km0=; b=zh6vKygS7sDW2t7zDCCe7DfK3I
	b7K7/iFncxiOioiuLG+ivS78r9MlXDSmbVwQpSoqgWLjakl6g8Q5LMiyVw8zfKWxQ8JSA/IG4jFWB
	34NdNjmn1hte16z1BWOFYi5OcXnEMRUhyVJccz+tbFJPm1C1X4X3/dL9W64UV5XJYNPU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184441-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184441: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=417ebe6d1d6052b6cf023332da07558363d7fd08
X-Osstest-Versions-That:
    ovmf=d97f3a1d80fc4880da9726d9a5d7504d3c31da70
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 23 Jan 2024 23:38:58 +0000

flight 184441 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184441/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 417ebe6d1d6052b6cf023332da07558363d7fd08
baseline version:
 ovmf                 d97f3a1d80fc4880da9726d9a5d7504d3c31da70

Last test of basis   184438  2024-01-23 16:11:23 Z    0 days
Testing same since   184441  2024-01-23 21:14:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Laszlo Ersek <lersek@redhat.com>
  levi.yun <yeoreum.yun@arm.com>
  Nhi Pham <nhi@os.amperecomputing.com>
  Suqiang Ren <suqiangx.ren@intel.com>

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
   d97f3a1d80..417ebe6d1d  417ebe6d1d6052b6cf023332da07558363d7fd08 -> xen-tested-master

