Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C235649F699
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 10:45:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261911.453780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDNoL-000580-BX; Fri, 28 Jan 2022 09:44:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261911.453780; Fri, 28 Jan 2022 09:44:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDNoL-00055b-8M; Fri, 28 Jan 2022 09:44:53 +0000
Received: by outflank-mailman (input) for mailman id 261911;
 Fri, 28 Jan 2022 09:44:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nDNoJ-00055R-M9; Fri, 28 Jan 2022 09:44:51 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nDNoJ-0001Uf-Jk; Fri, 28 Jan 2022 09:44:51 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nDNoJ-0003fQ-2r; Fri, 28 Jan 2022 09:44:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nDNoJ-0001cj-2B; Fri, 28 Jan 2022 09:44:51 +0000
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
	bh=riBB/pUZrUDo9NO00s/DbyUn63NnHhzOcWAcvMJKqHU=; b=Z1fA45SNLcodAg5BKwNIa2Cqlv
	8errLxU/MnTU0YA80ZhDlnqn6KrFn8UI9l9AhM6QN3h6P5qkA9IoXfpdm+t35AxrbANvC9yph+/JV
	aJZ8J7Ex1EbQMF53eqxsJRG2ppdgyCPUrtgX8MZqX+ik6Eqp0XG4PAElohcNY13ZdwK4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-167929-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 167929: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=a867f3a7042ae0b4c1189bececbe72aa8a8a8e27
X-Osstest-Versions-That:
    ovmf=6777e673839a510aaa62a48514a4223da7d3bba2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 28 Jan 2022 09:44:51 +0000

flight 167929 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167929/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 a867f3a7042ae0b4c1189bececbe72aa8a8a8e27
baseline version:
 ovmf                 6777e673839a510aaa62a48514a4223da7d3bba2

Last test of basis   167919  2022-01-27 13:10:49 Z    0 days
Testing same since   167929  2022-01-28 02:41:45 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Liu, Zhiguang <Zhiguang.Liu@intel.com>
  Zhiguang Liu <zhiguang.liu@intel.com>

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
   6777e67383..a867f3a704  a867f3a7042ae0b4c1189bececbe72aa8a8a8e27 -> xen-tested-master

