Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC23B6809C7
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 10:40:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486737.754179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMQeN-0003CR-HX; Mon, 30 Jan 2023 09:40:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486737.754179; Mon, 30 Jan 2023 09:40:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMQeN-0003A3-EW; Mon, 30 Jan 2023 09:40:31 +0000
Received: by outflank-mailman (input) for mailman id 486737;
 Mon, 30 Jan 2023 09:40:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pMQeM-00039t-MD; Mon, 30 Jan 2023 09:40:30 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pMQeM-0004US-LK; Mon, 30 Jan 2023 09:40:30 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pMQeM-0002eH-9x; Mon, 30 Jan 2023 09:40:30 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pMQeM-0005US-9P; Mon, 30 Jan 2023 09:40:30 +0000
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
	bh=d5hdPdqMTYVgwV/HejBjilYGODWBk5Z6oPyEEGQ+2HQ=; b=pZleCPGjNoE6V8Lz76TJ6O8hgq
	wVbmAWYAe+y1qZhs5j9Wg68AONwDFhAAdWA3oM+jFLzs0dVCiQ684UmcKQ6PGIdzWpYLDwOD9GX+A
	ekud1ErWkWVktYlBuTfKBjGNq6bstfI3NcH6eQYJri7Wq8kwQPTz7GvUupHUMiKO71Zs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-176278-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 176278: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=bb1376254803bfdaa012c62f1cf6d6b26161cfe7
X-Osstest-Versions-That:
    ovmf=e7aac7fc137e247edad22f7ee53b9a1fba227397
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 30 Jan 2023 09:40:30 +0000

flight 176278 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/176278/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 bb1376254803bfdaa012c62f1cf6d6b26161cfe7
baseline version:
 ovmf                 e7aac7fc137e247edad22f7ee53b9a1fba227397

Last test of basis   176248  2023-01-27 14:45:33 Z    2 days
Testing same since   176278  2023-01-30 07:40:53 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Pierre Gondois <pierre.gondois@arm.com>

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
   e7aac7fc13..bb13762548  bb1376254803bfdaa012c62f1cf6d6b26161cfe7 -> xen-tested-master

