Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5A21DAFEB
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 12:18:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbLnh-0001jW-PK; Wed, 20 May 2020 10:18:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AfT1=7C=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jbLng-0001jK-67
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 10:18:12 +0000
X-Inumbo-ID: 325c8a8c-9a83-11ea-b9cf-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 325c8a8c-9a83-11ea-b9cf-bc764e2007e4;
 Wed, 20 May 2020 10:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hF5aIMMfRUp6EW25+tUAk8ULKTlxeJcZmh6D/WopuCc=; b=Ul2w7TwlzJyuBicEJuyeg0yPm
 7GTPU3o2b++oJunReR+ucPZIWs6ceyd08q8UZtu1s6VXKSoxWImJWuRP5qDJUM1jlv3FE/pMkig+x
 XCnvMaaDdr18GJhQ3Y2X125kikh7wrVI5ZdPFXh0+GurlcXGrpbXbWYwZujtYAerDE++k=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jbLna-0006Zt-81; Wed, 20 May 2020 10:18:06 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jbLnZ-0004Xc-W5; Wed, 20 May 2020 10:18:06 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jbLnZ-000556-VU; Wed, 20 May 2020 10:18:05 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150274-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 150274: all pass - PUSHED
X-Osstest-Versions-This: xen=e235fa2794c95365519eac714d6ea82f8e64752e
X-Osstest-Versions-That: xen=664e1bc12f8658da124a4eff7a8f16da073bd47f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 20 May 2020 10:18:05 +0000
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

flight 150274 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150274/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  e235fa2794c95365519eac714d6ea82f8e64752e
baseline version:
 xen                  664e1bc12f8658da124a4eff7a8f16da073bd47f

Last test of basis   150224  2020-05-17 09:19:02 Z    3 days
Testing same since   150274  2020-05-20 09:20:08 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Eric Shelton <eshelton@pobox.com>
  Ian Jackson <ian.jackson@eu.citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Jason Andryuk <jandryuk@gmail.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Olaf Hering <olaf@aepfle.de>
  Simon Gaiser <simon@invisiblethingslab.com>
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
   664e1bc12f..e235fa2794  e235fa2794c95365519eac714d6ea82f8e64752e -> coverity-tested/smoke

