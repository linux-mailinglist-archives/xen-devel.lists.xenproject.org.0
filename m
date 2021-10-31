Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFD7440DB2
	for <lists+xen-devel@lfdr.de>; Sun, 31 Oct 2021 10:53:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.218885.379514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mh7VD-0007Ow-K1; Sun, 31 Oct 2021 09:51:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218885.379514; Sun, 31 Oct 2021 09:51:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mh7VD-0007MX-F5; Sun, 31 Oct 2021 09:51:47 +0000
Received: by outflank-mailman (input) for mailman id 218885;
 Sun, 31 Oct 2021 09:51:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mh7VC-0007MN-2R; Sun, 31 Oct 2021 09:51:46 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mh7VB-0005Cy-Pz; Sun, 31 Oct 2021 09:51:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mh7VB-0007BC-Gv; Sun, 31 Oct 2021 09:51:45 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mh7VB-0001Aq-GR; Sun, 31 Oct 2021 09:51:45 +0000
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
	bh=ejNykp6iBPMW+5vHQKgOeCvxVmlVl6VOGBb65M1JKAk=; b=w0NtnqGf2HJeuyLFPYWi/AAn6F
	q3fT2tQ0Uml0yQqFFFufZPt4NvBWBcxoKrXPFqC3rS/S03iHyLjKj4YMPdzu1uP+GnKvVqGV2NNsr
	5zGTqHFzJTVKHsWDmQH4oEztRd9NkZsBk+vRCQxUH9bo/XFj4jRAy2oTzm6OVko/dntY=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165960-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 165960: all pass - PUSHED
X-Osstest-Versions-This:
    xen=3030a73bf849a50411da95e94abf23cb7e8642fc
X-Osstest-Versions-That:
    xen=b0fce57a6a491c120f2554ad7cc9a0c43ee5defa
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 31 Oct 2021 09:51:45 +0000

flight 165960 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165960/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  3030a73bf849a50411da95e94abf23cb7e8642fc
baseline version:
 xen                  b0fce57a6a491c120f2554ad7cc9a0c43ee5defa

Last test of basis   165895  2021-10-27 09:18:35 Z    4 days
Testing same since   165960  2021-10-31 09:19:38 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
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
   b0fce57a6a..3030a73bf8  3030a73bf849a50411da95e94abf23cb7e8642fc -> coverity-tested/smoke

