Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E72A2910F1
	for <lists+xen-devel@lfdr.de>; Sat, 17 Oct 2020 11:26:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8281.22054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTiSr-0006WS-Gp; Sat, 17 Oct 2020 09:25:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8281.22054; Sat, 17 Oct 2020 09:25:25 +0000
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
	id 1kTiSr-0006W3-DJ; Sat, 17 Oct 2020 09:25:25 +0000
Received: by outflank-mailman (input) for mailman id 8281;
 Sat, 17 Oct 2020 09:25:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QMVr=DY=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kTiSq-0006Vy-0Y
 for xen-devel@lists.xenproject.org; Sat, 17 Oct 2020 09:25:24 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1d8ecbff-6514-47f8-94a6-59c115f7c052;
 Sat, 17 Oct 2020 09:25:21 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kTiSn-0007Xu-Au; Sat, 17 Oct 2020 09:25:21 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kTiSn-0007m6-22; Sat, 17 Oct 2020 09:25:21 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kTiSn-0005Hb-1c; Sat, 17 Oct 2020 09:25:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=QMVr=DY=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kTiSq-0006Vy-0Y
	for xen-devel@lists.xenproject.org; Sat, 17 Oct 2020 09:25:24 +0000
X-Inumbo-ID: 1d8ecbff-6514-47f8-94a6-59c115f7c052
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 1d8ecbff-6514-47f8-94a6-59c115f7c052;
	Sat, 17 Oct 2020 09:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=w2rsnAOCrgTTNyE7wFRQ6UfX9pk2pPmIo2yVrdvpyy0=; b=eJ2LP2Nmq7UtGevhJNDbA0zoiI
	zc1Okxdj3qxsM/bk4aa/j3msjkrB2LQOBZLUmiT+eBf9XtoU+g1sjzwSBz/XPCubBzk/qE7C0XL2P
	vjlaYCXUrgVxykppqUWVBnvQLrkQWd9PNMhIR+9/wj+M29Vr0CT8cZU1TUXT1kx9UzqM=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kTiSn-0007Xu-Au; Sat, 17 Oct 2020 09:25:21 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kTiSn-0007m6-22; Sat, 17 Oct 2020 09:25:21 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kTiSn-0005Hb-1c; Sat, 17 Oct 2020 09:25:21 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-155908-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 155908: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=30f0ec8d80072ae3ab58e08014e6b2ffe3ef97e1
X-Osstest-Versions-That:
    ovmf=a7d977040bd82b89d1fe5ef32d488bfd10db2dbc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 17 Oct 2020 09:25:21 +0000

flight 155908 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/155908/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 30f0ec8d80072ae3ab58e08014e6b2ffe3ef97e1
baseline version:
 ovmf                 a7d977040bd82b89d1fe5ef32d488bfd10db2dbc

Last test of basis   155891  2020-10-16 10:41:44 Z    0 days
Testing same since   155908  2020-10-16 18:15:11 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <Ard.Biesheuvel@arm.com>
  Hao A Wu <hao.a.wu@intel.com>
  Laszlo Ersek <lersek@redhat.com>
  Sami Mujawar <sami.mujawar@arm.com>

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
   a7d977040b..30f0ec8d80  30f0ec8d80072ae3ab58e08014e6b2ffe3ef97e1 -> xen-tested-master

