Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 280C6640E66
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 20:25:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.452236.710062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1BeK-00019c-L0; Fri, 02 Dec 2022 19:24:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 452236.710062; Fri, 02 Dec 2022 19:24:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1BeK-000168-I2; Fri, 02 Dec 2022 19:24:40 +0000
Received: by outflank-mailman (input) for mailman id 452236;
 Fri, 02 Dec 2022 19:24:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p1BeI-00015c-Ni; Fri, 02 Dec 2022 19:24:38 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p1BeI-0002yt-KX; Fri, 02 Dec 2022 19:24:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p1BeI-0001YE-4n; Fri, 02 Dec 2022 19:24:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p1BeI-0001Yy-4H; Fri, 02 Dec 2022 19:24:38 +0000
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
	bh=IHS2Tm1esh1IWEAj8zvs9wt7QL72jhjBquDbFwZO3Jk=; b=a5PQS4k25+LpQ0Xjz+/so2zg1i
	a10wZiRRwOjNGzDEKxk4Fbxw7vaBN1iXQj4zdr69trTlX/WtlVM+vVn8hW+8BNXJyfqaR71LpSgMe
	iap6rQPwnCx8zBnPhg8SgJVM+ozoA1J9ghgW0Gs9pZ4ycb8XbCaSDUArU94+BEFpZBrY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175026-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175026: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=5d5be45bd11117c1e479863125e7d772e54772c9
X-Osstest-Versions-That:
    ovmf=47d988387efc8b45561f542f7a8e5b6a43979a8c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 02 Dec 2022 19:24:38 +0000

flight 175026 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175026/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 5d5be45bd11117c1e479863125e7d772e54772c9
baseline version:
 ovmf                 47d988387efc8b45561f542f7a8e5b6a43979a8c

Last test of basis   175017  2022-12-02 01:10:50 Z    0 days
Testing same since   175026  2022-12-02 14:40:46 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Zhihao Li <zhihao.li@intel.com>

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
   47d988387e..5d5be45bd1  5d5be45bd11117c1e479863125e7d772e54772c9 -> xen-tested-master

