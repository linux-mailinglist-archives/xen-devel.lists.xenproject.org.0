Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E392976715
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 12:57:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797285.1207192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sohW2-0001mg-5c; Thu, 12 Sep 2024 10:57:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797285.1207192; Thu, 12 Sep 2024 10:57:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sohW2-0001jw-2q; Thu, 12 Sep 2024 10:57:34 +0000
Received: by outflank-mailman (input) for mailman id 797285;
 Thu, 12 Sep 2024 10:57:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sohW1-0001jm-Eb; Thu, 12 Sep 2024 10:57:33 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sohW1-0002Yq-C7; Thu, 12 Sep 2024 10:57:33 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sohW0-0003Zi-UC; Thu, 12 Sep 2024 10:57:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sohW0-000677-Tl; Thu, 12 Sep 2024 10:57:32 +0000
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
	bh=R7j7XkE0S9QmWUsTND0fNhs08ztzMGzBJS/iWlR7/VQ=; b=xmdvHdcaHAzXXlEQlOeZPTa45n
	6wxgjYtd1Pv0x97qQlmP5mWqs1QNtFDws28W5iVTYfjRdg28xUZPQSC8C5PtxOASFMUO7bbME9sd7
	dI7hnHKwv1looCDdvTa8OrZgUYM6UjCmmDQ3ZrJI1VMr330EvwivtfZKtV4ZxV6er75w=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187672-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187672: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=1197fb3383ddbe53d764cb9b3583c1738ac62a18
X-Osstest-Versions-That:
    ovmf=babccb841dbb39de2b4485bdb63dcc5bb6122bd8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 12 Sep 2024 10:57:32 +0000

flight 187672 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187672/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 1197fb3383ddbe53d764cb9b3583c1738ac62a18
baseline version:
 ovmf                 babccb841dbb39de2b4485bdb63dcc5bb6122bd8

Last test of basis   187670  2024-09-12 06:41:28 Z    0 days
Testing same since   187672  2024-09-12 09:13:22 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Carsten Haitzler <carsten.haitzler@foss.arm.com>

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
   babccb841d..1197fb3383  1197fb3383ddbe53d764cb9b3583c1738ac62a18 -> xen-tested-master

