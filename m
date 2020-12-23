Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4AA2E1ABF
	for <lists+xen-devel@lfdr.de>; Wed, 23 Dec 2020 11:08:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58284.102363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks14O-0003tB-3P; Wed, 23 Dec 2020 10:08:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58284.102363; Wed, 23 Dec 2020 10:08:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks14N-0003si-Vy; Wed, 23 Dec 2020 10:08:35 +0000
Received: by outflank-mailman (input) for mailman id 58284;
 Wed, 23 Dec 2020 10:08:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ks14M-0003sa-3n; Wed, 23 Dec 2020 10:08:34 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ks14L-0003yP-Pc; Wed, 23 Dec 2020 10:08:33 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ks14L-0007Dt-HX; Wed, 23 Dec 2020 10:08:33 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ks14L-0000BW-Gz; Wed, 23 Dec 2020 10:08:33 +0000
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
	bh=RVg091R1W8cZBEgm/hGCYSTMnr0my/oYGNKx926UQ10=; b=zfnyIQ01HBQ+9XIdtNZF/AyMVZ
	CLOLpIgSob459qH90BdmlYPAdhVrNtmIFuLTVhO6h31cGbAKJVcGmK/gjlvC/hP+i7XYjYbIHAXw7
	XLA3E/GOqb3AfKUGOO2fQKWmabqigpzH8Uz9+i6ctcuyrw962fJShAXii01/AehaSpnk=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-157850-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 157850: all pass - PUSHED
X-Osstest-Versions-This:
    xen=98d4d6d8a6329ea3a8dcf8aab65acdd70c6397fc
X-Osstest-Versions-That:
    xen=357db96a66e47e609c3b14768f1062e13eedbd93
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 23 Dec 2020 10:08:33 +0000

flight 157850 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/157850/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  98d4d6d8a6329ea3a8dcf8aab65acdd70c6397fc
baseline version:
 xen                  357db96a66e47e609c3b14768f1062e13eedbd93

Last test of basis   157738  2020-12-20 09:20:06 Z    3 days
Testing same since   157850  2020-12-23 09:18:32 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Maximilian Engelhardt <maxi@daemonizer.de>
  Stefano Stabellini <sstabellini@kernel.org>

jobs:
 coverity-amd64                                               pass    


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

To xenbits.xen.org:/home/xen/git/xen.git
   357db96a66..98d4d6d8a6  98d4d6d8a6329ea3a8dcf8aab65acdd70c6397fc -> coverity-tested/smoke

