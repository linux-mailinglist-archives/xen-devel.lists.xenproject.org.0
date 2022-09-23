Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 946A45E723A
	for <lists+xen-devel@lfdr.de>; Fri, 23 Sep 2022 04:57:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410558.653629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obYr3-0003LU-SO; Fri, 23 Sep 2022 02:55:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410558.653629; Fri, 23 Sep 2022 02:55:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obYr3-0003IQ-PX; Fri, 23 Sep 2022 02:55:53 +0000
Received: by outflank-mailman (input) for mailman id 410558;
 Fri, 23 Sep 2022 02:55:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1obYr2-0003IG-Pr; Fri, 23 Sep 2022 02:55:52 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1obYr2-0006UA-OA; Fri, 23 Sep 2022 02:55:52 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1obYr2-0003p0-ES; Fri, 23 Sep 2022 02:55:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1obYr2-0000aU-DI; Fri, 23 Sep 2022 02:55:52 +0000
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
	bh=FF13V5OoApDqq0ta85x1S9Zn9tWOD4AtcIDayJqY4tY=; b=WI+y2R6Edu/9ZKlsj0N5ONNgkL
	tNXbbaD+Lsrj05R5npY+m6iO2EGZx4OPS1cmjOZ+wiU1Jw18dn6KWc/2Bcmoh6kglvThQiVyHyIWK
	p+UweKmuJ4XFalRQuJ1wKSkppsuQxWCjteoX82Qm9dUXsd3vGmc78cFRqwr8hb2j361g=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173282-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 173282: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=6f340acfb10992af914ed5e17127cc786e0a7f7b
X-Osstest-Versions-That:
    ovmf=dd1e20b3c281940c5b5783151b24cf6ceeb31ca3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 23 Sep 2022 02:55:52 +0000

flight 173282 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/173282/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 6f340acfb10992af914ed5e17127cc786e0a7f7b
baseline version:
 ovmf                 dd1e20b3c281940c5b5783151b24cf6ceeb31ca3

Last test of basis   173281  2022-09-22 19:41:14 Z    0 days
Testing same since   173282  2022-09-23 00:41:56 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Wenyi Xie <xiewenyi2@huawei.com>

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
   dd1e20b3c2..6f340acfb1  6f340acfb10992af914ed5e17127cc786e0a7f7b -> xen-tested-master

