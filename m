Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 009B93B02B6
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jun 2021 13:25:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145837.268271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lveWa-0007f0-DS; Tue, 22 Jun 2021 11:25:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145837.268271; Tue, 22 Jun 2021 11:25:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lveWa-0007bd-8q; Tue, 22 Jun 2021 11:25:00 +0000
Received: by outflank-mailman (input) for mailman id 145837;
 Tue, 22 Jun 2021 11:24:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lveWZ-0007am-6q; Tue, 22 Jun 2021 11:24:59 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lveWZ-0001OS-1M; Tue, 22 Jun 2021 11:24:59 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lveWY-0003VN-OA; Tue, 22 Jun 2021 11:24:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lveWY-0006xt-Ne; Tue, 22 Jun 2021 11:24:58 +0000
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
	bh=B+P8w1ZmIGclDoeens/X/uml0fqOEiRy8YnpjxFW9ys=; b=CA7VILXGFzs2M0YtAjKnhv3+cA
	ByOBBP1xNt+hIHP4pX9JYPvugwoKg9P5jVUhM90IJO641T45tXPKP9dYcK3HDd4bMoV2W8J0ZsjZg
	Ad+NPjailWCtyuaWByGkW1w/QseinX3jGoh7lCfJuiwr/rYvqaXdOf82mhr/J+GTV7kM=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-162956-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 162956: trouble: blocked/broken/preparing/queued
X-Osstest-Failures:
    ovmf:build-amd64-pvops:<job status>:broken:regression
    ovmf:build-i386:<job status>:broken:regression
    ovmf:build-i386-pvops:<job status>:broken:regression
    ovmf:build-i386-xsm:<job status>:broken:regression
    ovmf:build-i386:host-install(4):broken:regression
    ovmf:build-i386-pvops:host-install(4):broken:regression
    ovmf:build-i386-xsm:host-install(4):broken:regression
    ovmf:build-amd64-pvops:host-install(4):broken:regression
    ovmf:build-amd64-libvirt:<none executed>:queued:regression
    ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:<none executed>:queued:regression
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:<none executed>:queued:regression
    ovmf:build-amd64-xsm:hosts-allocate:running:regression
    ovmf:build-amd64:hosts-allocate:running:regression
    ovmf:build-i386-libvirt:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    ovmf=6cfeeb71c43173d657d86d4a38ed655b0fc5f277
X-Osstest-Versions-That:
    ovmf=c410ad4da4b7785170d3d42a3ba190c2caac6feb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 22 Jun 2021 11:24:58 +0000

flight 162956 ovmf running [real]
http://logs.test-lab.xenproject.org/osstest/logs/162956/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64-pvops               <job status>                 broken
 build-i386                      <job status>                 broken
 build-i386-pvops                <job status>                 broken
 build-i386-xsm                  <job status>                 broken
 build-i386                    4 host-install(4)        broken REGR. vs. 162359
 build-i386-pvops              4 host-install(4)        broken REGR. vs. 162359
 build-i386-xsm                4 host-install(4)        broken REGR. vs. 162359
 build-amd64-pvops             4 host-install(4)        broken REGR. vs. 162359
 build-amd64-libvirt             <none executed>              queued
 test-amd64-amd64-xl-qemuu-ovmf-amd64    <none executed>              queued
 test-amd64-i386-xl-qemuu-ovmf-amd64    <none executed>              queued
 build-amd64-xsm               2 hosts-allocate               running
 build-amd64                   2 hosts-allocate               running

Tests which did not succeed, but are not blocking:
 build-i386-libvirt            1 build-check(1)               blocked  n/a

version targeted for testing:
 ovmf                 6cfeeb71c43173d657d86d4a38ed655b0fc5f277
baseline version:
 ovmf                 c410ad4da4b7785170d3d42a3ba190c2caac6feb

Last test of basis   162359  2021-06-04 03:40:08 Z   18 days
Failing since        162368  2021-06-04 15:42:59 Z   17 days   38 attempts
Testing same since   162938  2021-06-21 11:33:16 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  Daoxiang Li <daoxiang.li@intel.com>
  gaoliming <gaoliming@byosoft.com.cn>
  Hao A Wu <hao.a.wu@intel.com>
  Jian J Wang <jian.j.wang@intel.com>
  Kaaira Gupta <kaaira7319@gmail.com>
  Kun Qin <kuqin12@gmail.com>
  Laszlo Ersek <lersek@redhat.com>
  Leif Lindholm <leif@nuviainc.com>
  Liming Gao <gaoliming@byosoft.com.cn>
  Maurice Ma <maurice.ma@intel.com>
  Ni, Ray <ray.ni@intel.com>
  Patrick Rudolph <patrick.rudolph@9elements.com>
  Ray Ni <ray.ni@intel.com>
  Rebecca Cran <rebecca@nuviainc.com>
  Scottie Kuo <scottie.kuo@intel.com>
  Sean Brogan <sean.brogan@microsoft.com>
  Sean Brogan <spbrogan@live.com>
  Sumana Venur <sumana.venur@intel.com>
  Zhiguang Liu <zhiguang.liu@intel.com>

jobs:
 build-amd64-xsm                                              preparing
 build-i386-xsm                                               broken  
 build-amd64                                                  preparing
 build-i386                                                   broken  
 build-amd64-libvirt                                          queued  
 build-i386-libvirt                                           blocked 
 build-amd64-pvops                                            broken  
 build-i386-pvops                                             broken  
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         queued  
 test-amd64-i386-xl-qemuu-ovmf-amd64                          queued  


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

broken-job build-amd64-libvirt queued
broken-job build-amd64-pvops broken
broken-job build-i386 broken
broken-job build-i386-pvops broken
broken-job build-i386-xsm broken
broken-job test-amd64-amd64-xl-qemuu-ovmf-amd64 queued
broken-job test-amd64-i386-xl-qemuu-ovmf-amd64 queued
broken-step build-i386 host-install(4)
broken-step build-i386-pvops host-install(4)
broken-step build-i386-xsm host-install(4)
broken-step build-amd64-pvops host-install(4)

Not pushing.

(No revision log; it would be 2193 lines long.)

