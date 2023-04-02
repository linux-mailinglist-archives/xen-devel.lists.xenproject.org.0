Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5D56D357E
	for <lists+xen-devel@lfdr.de>; Sun,  2 Apr 2023 06:34:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517224.802355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pipOA-0006XN-8T; Sun, 02 Apr 2023 04:32:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517224.802355; Sun, 02 Apr 2023 04:32:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pipOA-0006Vj-1a; Sun, 02 Apr 2023 04:32:22 +0000
Received: by outflank-mailman (input) for mailman id 517224;
 Sun, 02 Apr 2023 04:32:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pipO8-0006VZ-Ht; Sun, 02 Apr 2023 04:32:20 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pipO8-0002u1-Dy; Sun, 02 Apr 2023 04:32:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pipO7-0008Tz-Aq; Sun, 02 Apr 2023 04:32:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pipO7-0005tZ-7H; Sun, 02 Apr 2023 04:32:19 +0000
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
	bh=OkKk8jCOkGXMYOPpNEsNlwK5QDNhHFnUuwU7TIBN/n8=; b=gSjr5ZLLPfQpAmb4dUon01NvGs
	VFbRGkvWIiKFpRR8wvVB8ydD2ak6toXKbos7f01MMBQNFsZEW1yI43NIZbXIxP0ds5tW6kWBXJAdy
	thDWQjoOlRoR/v4DUvjbjDHFMfmwDgtyLh3PwuNXqmINdEYlJmcA5k6cQYu460TeEjH0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180109-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180109: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b4af23aaab8a44341e43713a71cbebf23df2c27d
X-Osstest-Versions-That:
    ovmf=4ca4d2b9df27f9c58009d623678ac911c544d36c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 02 Apr 2023 04:32:19 +0000

flight 180109 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180109/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b4af23aaab8a44341e43713a71cbebf23df2c27d
baseline version:
 ovmf                 4ca4d2b9df27f9c58009d623678ac911c544d36c

Last test of basis   180108  2023-04-01 23:42:19 Z    0 days
Testing same since   180109  2023-04-02 02:15:13 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael Kubacki <michael.kubacki@microsoft.com>

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
   4ca4d2b9df..b4af23aaab  b4af23aaab8a44341e43713a71cbebf23df2c27d -> xen-tested-master

