Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD8025ED81
	for <lists+xen-devel@lfdr.de>; Sun,  6 Sep 2020 11:50:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kErJ7-0006hi-JA; Sun, 06 Sep 2020 09:49:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AZON=CP=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kErJ5-0006hd-RN
 for xen-devel@lists.xenproject.org; Sun, 06 Sep 2020 09:49:55 +0000
X-Inumbo-ID: de0b5070-2164-433c-84af-cbf0ab9e75fb
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id de0b5070-2164-433c-84af-cbf0ab9e75fb;
 Sun, 06 Sep 2020 09:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=lj3GnyuWoBOubb9sTzS7diE73cd8lVOu9u9XTl1naLM=; b=AxCUMHj5DkFMsCjbiFOmHrKGkI
 lIx5HJC6uyW3S8nTg3BWFiB68KQB9t5f0bF2QT9Sb+gg3bkXatwHfPx9CTiOuhDmz7KCQ+eIjglDT
 8mcyPr6ixMjXAXEPkp9wOs49cW9DBVtxX/4s1DkfU03qHCZZk6xObuswahgjvbfN42z4=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kErJ4-0008EM-7l; Sun, 06 Sep 2020 09:49:54 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kErJ3-0006j4-Q9; Sun, 06 Sep 2020 09:49:53 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kErJ3-0007ch-Pf; Sun, 06 Sep 2020 09:49:53 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-153795-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 153795: all pass - PUSHED
X-Osstest-Versions-This: xen=f4c1a541fa351e4f613471bbf397931f9e1ddd27
X-Osstest-Versions-That: xen=afe018e041ec112d90a8b4e6ed607d22aa06f280
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 06 Sep 2020 09:49:53 +0000
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

flight 153795 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/153795/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  f4c1a541fa351e4f613471bbf397931f9e1ddd27
baseline version:
 xen                  afe018e041ec112d90a8b4e6ed607d22aa06f280

Last test of basis   153545  2020-09-02 09:18:27 Z    4 days
Testing same since   153795  2020-09-06 09:18:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  George Dunlap <george.dunlap@citrix.com>
  Ian Jackson <iwj@xenproject.org>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Michael Kurth <mku@amazon.de>
  Nick Rosbrook <rosbrookn@ainfosec.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Wei Chen <wei.chen@arm.com>

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
   afe018e041..f4c1a541fa  f4c1a541fa351e4f613471bbf397931f9e1ddd27 -> coverity-tested/smoke

