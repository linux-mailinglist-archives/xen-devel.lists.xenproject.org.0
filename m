Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3CE1E3DD4
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 11:46:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdsbn-0001pH-JS; Wed, 27 May 2020 09:44:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UeBB=7J=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jdsbm-0001pC-PG
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 09:44:22 +0000
X-Inumbo-ID: a406a2f0-9ffe-11ea-a70d-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a406a2f0-9ffe-11ea-a70d-12813bfff9fa;
 Wed, 27 May 2020 09:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iCaLZIAG80TdIyQv/OLd7QCdqfhaM58kNRJ9trjkeTc=; b=KsGx8RuSD7L6Xm3aFyXAtoBnT
 9H2rWE30JcT9ohStkU+/TCCGx7O1lY74iZZcJzhMJzmMLbx8EjU7jCLBtcT2DOrrUzl5YbTbGkgIZ
 nA3jcSzeCobJ5/2vvVPqW0oewQAwNu6YCYOJAZ+/9abR8F1ku6/Xt8EmvF3ZB/br7Tg+g=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jdsbk-0007Vt-Q2; Wed, 27 May 2020 09:44:20 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jdsbk-0000jb-FI; Wed, 27 May 2020 09:44:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jdsbk-0005dg-El; Wed, 27 May 2020 09:44:20 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150397-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 150397: all pass - PUSHED
X-Osstest-Versions-This: xen=d89e5e65f305740b2f7bd56e6f3b6c9c52ee0707
X-Osstest-Versions-That: xen=5e015d48a5ee68ba03addad2698364d8f015afec
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 27 May 2020 09:44:20 +0000
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

flight 150397 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150397/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  d89e5e65f305740b2f7bd56e6f3b6c9c52ee0707
baseline version:
 xen                  5e015d48a5ee68ba03addad2698364d8f015afec

Last test of basis   150349  2020-05-24 09:19:09 Z    3 days
Testing same since   150397  2020-05-27 09:19:08 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Corey Minyard <cminyard@mvista.com>
  George Dunlap <george.dunlap@citrix.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>

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
   5e015d48a5..d89e5e65f3  d89e5e65f305740b2f7bd56e6f3b6c9c52ee0707 -> coverity-tested/smoke

