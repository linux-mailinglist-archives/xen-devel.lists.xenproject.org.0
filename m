Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C982E45046E
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 13:27:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225894.390211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmb5I-0002Oz-8V; Mon, 15 Nov 2021 12:27:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225894.390211; Mon, 15 Nov 2021 12:27:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmb5I-0002Mn-56; Mon, 15 Nov 2021 12:27:40 +0000
Received: by outflank-mailman (input) for mailman id 225894;
 Mon, 15 Nov 2021 12:27:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jrjg=QC=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mmb5G-0002Md-R6
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 12:27:38 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a39a0a2-460f-11ec-9787-a32c541c8605;
 Mon, 15 Nov 2021 13:27:37 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:59204)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mmb5E-000bvw-6x (Exim 4.95) (return-path <amc96@srcf.net>);
 Mon, 15 Nov 2021 12:27:36 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id D5D571FDB0;
 Mon, 15 Nov 2021 12:27:35 +0000 (GMT)
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
X-Inumbo-ID: 6a39a0a2-460f-11ec-9787-a32c541c8605
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Subject: Re: [PATCH for-4.16 2/4] tests/resource: set grant version for
 created domains
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
References: <20211115121741.3719-1-roger.pau@citrix.com>
 <20211115121741.3719-3-roger.pau@citrix.com>
From: Andrew Cooper <amc96@srcf.net>
Message-ID: <048e39cf-f322-e578-a1a9-65c71065d6a5@srcf.net>
Date: Mon, 15 Nov 2021 12:27:35 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211115121741.3719-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB

On 15/11/2021 12:17, Roger Pau Monne wrote:
> Set the grant table version for the created domains to use version 1,
> as that's the used by the test cases. Without setting the grant
> version the domains for the tests cannot be created.
>
> Fixes: 7379f9e10a ('gnttab: allow setting max version per-domain')
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

