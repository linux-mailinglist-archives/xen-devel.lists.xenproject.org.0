Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5B89775DF
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 02:02:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797870.1207940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sotk1-0003Lh-NR; Fri, 13 Sep 2024 00:00:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797870.1207940; Fri, 13 Sep 2024 00:00:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sotk1-0003Ix-Kr; Fri, 13 Sep 2024 00:00:49 +0000
Received: by outflank-mailman (input) for mailman id 797870;
 Fri, 13 Sep 2024 00:00:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sotk0-0003In-6e; Fri, 13 Sep 2024 00:00:48 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sotk0-0000s3-52; Fri, 13 Sep 2024 00:00:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sotjz-0001Yp-Rr; Fri, 13 Sep 2024 00:00:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sotjz-0004Jr-RU; Fri, 13 Sep 2024 00:00:47 +0000
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
	bh=qBQyf/v7by6Uf+U1p2VtgJF1yiE9cJIWHQTxL/3aP6w=; b=xT97Ocbd/e2Jk0BnL7YTCM5XHH
	4xvA/iSSbwu6CONrQbTas2YQteCrYnWG7eqVhHWvxgMBK6yPIU8C5nS3GsE/YV3Svjcm4SdaMF64X
	/i0kd9SxpSu1xuHpIO4AsO2y7+3web/UjFizamq9diSJyLyU7zigL6YepiqkvIDpezGg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187683-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187683: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=bb403511d412959aaa3733a8235257190d63b3ad
X-Osstest-Versions-That:
    ovmf=8f74b95a21cf106fa4eb4932e22b404c57297ba2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 13 Sep 2024 00:00:47 +0000

flight 187683 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187683/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 bb403511d412959aaa3733a8235257190d63b3ad
baseline version:
 ovmf                 8f74b95a21cf106fa4eb4932e22b404c57297ba2

Last test of basis   187679  2024-09-12 19:43:14 Z    0 days
Testing same since   187683  2024-09-12 21:41:30 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Mike Beaton <mjsbeaton@gmail.com>

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
   8f74b95a21..bb403511d4  bb403511d412959aaa3733a8235257190d63b3ad -> xen-tested-master

