Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F551BD943
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 12:15:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTjjl-000585-4M; Wed, 29 Apr 2020 10:14:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=totz=6N=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jTjjj-000580-35
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 10:14:39 +0000
X-Inumbo-ID: 388c1d8c-8a02-11ea-b07b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 388c1d8c-8a02-11ea-b07b-bc764e2007e4;
 Wed, 29 Apr 2020 10:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oivrNt+PAN4AkBDVZ5G/D9Cv4y6xo/WADZZODDu/NBU=; b=y+qJx+TMmaNBfo8Z03ksDKKJQ
 Ks2jL5jNv3c50RqWe1hKGo5z8yBL7hmTahoy7G05UKgau+1nP/T4eiBb/E/CtYZ7xSuES56zH1x8d
 h2ByDvhwZ4He3pwcWqUdGZk1MM8vygyPf7zVqH/pK1CpjRTnXd3Wa9YsKybfRzjVRI5iM=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jTjjd-0006cP-05; Wed, 29 Apr 2020 10:14:33 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jTjjc-0000hp-E3; Wed, 29 Apr 2020 10:14:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jTjjc-0004XH-DQ; Wed, 29 Apr 2020 10:14:32 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149873-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 149873: all pass - PUSHED
X-Osstest-Versions-This: xen=4ec07971f1c5a236a0d8c528d806efb6bfd3d1a6
X-Osstest-Versions-That: xen=f093b08c47b39da6019421a2b61d40745b3e573b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 29 Apr 2020 10:14:32 +0000
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

flight 149873 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149873/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  4ec07971f1c5a236a0d8c528d806efb6bfd3d1a6
baseline version:
 xen                  f093b08c47b39da6019421a2b61d40745b3e573b

Last test of basis   149828  2020-04-26 09:18:45 Z    3 days
Testing same since   149873  2020-04-29 09:19:00 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  George Dunlap <george.dunlap@citrix.com>
  Hongyan Xia <hongyxia@amazon.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Nick Rosbrook <rosbrookn@ainfosec.com>
  Nick Rosbrook <rosbrookn@gmail.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Wei Liu <wei.liu2@citrix.com>
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
   f093b08c47..4ec07971f1  4ec07971f1c5a236a0d8c528d806efb6bfd3d1a6 -> coverity-tested/smoke

