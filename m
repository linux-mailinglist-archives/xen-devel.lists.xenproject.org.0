Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 585B61D96C4
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 14:55:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb1ku-0003B8-3j; Tue, 19 May 2020 12:54:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wYyw=7B=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jb1kt-0003B0-4K
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 12:53:59 +0000
X-Inumbo-ID: cd72ae5c-99cf-11ea-a912-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cd72ae5c-99cf-11ea-a912-12813bfff9fa;
 Tue, 19 May 2020 12:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BaOutRfSDx+to1hwThP+cQcy/NluPqkZXXsfJTUN10g=; b=3My5/EGXtULfTC3vhMVntNIqZ
 7eV6wzdoOVk0vLD1q4OWX0Ir4Ai+eOJde/mtWeEv2hx7gkEAVvanmrldgz4e/GML1jKufc/Tr6B+q
 Y3pSJ+NDLDP2boA4UPxaYRzqQeljqiu1A7DDFw2dW47bQVzJd+glcgU3/voB3bBW8OfwU=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jb1kq-0000M1-Of; Tue, 19 May 2020 12:53:56 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jb1kq-00049v-84; Tue, 19 May 2020 12:53:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jb1kq-0003Rl-6I; Tue, 19 May 2020 12:53:56 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150242-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 150242: tolerable all pass - PUSHED
X-Osstest-Failures: xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This: xen=7efd9f3d45480c12328e4419547a98022f7af43a
X-Osstest-Versions-That: xen=475ffdbbf5778329319ef6f7bd6315c163163440
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 19 May 2020 12:53:56 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

flight 150242 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150242/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  7efd9f3d45480c12328e4419547a98022f7af43a
baseline version:
 xen                  475ffdbbf5778329319ef6f7bd6315c163163440

Last test of basis   150233  2020-05-18 18:00:22 Z    0 days
Testing same since   150242  2020-05-19 10:01:19 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Eric Shelton <eshelton@pobox.com>
  Ian Jackson <ian.jackson@eu.citrix.com>
  Jason Andryuk <jandryuk@gmail.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Simon Gaiser <simon@invisiblethingslab.com>
  Wei Liu <wei.liu2@citrix.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-libvirt                                     pass    


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
   475ffdbbf5..7efd9f3d45  7efd9f3d45480c12328e4419547a98022f7af43a -> smoke

