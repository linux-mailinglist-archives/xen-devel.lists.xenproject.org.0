Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A637F359C24
	for <lists+xen-devel@lfdr.de>; Fri,  9 Apr 2021 12:31:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107746.205962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUoQR-0004mH-Es; Fri, 09 Apr 2021 10:31:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107746.205962; Fri, 09 Apr 2021 10:31:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUoQR-0004lr-BC; Fri, 09 Apr 2021 10:31:43 +0000
Received: by outflank-mailman (input) for mailman id 107746;
 Fri, 09 Apr 2021 10:31:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lUoQQ-0004lj-2m; Fri, 09 Apr 2021 10:31:42 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lUoQP-0007nk-SY; Fri, 09 Apr 2021 10:31:41 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lUoQP-00054l-MI; Fri, 09 Apr 2021 10:31:41 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lUoQP-0008Re-Ln; Fri, 09 Apr 2021 10:31:41 +0000
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
	bh=wfhMwqBB4DTv/pexSo0Db1XUgfnK6lxkNXC78PooF74=; b=uorYEdI9JupeE9lUH3rGR0rv3i
	GaFCSk/98jEwCQPc3u30osYhBcaHwDHosz0ie9hIofalDMnWiHVd3Y8E6l31rLajWLmv+DiUM+ipV
	yQ4dlCdcTLJJfFIUagPHgxVSa3Uzg9+miwKrPCXK4dZ6hUWNGGULTyoCg7OvzofVQO5g=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-160841-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 160841: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=19d5bccc7663399c0726aac800ddd4591be0176a
X-Osstest-Versions-That:
    ovmf=dc4d42302c22f012d78f6495ea23ceaa3e23842e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 09 Apr 2021 10:31:41 +0000

flight 160841 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/160841/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 19d5bccc7663399c0726aac800ddd4591be0176a
baseline version:
 ovmf                 dc4d42302c22f012d78f6495ea23ceaa3e23842e

Last test of basis   160817  2021-04-08 09:33:32 Z    1 days
Testing same since   160841  2021-04-09 01:14:33 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jason Lou <yun.lou@intel.com>

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
   dc4d42302c..19d5bccc76  19d5bccc7663399c0726aac800ddd4591be0176a -> xen-tested-master

