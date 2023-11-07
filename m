Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 836807E335C
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 03:57:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628542.980117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0CFz-00049S-RC; Tue, 07 Nov 2023 02:55:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628542.980117; Tue, 07 Nov 2023 02:55:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0CFz-00047i-OU; Tue, 07 Nov 2023 02:55:59 +0000
Received: by outflank-mailman (input) for mailman id 628542;
 Tue, 07 Nov 2023 02:55:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r0CFy-00047Y-7u; Tue, 07 Nov 2023 02:55:58 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r0CFx-00044M-U2; Tue, 07 Nov 2023 02:55:57 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r0CFx-0008EA-Hr; Tue, 07 Nov 2023 02:55:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1r0CFx-0000OA-HU; Tue, 07 Nov 2023 02:55:57 +0000
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
	bh=rcEPGrEMjDV5QWgNS2YnahMs0q5ieDx8hW5/Paci3fY=; b=anIPOfWi5zc11nPpOTLN08jcWF
	akJPpl7es5/fJ5HT4ABUxBbJKmlnHGVmn6fqOwHg5j0Q5r08QOK62dgg5/L7ohmD2d6wdnmPcI5rT
	kUuUMxlaa361OEbogab36bPt/rA98ouMXvoXIy6UPDzRwztvdROu9Ngt5xG6rmJvebmk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183699-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183699: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=da219919538b679d5cf7387f4eba6c20384bf868
X-Osstest-Versions-That:
    ovmf=ae02d487a3a4f198e37ca5029ae04abd8976076d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 07 Nov 2023 02:55:57 +0000

flight 183699 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183699/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 da219919538b679d5cf7387f4eba6c20384bf868
baseline version:
 ovmf                 ae02d487a3a4f198e37ca5029ae04abd8976076d

Last test of basis   183696  2023-11-06 20:46:34 Z    0 days
Testing same since   183699  2023-11-07 00:44:24 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Joey Vagedes <joeyvagedes@gmail.com>
  Joey Vagedes <joeyvagedes@microsoft.com>
  Liming Gao <gaoliming@byosoft.com.cn>

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
   ae02d487a3..da21991953  da219919538b679d5cf7387f4eba6c20384bf868 -> xen-tested-master

