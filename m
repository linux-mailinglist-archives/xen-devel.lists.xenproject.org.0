Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 888912989B7
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 10:46:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12172.31907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kWz57-0001Qe-Qt; Mon, 26 Oct 2020 09:46:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12172.31907; Mon, 26 Oct 2020 09:46:25 +0000
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
	id 1kWz57-0001QE-Nh; Mon, 26 Oct 2020 09:46:25 +0000
Received: by outflank-mailman (input) for mailman id 12172;
 Mon, 26 Oct 2020 09:46:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WRSk=EB=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kWz56-0001Ou-Dy
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 09:46:24 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 623cd873-d9f4-4d80-9ace-69f806647549;
 Mon, 26 Oct 2020 09:46:18 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kWz50-00087f-5O; Mon, 26 Oct 2020 09:46:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kWz4z-0003DN-T6; Mon, 26 Oct 2020 09:46:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kWz4z-0007Kz-SY; Mon, 26 Oct 2020 09:46:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=WRSk=EB=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kWz56-0001Ou-Dy
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 09:46:24 +0000
X-Inumbo-ID: 623cd873-d9f4-4d80-9ace-69f806647549
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 623cd873-d9f4-4d80-9ace-69f806647549;
	Mon, 26 Oct 2020 09:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=/gIA32XdbAKB4NRFhS72e94jNYiYhLF6gN6orWS8RN4=; b=quwqQZVM8aAMTfvdf+GJ3Zo86g
	oikE50eOuJh3US8Lbm/Y+8WDSSWSuP1NPQizreTFbkaCKnC8w6iNTGszOu+y3Mfq4ewGBlnZuU2Ju
	8Zh4gqMBT+CYJd10Wp9dGuFZDm/pBT2P1jPzPZZEgM5glnxHPh87YHoBYvTyAAFbQxps=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kWz50-00087f-5O; Mon, 26 Oct 2020 09:46:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kWz4z-0003DN-T6; Mon, 26 Oct 2020 09:46:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kWz4z-0007Kz-SY; Mon, 26 Oct 2020 09:46:17 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156232-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 156232: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b70c4fdcde83689d8cd1e5e2faf598d0087934a3
X-Osstest-Versions-That:
    ovmf=264eccb5dfc345c2e004883f00e62959f818fafd
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 26 Oct 2020 09:46:17 +0000

flight 156232 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156232/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b70c4fdcde83689d8cd1e5e2faf598d0087934a3
baseline version:
 ovmf                 264eccb5dfc345c2e004883f00e62959f818fafd

Last test of basis   156102  2020-10-22 17:10:41 Z    3 days
Testing same since   156232  2020-10-26 03:10:04 Z    0 days    1 attempts

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
   264eccb5df..b70c4fdcde  b70c4fdcde83689d8cd1e5e2faf598d0087934a3 -> xen-tested-master

