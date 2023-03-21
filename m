Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4336C2D91
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 10:07:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512265.792137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peXwz-0005tq-7r; Tue, 21 Mar 2023 09:06:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512265.792137; Tue, 21 Mar 2023 09:06:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peXwz-0005rb-48; Tue, 21 Mar 2023 09:06:37 +0000
Received: by outflank-mailman (input) for mailman id 512265;
 Tue, 21 Mar 2023 09:06:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1peXwy-0005rR-1q; Tue, 21 Mar 2023 09:06:36 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1peXwx-0007Ke-W3; Tue, 21 Mar 2023 09:06:35 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1peXwx-0003YI-J2; Tue, 21 Mar 2023 09:06:35 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1peXwx-0007Pd-IP; Tue, 21 Mar 2023 09:06:35 +0000
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
	bh=dhaZxWUzoxw5aKUosK9BLXJYLz7ICYJkoc7Ya5QnKck=; b=HzzOuLvsLxyYnP3gbyh0ttjAvj
	bmylk2jEXMOfrqTSND1Ce7FaF/aXxo7dvLsJQfkT4DPlfvZGByB258lu2ithevRsNYXcOeWNb7QWh
	hdvnb8cVui66M/asmxS05O1z6Qp0RIa6jHKrYaPWcjHiCfoblzYccw6htcvHeixGFGe4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-179832-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 179832: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=494127613b36e870250649b02cd4ce5f1969d9bd
X-Osstest-Versions-That:
    ovmf=b7a8264ae4704f781e70cc44dafdf07e4e5e690a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 21 Mar 2023 09:06:35 +0000

flight 179832 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/179832/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 494127613b36e870250649b02cd4ce5f1969d9bd
baseline version:
 ovmf                 b7a8264ae4704f781e70cc44dafdf07e4e5e690a

Last test of basis   179808  2023-03-20 11:40:43 Z    0 days
Testing same since   179832  2023-03-21 06:12:14 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>

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
   b7a8264ae4..494127613b  494127613b36e870250649b02cd4ce5f1969d9bd -> xen-tested-master

