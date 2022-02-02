Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 462BA4A6D01
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 09:38:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263843.456689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFB91-00024i-Jm; Wed, 02 Feb 2022 08:37:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263843.456689; Wed, 02 Feb 2022 08:37:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFB91-000225-Gj; Wed, 02 Feb 2022 08:37:39 +0000
Received: by outflank-mailman (input) for mailman id 263843;
 Wed, 02 Feb 2022 08:37:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nFB8z-00021v-UF; Wed, 02 Feb 2022 08:37:37 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nFB8z-0005HO-RS; Wed, 02 Feb 2022 08:37:37 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nFB8z-0007ye-Dc; Wed, 02 Feb 2022 08:37:37 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nFB8z-0004At-D9; Wed, 02 Feb 2022 08:37:37 +0000
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
	bh=+/OG1pHUZyKlH8AwWBWveLnKtdRFJGaIVF5elO+d1Gs=; b=ldzGxcb2FsI1THf7AU/iiOzlRC
	r9YN8wXykfvoKX8Qdv8KHHselhO6BoWcEO/BEPKn+5UNfsmOM8ThU3jCx5agjaPigx8TVHTiLHxGk
	WiKk2npWDNYL/IUDJt8RmiWq+nDqjEkXS/T7Tuw4jT9vSG+XL+GmrDN7ojJq9CB+kF3M=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-167980-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 167980: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=017564d637e9c3051c2796d1d5b4d5df7179434c
X-Osstest-Versions-That:
    ovmf=5b3c682d91bd699a3144d36258565ccaa2036db7
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 02 Feb 2022 08:37:37 +0000

flight 167980 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167980/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 017564d637e9c3051c2796d1d5b4d5df7179434c
baseline version:
 ovmf                 5b3c682d91bd699a3144d36258565ccaa2036db7

Last test of basis   167976  2022-02-01 17:41:44 Z    0 days
Testing same since   167980  2022-02-02 02:46:38 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alexander Graf <agraf@csgraf.de>
  Ard Biesheuvel <ardb@kernel.org>
  Leif Lindholm <leif@nuviainc.com>

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
   5b3c682d91..017564d637  017564d637e9c3051c2796d1d5b4d5df7179434c -> xen-tested-master

