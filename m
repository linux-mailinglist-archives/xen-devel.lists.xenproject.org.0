Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D9E214BD3
	for <lists+xen-devel@lfdr.de>; Sun,  5 Jul 2020 12:33:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1js1wE-0006SY-UX; Sun, 05 Jul 2020 10:31:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3tmk=AQ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1js1wD-0006ST-Jo
 for xen-devel@lists.xenproject.org; Sun, 05 Jul 2020 10:31:57 +0000
X-Inumbo-ID: bf4c0563-beaa-11ea-8bc0-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bf4c0563-beaa-11ea-8bc0-12813bfff9fa;
 Sun, 05 Jul 2020 10:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7onaZJxbOCXjzPn8pf60GU1Y0pZhMm1Uuj3CWOwtNro=; b=OyAUK1WE+UKOjQYurhCatlUaB
 b88ppJiJsfrIvXcQcucTHIx1ys32Z5zYn7TD4YDtN+WuR+m2O3FhN2FEK/JJ2pAC0t1EInniGhZIZ
 Qu5oqd8wbHqYrJfy+PvzkYUpcEPkYch6z1XL7G6aA0Rseg4gvGNIEQQ+G3BnZTdItDDS4=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1js1wB-0006UH-Ts; Sun, 05 Jul 2020 10:31:55 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1js1wB-0003m5-II; Sun, 05 Jul 2020 10:31:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1js1wB-0008FR-He; Sun, 05 Jul 2020 10:31:55 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151641-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 151641: all pass - PUSHED
X-Osstest-Versions-This: xen=be63d9d47f571a60d70f8fb630c03871312d9655
X-Osstest-Versions-That: xen=23ca7ec0ba620db52a646d80e22f9703a6589f66
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 05 Jul 2020 10:31:55 +0000
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

flight 151641 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151641/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  be63d9d47f571a60d70f8fb630c03871312d9655
baseline version:
 xen                  23ca7ec0ba620db52a646d80e22f9703a6589f66

Last test of basis   151504  2020-07-01 09:23:05 Z    4 days
Testing same since   151641  2020-07-05 09:18:32 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Bertrand Marquis <bertrand.marquis@arm.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Stefano Stabellini <stefano.stabellini@xilinx.com>
  Volodymyr Babchuk <volodymyr_babchuk@epam.com>

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
   23ca7ec0ba..be63d9d47f  be63d9d47f571a60d70f8fb630c03871312d9655 -> coverity-tested/smoke

