Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B93123FA753
	for <lists+xen-devel@lfdr.de>; Sat, 28 Aug 2021 21:28:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.174448.318040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mK3yV-0005vr-AQ; Sat, 28 Aug 2021 19:26:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 174448.318040; Sat, 28 Aug 2021 19:26:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mK3yV-0005tL-7V; Sat, 28 Aug 2021 19:26:43 +0000
Received: by outflank-mailman (input) for mailman id 174448;
 Sat, 28 Aug 2021 19:26:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mK3yU-0005tC-No; Sat, 28 Aug 2021 19:26:42 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mK3yU-0004n8-8Q; Sat, 28 Aug 2021 19:26:42 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mK3yT-0002NG-Tf; Sat, 28 Aug 2021 19:26:41 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mK3yT-0003NT-Sz; Sat, 28 Aug 2021 19:26:41 +0000
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
	bh=RIkcBESFB4bBfg6J8TlSXWhMznsZXCuwMFIzacWu25U=; b=1untb8rHCMm3viQz5CagOI0OAI
	1h9vrQ2N0U5dtbpygQoS2H6Rua6MFd6o7svvSi+rwlG3zLB6UK1hdajvE/Fe7l8Reo4XykzxPU2O4
	j24BajwZSjiBHRW/43EFfABbmZQ7bmQye+jZ0cs6doalFU3DRP4Mb34YhHXjO7s8RRBY=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164513-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 164513: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=82f7e315d612399f65a3bedd3b2c0364b43b6929
X-Osstest-Versions-That:
    ovmf=7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 28 Aug 2021 19:26:41 +0000

flight 164513 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164513/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 82f7e315d612399f65a3bedd3b2c0364b43b6929
baseline version:
 ovmf                 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5

Last test of basis   164461  2021-08-24 22:15:18 Z    3 days
Testing same since   164513  2021-08-27 08:41:23 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael Kubacki <michael.kubacki@microsoft.com>

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
   7b4a99be8a..82f7e315d6  82f7e315d612399f65a3bedd3b2c0364b43b6929 -> xen-tested-master

