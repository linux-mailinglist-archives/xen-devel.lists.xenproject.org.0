Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DB26477D4
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 22:16:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457437.715350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3OEV-00028y-9b; Thu, 08 Dec 2022 21:15:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457437.715350; Thu, 08 Dec 2022 21:15:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3OEV-00025q-5Y; Thu, 08 Dec 2022 21:15:07 +0000
Received: by outflank-mailman (input) for mailman id 457437;
 Thu, 08 Dec 2022 21:15:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p3OEU-00025d-Cp; Thu, 08 Dec 2022 21:15:06 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p3OEU-0004TE-AP; Thu, 08 Dec 2022 21:15:06 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p3OET-0005oi-V1; Thu, 08 Dec 2022 21:15:06 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p3OET-0001yc-UU; Thu, 08 Dec 2022 21:15:05 +0000
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
	bh=ml4ojYRFZ+qkxdWSv7eRSy9q1E6T+xxMeHsN6GPvcNI=; b=cpiYnX7Dx6vzs7/IS1OhU6npBe
	5Wkhx9RbRSkdHgXQzQxOc2cbtF/A6WiOck99aUoUSC9p92yUsRA2K4b7IqQxazSZ2lCqfco39oKeP
	Zb26Fvu/bRIrO48AU0UuIAF8cPvzDT5ixt1VI2UOH+oOmAFGvstgCvcKcvWg8skn+t3U=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175093-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175093: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=8a485e4bb8b5c5a800d6b3e1b8fa80fe27afb274
X-Osstest-Versions-That:
    ovmf=1c75bf3c21da79b1bc1d50cfc593b57f73f2c560
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 08 Dec 2022 21:15:05 +0000

flight 175093 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175093/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 8a485e4bb8b5c5a800d6b3e1b8fa80fe27afb274
baseline version:
 ovmf                 1c75bf3c21da79b1bc1d50cfc593b57f73f2c560

Last test of basis   175090  2022-12-08 10:11:01 Z    0 days
Testing same since   175093  2022-12-08 16:12:26 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Liu, Zhiguang <Zhiguang.Liu@intel.com>
  Zhiguang Liu <zhiguang.liu@intel.com>

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
   1c75bf3c21..8a485e4bb8  8a485e4bb8b5c5a800d6b3e1b8fa80fe27afb274 -> xen-tested-master

