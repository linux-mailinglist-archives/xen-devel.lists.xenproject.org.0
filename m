Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C614D993E7D
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 07:55:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812613.1225390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy3Aw-0007sz-L1; Tue, 08 Oct 2024 05:54:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812613.1225390; Tue, 08 Oct 2024 05:54:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy3Aw-0007qP-Hm; Tue, 08 Oct 2024 05:54:26 +0000
Received: by outflank-mailman (input) for mailman id 812613;
 Tue, 08 Oct 2024 05:54:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sy3Av-0007qF-OL; Tue, 08 Oct 2024 05:54:25 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sy3Av-0002Hw-Ml; Tue, 08 Oct 2024 05:54:25 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sy3Av-0006Ur-6S; Tue, 08 Oct 2024 05:54:25 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sy3Av-0000UM-3i; Tue, 08 Oct 2024 05:54:25 +0000
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
	bh=eSioCR8QEji3AM34XvHZ6hyA2QtJdn2qT/xIeufhoN8=; b=w+L/XvOxhcXgkvHR9u0C4IzFPj
	DU/8HAm3Fo5zsG0ysPQa5xJGV/phAYAHUZkj0nuDZ0Ewdj8Smcrf+h79LKi4TB/3GqNQO8B77YPpp
	l0OkvAkUvhhJgubXCg2S/CdIVqNchnUdVWRt1T4Jqd7MGjcBkaKPiJXs9YSQkp43X/78=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-188006-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 188006: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=550c38a29961ab1c9cc4f9a17cdd3346566c4bef
X-Osstest-Versions-That:
    ovmf=d99045f39220e2ad075ae5b93b53bbabd5923cb4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 08 Oct 2024 05:54:25 +0000

flight 188006 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/188006/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 550c38a29961ab1c9cc4f9a17cdd3346566c4bef
baseline version:
 ovmf                 d99045f39220e2ad075ae5b93b53bbabd5923cb4

Last test of basis   188004  2024-10-08 00:41:35 Z    0 days
Testing same since   188006  2024-10-08 03:05:52 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Linus Liu <linus.liu@intel.com>
  Oliver Smith-Denny <osde@linux.microsoft.com>
  Oliver Smith-Denny <osde@microsoft.com>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    


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

To xenbits.xen.org:/home/xen/git/osstest/ovmf.git
   d99045f392..550c38a299  550c38a29961ab1c9cc4f9a17cdd3346566c4bef -> xen-tested-master

