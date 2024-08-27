Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FA79616E4
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 20:23:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784302.1193701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sj0ps-0008HP-4M; Tue, 27 Aug 2024 18:22:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784302.1193701; Tue, 27 Aug 2024 18:22:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sj0ps-0008F9-0z; Tue, 27 Aug 2024 18:22:32 +0000
Received: by outflank-mailman (input) for mailman id 784302;
 Tue, 27 Aug 2024 18:22:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sj0pq-0008Ez-MZ; Tue, 27 Aug 2024 18:22:30 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sj0pq-0004V8-HV; Tue, 27 Aug 2024 18:22:30 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sj0pq-0008C9-24; Tue, 27 Aug 2024 18:22:30 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sj0pq-0004gr-1d; Tue, 27 Aug 2024 18:22:30 +0000
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
	bh=+ddB/Qesz6vJJRZUQEZfcsBplp3GLNcWSK4tDFbFNp8=; b=prsQS7hXMtjjgIhLk4gq4jvz02
	QOE9pa20Jl88zJNKXO3oxcLrM7mqMqbqV1QvHEjyaZ0FMBxThK1PtexRR6eefIxKECMgOUpup4b6A
	+pr34QKQ+HEUkKgM6R3QwDFtxEE/lJz4y0FLjG0uDlL+q8KoraBpUJn3IV5SffKN/sPQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187364-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187364: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b2a431868c4ae0ad99def0a504d2fe097e16cd4f
X-Osstest-Versions-That:
    ovmf=efaf8931bbfa33a81b8792fbf9e2ccc239d53204
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 27 Aug 2024 18:22:30 +0000

flight 187364 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187364/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b2a431868c4ae0ad99def0a504d2fe097e16cd4f
baseline version:
 ovmf                 efaf8931bbfa33a81b8792fbf9e2ccc239d53204

Last test of basis   187363  2024-08-27 13:15:02 Z    0 days
Testing same since   187364  2024-08-27 16:43:23 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Oliver Smith-Denny <osde@linux.microsoft.com>
  Oliver Smith-Denny <osde@microsoft.com>

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
   efaf8931bb..b2a431868c  b2a431868c4ae0ad99def0a504d2fe097e16cd4f -> xen-tested-master

