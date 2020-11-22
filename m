Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEAB2BC4C4
	for <lists+xen-devel@lfdr.de>; Sun, 22 Nov 2020 10:49:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.33243.64291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kglxw-0006l6-U5; Sun, 22 Nov 2020 09:47:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 33243.64291; Sun, 22 Nov 2020 09:47:28 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kglxw-0006ka-PF; Sun, 22 Nov 2020 09:47:28 +0000
Received: by outflank-mailman (input) for mailman id 33243;
 Sun, 22 Nov 2020 09:47:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kglxv-0006kS-9t; Sun, 22 Nov 2020 09:47:27 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kglxu-0001D1-VD; Sun, 22 Nov 2020 09:47:26 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kglxu-0002er-Kq; Sun, 22 Nov 2020 09:47:26 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kglxu-0008Nz-KL; Sun, 22 Nov 2020 09:47:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kglxv-0006kS-9t; Sun, 22 Nov 2020 09:47:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=Amkfqtll0X0YJ6lyampDoyMrC35f7F3Z1jXSiXVvwX4=; b=XrLc3Pes9qpCNHM42z2zyD+PQR
	VL8M+QwOSiYvHihbrTIQBzeEZM3X+QJyX2UKzfUPfSJ6qswOkVmT+WxoJArJKEmZ134UMBOXU8U4J
	V5pzvqKPCzJLSFE+a8Zc0N1uB0+qVHhRoHtmhxqIAMO3Eso9oi5Wj8CAmtZFxzdUonEA=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kglxu-0001D1-VD; Sun, 22 Nov 2020 09:47:26 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kglxu-0002er-Kq; Sun, 22 Nov 2020 09:47:26 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kglxu-0008Nz-KL; Sun, 22 Nov 2020 09:47:26 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156941-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 156941: all pass - PUSHED
X-Osstest-Versions-This:
    xen=b659a5cebd611dbe698e63c03485b5fe8cd964ad
X-Osstest-Versions-That:
    xen=5505f5f8e7e805365cfe70b6a4af6115940bb749
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 22 Nov 2020 09:47:26 +0000

flight 156941 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156941/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  b659a5cebd611dbe698e63c03485b5fe8cd964ad
baseline version:
 xen                  5505f5f8e7e805365cfe70b6a4af6115940bb749

Last test of basis   156811  2020-11-15 09:18:26 Z    7 days
Testing same since   156941  2020-11-22 09:18:30 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andre Przywara <andre.przywara@arm.com>
  Andrew Cooper <andrew.cooper3@citrix.com>
  Doug Goldstein <cardoe@cardoe.com>
  Edwin Török <edvin.torok@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Julien Grall <julien.grall@arm.com>
  Michal Orzel <michal.orzel@arm.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>
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
   5505f5f8e7..b659a5cebd  b659a5cebd611dbe698e63c03485b5fe8cd964ad -> coverity-tested/smoke

