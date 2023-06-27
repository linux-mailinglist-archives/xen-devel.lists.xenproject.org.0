Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B62873F2AB
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 05:28:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555809.867951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDzNf-00079f-8H; Tue, 27 Jun 2023 03:28:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555809.867951; Tue, 27 Jun 2023 03:28:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDzNf-00077w-5T; Tue, 27 Jun 2023 03:28:39 +0000
Received: by outflank-mailman (input) for mailman id 555809;
 Tue, 27 Jun 2023 03:28:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qDzNd-00077m-4F; Tue, 27 Jun 2023 03:28:37 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qDzNc-0004NO-Q1; Tue, 27 Jun 2023 03:28:36 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qDzNc-0003Z3-CZ; Tue, 27 Jun 2023 03:28:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qDzNc-0003kr-C6; Tue, 27 Jun 2023 03:28:36 +0000
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
	bh=KwQu8wz/5TQz6lRzm3mF9IyYVzrlBQigV806M1KGpOM=; b=HHtiA+p+Gpv3HPkizc/j06ONxB
	GNXVPV2sN5+JXOWIlH7qLKnw+2nnc9CxNjtPv4JgUUxpa8j9lAeAbWmGcRrQenLiRm43hAU4Mozkr
	2ZN0rsARNrBPirfPjc3KOVneCOtG6QcGKiIFnq/dxcSCTFrqq26apu1vrShp3Um1rajs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181606-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181606: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=81cb0371f9db299048525cfd2a96d81a5c791568
X-Osstest-Versions-That:
    ovmf=638dfb4135441347f4bb8f242b4003a4e4395456
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 27 Jun 2023 03:28:36 +0000

flight 181606 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181606/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 81cb0371f9db299048525cfd2a96d81a5c791568
baseline version:
 ovmf                 638dfb4135441347f4bb8f242b4003a4e4395456

Last test of basis   181602  2023-06-26 11:42:13 Z    0 days
Testing same since   181606  2023-06-27 01:12:10 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Oliver Steffen <osteffen@redhat.com>

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
   638dfb4135..81cb0371f9  81cb0371f9db299048525cfd2a96d81a5c791568 -> xen-tested-master

