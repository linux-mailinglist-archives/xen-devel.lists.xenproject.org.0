Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 187C1653827
	for <lists+xen-devel@lfdr.de>; Wed, 21 Dec 2022 22:19:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468098.727167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p86UM-00023t-On; Wed, 21 Dec 2022 21:18:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468098.727167; Wed, 21 Dec 2022 21:18:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p86UM-00021O-Lz; Wed, 21 Dec 2022 21:18:58 +0000
Received: by outflank-mailman (input) for mailman id 468098;
 Wed, 21 Dec 2022 21:18:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p86UL-00021E-Q7; Wed, 21 Dec 2022 21:18:57 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p86UL-0006RO-N6; Wed, 21 Dec 2022 21:18:57 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p86UL-0007MR-Bc; Wed, 21 Dec 2022 21:18:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p86UL-0003gk-B8; Wed, 21 Dec 2022 21:18:57 +0000
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
	bh=mUOm8HYYwuipnf9m+b56s3xVEfHP3PPgW2AWSRWLtwE=; b=VJpa4iTsGq1kWu/jw/Z5jpqI+r
	4VMsqstnDiXMfxtBH5d6g26pyPgcnor312rLwZ1asUHN5JkUv527lhUao7JdwcR3CKVyRrome9RQy
	LjSCJbuLfJVfMLQIllqHWPKsS0aAz5YCdqUkESnneZgNRnr21JK0+rvpFGehTXgO6Gzs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175444-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175444: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=62031335bdbacc68253d43481477b9a468e0644e
X-Osstest-Versions-That:
    ovmf=0b633b14944903c32aa061befaf38bd8d994cf13
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 21 Dec 2022 21:18:57 +0000

flight 175444 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175444/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 62031335bdbacc68253d43481477b9a468e0644e
baseline version:
 ovmf                 0b633b14944903c32aa061befaf38bd8d994cf13

Last test of basis   175441  2022-12-21 11:13:47 Z    0 days
Testing same since   175444  2022-12-21 16:12:30 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dun Tan <dun.tan@intel.com>
  duntan <dun.tan@intel.com>
  Jian J Wang <jian.j.wang@intel.com>
  Judah Vang <judah.vang@intel.com>
  Nishant C Mistry <nishant.c.mistry@intel.com>
  Tan, Dun <dun.tan@intel.com>

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
   0b633b1494..62031335bd  62031335bdbacc68253d43481477b9a468e0644e -> xen-tested-master

