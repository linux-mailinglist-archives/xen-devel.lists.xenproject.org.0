Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F3244D610
	for <lists+xen-devel@lfdr.de>; Thu, 11 Nov 2021 12:48:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224736.388209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ml8Yn-0000TY-5Y; Thu, 11 Nov 2021 11:48:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224736.388209; Thu, 11 Nov 2021 11:48:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ml8Yn-0000RY-1c; Thu, 11 Nov 2021 11:48:05 +0000
Received: by outflank-mailman (input) for mailman id 224736;
 Thu, 11 Nov 2021 11:48:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ml8Yl-0000RO-Jk; Thu, 11 Nov 2021 11:48:03 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ml8Yl-0004LW-Eq; Thu, 11 Nov 2021 11:48:03 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ml8Yl-0006ep-4G; Thu, 11 Nov 2021 11:48:03 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ml8Yl-0007kP-3l; Thu, 11 Nov 2021 11:48:03 +0000
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
	bh=AmlTq2B7zJwRAMVAeK8nsL4m3T2UDQ94gf+sYKulZNA=; b=qsEZ5UEpHz2C8vwsGyd7ZHW4fr
	GJbyhEqg6hnCXHlzvfeT0T2j8sVQIamzQEsGYrWU31Kp71d2qj+/SLnyJvxpu7FSI1vHXus7ux3YE
	iB6Hy7gxdTQEEht6j9MIZ3qSvHOEWpmC39mVkNQtq+nCqR+tfR7L+AilAEUTZLoO9ZFU=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-166114-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 166114: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=22c3b5a865ec800b7eecf43de336ad5e2d917a08
X-Osstest-Versions-That:
    ovmf=8c8867c5da8e059ab98a6108f8182700f298c6f5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 11 Nov 2021 11:48:03 +0000

flight 166114 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/166114/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 22c3b5a865ec800b7eecf43de336ad5e2d917a08
baseline version:
 ovmf                 8c8867c5da8e059ab98a6108f8182700f298c6f5

Last test of basis   166108  2021-11-10 09:41:26 Z    1 days
Testing same since   166114  2021-11-11 08:41:16 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Chen Lin Z <lin.z.chen@intel.com>
  Chen, Lin Z <lin.z.chen@intel.com>

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
   8c8867c5da..22c3b5a865  22c3b5a865ec800b7eecf43de336ad5e2d917a08 -> xen-tested-master

