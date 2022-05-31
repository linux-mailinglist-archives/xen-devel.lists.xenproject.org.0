Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C9F538AE3
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 07:31:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339107.563928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvuTa-00080a-Ap; Tue, 31 May 2022 05:31:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339107.563928; Tue, 31 May 2022 05:31:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvuTa-0007yW-6C; Tue, 31 May 2022 05:31:30 +0000
Received: by outflank-mailman (input) for mailman id 339107;
 Tue, 31 May 2022 05:31:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nvuTZ-0007yM-4b; Tue, 31 May 2022 05:31:29 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nvuTZ-0003bK-3c; Tue, 31 May 2022 05:31:29 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nvuTY-0005Yf-Pm; Tue, 31 May 2022 05:31:28 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nvuTY-0006PB-PH; Tue, 31 May 2022 05:31:28 +0000
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
	bh=kQi6YH7XagAtMArvwlZ6bGioOstH3xSEXTG+e6xXPEc=; b=iT66UH2ODhXMo7S1XA9dvV/IrZ
	0vIPiWpoIH4ElGtsv6zKvMc7AWldooTHsgifKGcjy4SQrGiQLA2Fezd9BmLi19nXjNQ/k2/OuHyQt
	m1xycn5lJPyjzfXSUVz3uabnUeZF4RsBgoFhkpS+oDNF6SWUa+C+u7Z8riLwhdug9YkI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-170781-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 170781: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=fa2b212d61dfeb9c00a174280a73a4f573ef617d
X-Osstest-Versions-That:
    ovmf=3ca7326b37c5d20d9473f47266074e61ea384c5b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 31 May 2022 05:31:28 +0000

flight 170781 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/170781/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 fa2b212d61dfeb9c00a174280a73a4f573ef617d
baseline version:
 ovmf                 3ca7326b37c5d20d9473f47266074e61ea384c5b

Last test of basis   170776  2022-05-30 11:14:13 Z    0 days
Testing same since   170781  2022-05-31 02:10:26 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Loo Tung Lun <tung.lun.loo@intel.com>
  Loo, Tung Lun <tung.lun.loo@intel.com>

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
   3ca7326b37..fa2b212d61  fa2b212d61dfeb9c00a174280a73a4f573ef617d -> xen-tested-master

