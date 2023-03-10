Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB28D6B5005
	for <lists+xen-devel@lfdr.de>; Fri, 10 Mar 2023 19:23:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508564.783341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pahNZ-0006if-0y; Fri, 10 Mar 2023 18:22:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508564.783341; Fri, 10 Mar 2023 18:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pahNY-0006fn-TU; Fri, 10 Mar 2023 18:22:08 +0000
Received: by outflank-mailman (input) for mailman id 508564;
 Fri, 10 Mar 2023 18:22:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pahNX-0006fc-1w; Fri, 10 Mar 2023 18:22:07 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pahNX-0002tr-05; Fri, 10 Mar 2023 18:22:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pahNW-0006es-EJ; Fri, 10 Mar 2023 18:22:06 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pahNW-0001wx-Di; Fri, 10 Mar 2023 18:22:06 +0000
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
	bh=uHAnqG5q3CZaw/wbHccctVTMEiIe1QAOraH8+Sbt2qM=; b=o3qcYY9N7031s8H2kIMUaPPc9J
	NGM9tj0rHXduIC2IwB/+dFTxju8M42ole/AhZ/N6kEw5DoSoB/jQz4aZTocfP2QoRhcqnQU016hup
	VPISxGSFAEYNKMaJNfPLqP3Bwij1I0qg5/iJQ7hOasT+tPB9+elOYR61w2+BP9lapfQI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-179537-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 179537: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=9b94ebb0c826ad9a747f93ee351d5d076e920f6e
X-Osstest-Versions-That:
    ovmf=a4c9c2b0f00a8f950b3058d4e97534a2613ed8bf
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 10 Mar 2023 18:22:06 +0000

flight 179537 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/179537/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 9b94ebb0c826ad9a747f93ee351d5d076e920f6e
baseline version:
 ovmf                 a4c9c2b0f00a8f950b3058d4e97534a2613ed8bf

Last test of basis   179532  2023-03-10 09:10:48 Z    0 days
Testing same since   179537  2023-03-10 15:10:41 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Sami Mujawar <sami.mujawar@arm.com>

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
   a4c9c2b0f0..9b94ebb0c8  9b94ebb0c826ad9a747f93ee351d5d076e920f6e -> xen-tested-master

