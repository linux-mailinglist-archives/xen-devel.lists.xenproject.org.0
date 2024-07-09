Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 375B692BDBA
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 17:04:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756331.1164912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRCNZ-0001tX-MO; Tue, 09 Jul 2024 15:03:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756331.1164912; Tue, 09 Jul 2024 15:03:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRCNZ-0001qP-JS; Tue, 09 Jul 2024 15:03:41 +0000
Received: by outflank-mailman (input) for mailman id 756331;
 Tue, 09 Jul 2024 15:03:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sRCNX-0001qF-Ix; Tue, 09 Jul 2024 15:03:39 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sRCNX-0005wb-Fi; Tue, 09 Jul 2024 15:03:39 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sRCNX-0007U3-4c; Tue, 09 Jul 2024 15:03:39 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sRCNX-0004os-45; Tue, 09 Jul 2024 15:03:39 +0000
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
	bh=kOdS2afPtqBw0KbkJvUdz1VbsoozpIVq6JLbPoVQGLE=; b=A24661jZIQ46CM70lnQQ8SxEnJ
	Ch5a91u+HeLJaLXZRhup682oNboLgu7K4cRCf0ZPThHBAmDZOt1yLKDhz4PxcIAcFrvRKAoh2Bqa3
	8MRqGbLCcnlvkhyV9yiC1KZhQnA+OcLUC7JIZWQ28s7t3a1JstOlmAIE92VspXGDndog=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186740-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186740: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=426b69830efff788f2c17a4b920a84d6e08739c8
X-Osstest-Versions-That:
    ovmf=95a6892aacfef6c7862058fcdc495f6b35df9367
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 09 Jul 2024 15:03:39 +0000

flight 186740 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186740/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 426b69830efff788f2c17a4b920a84d6e08739c8
baseline version:
 ovmf                 95a6892aacfef6c7862058fcdc495f6b35df9367

Last test of basis   186731  2024-07-08 17:11:12 Z    0 days
Testing same since   186740  2024-07-09 13:43:04 Z    0 days    1 attempts

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
   95a6892aac..426b69830e  426b69830efff788f2c17a4b920a84d6e08739c8 -> xen-tested-master

