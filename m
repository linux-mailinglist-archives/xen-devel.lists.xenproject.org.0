Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8613A25A930
	for <lists+xen-devel@lfdr.de>; Wed,  2 Sep 2020 12:13:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kDPlR-0002hZ-Qe; Wed, 02 Sep 2020 10:13:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A6j+=CL=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kDPlP-0002hS-Sw
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2020 10:13:11 +0000
X-Inumbo-ID: 6ad139ee-c3bd-4188-95ca-bbdcf5cee126
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6ad139ee-c3bd-4188-95ca-bbdcf5cee126;
 Wed, 02 Sep 2020 10:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=TXFbbR8+tVcM5XsqtPaY214i0luDXTcRk9wcqX4Vqls=; b=OnHxhqt+KpO31vEi5nu8mIVD3Q
 lvrrCjkCPzLOYdP7mlDg+4mleBnxmwpNQAypEDl36f6UlUqIo48JCNmWlQlghUP8ZBAQoGxv+lquA
 Vs7dPV9I6v0K5Gj9Abu96M6vfwRFGEK8OgPVbK5nM/wtMplVuO39T5okq/836vDfUncA=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kDPlO-0001mG-Ii; Wed, 02 Sep 2020 10:13:10 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kDPlO-0006HR-Bb; Wed, 02 Sep 2020 10:13:10 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kDPlO-0004y7-B9; Wed, 02 Sep 2020 10:13:10 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-153545-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 153545: all pass - PUSHED
X-Osstest-Versions-This: xen=afe018e041ec112d90a8b4e6ed607d22aa06f280
X-Osstest-Versions-That: xen=d400dc5729e4e132d61c2e7df57d81aaed762044
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 02 Sep 2020 10:13:10 +0000
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

flight 153545 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/153545/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  afe018e041ec112d90a8b4e6ed607d22aa06f280
baseline version:
 xen                  d400dc5729e4e132d61c2e7df57d81aaed762044

Last test of basis   153169  2020-08-30 09:18:24 Z    3 days
Testing same since   153545  2020-09-02 09:18:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>

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
   d400dc5729..afe018e041  afe018e041ec112d90a8b4e6ed607d22aa06f280 -> coverity-tested/smoke

