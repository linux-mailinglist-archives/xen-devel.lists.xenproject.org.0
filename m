Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98388281488
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 15:57:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2161.6415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOLY3-0004bq-Qw; Fri, 02 Oct 2020 13:56:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2161.6415; Fri, 02 Oct 2020 13:56:35 +0000
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
	id 1kOLY3-0004bR-Nq; Fri, 02 Oct 2020 13:56:35 +0000
Received: by outflank-mailman (input) for mailman id 2161;
 Fri, 02 Oct 2020 13:56:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6tcj=DJ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kOLY2-0004aC-9j
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 13:56:34 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8d2089a5-7260-4ad0-a7bc-059e25f0a43c;
 Fri, 02 Oct 2020 13:56:28 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kOLXv-0000Og-QT; Fri, 02 Oct 2020 13:56:27 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kOLXv-00073K-It; Fri, 02 Oct 2020 13:56:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kOLXv-0008Mh-IO; Fri, 02 Oct 2020 13:56:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=6tcj=DJ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kOLY2-0004aC-9j
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 13:56:34 +0000
X-Inumbo-ID: 8d2089a5-7260-4ad0-a7bc-059e25f0a43c
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8d2089a5-7260-4ad0-a7bc-059e25f0a43c;
	Fri, 02 Oct 2020 13:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=BD2QsPq1BNEYN4CzERArdnc7qSnsztltfUsNI+5S7Zk=; b=RQRfMMJjjdv7ATXpAjfyqnS+xC
	kCqhkjSw43pGsOSH1AsffSQaPLPw5U2bXIiVcGnJCHYqiSDse31UYRKDdrQjIPuMu8f7LXarsvGxt
	KZqZPyRH6EyNgDXEs87EbFDKSJjsilPhvYmOXfFsIzJ1TWLwLCXbuOIZHO+bzFhSaXB8=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kOLXv-0000Og-QT; Fri, 02 Oct 2020 13:56:27 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kOLXv-00073K-It; Fri, 02 Oct 2020 13:56:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kOLXv-0008Mh-IO; Fri, 02 Oct 2020 13:56:27 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-155321-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 155321: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:guest-start:fail:regression
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=59b27f360e3d9dc0378c1288e67a91fa41a77158
X-Osstest-Versions-That:
    xen=c73952831f0fc63a984e0d07dff1d20f8617b81f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 02 Oct 2020 13:56:27 +0000

flight 155321 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/155321/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-libvirt     12 guest-start              fail REGR. vs. 155128

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  59b27f360e3d9dc0378c1288e67a91fa41a77158
baseline version:
 xen                  c73952831f0fc63a984e0d07dff1d20f8617b81f

Last test of basis   155128  2020-09-30 08:01:25 Z    2 days
Failing since        155144  2020-09-30 16:01:24 Z    1 days   14 attempts
Testing same since   155310  2020-10-02 08:01:29 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Jason Andryuk <jandryuk@gmail.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Olaf Hering <olaf@aepfle.de>
  Paul Durrant <paul@xen.org>
  Paul Durrant <pdurrant@amazon.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Wei Liu <wl@xen.org>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-libvirt                                     fail    


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


Not pushing.

(No revision log; it would be 387 lines long.)

