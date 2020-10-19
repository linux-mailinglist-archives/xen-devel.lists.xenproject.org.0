Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E335292CC2
	for <lists+xen-devel@lfdr.de>; Mon, 19 Oct 2020 19:28:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8789.23616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUYwG-0002pq-HZ; Mon, 19 Oct 2020 17:27:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8789.23616; Mon, 19 Oct 2020 17:27:16 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUYwG-0002pV-Dy; Mon, 19 Oct 2020 17:27:16 +0000
Received: by outflank-mailman (input) for mailman id 8789;
 Mon, 19 Oct 2020 17:27:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zzxy=D2=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kUYwE-0002op-P3
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 17:27:14 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ec2c5f9b-f9ec-4f54-8d98-6bbd2c6c9d2d;
 Mon, 19 Oct 2020 17:27:08 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kUYw8-00083h-16; Mon, 19 Oct 2020 17:27:08 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kUYw7-00053z-Pn; Mon, 19 Oct 2020 17:27:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kUYw7-0001d5-PJ; Mon, 19 Oct 2020 17:27:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=zzxy=D2=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kUYwE-0002op-P3
	for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 17:27:14 +0000
X-Inumbo-ID: ec2c5f9b-f9ec-4f54-8d98-6bbd2c6c9d2d
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ec2c5f9b-f9ec-4f54-8d98-6bbd2c6c9d2d;
	Mon, 19 Oct 2020 17:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=igO872ibP5RL7m8HgLxKbH4dV3O/7rLzrSkI9SXLwmQ=; b=ow3xsprCmUvSlYgvnkKL5bXkaA
	hjTPwALQ4SJMNuhInGlZme0xh0Y0R7LgFTopHM2aVfbtzrRCMwN2N7agomm2zrvDp/n8Bv6NQQMZQ
	zmB4rQSKV2q+oUIoiKs1OF+d05OkqN6P+Ob9bi+QcZHh7mCb5AhfqJJGOks+Qf5GKvDQ=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kUYw8-00083h-16; Mon, 19 Oct 2020 17:27:08 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kUYw7-00053z-Pn; Mon, 19 Oct 2020 17:27:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kUYw7-0001d5-PJ; Mon, 19 Oct 2020 17:27:07 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-155976-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 155976: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=92e9c44f205a876556abe1a1addea5c40e4f3ccf
X-Osstest-Versions-That:
    ovmf=709b163940c55604b983400eb49dad144a2aa091
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 19 Oct 2020 17:27:07 +0000

flight 155976 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/155976/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 92e9c44f205a876556abe1a1addea5c40e4f3ccf
baseline version:
 ovmf                 709b163940c55604b983400eb49dad144a2aa091

Last test of basis   155969  2020-10-18 20:39:43 Z    0 days
Testing same since   155976  2020-10-19 08:40:33 Z    0 days    1 attempts

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
   709b163940..92e9c44f20  92e9c44f205a876556abe1a1addea5c40e4f3ccf -> xen-tested-master

