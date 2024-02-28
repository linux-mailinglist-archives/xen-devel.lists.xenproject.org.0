Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E10F86B9E9
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 22:32:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686796.1069281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfRXf-0006Qz-CU; Wed, 28 Feb 2024 21:32:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686796.1069281; Wed, 28 Feb 2024 21:32:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfRXf-0006P2-7U; Wed, 28 Feb 2024 21:32:43 +0000
Received: by outflank-mailman (input) for mailman id 686796;
 Wed, 28 Feb 2024 21:32:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rfRXd-0006Os-KU; Wed, 28 Feb 2024 21:32:41 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rfRXd-0003nU-JQ; Wed, 28 Feb 2024 21:32:41 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rfRXd-00029f-9d; Wed, 28 Feb 2024 21:32:41 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rfRXd-0007SK-98; Wed, 28 Feb 2024 21:32:41 +0000
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
	bh=hWPH5iqhQnzSyRA38YAaYE0XuYVxIi2R76RTE8JY5G0=; b=2KTuOj2EioBtdMSYue7TWvGJ23
	poudmkk1i145QmeDkjE9A2GT9U8zmDp3isnbcHSd1+2kskKYDlz4IRv9KgAKANc2OwYVg+zz/RDS6
	+T0w9bv9wrb8SNm0etG7gC7SZNrB1I7OhAjnrZrZNleRal7aBHusNFWbQN6F8Cg+23GY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184812-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 184812: all pass - PUSHED
X-Osstest-Versions-This:
    xtf=5c37e0b719c925207db50e89a5b11d7ce78cf1fb
X-Osstest-Versions-That:
    xtf=ad98fbacc7ed6b709f87bf0ef64b81eafb557cce
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 28 Feb 2024 21:32:41 +0000

flight 184812 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184812/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xtf                  5c37e0b719c925207db50e89a5b11d7ce78cf1fb
baseline version:
 xtf                  ad98fbacc7ed6b709f87bf0ef64b81eafb557cce

Last test of basis   184809  2024-02-28 17:41:19 Z    0 days
Testing same since   184812  2024-02-28 20:13:14 Z    0 days    1 attempts

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
   ad98fba..5c37e0b  5c37e0b719c925207db50e89a5b11d7ce78cf1fb -> xen-tested-master

