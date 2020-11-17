Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C97D52B5C30
	for <lists+xen-devel@lfdr.de>; Tue, 17 Nov 2020 10:51:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.28857.58002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kexdl-0006iU-AK; Tue, 17 Nov 2020 09:51:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 28857.58002; Tue, 17 Nov 2020 09:51:09 +0000
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
	id 1kexdl-0006i5-7M; Tue, 17 Nov 2020 09:51:09 +0000
Received: by outflank-mailman (input) for mailman id 28857;
 Tue, 17 Nov 2020 09:51:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g2yZ=EX=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kexdi-0006hz-WE
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 09:51:07 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d0b0ef58-6448-4dbc-87a6-741c930d1eeb;
 Tue, 17 Nov 2020 09:51:03 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kexdf-0001sX-9t; Tue, 17 Nov 2020 09:51:03 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kexde-00034B-Vd; Tue, 17 Nov 2020 09:51:03 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kexde-00080w-V9; Tue, 17 Nov 2020 09:51:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=g2yZ=EX=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kexdi-0006hz-WE
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 09:51:07 +0000
X-Inumbo-ID: d0b0ef58-6448-4dbc-87a6-741c930d1eeb
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d0b0ef58-6448-4dbc-87a6-741c930d1eeb;
	Tue, 17 Nov 2020 09:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=bLghYp9rRwW0cx2rwSV9yQNI5IbKn7WHXKROfQz8I+k=; b=NVXrgAnEa8lYM1hry5FD6WR9zl
	xgpS9+7dp4JA1XMIBkWDnG8KwV/U6qKc/CM3IzRBOT+0HLn6n+/xGwkYjgcJ6aVhv51X8J75DSA7+
	zDq7Z/F+BCq3UqPRysGOzW000LajabYk43oxTwt+aBl23KdJlArJmSuaUWJkgjhXks6M=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kexdf-0001sX-9t; Tue, 17 Nov 2020 09:51:03 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kexde-00034B-Vd; Tue, 17 Nov 2020 09:51:03 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kexde-00080w-V9; Tue, 17 Nov 2020 09:51:02 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156829-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 156829: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=29d59baa3907277782e9f26ecaa99704ff57e3f1
X-Osstest-Versions-That:
    ovmf=124b3f9289f11479d9f042ea6e39bea2b1d5cee3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 17 Nov 2020 09:51:02 +0000

flight 156829 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156829/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 29d59baa3907277782e9f26ecaa99704ff57e3f1
baseline version:
 ovmf                 124b3f9289f11479d9f042ea6e39bea2b1d5cee3

Last test of basis   156826  2020-11-17 01:10:39 Z    0 days
Testing same since   156829  2020-11-17 04:47:02 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael D Kinney <michael.d.kinney@intel.com>

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
   124b3f9289..29d59baa39  29d59baa3907277782e9f26ecaa99704ff57e3f1 -> xen-tested-master

