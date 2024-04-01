Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C54E089381D
	for <lists+xen-devel@lfdr.de>; Mon,  1 Apr 2024 07:41:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.699828.1092371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrAP2-000229-GF; Mon, 01 Apr 2024 05:40:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699828.1092371; Mon, 01 Apr 2024 05:40:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrAP2-00020c-Bw; Mon, 01 Apr 2024 05:40:16 +0000
Received: by outflank-mailman (input) for mailman id 699828;
 Mon, 01 Apr 2024 05:40:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rrAP1-00020S-4A; Mon, 01 Apr 2024 05:40:15 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rrAP0-000593-Me; Mon, 01 Apr 2024 05:40:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rrAP0-0007dX-Bv; Mon, 01 Apr 2024 05:40:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rrAP0-0005ZL-6E; Mon, 01 Apr 2024 05:40:14 +0000
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
	bh=ydQxrT/LeFmofPOZvcDjSNWJr3IdJtgVaeVHBZItikk=; b=b3ZqCDrCgVOK5j1xpNw5Wsez+K
	hGc4UcLmmL1JURMnq/2DTzfUFJ3CHoTkohQaIHKF712Bl5DL/D3ZB6IvIRRAnF2TJRWyy2f8Aky0p
	B1daI25O3jr1Q1LPmaNlgPIInFvUGzjwBIxPaeu+AcxoRAXoL5AOVa4MaW20Tkw8vGRk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185212-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 185212: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=8f698f0a646124ede518d3e255ef725de1239639
X-Osstest-Versions-That:
    ovmf=37f63deeefa89b7ac28285bc59eca22a5c00eb92
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 01 Apr 2024 05:40:14 +0000

flight 185212 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185212/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 8f698f0a646124ede518d3e255ef725de1239639
baseline version:
 ovmf                 37f63deeefa89b7ac28285bc59eca22a5c00eb92

Last test of basis   185202  2024-03-30 00:11:17 Z    2 days
Testing same since   185212  2024-04-01 03:13:04 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Hou, Wenxing <wenxing.hou@intel.com>
  Wenxing Hou <wenxing.hou@intel.com>

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
   37f63deeef..8f698f0a64  8f698f0a646124ede518d3e255ef725de1239639 -> xen-tested-master

