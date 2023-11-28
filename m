Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA3E7FBE7A
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 16:48:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643289.1003325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r80JJ-0005MZ-RE; Tue, 28 Nov 2023 15:47:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643289.1003325; Tue, 28 Nov 2023 15:47:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r80JJ-0005Iw-O9; Tue, 28 Nov 2023 15:47:41 +0000
Received: by outflank-mailman (input) for mailman id 643289;
 Tue, 28 Nov 2023 15:47:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r80JI-0005Im-P4; Tue, 28 Nov 2023 15:47:40 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r80JI-0003Ah-Eg; Tue, 28 Nov 2023 15:47:40 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r80JI-0004FS-78; Tue, 28 Nov 2023 15:47:40 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1r80JI-0004cI-6e; Tue, 28 Nov 2023 15:47:40 +0000
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
	bh=O5USc4xaoKteqqxFpdhRtkzR76Fdb7NyrVUaRJT4/dQ=; b=xkF5Q4Ymldau0rNiXf+MQiOik/
	ByvJszv1b8N5iefaBGOTW9YAVQL2yYuz7byyUy1MaairTpn/LXMVi0DE8YvpOsP3VY8VAF9XQgFFn
	FgYuOH4XroAfAwHeqxrTpgznDYXObozIguUOY+we3gtJhDonC9jwA7Z5FmCJG96PeqzI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183895-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183895: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=9eec96bd4fc53d7836b5606f2a8bbb10713cc8f5
X-Osstest-Versions-That:
    ovmf=d451bba399687b4102459db5a447fc9abb8fdee1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 28 Nov 2023 15:47:40 +0000

flight 183895 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183895/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 9eec96bd4fc53d7836b5606f2a8bbb10713cc8f5
baseline version:
 ovmf                 d451bba399687b4102459db5a447fc9abb8fdee1

Last test of basis   183890  2023-11-28 10:41:09 Z    0 days
Testing same since   183895  2023-11-28 13:41:02 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dov Murik <dovmurik@linux.ibm.com>
  Gerd Hoffmann <kraxel@redhat.com>
  Tom Lendacky <thomas.lendacky@amd.com>

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
   d451bba399..9eec96bd4f  9eec96bd4fc53d7836b5606f2a8bbb10713cc8f5 -> xen-tested-master

