Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2214F9412E8
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 15:17:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767795.1178505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYmii-0005E9-Ve; Tue, 30 Jul 2024 13:16:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767795.1178505; Tue, 30 Jul 2024 13:16:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYmii-0005CJ-Ry; Tue, 30 Jul 2024 13:16:52 +0000
Received: by outflank-mailman (input) for mailman id 767795;
 Tue, 30 Jul 2024 13:16:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sYmih-0005C9-6w; Tue, 30 Jul 2024 13:16:51 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sYmih-00058i-0M; Tue, 30 Jul 2024 13:16:51 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sYmig-0004ya-Fn; Tue, 30 Jul 2024 13:16:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sYmig-0004Yr-FE; Tue, 30 Jul 2024 13:16:50 +0000
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
	bh=Uj+72bZUTzW8rbrydwRR+rVq+TOHb5Ee4tWTzzQMGM0=; b=v/TBnf5160F69gRUjBEKRie97A
	Ci9Wf6Cl/Wq3ctHkTLPUiX3H8+PdjHmhjUPfKfFkh0O1vmZ4lTQIuZUTtRqfYbCXb0ZKP6z72eQ1g
	XpTPkTx/wy/ZXbIbwBhOo4nemcfa+j+Vl/uEe3u/AAsy81vKQWSRO+E4JFzHAgpJm7ME=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187055-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187055: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=91a822749a6664dcaf0f67a837dcf0cd05783d17
X-Osstest-Versions-That:
    ovmf=621a30c676d55bfe0049f65e98f65104528218db
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 30 Jul 2024 13:16:50 +0000

flight 187055 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187055/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 91a822749a6664dcaf0f67a837dcf0cd05783d17
baseline version:
 ovmf                 621a30c676d55bfe0049f65e98f65104528218db

Last test of basis   187052  2024-07-30 05:45:33 Z    0 days
Testing same since   187055  2024-07-30 11:41:31 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  wilson_chen <wilson_chen@phoenix.com>

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
   621a30c676..91a822749a  91a822749a6664dcaf0f67a837dcf0cd05783d17 -> xen-tested-master

