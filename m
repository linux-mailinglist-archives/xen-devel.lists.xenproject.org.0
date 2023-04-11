Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B946DD716
	for <lists+xen-devel@lfdr.de>; Tue, 11 Apr 2023 11:48:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519609.806578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmAbE-0008Sy-2Z; Tue, 11 Apr 2023 09:47:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519609.806578; Tue, 11 Apr 2023 09:47:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmAbD-0008QM-VK; Tue, 11 Apr 2023 09:47:39 +0000
Received: by outflank-mailman (input) for mailman id 519609;
 Tue, 11 Apr 2023 09:47:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pmAbC-0008QC-Dw; Tue, 11 Apr 2023 09:47:38 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pmAbC-0001eW-Bx; Tue, 11 Apr 2023 09:47:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pmAbB-0000Rv-W6; Tue, 11 Apr 2023 09:47:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pmAbB-0007si-VT; Tue, 11 Apr 2023 09:47:37 +0000
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
	bh=Vxyce2jNMGY/qFEBEkuv4jDLk2/6we2Tca4ZRPSHPDw=; b=qLXVCOFUSvZ6x2qBJG1Izx3VEj
	z7O49UtdsKJn6Jl/LjkEx/ggD8gLaVIv5htGYbwNJJxvBlMaokY/EmIROgTTAsNfsZdfwX53MdI6O
	/iq8taNwS6qyHZxmNqeFpEAvcGkXo1kKA6oHE/qADjAghy8iTwwnoztqktwtYKUqe1Gs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180203-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180203: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=51734dfc48466eddfb0f8acdb24518266c36c905
X-Osstest-Versions-That:
    ovmf=61652efd04a7585a779226137d0f9739a75aac69
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 11 Apr 2023 09:47:37 +0000

flight 180203 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180203/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 51734dfc48466eddfb0f8acdb24518266c36c905
baseline version:
 ovmf                 61652efd04a7585a779226137d0f9739a75aac69

Last test of basis   180196  2023-04-10 14:40:49 Z    0 days
Testing same since   180203  2023-04-11 07:40:42 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Lin, MillerX <millerx.lin@intel.com>
  MillerX Lin <millerx.lin@intel.com>

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
   61652efd04..51734dfc48  51734dfc48466eddfb0f8acdb24518266c36c905 -> xen-tested-master

