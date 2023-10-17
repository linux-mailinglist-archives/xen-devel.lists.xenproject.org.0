Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AF87CBB2A
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 08:28:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618049.961277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsdXw-00028j-0P; Tue, 17 Oct 2023 06:27:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618049.961277; Tue, 17 Oct 2023 06:27:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsdXv-000276-U4; Tue, 17 Oct 2023 06:27:15 +0000
Received: by outflank-mailman (input) for mailman id 618049;
 Tue, 17 Oct 2023 06:27:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qsdXu-00026u-O8; Tue, 17 Oct 2023 06:27:14 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qsdXu-0002Ur-Ko; Tue, 17 Oct 2023 06:27:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qsdXu-0003wt-2Z; Tue, 17 Oct 2023 06:27:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qsdXt-00017W-Vr; Tue, 17 Oct 2023 06:27:13 +0000
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
	bh=GcsDO8KRXJ2BX3NCWaxpivIeCwmVJXl4dQZMFKDfeUQ=; b=lJ3ICkZ8BPuKNl0TST4ApUjm9X
	Oete0taS+FwpuowfLrYAkKpQzKKxaipcw1EjEtGXde+eoaB2V7HfgNwEDa+1BRrOFudk8I4mXKtZJ
	uHy1Q9HfvPzQrGqhtKqV33eJPgJT3Nx95RlwDignEm1KM6VKnna3OowtjE48QBdLbUEc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183394-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183394: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=a445e1a42ccf3cb9f70537c7cd80ece689bf4d9a
X-Osstest-Versions-That:
    ovmf=03d6569f70939d2a1653265367121212459a6b89
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 17 Oct 2023 06:27:13 +0000

flight 183394 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183394/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 a445e1a42ccf3cb9f70537c7cd80ece689bf4d9a
baseline version:
 ovmf                 03d6569f70939d2a1653265367121212459a6b89

Last test of basis   183390  2023-10-16 23:10:46 Z    0 days
Testing same since   183394  2023-10-17 03:11:04 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Giri Mudusuru <girim@apple.com>

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
   03d6569f70..a445e1a42c  a445e1a42ccf3cb9f70537c7cd80ece689bf4d9a -> xen-tested-master

