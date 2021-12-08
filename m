Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 855D746D0FF
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 11:28:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242124.418809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muuBF-0000JF-Nl; Wed, 08 Dec 2021 10:28:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242124.418809; Wed, 08 Dec 2021 10:28:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muuBF-0000EL-GP; Wed, 08 Dec 2021 10:28:09 +0000
Received: by outflank-mailman (input) for mailman id 242124;
 Wed, 08 Dec 2021 10:28:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1muuBD-0000Dy-Dk; Wed, 08 Dec 2021 10:28:07 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1muuBD-0002xf-9Y; Wed, 08 Dec 2021 10:28:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1muuBD-0000tz-1T; Wed, 08 Dec 2021 10:28:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1muuBD-0002kU-0z; Wed, 08 Dec 2021 10:28:07 +0000
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
	bh=R67uDXZUbeGgS7NGWPzc/zK7yLZyrlKhhkULImYvaVk=; b=VP5PdiChbGTD9QBNL/nPXJHls2
	XonsTR4C+E0/qX1Uvoa+0o4OYxbRDPTZL6S8Acpk+++qhaWO9T70/wHNoFiFNftGkawhLBdXypoJN
	/iYsgLPd80suUl0SBB1N9lALBAhw98Vip/w4YOoFhOMLbjNPU+EgSTCra3e6N6aUNGns=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-167232-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 167232: all pass - PUSHED
X-Osstest-Versions-This:
    xen=608531a0cc34a5bc096ccf585e16f182b5ed83e1
X-Osstest-Versions-That:
    xen=ea0c08bc77fe7bd7e4e65c648e17752e91912d01
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 08 Dec 2021 10:28:07 +0000

flight 167232 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167232/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  608531a0cc34a5bc096ccf585e16f182b5ed83e1
baseline version:
 xen                  ea0c08bc77fe7bd7e4e65c648e17752e91912d01

Last test of basis   167144  2021-12-05 09:18:27 Z    3 days
Testing same since   167232  2021-12-08 09:18:32 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Ian Jackson <ian.jackson@citrix.com>
  Ian Jackson <iwj@xenproject.org>
  Jan Beulich <jbeulich@suse.com>
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
   ea0c08bc77..608531a0cc  608531a0cc34a5bc096ccf585e16f182b5ed83e1 -> coverity-tested/smoke

