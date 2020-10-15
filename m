Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E1028ED75
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 09:12:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7114.18653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSxRD-0003Cw-H5; Thu, 15 Oct 2020 07:12:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7114.18653; Thu, 15 Oct 2020 07:12:35 +0000
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
	id 1kSxRD-0003CW-Db; Thu, 15 Oct 2020 07:12:35 +0000
Received: by outflank-mailman (input) for mailman id 7114;
 Thu, 15 Oct 2020 07:12:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pHSr=DW=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kSxRB-0003CR-Qg
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 07:12:33 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ecda4914-9bb4-4804-a9e5-9139b394dcb4;
 Thu, 15 Oct 2020 07:12:32 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kSxRA-0004rP-6B; Thu, 15 Oct 2020 07:12:32 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kSxR9-0008Lr-Tq; Thu, 15 Oct 2020 07:12:31 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kSxR9-0006Jf-TQ; Thu, 15 Oct 2020 07:12:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pHSr=DW=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kSxRB-0003CR-Qg
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 07:12:33 +0000
X-Inumbo-ID: ecda4914-9bb4-4804-a9e5-9139b394dcb4
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ecda4914-9bb4-4804-a9e5-9139b394dcb4;
	Thu, 15 Oct 2020 07:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=c3agQx5XBP8e0sESEYnrlwgG7djgwa5dbMyV5I9TuYQ=; b=RkTnK1yF+IHYtLMf8QWSPtuY5v
	n7XS6KdhXZw9e8U/FRJwt6CxtCkZ2DnDg3ZbNcfCknz/vAbOvL8KRAjg0yWRwRLtavZYtZA7cZI1i
	ZUTOE1DO7NiWBTE5HWQKLNaMvFu1JMIOZIp8KQnyn9HNW/CzL1T47oSLyELLlYKO8daQ=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kSxRA-0004rP-6B; Thu, 15 Oct 2020 07:12:32 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kSxR9-0008Lr-Tq; Thu, 15 Oct 2020 07:12:31 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kSxR9-0006Jf-TQ; Thu, 15 Oct 2020 07:12:31 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-155825-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 155825: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b9b7406c43e9d29bde3e9679c1b039cb91109097
X-Osstest-Versions-That:
    ovmf=5d0a827122cccd1f884faf75b2a065d88a58bce1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 15 Oct 2020 07:12:31 +0000

flight 155825 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/155825/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b9b7406c43e9d29bde3e9679c1b039cb91109097
baseline version:
 ovmf                 5d0a827122cccd1f884faf75b2a065d88a58bce1

Last test of basis   155801  2020-10-14 09:11:09 Z    0 days
Testing same since   155825  2020-10-15 01:10:19 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@hpe.com>
  Fan Wang <fan.wang@intel.com>
  Jiaxin Wu <jiaxin.wu@intel.com>
  Siyuan Fu <siyuan.fu@intel.com>

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
   5d0a827122..b9b7406c43  b9b7406c43e9d29bde3e9679c1b039cb91109097 -> xen-tested-master

