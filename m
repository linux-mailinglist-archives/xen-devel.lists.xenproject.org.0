Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8261362D1BD
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 04:36:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444500.699793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovVh3-0001JM-Uw; Thu, 17 Nov 2022 03:36:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444500.699793; Thu, 17 Nov 2022 03:36:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovVh3-0001Gw-Ru; Thu, 17 Nov 2022 03:36:01 +0000
Received: by outflank-mailman (input) for mailman id 444500;
 Thu, 17 Nov 2022 03:36:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ovVh2-0001Gm-GW; Thu, 17 Nov 2022 03:36:00 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ovVh2-0005zh-Em; Thu, 17 Nov 2022 03:36:00 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ovVh1-0005Q4-VN; Thu, 17 Nov 2022 03:36:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ovVh1-0000J8-V2; Thu, 17 Nov 2022 03:35:59 +0000
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
	bh=Ldn0PscbxAtvAVl3TetJoE4feODR6bRMhxf0vBAND6c=; b=GqM04g/sNYsOD9GAkT4CW0eZZ+
	Z4L3PU0xqgJQUqQahc4m8volTNatMQiNy75gfiBAPAXcYi/+rBpeNS+UsnBwquGf9Qzu7/YW+e0iz
	D6dzIaQC+4TQLLQk54lxk5lTx9bSSiyLwj/9XVVxeguUvRqHEQu3w/5JsoafsJJ3PAzU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-174796-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 174796: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=fff6d81270b57ee786ea18ad74f43149b9f03494
X-Osstest-Versions-That:
    ovmf=93629f2c7cf05ebc0f458eacc42a33147096f9d1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 17 Nov 2022 03:35:59 +0000

flight 174796 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/174796/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 fff6d81270b57ee786ea18ad74f43149b9f03494
baseline version:
 ovmf                 93629f2c7cf05ebc0f458eacc42a33147096f9d1

Last test of basis   174785  2022-11-16 01:55:55 Z    1 days
Testing same since   174796  2022-11-17 01:55:26 Z    0 days    1 attempts

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
   93629f2c7c..fff6d81270  fff6d81270b57ee786ea18ad74f43149b9f03494 -> xen-tested-master

