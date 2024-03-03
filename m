Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9456986F351
	for <lists+xen-devel@lfdr.de>; Sun,  3 Mar 2024 03:00:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687996.1071824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rgb8K-0006k4-78; Sun, 03 Mar 2024 01:59:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687996.1071824; Sun, 03 Mar 2024 01:59:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rgb8K-0006i6-0K; Sun, 03 Mar 2024 01:59:20 +0000
Received: by outflank-mailman (input) for mailman id 687996;
 Sun, 03 Mar 2024 01:59:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rgb8I-0006hw-MW; Sun, 03 Mar 2024 01:59:18 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rgb8I-0000tY-Kp; Sun, 03 Mar 2024 01:59:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rgb8H-0005PR-I3; Sun, 03 Mar 2024 01:59:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rgb8H-0000CE-Hb; Sun, 03 Mar 2024 01:59:17 +0000
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
	bh=BdXf7k/Dg12qiUwUEfe6f7ocqI9tD+5JH3h4+5zDQow=; b=NO/Yla+Q+YjRoEJR+NU27VhGh7
	qfnFU3H0PiHKyTBsRDg1MjU6mtlgg4tpmxFKAUOUY5H11E0b7tIdzqi0DO/AThUOCf5igC+eGmzQs
	Py8wn2I8zr69Bd4ErJKM1YyOma/nT53aZSwbkDc4hhVZ1uyPHu2Rht4y3GfsdZ2ij1ms=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184862-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 184862: all pass - PUSHED
X-Osstest-Versions-This:
    xtf=3955325292f49257797f339cfdcb84748550e069
X-Osstest-Versions-That:
    xtf=5c37e0b719c925207db50e89a5b11d7ce78cf1fb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 03 Mar 2024 01:59:17 +0000

flight 184862 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184862/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xtf                  3955325292f49257797f339cfdcb84748550e069
baseline version:
 xtf                  5c37e0b719c925207db50e89a5b11d7ce78cf1fb

Last test of basis   184812  2024-02-28 20:13:14 Z    3 days
Testing same since   184862  2024-03-03 00:41:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>

jobs:
 build-amd64-xtf                                              pass    
 build-amd64                                                  pass    
 build-amd64-pvops                                            pass    
 test-xtf-amd64-amd64-1                                       pass    
 test-xtf-amd64-amd64-2                                       pass    
 test-xtf-amd64-amd64-3                                       pass    
 test-xtf-amd64-amd64-4                                       pass    
 test-xtf-amd64-amd64-5                                       pass    


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

To xenbits.xen.org:/home/xen/git/xtf.git
   5c37e0b..3955325  3955325292f49257797f339cfdcb84748550e069 -> xen-tested-master

