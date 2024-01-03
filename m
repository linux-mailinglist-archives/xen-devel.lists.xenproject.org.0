Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A538230F2
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jan 2024 17:03:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660974.1030681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rL3h6-0007Xc-OT; Wed, 03 Jan 2024 16:02:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660974.1030681; Wed, 03 Jan 2024 16:02:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rL3h6-0007UY-Lf; Wed, 03 Jan 2024 16:02:12 +0000
Received: by outflank-mailman (input) for mailman id 660974;
 Wed, 03 Jan 2024 16:02:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rL3h5-0007UO-G6; Wed, 03 Jan 2024 16:02:11 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rL3h5-00032I-80; Wed, 03 Jan 2024 16:02:11 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rL3h4-0002X7-PV; Wed, 03 Jan 2024 16:02:10 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rL3h4-0007Qo-Oy; Wed, 03 Jan 2024 16:02:10 +0000
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
	bh=h23pBEQkfEHnho+OoXDLF1ukqwV4WEoLxSOBSW7OPFA=; b=1LVLJByyj4288j17fBjDf7fw+J
	4eoY7kFPW0cvaeGAfl5FLMfWlJwcHYTXSCfy9z9ruKmEh7M9G8VqMJEz73sOuNOIC4mnlR7DLIhOC
	nZKpGXEKYYG0nhl86DSernPKUWiXL1M/EU/6vfUXVAxyn06tK5zTyovRC0Cpmw5TyAkI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184245-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184245: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=7a5823f85be99b9a92751fcf4141f7982fa5cc80
X-Osstest-Versions-That:
    ovmf=d7d4f09ff815794761f84d06e307001afe6376c4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 03 Jan 2024 16:02:10 +0000

flight 184245 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184245/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7a5823f85be99b9a92751fcf4141f7982fa5cc80
baseline version:
 ovmf                 d7d4f09ff815794761f84d06e307001afe6376c4

Last test of basis   184228  2023-12-27 00:12:45 Z    7 days
Testing same since   184245  2024-01-03 14:14:26 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jeff Brasen <jbrasen@nvidia.com>
  Jeff Brasen via groups.io <jbrasen=nvidia.com@groups.io>

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
   d7d4f09ff8..7a5823f85b  7a5823f85be99b9a92751fcf4141f7982fa5cc80 -> xen-tested-master

