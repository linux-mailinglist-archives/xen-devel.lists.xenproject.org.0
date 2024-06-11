Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECF3903AB7
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 13:44:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738312.1145035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGzv3-0007Vi-Or; Tue, 11 Jun 2024 11:44:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738312.1145035; Tue, 11 Jun 2024 11:44:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGzv3-0007TD-Lh; Tue, 11 Jun 2024 11:44:05 +0000
Received: by outflank-mailman (input) for mailman id 738312;
 Tue, 11 Jun 2024 11:44:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sGzv2-0007T3-51; Tue, 11 Jun 2024 11:44:04 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sGzv2-0001AS-2H; Tue, 11 Jun 2024 11:44:04 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sGzv1-000345-Nz; Tue, 11 Jun 2024 11:44:03 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sGzv1-00023Z-NW; Tue, 11 Jun 2024 11:44:03 +0000
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
	bh=yCr2rT8ZXeOVa77VB0nxw3XwH39CsXCRt3lORMldAnQ=; b=4/M9xQODDKsyWqb59dmzQOaioT
	1i9PZQPYMpKY55kPxZzIPmgK1viNfap9qQAp+WLpDulBZ/4z2LpiHWyptjdW9//hVG//ifrjU8GmW
	zsjn7McWaVWhdTUMlTKF45xfPK0x+HPeRtbp8oHw7JCyuMACwa5h/aCta1x8B9GTgRls=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186309-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186309: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=0982da4f50279bfb2be479f97821b86feb87c336
X-Osstest-Versions-That:
    ovmf=6d15276ceddd2bf05995ee2efa86316fca1cd73a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 11 Jun 2024 11:44:03 +0000

flight 186309 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186309/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 0982da4f50279bfb2be479f97821b86feb87c336
baseline version:
 ovmf                 6d15276ceddd2bf05995ee2efa86316fca1cd73a

Last test of basis   186306  2024-06-10 16:12:57 Z    0 days
Testing same since   186309  2024-06-11 09:43:10 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dhaval <dhaval@rivosinc.com>
  Dhaval Sharma <dhaval@rivosinc.com>

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
   6d15276ced..0982da4f50  0982da4f50279bfb2be479f97821b86feb87c336 -> xen-tested-master

