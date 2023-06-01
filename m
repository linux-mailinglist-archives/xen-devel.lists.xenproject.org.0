Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BAB71EFD8
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 18:57:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542680.846817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4lbM-0003w8-Uv; Thu, 01 Jun 2023 16:56:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542680.846817; Thu, 01 Jun 2023 16:56:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4lbM-0003u5-SG; Thu, 01 Jun 2023 16:56:40 +0000
Received: by outflank-mailman (input) for mailman id 542680;
 Thu, 01 Jun 2023 16:56:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q4lbL-0003tv-Ce; Thu, 01 Jun 2023 16:56:39 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q4lbL-0007EZ-4T; Thu, 01 Jun 2023 16:56:39 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q4lbK-0001Ln-UR; Thu, 01 Jun 2023 16:56:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q4lbK-0005p6-U2; Thu, 01 Jun 2023 16:56:38 +0000
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
	bh=F/NrATzWyvOKdg2a9+cuqpug4w/rw8QC19H8bOO4HEM=; b=YxNF2hq6KTmGODfMCadvInyHIs
	0ApKvzg2xLn38/enw2HJLF+6xw8iG7PAOVVzTtiemidreHT9MJ6lBCC4XHkO4xv5HxLFhXn+PNG+w
	ix2WthGmAe92SFXw4jYB/0978C6vp8qqK1Vb2p6ghJIMdoEbbWIPSeZmwIVWtLVepy44=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181081-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181081: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=15f83fa36442eaa272300b31699b3b82ce7e07a9
X-Osstest-Versions-That:
    ovmf=1df6658bcbc4cade29a8763808a9804e5d449046
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 01 Jun 2023 16:56:38 +0000

flight 181081 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181081/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 15f83fa36442eaa272300b31699b3b82ce7e07a9
baseline version:
 ovmf                 1df6658bcbc4cade29a8763808a9804e5d449046

Last test of basis   181076  2023-06-01 11:12:17 Z    0 days
Testing same since   181081  2023-06-01 13:15:20 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Gerd Hoffmann <kraxel@redhat.com>

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
   1df6658bcb..15f83fa364  15f83fa36442eaa272300b31699b3b82ce7e07a9 -> xen-tested-master

