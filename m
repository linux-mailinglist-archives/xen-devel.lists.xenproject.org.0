Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53349443FAA
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 10:55:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220706.382074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miCyf-00067Z-8t; Wed, 03 Nov 2021 09:54:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220706.382074; Wed, 03 Nov 2021 09:54:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miCyf-00065g-5P; Wed, 03 Nov 2021 09:54:41 +0000
Received: by outflank-mailman (input) for mailman id 220706;
 Wed, 03 Nov 2021 09:54:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1miCye-00065Q-30; Wed, 03 Nov 2021 09:54:40 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1miCyd-0005cc-VO; Wed, 03 Nov 2021 09:54:39 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1miCyd-0003BI-M5; Wed, 03 Nov 2021 09:54:39 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1miCyd-0001hS-La; Wed, 03 Nov 2021 09:54:39 +0000
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
	bh=JJg3Rt7z0xDw6Nr6UxTsFhxJyYqf7YaqXvjZb0lGX8Y=; b=BbFoagg32Rsq5ek4jtVEBXMQnb
	H7Efv26XXDseZT8WthEH3gExnu5Uc5f9xKZUbjeo0dyOtC4nXzvb44Yj9KGcjMhAOKUakt9oRwiWV
	aVTTaAxeRK+tLp9HIo8Rm1ZYIrXNsaEwjTXb1fWqrZXWNZ8VzW+zP4HisdeuZHtb0eKs=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-166027-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 166027: all pass - PUSHED
X-Osstest-Versions-This:
    xen=9f8434d77859462ad98a51ec49ad8e23769d9b10
X-Osstest-Versions-That:
    xen=3030a73bf849a50411da95e94abf23cb7e8642fc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 03 Nov 2021 09:54:39 +0000

flight 166027 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/166027/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  9f8434d77859462ad98a51ec49ad8e23769d9b10
baseline version:
 xen                  3030a73bf849a50411da95e94abf23cb7e8642fc

Last test of basis   165960  2021-10-31 09:19:38 Z    3 days
Testing same since   166027  2021-11-03 09:19:42 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ian Jackson <iwj@xenproject.org>

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
   3030a73bf8..9f8434d778  9f8434d77859462ad98a51ec49ad8e23769d9b10 -> coverity-tested/smoke

