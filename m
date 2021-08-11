Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B2D3E8D92
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 11:53:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165579.302562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDkuw-0002qG-Ku; Wed, 11 Aug 2021 09:52:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165579.302562; Wed, 11 Aug 2021 09:52:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDkuw-0002nf-HB; Wed, 11 Aug 2021 09:52:58 +0000
Received: by outflank-mailman (input) for mailman id 165579;
 Wed, 11 Aug 2021 09:52:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mDkuu-0002nR-LW; Wed, 11 Aug 2021 09:52:56 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mDkuu-0002Sn-GC; Wed, 11 Aug 2021 09:52:56 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mDkuu-0007uz-6B; Wed, 11 Aug 2021 09:52:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mDkuu-0007BF-5a; Wed, 11 Aug 2021 09:52:56 +0000
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
	bh=xGYGoG3ZjiIUo0aWtXt3rifUX5jvi+X+HECDAEvnqgM=; b=QSzX6AsoVjXK0EBjlrTxaMurfU
	JqquZGdd93iizghfSLl9SI+YF3YCaRZpkzsJAY7UyfLK5OUOpVVJ1bZSVZKyBC6mcc4BpJXf+XQHU
	lepYNhmzI4a44+MpLT+PhisnkkHqNXQxaX13l4DJj6F985tgtLJMNubDIqy4Vcqi9ZvU=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164158-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 164158: all pass - PUSHED
X-Osstest-Versions-This:
    xen=25da9455f1bb8a6d33039575a7b28bdfc4e3fcfe
X-Osstest-Versions-That:
    xen=2b45ff60301a988badec526846e77b538383ae63
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 11 Aug 2021 09:52:56 +0000

flight 164158 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164158/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  25da9455f1bb8a6d33039575a7b28bdfc4e3fcfe
baseline version:
 xen                  2b45ff60301a988badec526846e77b538383ae63

Last test of basis   164133  2021-08-08 09:19:35 Z    3 days
Testing same since   164158  2021-08-11 09:19:40 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Anthony PERARD <anthony.perard@citrix.com>
  Dario Faggioli <dfaggioli@suse.com>
  Jan Beulich <jbeulich@suse.com>
  Jane Malalane <jane.malalane@citrix.com>

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
   2b45ff6030..25da9455f1  25da9455f1bb8a6d33039575a7b28bdfc4e3fcfe -> coverity-tested/smoke

