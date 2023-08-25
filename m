Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B96C787EFD
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 06:26:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590473.922770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZONW-00031n-DN; Fri, 25 Aug 2023 04:24:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590473.922770; Fri, 25 Aug 2023 04:24:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZONW-0002z5-AW; Fri, 25 Aug 2023 04:24:58 +0000
Received: by outflank-mailman (input) for mailman id 590473;
 Fri, 25 Aug 2023 04:24:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qZONV-0002yv-0b; Fri, 25 Aug 2023 04:24:57 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qZONU-0007Gk-Iu; Fri, 25 Aug 2023 04:24:56 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qZONU-0000I8-Bu; Fri, 25 Aug 2023 04:24:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qZONU-0000jE-BS; Fri, 25 Aug 2023 04:24:56 +0000
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
	bh=wF/14VZ3uYfx+RFJm+vb7EQ5QuUGvJpuK531LTgGYeg=; b=MjVXbPVpJXhlR/eWhJ/tdIWBTU
	ikBPzqvHdqSnKibpwzBPq49DCSP5oSTLGVge0tKB2tBxJsNkDGFQunK4JdgJ9n/Nj8CCFxLBBy1qV
	4nMU4XKh7G4NOx6TI88k/Wbrejz4bBTwC77d+lbRbbXz8rmNwoEuMaswk+oREKTDxqnA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182513-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 182513: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=819cfc6b42a68790a23509e4fcc58ceb70e1965e
X-Osstest-Versions-That:
    ovmf=00b51e0d78a547dd78119ec44fcc74a01b6f79c8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 25 Aug 2023 04:24:56 +0000

flight 182513 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182513/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 819cfc6b42a68790a23509e4fcc58ceb70e1965e
baseline version:
 ovmf                 00b51e0d78a547dd78119ec44fcc74a01b6f79c8

Last test of basis   182393  2023-08-19 03:40:57 Z    6 days
Testing same since   182513  2023-08-25 01:57:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Qingyu Shang <2931013282@sjtu.edu.cn>

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
   00b51e0d78..819cfc6b42  819cfc6b42a68790a23509e4fcc58ceb70e1965e -> xen-tested-master

