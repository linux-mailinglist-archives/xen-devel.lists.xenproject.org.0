Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D986BD32BB
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 15:19:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142364.1476557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8ISF-0006KM-Lo; Mon, 13 Oct 2025 13:19:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142364.1476557; Mon, 13 Oct 2025 13:19:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8ISF-0006Hr-Id; Mon, 13 Oct 2025 13:19:11 +0000
Received: by outflank-mailman (input) for mailman id 1142364;
 Mon, 13 Oct 2025 13:19:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AerI=4W=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1v8ISD-0006HS-Uw
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 13:19:09 +0000
Received: from smtp-1.srv.uis.cam.ac.uk (smtp-1.srv.uis.cam.ac.uk
 [128.232.132.147]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2bbcb4f7-a837-11f0-980a-7dc792cee155;
 Mon, 13 Oct 2025 15:18:56 +0200 (CEST)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:64767)
 by smtp-1.srv.uis.cam.ac.uk with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <amc96@srcf.net>)
 id 1v8IRz-00000003f90-3Z0K; Mon, 13 Oct 2025 14:18:55 +0100
Received: from [192.168.1.183] (host-92-22-57-86.as13285.net [92.22.57.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 7AF241FC67;
 Mon, 13 Oct 2025 14:18:55 +0100 (BST)
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
X-Inumbo-ID: 2bbcb4f7-a837-11f0-980a-7dc792cee155
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <156d2f26-4f13-4fad-b2c9-4f6f411454d3@srcf.net>
Date: Mon, 13 Oct 2025 14:18:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] VT-d: check bus_to_context_maddr()'s return value
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <28cadeda-613c-471d-b0d3-1709004a75f8@suse.com>
Content-Language: en-GB
From: Andrew Cooper <amc96@srcf.net>
Autocrypt: addr=amc96@srcf.net; keydata=
 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
 14JdDDHUX2Rs6+ahAA==
In-Reply-To: <28cadeda-613c-471d-b0d3-1709004a75f8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/08/2025 3:10 pm, Jan Beulich wrote:
> The function returning zero is an error indication; we shouldn't try to
> map MFN 0 and then treat that page as a context table.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

