Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40477410B30
	for <lists+xen-devel@lfdr.de>; Sun, 19 Sep 2021 12:55:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.190076.339907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRuSp-0001I9-Tp; Sun, 19 Sep 2021 10:54:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 190076.339907; Sun, 19 Sep 2021 10:54:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRuSp-0001Fc-Pe; Sun, 19 Sep 2021 10:54:27 +0000
Received: by outflank-mailman (input) for mailman id 190076;
 Sun, 19 Sep 2021 10:54:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mRuSo-0001FS-Ef; Sun, 19 Sep 2021 10:54:26 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mRuSo-0003YV-8P; Sun, 19 Sep 2021 10:54:26 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mRuSn-0000Ot-WE; Sun, 19 Sep 2021 10:54:26 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mRuSn-0005aJ-Vg; Sun, 19 Sep 2021 10:54:25 +0000
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
	bh=j7d2HLogYSDzsaK1i1QDkwcJSqh69YdDQHdrwd9ippM=; b=h/Vvbhex3csC1CiwdIG2TWAOT8
	gS1HXjn0y4ldFj5fYnL8ZssXaZt6wN5clBs1cHJuwzX4wtcxVIPkwr8GCJHHLZHbRk6mdujWmRSFs
	bWXGIFZuPaq1JonYtdaGDvrB2Q21QMwullVemEfjwMCLTH14GdLnOYV6w4LFszfVMDM0=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165120-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 165120: all pass - PUSHED
X-Osstest-Versions-This:
    xen=437e88417bdea0d5cd012fe9d69a3e0f8a0c13e8
X-Osstest-Versions-That:
    xen=487975df53b5298316b594550c79934d646701bd
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 19 Sep 2021 10:54:25 +0000

flight 165120 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165120/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  437e88417bdea0d5cd012fe9d69a3e0f8a0c13e8
baseline version:
 xen                  487975df53b5298316b594550c79934d646701bd

Last test of basis   164994  2021-09-15 09:19:43 Z    4 days
Testing same since   165120  2021-09-19 09:19:39 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Bertrand Marquis <bertrand.marquis@arm.com>
  Daniel P. Smith <dpsmith@apertussolutions.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stefano Stabellini <stefano.stabellini@xilinx.com>

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
   487975df53..437e88417b  437e88417bdea0d5cd012fe9d69a3e0f8a0c13e8 -> coverity-tested/smoke

