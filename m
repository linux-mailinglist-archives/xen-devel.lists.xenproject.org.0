Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D387D8033
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 12:03:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623649.971692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvxCg-0005fl-0W; Thu, 26 Oct 2023 10:03:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623649.971692; Thu, 26 Oct 2023 10:03:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvxCf-0005e2-U5; Thu, 26 Oct 2023 10:03:01 +0000
Received: by outflank-mailman (input) for mailman id 623649;
 Thu, 26 Oct 2023 10:03:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qvxCe-0005ds-Cz; Thu, 26 Oct 2023 10:03:00 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qvxCe-0007g7-4G; Thu, 26 Oct 2023 10:03:00 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qvxCd-0008CR-Pm; Thu, 26 Oct 2023 10:02:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qvxCd-0006T3-PL; Thu, 26 Oct 2023 10:02:59 +0000
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
	bh=W5JjxNWB0oFLyKARDQqQnKxDgcVd5KD8mG3xCcg5KF4=; b=rNyahKWVpRwey/CVbRA+qtxGVZ
	GonNHZxX50DCBpj4HNCvf6jX/XEfnXb2MvFR6iIzDXPRwQKffhoMXcOwXPQB/C5uEURZPnj/4RbEr
	e841TsSNc+0+Cn4e41/Og/rSAJm5YR7f5f52UDnFk6CzJWQdjSZj5uBNo2YZRbsdZlcQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183536-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183536: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=8765f3eb428f86974033215fe08f8d3d85deedae
X-Osstest-Versions-That:
    ovmf=9bb5ef1287c6765c477fb2cb3107339f700ab419
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 26 Oct 2023 10:02:59 +0000

flight 183536 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183536/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 8765f3eb428f86974033215fe08f8d3d85deedae
baseline version:
 ovmf                 9bb5ef1287c6765c477fb2cb3107339f700ab419

Last test of basis   183532  2023-10-26 01:44:34 Z    0 days
Testing same since   183536  2023-10-26 07:44:22 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Nickle Wang <nicklew@nvidia.com>

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
   9bb5ef1287..8765f3eb42  8765f3eb428f86974033215fe08f8d3d85deedae -> xen-tested-master

