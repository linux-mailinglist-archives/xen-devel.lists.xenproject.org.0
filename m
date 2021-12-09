Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC04C46E421
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 09:26:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242769.419852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvEjg-0002zv-VM; Thu, 09 Dec 2021 08:25:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242769.419852; Thu, 09 Dec 2021 08:25:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvEjg-0002x4-Ra; Thu, 09 Dec 2021 08:25:04 +0000
Received: by outflank-mailman (input) for mailman id 242769;
 Thu, 09 Dec 2021 08:25:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mvEjf-0002wu-3a; Thu, 09 Dec 2021 08:25:03 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mvEje-0004vz-UZ; Thu, 09 Dec 2021 08:25:02 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mvEje-0005OG-MH; Thu, 09 Dec 2021 08:25:02 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mvEje-0000FT-Lp; Thu, 09 Dec 2021 08:25:02 +0000
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
	bh=ONiIzZsplj6DoiHkSsczJ6qSC0mLQTHouPcL/aWGpGw=; b=K8MaCGUS/X7OlGLhj8pzzboEX2
	i9EE+atPX4hYFARZfjOf2rUGkfV5ka0Okko+wOypFgTU9x21BqMrZXz0f8b9AiOQIXTLb2+W7cwTK
	B/DndA8IbEVWsREzmDbVmrFR0MnFS2p5fOkTpDT08n3mnQlDBSnFjohM6Wm7yvbxPyCA=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-167239-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 167239: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=c82ab4d8c148c4009e0b31d1dd2ea6f7d4aea80d
X-Osstest-Versions-That:
    ovmf=7b2831000894f3091cac633e61d9bcf3661cc44b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 09 Dec 2021 08:25:02 +0000

flight 167239 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167239/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 c82ab4d8c148c4009e0b31d1dd2ea6f7d4aea80d
baseline version:
 ovmf                 7b2831000894f3091cac633e61d9bcf3661cc44b

Last test of basis   167237  2021-12-09 01:10:49 Z    0 days
Testing same since   167239  2021-12-09 06:23:17 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Huang, Long1 <long1.huang@intel.com>
  jdzhang <jdzhang@zd-tech.com.cn>
  Long1 Huang <long1.huang@intel.com>

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
   7b28310008..c82ab4d8c1  c82ab4d8c148c4009e0b31d1dd2ea6f7d4aea80d -> xen-tested-master

