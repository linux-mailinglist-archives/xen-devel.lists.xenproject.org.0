Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B528A7BE5
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 07:36:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707247.1105004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwxxo-0005aa-Nm; Wed, 17 Apr 2024 05:36:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707247.1105004; Wed, 17 Apr 2024 05:36:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwxxo-0005YC-KG; Wed, 17 Apr 2024 05:36:08 +0000
Received: by outflank-mailman (input) for mailman id 707247;
 Wed, 17 Apr 2024 05:36:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rwxxn-0005Y0-2H; Wed, 17 Apr 2024 05:36:07 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rwxxn-0004Sq-0Y; Wed, 17 Apr 2024 05:36:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rwxxm-0008UD-J9; Wed, 17 Apr 2024 05:36:06 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rwxxm-0005RC-Ii; Wed, 17 Apr 2024 05:36:06 +0000
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
	bh=awJZuLO4dxn1AQWRhk8Kb2P4Ca48G+Jw0TpgURcybQY=; b=x0Lo/YhwUWvOm3XvudCQfRTpjI
	cLlr97dSHn++ixh8JavTbDqvi+IDN5uBDhkII76IXtGzoKg6aeLopH61x+NM4shKcekMkDSImCKGU
	K2E6adXRrlHVxOsCPHHakCkoH1KR5x3bzVm1Vr/gIkaLzt4pYZx4JckcxvfIA8JD/bqU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185701-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 185701: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=61185f1d501512f35621d0fdc5f17503c77bf449
X-Osstest-Versions-That:
    ovmf=fcfdbe29874320e9f876baa7afebc3fca8f4a7df
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 17 Apr 2024 05:36:06 +0000

flight 185701 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185701/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 61185f1d501512f35621d0fdc5f17503c77bf449
baseline version:
 ovmf                 fcfdbe29874320e9f876baa7afebc3fca8f4a7df

Last test of basis   185671  2024-04-16 14:44:05 Z    0 days
Testing same since   185701  2024-04-17 03:13:46 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Min M Xu <min.m.xu@intel.com>
  Min Xu <min.m.xu@intel.com>

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
   fcfdbe2987..61185f1d50  61185f1d501512f35621d0fdc5f17503c77bf449 -> xen-tested-master

