Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BB924ECBF
	for <lists+xen-devel@lfdr.de>; Sun, 23 Aug 2020 12:44:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k9nTK-0006bu-T0; Sun, 23 Aug 2020 10:43:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zTdr=CB=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1k9nTJ-0006b7-1z
 for xen-devel@lists.xenproject.org; Sun, 23 Aug 2020 10:43:33 +0000
X-Inumbo-ID: 403c223e-7e3a-4d5f-a3e9-b77042c6bc12
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 403c223e-7e3a-4d5f-a3e9-b77042c6bc12;
 Sun, 23 Aug 2020 10:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=U6/bFHuLXZh4QUPIYevAm59ft8HEiYau7BBcc6EhyiQ=; b=1a+LhTPpkSNKIg26xPoywjuSb2
 mySHc7ip2aMI2HlB9QGAd9bFJY3gnUTiCh93r3ltzXd/Arz/C1HeasThNGtIUcyyfiK9U6B+iyU5c
 U/Y0YS5Ul1VmqJRv8FxtVRXxt00+DFtMSrr90faK0HcPxSxNTKoEIKbiKdgoQP0vDRJQ=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k9nTB-0003ae-Vu; Sun, 23 Aug 2020 10:43:25 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1k9nTB-0005mz-Mm; Sun, 23 Aug 2020 10:43:25 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1k9nTB-00062e-MH; Sun, 23 Aug 2020 10:43:25 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152693-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 152693: all pass - PUSHED
X-Osstest-Versions-This: xen=858c0be8c2fa4125a0fa0acaa03ae730e5c7cb3c
X-Osstest-Versions-That: xen=391a8b6d20b72c4f24f8511f78ef75a6119cbe22
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 23 Aug 2020 10:43:25 +0000
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

flight 152693 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152693/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  858c0be8c2fa4125a0fa0acaa03ae730e5c7cb3c
baseline version:
 xen                  391a8b6d20b72c4f24f8511f78ef75a6119cbe22

Last test of basis   152618  2020-08-19 09:19:03 Z    4 days
Testing same since   152693  2020-08-23 09:18:23 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Bertrand Marquis <bertrand.marquis@arm.com>
  Christian Lindig <christian.lindig@citrix.com>
  David Woodhouse <dwmw@amazon.co.uk>
  Don Slutz <Don.Slutz@Gmail.com>
  Edwin Török <edvin.torok@citrix.com>
  Ian Jackson <ian.jackson@eu.citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Paul Durrant <pdurrant@amazon.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>
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
   391a8b6d20..858c0be8c2  858c0be8c2fa4125a0fa0acaa03ae730e5c7cb3c -> coverity-tested/smoke

