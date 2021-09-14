Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9786940A28A
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 03:31:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186050.334788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPxI9-0007Gr-IL; Tue, 14 Sep 2021 01:31:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186050.334788; Tue, 14 Sep 2021 01:31:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPxI9-0007Fn-Dp; Tue, 14 Sep 2021 01:31:21 +0000
Received: by outflank-mailman (input) for mailman id 186050;
 Tue, 14 Sep 2021 01:31:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mPxI7-0007Fd-SZ; Tue, 14 Sep 2021 01:31:19 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mPxI7-0000S2-KC; Tue, 14 Sep 2021 01:31:19 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mPxI7-0005vh-3h; Tue, 14 Sep 2021 01:31:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mPxI7-0003EC-3F; Tue, 14 Sep 2021 01:31:19 +0000
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
	bh=6RO5jrtwKxmwuB5jr9agTBOu6xKa7jPsywfzyfHYY/M=; b=F9Kp84EhsoWir2Iobc0skxcl7E
	hrN8c99XDlG5uH3Zc8suYzyOfgLjl10GX96XvKqn8hHqB5+eQG0ipfDEbVYC+6xg8JLGnGYGuPRjU
	YkE6xVEzpS+EbPIKEFyxt+7jzjjbb0+lwDKKdIjWmPIJU3JZcbVIdItewIFBPSa6QEik=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164971-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 164971: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=3b69fcf5f849021aa3bc810f8100ea71c03019e5
X-Osstest-Versions-That:
    ovmf=dcd3d63f4f77da5540bfe35d8ccb040d70644568
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 14 Sep 2021 01:31:19 +0000

flight 164971 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164971/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 3b69fcf5f849021aa3bc810f8100ea71c03019e5
baseline version:
 ovmf                 dcd3d63f4f77da5540bfe35d8ccb040d70644568

Last test of basis   164946  2021-09-11 00:12:25 Z    3 days
Testing same since   164971  2021-09-13 17:12:37 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Stefan Berger <stefanb@linux.ibm.com>
  Stefan Berger <stefanb@linux.vnet.ibm.com>

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
   dcd3d63f4f..3b69fcf5f8  3b69fcf5f849021aa3bc810f8100ea71c03019e5 -> xen-tested-master

