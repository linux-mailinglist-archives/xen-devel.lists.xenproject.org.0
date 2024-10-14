Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A845099D47D
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2024 18:19:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.818775.1232061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0NmS-0001MP-MF; Mon, 14 Oct 2024 16:18:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 818775.1232061; Mon, 14 Oct 2024 16:18:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0NmS-0001Ks-JE; Mon, 14 Oct 2024 16:18:48 +0000
Received: by outflank-mailman (input) for mailman id 818775;
 Mon, 14 Oct 2024 16:18:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t0NmR-0001Ki-93; Mon, 14 Oct 2024 16:18:47 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t0NmR-0007QS-2H; Mon, 14 Oct 2024 16:18:47 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t0NmQ-000239-K8; Mon, 14 Oct 2024 16:18:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1t0NmQ-0002H6-Jl; Mon, 14 Oct 2024 16:18:46 +0000
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
	bh=ZggE4JbgJYCEY19xeuxNvUjWv6/WhI2yfHcwzADbWes=; b=sUNuupZ8EyiOUh4KZyEweUpiOR
	xUyxqdUGAfDdPYme8g7/a35Mu+0NZKN+xb8LlXfQZgb1xSf2GuuLyUo/4lZhzGI/WA0VtSuC9n3Vn
	xYu2A4FZIbXT3ycC2PcK6RTpwLM+N+XEp2SRckFvAWhbl+jfXFWThWY2T4BQS37lFJOc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-188083-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 188083: tolerable FAIL - PUSHED
X-Osstest-Failures:
    ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:guest-localmigrate:fail:allowable
X-Osstest-Versions-This:
    ovmf=21767dcf4e04ade9e679f8562513da8ceedf19ec
X-Osstest-Versions-That:
    ovmf=fcd9570c8d8164b42f907137a3a6e78977cc860a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 14 Oct 2024 16:18:46 +0000

flight 188083 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/188083/

Failures :-/ but no regressions.

Regressions which are regarded as allowable (not blocking):
 test-amd64-amd64-xl-qemuu-ovmf-amd64 16 guest-localmigrate fail REGR. vs. 188065

version targeted for testing:
 ovmf                 21767dcf4e04ade9e679f8562513da8ceedf19ec
baseline version:
 ovmf                 fcd9570c8d8164b42f907137a3a6e78977cc860a

Last test of basis   188065  2024-10-12 09:13:32 Z    2 days
Testing same since   188083  2024-10-14 15:15:23 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Nhi Pham <nhi@os.amperecomputing.com>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         fail    


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
   fcd9570c8d..21767dcf4e  21767dcf4e04ade9e679f8562513da8ceedf19ec -> xen-tested-master

