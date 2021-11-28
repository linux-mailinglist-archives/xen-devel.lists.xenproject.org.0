Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE4F460582
	for <lists+xen-devel@lfdr.de>; Sun, 28 Nov 2021 10:50:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234150.406399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrGoU-0000bC-Kq; Sun, 28 Nov 2021 09:49:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234150.406399; Sun, 28 Nov 2021 09:49:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrGoU-0000ZL-FR; Sun, 28 Nov 2021 09:49:38 +0000
Received: by outflank-mailman (input) for mailman id 234150;
 Sun, 28 Nov 2021 09:49:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mrGoS-0000ZB-Ou; Sun, 28 Nov 2021 09:49:36 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mrGoS-0002mo-HS; Sun, 28 Nov 2021 09:49:36 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mrGoS-0008Mt-7w; Sun, 28 Nov 2021 09:49:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mrGoS-00078I-7T; Sun, 28 Nov 2021 09:49:36 +0000
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
	bh=vPOTbXwg1/24cPn8AYRNcSOGi6tqOp080u7o6XMY21M=; b=ZNd82Rdp+vqepgKTOHAFASyApW
	P5lh7++ipEBdFDRe5mv7tKeKnZd93I8cbU/mb5GCcpw365++lHrMGJdb+fuUCTg8is5svtlolYN5Y
	k9jLcy6l2+kPPWK1e0z6nkuOvaGD68pkp2aQ7qfWjOCS1tBeomXwnkJn675pX/WSM2cU=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-166945-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 166945: all pass - PUSHED
X-Osstest-Versions-This:
    xen=5449ba84e99849ee2339fd79f9717e10113d702d
X-Osstest-Versions-That:
    xen=a5706b80f42e028c5153fc50734a1e86a99ff9d2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 28 Nov 2021 09:49:36 +0000

flight 166945 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/166945/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  5449ba84e99849ee2339fd79f9717e10113d702d
baseline version:
 xen                  a5706b80f42e028c5153fc50734a1e86a99ff9d2

Last test of basis   166347  2021-11-24 09:18:32 Z    4 days
Testing same since   166945  2021-11-28 09:19:32 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ian Jackson <iwj@xenproject.org>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
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
   a5706b80f4..5449ba84e9  5449ba84e99849ee2339fd79f9717e10113d702d -> coverity-tested/smoke

