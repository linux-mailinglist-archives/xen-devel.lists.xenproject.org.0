Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 744171B8EC0
	for <lists+xen-devel@lfdr.de>; Sun, 26 Apr 2020 12:12:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jSeH6-0004Ex-QU; Sun, 26 Apr 2020 10:12:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wn3c=6K=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jSeH6-0004Er-4v
 for xen-devel@lists.xenproject.org; Sun, 26 Apr 2020 10:12:36 +0000
X-Inumbo-ID: 705db80a-87a6-11ea-9686-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 705db80a-87a6-11ea-9686-12813bfff9fa;
 Sun, 26 Apr 2020 10:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i6Pomo+0QZ5P0PSDsn4n1LvJJUJJuR0UM5ipf+r2TQA=; b=YU/HuntA7SslD+LLiataJLwTw
 QjMl2d82GsQkZJw7lQwm5/eWeS6ibEKxr1HSZDu28YuMzkMdzXSXCQFxs6WFS3IO42LSyO5QwWs4S
 W9zBg2ZreGqQMoQkybbo/eM1YkbDuxUSz8ReBoHEba4tSUxJuHqQOhWD6gFLcPWl4HKLc=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jSeH0-0006q2-KA; Sun, 26 Apr 2020 10:12:30 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jSeH0-0006yI-C8; Sun, 26 Apr 2020 10:12:30 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jSeH0-0001Tu-BT; Sun, 26 Apr 2020 10:12:30 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149828-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 149828: all pass - PUSHED
X-Osstest-Versions-This: xen=f093b08c47b39da6019421a2b61d40745b3e573b
X-Osstest-Versions-That: xen=5730ac3c8346f56fe8ee90249cdcbdab2a4d5791
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 26 Apr 2020 10:12:30 +0000
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

flight 149828 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149828/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  f093b08c47b39da6019421a2b61d40745b3e573b
baseline version:
 xen                  5730ac3c8346f56fe8ee90249cdcbdab2a4d5791

Last test of basis   149734  2020-04-22 09:18:32 Z    4 days
Testing same since   149828  2020-04-26 09:18:45 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  George Dunlap <george.dunlap@citrix.com>
  Ian Jackson <ian.jackson@eu.citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Nick Rosbrook <rosbrookn@ainfosec.com>
  Nick Rosbrook <rosbrookn@gmail.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stefano Stabellini <stefano.stabellini@xilinx.com>
  Tamas K Lengyel <tamas.lengyel@intel.com>
  Tim Deegan <tim@xen.org>
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
   5730ac3c83..f093b08c47  f093b08c47b39da6019421a2b61d40745b3e573b -> coverity-tested/smoke

