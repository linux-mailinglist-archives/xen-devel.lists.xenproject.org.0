Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 884A71FCA2C
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 11:49:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlUgS-0001Fx-Ti; Wed, 17 Jun 2020 09:48:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EDe+=76=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jlUgR-0001Fd-AG
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 09:48:39 +0000
X-Inumbo-ID: b53fcf24-b07f-11ea-b7bb-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b53fcf24-b07f-11ea-b7bb-bc764e2007e4;
 Wed, 17 Jun 2020 09:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eUZMhkBEY0GHPn35bUmtW2VgD75gHL5pCVCpExNeFRo=; b=XXSYhvpN99pIduVPEz5D21QKK
 YnA1YCXo5k/+c8jcs9W3jyxYdxz9c7dFTl+zEr2nn3OVRBJgp50z/cXc9fLnHJgJbGVLbMFZYhAYn
 rPVkldvQUDBcqHWOzFEg2KYVkZy7dDmhkNSs9QFUT6VJFCrMZlUlsgshVSRlQaPeQQKFo=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jlUgK-0007ra-Ri; Wed, 17 Jun 2020 09:48:32 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jlUgK-0003LH-Id; Wed, 17 Jun 2020 09:48:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jlUgK-0005RB-I9; Wed, 17 Jun 2020 09:48:32 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151186-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 151186: all pass - PUSHED
X-Osstest-Versions-This: xen=3625b04991b4d6affadd99d377ab84bac48dfff4
X-Osstest-Versions-That: xen=b91825f628c9a62cf2a3a0d972ea81484a8b7fce
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 17 Jun 2020 09:48:32 +0000
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

flight 151186 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151186/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  3625b04991b4d6affadd99d377ab84bac48dfff4
baseline version:
 xen                  b91825f628c9a62cf2a3a0d972ea81484a8b7fce

Last test of basis   151106  2020-06-14 09:23:09 Z    3 days
Testing same since   151186  2020-06-17 09:18:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Bertrand Marquis <bertrand.marquis@arm.com>
  George Dunlap <george.dunlap@citrix.com>
  Ian Jackson <ian.jackson@eu.citrix.com>
  Jason Andryuk <jandryuk@gmail.com>
  Nick Rosbrook <rosbrookn@ainfosec.com>
  Nick Rosbrook <rosbrookn@gmail.com>
  Tamas K Lengyel <tamas.lengyel@intel.com>
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
   b91825f628..3625b04991  3625b04991b4d6affadd99d377ab84bac48dfff4 -> coverity-tested/smoke

