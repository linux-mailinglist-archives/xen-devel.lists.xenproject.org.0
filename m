Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD53E29811A
	for <lists+xen-devel@lfdr.de>; Sun, 25 Oct 2020 10:51:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.11792.31155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kWcfc-0002KM-2I; Sun, 25 Oct 2020 09:50:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11792.31155; Sun, 25 Oct 2020 09:50:36 +0000
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
	id 1kWcfb-0002Jx-VL; Sun, 25 Oct 2020 09:50:35 +0000
Received: by outflank-mailman (input) for mailman id 11792;
 Sun, 25 Oct 2020 09:50:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ryJk=EA=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kWcfa-0002JP-S9
 for xen-devel@lists.xenproject.org; Sun, 25 Oct 2020 09:50:34 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c0d787a2-9dcc-4f36-bda3-1279767484ba;
 Sun, 25 Oct 2020 09:50:28 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kWcfU-0005Ak-74; Sun, 25 Oct 2020 09:50:28 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kWcfT-0002es-VB; Sun, 25 Oct 2020 09:50:28 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kWcfT-0000CX-Uf; Sun, 25 Oct 2020 09:50:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ryJk=EA=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kWcfa-0002JP-S9
	for xen-devel@lists.xenproject.org; Sun, 25 Oct 2020 09:50:34 +0000
X-Inumbo-ID: c0d787a2-9dcc-4f36-bda3-1279767484ba
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c0d787a2-9dcc-4f36-bda3-1279767484ba;
	Sun, 25 Oct 2020 09:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=4ezHm1osa7cS3bnpu7U5iF7FGeieEOppDJmGECkT2lo=; b=K/agsyFzLtu5t+Q4CHOVYhjZZQ
	VrwicDvCuYJQ6JWGlbt+jpoglzzO8T3AJZ2SCvZprCQIR6Ks4QyTFr31fFmpGTzbqJe+8u9yxXgOW
	NGAS68Ufc1RSrRPF0h+2QlyG8ZkmTYf2QErkCpqgY0uelOFLC6slWxplVoBn2rciwt8Q=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kWcfU-0005Ak-74; Sun, 25 Oct 2020 09:50:28 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kWcfT-0002es-VB; Sun, 25 Oct 2020 09:50:28 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kWcfT-0000CX-Uf; Sun, 25 Oct 2020 09:50:27 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156209-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 156209: all pass - PUSHED
X-Osstest-Versions-This:
    xen=6ca70821b59849ad97c3fadc47e63c1a4af1a78c
X-Osstest-Versions-That:
    xen=3b49791e4cc2f38dd84bf331b75217adaef636e3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 25 Oct 2020 09:50:27 +0000

flight 156209 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156209/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  6ca70821b59849ad97c3fadc47e63c1a4af1a78c
baseline version:
 xen                  3b49791e4cc2f38dd84bf331b75217adaef636e3

Last test of basis   156067  2020-10-21 09:19:38 Z    4 days
Testing same since   156209  2020-10-25 09:18:26 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Elliott Mitchell <ehem+xen@m5p.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Roger Pau Monné <roger.pau@citrix.com>

jobs:
 coverity-amd64                                               pass    


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

To xenbits.xen.org:/home/xen/git/xen.git
   3b49791e4c..6ca70821b5  6ca70821b59849ad97c3fadc47e63c1a4af1a78c -> coverity-tested/smoke

