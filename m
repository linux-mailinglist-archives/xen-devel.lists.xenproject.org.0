Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6307BC46B
	for <lists+xen-devel@lfdr.de>; Sat,  7 Oct 2023 05:32:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613900.954761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoy28-0000GQ-2K; Sat, 07 Oct 2023 03:31:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613900.954761; Sat, 07 Oct 2023 03:31:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoy27-0000Dm-VB; Sat, 07 Oct 2023 03:31:15 +0000
Received: by outflank-mailman (input) for mailman id 613900;
 Sat, 07 Oct 2023 03:31:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qoy26-0000Dc-Vp; Sat, 07 Oct 2023 03:31:14 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qoy26-0002Y8-Pz; Sat, 07 Oct 2023 03:31:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qoy26-0006hH-Gk; Sat, 07 Oct 2023 03:31:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qoy26-0001rc-GJ; Sat, 07 Oct 2023 03:31:14 +0000
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
	bh=MZ9X7YTA2i+gdktlakHwlMKSeEBSq9Lu/O9BP8STdNU=; b=BxqnZ0GHRdfkiJgmShZL7l+vRV
	dEcR4ErRHtpVnfXVbElAlKcwuRSM4o0mD4BWaFm7AADoawkHyQgPt7Sbwj5NO98vMvVCTonj1JmgC
	nDagZc6BAYrEEq5IbS9oi8PVkBmmfz0O9gpEvifi6xFlU6WT+ewtAKzwGiUf+M8Bxftw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183307-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183307: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=82191f8a0e57f674657c7461189e194b6f863e26
X-Osstest-Versions-That:
    ovmf=d073a545119140070c83e4b2b249bf0448c6f89e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 07 Oct 2023 03:31:14 +0000

flight 183307 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183307/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 82191f8a0e57f674657c7461189e194b6f863e26
baseline version:
 ovmf                 d073a545119140070c83e4b2b249bf0448c6f89e

Last test of basis   183263  2023-10-04 16:12:23 Z    2 days
Testing same since   183307  2023-10-07 00:42:35 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael Kubacki <michael.kubacki@microsoft.com>

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
   d073a54511..82191f8a0e  82191f8a0e57f674657c7461189e194b6f863e26 -> xen-tested-master

