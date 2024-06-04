Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB938FBDF1
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2024 23:17:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735493.1141637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEbWd-0005fV-Qc; Tue, 04 Jun 2024 21:16:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735493.1141637; Tue, 04 Jun 2024 21:16:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEbWd-0005dy-Nw; Tue, 04 Jun 2024 21:16:59 +0000
Received: by outflank-mailman (input) for mailman id 735493;
 Tue, 04 Jun 2024 21:16:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sEbWd-0005do-0T; Tue, 04 Jun 2024 21:16:59 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sEbWc-0005Kn-KV; Tue, 04 Jun 2024 21:16:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sEbWc-0007a9-8M; Tue, 04 Jun 2024 21:16:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sEbWc-0000Yl-7q; Tue, 04 Jun 2024 21:16:58 +0000
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
	bh=YcP0lxSvTmyzp2pFJw9KHbs6QDt4t6SH2yElWrJAazg=; b=YbwPlBhNYq2ZODO9qUS7mGby2n
	rEqnoetoJoJ01B16UiW/sqcUazMzzAl8UmuKHnytlyJNMYK6EihYa04Efdi7iz9I0oQ9IRl8rfhr/
	c51fW/2CjYPNj13E28PGEUHs4oGW1UsKDyWdPEVEotH1p09XJHBdlidzFn+/2oO1Qsp0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186249-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186249: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=de4cc40b8c1d9044df82e077e72ef6e192ea12e2
X-Osstest-Versions-That:
    ovmf=839bd179735284592ba8f0879d2cbf07e0cb585a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 04 Jun 2024 21:16:58 +0000

flight 186249 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186249/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 de4cc40b8c1d9044df82e077e72ef6e192ea12e2
baseline version:
 ovmf                 839bd179735284592ba8f0879d2cbf07e0cb585a

Last test of basis   186246  2024-06-04 12:44:40 Z    0 days
Testing same since   186249  2024-06-04 19:12:56 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>

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
   839bd17973..de4cc40b8c  de4cc40b8c1d9044df82e077e72ef6e192ea12e2 -> xen-tested-master

