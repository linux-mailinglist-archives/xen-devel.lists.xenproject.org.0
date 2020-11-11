Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 423332AF04C
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 13:12:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24689.52049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcoyU-0002qG-5B; Wed, 11 Nov 2020 12:11:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24689.52049; Wed, 11 Nov 2020 12:11:42 +0000
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
	id 1kcoyU-0002pr-1p; Wed, 11 Nov 2020 12:11:42 +0000
Received: by outflank-mailman (input) for mailman id 24689;
 Wed, 11 Nov 2020 12:11:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iq8f=ER=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kcoyS-0002pI-84
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 12:11:40 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8921d63d-99d5-457a-a797-23a592f214e0;
 Wed, 11 Nov 2020 12:11:32 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kcoyJ-00029N-Lh; Wed, 11 Nov 2020 12:11:31 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kcoyJ-0003DI-Co; Wed, 11 Nov 2020 12:11:31 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kcoyJ-0001Zh-CJ; Wed, 11 Nov 2020 12:11:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Iq8f=ER=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kcoyS-0002pI-84
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 12:11:40 +0000
X-Inumbo-ID: 8921d63d-99d5-457a-a797-23a592f214e0
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 8921d63d-99d5-457a-a797-23a592f214e0;
	Wed, 11 Nov 2020 12:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=dmwONrOnj5fYR3r9uev5iqDPzTK2VQfHMJO/Ndqn9i4=; b=5YRWyfCUbmZLPaqLvSQO/BA040
	Z1EhMMPRgZJtqJG4GYoLCIPN3dffKm7/nG5zps5ThnIZecXnm9g4x3t9GbfRsqj+jhpTvvcv+0TPn
	uoItgz7S3xek4zu95v2f+Dv2pLEq4301QY3Bf2t7MgCc+ZeYgy60XrwGKIc3KoT6Dw/U=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kcoyJ-00029N-Lh; Wed, 11 Nov 2020 12:11:31 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kcoyJ-0003DI-Co; Wed, 11 Nov 2020 12:11:31 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kcoyJ-0001Zh-CJ; Wed, 11 Nov 2020 12:11:31 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156632-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 156632: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=8c610e6075f2a200400970698a810a57ad49220e
X-Osstest-Versions-That:
    ovmf=0af7f8e6a9253960ba820cd6ddfd8c36543d30cb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 11 Nov 2020 12:11:31 +0000

flight 156632 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156632/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 8c610e6075f2a200400970698a810a57ad49220e
baseline version:
 ovmf                 0af7f8e6a9253960ba820cd6ddfd8c36543d30cb

Last test of basis   156606  2020-11-10 00:39:48 Z    1 days
Testing same since   156632  2020-11-10 17:53:05 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Liming Gao <gaoliming@byosoft.com.cn>
  Michael Kubacki <michael.kubacki@microsoft.com>
  Mingyue Liang <mingyuex.liang@intel.com>
  Yunhua Feng <fengyunhua@byosoft.com.cn>

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
   0af7f8e6a9..8c610e6075  8c610e6075f2a200400970698a810a57ad49220e -> xen-tested-master

