Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A655A5F1D3E
	for <lists+xen-devel@lfdr.de>; Sat,  1 Oct 2022 17:43:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414565.658909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeeeH-0002OI-Pp; Sat, 01 Oct 2022 15:43:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414565.658909; Sat, 01 Oct 2022 15:43:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeeeH-0002L3-N6; Sat, 01 Oct 2022 15:43:29 +0000
Received: by outflank-mailman (input) for mailman id 414565;
 Sat, 01 Oct 2022 15:43:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oeeeG-0002Kt-QB; Sat, 01 Oct 2022 15:43:28 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oeeeG-0008UL-Mn; Sat, 01 Oct 2022 15:43:28 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oeeeG-0007FL-71; Sat, 01 Oct 2022 15:43:28 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oeeeG-00067e-6W; Sat, 01 Oct 2022 15:43:28 +0000
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
	bh=/GLcrzfVxswKWY3GjmrsFXi3bO64HRRO7nIRL0/mVZQ=; b=BcGJ8HclMAidXWgcwBGB0Cr9S0
	8CUc0Y8J11hHrTyys38WBixiovBz0U668OnyCpG/wmCPF/Nzs22UIBbYXXxa+WaoWLUOYBAs+HfaI
	Sp1/7lAAr8uKjAXnrMhga7yh8RkwBz12y4VRFKgsonEUHm+0LU1SCrczc7vwu9dUpK18=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173396-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 173396: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=6a2b20ff97e4256970644a07f74a4c5655bf5072
X-Osstest-Versions-That:
    ovmf=7aa06237b856fd6f8187cc1715a3fe08ab4e98ed
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 01 Oct 2022 15:43:28 +0000

flight 173396 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/173396/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 6a2b20ff97e4256970644a07f74a4c5655bf5072
baseline version:
 ovmf                 7aa06237b856fd6f8187cc1715a3fe08ab4e98ed

Last test of basis   173393  2022-10-01 06:14:08 Z    0 days
Testing same since   173396  2022-10-01 11:42:04 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jeff Brasen <jbrasen@nvidia.com>
  Jeff Brasen via groups.io <jbrasen=nvidia.com@groups.io>
  Liming Gao <gaoliming@byosoft.com.cn>

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
   7aa06237b8..6a2b20ff97  6a2b20ff97e4256970644a07f74a4c5655bf5072 -> xen-tested-master

