Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D35DC2A4951
	for <lists+xen-devel@lfdr.de>; Tue,  3 Nov 2020 16:19:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18382.43393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZy4e-0003fY-JB; Tue, 03 Nov 2020 15:18:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18382.43393; Tue, 03 Nov 2020 15:18:16 +0000
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
	id 1kZy4e-0003f9-Fv; Tue, 03 Nov 2020 15:18:16 +0000
Received: by outflank-mailman (input) for mailman id 18382;
 Tue, 03 Nov 2020 15:18:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hh/q=EJ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kZy4d-0003f4-43
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 15:18:15 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4242ed2a-a6dd-47e7-b4b8-eecbf659d16f;
 Tue, 03 Nov 2020 15:18:14 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kZy4b-0005JL-NH; Tue, 03 Nov 2020 15:18:13 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kZy4b-00053h-FK; Tue, 03 Nov 2020 15:18:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kZy4b-0002ex-Eo; Tue, 03 Nov 2020 15:18:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=hh/q=EJ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kZy4d-0003f4-43
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 15:18:15 +0000
X-Inumbo-ID: 4242ed2a-a6dd-47e7-b4b8-eecbf659d16f
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4242ed2a-a6dd-47e7-b4b8-eecbf659d16f;
	Tue, 03 Nov 2020 15:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=Co8AsEZFRShcWQB3T7oOkQ96YM1/hepBkqVXI7qFmZ0=; b=FUWfOCiM9wlYcb3kmT7gF5kTY6
	0d5mSjndQHZXexNmF+nGYhSGGJXgXjE6FNRyOaG+jpMFFg+1hN+PWgbWpCjQojOhLaPOfxGfAzMW/
	OfAM1PGfkR7Fpzy2KRwW4U8bHWVChyemgldAr2gueiXdYBFlvPEtQjyRg1BZuLV0VFTU=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kZy4b-0005JL-NH; Tue, 03 Nov 2020 15:18:13 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kZy4b-00053h-FK; Tue, 03 Nov 2020 15:18:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kZy4b-0002ex-Eo; Tue, 03 Nov 2020 15:18:13 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156380-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 156380: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=375683654d46380e4e557502141e9823f6b68445
X-Osstest-Versions-That:
    ovmf=0166dad49698fbe263759755382006d64a0ac825
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 03 Nov 2020 15:18:13 +0000

flight 156380 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156380/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 375683654d46380e4e557502141e9823f6b68445
baseline version:
 ovmf                 0166dad49698fbe263759755382006d64a0ac825

Last test of basis   156374  2020-11-03 01:55:47 Z    0 days
Testing same since   156380  2020-11-03 10:11:49 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Pierre Gondois <pierre.gondois@arm.com>
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
   0166dad496..375683654d  375683654d46380e4e557502141e9823f6b68445 -> xen-tested-master

