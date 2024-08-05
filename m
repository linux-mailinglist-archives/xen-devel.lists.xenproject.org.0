Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AB1948573
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 00:30:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772422.1182873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sb6DN-0000l4-C1; Mon, 05 Aug 2024 22:30:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772422.1182873; Mon, 05 Aug 2024 22:30:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sb6DN-0000gv-8Z; Mon, 05 Aug 2024 22:30:05 +0000
Received: by outflank-mailman (input) for mailman id 772422;
 Mon, 05 Aug 2024 22:30:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sb6DL-0000Ts-Vl; Mon, 05 Aug 2024 22:30:03 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sb6DL-0002tN-Tn; Mon, 05 Aug 2024 22:30:03 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sb6DL-0006ly-I7; Mon, 05 Aug 2024 22:30:03 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sb6DL-0001w7-Hh; Mon, 05 Aug 2024 22:30:03 +0000
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
	bh=cFniKeIaWOGzuCzHg8axo035b8vKO5zZShpg4MWPYrg=; b=F/yWQENkEVL6rcerb72NV0BLbb
	D1hmKOd0ys1U/X2NlPDJrAaTOEhMnYuRYOVSzXd61V2LlO5axOWTKmDmrurO8Ht7MoLRaoghiF8Zn
	PzTw4DKK55QtS9AnEdV+UJT66ccO5E1uHjpEK8rwmBnqpUOzKAh8tUq7kTbJ+xEJt0SA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187162-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187162: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=51ada84cd57c5ef6c75a72aeb002226cf9180b21
X-Osstest-Versions-That:
    ovmf=5d43165ff8596c2fa07b7d4de3c482d64338ca99
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 05 Aug 2024 22:30:03 +0000

flight 187162 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187162/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 51ada84cd57c5ef6c75a72aeb002226cf9180b21
baseline version:
 ovmf                 5d43165ff8596c2fa07b7d4de3c482d64338ca99

Last test of basis   187152  2024-08-05 08:15:15 Z    0 days
Testing same since   187162  2024-08-05 19:41:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael Kubacki <michael.kubacki@microsoft.com>

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
   5d43165ff8..51ada84cd5  51ada84cd57c5ef6c75a72aeb002226cf9180b21 -> xen-tested-master

