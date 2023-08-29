Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C596778BE71
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 08:30:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591936.924519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qasDU-0003dL-6H; Tue, 29 Aug 2023 06:28:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591936.924519; Tue, 29 Aug 2023 06:28:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qasDU-0003ah-2z; Tue, 29 Aug 2023 06:28:44 +0000
Received: by outflank-mailman (input) for mailman id 591936;
 Tue, 29 Aug 2023 06:28:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qasDS-0003aX-KH; Tue, 29 Aug 2023 06:28:42 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qasDS-0001aV-Ax; Tue, 29 Aug 2023 06:28:42 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qasDR-0007ST-Sc; Tue, 29 Aug 2023 06:28:41 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qasDR-0006p3-SC; Tue, 29 Aug 2023 06:28:41 +0000
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
	bh=X5iIuh/TC0VLfwnpbpgXWaxAzwqtfE+iehRBQ+hFDwM=; b=hzPYckYVDubJHvRwsqyN+D9TfN
	QiEahrrjfv6hgmWmiMl/AGw9b7KEOwRE+HBQOM7Ivv7RJQeb/0wSIjjM2iWs/JVhKw1p2PES80vrZ
	FaHLXxAvsMo5LcG2W2x9hjfl/QQzNQPPIEl7M4mXzZSBN9jRx70V46CPneeAteCS6Cg0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182549-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 182549: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=a107fcb618934ae18f29660ecf066f3c49dd875f
X-Osstest-Versions-That:
    ovmf=b1e558f6369fc85ae053e0c16ffcd600880fe78d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 29 Aug 2023 06:28:41 +0000

flight 182549 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182549/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 a107fcb618934ae18f29660ecf066f3c49dd875f
baseline version:
 ovmf                 b1e558f6369fc85ae053e0c16ffcd600880fe78d

Last test of basis   182547  2023-08-29 01:12:23 Z    0 days
Testing same since   182549  2023-08-29 03:42:40 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Nhi Pham <nhi@os.amperecomputing.com>

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
   b1e558f636..a107fcb618  a107fcb618934ae18f29660ecf066f3c49dd875f -> xen-tested-master

