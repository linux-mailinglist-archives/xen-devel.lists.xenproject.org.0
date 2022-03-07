Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 529534CFF0B
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 13:45:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.285988.485294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRCjP-0008JN-Ij; Mon, 07 Mar 2022 12:44:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 285988.485294; Mon, 07 Mar 2022 12:44:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRCjP-0008HX-Fn; Mon, 07 Mar 2022 12:44:55 +0000
Received: by outflank-mailman (input) for mailman id 285988;
 Mon, 07 Mar 2022 12:44:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4knz=TS=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1nRCjO-0008HR-A7
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 12:44:54 +0000
Received: from ppsw-31.csi.cam.ac.uk (ppsw-31.csi.cam.ac.uk [131.111.8.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61fe1243-9e14-11ec-8eba-a37418f5ba1a;
 Mon, 07 Mar 2022 13:44:52 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:47302)
 by ppsw-31.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1nRCjG-000rZD-KL (Exim 4.95) (return-path <amc96@srcf.net>);
 Mon, 07 Mar 2022 12:44:46 +0000
Received: from [192.168.1.10] (host-92-12-45-187.as13285.net [92.12.45.187])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 185511FA70;
 Mon,  7 Mar 2022 12:44:46 +0000 (GMT)
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
X-Inumbo-ID: 61fe1243-9e14-11ec-8eba-a37418f5ba1a
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <f52babbd-e435-a1c5-cf9f-a6e36417645c@srcf.net>
Date: Mon, 7 Mar 2022 12:44:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] IOMMU/x86: tidy adjust_irq_affinities hook
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>
References: <67e34863-74fd-6d7f-8b63-26f45bf0426f@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <67e34863-74fd-6d7f-8b63-26f45bf0426f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/03/2022 12:40, Jan Beulich wrote:
> As of 3e56754b0887 ("xen/cet: Fix __initconst_cf_clobber") there's no
> need for a non-void return value anymore, as the hook functions are no
> longer themselves passed to __initcall(). For the same reason the
> iommu_enabled checks can now move from the individual functions to the
> wrapper.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

