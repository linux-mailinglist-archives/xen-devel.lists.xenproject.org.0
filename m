Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D51228F7C5
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 19:47:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7698.20265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT7Kn-0005BS-6f; Thu, 15 Oct 2020 17:46:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7698.20265; Thu, 15 Oct 2020 17:46:37 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT7Kn-0005B3-3T; Thu, 15 Oct 2020 17:46:37 +0000
Received: by outflank-mailman (input) for mailman id 7698;
 Thu, 15 Oct 2020 17:46:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pHSr=DW=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kT7Kl-0005AW-7V
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 17:46:35 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cd581c62-18b0-46ef-abcb-c20730b80407;
 Thu, 15 Oct 2020 17:46:28 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kT7Ke-0002s7-Bc; Thu, 15 Oct 2020 17:46:28 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kT7Ke-0002mZ-5m; Thu, 15 Oct 2020 17:46:28 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kT7Ke-0004I8-5I; Thu, 15 Oct 2020 17:46:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pHSr=DW=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kT7Kl-0005AW-7V
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 17:46:35 +0000
X-Inumbo-ID: cd581c62-18b0-46ef-abcb-c20730b80407
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id cd581c62-18b0-46ef-abcb-c20730b80407;
	Thu, 15 Oct 2020 17:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=tZwGEPlsOjInNfgMMtz/cGfryYKpPALNQ9ilwJm+sug=; b=UwNYyrR5NTHEwbMXBVb93MTxLY
	IqyCjcgqC7xSiWezWUUnXEosZqkEsZN/SpwYjWSxfS3v2Kq37ZxXO9LgKuWILMAtL5tyrIkyPGdin
	GntjhJYuwAqPUHusNcRsSPL+VInGRZuL7dy7mw2q5HW3gYznYu1En/Ubk13GR8SdNuUY=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kT7Ke-0002s7-Bc; Thu, 15 Oct 2020 17:46:28 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kT7Ke-0002mZ-5m; Thu, 15 Oct 2020 17:46:28 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kT7Ke-0004I8-5I; Thu, 15 Oct 2020 17:46:28 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-155850-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 155850: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=a8a85f03c826bea045e345fa405f187049d63584
X-Osstest-Versions-That:
    xen=f776e5fb3ee699745f6442ec8c47d0fa647e0575
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 15 Oct 2020 17:46:28 +0000

flight 155850 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/155850/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  a8a85f03c826bea045e345fa405f187049d63584
baseline version:
 xen                  f776e5fb3ee699745f6442ec8c47d0fa647e0575

Last test of basis   155828  2020-10-15 03:00:27 Z    0 days
Testing same since   155842  2020-10-15 11:00:25 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Chen Yu <yu.c.chen@intel.com>
  Igor Druzhinin <igor.druzhinin@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>

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
   f776e5fb3e..a8a85f03c8  a8a85f03c826bea045e345fa405f187049d63584 -> smoke

