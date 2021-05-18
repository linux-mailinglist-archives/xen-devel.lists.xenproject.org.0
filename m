Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B4B387DE2
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 18:49:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129472.243017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj2u5-000746-G5; Tue, 18 May 2021 16:49:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129472.243017; Tue, 18 May 2021 16:49:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj2u5-00072A-9V; Tue, 18 May 2021 16:49:09 +0000
Received: by outflank-mailman (input) for mailman id 129472;
 Tue, 18 May 2021 16:49:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lj2u3-000720-SW; Tue, 18 May 2021 16:49:07 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lj2u3-0007YC-Ms; Tue, 18 May 2021 16:49:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lj2u3-0007HG-Et; Tue, 18 May 2021 16:49:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lj2u3-0004h7-EL; Tue, 18 May 2021 16:49:07 +0000
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
	bh=KQmanFUYe+sEA3RrhVRoilHE3Okr3/OVHXU5Pa4X1Gg=; b=1tosUs4qd9B1Ts3brRXBmXmYM4
	QcBcK5HeomyZwHCvO+KX7e0zvbGSMuLAiZAAolJqDbkJhYRuTNYEfiqbw/+25YYoa3m+7gWtdsSgO
	Ywn48RNRps2y6SZJaibFf0xTwRvLfA4sJX/WgtthqlMIDV2wfNc5vLn6yaBspVK/u3iU=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-162002-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 162002: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=29e300ff815283259e81822ed3cb926bb9ad6460
X-Osstest-Versions-That:
    ovmf=1fbf5e30ae8eb725f4e10984f7b0a208f78abbd0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 18 May 2021 16:49:07 +0000

flight 162002 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/162002/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 29e300ff815283259e81822ed3cb926bb9ad6460
baseline version:
 ovmf                 1fbf5e30ae8eb725f4e10984f7b0a208f78abbd0

Last test of basis   161987  2021-05-18 01:10:06 Z    0 days
Testing same since   162002  2021-05-18 08:10:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
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
   1fbf5e30ae..29e300ff81  29e300ff815283259e81822ed3cb926bb9ad6460 -> xen-tested-master

