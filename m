Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 209FE3A5778
	for <lists+xen-devel@lfdr.de>; Sun, 13 Jun 2021 12:03:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.140991.260550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsMwu-00060V-MD; Sun, 13 Jun 2021 10:02:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 140991.260550; Sun, 13 Jun 2021 10:02:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsMwu-0005xa-IZ; Sun, 13 Jun 2021 10:02:36 +0000
Received: by outflank-mailman (input) for mailman id 140991;
 Sun, 13 Jun 2021 10:02:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lsMws-0005xP-Hn; Sun, 13 Jun 2021 10:02:34 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lsMws-000880-77; Sun, 13 Jun 2021 10:02:34 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lsMwr-0003YW-Vs; Sun, 13 Jun 2021 10:02:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lsMwr-0006ar-VO; Sun, 13 Jun 2021 10:02:33 +0000
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
	bh=QC5DrSitIhGXC/EWuoBRNXw1A7BhZaVYMQFuX+DwinQ=; b=pHsosaqnjYvf94I7XtOrfGrpx4
	IfC/RBu0/aEhwMSltX/4NlfqYMOiWZZ2pLo5Ao0autkhCeRewfjYdOKtPueC4G0BsMoKMEpQMGJKR
	SL01d1TZZbTY5XexQs0gsma3PCCKynLgcoaWNSlI54lDA1yfsXOnlzty2F/9dSnXldZo=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-162765-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 162765: all pass - PUSHED
X-Osstest-Versions-This:
    xen=93031fbe9f4c341a2e7950a088025ea550291433
X-Osstest-Versions-That:
    xen=e4fee66043120c954fc309bbb37813604c1c0eb7
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 13 Jun 2021 10:02:33 +0000

flight 162765 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/162765/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  93031fbe9f4c341a2e7950a088025ea550291433
baseline version:
 xen                  e4fee66043120c954fc309bbb37813604c1c0eb7

Last test of basis   162566  2021-06-09 09:19:38 Z    4 days
Testing same since   162765  2021-06-13 09:18:26 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Bobby Eshleman <bobbyeshleman@gmail.com>
  Connor Davis <connojdavis@gmail.com>
  Edgar E. Iglesias <edgar.iglesias@xilinx.com>
  Ian Jackson <iwj@xenproject.org>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stefano Stabellini <stefano.stabellini@xilinx.com>
  Tim Deegan <tim@xen.org>

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
   e4fee66043..93031fbe9f  93031fbe9f4c341a2e7950a088025ea550291433 -> coverity-tested/smoke

