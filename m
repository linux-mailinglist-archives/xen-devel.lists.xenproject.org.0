Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E68A28A0DC
	for <lists+xen-devel@lfdr.de>; Sat, 10 Oct 2020 18:04:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5470.14258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRHLS-0000nx-H9; Sat, 10 Oct 2020 16:03:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5470.14258; Sat, 10 Oct 2020 16:03:42 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRHLS-0000nY-E8; Sat, 10 Oct 2020 16:03:42 +0000
Received: by outflank-mailman (input) for mailman id 5470;
 Sat, 10 Oct 2020 16:03:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cL7A=DR=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kRHLR-0000nT-KX
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2020 16:03:41 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c756dfa-3900-4875-a37d-3cfd0724c35a;
 Sat, 10 Oct 2020 16:03:40 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kRHLQ-0007tN-7M; Sat, 10 Oct 2020 16:03:40 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kRHLP-0008LW-WA; Sat, 10 Oct 2020 16:03:40 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kRHLP-0005bp-Vh; Sat, 10 Oct 2020 16:03:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=cL7A=DR=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kRHLR-0000nT-KX
	for xen-devel@lists.xenproject.org; Sat, 10 Oct 2020 16:03:41 +0000
X-Inumbo-ID: 7c756dfa-3900-4875-a37d-3cfd0724c35a
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 7c756dfa-3900-4875-a37d-3cfd0724c35a;
	Sat, 10 Oct 2020 16:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=V2QuOCLIfQN8+/qjq/Pt98rY5I9UAEyTuc84t1aug18=; b=jD1Ud9JOHMzOrPHObQYj1K6TZh
	lrWJTDvdnumBvzg7SVvG5TvQUx5KYV5zROBwxtYfCXpu+zbhDqwwT4RsX5XogE1tdl6HoEm4n2OFA
	eXDWn3Q+e0tfK+YnyPtCoQTy9daC5ZsyeGqXtW6jCHYKKflXf6ZH9F8LIkPtsn9jxbrk=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kRHLQ-0007tN-7M; Sat, 10 Oct 2020 16:03:40 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kRHLP-0008LW-WA; Sat, 10 Oct 2020 16:03:40 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kRHLP-0005bp-Vh; Sat, 10 Oct 2020 16:03:39 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-155643-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 155643: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ae511331e0fb1625ba649f377e81e487de3a5531
X-Osstest-Versions-That:
    ovmf=70c2f10fde5b67b0d7d62ba7ea3271fc514ebcc4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 10 Oct 2020 16:03:39 +0000

flight 155643 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/155643/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ae511331e0fb1625ba649f377e81e487de3a5531
baseline version:
 ovmf                 70c2f10fde5b67b0d7d62ba7ea3271fc514ebcc4

Last test of basis   155617  2020-10-09 21:42:06 Z    0 days
Testing same since   155643  2020-10-10 08:15:18 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  gaoliming <gaoliming@byosoft.com.cn>
  Garrett Kirkendall <garrett.kirkendall@amd.com>
  Liming Gao <gaoliming@byosoft.com.cn>
  Malgorzata Kukiello <jacek.kukiello@intel.com>
  Sanyo Wang <sanyo.wang@intel.com>
  Wang, Sanyo <sanyo.wang@intel.com>

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
   70c2f10fde..ae511331e0  ae511331e0fb1625ba649f377e81e487de3a5531 -> xen-tested-master

