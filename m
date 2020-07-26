Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 442A122DDE8
	for <lists+xen-devel@lfdr.de>; Sun, 26 Jul 2020 12:09:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jzdZk-0000TL-Jw; Sun, 26 Jul 2020 10:08:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s9Qx=BF=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jzdZi-0000TG-Tf
 for xen-devel@lists.xenproject.org; Sun, 26 Jul 2020 10:08:10 +0000
X-Inumbo-ID: e6ade39a-cf27-11ea-a662-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e6ade39a-cf27-11ea-a662-12813bfff9fa;
 Sun, 26 Jul 2020 10:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Fex71lD3WIoXQPwtI8bVa4JLDSOOr8KNmZO3Qv7nof0=; b=GoOWbPtJU8gb2W/620RJyedg/
 ofRnGncp1Czi7BPmDpN/ikhDTwdEbaYWjMhwqkwJDrnqzRrw5bQVpTO182Hbig68hqt1iuGQz/sLB
 o/s6ULMgKPIbJUWYFEiHRpGKgbxnG270FQ9HFMevtrs3mvfcQrySeSyIpoFWlpKPJPQe8=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jzdZe-0004JC-Hv; Sun, 26 Jul 2020 10:08:06 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jzdZe-00058p-AY; Sun, 26 Jul 2020 10:08:06 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jzdZe-0006pg-9s; Sun, 26 Jul 2020 10:08:06 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152213-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 152213: all pass - PUSHED
X-Osstest-Versions-This: xen=0562cbc14cf02b8188b9f1f37f39a4886776ce7c
X-Osstest-Versions-That: xen=f3885e8c3ceaef101e466466e879e97103ecce18
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 26 Jul 2020 10:08:06 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

flight 152213 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152213/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  0562cbc14cf02b8188b9f1f37f39a4886776ce7c
baseline version:
 xen                  f3885e8c3ceaef101e466466e879e97103ecce18

Last test of basis   152103  2020-07-22 09:24:23 Z    4 days
Testing same since   152213  2020-07-26 09:18:31 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>

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
   f3885e8c3c..0562cbc14c  0562cbc14cf02b8188b9f1f37f39a4886776ce7c -> coverity-tested/smoke

