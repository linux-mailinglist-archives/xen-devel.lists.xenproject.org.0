Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D70960DACD
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 07:58:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430343.681926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onZPI-0002v8-8f; Wed, 26 Oct 2022 05:56:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430343.681926; Wed, 26 Oct 2022 05:56:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onZPI-0002sG-4R; Wed, 26 Oct 2022 05:56:52 +0000
Received: by outflank-mailman (input) for mailman id 430343;
 Wed, 26 Oct 2022 05:56:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1onZPH-0002s6-CQ; Wed, 26 Oct 2022 05:56:51 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1onZPH-0003qC-BX; Wed, 26 Oct 2022 05:56:51 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1onZPG-0004Li-Sy; Wed, 26 Oct 2022 05:56:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1onZPG-0001x1-SX; Wed, 26 Oct 2022 05:56:50 +0000
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
	bh=xkHFjw+PXOT7fKYJZcOuyyhcCxz7yaQyLQLzmKVLB2w=; b=nQQC9Ev0nFqyc4QVbN20qkkTpF
	JHTLLUGjgnseoGEnsf5MLSgaLFOB/tRiKBs+A1YcWlPmMc1xK6yClcLUPzF7X5yLMVf7lpdOtGzFI
	2c67mSYlf8RA4JGFaAlCyp1/s4OZZQONXENx4c0DpGyJPf6JIzWo+CKQHwP7enK3AWGQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-174432-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 174432: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=9e2c88b16ed3444ea9dfffb39a91d6c17071835d
X-Osstest-Versions-That:
    ovmf=26638d2aa399e436f47d629f877e581ed402020a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 26 Oct 2022 05:56:50 +0000

flight 174432 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/174432/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 9e2c88b16ed3444ea9dfffb39a91d6c17071835d
baseline version:
 ovmf                 26638d2aa399e436f47d629f877e581ed402020a

Last test of basis   174424  2022-10-26 00:12:08 Z    0 days
Testing same since   174432  2022-10-26 04:14:08 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@amd.com>
  Chao Li <lichao@loongson.cn>

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
   26638d2aa3..9e2c88b16e  9e2c88b16ed3444ea9dfffb39a91d6c17071835d -> xen-tested-master

