Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C00984EAB2
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 22:39:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678494.1055853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYC6l-0008Ak-BH; Thu, 08 Feb 2024 21:38:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678494.1055853; Thu, 08 Feb 2024 21:38:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYC6l-00089D-8C; Thu, 08 Feb 2024 21:38:59 +0000
Received: by outflank-mailman (input) for mailman id 678494;
 Thu, 08 Feb 2024 21:38:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rYC6j-000893-SK; Thu, 08 Feb 2024 21:38:57 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rYC6j-000866-RV; Thu, 08 Feb 2024 21:38:57 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rYC6j-0000yv-ED; Thu, 08 Feb 2024 21:38:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rYC6j-0008JA-Ds; Thu, 08 Feb 2024 21:38:57 +0000
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
	bh=Bo6YdMn6yUx7q/Y0AssrLCFCCeqiXzJCsSV+hzylBJ8=; b=xyxlgaFWm5jDR9qdgFx8M8S7S0
	z9mtz6nOts0KtfuTrJDe6oMgbCfHihnm4OI+V43BAuIIOwSDljezzh6h4G7XpFJIxcTXlphLwvh7V
	zzQVxAxZ4zhmoixXIseCZlS/cdy9pkev05ZebVzce/q9XMQLM2NuqJ20by8cAJF1zwC8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184629-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184629: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=e32b58ab5a12d37c82327f28376e7d12cccc8b3a
X-Osstest-Versions-That:
    ovmf=8f316e99ec8de9dea294f6751dd7457f9f1a828c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 08 Feb 2024 21:38:57 +0000

flight 184629 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184629/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e32b58ab5a12d37c82327f28376e7d12cccc8b3a
baseline version:
 ovmf                 8f316e99ec8de9dea294f6751dd7457f9f1a828c

Last test of basis   184623  2024-02-08 04:13:04 Z    0 days
Testing same since   184629  2024-02-08 19:43:01 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ashraf Ali S <ashraf.ali.s@intel.com>

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
   8f316e99ec..e32b58ab5a  e32b58ab5a12d37c82327f28376e7d12cccc8b3a -> xen-tested-master

