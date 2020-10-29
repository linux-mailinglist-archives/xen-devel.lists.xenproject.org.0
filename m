Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BB629EA6B
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 12:25:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14141.35120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kY63N-0001UB-AY; Thu, 29 Oct 2020 11:25:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14141.35120; Thu, 29 Oct 2020 11:25:13 +0000
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
	id 1kY63N-0001Tm-7H; Thu, 29 Oct 2020 11:25:13 +0000
Received: by outflank-mailman (input) for mailman id 14141;
 Thu, 29 Oct 2020 11:25:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m9Pg=EE=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kY63L-0001TE-Td
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 11:25:11 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7b9b3b50-41cb-431c-8d28-515955dd2648;
 Thu, 29 Oct 2020 11:25:05 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kY63E-0002SJ-Nj; Thu, 29 Oct 2020 11:25:04 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kY63E-0001gh-FC; Thu, 29 Oct 2020 11:25:04 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kY63E-00089O-EJ; Thu, 29 Oct 2020 11:25:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=m9Pg=EE=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kY63L-0001TE-Td
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 11:25:11 +0000
X-Inumbo-ID: 7b9b3b50-41cb-431c-8d28-515955dd2648
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 7b9b3b50-41cb-431c-8d28-515955dd2648;
	Thu, 29 Oct 2020 11:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=qjio7EDTPqNvGlaW6CX2DaFSwVFZJC4vL8ma3J9oEu0=; b=ESV+yiqmypuo/aQh4YQUZMJjFo
	Our5YLYZvOTCozVKigZJqgLo3v99GeXVgGW395moxvNNHvwJUUp0mBLdu4ZWl/zsicCMJkeMc1ZXj
	xkh9HtCi8rMbo7TKVm8NW6oqCfXuFzrV+l3Xy5o0G6Lk1Un9roBziEq6sEuOZwzdmVMw=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kY63E-0002SJ-Nj; Thu, 29 Oct 2020 11:25:04 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kY63E-0001gh-FC; Thu, 29 Oct 2020 11:25:04 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kY63E-00089O-EJ; Thu, 29 Oct 2020 11:25:04 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156270-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 156270: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=3b87d728742fe58f427f4b775b11250e29d75cc6
X-Osstest-Versions-That:
    ovmf=eb520b93d279e901a593c57e30649fb08f4290c5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 29 Oct 2020 11:25:04 +0000

flight 156270 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156270/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 3b87d728742fe58f427f4b775b11250e29d75cc6
baseline version:
 ovmf                 eb520b93d279e901a593c57e30649fb08f4290c5

Last test of basis   156255  2020-10-27 09:04:36 Z    2 days
Testing same since   156270  2020-10-28 03:11:01 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@hpe.com>

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
   eb520b93d2..3b87d72874  3b87d728742fe58f427f4b775b11250e29d75cc6 -> xen-tested-master

