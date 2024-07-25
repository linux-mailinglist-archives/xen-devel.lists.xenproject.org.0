Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1875793BA80
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2024 04:07:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764593.1175077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWnrk-0000K7-8Z; Thu, 25 Jul 2024 02:06:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764593.1175077; Thu, 25 Jul 2024 02:06:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWnrk-0000J6-58; Thu, 25 Jul 2024 02:06:00 +0000
Received: by outflank-mailman (input) for mailman id 764593;
 Thu, 25 Jul 2024 02:05:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sWnri-0000Iv-U3; Thu, 25 Jul 2024 02:05:58 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sWnri-0001e9-NZ; Thu, 25 Jul 2024 02:05:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sWnri-0002su-3z; Thu, 25 Jul 2024 02:05:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sWnri-0003Hz-3X; Thu, 25 Jul 2024 02:05:58 +0000
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
	bh=fT4mH6dbNpWZU94HgSBlV3sc5UsSVsvDSFdkaz2NgEM=; b=tfCSMPHTWxE/K6RiRfdhaoc9LH
	elFxVlXX62vqcxyZFrsPNXbBIPo88xtA6b0g3+KDvpuPYaLy7AQgzr5toNfRD/HC75jsTslwh72qz
	9MBUj+fb2nXreN5SBdxgfY7NkjcItUx8ntMAEUAA8Nz4KDrypg5cyjgLDwPEhoSo1eV8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186995-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 186995: all pass - PUSHED
X-Osstest-Versions-This:
    xtf=f37c4574dd79d058c035be989ac6648508556a1a
X-Osstest-Versions-That:
    xtf=4172faef1c0dee027ddd3ffdbc88fe20eb711e9c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 25 Jul 2024 02:05:58 +0000

flight 186995 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186995/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xtf                  f37c4574dd79d058c035be989ac6648508556a1a
baseline version:
 xtf                  4172faef1c0dee027ddd3ffdbc88fe20eb711e9c

Last test of basis   186986  2024-07-24 18:11:37 Z    0 days
Testing same since   186995  2024-07-25 01:11:38 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Manuel Andreas <manuel.andreas@tum.de>

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
   4172fae..f37c457  f37c4574dd79d058c035be989ac6648508556a1a -> xen-tested-master

