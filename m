Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4188A2E8B81
	for <lists+xen-devel@lfdr.de>; Sun,  3 Jan 2021 10:48:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.60921.106859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kvzzb-0001B1-MB; Sun, 03 Jan 2021 09:48:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 60921.106859; Sun, 03 Jan 2021 09:48:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kvzzb-0001AY-Hj; Sun, 03 Jan 2021 09:48:07 +0000
Received: by outflank-mailman (input) for mailman id 60921;
 Sun, 03 Jan 2021 09:48:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kvzzZ-0001AO-SL; Sun, 03 Jan 2021 09:48:05 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kvzzZ-0007Pz-N8; Sun, 03 Jan 2021 09:48:05 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kvzzZ-0005ZT-GG; Sun, 03 Jan 2021 09:48:05 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kvzzZ-00087f-Fl; Sun, 03 Jan 2021 09:48:05 +0000
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
	bh=kOsqR+pyGARoIOUs8oczLhjjtG/j0gEEwku37sdsOyw=; b=AE0ZoppwhS48OTrnMm78hLDpiF
	h5H77KnXqugDCJXpYdHwZTLA9DZ2sH0E24Nt06+IYZx+qwEkmmP+vGLA3s99NYFzZg+isDylHG3mD
	yAGovhXlas16OZ8JEMlCgphYljjyjz9ILMZDP09md0GaV24nAMmKcucmJ3h7PlvIpX08=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158104-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 158104: all pass - PUSHED
X-Osstest-Versions-This:
    xen=1516ecd6f55fe3608f374f4f2548491472d1c9a1
X-Osstest-Versions-That:
    xen=98d4d6d8a6329ea3a8dcf8aab65acdd70c6397fc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 03 Jan 2021 09:48:05 +0000

flight 158104 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158104/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  1516ecd6f55fe3608f374f4f2548491472d1c9a1
baseline version:
 xen                  98d4d6d8a6329ea3a8dcf8aab65acdd70c6397fc

Last test of basis   157850  2020-12-23 09:18:32 Z   11 days
Testing same since   158104  2021-01-03 09:19:26 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>

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
   98d4d6d8a6..1516ecd6f5  1516ecd6f55fe3608f374f4f2548491472d1c9a1 -> coverity-tested/smoke

