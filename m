Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6C22C5385
	for <lists+xen-devel@lfdr.de>; Thu, 26 Nov 2020 13:04:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.38478.71225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiFza-00078z-Ox; Thu, 26 Nov 2020 12:03:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 38478.71225; Thu, 26 Nov 2020 12:03:18 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiFza-00078V-Jx; Thu, 26 Nov 2020 12:03:18 +0000
Received: by outflank-mailman (input) for mailman id 38478;
 Thu, 26 Nov 2020 12:03:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kiFzZ-00078N-64; Thu, 26 Nov 2020 12:03:17 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kiFzY-0000X9-VS; Thu, 26 Nov 2020 12:03:16 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kiFzY-0004Am-NN; Thu, 26 Nov 2020 12:03:16 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kiFzY-0006TU-Mt; Thu, 26 Nov 2020 12:03:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kiFzZ-00078N-64; Thu, 26 Nov 2020 12:03:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=MRgobxmtF3c5mPpA0fr2uIspHi1kc4UkYYLnLfbBwlY=; b=jII1500ULCxfxeDI6zYvL+vyC7
	/bwBEV40T+794Gcp7xqOx+fhf4BPdt9RJkEO8ARME/8SXau/sfHKKQ0t6RG7MS78lK4qAKwNk6vET
	sp1JLobPx22IuogsCObUNVVWcOXtH5gmKMcThK6BwaJF9JomkWWjmPKZw9D/wqAfLq+o=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kiFzY-0000X9-VS; Thu, 26 Nov 2020 12:03:16 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kiFzY-0004Am-NN; Thu, 26 Nov 2020 12:03:16 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kiFzY-0006TU-Mt; Thu, 26 Nov 2020 12:03:16 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-157025-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 157025: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=21f984cedec1c613218480bc3eb5e92349a7a812
X-Osstest-Versions-That:
    ovmf=e9d62effa37ea13fe04fc89b21d2de7776f183a2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 26 Nov 2020 12:03:16 +0000

flight 157025 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/157025/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 21f984cedec1c613218480bc3eb5e92349a7a812
baseline version:
 ovmf                 e9d62effa37ea13fe04fc89b21d2de7776f183a2

Last test of basis   157018  2020-11-26 01:39:48 Z    0 days
Testing same since   157025  2020-11-26 07:11:04 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Kun Qin <kun.q@outlook.com>

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
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    


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
   e9d62effa3..21f984cede  21f984cedec1c613218480bc3eb5e92349a7a812 -> xen-tested-master

