Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 796F968165E
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 17:28:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487069.754549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMX0I-0001Hp-GY; Mon, 30 Jan 2023 16:27:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487069.754549; Mon, 30 Jan 2023 16:27:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMX0I-0001G6-Dl; Mon, 30 Jan 2023 16:27:34 +0000
Received: by outflank-mailman (input) for mailman id 487069;
 Mon, 30 Jan 2023 16:27:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pMX0H-0001Fw-05; Mon, 30 Jan 2023 16:27:33 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pMX0G-0006CQ-RV; Mon, 30 Jan 2023 16:27:32 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pMX0G-0001wm-Cb; Mon, 30 Jan 2023 16:27:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pMX0G-0006lO-C2; Mon, 30 Jan 2023 16:27:32 +0000
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
	bh=XBqWYK+2OeKht95q8+lEf3RZbknW/hO+ktmICoFNbRk=; b=4Sjljj84dnRnLSGkxEwKMDrEM8
	ZWzid6tOCBpqBzW7EnffwsX4HGDftA6U5dTOGz9Z82yqlkEoarFOmjSEMsEC/H6ARSzn3m6uvI7Z6
	czTI+Dmpjce2GFVLHK0dmOov0jHB2qlE+RrF4gvd+rh4zDVOliZVrgoKJjsRs/lb+O4Y=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-176280-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 176280: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=4b384c21ad02fbf5eda25a1516cc72fa66b150f6
X-Osstest-Versions-That:
    ovmf=bb1376254803bfdaa012c62f1cf6d6b26161cfe7
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 30 Jan 2023 16:27:32 +0000

flight 176280 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/176280/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 4b384c21ad02fbf5eda25a1516cc72fa66b150f6
baseline version:
 ovmf                 bb1376254803bfdaa012c62f1cf6d6b26161cfe7

Last test of basis   176278  2023-01-30 07:40:53 Z    0 days
Testing same since   176280  2023-01-30 14:12:12 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dionna Glaze <dionnaglaze@google.com>
  Dionna Glaze via groups.io <dionnaglaze=google.com@groups.io>

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
   bb13762548..4b384c21ad  4b384c21ad02fbf5eda25a1516cc72fa66b150f6 -> xen-tested-master

