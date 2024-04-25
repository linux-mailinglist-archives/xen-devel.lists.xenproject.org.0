Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2D18B1860
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 03:15:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711758.1111987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rznhB-0007to-Nc; Thu, 25 Apr 2024 01:14:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711758.1111987; Thu, 25 Apr 2024 01:14:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rznhB-0007rz-Kg; Thu, 25 Apr 2024 01:14:41 +0000
Received: by outflank-mailman (input) for mailman id 711758;
 Thu, 25 Apr 2024 01:14:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rznh9-0007rp-TE; Thu, 25 Apr 2024 01:14:39 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rznh9-0006dW-Hp; Thu, 25 Apr 2024 01:14:39 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rznh9-0003BN-86; Thu, 25 Apr 2024 01:14:39 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rznh9-0000cO-7d; Thu, 25 Apr 2024 01:14:39 +0000
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
	bh=GtUwzsb5xu5frkmUZPkwvMm+fB2PQdsPu9CXU/MFSEU=; b=v4q6wCVpb1/2X8CSWUsjFa2+aa
	hyw5E079Cx30q+HvSaVxNLSANYLevBhcvKl3tpkcNvjAxjylBpbG+SEwVUB+rKE/TxmZqWwrGwqQr
	bis2OpRL/xpnQIPKHaI6v/bYRiZhcM5RV8IaskF40CS9IM5AB4YTL7B7XEdWvotjXgK0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185789-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 185789: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=90b6725562c82ec630d9e0cb19078f4b507db10b
X-Osstest-Versions-That:
    ovmf=d97f964f7ce063f9861f4d21cc6352f6861f95a8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 25 Apr 2024 01:14:39 +0000

flight 185789 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185789/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 90b6725562c82ec630d9e0cb19078f4b507db10b
baseline version:
 ovmf                 d97f964f7ce063f9861f4d21cc6352f6861f95a8

Last test of basis   185776  2024-04-23 21:41:06 Z    1 days
Testing same since   185789  2024-04-24 23:42:57 Z    0 days    1 attempts

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
   d97f964f7c..90b6725562  90b6725562c82ec630d9e0cb19078f4b507db10b -> xen-tested-master

