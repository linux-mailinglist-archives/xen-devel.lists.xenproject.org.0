Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9A656D4E6
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jul 2022 08:45:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.364854.594803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAnAj-0001cX-80; Mon, 11 Jul 2022 06:45:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 364854.594803; Mon, 11 Jul 2022 06:45:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAnAj-0001ad-5I; Mon, 11 Jul 2022 06:45:33 +0000
Received: by outflank-mailman (input) for mailman id 364854;
 Mon, 11 Jul 2022 06:45:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oAnAh-0001aT-9M; Mon, 11 Jul 2022 06:45:31 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oAnAh-0006rX-7A; Mon, 11 Jul 2022 06:45:31 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oAnAg-0004t8-Lq; Mon, 11 Jul 2022 06:45:30 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oAnAg-0003wy-LP; Mon, 11 Jul 2022 06:45:30 +0000
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
	bh=vbtENd84WFaoI6k5svPTqP0tLGVgQk88EZqKngAc8Dw=; b=WGR/4ASxDLZwWwTIxyEo0gC6oc
	RDCC+kWpG0Ls/AoqBWDNdVOB+6gXq91xliNKgXbnZRfByI9XVOjoVHqzuWpvZ3IB4iCvlf2/LjPBq
	ySMxnjvil7lx5050d9xFbkeS+A44XBuZITxKyJ9wEZtHr2APKL59G8u3PPC7Gm4GuZgM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171580-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171580: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=f6f3cc7eadcfb20898b8d67fbcae21ef56f6897b
X-Osstest-Versions-That:
    ovmf=c8e30482fd2b32a2ba86edbd4c2429c48b20c99b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 11 Jul 2022 06:45:30 +0000

flight 171580 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171580/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 f6f3cc7eadcfb20898b8d67fbcae21ef56f6897b
baseline version:
 ovmf                 c8e30482fd2b32a2ba86edbd4c2429c48b20c99b

Last test of basis   171569  2022-07-09 15:10:21 Z    1 days
Testing same since   171580  2022-07-11 04:42:03 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  PaytonX Hsieh <paytonx.hsieh@intel.com>

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
   c8e30482fd..f6f3cc7ead  f6f3cc7eadcfb20898b8d67fbcae21ef56f6897b -> xen-tested-master

