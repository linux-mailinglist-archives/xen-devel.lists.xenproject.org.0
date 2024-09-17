Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E289397B369
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2024 19:15:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800064.1210000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqbmR-0003aC-Hw; Tue, 17 Sep 2024 17:14:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800064.1210000; Tue, 17 Sep 2024 17:14:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqbmR-0003Xv-EW; Tue, 17 Sep 2024 17:14:23 +0000
Received: by outflank-mailman (input) for mailman id 800064;
 Tue, 17 Sep 2024 17:14:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sqbmP-0003Xl-FQ; Tue, 17 Sep 2024 17:14:21 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sqbmP-0003gz-3v; Tue, 17 Sep 2024 17:14:21 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sqbmO-0007aT-JY; Tue, 17 Sep 2024 17:14:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sqbmO-0002JJ-J2; Tue, 17 Sep 2024 17:14:20 +0000
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
	bh=1Anf4V1R8BkEjJdSJ4ancseato1EjT/1+rpShPiAYB8=; b=dBq+GlPpMV+qDDFbTvH7vr38ep
	SzOjx9SXT63BXbNlliIBxL3yjynywpAUCfgY8AG86yjyU3bOQiw8sfIxKHAJsmMUOpXiiVlB5Cx1o
	mXzrliZ5k3+lpttHEZ2VolJtwkB8Eq8kYTlqLFVmTUzI4eX6sZMPRkIcfiw3shQAp3cE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187732-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187732: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b0d1cb59c78e5ecad8988c8114982c93e846f361
X-Osstest-Versions-That:
    ovmf=670e263419eb875fd8dce0c8d18dd3ab02b83ba0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 17 Sep 2024 17:14:20 +0000

flight 187732 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187732/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b0d1cb59c78e5ecad8988c8114982c93e846f361
baseline version:
 ovmf                 670e263419eb875fd8dce0c8d18dd3ab02b83ba0

Last test of basis   187722  2024-09-16 16:43:13 Z    1 days
Testing same since   187732  2024-09-17 15:43:39 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Phil Noh <Phil.Noh@amd.com>

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
   670e263419..b0d1cb59c7  b0d1cb59c78e5ecad8988c8114982c93e846f361 -> xen-tested-master

