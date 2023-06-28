Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2D3741ACC
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jun 2023 23:26:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556591.869239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEcg7-0007Ve-8T; Wed, 28 Jun 2023 21:26:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556591.869239; Wed, 28 Jun 2023 21:26:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEcg7-0007U7-5h; Wed, 28 Jun 2023 21:26:19 +0000
Received: by outflank-mailman (input) for mailman id 556591;
 Wed, 28 Jun 2023 21:26:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qEcg5-0007Tx-QV; Wed, 28 Jun 2023 21:26:17 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qEcg5-0006Yv-Pe; Wed, 28 Jun 2023 21:26:17 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qEcg5-0000uM-Fv; Wed, 28 Jun 2023 21:26:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qEcg5-0005mh-FT; Wed, 28 Jun 2023 21:26:17 +0000
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
	bh=CbG0fGpbJoI0J4VeophSsYB+mGvBhbINCnKKdI3QeXA=; b=vRmSEVIlgi47SAmBjLJS/+Az3F
	yiTq0lC+QHGNBQjmbeia6RXe/dyA8fDLXYhwSHgJ/tCnLfwEC7JqXVw2fjFP7ScIvMRSj4nMAyA3H
	YgjfgkWP1pfAghlPa/hibic8fTpOq9bAxaX8OsDg405bgANIBinHl+M0/HIfbcE3+vvA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181630-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181630: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=6607062e91f676db8764871e2a40ee8704e8a731
X-Osstest-Versions-That:
    ovmf=4416bf3383485d2265b8e1baca7ed9c9c04eb40b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 28 Jun 2023 21:26:17 +0000

flight 181630 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181630/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 6607062e91f676db8764871e2a40ee8704e8a731
baseline version:
 ovmf                 4416bf3383485d2265b8e1baca7ed9c9c04eb40b

Last test of basis   181622  2023-06-28 07:43:45 Z    0 days
Testing same since   181630  2023-06-28 19:40:44 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Kun Qin <kuqin@microsoft.com>

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
   4416bf3383..6607062e91  6607062e91f676db8764871e2a40ee8704e8a731 -> xen-tested-master

