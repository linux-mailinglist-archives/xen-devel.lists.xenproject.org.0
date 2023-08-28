Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DF078AE74
	for <lists+xen-devel@lfdr.de>; Mon, 28 Aug 2023 13:07:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591485.923904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaa5d-0004HL-NF; Mon, 28 Aug 2023 11:07:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591485.923904; Mon, 28 Aug 2023 11:07:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaa5d-0004EC-K1; Mon, 28 Aug 2023 11:07:25 +0000
Received: by outflank-mailman (input) for mailman id 591485;
 Mon, 28 Aug 2023 11:07:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qaa5b-0004E1-Kc; Mon, 28 Aug 2023 11:07:23 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qaa5b-0007N3-CQ; Mon, 28 Aug 2023 11:07:23 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qaa5b-000403-23; Mon, 28 Aug 2023 11:07:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qaa5b-0006Em-1d; Mon, 28 Aug 2023 11:07:23 +0000
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
	bh=G8xda19xK5C6BqFQNa4hplqrrfTlzEXSkYbuRXMmWUw=; b=a7ongHggTYIjtrl4cpe2wB8j2c
	o/REYRLGmnkBt8vpbIh0R0X3yva3fxSCb5b7AL4tdgwgkWGtXbaQzvciEDrMj77Thfy3XFpZIGvjO
	CLM+G65ZQoqnOkiDelZnoIPW+9Xni+gKcSeaqVixwfWBtbRLELs9INFGsAqZgWYcUEEU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182538-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 182538: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=92006e5804a4adff05556a97a951fd7766a1d79f
X-Osstest-Versions-That:
    ovmf=819cfc6b42a68790a23509e4fcc58ceb70e1965e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 28 Aug 2023 11:07:23 +0000

flight 182538 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182538/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 92006e5804a4adff05556a97a951fd7766a1d79f
baseline version:
 ovmf                 819cfc6b42a68790a23509e4fcc58ceb70e1965e

Last test of basis   182513  2023-08-25 01:57:27 Z    3 days
Testing same since   182534  2023-08-28 06:40:50 Z    0 days    3 attempts

------------------------------------------------------------
People who touched revisions under test:
  KasimX Liu <kasimx.liu@intel.com>

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
   819cfc6b42..92006e5804  92006e5804a4adff05556a97a951fd7766a1d79f -> xen-tested-master

