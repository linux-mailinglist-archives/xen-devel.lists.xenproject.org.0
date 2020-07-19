Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7C1225148
	for <lists+xen-devel@lfdr.de>; Sun, 19 Jul 2020 12:29:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jx6YW-0002Uq-B4; Sun, 19 Jul 2020 10:28:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x0Gu=A6=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jx6YU-0002Ul-SB
 for xen-devel@lists.xenproject.org; Sun, 19 Jul 2020 10:28:26 +0000
X-Inumbo-ID: 941eaae2-c9aa-11ea-b7bb-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 941eaae2-c9aa-11ea-b7bb-bc764e2007e4;
 Sun, 19 Jul 2020 10:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Kt3iKyjd7c8cMIs/gkP5BTH9EuCYy8+SxObpEVdH6Wg=; b=LhjCrL9Gi/6flgFsJuOcHkDDS
 7OIfyNYZhHCta1i3Xld1Xhov9WwKYt1HZ12worcMzvDxQeWl+hSvsUhKc3V+Gve2jcOSzy16i26a1
 MI0PEIpUrZ1HDyclCT13dI8OCkSFcpB9Q9xqSVO6hbAhyAbFB3AjF//jn9nyBElmwW7Uk=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jx6YS-0002PO-RY; Sun, 19 Jul 2020 10:28:24 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jx6YS-0000Ip-F9; Sun, 19 Jul 2020 10:28:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jx6YS-0002Ns-EK; Sun, 19 Jul 2020 10:28:24 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-152012-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 152012: all pass - PUSHED
X-Osstest-Versions-This: xen=fb024b779336a0f73b3aee885b2ce082e812881f
X-Osstest-Versions-That: xen=1969576661f3e34318e9b0a61a1a38f9a5aee16f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 19 Jul 2020 10:28:24 +0000
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

flight 152012 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/152012/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  fb024b779336a0f73b3aee885b2ce082e812881f
baseline version:
 xen                  1969576661f3e34318e9b0a61a1a38f9a5aee16f

Last test of basis   151916  2020-07-15 09:18:25 Z    4 days
Testing same since   152012  2020-07-19 09:18:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jan Beulich <jbeulich@suse.com>

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
   1969576661..fb024b7793  fb024b779336a0f73b3aee885b2ce082e812881f -> coverity-tested/smoke

