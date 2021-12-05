Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17803468A45
	for <lists+xen-devel@lfdr.de>; Sun,  5 Dec 2021 10:49:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.238356.413120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mto8G-000514-LR; Sun, 05 Dec 2021 09:48:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 238356.413120; Sun, 05 Dec 2021 09:48:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mto8G-0004z1-Hn; Sun, 05 Dec 2021 09:48:32 +0000
Received: by outflank-mailman (input) for mailman id 238356;
 Sun, 05 Dec 2021 09:48:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mto8F-0004yr-4T; Sun, 05 Dec 2021 09:48:31 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mto8E-00074K-VG; Sun, 05 Dec 2021 09:48:30 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mto8E-0002Si-MG; Sun, 05 Dec 2021 09:48:30 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mto8E-0002Yp-Lm; Sun, 05 Dec 2021 09:48:30 +0000
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
	bh=0+wjSGyThsCzZXpTrGIjPVo5avNuQ1rCuJigxsa6/H8=; b=OpBiMJaWTDVUXSlWBptpSXQlBU
	icDgGBlbHkOQ6L7ymTRG6d/vOhHuQf8e/5yvMzCrk/1iunb6N66EWP+JK06ce3aDkSTT0LGu86tld
	aQi3yeRTNEFRFwRe4JdcNrM3dWtqCnBwV58ue4GoFoj4QVzS4n3RkzKbnQINHIh2LWo4=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-167144-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 167144: all pass - PUSHED
X-Osstest-Versions-This:
    xen=ea0c08bc77fe7bd7e4e65c648e17752e91912d01
X-Osstest-Versions-That:
    xen=e7f147bf4ac725492962a501da72f5ab6be682db
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 05 Dec 2021 09:48:30 +0000

flight 167144 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167144/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  ea0c08bc77fe7bd7e4e65c648e17752e91912d01
baseline version:
 xen                  e7f147bf4ac725492962a501da72f5ab6be682db

Last test of basis   166971  2021-12-01 09:19:46 Z    4 days
Testing same since   167144  2021-12-05 09:18:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
  Ayan Kumar Halder <ayankuma@xilinx.com>
  Ian Jackson <iwj@xenproject.org>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Luca Fancellu <luca.fancellu@arm.com>
  Michal Orzel <michal.orzel@arm.com>
  Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
  Rahul Singh <rahul.singh@arm.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
  Tim Deegan <tim@xen.org>
  Vikram Garhwal <fnu.vikram@xilinx.com>

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
   e7f147bf4a..ea0c08bc77  ea0c08bc77fe7bd7e4e65c648e17752e91912d01 -> coverity-tested/smoke

