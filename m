Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D2641DFDE
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 19:16:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200147.354564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVzfW-0002b5-IF; Thu, 30 Sep 2021 17:16:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200147.354564; Thu, 30 Sep 2021 17:16:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVzfW-0002Z2-EC; Thu, 30 Sep 2021 17:16:26 +0000
Received: by outflank-mailman (input) for mailman id 200147;
 Thu, 30 Sep 2021 17:16:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mVzfU-0002Ys-Ot; Thu, 30 Sep 2021 17:16:24 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mVzfU-0004xD-JJ; Thu, 30 Sep 2021 17:16:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mVzfU-0003Je-Al; Thu, 30 Sep 2021 17:16:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mVzfU-0003ys-AC; Thu, 30 Sep 2021 17:16:24 +0000
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
	bh=BgvdHEVHLCHA4AJdKtDvvSxMG5wLfv7eKG8P6lBt9/0=; b=Jsa0LIo97lXTK5KLrGO5gX8jHI
	4G9427AIsGrFOZVnn+6CpryxApIshKLnsxsWJD4iUMlhPD9s1+7hCvqPNloG+EqLKH2KG3G00QuWT
	JGfRVdcJ3ksymAEkhDlrGUU5XOl4vSPyLJhIUXPtsU6bRJyk0zlmGHViuTleT25wpOJ4=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165334-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 165334: trouble: pass/preparing
X-Osstest-Failures:
    xtf:test-xtf-amd64-amd64-1:hosts-allocate:running:regression
    xtf:test-xtf-amd64-amd64-2:hosts-allocate:running:regression
    xtf:test-xtf-amd64-amd64-3:hosts-allocate:running:regression
    xtf:test-xtf-amd64-amd64-4:hosts-allocate:running:regression
    xtf:test-xtf-amd64-amd64-5:hosts-allocate:running:regression
X-Osstest-Versions-This:
    xtf=61e6f40b07d256bd62ae7b231a3eeecd49d0b15b
X-Osstest-Versions-That:
    xtf=91d215a4ed1463ab14d1f68e497117ac1255e05e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 30 Sep 2021 17:16:24 +0000

flight 165334 xtf running [real]
http://logs.test-lab.xenproject.org/osstest/logs/165334/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-xtf-amd64-amd64-1        3 hosts-allocate               running
 test-xtf-amd64-amd64-2        3 hosts-allocate               running
 test-xtf-amd64-amd64-3        3 hosts-allocate               running
 test-xtf-amd64-amd64-4        3 hosts-allocate               running
 test-xtf-amd64-amd64-5        3 hosts-allocate               running

version targeted for testing:
 xtf                  61e6f40b07d256bd62ae7b231a3eeecd49d0b15b
baseline version:
 xtf                  91d215a4ed1463ab14d1f68e497117ac1255e05e

Last test of basis   164867  2021-09-07 00:10:12 Z   23 days
Testing same since                          (not found)         0 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Michal Orzel <michal.orzel@arm.com>

jobs:
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-amd64-pvops                                            pass    
 test-xtf-amd64-amd64-1                                       preparing
 test-xtf-amd64-amd64-2                                       preparing
 test-xtf-amd64-amd64-3                                       preparing
 test-xtf-amd64-amd64-4                                       preparing
 test-xtf-amd64-amd64-5                                       preparing


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


Not pushing.

------------------------------------------------------------
commit 61e6f40b07d256bd62ae7b231a3eeecd49d0b15b
Author: Michal Orzel <michal.orzel@arm.com>
Date:   Thu Sep 30 08:52:30 2021 +0200

    xsa-227: Fix link to XSA-227 web page
    
    Current link is invalid and gives the following error:
    "The requested URL was not found on this server."
    Fix it.
    
    Signed-off-by: Michal Orzel <michal.orzel@arm.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
    
    XSA-227 was first written before c/s 487bce87eda33 "Docs: Fix the generated
    advisory links" but upstreamed later, hence the missing of the tree-wide
    cleanup.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 9dadad475cf2018b1feac7fa440b22131b6a6ab4
Author: Michal Orzel <michal.orzel@arm.com>
Date:   Thu Sep 30 09:26:43 2021 +0200

    xsa-265: Fix link to a web page
    
    Currently, link points to XSA-264 and not XSA-265.
    Fix it.
    
    Signed-off-by: Michal Orzel <michal.orzel@arm.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

