Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A1C192479
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 10:45:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH2Yj-0006e4-1g; Wed, 25 Mar 2020 09:42:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Tuxk=5K=mail.xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1jH2Yi-0006dx-At
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 09:42:48 +0000
X-Inumbo-ID: f85a5706-6e7c-11ea-85bf-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f85a5706-6e7c-11ea-85bf-12813bfff9fa;
 Wed, 25 Mar 2020 09:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v59Ezgobg9CLBfxfLMq0j5ZCK1WotnwDlsc1oF07yhE=; b=G0m9HvVeAfBk4B+i9HF6B3rpI
 BwC0InO+LT1afshxO8KK4gX84L1sTNR3NA2VUMpoUVTRjOkJIcdY2RSUR9gquUL+2s5EnDaDLbCjP
 EpQvsSIULMVWWFmgbzUYxMt48jXp184npzvSnipY/eKaFZOqLseLnXl2wR7QV74dXApxA=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@mail.xenproject.org>)
 id 1jH2Ya-0002IS-QT; Wed, 25 Mar 2020 09:42:40 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jH2Ya-0006YN-DY; Wed, 25 Mar 2020 09:42:40 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jH2Ya-0004ld-Cy; Wed, 25 Mar 2020 09:42:40 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149009-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
X-Osstest-Versions-This: xen=0537d246f8db3ac0a1df2ce653b07e85cd887962
X-Osstest-Versions-That: xen=60d6ba1916dce0622a53b00dbae3c01d0761057e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 25 Mar 2020 09:42:40 +0000
Subject: [Xen-devel] [xen-unstable-coverity test] 149009: all pass - PUSHED
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

flight 149009 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149009/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  0537d246f8db3ac0a1df2ce653b07e85cd887962
baseline version:
 xen                  60d6ba1916dce0622a53b00dbae3c01d0761057e

Last test of basis   148841  2020-03-22 09:18:28 Z    3 days
Testing same since   149009  2020-03-25 09:19:33 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  David Woodhouse <dwmw@amazon.co.uk>
  Hongyan Xia <hongyxia@amazon.com>
  Ian Jackson <ian.jackson@eu.citrix.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <julien@xen.org>
  Paul Durrant <paul@xen.org>
  Pu Wen <puwen@hygon.cn>
  Tamas K Lengyel <tamas@tklengyel.com>
  Yan Yankovskyi <yyankovskyi@gmail.com>

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
   60d6ba1916..0537d246f8  0537d246f8db3ac0a1df2ce653b07e85cd887962 -> coverity-tested/smoke

