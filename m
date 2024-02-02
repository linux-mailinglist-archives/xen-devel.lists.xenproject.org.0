Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E270846612
	for <lists+xen-devel@lfdr.de>; Fri,  2 Feb 2024 03:53:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674772.1049932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVjgL-0000hY-8H; Fri, 02 Feb 2024 02:53:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674772.1049932; Fri, 02 Feb 2024 02:53:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVjgL-0000gL-4m; Fri, 02 Feb 2024 02:53:33 +0000
Received: by outflank-mailman (input) for mailman id 674772;
 Fri, 02 Feb 2024 02:53:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rVjgJ-0000gB-NY; Fri, 02 Feb 2024 02:53:31 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rVjgJ-0004za-KB; Fri, 02 Feb 2024 02:53:31 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rVjgH-0001zU-VS; Fri, 02 Feb 2024 02:53:30 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rVjgH-0006gN-Uw; Fri, 02 Feb 2024 02:53:29 +0000
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
	bh=H8c4Dfs5Z7PBHUHy53oxA4h0I7rmKvPoqFELopbcvxo=; b=iOq8Fype+HhVa4pAzn4oKG0yxq
	N8qUA+A8rPr0J6HRNV2R4HOqfKZzR3aU8WLLAl4JZFPNBwVFBkGrgpRmG2aayZSthfJZIHzOj07HP
	RaKF51lTzT4/57LOnA/Gpts7NUfM54ExszQPnEHjXrD4QCbK0r9QiHTTsTP+O6FLn7zA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184558-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184558: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=3656352675bf66c06b65bf85632996d3471073ae
X-Osstest-Versions-That:
    ovmf=97c3f5b8d27230acfc20f479adea64c348750612
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 02 Feb 2024 02:53:29 +0000

flight 184558 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184558/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 3656352675bf66c06b65bf85632996d3471073ae
baseline version:
 ovmf                 97c3f5b8d27230acfc20f479adea64c348750612

Last test of basis   184542  2024-01-31 13:12:38 Z    1 days
Testing same since   184558  2024-02-01 22:41:22 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  MarsX Lin <marsx.lin@intel.com>

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
   97c3f5b8d2..3656352675  3656352675bf66c06b65bf85632996d3471073ae -> xen-tested-master

