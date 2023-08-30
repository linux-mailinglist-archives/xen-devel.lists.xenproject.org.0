Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC7F78D23B
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 04:54:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592672.925457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbBL6-0001IS-TY; Wed, 30 Aug 2023 02:53:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592672.925457; Wed, 30 Aug 2023 02:53:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbBL6-0001Fv-Pw; Wed, 30 Aug 2023 02:53:52 +0000
Received: by outflank-mailman (input) for mailman id 592672;
 Wed, 30 Aug 2023 02:53:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qbBL5-0001Fl-Hv; Wed, 30 Aug 2023 02:53:51 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qbBL5-0006q3-DJ; Wed, 30 Aug 2023 02:53:51 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qbBL4-0000h9-SQ; Wed, 30 Aug 2023 02:53:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qbBL4-0002Cp-Rq; Wed, 30 Aug 2023 02:53:50 +0000
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
	bh=XSFF5q4hRdHthI5rW7MLwc06sbrKWU9Wa3yaKjTEDm8=; b=dI4MGJrnsNwaNV2IX0vEhfw4kX
	iNbAmGAAJS5cJkgawoAjlYOIBcLNudBjqxpKlq/Ri7MvMLrVTDUpRkAq7ArxgIbl0TB/SXcQfSAWA
	M5R4/zLAkee6ve92xqgvFJSrhdCbgZSaDgMziiIIylniFxJe3key8hxm8oS+QktJVTMs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182560-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 182560: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=9896a9c61836a5afba72c47d7c64f4e24f0805ba
X-Osstest-Versions-That:
    ovmf=14bf2cb411cae5306fd9efa8222264e8cf9ecc19
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 30 Aug 2023 02:53:50 +0000

flight 182560 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182560/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 9896a9c61836a5afba72c47d7c64f4e24f0805ba
baseline version:
 ovmf                 14bf2cb411cae5306fd9efa8222264e8cf9ecc19

Last test of basis   182554  2023-08-29 12:43:57 Z    0 days
Testing same since   182560  2023-08-30 00:13:12 Z    0 days    1 attempts

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
   14bf2cb411..9896a9c618  9896a9c61836a5afba72c47d7c64f4e24f0805ba -> xen-tested-master

