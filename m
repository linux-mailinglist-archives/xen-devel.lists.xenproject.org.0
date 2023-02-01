Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEE9685E8A
	for <lists+xen-devel@lfdr.de>; Wed,  1 Feb 2023 05:37:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488083.755972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pN4qd-0005jV-U0; Wed, 01 Feb 2023 04:35:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488083.755972; Wed, 01 Feb 2023 04:35:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pN4qd-0005hr-QY; Wed, 01 Feb 2023 04:35:51 +0000
Received: by outflank-mailman (input) for mailman id 488083;
 Wed, 01 Feb 2023 04:35:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pN4qb-0005hh-SU; Wed, 01 Feb 2023 04:35:49 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pN4qb-0003kG-RU; Wed, 01 Feb 2023 04:35:49 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pN4qb-0005sM-Bb; Wed, 01 Feb 2023 04:35:49 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pN4qb-0006fH-B9; Wed, 01 Feb 2023 04:35:49 +0000
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
	bh=qpcnOXJLWopuyB5HFH48RuI8dvRfqueGgwYP3CwRr/M=; b=Jdrv5eVDgx/s72fT3wVb4eOzum
	XknD+6xaajx/wfvUfqJ8X2YD0TdNTUUhY7K+Zg+Hlm6Ic+n4LIjKn/rCSv03gp4UUYAGiP194gH/j
	RHRW5dSuh3Ezh8XHxw+2TCtOqmWrZF4gTKzUEoekb0zR4+rvgJP3IClv1K4tYax3qGVE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-176306-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 176306: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=bda715bf6d7cf565ccd4eda1f48e850ab8e2d452
X-Osstest-Versions-That:
    ovmf=2f2fd79fc4000a9ef89792677e85c99224e5a035
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 01 Feb 2023 04:35:49 +0000

flight 176306 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/176306/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 bda715bf6d7cf565ccd4eda1f48e850ab8e2d452
baseline version:
 ovmf                 2f2fd79fc4000a9ef89792677e85c99224e5a035

Last test of basis   176299  2023-01-31 15:11:11 Z    0 days
Testing same since   176306  2023-02-01 02:42:07 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Chao Li <lichao@loongson.cn>

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
   2f2fd79fc4..bda715bf6d  bda715bf6d7cf565ccd4eda1f48e850ab8e2d452 -> xen-tested-master

