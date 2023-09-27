Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A47257B00C6
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 11:42:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608784.947498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlR3j-00046f-Iy; Wed, 27 Sep 2023 09:42:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608784.947498; Wed, 27 Sep 2023 09:42:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlR3j-00043i-G4; Wed, 27 Sep 2023 09:42:19 +0000
Received: by outflank-mailman (input) for mailman id 608784;
 Wed, 27 Sep 2023 09:42:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qlR3i-00043W-22; Wed, 27 Sep 2023 09:42:18 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qlR3h-0006tX-R8; Wed, 27 Sep 2023 09:42:17 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qlR3h-00010P-Gi; Wed, 27 Sep 2023 09:42:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qlR3h-00085q-GA; Wed, 27 Sep 2023 09:42:17 +0000
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
	bh=/YFP92eBbxsBimHAeJfJR1NKNZTbOqxQrHFl0nxq7ck=; b=yLfRLOBsQQYaxMwvpGtbiRret+
	X/aTENWyUyAkV9hsLhMQfRwIYNvyBftivioxndMF/tawGlmHLkzQwBWF27rj8zLhBiiIO5197sEpf
	UPJFsldWnBNWYXbP5DDYWhl4v2TsGIf0vVHrrs6inx+eQzHhlOHIdkSdPZMYaJo7uxes=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183190-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183190: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ad1c0394b1770315099e511de7c88a04d7af76f2
X-Osstest-Versions-That:
    ovmf=be971fc302cbef8f47e2612eda114135f21205e6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 27 Sep 2023 09:42:17 +0000

flight 183190 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183190/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ad1c0394b1770315099e511de7c88a04d7af76f2
baseline version:
 ovmf                 be971fc302cbef8f47e2612eda114135f21205e6

Last test of basis   183186  2023-09-27 00:12:32 Z    0 days
Testing same since   183190  2023-09-27 05:23:10 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Nate DeSimone <nathaniel.l.desimone@intel.com>

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
   be971fc302..ad1c0394b1  ad1c0394b1770315099e511de7c88a04d7af76f2 -> xen-tested-master

