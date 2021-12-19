Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A737747A017
	for <lists+xen-devel@lfdr.de>; Sun, 19 Dec 2021 10:51:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.249271.429740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mysq0-0001KH-Pq; Sun, 19 Dec 2021 09:50:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 249271.429740; Sun, 19 Dec 2021 09:50:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mysq0-0001IE-MF; Sun, 19 Dec 2021 09:50:40 +0000
Received: by outflank-mailman (input) for mailman id 249271;
 Sun, 19 Dec 2021 09:50:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1myspz-0001I4-4E; Sun, 19 Dec 2021 09:50:39 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1myspz-0006Sk-1h; Sun, 19 Dec 2021 09:50:39 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1myspy-0007vD-OM; Sun, 19 Dec 2021 09:50:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1myspy-0007jg-Nu; Sun, 19 Dec 2021 09:50:38 +0000
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
	bh=YjmcyjM1Z51S6JQr6rWS89BK/03yByXb5gSCEUL87Ac=; b=MgJgeqqyaTJwVcZGIurDu+aHdG
	w7Zoo86J/DJeNQARGhKeBpDD3kG1ELJsrTbMrsQtUsLkArooUwsqVsVsr+0sPHULDjQXKgFIelvmK
	4Aau/EkmrxtoX1PavN0rBQ2LYe6mRrQrp8xOnK9iD8DGd4tbI41bB7vW8xoCqR9tlV4A=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-167483-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 167483: all pass - PUSHED
X-Osstest-Versions-This:
    xen=8e3edefb880caeeaaf80123d5599139e8c2c9ecf
X-Osstest-Versions-That:
    xen=df3e1a5efe700a9f59eced801cac73f9fd02a0e2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 19 Dec 2021 09:50:38 +0000

flight 167483 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167483/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  8e3edefb880caeeaaf80123d5599139e8c2c9ecf
baseline version:
 xen                  df3e1a5efe700a9f59eced801cac73f9fd02a0e2

Last test of basis   167384  2021-12-12 09:20:52 Z    7 days
Failing since        167428  2021-12-15 09:21:06 Z    4 days    2 attempts
Testing same since   167483  2021-12-19 09:20:44 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Bobby Eshleman <bobby.eshleman@gmail.com>
  Christian Lindig <christian.lindig@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Luca Fancellu <luca.fancellu@arm.com>
  Michal Orzel <michal.orzel@arm.com>
  Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
  Paul Durrant <paul@xen.org>
  Rahul Singh <rahul.singh@arm.com>
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
   df3e1a5efe..8e3edefb88  8e3edefb880caeeaaf80123d5599139e8c2c9ecf -> coverity-tested/smoke

