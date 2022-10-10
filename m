Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A2C5F9720
	for <lists+xen-devel@lfdr.de>; Mon, 10 Oct 2022 05:01:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.419096.663813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohj2A-0000k2-Oc; Mon, 10 Oct 2022 03:00:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 419096.663813; Mon, 10 Oct 2022 03:00:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohj2A-0000iI-Lp; Mon, 10 Oct 2022 03:00:50 +0000
Received: by outflank-mailman (input) for mailman id 419096;
 Mon, 10 Oct 2022 03:00:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ohj29-0000i5-Qi; Mon, 10 Oct 2022 03:00:49 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ohj29-0001nJ-PF; Mon, 10 Oct 2022 03:00:49 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ohj29-0004pb-7k; Mon, 10 Oct 2022 03:00:49 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ohj29-0004Wz-7I; Mon, 10 Oct 2022 03:00:49 +0000
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
	bh=B/FeNLYV9Z8yyP4+S7u9wNdmLfnN8ymuJ9bQCn709Ws=; b=Lbi1bSYHe+4suJQhZizO5e5Atc
	+n05mxDMhHIbf1332a5WNB99VB7Km00+FT+lYGMKKqA3Tnfqgu2UjQDfBXB3zqL/EK6DX71KS/X+N
	3xJHoStCFdd8pPjze4JbAGznEq5o6ffpHAAgmCeC0u7ulWTQzyAau+rs4xJu0izWEsyY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173481-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 173481: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=3c9e2f239a38590b4e3a8c1ec2304227f2af0103
X-Osstest-Versions-That:
    ovmf=de103f1981cfca90dd19296d4b20449a2b93dc26
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 10 Oct 2022 03:00:49 +0000

flight 173481 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/173481/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 3c9e2f239a38590b4e3a8c1ec2304227f2af0103
baseline version:
 ovmf                 de103f1981cfca90dd19296d4b20449a2b93dc26

Last test of basis   173472  2022-10-08 11:13:08 Z    1 days
Testing same since   173481  2022-10-10 01:11:51 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Yuan Yu <yuanyu@google.com>

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
   de103f1981..3c9e2f239a  3c9e2f239a38590b4e3a8c1ec2304227f2af0103 -> xen-tested-master

