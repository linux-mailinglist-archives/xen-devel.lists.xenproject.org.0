Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0904789D526
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 11:11:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702189.1097064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ru7Uu-0003pI-98; Tue, 09 Apr 2024 09:10:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702189.1097064; Tue, 09 Apr 2024 09:10:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ru7Uu-0003nE-50; Tue, 09 Apr 2024 09:10:32 +0000
Received: by outflank-mailman (input) for mailman id 702189;
 Tue, 09 Apr 2024 09:10:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ru7Us-0003n4-9N; Tue, 09 Apr 2024 09:10:30 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ru7Us-0004PB-2Z; Tue, 09 Apr 2024 09:10:30 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ru7Ur-0003JZ-LM; Tue, 09 Apr 2024 09:10:29 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ru7Ur-0003ik-Kp; Tue, 09 Apr 2024 09:10:29 +0000
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
	bh=ueg55v72evJZUOCeoKb0beKUzZ/Xo8C5SskIv2+ot+8=; b=SMNRMvAmZQ05yJVtDMMUyrQDim
	9MVJDXJZAcRZ3H3uw5yJhAX4v+TyOIjWZZwmTo5HUVHKgo9oLonejf6G2lRUU+EArVwbMj43cmS7U
	muafIUF4v8m/il63Sd5sIsBH5iYOA3ICK1sXGhiQ8fBXewpqS+eVUT0tiM4OGUcoekWY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185280-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 185280: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=932db9df0caa26daca4edf133fb2aed7b4a9193e
X-Osstest-Versions-That:
    ovmf=b7f8779fe1f60113fdaab3b2f3f17c9f900b0456
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 09 Apr 2024 09:10:29 +0000

flight 185280 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185280/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 932db9df0caa26daca4edf133fb2aed7b4a9193e
baseline version:
 ovmf                 b7f8779fe1f60113fdaab3b2f3f17c9f900b0456

Last test of basis   185272  2024-04-08 06:12:54 Z    1 days
Testing same since   185280  2024-04-09 07:11:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aaron Li <aaron.li@intel.com>

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
   b7f8779fe1..932db9df0c  932db9df0caa26daca4edf133fb2aed7b4a9193e -> xen-tested-master

