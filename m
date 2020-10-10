Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3465D289F34
	for <lists+xen-devel@lfdr.de>; Sat, 10 Oct 2020 10:15:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5363.13985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRA0p-00037m-Qc; Sat, 10 Oct 2020 08:13:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5363.13985; Sat, 10 Oct 2020 08:13:55 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRA0p-00037N-N5; Sat, 10 Oct 2020 08:13:55 +0000
Received: by outflank-mailman (input) for mailman id 5363;
 Sat, 10 Oct 2020 08:13:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cL7A=DR=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kRA0o-00037I-Vc
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2020 08:13:55 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 01e94bb3-b0a2-466c-a11d-f62370485121;
 Sat, 10 Oct 2020 08:13:53 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kRA0n-00063G-8h; Sat, 10 Oct 2020 08:13:53 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kRA0n-00025u-0Y; Sat, 10 Oct 2020 08:13:53 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kRA0n-0004PF-03; Sat, 10 Oct 2020 08:13:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=cL7A=DR=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kRA0o-00037I-Vc
	for xen-devel@lists.xenproject.org; Sat, 10 Oct 2020 08:13:55 +0000
X-Inumbo-ID: 01e94bb3-b0a2-466c-a11d-f62370485121
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 01e94bb3-b0a2-466c-a11d-f62370485121;
	Sat, 10 Oct 2020 08:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=Dnu0m3NjgwSf15RmNcl/+XC5bURswRJIgGouGPVPlpo=; b=ZbbtmdgRznummjlMJxc6VNOna5
	tBf6q72cUiQU2VxgbDq04pCs42WMPNVHhLfpwBsh9hzDsxDqIVh0s/OtSiXIrWBgneOdsV0nwYca0
	0HKnjCnKqYiprSjZRIDuSkB2MzFKULVT6utPNlT7DaEr1B6umpc9yad9REV6n3lo845c=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kRA0n-00063G-8h; Sat, 10 Oct 2020 08:13:53 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kRA0n-00025u-0Y; Sat, 10 Oct 2020 08:13:53 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kRA0n-0004PF-03; Sat, 10 Oct 2020 08:13:53 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-155617-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 155617: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=70c2f10fde5b67b0d7d62ba7ea3271fc514ebcc4
X-Osstest-Versions-That:
    ovmf=091ab12b340a05c99ce0e31d29293ce58c7014e2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 10 Oct 2020 08:13:53 +0000

flight 155617 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/155617/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 70c2f10fde5b67b0d7d62ba7ea3271fc514ebcc4
baseline version:
 ovmf                 091ab12b340a05c99ce0e31d29293ce58c7014e2

Last test of basis   155594  2020-10-09 09:11:36 Z    0 days
Testing same since   155617  2020-10-09 21:42:06 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@hpe.com>
  Vladimir Olovyannikov <vladimir.olovyannikov@broadcom.com>
  Vladimir Olovyannikov via groups.io <vladimir.olovyannikov=broadcom.com@groups.io>

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
   091ab12b34..70c2f10fde  70c2f10fde5b67b0d7d62ba7ea3271fc514ebcc4 -> xen-tested-master

