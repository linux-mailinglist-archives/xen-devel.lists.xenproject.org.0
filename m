Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 717879887B0
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 16:58:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806356.1217688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suCPP-0008OU-6P; Fri, 27 Sep 2024 14:57:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806356.1217688; Fri, 27 Sep 2024 14:57:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suCPP-0008Lg-3N; Fri, 27 Sep 2024 14:57:27 +0000
Received: by outflank-mailman (input) for mailman id 806356;
 Fri, 27 Sep 2024 14:57:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1suCPN-0008BZ-GO; Fri, 27 Sep 2024 14:57:25 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1suCPN-00035S-5m; Fri, 27 Sep 2024 14:57:25 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1suCPM-0002x5-Sb; Fri, 27 Sep 2024 14:57:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1suCPM-0003JX-SD; Fri, 27 Sep 2024 14:57:24 +0000
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
	bh=zNNpkqBHT/CoSqo6MKnJPWLxUrCyzaV/U4xR9tgEM5Q=; b=LUc05snLjTaCZ//0fLYFH0hfV1
	ZH4Wyfe7x/D5q2OHk9yGqnITw/bXTjN/FvnHXJb8N0Fe/CvRh/DMO+5aZMGCSCeFF2agpAi/R8Jlb
	hyAjm1Hg7rL5gQV11EjfTsWtLsgwecwzXsW2xBPyFKqsk2e69a5ntZcUazQxjlC/yheY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187877-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187877: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ded3ae2cf4ba974313f8ab043f610b1e6d3ddcdc
X-Osstest-Versions-That:
    ovmf=fe93b3745f13d7eb891d9666debf2689a8975e5b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 27 Sep 2024 14:57:24 +0000

flight 187877 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187877/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ded3ae2cf4ba974313f8ab043f610b1e6d3ddcdc
baseline version:
 ovmf                 fe93b3745f13d7eb891d9666debf2689a8975e5b

Last test of basis   187874  2024-09-27 07:43:20 Z    0 days
Testing same since   187877  2024-09-27 13:13:17 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Leif Lindholm <quic_llindhol@quicinc.com>

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
   fe93b3745f..ded3ae2cf4  ded3ae2cf4ba974313f8ab043f610b1e6d3ddcdc -> xen-tested-master

