Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E85932023
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2024 07:42:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759298.1168951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTawR-0002u0-Ig; Tue, 16 Jul 2024 05:41:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759298.1168951; Tue, 16 Jul 2024 05:41:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTawR-0002rb-Fh; Tue, 16 Jul 2024 05:41:35 +0000
Received: by outflank-mailman (input) for mailman id 759298;
 Tue, 16 Jul 2024 05:41:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sTawQ-0002rR-AH; Tue, 16 Jul 2024 05:41:34 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sTawQ-0005Ih-5v; Tue, 16 Jul 2024 05:41:34 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sTawP-0000p3-Rz; Tue, 16 Jul 2024 05:41:33 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sTawP-0001fw-R1; Tue, 16 Jul 2024 05:41:33 +0000
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
	bh=nMvdp9XM2OwEb1pJFDyfJzDWtdm3Si/7QPqGX88DXzE=; b=OnM6BfiPiyK5rW1VGagPX+K3CF
	2INtB7TMINEB6CmgGJYszdRR1HnwvMFBki/PY7QWVldqWm+uuMjKCanijj3EdcDQQiN1C4n10UsIg
	WaOlF7MS5tB4OvOeAEeJdTyVQQLE0sHoEh+qRf8vO0znnJxxE5Ro0+QLOw1jrBRhedmo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186813-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186813: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=1bb9f47739ae7993191a36bea76c5a2157fdd10f
X-Osstest-Versions-That:
    ovmf=8e6ba0dcae40bfd4c191b2cd47e08f38186513d1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 16 Jul 2024 05:41:33 +0000

flight 186813 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186813/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 1bb9f47739ae7993191a36bea76c5a2157fdd10f
baseline version:
 ovmf                 8e6ba0dcae40bfd4c191b2cd47e08f38186513d1

Last test of basis   186810  2024-07-15 17:12:53 Z    0 days
Testing same since   186813  2024-07-16 04:13:00 Z    0 days    1 attempts

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
   8e6ba0dcae..1bb9f47739  1bb9f47739ae7993191a36bea76c5a2157fdd10f -> xen-tested-master

