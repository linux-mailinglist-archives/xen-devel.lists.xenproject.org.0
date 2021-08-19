Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 213E03F23C4
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 01:39:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169139.308970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGrc4-0003iN-PS; Thu, 19 Aug 2021 23:38:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169139.308970; Thu, 19 Aug 2021 23:38:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGrc4-0003g2-Ki; Thu, 19 Aug 2021 23:38:20 +0000
Received: by outflank-mailman (input) for mailman id 169139;
 Thu, 19 Aug 2021 23:38:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mGrc3-0003fs-8X; Thu, 19 Aug 2021 23:38:19 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mGrc2-0003zL-VZ; Thu, 19 Aug 2021 23:38:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mGrc2-0003SB-L9; Thu, 19 Aug 2021 23:38:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mGrc2-0006eD-Ke; Thu, 19 Aug 2021 23:38:18 +0000
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
	bh=NTNg3vCx9oBXAXksYDmdhewB0MwrDTgHUuUnqGnXj4s=; b=rzfZRdnjfdb75nLQHgh8Orfa/2
	o2/kYLFIxSgEVdcuA0mloQ5qsFKmH3GFbg9jmTkipt4fZmjm1HN0T2tenRBF/PxoLnxuo5R69cz1u
	g8/zbtsUNL3Pr8wT1kbjP5CUJfOD2tlPSaIggVhPo6voAJG61It8SbyLo17t2tlsqcuo=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164255-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 164255: all pass - PUSHED
X-Osstest-Versions-This:
    xtf=bc26bc260cbfec1c6de1778ef17cf0faa54c0e03
X-Osstest-Versions-That:
    xtf=fc32c40a97069d4696fb7aa9cb76e3ae09aa18dd
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 19 Aug 2021 23:38:18 +0000

flight 164255 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164255/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xtf                  bc26bc260cbfec1c6de1778ef17cf0faa54c0e03
baseline version:
 xtf                  fc32c40a97069d4696fb7aa9cb76e3ae09aa18dd

Last test of basis   164235  2021-08-18 03:44:23 Z    1 days
Testing same since   164255  2021-08-19 12:11:19 Z    0 days    1 attempts

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
   fc32c40..bc26bc2  bc26bc260cbfec1c6de1778ef17cf0faa54c0e03 -> xen-tested-master

