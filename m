Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC63096F205
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2024 12:58:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791743.1201734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smWeq-0002VX-C0; Fri, 06 Sep 2024 10:57:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791743.1201734; Fri, 06 Sep 2024 10:57:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smWeq-0002TI-9G; Fri, 06 Sep 2024 10:57:40 +0000
Received: by outflank-mailman (input) for mailman id 791743;
 Fri, 06 Sep 2024 10:57:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1smWeo-0002Ss-OA; Fri, 06 Sep 2024 10:57:38 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1smWeo-0000V9-NK; Fri, 06 Sep 2024 10:57:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1smWeo-000622-Fk; Fri, 06 Sep 2024 10:57:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1smWeo-00086h-FD; Fri, 06 Sep 2024 10:57:38 +0000
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
	bh=M520AHRc71d1QiEJYHnikxAf0+1TlC+XbQ3KXlJMHOs=; b=VS2juFCS9tvUtG2RXHDTg0+R+W
	N3cTuBTT1/vXbbbFe4PLALsKQezTF/EhOtTGGYlHIB0aWkQRpEDecel+K+K+0sJTHmrkMJWIQv/nT
	ckVlFuPqCVelsyziHjO7pVU7C/wWKZm3I7MCQ+UxABio4+zYpHHJv3EX1x5NB3e+N7RQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187527-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187527: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b437b5ca4c1a6725897dfd0740de6ef20cacd226
X-Osstest-Versions-That:
    ovmf=253b3d678aa541b24a2e05f2279975de06abfeec
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 06 Sep 2024 10:57:38 +0000

flight 187527 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187527/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b437b5ca4c1a6725897dfd0740de6ef20cacd226
baseline version:
 ovmf                 253b3d678aa541b24a2e05f2279975de06abfeec

Last test of basis   187521  2024-09-06 07:41:43 Z    0 days
Testing same since   187527  2024-09-06 09:13:26 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jiaxin Wu <jiaxin.wu@intel.com>

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
   253b3d678a..b437b5ca4c  b437b5ca4c1a6725897dfd0740de6ef20cacd226 -> xen-tested-master

