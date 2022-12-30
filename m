Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 250C365959E
	for <lists+xen-devel@lfdr.de>; Fri, 30 Dec 2022 08:13:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.469848.729276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pB9Yn-0006Ea-QH; Fri, 30 Dec 2022 07:12:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 469848.729276; Fri, 30 Dec 2022 07:12:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pB9Yn-0006Br-Mi; Fri, 30 Dec 2022 07:12:09 +0000
Received: by outflank-mailman (input) for mailman id 469848;
 Fri, 30 Dec 2022 07:12:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pB9Ym-0006Bh-DS; Fri, 30 Dec 2022 07:12:08 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pB9Ym-0002ds-As; Fri, 30 Dec 2022 07:12:08 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pB9Ym-0005rZ-1n; Fri, 30 Dec 2022 07:12:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pB9Ym-0005Lz-1K; Fri, 30 Dec 2022 07:12:08 +0000
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
	bh=mxxCk7G9QjOs+B4zMjOXN3WFG7W/R8BXrVRRuY5ru8Q=; b=bGbndCJoligEoq2F4UafUud0wi
	tsoaST41hFEbQXfa4snwIuE6/NJQxyyGpOZUiy6t21Rbt/Xk4uwdun+FlVSlDWiimJmyG7gSTDSdk
	hLcr56j5kwVsxcpCXcIE0VGJQNKs9KJl7LMk9QzQlcjGg5BY7wLwspzqst8coRJWm+6Y=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175527-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175527: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=c5d68ef6e7553ab2894f541eba4e982428ecbd53
X-Osstest-Versions-That:
    ovmf=a086f4a63bc0295b0b02f8ee76381c6b437122bf
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 30 Dec 2022 07:12:08 +0000

flight 175527 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175527/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 c5d68ef6e7553ab2894f541eba4e982428ecbd53
baseline version:
 ovmf                 a086f4a63bc0295b0b02f8ee76381c6b437122bf

Last test of basis   175467  2022-12-23 15:12:13 Z    6 days
Testing same since   175527  2022-12-30 03:42:19 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Pedro Falcato <pedro.falcato@gmail.com>

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
   a086f4a63b..c5d68ef6e7  c5d68ef6e7553ab2894f541eba4e982428ecbd53 -> xen-tested-master

