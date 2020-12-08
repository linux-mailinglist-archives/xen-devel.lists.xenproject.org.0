Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E24502D3309
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 21:15:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47869.84709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmjNw-0007rT-TS; Tue, 08 Dec 2020 20:14:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47869.84709; Tue, 08 Dec 2020 20:14:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmjNw-0007qz-Oh; Tue, 08 Dec 2020 20:14:56 +0000
Received: by outflank-mailman (input) for mailman id 47869;
 Tue, 08 Dec 2020 20:14:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kmjNv-0007qr-3g; Tue, 08 Dec 2020 20:14:55 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kmjNu-0008PW-RG; Tue, 08 Dec 2020 20:14:54 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kmjNu-0007DH-HI; Tue, 08 Dec 2020 20:14:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kmjNu-0007JP-Gr; Tue, 08 Dec 2020 20:14:54 +0000
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
	bh=a3hrlg0GEMFEtCf3m1cKBcHy9JRratvJNSGl5nU98L0=; b=qebYmGVdXYkYm5ou+JytIpATtp
	FG1PIiaTBKZP3JL3MpVoUfll9t2+UiYBOiAs24TTrtvaxC7YY3zWGUAqx8MWklJCWD6tFL8q3OL5O
	MQzCS1BrXG3yXMIEcZr1hY0sEwpa9y8fN1NPBKtdqmWPX7P/V44om3CqSpTYS8sjozlU=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-157323-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 157323: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=8e4cb8fbceb84b66b3b2fc45b9e93d70f732e970
X-Osstest-Versions-That:
    ovmf=4b69fab6e20a98f56acd3c717bd53812950fe5b5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 08 Dec 2020 20:14:54 +0000

flight 157323 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/157323/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 8e4cb8fbceb84b66b3b2fc45b9e93d70f732e970
baseline version:
 ovmf                 4b69fab6e20a98f56acd3c717bd53812950fe5b5

Last test of basis   157255  2020-12-07 08:39:47 Z    1 days
Testing same since   157323  2020-12-08 14:10:34 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Wenyi Xie <xiewenyi2@huawei.com>
  wenyi,xie via groups.io <xiewenyi2=huawei.com@groups.io>

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
   4b69fab6e2..8e4cb8fbce  8e4cb8fbceb84b66b3b2fc45b9e93d70f732e970 -> xen-tested-master

