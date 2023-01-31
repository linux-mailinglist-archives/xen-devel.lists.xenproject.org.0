Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9205F6835FE
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 20:04:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487790.755483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMvul-0004mE-33; Tue, 31 Jan 2023 19:03:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487790.755483; Tue, 31 Jan 2023 19:03:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMvuk-0004kd-VE; Tue, 31 Jan 2023 19:03:30 +0000
Received: by outflank-mailman (input) for mailman id 487790;
 Tue, 31 Jan 2023 19:03:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pMvuk-0004kT-6G; Tue, 31 Jan 2023 19:03:30 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pMvuk-0002tF-3O; Tue, 31 Jan 2023 19:03:30 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pMvuj-00065A-KW; Tue, 31 Jan 2023 19:03:29 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pMvuj-0007qe-K9; Tue, 31 Jan 2023 19:03:29 +0000
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
	bh=oaWSjEEe7eVdwm7yOnxe7nbesol0E5P6yxyPmdIdobA=; b=3abSOmlgQqhVWzjI1Pwo90xAI+
	i4VdIK4ZdrnWgnvn54X6AKj72oFlw9nWqPgoaClER416VyuPqey1WVr5wD5YPwRwnXKIyNp2yArl8
	6ktUH4E+ZPHhYjfHEYyov623wMB6eFMiHW/3sqXZT3wsje8ekFHYJQ2d3ey+X9ewL7ko=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-176299-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 176299: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=2f2fd79fc4000a9ef89792677e85c99224e5a035
X-Osstest-Versions-That:
    ovmf=35091031329e741b25ed60ac51f4710d75d92310
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 31 Jan 2023 19:03:29 +0000

flight 176299 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/176299/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 2f2fd79fc4000a9ef89792677e85c99224e5a035
baseline version:
 ovmf                 35091031329e741b25ed60ac51f4710d75d92310

Last test of basis   176287  2023-01-31 02:42:12 Z    0 days
Testing same since   176299  2023-01-31 15:11:11 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  KasimX Liu <kasimx.liu@intel.com>

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
   3509103132..2f2fd79fc4  2f2fd79fc4000a9ef89792677e85c99224e5a035 -> xen-tested-master

