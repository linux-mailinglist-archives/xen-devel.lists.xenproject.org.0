Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11779978A3F
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 22:53:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798476.1208702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1spDHI-0004a6-R4; Fri, 13 Sep 2024 20:52:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798476.1208702; Fri, 13 Sep 2024 20:52:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1spDHI-0004Xd-Nb; Fri, 13 Sep 2024 20:52:28 +0000
Received: by outflank-mailman (input) for mailman id 798476;
 Fri, 13 Sep 2024 20:52:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1spDHH-0004XT-Ha; Fri, 13 Sep 2024 20:52:27 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1spDHH-000715-Bu; Fri, 13 Sep 2024 20:52:27 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1spDHH-00042D-11; Fri, 13 Sep 2024 20:52:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1spDHH-0000HT-0a; Fri, 13 Sep 2024 20:52:27 +0000
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
	bh=4+QSYLdWLytWEN7Qbwk8GbHnNNaQzOVZ8vfhSk+f3Ek=; b=H73wDHHebPZTDod+2IQ4Y12yDl
	L9UNRDW6qCBMdzMMixpKXwB+55dbaIUDr9YOuaooBmVHUA7SntnR3jwlAtUsIug25pPr8FvaSwNG3
	lLEoIHgiapx1faJsLjRT1o0yYMx3HLsbY9kbbkXOUeVNzUd432MbAV695sS74o8G2PRY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187697-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187697: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ec18fa81d311663e24e9b9ad61b90b38862a1ea8
X-Osstest-Versions-That:
    ovmf=262ab6259f30203306d8a94de530d08998dab121
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 13 Sep 2024 20:52:27 +0000

flight 187697 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187697/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ec18fa81d311663e24e9b9ad61b90b38862a1ea8
baseline version:
 ovmf                 262ab6259f30203306d8a94de530d08998dab121

Last test of basis   187694  2024-09-13 17:43:26 Z    0 days
Testing same since   187697  2024-09-13 19:15:09 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ceping Sun <cepingx.sun@intel.com>

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
   262ab6259f..ec18fa81d3  ec18fa81d311663e24e9b9ad61b90b38862a1ea8 -> xen-tested-master

