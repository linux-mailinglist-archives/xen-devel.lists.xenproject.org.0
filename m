Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5104145BB
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 12:04:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192401.342812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSz6u-0001rg-IT; Wed, 22 Sep 2021 10:04:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192401.342812; Wed, 22 Sep 2021 10:04:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSz6u-0001pe-Eu; Wed, 22 Sep 2021 10:04:16 +0000
Received: by outflank-mailman (input) for mailman id 192401;
 Wed, 22 Sep 2021 10:04:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mSz6s-0001pS-VA; Wed, 22 Sep 2021 10:04:14 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mSz6s-0004Lv-Or; Wed, 22 Sep 2021 10:04:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mSz6s-0000Fm-Gy; Wed, 22 Sep 2021 10:04:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mSz6s-0004cv-GP; Wed, 22 Sep 2021 10:04:14 +0000
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
	bh=+1Jwis8S94NdQzgqHAZwnq3eIS+HG3F8BuGpaX1im5Q=; b=K4N/3yLVQ8KmtOUhWZGvYG6+jT
	TSmDclUlqs+9yximwP/XxV6wFTj3wiwHT4i3eXQk3QwEcMN9png1QGM0cyU7VzjnziEhBrjV4R+h4
	SiEiB+MdigEWas6ersXAQMGsw7L+gczosE93QbhmfdM3OPrVUMxi6OkkI69ZffnCqz3E=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165150-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 165150: all pass - PUSHED
X-Osstest-Versions-This:
    xen=4e467d390eaf6736377766adae0166711866fac3
X-Osstest-Versions-That:
    xen=437e88417bdea0d5cd012fe9d69a3e0f8a0c13e8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 22 Sep 2021 10:04:14 +0000

flight 165150 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165150/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  4e467d390eaf6736377766adae0166711866fac3
baseline version:
 xen                  437e88417bdea0d5cd012fe9d69a3e0f8a0c13e8

Last test of basis   165120  2021-09-19 09:19:39 Z    3 days
Testing same since   165150  2021-09-22 09:30:48 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>

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
   437e88417b..4e467d390e  4e467d390eaf6736377766adae0166711866fac3 -> coverity-tested/smoke

