Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A0C8267E9
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 07:19:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663182.1033010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMiy8-0005bV-Te; Mon, 08 Jan 2024 06:18:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663182.1033010; Mon, 08 Jan 2024 06:18:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMiy8-0005ZD-Qq; Mon, 08 Jan 2024 06:18:40 +0000
Received: by outflank-mailman (input) for mailman id 663182;
 Mon, 08 Jan 2024 06:18:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rMiy8-0005Z3-C3; Mon, 08 Jan 2024 06:18:40 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rMiy8-0000uH-4z; Mon, 08 Jan 2024 06:18:40 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rMiy7-0005cs-IN; Mon, 08 Jan 2024 06:18:39 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rMiy7-000212-Hx; Mon, 08 Jan 2024 06:18:39 +0000
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
	bh=F3bKGTQiAGezR5j6JzsM6EjkfOY4G9iiTX/mw0LN4G0=; b=HLtQwp2LvOJqx/BOTFBYDVfJpm
	rN6o/rK6TlrKrcJxi6AV/ohimRZtoL3KsSp4wnKXI3Ue32SGUVPwLNMc/IMfXUV9eQwD5URpSSGX2
	TP0nTduymWkREPd3g4wfe0kPzAvDPvSZ6QRMDnm9aRSeRevqtc/HNT3rsRQdtI48A8K8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184272-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184272: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ff1305c9fb171ad51bfc149c544e3ab5a0edf521
X-Osstest-Versions-That:
    ovmf=9cf1d03ebe076b3e3825dfebbc19fd6b52b5f336
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 08 Jan 2024 06:18:39 +0000

flight 184272 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184272/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ff1305c9fb171ad51bfc149c544e3ab5a0edf521
baseline version:
 ovmf                 9cf1d03ebe076b3e3825dfebbc19fd6b52b5f336

Last test of basis   184259  2024-01-05 20:42:55 Z    2 days
Testing same since   184272  2024-01-08 02:11:04 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Suqiang Ren <suqiangx.ren@intel.com>

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
   9cf1d03ebe..ff1305c9fb  ff1305c9fb171ad51bfc149c544e3ab5a0edf521 -> xen-tested-master

