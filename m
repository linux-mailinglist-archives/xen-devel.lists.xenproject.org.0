Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 215BB262CDC
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 12:09:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFx2q-0001iL-2Q; Wed, 09 Sep 2020 10:09:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zLKP=CS=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kFx2n-0001iF-UG
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 10:09:38 +0000
X-Inumbo-ID: fa04b0bc-82c1-4a95-97d0-b55c2fe71d5a
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fa04b0bc-82c1-4a95-97d0-b55c2fe71d5a;
 Wed, 09 Sep 2020 10:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To;
 bh=SLkwy7MgGsuSqXQRNp4fpdxkJ0OJSNEJK7D0bXNIGzY=; b=E/D3K/ttdMBn9NEKTg1IRmaTbD
 KIfzMMGcfN38C/7hqISMCH6z93YHTwSCMVBVpiEakDWXhzyfgaIawKsBXruExaqHNkSeW1R7nl8HB
 guOUp/reKfHYDdpDvstRYzZWs1jVWj1Z/a16QR0OzzF3zgQoEgmyyw4pJOEnXMaeJvFM=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kFx2m-0004dp-74; Wed, 09 Sep 2020 10:09:36 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kFx2l-0007Ap-Vw; Wed, 09 Sep 2020 10:09:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kFx2l-0005Uv-VS; Wed, 09 Sep 2020 10:09:35 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-154011-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 154011: all pass - PUSHED
X-Osstest-Versions-This: xen=1e2d3be2e516e6f415ca6029f651b76a8563a27c
X-Osstest-Versions-That: xen=f4c1a541fa351e4f613471bbf397931f9e1ddd27
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 09 Sep 2020 10:09:35 +0000
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

flight 154011 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/154011/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  1e2d3be2e516e6f415ca6029f651b76a8563a27c
baseline version:
 xen                  f4c1a541fa351e4f613471bbf397931f9e1ddd27

Last test of basis   153795  2020-09-06 09:18:25 Z    3 days
Testing same since   154011  2020-09-09 09:20:03 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Wei Liu <wl@xen.org>

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
   f4c1a541fa..1e2d3be2e5  1e2d3be2e516e6f415ca6029f651b76a8563a27c -> coverity-tested/smoke

