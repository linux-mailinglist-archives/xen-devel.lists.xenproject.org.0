Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAD057EF19
	for <lists+xen-devel@lfdr.de>; Sat, 23 Jul 2022 13:59:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.373693.605944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFDlW-0005cH-4V; Sat, 23 Jul 2022 11:57:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 373693.605944; Sat, 23 Jul 2022 11:57:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFDlW-0005Zo-1q; Sat, 23 Jul 2022 11:57:50 +0000
Received: by outflank-mailman (input) for mailman id 373693;
 Sat, 23 Jul 2022 11:57:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oFDlU-0005Ze-OQ; Sat, 23 Jul 2022 11:57:48 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oFDlU-0007RF-MN; Sat, 23 Jul 2022 11:57:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oFDlU-00045M-Bi; Sat, 23 Jul 2022 11:57:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oFDlU-00016V-BF; Sat, 23 Jul 2022 11:57:48 +0000
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
	bh=NFxWr/RQ3iBnTvp0xMETpBdaanSOptYaZ7OC5DDKFkI=; b=m1OZqTvL5HVS0xLzt4IBM1K0X/
	o79rxL/542wPX3ywYowT/HxIZYPeJcNanOK71xZuMkG57IatMiAd8d/8bhekm7do7EF0LB2C/Klke
	B5CJOsUoI96yp1StfXagdbnhYbSExOQ5NccP9bZluJUVTT/ooLQX6GF3vJbgMYSoc9QQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171800-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171800: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=6964b5c48c69e4961bad2dd9d6c02918f23c3be0
X-Osstest-Versions-That:
    ovmf=bf1ff540d9271c64f0c5323c79b20b21990626fe
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 23 Jul 2022 11:57:48 +0000

flight 171800 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171800/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 6964b5c48c69e4961bad2dd9d6c02918f23c3be0
baseline version:
 ovmf                 bf1ff540d9271c64f0c5323c79b20b21990626fe

Last test of basis   171790  2022-07-23 02:40:26 Z    0 days
Testing same since   171800  2022-07-23 06:11:59 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Cosmo Lai <cosmo.lai@intel.com>

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
   bf1ff540d9..6964b5c48c  6964b5c48c69e4961bad2dd9d6c02918f23c3be0 -> xen-tested-master

