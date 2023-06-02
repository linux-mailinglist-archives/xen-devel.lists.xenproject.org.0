Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF78D720479
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 16:29:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543163.847887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q55m5-00084z-DT; Fri, 02 Jun 2023 14:29:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543163.847887; Fri, 02 Jun 2023 14:29:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q55m5-00081s-9Y; Fri, 02 Jun 2023 14:29:05 +0000
Received: by outflank-mailman (input) for mailman id 543163;
 Fri, 02 Jun 2023 14:29:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q55m3-00081i-5B; Fri, 02 Jun 2023 14:29:03 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q55m3-0005PF-14; Fri, 02 Jun 2023 14:29:03 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q55m2-0005pd-FU; Fri, 02 Jun 2023 14:29:02 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q55m2-00059F-F6; Fri, 02 Jun 2023 14:29:02 +0000
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
	bh=vUeQrpjg/uBQ3jnU5Ez+7r7wTxpR4vGvZi1Sa2ZTA3U=; b=Mw9PLbiY3FMYzB8BzFs0sgOYnl
	WMeMBY5YCoE1xrWMgd3kIa6giMM0qrbXaT4a5J+rBXBmPPNf8zg4dw8nJd0SCZJUYxLPOPKdw+J2B
	Fu5O8LnwkLCXUC4UD9clAbCOI6MDkqKH8ZJOY9Co2NAXoiplic9RJ3oX7dI5bcXjrtCA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181111-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181111: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=4354c22f38778a2bb4644d1f1f43a47e4313fe42
X-Osstest-Versions-That:
    ovmf=78262899d225eb30e5fbe6a88e85a4b1d8c04a61
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 02 Jun 2023 14:29:02 +0000

flight 181111 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181111/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 4354c22f38778a2bb4644d1f1f43a47e4313fe42
baseline version:
 ovmf                 78262899d225eb30e5fbe6a88e85a4b1d8c04a61

Last test of basis   181106  2023-06-02 07:40:45 Z    0 days
Testing same since   181111  2023-06-02 11:40:43 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Gerd Hoffmann <kraxel@redhat.com>
  Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

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
   78262899d2..4354c22f38  4354c22f38778a2bb4644d1f1f43a47e4313fe42 -> xen-tested-master

