Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF49A4C0F94
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 10:52:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277242.473676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMoJ5-0002bg-Gb; Wed, 23 Feb 2022 09:51:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277242.473676; Wed, 23 Feb 2022 09:51:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMoJ5-0002Z8-Dc; Wed, 23 Feb 2022 09:51:35 +0000
Received: by outflank-mailman (input) for mailman id 277242;
 Wed, 23 Feb 2022 09:51:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nMoJ4-0002Yy-2h; Wed, 23 Feb 2022 09:51:34 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nMoJ3-0005tg-Un; Wed, 23 Feb 2022 09:51:33 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nMoJ3-00049A-IC; Wed, 23 Feb 2022 09:51:33 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nMoJ3-00016s-Hk; Wed, 23 Feb 2022 09:51:33 +0000
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
	bh=zPgU9Cx1SQLn4pAQQad4QrbkaTz832YXzo57BdmOVRE=; b=X8fwaRYJPURT6V4dgCY7KuN7Tr
	BliqcNNfGlg3ryljfKUBBoBxmZ4RrnrEdowT5GL0Jf7Cu55m4j9Dj0AN5L0srzz46pzcjqNA8JhyT
	IYQM546MeHzgRRfUZqDHXhLXsZde/0o4SA/hLG7wWCmia4GDvVf6Mw10MIzLynhDFfGo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-168204-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 168204: all pass - PUSHED
X-Osstest-Versions-This:
    xen=210f27e55abd2a57c01105992bc10bc4d7b8132d
X-Osstest-Versions-That:
    xen=686f13cfce1d95464ff39fb59ac1f85163cea03b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 23 Feb 2022 09:51:33 +0000

flight 168204 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/168204/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  210f27e55abd2a57c01105992bc10bc4d7b8132d
baseline version:
 xen                  686f13cfce1d95464ff39fb59ac1f85163cea03b

Last test of basis   168177  2022-02-20 09:19:40 Z    3 days
Testing same since   168204  2022-02-23 09:20:59 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>

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
   686f13cfce..210f27e55a  210f27e55abd2a57c01105992bc10bc4d7b8132d -> coverity-tested/smoke

