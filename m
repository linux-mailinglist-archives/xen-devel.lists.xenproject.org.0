Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 806299A1327
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 22:04:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820308.1233760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1AFT-00044W-Qj; Wed, 16 Oct 2024 20:03:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820308.1233760; Wed, 16 Oct 2024 20:03:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1AFT-00042M-Ns; Wed, 16 Oct 2024 20:03:59 +0000
Received: by outflank-mailman (input) for mailman id 820308;
 Wed, 16 Oct 2024 20:03:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t1AFS-00042A-Gc; Wed, 16 Oct 2024 20:03:58 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t1AFS-0003Mo-Ed; Wed, 16 Oct 2024 20:03:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t1AFS-0004vU-57; Wed, 16 Oct 2024 20:03:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1t1AFS-0002K0-4X; Wed, 16 Oct 2024 20:03:58 +0000
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
	bh=QEVYq2rf5mHMpSoyeb0BdQY7KvOpR6okWyg0Z5GaS2A=; b=e68XZJE0yBiTHy+edENLubgWq4
	MFzquX8Ikvr5uyokigHDyu4WryUGW6Qlxh7cPDoUKbP+YWdyTh231OFCIrX3CDY3UozpgibePto/j
	eoEgWCo7ecClbc2ol1sXXHVF9twUZJ4TqdqMdCpiI1L3Zo5MzImbC9f2RhsnS2BFyDaI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-188125-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 188125: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=1b19ccfdfa0a6eeecfcb8fcccf5437150ca41c3e
X-Osstest-Versions-That:
    ovmf=d44b82270b6b1589cc2850fde24a3686cb5ef779
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 16 Oct 2024 20:03:58 +0000

flight 188125 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/188125/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 1b19ccfdfa0a6eeecfcb8fcccf5437150ca41c3e
baseline version:
 ovmf                 d44b82270b6b1589cc2850fde24a3686cb5ef779

Last test of basis   188114  2024-10-16 08:44:55 Z    0 days
Testing same since   188125  2024-10-16 17:42:56 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Oleg Ilyasov <olegi@ami.com>

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
   d44b82270b..1b19ccfdfa  1b19ccfdfa0a6eeecfcb8fcccf5437150ca41c3e -> xen-tested-master

