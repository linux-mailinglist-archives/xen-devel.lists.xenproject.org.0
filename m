Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7179220996
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 12:10:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jveMr-00078Z-1G; Wed, 15 Jul 2020 10:10:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tzA3=A2=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jveMp-00078A-Ea
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 10:10:23 +0000
X-Inumbo-ID: 6205bb88-c683-11ea-8496-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6205bb88-c683-11ea-8496-bc764e2007e4;
 Wed, 15 Jul 2020 10:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4j4Vmq+BupEO1No6Z0EgZlfIMC5GPOT4aFBLG4ckspc=; b=pX1Wib2Z6mHWHwPkyRLS2KcG/
 XOp+Qd34C6Gm3wFvHzcCE33UBAoBxdPNRCd/T6BYDPOF4n+2mmCn2UFjNO7TFI6j01AIIKzNwIchk
 +rrS/g7nU0YM6LliqcYb9KFEOC0YN8bhGBoiK+d4nlPyPL8mQVdYZk8s+/x1Yw2MnpbRE=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jveMi-00025F-QT; Wed, 15 Jul 2020 10:10:16 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jveMi-0005jm-7c; Wed, 15 Jul 2020 10:10:16 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jveMi-0003Pp-6x; Wed, 15 Jul 2020 10:10:16 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151916-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 151916: all pass - PUSHED
X-Osstest-Versions-This: xen=1969576661f3e34318e9b0a61a1a38f9a5aee16f
X-Osstest-Versions-That: xen=02d69864b51a4302a148c28d6d391238a6778b4b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 15 Jul 2020 10:10:16 +0000
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

flight 151916 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151916/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  1969576661f3e34318e9b0a61a1a38f9a5aee16f
baseline version:
 xen                  02d69864b51a4302a148c28d6d391238a6778b4b

Last test of basis   151847  2020-07-12 09:18:34 Z    3 days
Testing same since   151916  2020-07-15 09:18:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ian Jackson <ian.jackson@eu.citrix.com>
  Jan Beulich <jbeulich@suse.com>
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
   02d69864b5..1969576661  1969576661f3e34318e9b0a61a1a38f9a5aee16f -> coverity-tested/smoke

