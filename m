Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0699F2F72F0
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 07:35:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67681.120937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Igt-0004bF-GZ; Fri, 15 Jan 2021 06:34:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67681.120937; Fri, 15 Jan 2021 06:34:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Igt-0004am-CR; Fri, 15 Jan 2021 06:34:35 +0000
Received: by outflank-mailman (input) for mailman id 67681;
 Fri, 15 Jan 2021 06:34:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l0Igr-0004ae-R2; Fri, 15 Jan 2021 06:34:33 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l0Igr-00050E-KV; Fri, 15 Jan 2021 06:34:33 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l0Igr-0007Jg-ED; Fri, 15 Jan 2021 06:34:33 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l0Igr-0001TO-Df; Fri, 15 Jan 2021 06:34:33 +0000
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
	bh=sQnkRTZm+FdCJV9bbOL/dS9zjgYKmtDHN7GgL6jHNkU=; b=5idrciqgBzz4k3eaMGc5Ndj849
	EDNsxnc2lGWLpQLTNizdg8vpfFJn8OYUg9RkdLsSIEd5RjriRAXDdU9UGt99o6IevdVYMr4NkJ3aO
	dZn025x+J2KoN9BpSkbGvUADJF9FRbWBudRDLrrEmew0kAr2/BAQ94lgxs4MwBTuyKDU=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158428-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 158428: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=014b9850f2a33ae402b87c46268f4d98395d5d59
X-Osstest-Versions-That:
    ovmf=40c4cd54213b78ef0daee2f4b186150d7ef63bb4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 15 Jan 2021 06:34:33 +0000

flight 158428 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158428/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 014b9850f2a33ae402b87c46268f4d98395d5d59
baseline version:
 ovmf                 40c4cd54213b78ef0daee2f4b186150d7ef63bb4

Last test of basis   158422  2021-01-14 15:10:41 Z    0 days
Testing same since   158428  2021-01-15 01:09:40 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Wenyi Xie <xiewenyi2@huawei.com>
  wenyi,xie via groups.io <xiewenyi2=huawei.com@groups.io>

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
   40c4cd5421..014b9850f2  014b9850f2a33ae402b87c46268f4d98395d5d59 -> xen-tested-master

