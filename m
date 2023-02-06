Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1A668C2C1
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 17:14:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490604.759385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP48E-0004Sj-DS; Mon, 06 Feb 2023 16:14:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490604.759385; Mon, 06 Feb 2023 16:14:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP48E-0004Pv-AL; Mon, 06 Feb 2023 16:14:14 +0000
Received: by outflank-mailman (input) for mailman id 490604;
 Mon, 06 Feb 2023 16:14:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pP48C-0004Pj-PV; Mon, 06 Feb 2023 16:14:12 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pP48C-0004a4-Od; Mon, 06 Feb 2023 16:14:12 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pP48C-0005GO-Ih; Mon, 06 Feb 2023 16:14:12 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pP48C-0007aB-I9; Mon, 06 Feb 2023 16:14:12 +0000
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
	bh=qzuJ9PLNitvo4DnTrOsEjNoP4oSCuqZ7BJqH7hfarfI=; b=xjqc+p2l2+vuz7ZCrqteVyLNRh
	ei9RYQc8DE1HBF2LBBzJ6PG5b+CkzfdeMyMRF19ZC9uwRpiNxTw1pabgCllyjeGpBfoIvnoSllnAi
	JZ4uhorvQaNFcCl8fO0bgm1+9DMZ48z8P3ZJ9Udr0JvudV8wb4tz0mZaKqxhpJfkSsn0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-176422-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 176422: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b98e2113b53fa9c7474a820bcd94fffb352acdf6
X-Osstest-Versions-That:
    ovmf=9d669016d968b0f3e17ce7df16ae51d85b0adfcf
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 06 Feb 2023 16:14:12 +0000

flight 176422 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/176422/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b98e2113b53fa9c7474a820bcd94fffb352acdf6
baseline version:
 ovmf                 9d669016d968b0f3e17ce7df16ae51d85b0adfcf

Last test of basis   176370  2023-02-04 15:12:29 Z    2 days
Testing same since   176422  2023-02-06 14:13:24 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Pierre Gondois <pierre.gondois@arm.com>
  Sami Mujawar <sami.mujawar@arm.com>
  Sudeep Holla <sudeep.holla@arm.com>

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
   9d669016d9..b98e2113b5  b98e2113b53fa9c7474a820bcd94fffb352acdf6 -> xen-tested-master

