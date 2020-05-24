Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8251DFE44
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2020 12:14:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jcncw-0002At-Si; Sun, 24 May 2020 10:13:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2e/K=7G=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jcncv-0002Ao-MF
 for xen-devel@lists.xenproject.org; Sun, 24 May 2020 10:13:05 +0000
X-Inumbo-ID: 28223a90-9da7-11ea-b07b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 28223a90-9da7-11ea-b07b-bc764e2007e4;
 Sun, 24 May 2020 10:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s6FsZrmcnsHYj+X2BKNwmFK0HWHEgGzWD9wY8dzJI68=; b=QF+EXP8zknw5rMkUMI0m3/gvB
 kI/OzW9guV1XbpT93yF3RH+QzTXy0sfX/clREBKy7n1G6HLHi0HmrfiCQPAGTc0oYQpPJVDrY/4s5
 aa+EfJJzZ1FTckD8CxpBruIozIVwOZKoanthwS9q7oaIQ4CWwihhmkwCIYQBzO8u31V+4=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jcnct-0007H9-Vf; Sun, 24 May 2020 10:13:04 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jcncs-0003F3-Ov; Sun, 24 May 2020 10:13:02 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jcncs-0004wY-OK; Sun, 24 May 2020 10:13:02 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150349-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 150349: all pass - PUSHED
X-Osstest-Versions-This: xen=5e015d48a5ee68ba03addad2698364d8f015afec
X-Osstest-Versions-That: xen=e235fa2794c95365519eac714d6ea82f8e64752e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 24 May 2020 10:13:02 +0000
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

flight 150349 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150349/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  5e015d48a5ee68ba03addad2698364d8f015afec
baseline version:
 xen                  e235fa2794c95365519eac714d6ea82f8e64752e

Last test of basis   150274  2020-05-20 09:20:08 Z    4 days
Testing same since   150349  2020-05-24 09:19:09 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  David Woodhouse <dwmw@amazon.co.uk>
  George Dunlap <george.dunlap@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Nick Rosbrook <rosbrookn@ainfosec.com>
  Nick Rosbrook <rosbrookn@gmail.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Wei Liu <wl@xen.org>

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
   e235fa2794..5e015d48a5  5e015d48a5ee68ba03addad2698364d8f015afec -> coverity-tested/smoke

