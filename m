Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7361E655131
	for <lists+xen-devel@lfdr.de>; Fri, 23 Dec 2022 15:10:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468966.728193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8ijO-0006t0-CZ; Fri, 23 Dec 2022 14:09:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468966.728193; Fri, 23 Dec 2022 14:09:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8ijO-0006qF-8W; Fri, 23 Dec 2022 14:09:02 +0000
Received: by outflank-mailman (input) for mailman id 468966;
 Fri, 23 Dec 2022 14:09:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p8ijM-0006q5-A3; Fri, 23 Dec 2022 14:09:00 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p8ijM-0006h7-8G; Fri, 23 Dec 2022 14:09:00 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p8ijL-0006II-Q1; Fri, 23 Dec 2022 14:08:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p8ijL-00069B-Pc; Fri, 23 Dec 2022 14:08:59 +0000
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
	bh=l6kmM0KOWMVGBCuDRpXc6KsDwQyUbf1yRC/thQB7P+s=; b=rnDPTbqitFzMmGX39WZ3pF8Zut
	k6CBBBCkXDNtmj8k5wS0PDc0MGfAzWnxG36xc3Pn7/KPI6orDC7WjmJFaml67g1CzeOP38xxv2SgG
	DUAJc/6MkRNw/pfb5iMOfWkS4aRiAThGHJsYTgwHv1mEp8XTemGMb2N1qZ710Ah/w0pQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175465-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175465: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=bf65d7ee8842a93116534f727abcad235dd3e233
X-Osstest-Versions-That:
    ovmf=d8d4abdff9096a69ff59d96ac4a8dd0e19e5cbcc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 23 Dec 2022 14:08:59 +0000

flight 175465 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175465/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 bf65d7ee8842a93116534f727abcad235dd3e233
baseline version:
 ovmf                 d8d4abdff9096a69ff59d96ac4a8dd0e19e5cbcc

Last test of basis   175461  2022-12-22 18:12:21 Z    0 days
Testing same since   175465  2022-12-23 12:10:49 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>

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
   d8d4abdff9..bf65d7ee88  bf65d7ee8842a93116534f727abcad235dd3e233 -> xen-tested-master

