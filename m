Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0C8480839
	for <lists+xen-devel@lfdr.de>; Tue, 28 Dec 2021 11:10:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.252161.433154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n29Pv-0003Vo-Ff; Tue, 28 Dec 2021 10:09:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 252161.433154; Tue, 28 Dec 2021 10:09:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n29Pv-0003T1-C2; Tue, 28 Dec 2021 10:09:15 +0000
Received: by outflank-mailman (input) for mailman id 252161;
 Tue, 28 Dec 2021 10:09:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n29Pt-0003Sr-UZ; Tue, 28 Dec 2021 10:09:13 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n29Pt-0002Ny-Rf; Tue, 28 Dec 2021 10:09:13 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n29Pt-0000X9-GC; Tue, 28 Dec 2021 10:09:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1n29Pt-0002Iy-Fm; Tue, 28 Dec 2021 10:09:13 +0000
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
	bh=gZmpRXtlEhrBWPcc8/iONV/Rp98zg0yXGRzlsOTnm7E=; b=OBI7LcnpoZQ9M5HUJn7JNSxNi3
	g4FeqTYdrcvG4fSBXJe/CK/8pgnI1R1qtsPjGd7YmPSQQpfs07iMf57EL/nMobpM1MylNbOD7pAW6
	jTTlePb7B0oX5vmq4h6FpFDPB9avpTAW9HjC2WKOama3fixSRmzZmTZ2W94UjtRuNUDw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-167552-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 167552: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=e910f076ad02c80bb69cebb18d51ef6896beee0d
X-Osstest-Versions-That:
    ovmf=6612ff85611bc2be16dc0fd5de0e1413df88941a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 28 Dec 2021 10:09:13 +0000

flight 167552 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167552/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e910f076ad02c80bb69cebb18d51ef6896beee0d
baseline version:
 ovmf                 6612ff85611bc2be16dc0fd5de0e1413df88941a

Last test of basis   167535  2021-12-24 09:12:58 Z    4 days
Testing same since   167552  2021-12-28 08:42:46 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bob Feng <bob.c.feng@intel.com>

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
   6612ff8561..e910f076ad  e910f076ad02c80bb69cebb18d51ef6896beee0d -> xen-tested-master

