Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D13B5744D97
	for <lists+xen-devel@lfdr.de>; Sun,  2 Jul 2023 14:35:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557971.871708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFwI6-0003RF-JN; Sun, 02 Jul 2023 12:34:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557971.871708; Sun, 02 Jul 2023 12:34:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFwI6-0003OB-GT; Sun, 02 Jul 2023 12:34:58 +0000
Received: by outflank-mailman (input) for mailman id 557971;
 Sun, 02 Jul 2023 12:34:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qFwI4-0003O1-OM; Sun, 02 Jul 2023 12:34:56 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qFwI4-0005CK-E1; Sun, 02 Jul 2023 12:34:56 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qFwI3-0002sg-UL; Sun, 02 Jul 2023 12:34:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qFwI3-0007Tb-To; Sun, 02 Jul 2023 12:34:55 +0000
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
	bh=ynqZEECCfEvPX2FnutKaC9TlrmAHQDTBXdKtCXABFzo=; b=uwinmXfXS76dQAT9MdSWjy/2Lu
	h5GLg9SzvfExGLXGapIS76CxRzvJDwr5mKMHhTOE1SaDQ1S+wjZ3g5DEBCCupYOEKY1q4PYL30XJ4
	XdOAp/FXybSb9Va7DZwd9cQrXE2S+3v9QpZ/3emDWWUPkQ7nYj9zZFJZDaMMYqPSCTwc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181680-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181680: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ad7d3ace1ad4d7350d1e1304fab86dffd0f3fd11
X-Osstest-Versions-That:
    ovmf=5a13f5c2fa5ada2eb2fcb961aa3745fd236620bd
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 02 Jul 2023 12:34:55 +0000

flight 181680 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181680/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ad7d3ace1ad4d7350d1e1304fab86dffd0f3fd11
baseline version:
 ovmf                 5a13f5c2fa5ada2eb2fcb961aa3745fd236620bd

Last test of basis   181659  2023-06-30 16:42:33 Z    1 days
Testing same since   181680  2023-07-02 10:43:52 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Tuan Phan <tphan@ventanamicro.com>

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
   5a13f5c2fa..ad7d3ace1a  ad7d3ace1ad4d7350d1e1304fab86dffd0f3fd11 -> xen-tested-master

