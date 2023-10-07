Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D35C17BC9B9
	for <lists+xen-devel@lfdr.de>; Sat,  7 Oct 2023 22:19:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613986.954841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpDk5-0000EG-JS; Sat, 07 Oct 2023 20:17:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613986.954841; Sat, 07 Oct 2023 20:17:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpDk5-0000CF-GV; Sat, 07 Oct 2023 20:17:41 +0000
Received: by outflank-mailman (input) for mailman id 613986;
 Sat, 07 Oct 2023 20:17:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qpDk4-0000C5-4s; Sat, 07 Oct 2023 20:17:40 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qpDk4-0002RE-0I; Sat, 07 Oct 2023 20:17:40 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qpDk3-00062s-KZ; Sat, 07 Oct 2023 20:17:39 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qpDk3-0001Wv-K9; Sat, 07 Oct 2023 20:17:39 +0000
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
	bh=nw0TV9PELED7d6nuVix4+urerOq9xgqRO8sE662YWcs=; b=aD6kmhJe7XsxlytmVCxBRGv6dJ
	01yB7pOCxWkSJNjXr9wgjPHx+38DHKgbNEIbHKszdRUtV70hHrW3f/5KCExQh6rm8FUk82KNRgExW
	TScUjJDIKYFH9UGDPY111YrzrAJmrYA9ljuE4B/kkTAljyjt+cw6JaH3VQZLJlPvSjOk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183315-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183315: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=5087a07736452518a508a7776002afbce360128b
X-Osstest-Versions-That:
    ovmf=82191f8a0e57f674657c7461189e194b6f863e26
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 07 Oct 2023 20:17:39 +0000

flight 183315 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183315/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 5087a07736452518a508a7776002afbce360128b
baseline version:
 ovmf                 82191f8a0e57f674657c7461189e194b6f863e26

Last test of basis   183307  2023-10-07 00:42:35 Z    0 days
Testing same since   183315  2023-10-07 14:12:49 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Laszlo Ersek <lersek@redhat.com>

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
   82191f8a0e..5087a07736  5087a07736452518a508a7776002afbce360128b -> xen-tested-master

