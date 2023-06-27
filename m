Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E713E73FC34
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 14:53:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556161.868460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE8Bd-0000AQ-UH; Tue, 27 Jun 2023 12:52:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556161.868460; Tue, 27 Jun 2023 12:52:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE8Bd-000084-RC; Tue, 27 Jun 2023 12:52:49 +0000
Received: by outflank-mailman (input) for mailman id 556161;
 Tue, 27 Jun 2023 12:52:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qE8Bc-00007u-E9; Tue, 27 Jun 2023 12:52:48 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qE8Bc-00022Z-8Q; Tue, 27 Jun 2023 12:52:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qE8Bb-0007G0-Oy; Tue, 27 Jun 2023 12:52:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qE8Bb-0003KX-OW; Tue, 27 Jun 2023 12:52:47 +0000
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
	bh=yy41MQRtGJJ1xlo9R0H6wy1cT2rD7MQ+ih/DKTdrU9Q=; b=Q3kUEbInuQYEX6jieoGXjq3gaf
	8xXiA+6Ig1BPvYJ0Jv3lbWllslujI0uuIs7R6x8JJcgCCa2hZSNQiJt5eDYP3w+sme8j7bobEBJWB
	nig4nwlhRMM39OgJIDCBDqzY2mHkjCqre77qcGJih+TrhTph6PxIg5/ByfFmbTfmPbfo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181612-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181612: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=28eb51dd54217d48869a8f02534243404308482a
X-Osstest-Versions-That:
    ovmf=81cb0371f9db299048525cfd2a96d81a5c791568
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 27 Jun 2023 12:52:47 +0000

flight 181612 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181612/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 28eb51dd54217d48869a8f02534243404308482a
baseline version:
 ovmf                 81cb0371f9db299048525cfd2a96d81a5c791568

Last test of basis   181606  2023-06-27 01:12:10 Z    0 days
Testing same since   181612  2023-06-27 10:43:49 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>
  Ray Ni <ray.ni@intel.com>

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
   81cb0371f9..28eb51dd54  28eb51dd54217d48869a8f02534243404308482a -> xen-tested-master

