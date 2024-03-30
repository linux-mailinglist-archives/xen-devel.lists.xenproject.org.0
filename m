Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D7C8928E5
	for <lists+xen-devel@lfdr.de>; Sat, 30 Mar 2024 03:25:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699501.1092276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rqOOR-0001cf-S8; Sat, 30 Mar 2024 02:24:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699501.1092276; Sat, 30 Mar 2024 02:24:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rqOOR-0001aD-Kv; Sat, 30 Mar 2024 02:24:27 +0000
Received: by outflank-mailman (input) for mailman id 699501;
 Sat, 30 Mar 2024 02:24:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rqOOQ-0001a3-JQ; Sat, 30 Mar 2024 02:24:26 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rqOOQ-00032U-BH; Sat, 30 Mar 2024 02:24:26 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rqOOQ-0004bN-1u; Sat, 30 Mar 2024 02:24:26 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rqOOQ-0006m3-1E; Sat, 30 Mar 2024 02:24:26 +0000
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
	bh=TeHFxJOEuoybWTb507mMGADTD92JDaVw3IZXw4kY6Us=; b=UhQUTEh6+8Z4gsqwxgfzzFDTBU
	4O9pSe7fNIz/JzHWpzl23RE3N/GEi7wK5d0socv22NuXmbtCju9zYGoSNddDCfqm7YMJWBzmBlnK1
	ILImNBUENQdXDatiF/RNOQ+MUHkVe5k5rCsBcoZqkUbwv321BRbxGREViqlGLAy1kpec=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185202-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 185202: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=37f63deeefa89b7ac28285bc59eca22a5c00eb92
X-Osstest-Versions-That:
    ovmf=7fde22823d64cb7b9f2a65bb87ffb7581f5ff84e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 30 Mar 2024 02:24:26 +0000

flight 185202 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185202/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 37f63deeefa89b7ac28285bc59eca22a5c00eb92
baseline version:
 ovmf                 7fde22823d64cb7b9f2a65bb87ffb7581f5ff84e

Last test of basis   185198  2024-03-29 03:14:32 Z    0 days
Testing same since   185202  2024-03-30 00:11:17 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael D Kinney <michael.d.kinney@intel.com>
  Oliver Smith-Denny <osde@linux.microsoft.com>

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
   7fde22823d..37f63deeef  37f63deeefa89b7ac28285bc59eca22a5c00eb92 -> xen-tested-master

