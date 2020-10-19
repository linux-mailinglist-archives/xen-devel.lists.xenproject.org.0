Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E175B2923C1
	for <lists+xen-devel@lfdr.de>; Mon, 19 Oct 2020 10:38:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8659.23171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUQgA-0004i6-Sq; Mon, 19 Oct 2020 08:38:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8659.23171; Mon, 19 Oct 2020 08:38:06 +0000
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
	id 1kUQgA-0004hh-Pb; Mon, 19 Oct 2020 08:38:06 +0000
Received: by outflank-mailman (input) for mailman id 8659;
 Mon, 19 Oct 2020 08:38:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zzxy=D2=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kUQg9-0004h8-JX
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 08:38:05 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b0e93bc-e5e3-4433-bea9-c146400dbc0c;
 Mon, 19 Oct 2020 08:37:58 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kUQg2-0004wY-0o; Mon, 19 Oct 2020 08:37:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kUQg1-0002aI-NO; Mon, 19 Oct 2020 08:37:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kUQg1-000554-Mt; Mon, 19 Oct 2020 08:37:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=zzxy=D2=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kUQg9-0004h8-JX
	for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 08:38:05 +0000
X-Inumbo-ID: 8b0e93bc-e5e3-4433-bea9-c146400dbc0c
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8b0e93bc-e5e3-4433-bea9-c146400dbc0c;
	Mon, 19 Oct 2020 08:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=QodAaPzjw7PTNAXYmza0/o943cAwCq7V7a0qdMMdLOI=; b=lKISZqEBIwPBthSn0XJfSBGyRI
	IFC3wbuJr78JuR/dogqYDYdR9ORgUa97o+gIgkSTe1SEtFX2C2FbGL8aX5VX+mSjunwfHIyrRIYva
	dNR5n0mEOyGQcwAuerfRjxknQnWfx/g1UKgz4pYKm/i+BaQN4CqgV/N8Hsg0yS8eSDS0=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kUQg2-0004wY-0o; Mon, 19 Oct 2020 08:37:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kUQg1-0002aI-NO; Mon, 19 Oct 2020 08:37:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kUQg1-000554-Mt; Mon, 19 Oct 2020 08:37:57 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-155969-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 155969: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=709b163940c55604b983400eb49dad144a2aa091
X-Osstest-Versions-That:
    ovmf=73e3cb6c7eea4f5db81c87574dcefe1282de4772
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 19 Oct 2020 08:37:57 +0000

flight 155969 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/155969/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 709b163940c55604b983400eb49dad144a2aa091
baseline version:
 ovmf                 73e3cb6c7eea4f5db81c87574dcefe1282de4772

Last test of basis   155942  2020-10-18 01:09:50 Z    1 days
Testing same since   155957  2020-10-18 11:07:14 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Terry Lee <terry.lee@hpe.com>
  Zhichao Gao <zhichao.gao@intel.com>

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
   73e3cb6c7e..709b163940  709b163940c55604b983400eb49dad144a2aa091 -> xen-tested-master

