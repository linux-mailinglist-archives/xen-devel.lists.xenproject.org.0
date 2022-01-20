Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A14D495214
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jan 2022 17:11:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259134.447047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAa24-0005jq-4v; Thu, 20 Jan 2022 16:11:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259134.447047; Thu, 20 Jan 2022 16:11:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAa24-0005hP-0v; Thu, 20 Jan 2022 16:11:28 +0000
Received: by outflank-mailman (input) for mailman id 259134;
 Thu, 20 Jan 2022 16:11:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFdd=SE=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1nAa22-0005hF-Ev
 for xen-devel@lists.xenproject.org; Thu, 20 Jan 2022 16:11:26 +0000
Received: from ppsw-33.csi.cam.ac.uk (ppsw-33.csi.cam.ac.uk [131.111.8.133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d566d5b-7a0b-11ec-bc18-3156f6d857e4;
 Thu, 20 Jan 2022 17:11:25 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:49676)
 by ppsw-33.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1nAa20-000jq8-gc (Exim 4.95) (return-path <amc96@srcf.net>);
 Thu, 20 Jan 2022 16:11:24 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id E8EE81FC61;
 Thu, 20 Jan 2022 16:11:23 +0000 (GMT)
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
X-Inumbo-ID: 9d566d5b-7a0b-11ec-bc18-3156f6d857e4
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <1bcec7de-0020-dec5-b577-c26e7f353947@srcf.net>
Date: Thu, 20 Jan 2022 16:11:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] x86/APIC: drop 32-bit days remnants
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <362d1e97-c9c4-3d52-be6a-3fcd5fd0a27f@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <362d1e97-c9c4-3d52-be6a-3fcd5fd0a27f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/01/2022 10:33, Jan Beulich wrote:
> Mercury and Neptune were Pentium chipsets - no need to work around their
> errata, even more so that the workaround looks fragile.
>
> Also ditch a Pentium-related and stale part of a comment.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Lets hope we don't have something other than Mercury/Neptune depends on
this.

