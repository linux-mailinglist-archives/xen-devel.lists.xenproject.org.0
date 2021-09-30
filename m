Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F10641DDAF
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 17:37:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200058.354443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVy7h-0002HJ-EW; Thu, 30 Sep 2021 15:37:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200058.354443; Thu, 30 Sep 2021 15:37:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVy7h-0002Dy-BT; Thu, 30 Sep 2021 15:37:25 +0000
Received: by outflank-mailman (input) for mailman id 200058;
 Thu, 30 Sep 2021 15:37:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>) id 1mVy7f-0002Dg-K9
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 15:37:23 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1mVy7f-0002f1-9U; Thu, 30 Sep 2021 15:37:23 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1mVy7e-0005xE-Uy; Thu, 30 Sep 2021 15:37:23 +0000
Received: from iwj by osstest.test-lab.xenproject.org with local (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1mVy7e-00013E-U3; Thu, 30 Sep 2021 15:37:22 +0000
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
To: xen-devel@lists.xenproject.org,jbeulich@suse.com,julien.grall.oss@gmail.com,iwj@xenproject.org,sstabellini@kernel.org,dpsmith@apertussolutions.com
Subject: [adhoc test] 165337: all pass
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Message-Id: <E1mVy7e-00013E-U3@osstest.test-lab.xenproject.org>
From: iwj@xenbits.xen.org
Date: Thu, 30 Sep 2021 15:37:22 +0000

[adhoc adhoc] <testing.git master /dev/pts/25>
harness 3a3089c9: mfi-common: Drop Linux dom0 i386 tests for newer Lin...
165337: all pass

flight 165337 xen-unstable adhoc [adhoc]
http://logs.test-lab.xenproject.org/osstest/logs/165337/

Perfect :-)
All tests in this flight passed as required

jobs:
 build-arm64-pvops                                            pass    


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


