Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC581928EB6
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2024 23:13:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.754527.1162984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPqEP-0004Ph-6x; Fri, 05 Jul 2024 21:12:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 754527.1162984; Fri, 05 Jul 2024 21:12:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPqEP-0004OC-3k; Fri, 05 Jul 2024 21:12:37 +0000
Received: by outflank-mailman (input) for mailman id 754527;
 Fri, 05 Jul 2024 21:12:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sPqEO-0004O2-Ba; Fri, 05 Jul 2024 21:12:36 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sPqEO-0001Fs-9p; Fri, 05 Jul 2024 21:12:36 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sPqEN-0002pA-Q2; Fri, 05 Jul 2024 21:12:35 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sPqEN-0000KR-Pd; Fri, 05 Jul 2024 21:12:35 +0000
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
	bh=7zp3MlfEUCkQUADqbGxfFzayfVv0Kc8VqkPsnfWvods=; b=o40lBIF3cDHOwQC2NuYJM9BifB
	jjd+vAtN9ETu6t79p11mHVNfCR+0a4c9d6TZQFm4ghmYBqAY6kGEmirKs1NFZCUgq/eZhNdOqkYFz
	l4VTQxmIogLvxLnC2nVzUpvNWJk/sRddzUyz9imxYEpzeE5LVKAVHb15DEO4wjjB2PWA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186707-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186707: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=26bc42f1e34cdf43057a75b8edcc0bd86c091214
X-Osstest-Versions-That:
    ovmf=a3359ffb25ce70ee90822f6886136bf0d200406e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 05 Jul 2024 21:12:35 +0000

flight 186707 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186707/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 26bc42f1e34cdf43057a75b8edcc0bd86c091214
baseline version:
 ovmf                 a3359ffb25ce70ee90822f6886136bf0d200406e

Last test of basis   186705  2024-07-05 17:42:53 Z    0 days
Testing same since   186707  2024-07-05 19:44:54 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
  Yanbo Huang <yanbo.huang@intel.com>

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
   a3359ffb25..26bc42f1e3  26bc42f1e34cdf43057a75b8edcc0bd86c091214 -> xen-tested-master

