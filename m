Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9A647DE1F
	for <lists+xen-devel@lfdr.de>; Thu, 23 Dec 2021 04:39:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250948.432198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0EwR-0004wI-Pi; Thu, 23 Dec 2021 03:38:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250948.432198; Thu, 23 Dec 2021 03:38:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0EwR-0004u3-MX; Thu, 23 Dec 2021 03:38:55 +0000
Received: by outflank-mailman (input) for mailman id 250948;
 Thu, 23 Dec 2021 03:38:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n0EwP-0004tt-UE; Thu, 23 Dec 2021 03:38:53 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n0EwP-0005V3-SX; Thu, 23 Dec 2021 03:38:53 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n0EwP-0000YB-JO; Thu, 23 Dec 2021 03:38:53 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1n0EwP-00009R-Is; Thu, 23 Dec 2021 03:38:53 +0000
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
	bh=x6gJ+RcOmlsHTbU4APAD7yHLngIaMeW6xVbmRE2i6Vc=; b=anOZvW4xpJZeaoN0ku7CA7QI+i
	wzBccsaJX8tz1VK0gkKfrzx+aYLa2hnFI0Jhya701EY4yI9bXVRXNclJ7oRKo6gc4yP6EN8f2e/cz
	BX/LpIVhLnxQLEhf6i+/2sn8LpTAv6eDIctmBA4ORPKFa2gbXZ7BDEfqFFGga3LxUKQA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-167522-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 167522: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ae8272ef787d80950803c521a13a308651bdc62e
X-Osstest-Versions-That:
    ovmf=9ec2cc1f3138ef9314314df29fc6ce0aa5e120b9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 23 Dec 2021 03:38:53 +0000

flight 167522 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167522/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ae8272ef787d80950803c521a13a308651bdc62e
baseline version:
 ovmf                 9ec2cc1f3138ef9314314df29fc6ce0aa5e120b9

Last test of basis   167513  2021-12-22 05:41:33 Z    0 days
Testing same since   167522  2021-12-23 01:43:08 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>

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
   9ec2cc1f31..ae8272ef78  ae8272ef787d80950803c521a13a308651bdc62e -> xen-tested-master

