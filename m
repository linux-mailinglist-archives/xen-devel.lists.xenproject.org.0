Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E016A1A5E00
	for <lists+xen-devel@lfdr.de>; Sun, 12 Apr 2020 12:14:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jNZcJ-0004yC-G0; Sun, 12 Apr 2020 10:13:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NHv3=54=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jNZcI-0004y7-Lz
 for xen-devel@lists.xenproject.org; Sun, 12 Apr 2020 10:13:30 +0000
X-Inumbo-ID: 3dd6409c-7ca6-11ea-8740-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3dd6409c-7ca6-11ea-8740-12813bfff9fa;
 Sun, 12 Apr 2020 10:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qFXSerCG82WKiqv/bNE83LgKPCwMLZ295kryQX39xq4=; b=L8lrEYZmMJjJuXLiD5r1ZSMdq
 WKpz9bSOvh7Cu4hNRNdcUvoU6CgSiDAWs5j0l1SudaGadzGnN3nAAUDQQaQMwxgzWVWgqONb2h26N
 nyrUjzbbTiH4BEDlNZFT9l3zkDxg6rRUndQjqKWEDSO7WuIlOPm3fHjvzo9I42TAC9Z1E=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jNZcA-0004t2-WC; Sun, 12 Apr 2020 10:13:23 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jNZcA-0006Lg-Mc; Sun, 12 Apr 2020 10:13:22 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jNZcA-00085v-Lx; Sun, 12 Apr 2020 10:13:22 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149630-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 149630: all pass - PUSHED
X-Osstest-Versions-This: xen=7372466b21c3b6c96bb7a52754e432bac883a1e3
X-Osstest-Versions-That: xen=e013e8514389b739153016349e49f5a78e34ddf0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 12 Apr 2020 10:13:22 +0000
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

flight 149630 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149630/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  7372466b21c3b6c96bb7a52754e432bac883a1e3
baseline version:
 xen                  e013e8514389b739153016349e49f5a78e34ddf0

Last test of basis   149517  2020-04-08 09:19:14 Z    4 days
Testing same since   149630  2020-04-12 09:19:20 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Andrew Panyakin <apanyaki@amazon.com>
  Dmitry Isaykin <isaikin-dmitry@yandex.ru>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Tamas K Lengyel <tamas.lengyel@intel.com>
  Tamas K Lengyel <tamas@tklengyel.com>
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
   e013e85143..7372466b21  7372466b21c3b6c96bb7a52754e432bac883a1e3 -> coverity-tested/smoke

