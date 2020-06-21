Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D601B202A0D
	for <lists+xen-devel@lfdr.de>; Sun, 21 Jun 2020 12:30:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmxEP-0004FK-Bq; Sun, 21 Jun 2020 10:29:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iz7/=AC=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jmxEO-0004FF-DK
 for xen-devel@lists.xenproject.org; Sun, 21 Jun 2020 10:29:44 +0000
X-Inumbo-ID: 1efa5344-b3aa-11ea-bca7-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1efa5344-b3aa-11ea-bca7-bc764e2007e4;
 Sun, 21 Jun 2020 10:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ja/EE2N96pf72jASmbavq9qCgjWCNSqOKolw8ltrnbA=; b=wQtW/M6cXNkQUgs2SkdoeaChw
 ze5USgCl+1Ji303T216bTCI7jafhr/6cGAdTUN4K4Yzu2TBHm45JftI2l7YoB0Be2T8BK71QnH8Nu
 4769hwIKdYDSSAKAgSy/4wnJtxDTy0A86CUCrYw2a4xO2kmt1qkXVBMqdOz4FZu+pcpY8=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jmxEN-0006vk-7j; Sun, 21 Jun 2020 10:29:43 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jmxEM-0006Z9-MF; Sun, 21 Jun 2020 10:29:42 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jmxEM-0005hL-Lb; Sun, 21 Jun 2020 10:29:42 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151271-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 151271: all pass - PUSHED
X-Osstest-Versions-This: xen=fde76f895d0aa817a1207d844d793239c6639bc6
X-Osstest-Versions-That: xen=3625b04991b4d6affadd99d377ab84bac48dfff4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 21 Jun 2020 10:29:42 +0000
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

flight 151271 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151271/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  fde76f895d0aa817a1207d844d793239c6639bc6
baseline version:
 xen                  3625b04991b4d6affadd99d377ab84bac48dfff4

Last test of basis   151186  2020-06-17 09:18:28 Z    4 days
Testing same since   151271  2020-06-21 09:18:26 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Ian Jackson <ian.jackson@eu.citrix.com>
  Igor Druzhinin <igor.druzhinin@citrix.com>
  Jason Andryuk <jandryuk@gmail.com>
  Olaf Hering <olaf@aepfle.de>
  Roger Pau Monné <roger.pau@citrix.com>
  Samuel Thibault <samuel.thibaut@ens-lyon.org>
  Tamas K Lengyel <tamas.lengyel@intel.com>

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
   3625b04991..fde76f895d  fde76f895d0aa817a1207d844d793239c6639bc6 -> coverity-tested/smoke

