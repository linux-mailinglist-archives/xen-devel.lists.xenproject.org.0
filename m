Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50440639750
	for <lists+xen-devel@lfdr.de>; Sat, 26 Nov 2022 17:55:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.448499.705226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyyRl-0006ou-0K; Sat, 26 Nov 2022 16:54:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 448499.705226; Sat, 26 Nov 2022 16:54:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyyRk-0006mE-TN; Sat, 26 Nov 2022 16:54:32 +0000
Received: by outflank-mailman (input) for mailman id 448499;
 Sat, 26 Nov 2022 16:54:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oyyRj-0006m4-1f; Sat, 26 Nov 2022 16:54:31 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oyyRi-0005nY-WB; Sat, 26 Nov 2022 16:54:30 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oyyRi-0003VV-L5; Sat, 26 Nov 2022 16:54:30 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oyyRi-0003WX-Kg; Sat, 26 Nov 2022 16:54:30 +0000
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
	bh=W28/HACQ/NVtaqeqfum4fYaH4urBAhTxNHMZuuWk7/I=; b=hsTP6k55CSKCYs6lGO6JGIVVtZ
	tvgWR076jN3zjggs7Y5fGWokD8x31nFtw9hI/ND7Zo43tbh1ZujqRwcgo+ZgoXho/ofmgh7y7vQ2Y
	ZseZ+Yfrh0KS8EVxYmm6YvLkk+ZeE6R5eum/9KxtaJMb80WKEqoMFJRrZT7pnvwjJtvs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-174969-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 174969: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=6ae2b6648eb4b42b5a133f3cde567f9765467bf6
X-Osstest-Versions-That:
    ovmf=fff6d81270b57ee786ea18ad74f43149b9f03494
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 26 Nov 2022 16:54:30 +0000

flight 174969 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/174969/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 6ae2b6648eb4b42b5a133f3cde567f9765467bf6
baseline version:
 ovmf                 fff6d81270b57ee786ea18ad74f43149b9f03494

Last test of basis   174796  2022-11-17 01:55:26 Z    9 days
Testing same since   174969  2022-11-26 15:13:18 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Pierre Gondois <Pierre.Gondois@arm.com>

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
   fff6d81270..6ae2b6648e  6ae2b6648eb4b42b5a133f3cde567f9765467bf6 -> xen-tested-master

