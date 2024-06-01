Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF288D6EC2
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jun 2024 10:06:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734046.1140270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDJke-0007aT-7k; Sat, 01 Jun 2024 08:06:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734046.1140270; Sat, 01 Jun 2024 08:06:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDJke-0007Y1-4a; Sat, 01 Jun 2024 08:06:08 +0000
Received: by outflank-mailman (input) for mailman id 734046;
 Sat, 01 Jun 2024 08:06:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sDJkd-0007Xr-37; Sat, 01 Jun 2024 08:06:07 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sDJkd-0007VH-0f; Sat, 01 Jun 2024 08:06:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sDJkc-0001cs-NP; Sat, 01 Jun 2024 08:06:06 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sDJkc-0003iv-Mz; Sat, 01 Jun 2024 08:06:06 +0000
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
	bh=5Vmaa6P2EQZyCfqspKlpr90vNXQY005QH1jbiuhLMJk=; b=JGAJ1odO8PrrTliewuX1O5Jfbn
	OVV3LKZfqIewRwwzSY0vWKT9ir2Xb9I4AOBxTSlBCa2MiqxhITBFCe8RCVOZTEqn0CWAH0XxQogPg
	ne2Sgk45J0vvUJ53+MXygNdkQobCMKvGAI+Mt/doKlKX9EACsKJ1/8pYI162BrPsM7Is=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186219-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186219: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=7339bfeffa3fa30b18dce86409c0112039bacec5
X-Osstest-Versions-That:
    ovmf=3b36aa96de1d5f7a4660bec5c0cbad2616183dd6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 01 Jun 2024 08:06:06 +0000

flight 186219 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186219/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7339bfeffa3fa30b18dce86409c0112039bacec5
baseline version:
 ovmf                 3b36aa96de1d5f7a4660bec5c0cbad2616183dd6

Last test of basis   186211  2024-05-31 16:14:27 Z    0 days
Testing same since   186219  2024-06-01 06:14:48 Z    0 days    1 attempts

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
   3b36aa96de..7339bfeffa  7339bfeffa3fa30b18dce86409c0112039bacec5 -> xen-tested-master

