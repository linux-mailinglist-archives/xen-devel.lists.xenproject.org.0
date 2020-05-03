Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5E71C2B42
	for <lists+xen-devel@lfdr.de>; Sun,  3 May 2020 12:16:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVBf3-000485-Ft; Sun, 03 May 2020 10:15:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3VTY=6R=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jVBf2-000480-4z
 for xen-devel@lists.xenproject.org; Sun, 03 May 2020 10:15:48 +0000
X-Inumbo-ID: 0a933dac-8d27-11ea-9c71-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0a933dac-8d27-11ea-9c71-12813bfff9fa;
 Sun, 03 May 2020 10:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vdbpq/mrYNdqckikny+159/ycjmUgDoGLiBpa5tKzsM=; b=TpukJINIT8TGvWBy11j5MYoFF
 sAXuKRK+L2AUuRyQr/9MmdklYatuPxhtiezQ3iVXIbz5+7zCs112pnj3y0JmOv1394L2b0p7FrX4g
 +cdQy5z4R3VkNaV0BPbrupGBk6RU6GL+DXJqJBsZhz0IHcrRtcVawAOEm1r1aX8/wtSWI=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jVBeu-0003m9-NO; Sun, 03 May 2020 10:15:40 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jVBeu-0006jo-5T; Sun, 03 May 2020 10:15:40 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jVBeu-00062h-4w; Sun, 03 May 2020 10:15:40 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149910-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 149910: all pass - PUSHED
X-Osstest-Versions-This: xen=0135be8bd8cd60090298f02310691b688d95c3a8
X-Osstest-Versions-That: xen=4ec07971f1c5a236a0d8c528d806efb6bfd3d1a6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 03 May 2020 10:15:40 +0000
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

flight 149910 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149910/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  0135be8bd8cd60090298f02310691b688d95c3a8
baseline version:
 xen                  4ec07971f1c5a236a0d8c528d806efb6bfd3d1a6

Last test of basis   149873  2020-04-29 09:19:00 Z    4 days
Testing same since   149910  2020-05-03 09:19:24 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Hongyan Xia <hongyxia@amazon.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Tamas K Lengyel <tamas.lengyel@intel.com>
  Tim Deegan <tim@xen.org>
  Varad Gautam <vrd@amazon.de>
  Wei Liu <liuwe@microsoft.com>
  Wei Liu <wei.liu2@citrix.com>
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
   4ec07971f1..0135be8bd8  0135be8bd8cd60090298f02310691b688d95c3a8 -> coverity-tested/smoke

