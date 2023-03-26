Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 761906C97B7
	for <lists+xen-devel@lfdr.de>; Sun, 26 Mar 2023 22:10:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515007.797475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgWgQ-0008Va-Iy; Sun, 26 Mar 2023 20:09:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515007.797475; Sun, 26 Mar 2023 20:09:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgWgQ-0008Sq-G2; Sun, 26 Mar 2023 20:09:42 +0000
Received: by outflank-mailman (input) for mailman id 515007;
 Sun, 26 Mar 2023 20:09:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pgWgP-0008Sf-6M; Sun, 26 Mar 2023 20:09:41 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pgWgP-0004qK-4E; Sun, 26 Mar 2023 20:09:41 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pgWgO-0001bt-OQ; Sun, 26 Mar 2023 20:09:40 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pgWgO-0004uf-Nu; Sun, 26 Mar 2023 20:09:40 +0000
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
	bh=5Elzz1jE6mGCledsb0kX9c30jLTHpJI3KO6yZOvAzXc=; b=iyMD3R59dNtTHvT1iY00wdlFz+
	93RagRCUD+JR9HqiwyfGA2xUyR6x/F/tF8Mqb1bt7Yp6FGrgI5uVyFVNYR/z3MxD10GDywZxOH7oz
	BApTRQkxj9r9i08E3hZiTPgzi55YP22sEDim8XgRg50o8fNkaSo0TR6B6L9hd7T6623U=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180006-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180006: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=2c93253c95dbbc161650dfaeccaa3d866a2e29f2
X-Osstest-Versions-That:
    ovmf=07fa6d1841abcfc58b226027d711ebb47559f442
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 26 Mar 2023 20:09:40 +0000

flight 180006 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180006/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 2c93253c95dbbc161650dfaeccaa3d866a2e29f2
baseline version:
 ovmf                 07fa6d1841abcfc58b226027d711ebb47559f442

Last test of basis   179983  2023-03-26 02:10:43 Z    0 days
Testing same since   180006  2023-03-26 17:42:11 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@amd.com>
  Isaac Oram <isaac.w.oram@intel.com>

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
   07fa6d1841..2c93253c95  2c93253c95dbbc161650dfaeccaa3d866a2e29f2 -> xen-tested-master

