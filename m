Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DA599FF03
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 04:44:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819495.1232820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0u0g-0005qR-W6; Wed, 16 Oct 2024 02:43:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819495.1232820; Wed, 16 Oct 2024 02:43:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0u0g-0005np-TP; Wed, 16 Oct 2024 02:43:38 +0000
Received: by outflank-mailman (input) for mailman id 819495;
 Wed, 16 Oct 2024 02:43:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t0u0f-0005nf-Ds; Wed, 16 Oct 2024 02:43:37 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t0u0f-0007ZT-BT; Wed, 16 Oct 2024 02:43:37 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t0u0f-0002ps-4O; Wed, 16 Oct 2024 02:43:37 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1t0u0f-00071k-42; Wed, 16 Oct 2024 02:43:37 +0000
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
	bh=7vn388fbocRo8GB6AjVaKYpwAakLMQeKnPP1GGxRbvE=; b=nx18C1duEf6espU7MeGbDYXmAO
	/PNLk4/I1ol0ZbjKsDOqbazrcZrSXZYZSvRUGgJDQuktRba2FEfRdlyILcqUJQzCaMZqnMJtqiBNA
	xRdw38cAzyH3SHWRam3qoZG8xds4GCKnmehOdwgdbQOrrN5U3J8yu2sE0/TtYoWK7WJE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-188102-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 188102: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=92c1274467fff3209d3bd29c2ed994b7f2be3efe
X-Osstest-Versions-That:
    ovmf=b3efbda1660372f3973c29cde0e92528862c4171
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 16 Oct 2024 02:43:37 +0000

flight 188102 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/188102/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 92c1274467fff3209d3bd29c2ed994b7f2be3efe
baseline version:
 ovmf                 b3efbda1660372f3973c29cde0e92528862c4171

Last test of basis   188099  2024-10-15 22:43:19 Z    0 days
Testing same since   188102  2024-10-16 00:43:29 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  INDIA\sachinganesh <sachinganesh@ami.com>
  Sachin Ganesh <sachinganesh@ami.com>

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
   b3efbda166..92c1274467  92c1274467fff3209d3bd29c2ed994b7f2be3efe -> xen-tested-master

