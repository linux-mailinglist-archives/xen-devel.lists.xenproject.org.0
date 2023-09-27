Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0E07AF70A
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 02:05:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608594.947188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlI3T-0001Hy-Nn; Wed, 27 Sep 2023 00:05:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608594.947188; Wed, 27 Sep 2023 00:05:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlI3T-0001F4-Kn; Wed, 27 Sep 2023 00:05:27 +0000
Received: by outflank-mailman (input) for mailman id 608594;
 Wed, 27 Sep 2023 00:05:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qlI3R-0001Es-Ve; Wed, 27 Sep 2023 00:05:25 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qlI3R-0001sp-NF; Wed, 27 Sep 2023 00:05:25 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qlI3R-0000DG-Bm; Wed, 27 Sep 2023 00:05:25 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qlI3R-0007NT-B7; Wed, 27 Sep 2023 00:05:25 +0000
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
	bh=C/JzOrj8fxyLlfuGnB47pyRFtr1cDLPPiz1tSYxMFvk=; b=e9RwB/Z/cwvBDb2Mz6sWt85Ya+
	83qnr5NV40LmdTc8/zRpbpiva9kYlzDzfafOz3SMVPr00RKuUpfx+VxgiGy93rBw0qDf76glLSrGo
	VpDHQmzZHyE6ES2zpfAWqXXWcASEO8VAlnSv1+eF177rVPVEn+F5uBS+NU7KzoHkEiZM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183184-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183184: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=bf0bdacdd6f6cdd2e9ac5db14b6daf19a5a5bd57
X-Osstest-Versions-That:
    ovmf=39f3c26e8c40e092baeb0ec4d0396498506e0a9e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 27 Sep 2023 00:05:25 +0000

flight 183184 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183184/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 bf0bdacdd6f6cdd2e9ac5db14b6daf19a5a5bd57
baseline version:
 ovmf                 39f3c26e8c40e092baeb0ec4d0396498506e0a9e

Last test of basis   183174  2023-09-26 07:42:29 Z    0 days
Testing same since   183184  2023-09-26 20:12:38 Z    0 days    1 attempts

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
   39f3c26e8c..bf0bdacdd6  bf0bdacdd6f6cdd2e9ac5db14b6daf19a5a5bd57 -> xen-tested-master

