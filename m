Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF07256D2E
	for <lists+xen-devel@lfdr.de>; Sun, 30 Aug 2020 12:00:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kCK7N-0002Nl-8P; Sun, 30 Aug 2020 09:59:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ueMT=CI=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kCK7L-0002NR-8n
 for xen-devel@lists.xenproject.org; Sun, 30 Aug 2020 09:59:19 +0000
X-Inumbo-ID: e56b03c1-9903-4bb2-bb14-5915fa072947
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e56b03c1-9903-4bb2-bb14-5915fa072947;
 Sun, 30 Aug 2020 09:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=f8kVfw3jB5h2iuAN5I+70M9KdxRxdimY10PpI596hGs=; b=ScoM2pr0edowY8bgyXS4Ry4Fcm
 Sy3S1+rKd1cztEQe9mw/hTAU5YZ58yxnE22kIIh4xgxQOsRSiCOZse9ZFqlCRVKtm29ilqkFALEsq
 55AdE5WO5MpIWUWOVF+TwGnat4qR2PcGLLjj1paHSn8ENDTu5Ru5zK1Bqm49YF3wWHvw=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kCK7D-0006jI-FA; Sun, 30 Aug 2020 09:59:11 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kCK7D-0001zr-8T; Sun, 30 Aug 2020 09:59:11 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kCK7D-0004SX-82; Sun, 30 Aug 2020 09:59:11 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-153169-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 153169: all pass - PUSHED
X-Osstest-Versions-This: xen=d400dc5729e4e132d61c2e7df57d81aaed762044
X-Osstest-Versions-That: xen=7a8d8bde9820387c3e168182b99fd9761c223fff
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 30 Aug 2020 09:59:11 +0000
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

flight 153169 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/153169/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  d400dc5729e4e132d61c2e7df57d81aaed762044
baseline version:
 xen                  7a8d8bde9820387c3e168182b99fd9761c223fff

Last test of basis   152854  2020-08-26 09:18:24 Z    4 days
Testing same since   153169  2020-08-30 09:18:24 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Costin Lupu <costin.lupu@cs.pub.ro>
  Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
  Ian Jackson <ian.jackson@eu.citrix.com>
  Ian Jackson <iwj@xenproject.org>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Paul Durrant <pdurrant@amazon.com>
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
   7a8d8bde98..d400dc5729  d400dc5729e4e132d61c2e7df57d81aaed762044 -> coverity-tested/smoke

