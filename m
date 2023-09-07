Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 896DD797AE4
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 19:55:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597574.931803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeJDE-0002pG-3p; Thu, 07 Sep 2023 17:54:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597574.931803; Thu, 07 Sep 2023 17:54:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeJDD-0002ns-WC; Thu, 07 Sep 2023 17:54:39 +0000
Received: by outflank-mailman (input) for mailman id 597574;
 Thu, 07 Sep 2023 17:54:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qeJDC-0002ni-WA; Thu, 07 Sep 2023 17:54:39 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qeJDC-0008F7-Rl; Thu, 07 Sep 2023 17:54:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qeJDC-00056K-GV; Thu, 07 Sep 2023 17:54:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qeJDC-00019P-Fv; Thu, 07 Sep 2023 17:54:38 +0000
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
	bh=Y6nJ1HFDLpOt03i8WP/Aaj7zahWhVjcpK0d//2d5tU4=; b=ih8PT+pgNrMM//y6yBiEj7cEOV
	fEdo/ToAQzerWBgrMxr6lLuWVNGVVRBLtILsfm1zO3Oyu6bxQzks5pRAHFqqUhQoGjPmGKHd7kyqb
	6Pmr/R8q7ap8YypYQPKCkWzsPgrw6Wcinz1oMtCciBlHWyTvs4dSFg52PgW8YWz/03l4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182722-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 182722: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b29150aa3e9157908052c212d3afacbff8dbab1b
X-Osstest-Versions-That:
    ovmf=b81557a00c61cc80ab118828f16ed9ce79455880
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 07 Sep 2023 17:54:38 +0000

flight 182722 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182722/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b29150aa3e9157908052c212d3afacbff8dbab1b
baseline version:
 ovmf                 b81557a00c61cc80ab118828f16ed9ce79455880

Last test of basis   182721  2023-09-07 14:10:43 Z    0 days
Testing same since   182722  2023-09-07 16:10:41 Z    0 days    1 attempts

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
   b81557a00c..b29150aa3e  b29150aa3e9157908052c212d3afacbff8dbab1b -> xen-tested-master

