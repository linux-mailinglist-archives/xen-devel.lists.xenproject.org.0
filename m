Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A8E28E7E9
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 22:33:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7001.18333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSnSk-0003vi-VZ; Wed, 14 Oct 2020 20:33:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7001.18333; Wed, 14 Oct 2020 20:33:30 +0000
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
	id 1kSnSk-0003vJ-S3; Wed, 14 Oct 2020 20:33:30 +0000
Received: by outflank-mailman (input) for mailman id 7001;
 Wed, 14 Oct 2020 20:33:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mg0A=DV=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kSnSj-0003vD-4N
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 20:33:29 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 66be07ac-6674-47d3-95c7-d8fb22355eb7;
 Wed, 14 Oct 2020 20:33:26 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kSnSg-0006Xr-D9; Wed, 14 Oct 2020 20:33:26 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kSnSg-00046L-3K; Wed, 14 Oct 2020 20:33:26 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kSnSg-0001jr-2s; Wed, 14 Oct 2020 20:33:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=mg0A=DV=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kSnSj-0003vD-4N
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 20:33:29 +0000
X-Inumbo-ID: 66be07ac-6674-47d3-95c7-d8fb22355eb7
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 66be07ac-6674-47d3-95c7-d8fb22355eb7;
	Wed, 14 Oct 2020 20:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=Thbrt4xHrXTjbk+kZYvulJsRXgX1Ya8psX0g9ex29L8=; b=SjORmD70i9dt+NX/PyyfYFmDpm
	2fpon155RTZIIbeFPlo7h/3rn1crdaAl8SRgeS20EHauUlzw6up2pKJ23qm9gy/Rz0sOT+/89e9pi
	ukAL5g05aQhxjIOl/XXqJtnJV1bx3SudupeYGFHF25APFSYO3gmRO4VmD6XYXup9qvLQ=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kSnSg-0006Xr-D9; Wed, 14 Oct 2020 20:33:26 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kSnSg-00046L-3K; Wed, 14 Oct 2020 20:33:26 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kSnSg-0001jr-2s; Wed, 14 Oct 2020 20:33:26 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-155801-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 155801: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=5d0a827122cccd1f884faf75b2a065d88a58bce1
X-Osstest-Versions-That:
    ovmf=9380177354387f03c8ff9eadb7ae94aa453b9469
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 14 Oct 2020 20:33:26 +0000

flight 155801 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/155801/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 5d0a827122cccd1f884faf75b2a065d88a58bce1
baseline version:
 ovmf                 9380177354387f03c8ff9eadb7ae94aa453b9469

Last test of basis   155765  2020-10-13 06:07:35 Z    1 days
Testing same since   155801  2020-10-14 09:11:09 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gao, Zhichao <zhichao.gao@intel.com>
  Zhichao Gao <zhichao.gao@intel.com>

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
   9380177354..5d0a827122  5d0a827122cccd1f884faf75b2a065d88a58bce1 -> xen-tested-master

