Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4784B0438
	for <lists+xen-devel@lfdr.de>; Thu, 10 Feb 2022 05:08:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269574.463664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nI0kI-0003jY-RF; Thu, 10 Feb 2022 04:07:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269574.463664; Thu, 10 Feb 2022 04:07:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nI0kI-0003gu-O7; Thu, 10 Feb 2022 04:07:50 +0000
Received: by outflank-mailman (input) for mailman id 269574;
 Thu, 10 Feb 2022 04:07:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nI0kH-0003gk-GD; Thu, 10 Feb 2022 04:07:49 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nI0kH-00082o-Ds; Thu, 10 Feb 2022 04:07:49 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nI0kG-0004Sh-Vo; Thu, 10 Feb 2022 04:07:49 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nI0kG-0005el-VN; Thu, 10 Feb 2022 04:07:48 +0000
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
	bh=fFTzMD1bsqIuDEGyJ9OFqFDZ4WjvX1J9sFRCQdWRf+I=; b=5lW2P3xffJr2RPymqkBbgxFVFn
	RwmvKKO2WWgKlVPxQmgGfdiIWs38zyUnCYk+V4R0s/H+OwhuQk81iasCIGghNzcHpkveJAmZdrBjq
	nErPGYCb8DRsYkUNbOj5mP08M0iRhws0VpJmNdYru/v26Z8rIllYY/N9+xHXF2rQtpv4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-168074-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 168074: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=c9b7c6e0cc7da76b74bcdd8c90cef956d5ae971c
X-Osstest-Versions-That:
    ovmf=b360b0b589697da267f5d3a553e65635b91ebae2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 10 Feb 2022 04:07:48 +0000

flight 168074 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/168074/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 c9b7c6e0cc7da76b74bcdd8c90cef956d5ae971c
baseline version:
 ovmf                 b360b0b589697da267f5d3a553e65635b91ebae2

Last test of basis   168048  2022-02-07 17:10:21 Z    2 days
Testing same since   168074  2022-02-10 02:10:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Rebecca Cran <quic_rcran@quicinc.com>

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
   b360b0b589..c9b7c6e0cc  c9b7c6e0cc7da76b74bcdd8c90cef956d5ae971c -> xen-tested-master

