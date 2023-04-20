Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFFE6EA00C
	for <lists+xen-devel@lfdr.de>; Fri, 21 Apr 2023 01:34:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524397.815300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppdnV-0007qs-8j; Thu, 20 Apr 2023 23:34:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524397.815300; Thu, 20 Apr 2023 23:34:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppdnV-0007oM-57; Thu, 20 Apr 2023 23:34:41 +0000
Received: by outflank-mailman (input) for mailman id 524397;
 Thu, 20 Apr 2023 23:34:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ppdnT-0007o0-2U; Thu, 20 Apr 2023 23:34:39 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ppdnS-00048h-Nt; Thu, 20 Apr 2023 23:34:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ppdnS-0008JD-DU; Thu, 20 Apr 2023 23:34:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ppdnS-000816-Cv; Thu, 20 Apr 2023 23:34:38 +0000
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
	bh=lv+UE+W78G1f83RIPjpWglK/tc061EBehcF9fT6BIEw=; b=OKSYRoX96BwV96C1dEqj1XtGfO
	/Dx2CBFp6oVQkKhGxAvu3zN/l/ITZ5a80H94Mo59nP7hUyYeetKmLT3ilUdUD7YVgkihE1yIQZ0M6
	iTN7qyyLlNaG1dz9UxDyqOgTcaFF6a1giPDlE7QIy8jHvf3Xl5xSa8Qn3moAzgAWQQu4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180343-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180343: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=9bf79303ae5cb4d0e14ed7a219107b53e2ecdcd0
X-Osstest-Versions-That:
    ovmf=45f5341f6de16edc7aed082e15e6afd48a664ee1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 20 Apr 2023 23:34:38 +0000

flight 180343 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180343/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 9bf79303ae5cb4d0e14ed7a219107b53e2ecdcd0
baseline version:
 ovmf                 45f5341f6de16edc7aed082e15e6afd48a664ee1

Last test of basis   180339  2023-04-20 18:42:06 Z    0 days
Testing same since   180343  2023-04-20 21:12:04 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Linus Wu <linusx.wu@intel.com>
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
   45f5341f6d..9bf79303ae  9bf79303ae5cb4d0e14ed7a219107b53e2ecdcd0 -> xen-tested-master

