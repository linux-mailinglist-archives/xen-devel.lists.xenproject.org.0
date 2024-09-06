Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6901796EC00
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2024 09:31:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791594.1201499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smTRC-0006Pb-B8; Fri, 06 Sep 2024 07:31:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791594.1201499; Fri, 06 Sep 2024 07:31:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smTRC-0006NC-7W; Fri, 06 Sep 2024 07:31:22 +0000
Received: by outflank-mailman (input) for mailman id 791594;
 Fri, 06 Sep 2024 07:31:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1smTRA-0006N2-Kl; Fri, 06 Sep 2024 07:31:20 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1smTRA-0004t0-DJ; Fri, 06 Sep 2024 07:31:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1smTRA-000859-54; Fri, 06 Sep 2024 07:31:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1smTRA-0002WU-4a; Fri, 06 Sep 2024 07:31:20 +0000
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
	bh=ZOytYJk+s3vd2CsFg+MNw5A88aBlpDGsF6eF9QuqzHc=; b=dRUNMQDDBAyNBMvlYcsqLUE5eO
	4QGeVhKA5X2wpg1N41Ao/2roF5hs3+daB5KDFrrWuHjqj22XFP1XMwPgX8fWCw6up8j4bEOGqw+CT
	KVM+mkB8QZF7Vwon3OyAzFR60+dvnCdZO+OJjRgpi5Skt1NFsBsXlI13Y3kTsv5lJceA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187517-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187517: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=9dabe005f0cd422068fbb6cb915cf8180c55918d
X-Osstest-Versions-That:
    ovmf=bfb33c0e09b0cf05460168c00ec43817b835f897
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 06 Sep 2024 07:31:20 +0000

flight 187517 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187517/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 9dabe005f0cd422068fbb6cb915cf8180c55918d
baseline version:
 ovmf                 bfb33c0e09b0cf05460168c00ec43817b835f897

Last test of basis   187512  2024-09-06 01:56:34 Z    0 days
Testing same since   187517  2024-09-06 05:41:51 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Nhi Pham <nhi@os.amperecomputing.com>

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
   bfb33c0e09..9dabe005f0  9dabe005f0cd422068fbb6cb915cf8180c55918d -> xen-tested-master

