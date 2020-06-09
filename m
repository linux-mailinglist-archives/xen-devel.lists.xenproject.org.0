Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E441F48CE
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 23:24:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiljL-0004nk-Og; Tue, 09 Jun 2020 21:24:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aKNw=7W=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jiljK-0004nO-H0
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 21:24:22 +0000
X-Inumbo-ID: 92d11e4a-aa97-11ea-bb8b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 92d11e4a-aa97-11ea-bb8b-bc764e2007e4;
 Tue, 09 Jun 2020 21:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3JymUrzmX4cRoutP1yS1bTp7c5z2hLlkHLTJntb9do8=; b=ghk1yL+gIDfOhhZzzm2YLXFUP
 AjQ7e5ZzZuIJk0/fEDioBs7wLfPXVr9TfvKG69ox76cCvwCwNdXNpgRLI1EpC4rHEU0VrYSDs8hZt
 kt/Cyy8UMk3p55szxn7RbSiLslXNPdwuxpj6/orSAzlxTu1Gl9Eijz52UUh01LQlsBG7Q=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jiljE-0001Os-F5; Tue, 09 Jun 2020 21:24:16 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jiljD-00037R-SW; Tue, 09 Jun 2020 21:24:16 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jiljD-0006DS-Rq; Tue, 09 Jun 2020 21:24:15 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150946-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 150946: tolerable trouble: pass/starved - PUSHED
X-Osstest-Failures: ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:hosts-allocate:starved:nonblocking
 ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This: ovmf=6aa48ab791ecc4fe22d110222bd7b566bc8a2274
X-Osstest-Versions-That: ovmf=6ff7c838d09224dd4e4c9b5b93152d8db1b19740
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 09 Jun 2020 21:24:15 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

flight 150946 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150946/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-ovmf-amd64  2 hosts-allocate             starved n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  2 hosts-allocate              starved n/a

version targeted for testing:
 ovmf                 6aa48ab791ecc4fe22d110222bd7b566bc8a2274
baseline version:
 ovmf                 6ff7c838d09224dd4e4c9b5b93152d8db1b19740

Last test of basis   150917  2020-06-08 01:40:21 Z    1 days
Testing same since   150946  2020-06-09 18:43:44 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ard.biesheuvel@arm.com>
  Laszlo Ersek <lersek@redhat.com>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         starved 
 test-amd64-i386-xl-qemuu-ovmf-amd64                          starved 


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
   6ff7c838d0..6aa48ab791  6aa48ab791ecc4fe22d110222bd7b566bc8a2274 -> xen-tested-master

