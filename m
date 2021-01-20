Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D14D2FDA5B
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 21:06:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71740.128726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Jjv-0003Lv-Ed; Wed, 20 Jan 2021 20:06:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71740.128726; Wed, 20 Jan 2021 20:06:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Jjv-0003LT-9a; Wed, 20 Jan 2021 20:06:03 +0000
Received: by outflank-mailman (input) for mailman id 71740;
 Wed, 20 Jan 2021 20:06:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l2Jjt-0003LL-QK; Wed, 20 Jan 2021 20:06:01 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l2Jjt-0000Gp-Gu; Wed, 20 Jan 2021 20:06:01 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l2Jjt-0000kf-6G; Wed, 20 Jan 2021 20:06:01 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l2Jjt-0007mA-5k; Wed, 20 Jan 2021 20:06:01 +0000
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
	bh=N9se7pqveW5vEKFSYCaINyEwDOGUVHhCG8h+C9vJIFI=; b=4iC9lKbv5X2ZheyHGft36F6U7V
	NRo6H6QelYU67eABKv/5LdMzJlc1YyUdqykFnV6TlviEHF9e4cyiMv5GWxbvwGExEgvFYBl1KtA3P
	erNJnhTs5BEccpnQdQwUj+TH7O6zFdEpOfJvB2P7/i1jeBYgI+dlw8Ej+icps/0qnZ88=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158541-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 158541: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ca272b9513a6de5772e6e8ef5bbecd2e23cf9fb3
X-Osstest-Versions-That:
    ovmf=6e5586863148773c15399ead249711143a74d2d0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 20 Jan 2021 20:06:01 +0000

flight 158541 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158541/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ca272b9513a6de5772e6e8ef5bbecd2e23cf9fb3
baseline version:
 ovmf                 6e5586863148773c15399ead249711143a74d2d0

Last test of basis   158531  2021-01-19 22:15:41 Z    0 days
Testing same since   158541  2021-01-20 12:39:43 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  GregX Yeh <gregx.yeh@intel.com>

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
   6e55868631..ca272b9513  ca272b9513a6de5772e6e8ef5bbecd2e23cf9fb3 -> xen-tested-master

