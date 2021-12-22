Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FB747CFCA
	for <lists+xen-devel@lfdr.de>; Wed, 22 Dec 2021 11:15:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250733.431815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzyeS-0003R1-59; Wed, 22 Dec 2021 10:15:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250733.431815; Wed, 22 Dec 2021 10:15:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzyeS-0003Op-1m; Wed, 22 Dec 2021 10:15:16 +0000
Received: by outflank-mailman (input) for mailman id 250733;
 Wed, 22 Dec 2021 10:15:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mzyeQ-0003Od-R5; Wed, 22 Dec 2021 10:15:14 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mzyeQ-0001Qp-Q9; Wed, 22 Dec 2021 10:15:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mzyeQ-0003VZ-IV; Wed, 22 Dec 2021 10:15:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mzyeQ-0005i3-I7; Wed, 22 Dec 2021 10:15:14 +0000
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
	bh=OfhFKs7ELeWW+y9ZVKscb8VyjvSbTNFwuBMSTrAlDMs=; b=JuYD/SmoOUlZzqU+1+OmHExp4W
	1ZpTeExjUdUb1oyI0VmHhLV6r9wAKJ7iGWuDR+g3OthiI2SPDcv2Suc9kP4nyIJrAhj030N5b/clz
	GN5rpI4v7GtU8B5oMgUn56+GCNw8oE470ybkZtCcn1HOyfCCrBM1/TH58KWn2pDeLpRs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-167517-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 167517: all pass - PUSHED
X-Osstest-Versions-This:
    xen=f1e268b9fd13647e1f69c8ce0ae7be401d319fc8
X-Osstest-Versions-That:
    xen=8e3edefb880caeeaaf80123d5599139e8c2c9ecf
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 22 Dec 2021 10:15:14 +0000

flight 167517 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167517/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  f1e268b9fd13647e1f69c8ce0ae7be401d319fc8
baseline version:
 xen                  8e3edefb880caeeaaf80123d5599139e8c2c9ecf

Last test of basis   167483  2021-12-19 09:20:44 Z    3 days
Testing same since   167517  2021-12-22 09:19:52 Z    0 days    1 attempts

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
   8e3edefb88..f1e268b9fd  f1e268b9fd13647e1f69c8ce0ae7be401d319fc8 -> coverity-tested/smoke

