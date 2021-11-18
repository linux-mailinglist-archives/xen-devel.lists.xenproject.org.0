Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1923D455C88
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 14:21:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227416.393322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnhLO-0002i6-J8; Thu, 18 Nov 2021 13:20:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227416.393322; Thu, 18 Nov 2021 13:20:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnhLO-0002fi-Ew; Thu, 18 Nov 2021 13:20:50 +0000
Received: by outflank-mailman (input) for mailman id 227416;
 Thu, 18 Nov 2021 13:20:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9nqF=QF=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mnhLN-0002fc-3f
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 13:20:49 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56d7ecd8-4872-11ec-a9d2-d9f7a1cc8784;
 Thu, 18 Nov 2021 14:20:47 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:37320)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mnhLK-000fwV-mn (Exim 4.95) for xen-devel@lists.xenproject.org
 (return-path <amc96@srcf.net>); Thu, 18 Nov 2021 13:20:46 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 0097A1FAB6
 for <xen-devel@lists.xenproject.org>; Thu, 18 Nov 2021 13:20:45 +0000 (GMT)
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
X-Inumbo-ID: 56d7ecd8-4872-11ec-a9d2-d9f7a1cc8784
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <0b8a1864-5ae9-3b19-4d43-893a5777985e@srcf.net>
Date: Thu, 18 Nov 2021 13:20:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 0/3] x86/Viridian: ExProcessorMasks handling improvements
Content-Language: en-GB
To: xen-devel@lists.xenproject.org
References: <c8e8767b-111c-5eec-15c4-a7cb60a99283@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <c8e8767b-111c-5eec-15c4-a7cb60a99283@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/11/2021 13:12, Jan Beulich wrote:
> I've noticed the bugs fixed in patch 1 only while doing the other cleanup.
>
> 1: fix error code use
> 2: drop dead variable updates
> 3: fold duplicate vpset retrieval code

Oh, nice.  This makes it rather easier to do the flush short-circuit for
HV_GENERIC_SET_ALL.

I'll try importing this patchset onto my branch and having a go at it.

~Andrew

