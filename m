Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 655766C4FF1
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 17:03:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513531.794662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pf0vC-0002Il-0X; Wed, 22 Mar 2023 16:02:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513531.794662; Wed, 22 Mar 2023 16:02:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pf0vB-0002Hq-TL; Wed, 22 Mar 2023 16:02:41 +0000
Received: by outflank-mailman (input) for mailman id 513531;
 Wed, 22 Mar 2023 16:02:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pf0vA-0002Hg-KW; Wed, 22 Mar 2023 16:02:40 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pf0vA-00028l-Iu; Wed, 22 Mar 2023 16:02:40 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pf0vA-0004MT-2w; Wed, 22 Mar 2023 16:02:40 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pf0vA-0006hd-2R; Wed, 22 Mar 2023 16:02:40 +0000
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
	bh=lukhVWjRKhxUXJXPrfRYdWQcGMJ6OrQvKwALbezKNzM=; b=2wmrDCtC/CegOYgBLlmZhtBguf
	PiiRO8Zvpxajwoa0uuv/eolSUCy7hvcs0zLcXVcaUA2JaIAiZ1dP/4u9odk1Oa22Clr5QY899/KYW
	Yn0aSr7Cc3a6ii1MhjUne3417/FntN0xnYjpALTkS5h5PL7tWg/xZJWoIsw7dCjK0RqM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-179860-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 179860: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=4f441d024bee7e1a6438737b58e4b0b6856b3eab
X-Osstest-Versions-That:
    ovmf=494127613b36e870250649b02cd4ce5f1969d9bd
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 22 Mar 2023 16:02:40 +0000

flight 179860 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/179860/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 4f441d024bee7e1a6438737b58e4b0b6856b3eab
baseline version:
 ovmf                 494127613b36e870250649b02cd4ce5f1969d9bd

Last test of basis   179832  2023-03-21 06:12:14 Z    1 days
Testing same since   179860  2023-03-22 04:10:52 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>

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
   494127613b..4f441d024b  4f441d024bee7e1a6438737b58e4b0b6856b3eab -> xen-tested-master

