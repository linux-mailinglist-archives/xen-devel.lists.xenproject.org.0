Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0A22C606F
	for <lists+xen-devel@lfdr.de>; Fri, 27 Nov 2020 08:22:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39085.71870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiY4P-0005lb-N7; Fri, 27 Nov 2020 07:21:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39085.71870; Fri, 27 Nov 2020 07:21:29 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiY4P-0005lA-JK; Fri, 27 Nov 2020 07:21:29 +0000
Received: by outflank-mailman (input) for mailman id 39085;
 Fri, 27 Nov 2020 07:21:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kiY4O-0005l2-2Z; Fri, 27 Nov 2020 07:21:28 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kiY4N-00059C-Py; Fri, 27 Nov 2020 07:21:27 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kiY4N-0001Xk-GN; Fri, 27 Nov 2020 07:21:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kiY4N-0007s2-Fr; Fri, 27 Nov 2020 07:21:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kiY4O-0005l2-2Z; Fri, 27 Nov 2020 07:21:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=C6NsvQEZUE9rNKS0RA4lIyDls1MrieCzzmqLts1S2vE=; b=zAv38tWA1SXf7zn5IUl/X+dCy0
	ys5KOJC66ehBc2KZguSru2O39gtmlM9fYrZJuisef5urCM12uHEDLhT+CqpTyMRr3D149sikfc8fC
	nVG4HC7ravNKxaZRel/p0KVxAZLXF4T2a6thFldaL+pBBEs4GedwODJRCMQDTOGiGRek=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kiY4N-00059C-Py; Fri, 27 Nov 2020 07:21:27 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kiY4N-0001Xk-GN; Fri, 27 Nov 2020 07:21:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kiY4N-0007s2-Fr; Fri, 27 Nov 2020 07:21:27 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-157042-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 157042: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=872f953262d68a11da7bc2fb3ded16df234b8700
X-Osstest-Versions-That:
    ovmf=21f984cedec1c613218480bc3eb5e92349a7a812
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 27 Nov 2020 07:21:27 +0000

flight 157042 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/157042/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 872f953262d68a11da7bc2fb3ded16df234b8700
baseline version:
 ovmf                 21f984cedec1c613218480bc3eb5e92349a7a812

Last test of basis   157025  2020-11-26 07:11:04 Z    1 days
Testing same since   157042  2020-11-27 01:41:56 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  James Bottomley <jejb@linux.ibm.com>
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
   21f984cede..872f953262  872f953262d68a11da7bc2fb3ded16df234b8700 -> xen-tested-master

