Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C95210907
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jul 2020 12:14:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqZkV-0000gS-3f; Wed, 01 Jul 2020 10:13:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r09v=AM=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jqZkT-0000g8-Dk
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2020 10:13:49 +0000
X-Inumbo-ID: 8addaaa8-bb83-11ea-86e7-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8addaaa8-bb83-11ea-86e7-12813bfff9fa;
 Wed, 01 Jul 2020 10:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2WqxvxGBRjUaZC6Bkt7HtlE+3AG+RKJsnJvy/u+W1RM=; b=FmyqwjnwieeLfxrFoenfLUIYk
 c9sZd7gS45yOrYoSNfPBoKOyaSFpzWkFZx5KZHXVsVDckkpjyAFz8SSxITq69zZR+PVJwUY6JVM4d
 Tfckii/ppTJvEVukT1E/zu6eVCaTyy64WQ6VgJMDg9bjfhpy4tXtlDjWQGNYBNhRtdbL8=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jqZkM-0007OV-VP; Wed, 01 Jul 2020 10:13:43 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jqZkM-0000Xn-IA; Wed, 01 Jul 2020 10:13:42 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jqZkM-0007x6-HZ; Wed, 01 Jul 2020 10:13:42 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151504-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 151504: all pass - PUSHED
X-Osstest-Versions-This: xen=23ca7ec0ba620db52a646d80e22f9703a6589f66
X-Osstest-Versions-That: xen=88cfd062e8318dfeb67c7d2eb50b6cd224b0738a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 01 Jul 2020 10:13:42 +0000
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

flight 151504 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151504/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  23ca7ec0ba620db52a646d80e22f9703a6589f66
baseline version:
 xen                  88cfd062e8318dfeb67c7d2eb50b6cd224b0738a

Last test of basis   151428  2020-06-28 09:23:57 Z    3 days
Testing same since   151504  2020-07-01 09:23:05 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Olaf Hering <olaf@aepfle.de>
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
   88cfd062e8..23ca7ec0ba  23ca7ec0ba620db52a646d80e22f9703a6589f66 -> coverity-tested/smoke

