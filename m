Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19252960097
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 06:56:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783654.1192929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sioFG-0005Uf-0Z; Tue, 27 Aug 2024 04:55:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783654.1192929; Tue, 27 Aug 2024 04:55:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sioFF-0005To-Sf; Tue, 27 Aug 2024 04:55:53 +0000
Received: by outflank-mailman (input) for mailman id 783654;
 Tue, 27 Aug 2024 04:55:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sioFE-0005TY-Es; Tue, 27 Aug 2024 04:55:52 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sioFE-0005fC-9z; Tue, 27 Aug 2024 04:55:52 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sioFD-0004iW-TC; Tue, 27 Aug 2024 04:55:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sioFD-00053o-Sm; Tue, 27 Aug 2024 04:55:51 +0000
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
	bh=zYD0vIyVjXyS63O1jGdwBrTp0t2g/kRdLt4BvbvwVy8=; b=fAt91G2uXr0h321SPsIp/sXQjB
	tJBJK5HWEo+xQqDLMjDSZwp9c0W+JCmOYp9ZneOj4LIjwrH6y/ARZB0jWkNXrA0LqFxLnMhKtfIyF
	c5CFUGcegd3K/CWQKhhj1O9AcRUgLxESaayV8JSYrx70Zuw4QDbPCXNufHdIJiTpi4h4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187356-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187356: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=0e8af8803489a10d4edc61a94f1c6e03965c16f5
X-Osstest-Versions-That:
    ovmf=f3040bed3cb43ddad2e5d2fd54c6140f23c7d763
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 27 Aug 2024 04:55:51 +0000

flight 187356 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187356/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 0e8af8803489a10d4edc61a94f1c6e03965c16f5
baseline version:
 ovmf                 f3040bed3cb43ddad2e5d2fd54c6140f23c7d763

Last test of basis   187354  2024-08-27 00:15:10 Z    0 days
Testing same since   187356  2024-08-27 02:11:16 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Saloni Kasbekar <saloni.kasbekar@intel.com>

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
   f3040bed3c..0e8af88034  0e8af8803489a10d4edc61a94f1c6e03965c16f5 -> xen-tested-master

