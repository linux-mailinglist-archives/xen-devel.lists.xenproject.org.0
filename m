Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE7886B891
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 20:49:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686780.1069246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfPv6-0001Ul-DA; Wed, 28 Feb 2024 19:48:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686780.1069246; Wed, 28 Feb 2024 19:48:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfPv6-0001Sr-AR; Wed, 28 Feb 2024 19:48:48 +0000
Received: by outflank-mailman (input) for mailman id 686780;
 Wed, 28 Feb 2024 19:48:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rfPv4-0001Se-PI; Wed, 28 Feb 2024 19:48:46 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rfPv4-0001sC-MA; Wed, 28 Feb 2024 19:48:46 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rfPv4-0005lS-9c; Wed, 28 Feb 2024 19:48:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rfPv4-0004eN-98; Wed, 28 Feb 2024 19:48:46 +0000
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
	bh=ddw7VDKEadJ/sG7VtdKIq8T1cjxGDRo7iO85PccL0sI=; b=rp5O10KdCfLAUxze2Y8Fu2xF5q
	2H8GqtXRDCyCbocCGZ+3uoNTnoWgyOgcP8rIIYhWs4kTF7jFbqhPp9T57NXob2i0IJfoao+WDQMCu
	F6s6pkWQLcDK4fThs/SMoAc37TJegi+P94dpzZ7J36IX1ymRml31W/NaNEwWb5zp/lwA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184809-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 184809: all pass - PUSHED
X-Osstest-Versions-This:
    xtf=ad98fbacc7ed6b709f87bf0ef64b81eafb557cce
X-Osstest-Versions-That:
    xtf=d1de27cf787e9c86610b11f6fe13d90f5ca91e27
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 28 Feb 2024 19:48:46 +0000

flight 184809 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184809/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xtf                  ad98fbacc7ed6b709f87bf0ef64b81eafb557cce
baseline version:
 xtf                  d1de27cf787e9c86610b11f6fe13d90f5ca91e27

Last test of basis   184556  2024-02-01 19:13:08 Z   27 days
Testing same since   184809  2024-02-28 17:41:19 Z    0 days    1 attempts

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
   d1de27c..ad98fba  ad98fbacc7ed6b709f87bf0ef64b81eafb557cce -> xen-tested-master

