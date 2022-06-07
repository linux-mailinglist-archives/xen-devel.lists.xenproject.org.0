Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A9A540071
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 15:49:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343276.568578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyZZX-0004wq-7Q; Tue, 07 Jun 2022 13:48:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343276.568578; Tue, 07 Jun 2022 13:48:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyZZX-0004u5-44; Tue, 07 Jun 2022 13:48:39 +0000
Received: by outflank-mailman (input) for mailman id 343276;
 Tue, 07 Jun 2022 13:48:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nyZZV-0004tv-Gi; Tue, 07 Jun 2022 13:48:37 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nyZZV-0005e8-EM; Tue, 07 Jun 2022 13:48:37 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nyZZV-0002qn-7A; Tue, 07 Jun 2022 13:48:37 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nyZZV-0006U5-6i; Tue, 07 Jun 2022 13:48:37 +0000
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
	bh=hYXcvkenuhYrLI3x/iGm4lAFCtat5DYWq6DLzNmsWsU=; b=vPRgMYhSLAa8A3X1X5zDXieEEf
	QOKkUTH57nZ/T4MMA7QcTf8e/ysETg5/NuqOI5slzsgrMf+WzhXelycbI6LRsLleEnF5Ki3UFa9OW
	SeJLB4r0CjG6bbAbY6BtXaKE5dr0w9QjhazmqSVCYwbzYBvgeK8FPezhNIK+g+qfkdO4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-170867-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 170867: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=a81a650da1dc40ec2b2825d1878cdf2778b4be14
X-Osstest-Versions-That:
    ovmf=4f89e4b3e80329b9a445500009c658d2ebce8475
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 07 Jun 2022 13:48:37 +0000

flight 170867 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/170867/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 a81a650da1dc40ec2b2825d1878cdf2778b4be14
baseline version:
 ovmf                 4f89e4b3e80329b9a445500009c658d2ebce8475

Last test of basis   170855  2022-06-07 01:57:37 Z    0 days
Testing same since   170867  2022-06-07 11:10:44 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Min M Xu <min.m.xu@intel.com>
  Min Xu <min.m.xu@intel.com>

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
   4f89e4b3e8..a81a650da1  a81a650da1dc40ec2b2825d1878cdf2778b4be14 -> xen-tested-master

