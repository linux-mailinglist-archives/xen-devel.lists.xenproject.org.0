Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D47191B37
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 21:41:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGqJK-0007Ff-1e; Tue, 24 Mar 2020 20:38:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=H+Hk=5J=mail.xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1jGqJI-0007Fa-Eh
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 20:38:04 +0000
X-Inumbo-ID: 58dcd734-6e0f-11ea-92cf-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58dcd734-6e0f-11ea-92cf-bc764e2007e4;
 Tue, 24 Mar 2020 20:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LrQoOWbeW+j3OXDSHPZYOaWTlsLqxwmJ0UOxB+DN55o=; b=BEFY4vrbmlFG+FpIb6hZOvkom
 AowVUxTzSOAk1/+TlqJfyXlcHqFZIWRgWmFepI23AVilHdLoPqT/m1F6MdCkhFOBllUCJoSiC2Qod
 vuSqW2P7EH5QAysh6Oxfa8iXU7xoybEn5AwkQnSf9t+rjHkj4BL9hYheFiIPoCt1zYoYU=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@mail.xenproject.org>)
 id 1jGqJC-0006Ik-2z; Tue, 24 Mar 2020 20:37:58 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jGqJB-0001vV-QW; Tue, 24 Mar 2020 20:37:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jGqJB-0004vP-Pj; Tue, 24 Mar 2020 20:37:57 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-148983-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
X-Osstest-Failures: xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: xen=0537d246f8db3ac0a1df2ce653b07e85cd887962
X-Osstest-Versions-That: xen=3ec1296ad3a823609eec479cb6c7ee493f6a888b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 24 Mar 2020 20:37:57 +0000
Subject: [Xen-devel] [xen-unstable-smoke test] 148983: tolerable all pass -
 PUSHED
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

flight 148983 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/148983/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  0537d246f8db3ac0a1df2ce653b07e85cd887962
baseline version:
 xen                  3ec1296ad3a823609eec479cb6c7ee493f6a888b

Last test of basis   148966  2020-03-24 10:00:45 Z    0 days
Testing same since   148983  2020-03-24 17:00:40 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Juergen Gross <jgross@suse.com>
  Julien Grall <julien@xen.org>
  Paul Durrant <paul@xen.org>
  Tamas K Lengyel <tamas@tklengyel.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-libvirt                                     pass    


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
   3ec1296ad3..0537d246f8  0537d246f8db3ac0a1df2ce653b07e85cd887962 -> smoke

