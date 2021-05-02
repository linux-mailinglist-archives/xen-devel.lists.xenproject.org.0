Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E77370AFD
	for <lists+xen-devel@lfdr.de>; Sun,  2 May 2021 11:54:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121144.228884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ld8nm-0007Ll-6Q; Sun, 02 May 2021 09:54:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121144.228884; Sun, 02 May 2021 09:54:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ld8nm-0007LK-2E; Sun, 02 May 2021 09:54:14 +0000
Received: by outflank-mailman (input) for mailman id 121144;
 Sun, 02 May 2021 09:54:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ld8nk-0007LC-U0; Sun, 02 May 2021 09:54:12 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ld8nk-0002pQ-NT; Sun, 02 May 2021 09:54:12 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ld8nk-0008QO-FZ; Sun, 02 May 2021 09:54:12 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ld8nk-00022l-F5; Sun, 02 May 2021 09:54:12 +0000
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
	bh=thQWkO41urZz2et5aFIpD56cgyKJDubR6WJ4z13NHoc=; b=0O84JwijIwR2B0S+CItSmY9qHU
	gjt+49fyYU5icFbSkNIwz1nq0MuYABvfqxfewGnVtlpjUD0ZMddHt/Fof7Q9VPYzXXYylDnW6/bgf
	yxZDbmLZ+5IKoACkSp0JXISLckRccDAmzQP6WxW0nlyGjpIW+pSC9xLMxjhw54RIKcsg=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161601-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 161601: all pass - PUSHED
X-Osstest-Versions-This:
    xen=1f8ee4cb430e5a9da37096574c41632cf69a0bc7
X-Osstest-Versions-That:
    xen=972ba1d1d4bcb77018b50fd2bb63c0e628859ed3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 02 May 2021 09:54:12 +0000

flight 161601 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/161601/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  1f8ee4cb430e5a9da37096574c41632cf69a0bc7
baseline version:
 xen                  972ba1d1d4bcb77018b50fd2bb63c0e628859ed3

Last test of basis   161502  2021-04-28 09:18:31 Z    4 days
Testing same since   161601  2021-05-02 09:18:26 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
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
   972ba1d1d4..1f8ee4cb43  1f8ee4cb430e5a9da37096574c41632cf69a0bc7 -> coverity-tested/smoke

