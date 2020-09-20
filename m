Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BBD27134E
	for <lists+xen-devel@lfdr.de>; Sun, 20 Sep 2020 12:03:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kJwBF-0004K8-Ro; Sun, 20 Sep 2020 10:02:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vkzk=C5=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kJwBD-0004Jo-Rn
 for xen-devel@lists.xenproject.org; Sun, 20 Sep 2020 10:02:47 +0000
X-Inumbo-ID: 6c7f0fd2-6616-4664-9985-ba3a844fa1a6
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6c7f0fd2-6616-4664-9985-ba3a844fa1a6;
 Sun, 20 Sep 2020 10:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=AJ4yUmYXM9fs5n1QGmK/FtGZt5ClLRjzYX8nNCBnY9I=; b=2sSqHCx9z23Kfn/7jZYYMRDmFn
 8dxyIKJcE3oAguuO3tOBg+0SQ1Pvgkw8PirCxHVX+MHDeCEm0iDgDqB0EpTIfvzvNF+ufUuip2okE
 FVnSTzHjOleoJ/uF+/89/XxQpA7awsPd0hvpaTjS1bzFnmPLRKOQGplyzUTfAqJ/pf4c=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kJwB7-0001oS-5c; Sun, 20 Sep 2020 10:02:41 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kJwB6-0006ai-SQ; Sun, 20 Sep 2020 10:02:40 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kJwB6-0000Tg-Rx; Sun, 20 Sep 2020 10:02:40 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-154529-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 154529: all pass - PUSHED
X-Osstest-Versions-This: xen=baa4d064e91b6d2bcfe400bdf71f83b961e4c28e
X-Osstest-Versions-That: xen=51526576219f122ec7ccfd55dea95afbca70d330
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 20 Sep 2020 10:02:40 +0000
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

flight 154529 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/154529/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  baa4d064e91b6d2bcfe400bdf71f83b961e4c28e
baseline version:
 xen                  51526576219f122ec7ccfd55dea95afbca70d330

Last test of basis   154380  2020-09-16 09:19:21 Z    4 days
Testing same since   154529  2020-09-20 09:19:32 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Ian Jackson <ian.jackson@eu.citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>

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
   5152657621..baa4d064e9  baa4d064e91b6d2bcfe400bdf71f83b961e4c28e -> coverity-tested/smoke

