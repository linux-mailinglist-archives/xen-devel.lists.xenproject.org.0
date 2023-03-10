Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFDD6B35D9
	for <lists+xen-devel@lfdr.de>; Fri, 10 Mar 2023 06:02:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508397.783066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paUsb-0003yb-0G; Fri, 10 Mar 2023 05:01:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508397.783066; Fri, 10 Mar 2023 05:01:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paUsa-0003w2-SX; Fri, 10 Mar 2023 05:01:20 +0000
Received: by outflank-mailman (input) for mailman id 508397;
 Fri, 10 Mar 2023 05:01:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1paUsZ-0003vs-CQ; Fri, 10 Mar 2023 05:01:19 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1paUsZ-0007k8-91; Fri, 10 Mar 2023 05:01:19 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1paUsY-00020x-S3; Fri, 10 Mar 2023 05:01:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1paUsY-0005tr-Rh; Fri, 10 Mar 2023 05:01:18 +0000
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
	bh=0RCqTpdl6bhTv4imki8A+HVar0wbaZHJbbX5/Oi99ic=; b=1jFCqYYgOHWJ5wpL1bLE/wP8V6
	EX32qsmSOPmIMqFA54uQPdse0b02vhcP3i6Dj++8TFqn7vkQCchJPt8OVOYG81GqIGwup7j6snxT/
	kdcwKrviWiYYkSE4HO1BWNTJE6dajqzh+ML65a61utQ5LwhtPc4DcW7kJ8RJnNVPxj6k=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-179527-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 179527: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=8820767fb3bad09eeedecc3030d75c9e0cd4cab7
X-Osstest-Versions-That:
    ovmf=a0f9628705e35c981ae95376f9ebedf877d09111
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 10 Mar 2023 05:01:18 +0000

flight 179527 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/179527/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 8820767fb3bad09eeedecc3030d75c9e0cd4cab7
baseline version:
 ovmf                 a0f9628705e35c981ae95376f9ebedf877d09111

Last test of basis   179517  2023-03-09 10:12:20 Z    0 days
Testing same since   179527  2023-03-10 02:10:45 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ashraf Ali S <ashraf.ali.s@intel.com>
  S, Ashraf Ali <ashraf.ali.s@intel.com>

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
   a0f9628705..8820767fb3  8820767fb3bad09eeedecc3030d75c9e0cd4cab7 -> xen-tested-master

