Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4255E1DC160
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 23:30:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbWI5-0005HC-KF; Wed, 20 May 2020 21:30:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gBXs=7C=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jbWI4-0005H6-9I
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 21:30:16 +0000
X-Inumbo-ID: 183e61d0-9ae1-11ea-9887-bc764e2007e4
Received: from ppsw-41.csi.cam.ac.uk (unknown [131.111.8.141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 183e61d0-9ae1-11ea-9887-bc764e2007e4;
 Wed, 20 May 2020 21:30:15 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:46030
 helo=[192.168.1.219])
 by ppsw-41.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.159]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jbWI0-000FXT-RE (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Wed, 20 May 2020 22:30:12 +0100
Subject: Re: [PATCH v3 2/2] x86/idle: prevent entering C6 with in service
 interrupts on Intel
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20200515135802.63853-1-roger.pau@citrix.com>
 <20200515135802.63853-3-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <eaa63636-6e39-d401-e218-14ae37440667@citrix.com>
Date: Wed, 20 May 2020 22:30:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200515135802.63853-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15/05/2020 14:58, Roger Pau Monne wrote:
> Apply a workaround for Intel errata BDX99, CLX30, SKX100, CFW125,
> BDF104, BDH85, BDM135, KWB131: "A Pending Fixed Interrupt May Be
> Dispatched Before an Interrupt of The Same Priority Completes".

HSM175 et al, so presumably a HSD, and HSE as well.

On the broadwell side at least, BDD BDW in addition

~Andrew

