Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4778838151C
	for <lists+xen-devel@lfdr.de>; Sat, 15 May 2021 04:14:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127654.239938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhjoP-0005AE-7V; Sat, 15 May 2021 02:13:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127654.239938; Sat, 15 May 2021 02:13:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhjoP-00056z-3a; Sat, 15 May 2021 02:13:53 +0000
Received: by outflank-mailman (input) for mailman id 127654;
 Sat, 15 May 2021 02:13:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lhjoN-00056p-Hc; Sat, 15 May 2021 02:13:51 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lhjoN-0004Gu-Ad; Sat, 15 May 2021 02:13:51 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lhjoN-0001G7-1g; Sat, 15 May 2021 02:13:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lhjoN-0006sz-1D; Sat, 15 May 2021 02:13:51 +0000
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
	bh=1Ka5LXLP7hMWJJnFMb0DFf2uJsLkcsJI0AOlNFufYUs=; b=BtJg53GKOxWZjCqf5o2Lj3QiGT
	e7e5k39HaxJYj/Mtu0reXMhwRwaYcWxqYs0SIfHsaNDyCHaszgsTktVO5eOw2YDmY8h1e7p0jhALM
	HrW/F5Yzod9O4Q6OWbpPDXxRUWDzcyhMRXFmw3mtlltFKhSOimpKHJcQRVhLeKzSsaFo=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161952-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 161952: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=32928415e36b3e234efb5c24143e06060a68fba3
X-Osstest-Versions-That:
    ovmf=d82c4693f8d5c6b05f40ccf351c84645201067c1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 15 May 2021 02:13:51 +0000

flight 161952 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/161952/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 32928415e36b3e234efb5c24143e06060a68fba3
baseline version:
 ovmf                 d82c4693f8d5c6b05f40ccf351c84645201067c1

Last test of basis   161949  2021-05-14 10:10:07 Z    0 days
Testing same since   161952  2021-05-14 21:40:05 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Lendacky, Thomas <thomas.lendacky@amd.com>
  Tom Lendacky <thomas.lendacky@amd.com>

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
   d82c4693f8..32928415e3  32928415e36b3e234efb5c24143e06060a68fba3 -> xen-tested-master

