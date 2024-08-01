Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1633945413
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 23:23:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769981.1180848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZdFn-0001x5-BZ; Thu, 01 Aug 2024 21:22:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769981.1180848; Thu, 01 Aug 2024 21:22:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZdFn-0001u2-7a; Thu, 01 Aug 2024 21:22:31 +0000
Received: by outflank-mailman (input) for mailman id 769981;
 Thu, 01 Aug 2024 21:22:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sZdFl-0001ts-53; Thu, 01 Aug 2024 21:22:29 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sZdFk-00075c-W6; Thu, 01 Aug 2024 21:22:28 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sZdFk-0006h0-H3; Thu, 01 Aug 2024 21:22:28 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sZdFk-0005hr-Gj; Thu, 01 Aug 2024 21:22:28 +0000
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
	bh=KyXNbbUtMVaO2xg0Kjb3O3PSFnmHqMIsyMjdXz4C4zI=; b=6i0qefq/TCOjhWMsBuTzH4A6ie
	I25MRW9Kvo0f+oyBMFrocAtbdwaMbU7s7PVgsRFN5W4ZvprEMrHkAr4SuRszP7dMlrXWmEkWdJc3S
	3PmG6ATYFNwgEjEXHhrfo34HwxTp1VjTaFMdjaMKwgHFyZ9QHYUSG5D5JxTSkL+SiwHQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187111-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187111: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b0e7a75a4959a481cc6b857d6e6a9607d14523bf
X-Osstest-Versions-That:
    ovmf=5c9b889b81f9ad22c7442887be72abef054998b9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 01 Aug 2024 21:22:28 +0000

flight 187111 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187111/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b0e7a75a4959a481cc6b857d6e6a9607d14523bf
baseline version:
 ovmf                 5c9b889b81f9ad22c7442887be72abef054998b9

Last test of basis   187110  2024-08-01 17:13:18 Z    0 days
Testing same since   187111  2024-08-01 19:45:07 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Liming Gao <gaoliming@byosoft.com.cn>
  Rohit Mathew <rohit.mathew@arm.com>

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
   5c9b889b81..b0e7a75a49  b0e7a75a4959a481cc6b857d6e6a9607d14523bf -> xen-tested-master

