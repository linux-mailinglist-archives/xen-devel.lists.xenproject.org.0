Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 366137A57E0
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 05:27:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604298.941578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiRNe-00026g-0e; Tue, 19 Sep 2023 03:26:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604298.941578; Tue, 19 Sep 2023 03:26:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiRNd-00023x-SN; Tue, 19 Sep 2023 03:26:29 +0000
Received: by outflank-mailman (input) for mailman id 604298;
 Tue, 19 Sep 2023 03:26:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qiRNc-00023n-Eu; Tue, 19 Sep 2023 03:26:28 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qiRNc-0004eu-9p; Tue, 19 Sep 2023 03:26:28 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qiRNb-0001vI-NZ; Tue, 19 Sep 2023 03:26:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qiRNb-00063L-NB; Tue, 19 Sep 2023 03:26:27 +0000
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
	bh=EsbbOe/M3jIN3y/AimQmZXkjx/X47E57geZVuMBmubE=; b=jsKeJInw2y9DpyjeHFNWiDiEz/
	AfVgPA3ymwXn7AOoQ1rwc7mncPIhfp2uXkhIK1NKa2xiAegLITRvHl8SKnSroJvlRzvLgmbsEFAm+
	Oc80RtOwzXrqBQSDXLVRHLZMCfssnct1MaMhDodpTRhEzxAnt2e0JrhOy5A5MieDDujA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183041-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183041: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=cbcf0428e83bbe8314de47207072b3b4f1557dc6
X-Osstest-Versions-That:
    ovmf=408e4631359d3e67633b36f6adf9a13a7cc573d3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 19 Sep 2023 03:26:27 +0000

flight 183041 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183041/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 cbcf0428e83bbe8314de47207072b3b4f1557dc6
baseline version:
 ovmf                 408e4631359d3e67633b36f6adf9a13a7cc573d3

Last test of basis   183037  2023-09-18 21:41:56 Z    0 days
Testing same since   183041  2023-09-19 01:40:54 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Michael Kubacki <michael.kubacki@microsoft.com>
  Sami Mujawar <sami.mujawar@arm.com>

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
   408e463135..cbcf0428e8  cbcf0428e83bbe8314de47207072b3b4f1557dc6 -> xen-tested-master

