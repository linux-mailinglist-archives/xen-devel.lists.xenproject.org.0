Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B5A293434
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 07:14:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8913.23981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUjxD-0000Rt-Jk; Tue, 20 Oct 2020 05:12:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8913.23981; Tue, 20 Oct 2020 05:12:59 +0000
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
	id 1kUjxD-0000RU-GN; Tue, 20 Oct 2020 05:12:59 +0000
Received: by outflank-mailman (input) for mailman id 8913;
 Tue, 20 Oct 2020 05:12:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Or1=D3=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kUjxB-0000RP-Rj
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 05:12:57 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0885c0c8-008e-41b5-9be4-cb8589989421;
 Tue, 20 Oct 2020 05:12:56 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kUjxA-0000aA-5b; Tue, 20 Oct 2020 05:12:56 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kUjx9-0004oI-UQ; Tue, 20 Oct 2020 05:12:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kUjx9-0002X0-Tu; Tue, 20 Oct 2020 05:12:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=3Or1=D3=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kUjxB-0000RP-Rj
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 05:12:57 +0000
X-Inumbo-ID: 0885c0c8-008e-41b5-9be4-cb8589989421
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0885c0c8-008e-41b5-9be4-cb8589989421;
	Tue, 20 Oct 2020 05:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=KHa6Ra4k2kt6uUrN9IdVgUiT9len4dtoB2ieXyTscRA=; b=xYT1gOsXjvxPz0bduXT9/szuHp
	DYf0jloe/98LrhzZiqBTQKGB520j83tyTCPpIT9gLYvUDybxgRE3AJBqKdySNpLuaZUkdQeCHZiK7
	CP7z+0ceKhYyAcO7kv0TETWNKNAMyatNe/t2LGe1vY80fn3PegRG2ZNQhrhDxuvMlvyM=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kUjxA-0000aA-5b; Tue, 20 Oct 2020 05:12:56 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kUjx9-0004oI-UQ; Tue, 20 Oct 2020 05:12:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kUjx9-0002X0-Tu; Tue, 20 Oct 2020 05:12:55 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156010-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 156010: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=29d14d3a30fdfbe017d39b759423832054280f10
X-Osstest-Versions-That:
    ovmf=93edd1887e34c3959ce927da1a22e8c54ce18a83
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 20 Oct 2020 05:12:55 +0000

flight 156010 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156010/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 29d14d3a30fdfbe017d39b759423832054280f10
baseline version:
 ovmf                 93edd1887e34c3959ce927da1a22e8c54ce18a83

Last test of basis   155998  2020-10-19 22:09:56 Z    0 days
Testing same since   156010  2020-10-20 03:31:16 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  fengyunhua <fengyunhua@byosoft.com.cn>
  Yunhua Feng <fengyunhua@byosoft.com.cn>

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
   93edd1887e..29d14d3a30  29d14d3a30fdfbe017d39b759423832054280f10 -> xen-tested-master

