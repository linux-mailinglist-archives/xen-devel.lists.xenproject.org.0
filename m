Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 349B849E2D6
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 13:47:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261452.452725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD4BO-0002Xu-2o; Thu, 27 Jan 2022 12:47:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261452.452725; Thu, 27 Jan 2022 12:47:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD4BN-0002V8-UX; Thu, 27 Jan 2022 12:47:21 +0000
Received: by outflank-mailman (input) for mailman id 261452;
 Thu, 27 Jan 2022 12:47:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nD4BM-0002Ux-Dv; Thu, 27 Jan 2022 12:47:20 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nD4BM-0007vh-D9; Thu, 27 Jan 2022 12:47:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nD4BL-0006rS-Vr; Thu, 27 Jan 2022 12:47:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nD4BL-0001MA-VR; Thu, 27 Jan 2022 12:47:19 +0000
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
	bh=lgsFsfKvGgHFK9Zzr0KH4sg7r+sMoU9loAGolyA6+L4=; b=zx40UnygVyr64Yw9UAndecOkO2
	nUAS5NS1UmYhJjwwWB1BhUNr9/jEwdzvqoGSVLws90h6Am0Sh8q8hIDoh2wxvaOhL51hiOspk9Yjs
	Ptgv90orK/izxU/lnxA2poP7STSXAOh2yr6MIEuwMwtRBT9u7qUknPjySlhHo90DO/Xo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-167907-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 167907: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=8cc5590eab974ab34e2bfa1c9d6a7ef94c70ffae
X-Osstest-Versions-That:
    ovmf=7e5c603cba0823fd97456984f4cfc21c4c831b52
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 27 Jan 2022 12:47:19 +0000

flight 167907 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167907/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 8cc5590eab974ab34e2bfa1c9d6a7ef94c70ffae
baseline version:
 ovmf                 7e5c603cba0823fd97456984f4cfc21c4c831b52

Last test of basis   167803  2022-01-24 01:55:31 Z    3 days
Testing same since   167907  2022-01-27 02:40:24 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Kun Qin <kuqin12@gmail.com>

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
   7e5c603cba..8cc5590eab  8cc5590eab974ab34e2bfa1c9d6a7ef94c70ffae -> xen-tested-master

