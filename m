Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD52900451
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2024 15:06:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736533.1142631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFZIR-0006yG-91; Fri, 07 Jun 2024 13:06:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736533.1142631; Fri, 07 Jun 2024 13:06:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFZIR-0006vk-6R; Fri, 07 Jun 2024 13:06:19 +0000
Received: by outflank-mailman (input) for mailman id 736533;
 Fri, 07 Jun 2024 13:06:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sFZIP-0006va-TO; Fri, 07 Jun 2024 13:06:17 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sFZIP-0004nz-Np; Fri, 07 Jun 2024 13:06:17 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sFZIP-00021H-EK; Fri, 07 Jun 2024 13:06:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sFZIP-0008VA-Do; Fri, 07 Jun 2024 13:06:17 +0000
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
	bh=XL99sTPbaHp1MaAFrhmZOMI7Gj5nX48dSUDR4n5DjqI=; b=M0zOO3e4xxpcqo2P/Yc2r4JKZQ
	kG6bhmFdxygt+TkHYOScm0uXCiDlzp2jeIcUiGXAzTJcBjieCUuHD0mEpl1mOhdX6EiZkJ8v7Uqox
	MgGX17QKD8Qdudb2r7IYC/IMW0HnNA1J7itNMgznta8FnglEzT+em3Z+K33YfxcXCJvI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186277-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186277: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=8c826be35c736f4b718c8f927853aa957a1973d8
X-Osstest-Versions-That:
    ovmf=665b223d57369d8b28dcdc81352428adfe435ff4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 07 Jun 2024 13:06:17 +0000

flight 186277 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186277/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 8c826be35c736f4b718c8f927853aa957a1973d8
baseline version:
 ovmf                 665b223d57369d8b28dcdc81352428adfe435ff4

Last test of basis   186276  2024-06-07 09:11:05 Z    0 days
Testing same since   186277  2024-06-07 11:42:56 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Rebecca Cran <rebecca@bsdio.com>

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
   665b223d57..8c826be35c  8c826be35c736f4b718c8f927853aa957a1973d8 -> xen-tested-master

