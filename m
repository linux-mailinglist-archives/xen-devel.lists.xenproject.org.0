Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFF832FFFB
	for <lists+xen-devel@lfdr.de>; Sun,  7 Mar 2021 10:51:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94468.178039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIq37-0002Cn-Ee; Sun, 07 Mar 2021 09:50:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94468.178039; Sun, 07 Mar 2021 09:50:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIq37-0002CL-Ax; Sun, 07 Mar 2021 09:50:09 +0000
Received: by outflank-mailman (input) for mailman id 94468;
 Sun, 07 Mar 2021 09:50:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lIq36-0002CD-5d; Sun, 07 Mar 2021 09:50:08 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lIq35-0008Qn-Pm; Sun, 07 Mar 2021 09:50:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lIq35-0003X4-Dh; Sun, 07 Mar 2021 09:50:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lIq35-0000t7-DJ; Sun, 07 Mar 2021 09:50:07 +0000
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
	bh=eWhuO3zrpuY57a1eoiQyuU/UY6/vbm0pcZ7CgATdiuM=; b=ogfLYrKwVhMA2ut+Ue698q6I5l
	XzHXVV81J+P758NQp/LlOb0xMv2UxMEqAYrfKpecfQjN7zoOksYJ1zl33ATRMyxS3XSx2KKHmGL2W
	LEOc+6tj+NS0naMNcQMxACUzamIJJwwy104EQeCphviuzPdggxhN64yPmrL+2zNAYfso=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159856-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 159856: all pass - PUSHED
X-Osstest-Versions-This:
    xen=51972482f77b68ef494c8b9591b125460e7984b9
X-Osstest-Versions-That:
    xen=4834936549f788378918da8e9bc97df7dd3ee16d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 07 Mar 2021 09:50:07 +0000

flight 159856 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/159856/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  51972482f77b68ef494c8b9591b125460e7984b9
baseline version:
 xen                  4834936549f788378918da8e9bc97df7dd3ee16d

Last test of basis   159815  2021-03-03 09:19:32 Z    4 days
Testing same since   159856  2021-03-07 09:20:39 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Michael Kurth <mku@amazon.com>
  Norbert Manthey <nmanthey@amazon.de>
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
   4834936549..51972482f7  51972482f77b68ef494c8b9591b125460e7984b9 -> coverity-tested/smoke

