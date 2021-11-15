Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C81A44504A8
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 13:44:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225902.390233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmbLb-0005HB-UH; Mon, 15 Nov 2021 12:44:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225902.390233; Mon, 15 Nov 2021 12:44:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmbLb-0005Eb-Pk; Mon, 15 Nov 2021 12:44:31 +0000
Received: by outflank-mailman (input) for mailman id 225902;
 Mon, 15 Nov 2021 12:44:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jrjg=QC=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mmbLZ-0005DJ-U6
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 12:44:29 +0000
Received: from ppsw-33.csi.cam.ac.uk (ppsw-33.csi.cam.ac.uk [131.111.8.133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6023022-4611-11ec-a9d2-d9f7a1cc8784;
 Mon, 15 Nov 2021 13:44:29 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:46860)
 by ppsw-33.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mmbLW-000a3w-gr (Exim 4.95) (return-path <amc96@srcf.net>);
 Mon, 15 Nov 2021 12:44:26 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 04A0E1FC18;
 Mon, 15 Nov 2021 12:44:25 +0000 (GMT)
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
X-Inumbo-ID: c6023022-4611-11ec-a9d2-d9f7a1cc8784
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Subject: Re: [PATCH for-4.16 4/4] tools/python: fix python libxc bindings to
 pass a max grant version
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <iwj@xenproject.org>
References: <20211115121741.3719-1-roger.pau@citrix.com>
 <20211115121741.3719-5-roger.pau@citrix.com>
From: Andrew Cooper <amc96@srcf.net>
Message-ID: <a673781a-a819-78e9-9ac5-d54345555d95@srcf.net>
Date: Mon, 15 Nov 2021 12:44:25 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211115121741.3719-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB

On 15/11/2021 12:17, Roger Pau Monne wrote:
> Such max version should be provided by the caller, otherwise the
> bindings will default to specifying a max version of 2, which is
> inline with the current defaults in the hypervisor.
>
> Fixes: 7379f9e10a ('gnttab: allow setting max version per-domain')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

