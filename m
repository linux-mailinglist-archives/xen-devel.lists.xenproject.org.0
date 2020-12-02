Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4BD2CB9B1
	for <lists+xen-devel@lfdr.de>; Wed,  2 Dec 2020 10:52:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42582.76612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkOnU-0007Gi-D0; Wed, 02 Dec 2020 09:51:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42582.76612; Wed, 02 Dec 2020 09:51:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkOnU-0007GF-97; Wed, 02 Dec 2020 09:51:40 +0000
Received: by outflank-mailman (input) for mailman id 42582;
 Wed, 02 Dec 2020 09:51:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kkOnS-0007G7-Dv; Wed, 02 Dec 2020 09:51:38 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kkOnS-0005UO-AC; Wed, 02 Dec 2020 09:51:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kkOnR-0001rh-Vf; Wed, 02 Dec 2020 09:51:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kkOnR-0003PD-VA; Wed, 02 Dec 2020 09:51:37 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=ocILQjgMa7KZf1mBb+5XjvWkPVdV6bK2BH23pb9+or8=; b=JX6TX76Prmyjr1OV5ADMKATBRQ
	kqSks3K2aDdMfk5ktNfQZciyaSjnLBNXmI962vAKmQS2kBedl23EKCnZwbCoOaDc/vRHAtUsq1WWl
	yxNVaSHa7LwDR9ID20k3R1+J0mK6i2gxGzY9G/EfoB1y2VAXx9XRNC3/QYfhhnxLXYas=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-157155-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 157155: all pass - PUSHED
X-Osstest-Versions-This:
    xen=3ae469af8e680df31eecd0a2ac6a83b58ad7ce53
X-Osstest-Versions-That:
    xen=f7d7d53f6464cff94ead4c15d21e79ce4d9173f5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 02 Dec 2020 09:51:37 +0000

flight 157155 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/157155/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  3ae469af8e680df31eecd0a2ac6a83b58ad7ce53
baseline version:
 xen                  f7d7d53f6464cff94ead4c15d21e79ce4d9173f5

Last test of basis   157090  2020-11-29 09:18:25 Z    3 days
Testing same since   157155  2020-12-02 09:19:29 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Juergen Gross <jgross@suse.com>
  Manuel Bouyer <bouyer@antioche.eu.org>
  Roger Pau Monné <roge.rpau@citrix.com>

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
   f7d7d53f64..3ae469af8e  3ae469af8e680df31eecd0a2ac6a83b58ad7ce53 -> coverity-tested/smoke

