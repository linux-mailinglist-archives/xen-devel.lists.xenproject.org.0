Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 884711AD1F2
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 23:35:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPCA9-0002RW-Sv; Thu, 16 Apr 2020 21:35:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=amLm=6A=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jPCA8-0002RR-9i
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 21:35:08 +0000
X-Inumbo-ID: 23893e10-802a-11ea-8c16-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 23893e10-802a-11ea-8c16-12813bfff9fa;
 Thu, 16 Apr 2020 21:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vsBlpnAMRnjWExLzZ+4H1EFgLlW+oUYoU7+aEs6UwbA=; b=ha0Qt8N2zVNf3CGmZByyy4eIb
 cL3w2AkOcvpm/U0ndEUnSQ9lkApAMfWtWY57GofZntJayJO43FEQd3VC0CrvXdUDfNgNQvVgQON17
 YOLLw+p/DMnH6PUKCAMj56YpXkGmYLaVtT4nmHQ+RkwSZgFsA0BFA3ofhNeMPk6/zaIXQ=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jPCA5-0007Oi-Sm; Thu, 16 Apr 2020 21:35:05 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jPCA5-0007w0-8L; Thu, 16 Apr 2020 21:35:05 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jPCA5-0000tB-7Y; Thu, 16 Apr 2020 21:35:05 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149685-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 149685: all pass - PUSHED
X-Osstest-Versions-This: ovmf=06033f5abad3815e8d80de22c97ba38a05017262
X-Osstest-Versions-That: ovmf=8c654bb3ec0b5232dec2b2b07234c5479eb14d62
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 16 Apr 2020 21:35:05 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

flight 149685 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149685/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 06033f5abad3815e8d80de22c97ba38a05017262
baseline version:
 ovmf                 8c654bb3ec0b5232dec2b2b07234c5479eb14d62

Last test of basis   149665  2020-04-15 01:40:25 Z    1 days
Testing same since   149685  2020-04-16 05:35:47 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Shenglei Zhang <shenglei.zhang@intel.com>

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
   8c654bb3ec..06033f5aba  06033f5abad3815e8d80de22c97ba38a05017262 -> xen-tested-master

