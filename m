Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F7648DA9E
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 16:21:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257251.442014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n81uq-00005P-JQ; Thu, 13 Jan 2022 15:21:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257251.442014; Thu, 13 Jan 2022 15:21:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n81uq-0008UU-GO; Thu, 13 Jan 2022 15:21:28 +0000
Received: by outflank-mailman (input) for mailman id 257251;
 Thu, 13 Jan 2022 15:21:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YVjj=R5=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1n81up-0008UO-0S
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 15:21:27 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7940f5c4-7484-11ec-a563-1748fde96b53;
 Thu, 13 Jan 2022 16:21:26 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:48636)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1n81um-000UyW-2U (Exim 4.95) (return-path <amc96@srcf.net>);
 Thu, 13 Jan 2022 15:21:24 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 715731FC25;
 Thu, 13 Jan 2022 15:21:24 +0000 (GMT)
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
X-Inumbo-ID: 7940f5c4-7484-11ec-a563-1748fde96b53
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <6f2e98ee-928a-b1eb-a637-402da5ee2640@srcf.net>
Date: Thu, 13 Jan 2022 15:21:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>
References: <20211130181139.14398-1-andrew.cooper3@citrix.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 0/2] x86/hvm: Cleanup
In-Reply-To: <20211130181139.14398-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/11/2021 18:11, Andrew Cooper wrote:
> Andrew Cooper (2):
>   x86/hvm: Simplify hvm_enable_msr_interception()
>   x86/hvm: Rework nested hap functions to reduce parameters

These are mechanical rather than functional changes, and the patches
have been pending for 6 weeks without objection.  I've committed them
with Jan's R-by.

~Andrew

