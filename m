Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFDC3307BD
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 07:01:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94625.178170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJ8wR-0003tP-DD; Mon, 08 Mar 2021 06:00:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94625.178170; Mon, 08 Mar 2021 06:00:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJ8wR-0003sx-9I; Mon, 08 Mar 2021 06:00:31 +0000
Received: by outflank-mailman (input) for mailman id 94625;
 Mon, 08 Mar 2021 06:00:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lJ8wQ-0003sp-49; Mon, 08 Mar 2021 06:00:30 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lJ8wP-0007FL-T8; Mon, 08 Mar 2021 06:00:29 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lJ8wP-0004qM-Dn; Mon, 08 Mar 2021 06:00:29 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lJ8wP-0000G9-Ar; Mon, 08 Mar 2021 06:00:29 +0000
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
	bh=tDrgcQh8Dr9Tt+sMWEPs1Jz674xvW/Rhkavc43ulsdI=; b=20lTsX5LuIi0L5H5Q+Oeqgu0N4
	6fqaLTJeXDebju7Cb8GhKrDtsfmtA6BjR3b1PcLOjWKN04rgohsPF27ccCzkb4Fm2kjLnbExWYr92
	Fu2aj8kFqi/IIENks3XpYWkufgXKJ0dJoSVHuubbsRs10JUaH9/kBVzmLRmlAsuBG93o=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159863-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 159863: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b8a92fa2fea548dccacc2f228b607b7febdf81c0
X-Osstest-Versions-That:
    ovmf=59a3ccb09e7a246913d88fbac31412f20f717a3c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 08 Mar 2021 06:00:29 +0000

flight 159863 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/159863/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b8a92fa2fea548dccacc2f228b607b7febdf81c0
baseline version:
 ovmf                 59a3ccb09e7a246913d88fbac31412f20f717a3c

Last test of basis   159841  2021-03-05 16:11:00 Z    2 days
Testing same since   159863  2021-03-08 01:39:46 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bret Barkelew <Bret.Barkelew@microsoft.com>
  Bret Barkelew <bret@corthon.com>

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
   59a3ccb09e..b8a92fa2fe  b8a92fa2fea548dccacc2f228b607b7febdf81c0 -> xen-tested-master

