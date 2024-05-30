Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE1D8D4DC6
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 16:23:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732749.1138785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCgg2-0000SD-Ai; Thu, 30 May 2024 14:22:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732749.1138785; Thu, 30 May 2024 14:22:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCgg2-0000QE-7h; Thu, 30 May 2024 14:22:46 +0000
Received: by outflank-mailman (input) for mailman id 732749;
 Thu, 30 May 2024 14:22:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sCgg0-0000Q4-Pg; Thu, 30 May 2024 14:22:44 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sCgg0-0000UQ-Mo; Thu, 30 May 2024 14:22:44 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sCgg0-0002CD-Dr; Thu, 30 May 2024 14:22:44 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sCgg0-0000E8-DL; Thu, 30 May 2024 14:22:44 +0000
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
	bh=tEcqv9bbN5aufUk6pWsqWUBBHGjpbnzGp7px5quZ9E8=; b=1IAvLfLiE8JKhm2w+SwHHt01i8
	tnhl7zQwntfAhk1NnIe5345QVVyGtPHvxJWcC2PmfypXSQC06uvU+1cel8ksMCYArIFRixp/n1NUt
	8suF3SpnaRDd+8R/x/N1eyRj+D7fcZobvsL3XUOZyNSW0AD0B2/28RrD2IrgrSUVofrA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186198-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186198: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=9518d77eb869034a141799b3d28cac20ecb60fe0
X-Osstest-Versions-That:
    ovmf=c695e3182aa7497833f1b0fc69f6776fec8cb8cf
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 30 May 2024 14:22:44 +0000

flight 186198 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186198/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 9518d77eb869034a141799b3d28cac20ecb60fe0
baseline version:
 ovmf                 c695e3182aa7497833f1b0fc69f6776fec8cb8cf

Last test of basis   186195  2024-05-30 09:41:11 Z    0 days
Testing same since   186198  2024-05-30 12:41:14 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Du Lin <du.lin@intel.com>

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
   c695e3182a..9518d77eb8  9518d77eb869034a141799b3d28cac20ecb60fe0 -> xen-tested-master

