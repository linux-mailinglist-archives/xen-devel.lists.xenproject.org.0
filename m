Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B097724ED1
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jun 2023 23:31:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544243.849880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6eGC-0001q3-Ie; Tue, 06 Jun 2023 21:30:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544243.849880; Tue, 06 Jun 2023 21:30:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6eGC-0001mq-F5; Tue, 06 Jun 2023 21:30:36 +0000
Received: by outflank-mailman (input) for mailman id 544243;
 Tue, 06 Jun 2023 21:30:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q6eGB-0001mg-3b; Tue, 06 Jun 2023 21:30:35 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q6eGA-0007Jo-It; Tue, 06 Jun 2023 21:30:34 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q6eGA-0005VG-93; Tue, 06 Jun 2023 21:30:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q6eGA-0007WW-8e; Tue, 06 Jun 2023 21:30:34 +0000
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
	bh=GLzHgstZA7FdE6JMfRdbyDRYNlOxe85dekewZE5eXUE=; b=OXAdgteZD+9t9Ax4xF0EiRSIgK
	iaZJEybZCH/kB9BQYodCtj/0v1rCftbH3CNu3CRmt9k1BLxZsBiVgn8bpCEfRWUN60fB1+VNCte6I
	hAPsdmR7fEXdEkPc56GIe/X20wqF9iG+/daK5H4JoxMMkStuwk1D91KgUObuNAlqF3YE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181221-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181221: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=cdd20638bc97cef1356a5c687a412f869c637245
X-Osstest-Versions-That:
    ovmf=4bd0849d81b48233196092868081315ec4d9233d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 06 Jun 2023 21:30:34 +0000

flight 181221 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181221/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 cdd20638bc97cef1356a5c687a412f869c637245
baseline version:
 ovmf                 4bd0849d81b48233196092868081315ec4d9233d

Last test of basis   181213  2023-06-06 11:11:37 Z    0 days
Testing same since   181221  2023-06-06 17:10:53 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
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
   4bd0849d81..cdd20638bc  cdd20638bc97cef1356a5c687a412f869c637245 -> xen-tested-master

