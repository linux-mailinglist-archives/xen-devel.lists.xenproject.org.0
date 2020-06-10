Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2061F5125
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2020 11:29:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jix20-0003N4-2I; Wed, 10 Jun 2020 09:28:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eG39=7X=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jix1y-0003Mz-Tr
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2020 09:28:22 +0000
X-Inumbo-ID: ba0b3904-aafc-11ea-bb8b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ba0b3904-aafc-11ea-bb8b-bc764e2007e4;
 Wed, 10 Jun 2020 09:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sPo/Lu4Il1ktHJc3YZJrOCNCKAa/fijs1T2Pb5LLMPI=; b=ieh+TsWm1gR5J8D6kPCbVdNmT
 7fuOrQ/+vvF5O2nPAC2+sjIyBFGsB6n7b1zLgEDfHBNC7TKAB2ZgYVc/uvzan3vpflb+nCLeGWgWv
 6mG64rYjDFZy9IcweoQa/RSzX+yqYOVlb3qFfdZE8ypftQarKKzYX+8kxG7X2cX34gE3w=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jix1x-0003IZ-Ek; Wed, 10 Jun 2020 09:28:21 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jix1x-0006ze-1j; Wed, 10 Jun 2020 09:28:21 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jix1x-0003qV-1C; Wed, 10 Jun 2020 09:28:21 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151009-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 151009: regressions - ALL FAIL
X-Osstest-Failures: xen-unstable-coverity:coverity-amd64:coverity-build:fail:regression
X-Osstest-Versions-This: xen=6a49b9a7920c82015381740905582b666160d955
X-Osstest-Versions-That: xen=51ca66c37371b10b378513af126646de22eddb17
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 10 Jun 2020 09:28:21 +0000
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

flight 151009 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151009/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 coverity-amd64                6 coverity-build           fail REGR. vs. 150905

version targeted for testing:
 xen                  6a49b9a7920c82015381740905582b666160d955
baseline version:
 xen                  51ca66c37371b10b378513af126646de22eddb17

Last test of basis   150905  2020-06-07 09:19:18 Z    3 days
Testing same since   151009  2020-06-10 09:20:09 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  George Dunlap <george.dunlap@citrix.com>
  Ian Jackson <ian.jackson@eu.citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Nick Rosbrook <rosbrookn@ainfosec.com>
  Paul Durrant <pdurrant@amazon.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Tamas K Lengyel <tamas@tklengyel.com>
  Wei Liu <wl@xen.org>

jobs:
 coverity-amd64                                               fail    


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

(No revision log; it would be 329 lines long.)

