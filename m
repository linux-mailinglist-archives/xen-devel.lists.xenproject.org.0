Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE82D8AF73E
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 21:23:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710957.1110542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzLjG-0000ZX-8R; Tue, 23 Apr 2024 19:22:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710957.1110542; Tue, 23 Apr 2024 19:22:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzLjG-0000X7-3U; Tue, 23 Apr 2024 19:22:58 +0000
Received: by outflank-mailman (input) for mailman id 710957;
 Tue, 23 Apr 2024 19:22:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rzLjF-0000Wv-1w; Tue, 23 Apr 2024 19:22:57 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rzLjE-0007PK-Um; Tue, 23 Apr 2024 19:22:56 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rzLjE-0005N7-Hd; Tue, 23 Apr 2024 19:22:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rzLjE-0007bm-HG; Tue, 23 Apr 2024 19:22:56 +0000
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
	bh=PGAOux79sDanBbylWBGWhPBpy/bkydAJPtc8APoxJwk=; b=vMTktDN1AThzYWZjYQYTJkTnec
	rv/zl0QOp09y+sXohD//TrlBBUlHXkcxCwvGpJ3rhxbSlcbUFCLdl+2/3Oeyew2pw3rhWEsCitxav
	NRnyTwv7WTLgsT8gLzAGbXlWVqNzt3UZpyyWehIiucWeZ5RrUK6kWo3nXK15xI//oq3o=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185773-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 185773: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=e3fa6986ae8521275fc6ca161f7394a3809f8723
X-Osstest-Versions-That:
    ovmf=86c8d69146310f24069701053a27153ae536ebba
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 23 Apr 2024 19:22:56 +0000

flight 185773 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185773/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e3fa6986ae8521275fc6ca161f7394a3809f8723
baseline version:
 ovmf                 86c8d69146310f24069701053a27153ae536ebba

Last test of basis   185764  2024-04-22 23:12:58 Z    0 days
Testing same since   185773  2024-04-23 17:41:11 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Adam Dunlap <acdunlap@google.com>

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
   86c8d69146..e3fa6986ae  e3fa6986ae8521275fc6ca161f7394a3809f8723 -> xen-tested-master

