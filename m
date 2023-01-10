Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DD3663BDB
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 09:54:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474420.735590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFANg-0005Na-2H; Tue, 10 Jan 2023 08:53:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474420.735590; Tue, 10 Jan 2023 08:53:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFANf-0005Kh-Uu; Tue, 10 Jan 2023 08:53:15 +0000
Received: by outflank-mailman (input) for mailman id 474420;
 Tue, 10 Jan 2023 08:53:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pFANd-0005KI-K4; Tue, 10 Jan 2023 08:53:13 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pFANd-0000jv-IQ; Tue, 10 Jan 2023 08:53:13 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pFANd-0007aC-BQ; Tue, 10 Jan 2023 08:53:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pFANd-0007s9-B1; Tue, 10 Jan 2023 08:53:13 +0000
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
	bh=hvMd7o/GEpMrztcOZ57Yr3bQ4vz6nPLHEKgbykUzC+8=; b=GKCiIGZmGY5+yKFGlroQBriXwa
	CaBuHfDuqB8SbQduIlb3lYd7VT17ZMeEo6I8E0odooUJT9Qu7Cg1x0R2EjuMm0Y96gL7KkM6wUnFP
	5EI4rNXV2ksQ2IxeIU+08prxWQ2c0UsHZF10rBhcPiqGjHC95g5BbLsY7v7ruUsWLllE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175686-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175686: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=82dd766f25225b0812bbac628c60d2b48f2346e4
X-Osstest-Versions-That:
    ovmf=2cc6d4c8ed54e36fd9638dafdb293dd9a4c54cf9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 10 Jan 2023 08:53:13 +0000

flight 175686 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175686/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 82dd766f25225b0812bbac628c60d2b48f2346e4
baseline version:
 ovmf                 2cc6d4c8ed54e36fd9638dafdb293dd9a4c54cf9

Last test of basis   175683  2023-01-10 04:10:46 Z    0 days
Testing same since   175686  2023-01-10 06:40:46 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Chao Li <lichao@loongson.cn>

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
   2cc6d4c8ed..82dd766f25  82dd766f25225b0812bbac628c60d2b48f2346e4 -> xen-tested-master

