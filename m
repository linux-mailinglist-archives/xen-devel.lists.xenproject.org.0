Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A5F4773E8
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 15:02:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247988.427689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxrL9-0001nA-4Y; Thu, 16 Dec 2021 14:02:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247988.427689; Thu, 16 Dec 2021 14:02:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxrL8-0001kd-VH; Thu, 16 Dec 2021 14:02:34 +0000
Received: by outflank-mailman (input) for mailman id 247988;
 Thu, 16 Dec 2021 14:02:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mxrL7-0001kP-TN; Thu, 16 Dec 2021 14:02:33 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mxrL7-0000Bz-I6; Thu, 16 Dec 2021 14:02:33 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mxrL7-0004co-9N; Thu, 16 Dec 2021 14:02:33 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mxrL7-0003F4-8t; Thu, 16 Dec 2021 14:02:33 +0000
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
	bh=RT4AKL0nn69YnqkJ/JWeA37eoUB95xWHBVt2uutkFAI=; b=wixP2uEDBDIMfuCnDZaxskR2RO
	RJEH1SFayPoDMRQsZybq6d4h9pn3fUPhJRkWFyG56rR98z5Rqz2pST06cN0U123lLTDyhMOXENvbv
	kwtmYorpnGooQafkcHbI7KWJsQf+6QLL575eDElRCCg0q/MzjYg2AktvnC+4Xy7g89H4=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-167445-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 167445: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=e6ea1464a846b3f012a9ca07d92924c2e1b88334
X-Osstest-Versions-That:
    ovmf=f14fff513540757bef62923ee4aeca4bf3ea8081
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 16 Dec 2021 14:02:33 +0000

flight 167445 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167445/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e6ea1464a846b3f012a9ca07d92924c2e1b88334
baseline version:
 ovmf                 f14fff513540757bef62923ee4aeca4bf3ea8081

Last test of basis   167436  2021-12-15 15:38:44 Z    0 days
Testing same since   167445  2021-12-16 04:45:51 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Gerd Hoffmann <kraxel@redhat.com>
  Stefan Berger <stefanb@linux.ibm.com>

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
   f14fff5135..e6ea1464a8  e6ea1464a846b3f012a9ca07d92924c2e1b88334 -> xen-tested-master

