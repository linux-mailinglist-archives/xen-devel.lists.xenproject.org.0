Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4752C65CD18
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 07:30:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470922.730596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCxH2-0008A1-3l; Wed, 04 Jan 2023 06:29:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470922.730596; Wed, 04 Jan 2023 06:29:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCxH2-000888-0L; Wed, 04 Jan 2023 06:29:16 +0000
Received: by outflank-mailman (input) for mailman id 470922;
 Wed, 04 Jan 2023 06:29:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pCxH0-00087y-6X; Wed, 04 Jan 2023 06:29:14 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pCxH0-0004WC-4n; Wed, 04 Jan 2023 06:29:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pCxGz-00022C-Ie; Wed, 04 Jan 2023 06:29:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pCxGz-0003xp-Fq; Wed, 04 Jan 2023 06:29:13 +0000
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
	bh=yBqAwBtZh4rt+py5r6h+d+4HmZXNp1GHJ2AzfZUrLNc=; b=Q1QvNqnpX41IHQKkcdxnFaz9FH
	HqtndwwgcDWQzUos2HZAqPSep1NpUBLCEG08UBS8rUbjqqpcyb7vqP/SM9eVrOjj0dBoRF8xxK4im
	5Src9v2NBrPDlF0sqZ9lXmcBUjHaGg+N4+0W8iyZgQTFIPveD5hd7cdrItVacOYGSSUw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175563-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175563: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=89c5d90003d9c54d03d3e85bd305718e9c29a213
X-Osstest-Versions-That:
    ovmf=b670700ddf5eb1dd958d60eb4f2a51e0636206f9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 04 Jan 2023 06:29:13 +0000

flight 175563 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175563/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 89c5d90003d9c54d03d3e85bd305718e9c29a213
baseline version:
 ovmf                 b670700ddf5eb1dd958d60eb4f2a51e0636206f9

Last test of basis   175558  2023-01-03 06:41:58 Z    0 days
Testing same since   175563  2023-01-04 02:10:49 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gua Guo <gua.guo@intel.com>

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
   b670700ddf..89c5d90003  89c5d90003d9c54d03d3e85bd305718e9c29a213 -> xen-tested-master

