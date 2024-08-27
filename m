Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8DC95FED7
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 04:09:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783623.1192908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sildQ-0003aD-5y; Tue, 27 Aug 2024 02:08:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783623.1192908; Tue, 27 Aug 2024 02:08:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sildQ-0003YF-3O; Tue, 27 Aug 2024 02:08:40 +0000
Received: by outflank-mailman (input) for mailman id 783623;
 Tue, 27 Aug 2024 02:08:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sildP-0003Y4-0W; Tue, 27 Aug 2024 02:08:39 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sildO-0002eu-MI; Tue, 27 Aug 2024 02:08:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sildO-00066t-6l; Tue, 27 Aug 2024 02:08:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sildO-0003ux-6J; Tue, 27 Aug 2024 02:08:38 +0000
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
	bh=spZ0w1wOGuOwPEWPCgG1z7JGanfcigELdgZYvMuuZJ0=; b=4kImUZxuKsvfgIRDjHAaqMU5vr
	g9GLZcrZU9llkC8g6sU+HrYtkq/2yfYiUGJUmwze3n/G6WnGJIoYIjdTeFloZGhtpDjkxhEO+PMth
	sRkrtEhvZ0xm4ej5EPm4GjTfai9zF1KF19Siyuz1dIHMGNlj2V6xhuTKsLKxq7WUOam0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187354-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187354: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=f3040bed3cb43ddad2e5d2fd54c6140f23c7d763
X-Osstest-Versions-That:
    ovmf=1cc0fae8d9e2681fc6a33e5602ce8368809f9465
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 27 Aug 2024 02:08:38 +0000

flight 187354 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187354/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 f3040bed3cb43ddad2e5d2fd54c6140f23c7d763
baseline version:
 ovmf                 1cc0fae8d9e2681fc6a33e5602ce8368809f9465

Last test of basis   187348  2024-08-26 05:41:34 Z    0 days
Testing same since   187354  2024-08-27 00:15:10 Z    0 days    1 attempts

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
   1cc0fae8d9..f3040bed3c  f3040bed3cb43ddad2e5d2fd54c6140f23c7d763 -> xen-tested-master

