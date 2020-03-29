Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5708F196CA0
	for <lists+xen-devel@lfdr.de>; Sun, 29 Mar 2020 12:48:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIVQH-0006H0-QK; Sun, 29 Mar 2020 10:44:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0pHA=5O=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jIVQG-0006Gv-A8
 for xen-devel@lists.xenproject.org; Sun, 29 Mar 2020 10:44:08 +0000
X-Inumbo-ID: 32e530fa-71aa-11ea-8d5f-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 32e530fa-71aa-11ea-8d5f-12813bfff9fa;
 Sun, 29 Mar 2020 10:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mmfr1vi54ZuiFb3OlwKj9JDIMMLooHLKv2kneoc1qXo=; b=oq9DSRGlXk5DifI9bvs4WUYPo
 wIfdfh5Eykn8q4ttIF1QjndrJngfbZV0UPTRySsoNY5AW8VvF2G67r0l+Zm1uTz/UNEfvZSpxo7Pm
 lK1MK12uUQkq5q0uFSozQF4z6oHapAJiG9V824MhbH47lCDVFvs8yqhQ2G91NiXC7/Lu4=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jIVQ7-0000IN-SS; Sun, 29 Mar 2020 10:43:59 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jIVQ7-0000t7-Ks; Sun, 29 Mar 2020 10:43:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jIVQ7-0006TZ-KE; Sun, 29 Mar 2020 10:43:59 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149162-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
X-Osstest-Versions-This: xen=e19b4b3b55f84e0cfcc02fe5d66965969a81c965
X-Osstest-Versions-That: xen=0537d246f8db3ac0a1df2ce653b07e85cd887962
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 29 Mar 2020 10:43:59 +0000
Subject: [Xen-devel] [xen-unstable-coverity test] 149162: all pass - PUSHED
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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

flight 149162 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149162/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  e19b4b3b55f84e0cfcc02fe5d66965969a81c965
baseline version:
 xen                  0537d246f8db3ac0a1df2ce653b07e85cd887962

Last test of basis   149009  2020-03-25 09:19:33 Z    4 days
Testing same since   149162  2020-03-29 09:24:18 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Dario Faggioli <dfaggioli@suse.com>
  Igor Druzhinin <igor.druzhinin@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Michael Young <m.a.young@durham.ac.uk>
  Paul Durrant <paul@xen.org>
  Paul Durrant <pdurrant@amazon.com>
  Pu Wen <puwen@hygon.cn>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Wei Liu <wl@xen.org>
  YOUNG, MICHAEL A <m.a.young@durham.ac.uk>

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
   0537d246f8..e19b4b3b55  e19b4b3b55f84e0cfcc02fe5d66965969a81c965 -> coverity-tested/smoke

