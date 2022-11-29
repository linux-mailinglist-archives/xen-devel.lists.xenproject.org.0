Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8374F63CB8A
	for <lists+xen-devel@lfdr.de>; Wed, 30 Nov 2022 00:01:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449678.706574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p09aH-0007Vg-Vb; Tue, 29 Nov 2022 23:00:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449678.706574; Tue, 29 Nov 2022 23:00:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p09aH-0007SM-S8; Tue, 29 Nov 2022 23:00:13 +0000
Received: by outflank-mailman (input) for mailman id 449678;
 Tue, 29 Nov 2022 23:00:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p09aG-0007Qf-4C; Tue, 29 Nov 2022 23:00:12 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p09aF-00039r-VI; Tue, 29 Nov 2022 23:00:11 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p09aF-0004u6-Kc; Tue, 29 Nov 2022 23:00:11 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p09aF-0007MH-KA; Tue, 29 Nov 2022 23:00:11 +0000
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
	bh=XZbDTAlknhiV3OYbpCa1lvokiswmM18NH0LPC8EvNDU=; b=1BLMacGMKLSI0sGPv9WPyO3pUO
	q4ylD+m2W9+TOfPqCEOYUqvDffuSWt3COjnrzHSTAJgl+91ATj7OqX0qHkPPkoTQQ1nmcem5bs2fw
	IIl3wu1GEOBjZhbNEnuE3rkhglXay33vD01/PLGErzsWrzBJ5zw7mFWK70P+R5mO+z8U=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-174990-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 174990: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=8aff08c817728092fda5707ae27cfa6321108980
X-Osstest-Versions-That:
    ovmf=b92e0495221a3b298b069d9fb01e48fd2a0469f6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 29 Nov 2022 23:00:11 +0000

flight 174990 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/174990/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 8aff08c817728092fda5707ae27cfa6321108980
baseline version:
 ovmf                 b92e0495221a3b298b069d9fb01e48fd2a0469f6

Last test of basis   174987  2022-11-29 10:13:15 Z    0 days
Testing same since   174990  2022-11-29 19:40:43 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Rebecca Cran <rebecca@quicinc.com>

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
   b92e049522..8aff08c817  8aff08c817728092fda5707ae27cfa6321108980 -> xen-tested-master

