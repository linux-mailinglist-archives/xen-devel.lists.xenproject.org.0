Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE4C898C31
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 18:34:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700980.1094913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsQ2Z-00005k-5x; Thu, 04 Apr 2024 16:34:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700980.1094913; Thu, 04 Apr 2024 16:34:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsQ2Z-0008V9-2U; Thu, 04 Apr 2024 16:34:15 +0000
Received: by outflank-mailman (input) for mailman id 700980;
 Thu, 04 Apr 2024 16:34:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rsQ2X-0008Uz-NO; Thu, 04 Apr 2024 16:34:13 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rsQ2X-0002JF-FN; Thu, 04 Apr 2024 16:34:13 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rsQ2X-0007AU-3B; Thu, 04 Apr 2024 16:34:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rsQ2X-0008Jp-2h; Thu, 04 Apr 2024 16:34:13 +0000
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
	bh=fVvxRA5eomonLKPkPa1zGl85VqH6bZsOS0xS5x0vbCA=; b=IhcCXMR93ZdVufRvXtlZdpTm4+
	H71hAfAjuu0iD/Nz9mzHqCPR+57nyrHQl5pXOOmCO+rE16Gxod7fpoPSjlwjp3tdi0rEPhWTyoNjz
	G0LhZPwoIGoSJxOkeNn+s6kopdckE6UFrj6B435pL7+u73IWI4u1dMaIHi1mwJmC59Vo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185239-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 185239: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=6fb3cc05dc8742ddbe7ea1038dd0111aed55e799
X-Osstest-Versions-That:
    ovmf=b3871141136ac643332587f33f2e4fa78d72eb07
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 04 Apr 2024 16:34:13 +0000

flight 185239 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185239/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 6fb3cc05dc8742ddbe7ea1038dd0111aed55e799
baseline version:
 ovmf                 b3871141136ac643332587f33f2e4fa78d72eb07

Last test of basis   185223  2024-04-03 02:42:59 Z    1 days
Testing same since   185239  2024-04-04 14:44:47 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  abnchang <abnchang@amd.com>
  Abner Chang <abner.chang@amd.com>
  Nickle Wang <nicklew@nvidia.com>

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
   b387114113..6fb3cc05dc  6fb3cc05dc8742ddbe7ea1038dd0111aed55e799 -> xen-tested-master

