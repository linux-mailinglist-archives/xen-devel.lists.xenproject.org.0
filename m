Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E032A43B30C
	for <lists+xen-devel@lfdr.de>; Tue, 26 Oct 2021 15:15:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216427.376028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfMH9-0005lM-4c; Tue, 26 Oct 2021 13:13:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216427.376028; Tue, 26 Oct 2021 13:13:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfMH8-0005jN-VX; Tue, 26 Oct 2021 13:13:58 +0000
Received: by outflank-mailman (input) for mailman id 216427;
 Tue, 26 Oct 2021 13:13:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mfMH7-0005jD-Mh; Tue, 26 Oct 2021 13:13:57 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mfMH7-0000np-If; Tue, 26 Oct 2021 13:13:57 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mfMH7-0005fs-9q; Tue, 26 Oct 2021 13:13:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mfMH7-0005ku-9J; Tue, 26 Oct 2021 13:13:57 +0000
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
	bh=2M7ntxn1PebMNN0OjefNYVXAiGXe7o2QiXO3fEb0lVY=; b=mbcvUybFU/bAONpCW9nVyESDz/
	lbE1gy1dXmI2iD13l2y2oQ1DYb7cT2JPOZFsHgDZWI96f39TYgf3pE0ZVBfGmW1g/09Vo3LmZxLlb
	S45qw7GzVgIF5cX9bzW+EoTtbsqNbAT2VUQPlhs6R/zCeukzIW1twas+SUA1YFqiOo88=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165873-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 165873: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=2f6f3329add328103cb0654b71d7b814dc0c9759
X-Osstest-Versions-That:
    ovmf=b80c17b62d989ec00e528c6307c726ce6800bcc4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 26 Oct 2021 13:13:57 +0000

flight 165873 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165873/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 2f6f3329add328103cb0654b71d7b814dc0c9759
baseline version:
 ovmf                 b80c17b62d989ec00e528c6307c726ce6800bcc4

Last test of basis   165862  2021-10-25 17:41:18 Z    0 days
Testing same since   165873  2021-10-26 05:40:10 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Yang Jie <jie.yang@intel.com>

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
   b80c17b62d..2f6f3329ad  2f6f3329add328103cb0654b71d7b814dc0c9759 -> xen-tested-master

