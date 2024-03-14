Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1175087C4C2
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 22:25:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693490.1081615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rksZF-00080o-I5; Thu, 14 Mar 2024 21:24:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693490.1081615; Thu, 14 Mar 2024 21:24:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rksZF-0007y9-Em; Thu, 14 Mar 2024 21:24:49 +0000
Received: by outflank-mailman (input) for mailman id 693490;
 Thu, 14 Mar 2024 21:24:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rksZD-0007xz-Pz; Thu, 14 Mar 2024 21:24:47 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rksZD-0001nX-Es; Thu, 14 Mar 2024 21:24:47 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rksZD-0002Fn-7Q; Thu, 14 Mar 2024 21:24:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rksZD-0002eB-6p; Thu, 14 Mar 2024 21:24:47 +0000
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
	bh=O50ke9lRFBW9xcxv/JTq2yr20//2vAuqOoHtpiqEpvE=; b=CNOBNwoGvVlL9t0MzyTEMENn1T
	s/I/irFFWvOloXYe8TNQWTI60rwwgGIPp/GuuL03yU5brH2w+AAuL8jpCn894qOjP748kiywLYl6H
	aw3u5WkWVf4cIFnH231T7drllRqoVGm/sBCbclfo+z+etyrgNqDre+n4ht7OXP2CmZSM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185037-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 185037: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=e7486b50646d6a645706b61d2f8d74b3dca23ce0
X-Osstest-Versions-That:
    ovmf=5572b43c6767f7cc46b074ae1fc288f6eccdc65d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 14 Mar 2024 21:24:47 +0000

flight 185037 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185037/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e7486b50646d6a645706b61d2f8d74b3dca23ce0
baseline version:
 ovmf                 5572b43c6767f7cc46b074ae1fc288f6eccdc65d

Last test of basis   185018  2024-03-13 11:45:09 Z    1 days
Testing same since   185037  2024-03-14 16:41:16 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Oliver Smith-Denny <osde@linux.microsoft.com>

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
   5572b43c67..e7486b5064  e7486b50646d6a645706b61d2f8d74b3dca23ce0 -> xen-tested-master

