Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 994D52933A7
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 05:30:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8898.23929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUiLU-00064d-BK; Tue, 20 Oct 2020 03:29:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8898.23929; Tue, 20 Oct 2020 03:29:56 +0000
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
	id 1kUiLU-00064H-89; Tue, 20 Oct 2020 03:29:56 +0000
Received: by outflank-mailman (input) for mailman id 8898;
 Tue, 20 Oct 2020 03:29:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Or1=D3=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kUiLS-00064C-QE
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 03:29:54 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1be4ff14-5e40-40b2-af1f-9c0287cadcde;
 Tue, 20 Oct 2020 03:29:51 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kUiLO-00054N-SO; Tue, 20 Oct 2020 03:29:50 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kUiLO-0001es-Ko; Tue, 20 Oct 2020 03:29:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kUiLO-0000CN-KK; Tue, 20 Oct 2020 03:29:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=3Or1=D3=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kUiLS-00064C-QE
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 03:29:54 +0000
X-Inumbo-ID: 1be4ff14-5e40-40b2-af1f-9c0287cadcde
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 1be4ff14-5e40-40b2-af1f-9c0287cadcde;
	Tue, 20 Oct 2020 03:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=euyCmsFnIwsBdvE7B03NoUhT83R20yDREV8T5lvyXEg=; b=xtDs7IdEhrUOCtVcdCkEIBj5iE
	pwSJhJJb4G5R03oT6QF+JKaHoT9lCQ+FyKnm0FKcsY+zxtQDzZY3e/aj82X3kgHpYxgF3A95CZp5O
	Vvl5PFoHCgV07mjErPJ+vSOQ4HeIOkVs5Z5NxurCdDFoFt0UBcrmwSB2v7XHep3rD+TM=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kUiLO-00054N-SO; Tue, 20 Oct 2020 03:29:50 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kUiLO-0001es-Ko; Tue, 20 Oct 2020 03:29:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kUiLO-0000CN-KK; Tue, 20 Oct 2020 03:29:50 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-155998-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 155998: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=93edd1887e34c3959ce927da1a22e8c54ce18a83
X-Osstest-Versions-That:
    ovmf=92e9c44f205a876556abe1a1addea5c40e4f3ccf
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 20 Oct 2020 03:29:50 +0000

flight 155998 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/155998/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 93edd1887e34c3959ce927da1a22e8c54ce18a83
baseline version:
 ovmf                 92e9c44f205a876556abe1a1addea5c40e4f3ccf

Last test of basis   155976  2020-10-19 08:40:33 Z    0 days
Testing same since   155998  2020-10-19 22:09:56 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Tom Lendacky <thomas.lendacky@amd.com>

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
   92e9c44f20..93edd1887e  93edd1887e34c3959ce927da1a22e8c54ce18a83 -> xen-tested-master

