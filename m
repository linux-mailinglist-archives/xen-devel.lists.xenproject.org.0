Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5EB8275A3
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 17:46:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663647.1033720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMsl9-0001mj-A8; Mon, 08 Jan 2024 16:45:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663647.1033720; Mon, 08 Jan 2024 16:45:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMsl9-0001lF-5D; Mon, 08 Jan 2024 16:45:55 +0000
Received: by outflank-mailman (input) for mailman id 663647;
 Mon, 08 Jan 2024 16:45:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rMsl8-0001l5-9Q; Mon, 08 Jan 2024 16:45:54 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rMsl8-000167-7z; Mon, 08 Jan 2024 16:45:54 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rMsl7-0007Id-PJ; Mon, 08 Jan 2024 16:45:53 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rMsl7-0003a4-Oo; Mon, 08 Jan 2024 16:45:53 +0000
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
	bh=i2ITzA6GQOV2pZkM3IRgTyveOxm0SdEXEAK59qgI5O0=; b=LDtVkeukFta4lp/1K0I4GTxPfr
	VUjwl50aZAvRCe07k+7AkAG8wXbkQqiVXXRCcF7JqYKbEiIt63E5GHSUGmtbdryTnm8XNUQeqZiu7
	exiBIM8mZH5tFqUKnvV4WU5WxJ/p/kjYhUcnS4srrSg4ZWl/mwYZEs5f3ucHzlnemmkQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184279-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xtf test] 184279: all pass - PUSHED
X-Osstest-Versions-This:
    xtf=2eed9f51c67a9e5d29ffd4ffeee50710489aad23
X-Osstest-Versions-That:
    xtf=a5bd8d9e5d5c7b729d6d6122900d28f7a00aa6c0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 08 Jan 2024 16:45:53 +0000

flight 184279 xtf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184279/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xtf                  2eed9f51c67a9e5d29ffd4ffeee50710489aad23
baseline version:
 xtf                  a5bd8d9e5d5c7b729d6d6122900d28f7a00aa6c0

Last test of basis   184277  2024-01-08 11:42:46 Z    0 days
Testing same since   184279  2024-01-08 15:13:02 Z    0 days    1 attempts

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
   a5bd8d9..2eed9f5  2eed9f51c67a9e5d29ffd4ffeee50710489aad23 -> xen-tested-master

