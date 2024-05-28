Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E05F88D2803
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 00:28:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731319.1136762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sC5Hn-0000T9-Ip; Tue, 28 May 2024 22:27:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731319.1136762; Tue, 28 May 2024 22:27:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sC5Hn-0000Ql-Fg; Tue, 28 May 2024 22:27:15 +0000
Received: by outflank-mailman (input) for mailman id 731319;
 Tue, 28 May 2024 22:27:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sC5Hm-0000Qb-BM; Tue, 28 May 2024 22:27:14 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sC5Hm-0007W3-AG; Tue, 28 May 2024 22:27:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sC5Hm-0003HB-0R; Tue, 28 May 2024 22:27:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sC5Hl-000789-WA; Tue, 28 May 2024 22:27:14 +0000
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
	bh=JxkF7QNCrhu90eMVHwUHx0LhH9TSPW/ZVyNfvxZHQnI=; b=V56NpweybTbT7HWzWDwoPsIlCi
	Y2+w7ZWbhoeUQRkEGHyKzejDpoLQOpTEl1QvX1UeNhdbTdc+27GI9KA35vPRNJAPzUOu+U1w111Xe
	p5+rLn19BoPw6ucXvXBnkjgqg5uF4uXtv704pmj7gwdzRePgJlzjHevPmBF6bH9sZUr4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186176-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186176: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=0e3189d406684e44608e01c93f7e2d53fa07b40a
X-Osstest-Versions-That:
    ovmf=08281572aab5b1f7e05bf26de4148af19eddc8b7
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 28 May 2024 22:27:13 +0000

flight 186176 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186176/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 0e3189d406684e44608e01c93f7e2d53fa07b40a
baseline version:
 ovmf                 08281572aab5b1f7e05bf26de4148af19eddc8b7

Last test of basis   186160  2024-05-27 09:43:09 Z    1 days
Testing same since   186176  2024-05-28 20:43:05 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael D Kinney <michael.d.kinney@intel.com>

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
   08281572aa..0e3189d406  0e3189d406684e44608e01c93f7e2d53fa07b40a -> xen-tested-master

