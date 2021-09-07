Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E4B4022F8
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 07:16:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180373.326999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNTT3-0002FN-Cd; Tue, 07 Sep 2021 05:16:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180373.326999; Tue, 07 Sep 2021 05:16:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNTT3-0002CE-7D; Tue, 07 Sep 2021 05:16:21 +0000
Received: by outflank-mailman (input) for mailman id 180373;
 Tue, 07 Sep 2021 05:16:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mNTT1-0002C4-3j; Tue, 07 Sep 2021 05:16:19 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mNTT0-0003vg-Oc; Tue, 07 Sep 2021 05:16:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mNTT0-0000Y4-HV; Tue, 07 Sep 2021 05:16:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mNTT0-0003Me-Gz; Tue, 07 Sep 2021 05:16:18 +0000
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
	bh=maTfaYDWmwiW+WzogC0xfR3utfB9F1Ck0mkDpBgjATE=; b=b6OoRUz6X9ZrOia5P2pmSUAY6y
	4vF18/DwyNkdXIbcOnw5FaXIEC1trLdJlL8LZPrIiES93esMZb7pX+Fy6bS3KS5WmNaV4YAfKo177
	7k/hg2vOJUfczUd55j9kxC/3CDAWdlC7+eahahqcSrhSR2RXhyCSyi5kzZU1Oa7A3w+Q=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164867-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 164867: all pass - PUSHED
X-Osstest-Versions-This:
    xtf=91d215a4ed1463ab14d1f68e497117ac1255e05e
X-Osstest-Versions-That:
    xtf=0bb720b3c486bd3de62b8c32282eb5fa192b87f3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 07 Sep 2021 05:16:18 +0000

flight 164867 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164867/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xtf                  91d215a4ed1463ab14d1f68e497117ac1255e05e
baseline version:
 xtf                  0bb720b3c486bd3de62b8c32282eb5fa192b87f3

Last test of basis   164779  2021-09-02 21:40:04 Z    4 days
Testing same since   164867  2021-09-07 00:10:12 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Michal Orzel <michal.orzel@arm.com>

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
   0bb720b..91d215a  91d215a4ed1463ab14d1f68e497117ac1255e05e -> xen-tested-master

