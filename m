Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E8493A496
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 18:52:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763406.1173683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWIkB-0001fB-K5; Tue, 23 Jul 2024 16:52:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763406.1173683; Tue, 23 Jul 2024 16:52:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWIkB-0001dG-GE; Tue, 23 Jul 2024 16:52:07 +0000
Received: by outflank-mailman (input) for mailman id 763406;
 Tue, 23 Jul 2024 16:52:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sWIkA-0001d0-3V; Tue, 23 Jul 2024 16:52:06 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sWIk9-00033a-St; Tue, 23 Jul 2024 16:52:05 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sWIk9-0003VX-HG; Tue, 23 Jul 2024 16:52:05 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sWIk9-0001fv-Go; Tue, 23 Jul 2024 16:52:05 +0000
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
	bh=cweZSOBnoAXHWxQbRUtplqb+zb/4KiKpDVnRzhzyRwI=; b=yCaQSeV6hi3HVs+aL6m47P1t4M
	kHxLfKgZZc0NsLMCADJS8snMpStLLSmsmKdldyUlNuo7XdW7T4o+acuUKdlgG+5ksjultMTWG3+kF
	rGdND65J+CkHP0mnfYILYzXEzUNvdvWZZrL9Rv6gyFtB2ORMLHRAsWQRDg1k4rOakndk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186968-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186968: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=da591416ee8fddb1b691d157e3c61bdc7a994b79
X-Osstest-Versions-That:
    ovmf=f96298d75cebfe2a7707157ed644eb86bf6d46ca
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 23 Jul 2024 16:52:05 +0000

flight 186968 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186968/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 da591416ee8fddb1b691d157e3c61bdc7a994b79
baseline version:
 ovmf                 f96298d75cebfe2a7707157ed644eb86bf6d46ca

Last test of basis   186964  2024-07-23 11:11:30 Z    0 days
Testing same since   186968  2024-07-23 15:13:13 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Oliver Smith-Denny <osde@linux.microsoft.com>

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
   f96298d75c..da591416ee  da591416ee8fddb1b691d157e3c61bdc7a994b79 -> xen-tested-master

