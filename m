Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BC91E96A7
	for <lists+xen-devel@lfdr.de>; Sun, 31 May 2020 11:51:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfKbw-0007Gi-Tx; Sun, 31 May 2020 09:50:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bt/9=7N=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jfKbu-0007Gd-RI
 for xen-devel@lists.xenproject.org; Sun, 31 May 2020 09:50:30 +0000
X-Inumbo-ID: 26079304-a324-11ea-aa46-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 26079304-a324-11ea-aa46-12813bfff9fa;
 Sun, 31 May 2020 09:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Eycy947+Dw7kAVnTYN2D2iziXjgEdVhYOfX2LO2HfHM=; b=ecLmQvEZdhvYL05+M6zBhXk1u
 5lDFNq7Id/eRNYSq/uias8tO39XXVaBIIvXkcWhUZpxV4IpSN+YW+S/0u4jg+rlAxTjvSMq9CZ3Yz
 5QMMhmFvRhGD9U8OkoFG/oKcNg6VfoAS7xsSg9K3sLPbTahe3kdmtijFfMmb+4wsOhboA=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jfKbn-0000r0-SH; Sun, 31 May 2020 09:50:23 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jfKbn-0001nl-Kg; Sun, 31 May 2020 09:50:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jfKbn-0007qG-K1; Sun, 31 May 2020 09:50:23 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150564-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 150564: all pass - PUSHED
X-Osstest-Versions-This: xen=1497e78068421d83956f8e82fb6e1bf1fc3b1199
X-Osstest-Versions-That: xen=d89e5e65f305740b2f7bd56e6f3b6c9c52ee0707
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 31 May 2020 09:50:23 +0000
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

flight 150564 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150564/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  1497e78068421d83956f8e82fb6e1bf1fc3b1199
baseline version:
 xen                  d89e5e65f305740b2f7bd56e6f3b6c9c52ee0707

Last test of basis   150397  2020-05-27 09:19:08 Z    4 days
Testing same since   150564  2020-05-31 09:18:46 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  George Dunlap <george.dunlap@citrix.com>
  Ian Jackson <ian.jackson@eu.citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <julien@xen.org>
  Stefano Stabellini <sstabellini@kernel.org>
  Stefano Stabellini <stefano.stabellini@xilinx.com>
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
   d89e5e65f3..1497e78068  1497e78068421d83956f8e82fb6e1bf1fc3b1199 -> coverity-tested/smoke

