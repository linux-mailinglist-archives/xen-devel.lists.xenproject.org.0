Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4713C35B2E4
	for <lists+xen-devel@lfdr.de>; Sun, 11 Apr 2021 11:49:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.108481.207081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVWht-0002LQ-H0; Sun, 11 Apr 2021 09:48:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 108481.207081; Sun, 11 Apr 2021 09:48:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVWht-0002Ky-Di; Sun, 11 Apr 2021 09:48:41 +0000
Received: by outflank-mailman (input) for mailman id 108481;
 Sun, 11 Apr 2021 09:48:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lVWhs-0002Kq-As; Sun, 11 Apr 2021 09:48:40 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lVWhs-00039A-66; Sun, 11 Apr 2021 09:48:40 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lVWhr-0008Pu-TW; Sun, 11 Apr 2021 09:48:40 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lVWhr-0004bX-T2; Sun, 11 Apr 2021 09:48:39 +0000
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
	bh=wZ5+ZvnRvvoTt5qLzrHMii7e23+pSpOr0OSfteRTKtQ=; b=2vgcSTeB+l4fIkMj6jf/QEhr2L
	BRL7VVNiLAfB3UjLmwz/9Krkvc4ETLnCA4E2lX5crzotTEY7kSoig4DYoHQnI0VpDMil9dYuf6o4r
	Zd3JgKyhK9oaAEppyd697CFvZIyiys3IrB4H5o6klAiFJPfl883a+gFUff0oKJrqu1Kk=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-160967-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 160967: all pass - PUSHED
X-Osstest-Versions-This:
    xen=935d501ccbf5b8c4db1f6d0730a4a4c998e9e76a
X-Osstest-Versions-That:
    xen=19be4d56a1f7aa65eb4d92276fa5d386e9cb2a62
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 11 Apr 2021 09:48:39 +0000

flight 160967 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/160967/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  935d501ccbf5b8c4db1f6d0730a4a4c998e9e76a
baseline version:
 xen                  19be4d56a1f7aa65eb4d92276fa5d386e9cb2a62

Last test of basis   160790  2021-04-07 09:18:32 Z    4 days
Testing same since   160967  2021-04-11 09:18:29 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Boris Ostrovsky <boris.ostrovsky@oracle.com>
  Ian Jackson <iwj@xenproject.org>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Rahul Singh <rahul.singh@arm.com>
  Roger Pau Monné <roger.pau@citrix.com>
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
   19be4d56a1..935d501ccb  935d501ccbf5b8c4db1f6d0730a4a4c998e9e76a -> coverity-tested/smoke

