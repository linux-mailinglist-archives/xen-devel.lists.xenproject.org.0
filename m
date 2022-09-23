Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C685E5E7A1F
	for <lists+xen-devel@lfdr.de>; Fri, 23 Sep 2022 14:04:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410764.653909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obhP8-0002I0-QO; Fri, 23 Sep 2022 12:03:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410764.653909; Fri, 23 Sep 2022 12:03:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obhP8-0002FW-My; Fri, 23 Sep 2022 12:03:38 +0000
Received: by outflank-mailman (input) for mailman id 410764;
 Fri, 23 Sep 2022 12:03:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1obhP7-0002FM-5O; Fri, 23 Sep 2022 12:03:37 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1obhP7-0001Dy-3g; Fri, 23 Sep 2022 12:03:37 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1obhP6-0003lN-Nl; Fri, 23 Sep 2022 12:03:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1obhP6-0007fD-NM; Fri, 23 Sep 2022 12:03:36 +0000
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
	bh=YLshj5wRn9Q7aDis+TicFSYWBeAodeBcFE71b3ljhA8=; b=tjosbdQAArOM21EMpmuALxtgl0
	4+8modZgIz4Ju35ZTkpo3RWzJcCgP5mAWAKKPwBkUyBiJNwDLVQQmWatcRe1xxcVzXFjndlW5eTRx
	DYJxC3YhWIlJBgKlNkNgChqRljScUjRX0kkcnbHYtvs7dh8Rq/uOyhgCn6cM0S7yd9ws=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173289-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 173289: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=5f403cdc6a367d8aad70f25e4286cb3785f2a1a2
X-Osstest-Versions-That:
    ovmf=b19793a2ec6466c04e5e3506fbe82038fb0a885f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 23 Sep 2022 12:03:36 +0000

flight 173289 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/173289/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 5f403cdc6a367d8aad70f25e4286cb3785f2a1a2
baseline version:
 ovmf                 b19793a2ec6466c04e5e3506fbe82038fb0a885f

Last test of basis   173288  2022-09-23 07:43:17 Z    0 days
Testing same since   173289  2022-09-23 09:41:41 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Qi Zhang <qi1.zhang@intel.com>

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
   b19793a2ec..5f403cdc6a  5f403cdc6a367d8aad70f25e4286cb3785f2a1a2 -> xen-tested-master

