Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE16D974BB1
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 09:44:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796264.1205786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soI1C-0003gu-JJ; Wed, 11 Sep 2024 07:44:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796264.1205786; Wed, 11 Sep 2024 07:44:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soI1C-0003fM-GT; Wed, 11 Sep 2024 07:44:02 +0000
Received: by outflank-mailman (input) for mailman id 796264;
 Wed, 11 Sep 2024 07:44:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1soI1A-0003fC-Vm; Wed, 11 Sep 2024 07:44:00 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1soI1A-0004U0-R3; Wed, 11 Sep 2024 07:44:00 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1soI1A-0001YM-D1; Wed, 11 Sep 2024 07:44:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1soI1A-0000kn-CR; Wed, 11 Sep 2024 07:44:00 +0000
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
	bh=5uSuy6jBwWr7k0EsFkQHdwoFv7rlDn82evBpK6XrxBs=; b=arTI56Q5BTVzX6t/yzYnJQbkEM
	6VgYctSLSt3HsdvVQL4Hozbuxkc9fEAeD+UA1t+85XmI4TFql6MDTEYpIK3rR+Enk/usL6ugGf4ft
	CsVKyPJPPKYtVBE5QIevA+mGvmupeicHOiP5RrhjTMMnkE2AvjZflyyutP377v/1jCQg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187654-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187654: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=14c9ba1a2ca64137de148968823dc20988dcaa4c
X-Osstest-Versions-That:
    ovmf=9a4088777fbe7941664ad9bb2bd78446d223cbf9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 11 Sep 2024 07:44:00 +0000

flight 187654 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187654/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 14c9ba1a2ca64137de148968823dc20988dcaa4c
baseline version:
 ovmf                 9a4088777fbe7941664ad9bb2bd78446d223cbf9

Last test of basis   187652  2024-09-11 04:00:38 Z    0 days
Testing same since   187654  2024-09-11 06:13:23 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
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
   9a4088777f..14c9ba1a2c  14c9ba1a2ca64137de148968823dc20988dcaa4c -> xen-tested-master

