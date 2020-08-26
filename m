Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C56BD252AC3
	for <lists+xen-devel@lfdr.de>; Wed, 26 Aug 2020 11:52:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAs6D-00053G-VA; Wed, 26 Aug 2020 09:52:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Ngk=CE=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kAs6B-00052w-O0
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 09:52:07 +0000
X-Inumbo-ID: 7e16ce4f-dee6-41ea-b22a-b881c5e15f17
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7e16ce4f-dee6-41ea-b22a-b881c5e15f17;
 Wed, 26 Aug 2020 09:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=IXwJlLF+f2HoYeS2gQFV+ih51sEzWgCRELcQLzkXTjI=; b=LJnQKJcSJKCHgVX3DnAdIyUiel
 Vc969t0PQsUWe6xDzld+oBxmhgIxl9Sn9XGHNHri3tw63Dq4dKOm5uc0HJ6cBpJYFoJMz2GeuSwsf
 Ozj6sFC0uZY4RYsVKfllDWLOqO2RTSlQPDH+viipgQnor02Qsl+jueIVvhO5fdjbwjls=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kAs65-0006yQ-EQ; Wed, 26 Aug 2020 09:52:01 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kAs65-0003t5-70; Wed, 26 Aug 2020 09:52:01 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kAs65-0001SY-6Y; Wed, 26 Aug 2020 09:52:01 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152854-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 152854: all pass - PUSHED
X-Osstest-Versions-This: xen=7a8d8bde9820387c3e168182b99fd9761c223fff
X-Osstest-Versions-That: xen=858c0be8c2fa4125a0fa0acaa03ae730e5c7cb3c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 26 Aug 2020 09:52:01 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

flight 152854 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152854/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  7a8d8bde9820387c3e168182b99fd9761c223fff
baseline version:
 xen                  858c0be8c2fa4125a0fa0acaa03ae730e5c7cb3c

Last test of basis   152693  2020-08-23 09:18:23 Z    3 days
Testing same since   152854  2020-08-26 09:18:24 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  George Dunlap <george.dunlap@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
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
   858c0be8c2..7a8d8bde98  7a8d8bde9820387c3e168182b99fd9761c223fff -> coverity-tested/smoke

