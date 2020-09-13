Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5803E267F2A
	for <lists+xen-devel@lfdr.de>; Sun, 13 Sep 2020 12:13:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHOzn-0003Zg-Op; Sun, 13 Sep 2020 10:12:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7tEc=CW=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kHOzm-0003ZM-Tz
 for xen-devel@lists.xenproject.org; Sun, 13 Sep 2020 10:12:30 +0000
X-Inumbo-ID: 533531f1-604c-4fa2-bb23-4addb72ecc0a
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 533531f1-604c-4fa2-bb23-4addb72ecc0a;
 Sun, 13 Sep 2020 10:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=7xIGvaEeOdJbOerY1zJinkR6jkItY/wE+NIHndTYiV0=; b=es86ues0ari1naMeXvyW5SLLEO
 wETWCZj7re/ILnBMaepMmAo9Ee+l8aHe772+Z42rD4HIDgwNk3H1C2vp6GNfXlNPwqVEt9ZCJVUOe
 Z6lnHFdeL53m8Kua9WRU77IHejqwjXrGOl1pY9yIjWrkoHnTSJ/l2XGe6RAl+p+Gk8uk=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kHOzL-0005E2-Ru; Sun, 13 Sep 2020 10:12:03 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kHOzL-0006L1-Km; Sun, 13 Sep 2020 10:12:03 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kHOzL-0007ii-KK; Sun, 13 Sep 2020 10:12:03 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-154260-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 154260: all pass - PUSHED
X-Osstest-Versions-This: xen=6c5fb129e88b9c06b5fd62a410163ebb8ef77ee6
X-Osstest-Versions-That: xen=1e2d3be2e516e6f415ca6029f651b76a8563a27c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 13 Sep 2020 10:12:03 +0000
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

flight 154260 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/154260/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  6c5fb129e88b9c06b5fd62a410163ebb8ef77ee6
baseline version:
 xen                  1e2d3be2e516e6f415ca6029f651b76a8563a27c

Last test of basis   154011  2020-09-09 09:20:03 Z    4 days
Testing same since   154260  2020-09-13 09:20:39 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Diego Sueiro <diego.sueiro@arm.com>
  Ian Jackson <Ian.Jackson@citrix.com>
  Igor Druzhinin <igor.druzhinin@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com> (python parts)
  Olaf Hering <olaf@aepfle.de>
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
   1e2d3be2e5..6c5fb129e8  6c5fb129e88b9c06b5fd62a410163ebb8ef77ee6 -> coverity-tested/smoke

