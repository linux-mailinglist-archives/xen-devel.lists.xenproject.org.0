Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 236CE44523A
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 12:31:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221449.383166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miaxQ-0006qf-OC; Thu, 04 Nov 2021 11:31:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221449.383166; Thu, 04 Nov 2021 11:31:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miaxQ-0006oQ-J9; Thu, 04 Nov 2021 11:31:00 +0000
Received: by outflank-mailman (input) for mailman id 221449;
 Thu, 04 Nov 2021 11:30:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1miaxO-0006oG-S0; Thu, 04 Nov 2021 11:30:58 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1miaxO-0002aZ-EW; Thu, 04 Nov 2021 11:30:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1miaxO-0005yg-6n; Thu, 04 Nov 2021 11:30:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1miaxO-0005Qh-6H; Thu, 04 Nov 2021 11:30:58 +0000
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
	bh=6SPv2Erm8oz7lVH4brsJB0LyeGjYV3f8K48zaXfr1u4=; b=piM1y3WPjCyQGc4qxMks8DDjMn
	yrt/aNYKssYHSsMTRG37qsq9JblCsy+PPd2slBIMEsJDnP5S8fhVYnPDLTm5B/NQc5csn8EEp6bOv
	K83+q1xEufJNCjW7YCRdTYDsr/bH4AYXoit4Tn/Q4SFbZxej/mGyI8Z24XJsoqauS9Vc=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-166042-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 166042: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b258f12889c09555e99c9cebf56dba45190c5dc2
X-Osstest-Versions-That:
    ovmf=6f9e83f757ed7c5c78d071f475b2e72d899c2aef
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 04 Nov 2021 11:30:58 +0000

flight 166042 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/166042/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b258f12889c09555e99c9cebf56dba45190c5dc2
baseline version:
 ovmf                 6f9e83f757ed7c5c78d071f475b2e72d899c2aef

Last test of basis   166035  2021-11-03 21:40:06 Z    0 days
Testing same since   166042  2021-11-04 06:02:12 Z    0 days    1 attempts

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
   6f9e83f757..b258f12889  b258f12889c09555e99c9cebf56dba45190c5dc2 -> xen-tested-master

