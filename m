Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2ECF7FEBBE
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 10:20:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644494.1005567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8dDN-0002h9-6V; Thu, 30 Nov 2023 09:20:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644494.1005567; Thu, 30 Nov 2023 09:20:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8dDN-0002fA-2g; Thu, 30 Nov 2023 09:20:09 +0000
Received: by outflank-mailman (input) for mailman id 644494;
 Thu, 30 Nov 2023 09:20:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r8dDL-0002a6-I2; Thu, 30 Nov 2023 09:20:07 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r8dDL-0001nm-4o; Thu, 30 Nov 2023 09:20:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r8dDK-0006Bk-Hk; Thu, 30 Nov 2023 09:20:06 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1r8dDK-0005Ok-HL; Thu, 30 Nov 2023 09:20:06 +0000
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
	bh=nglMH4OlpMnzzf5hVL6oRZ92P7UVJnJx3VyZ/7f/WPc=; b=WDvxCdrtSEiy8uBbL3KdhC9ImN
	VCfmsGdrscpNxi2pDO9oNqPWjzsw83tnfaL9q/hdyIdiRkTpT0C1q87cnVmCKTL3Zx9y1tnKLkNWz
	I6Ko2/k2tR/PGLFyYmWVJTWffSKpxXPTz0vbBV8hHc0bzAX6DJib34olGpU1GiV09BAg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183946-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183946: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b4f8c75e316e74750d5806b8ebf2bd11a3d62626
X-Osstest-Versions-That:
    ovmf=59b6b5059b90883abfcbd906c411e8f59ac1aa0d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 30 Nov 2023 09:20:06 +0000

flight 183946 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183946/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b4f8c75e316e74750d5806b8ebf2bd11a3d62626
baseline version:
 ovmf                 59b6b5059b90883abfcbd906c411e8f59ac1aa0d

Last test of basis   183945  2023-11-30 05:11:04 Z    0 days
Testing same since   183946  2023-11-30 07:41:01 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Mike Maslenkin <mike.maslenkin@gmail.com>

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
   59b6b5059b..b4f8c75e31  b4f8c75e316e74750d5806b8ebf2bd11a3d62626 -> xen-tested-master

