Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D36B549C7B1
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 11:41:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260784.450863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCfk8-0003v4-Q3; Wed, 26 Jan 2022 10:41:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260784.450863; Wed, 26 Jan 2022 10:41:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCfk8-0003sN-Mr; Wed, 26 Jan 2022 10:41:36 +0000
Received: by outflank-mailman (input) for mailman id 260784;
 Wed, 26 Jan 2022 10:41:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nCfk6-0003sD-Ui; Wed, 26 Jan 2022 10:41:34 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nCfk6-0008Ak-To; Wed, 26 Jan 2022 10:41:34 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nCfk6-0000Ox-Fl; Wed, 26 Jan 2022 10:41:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nCfk6-0007dA-FH; Wed, 26 Jan 2022 10:41:34 +0000
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
	bh=DN5K3dEWXfxyFJsG8oVHo01UkwscKcfkri4938n0pqg=; b=0LihzW0U742ghUQ+8c+2hkyYlf
	OK9WX7vOG83qOZAqqQxsuUtMSNXymZ+YQCjbXVYAxEmS9ZOb7u95Nh3sTKzOi10Do9L1jYWN0vYvL
	7986YJT8G4c/XbAoBr2WlzLVZ36DQpOgzAdV3jFdjlLsQo8LtrfLNx35byS/sfWJXZF8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-167855-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 167855: all pass - PUSHED
X-Osstest-Versions-This:
    xen=9480a1a519cf016623f657dc544cb372a82b5708
X-Osstest-Versions-That:
    xen=fe9be76d880b1d43b9dca471f45af3fd380ecb00
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 26 Jan 2022 10:41:34 +0000

flight 167855 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167855/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  9480a1a519cf016623f657dc544cb372a82b5708
baseline version:
 xen                  fe9be76d880b1d43b9dca471f45af3fd380ecb00

Last test of basis   167798  2022-01-23 09:19:41 Z    3 days
Testing same since   167855  2022-01-26 09:18:33 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
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
   fe9be76d88..9480a1a519  9480a1a519cf016623f657dc544cb372a82b5708 -> coverity-tested/smoke

