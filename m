Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE4948B597
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 19:19:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256002.439057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Ljr-0002L6-92; Tue, 11 Jan 2022 18:19:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256002.439057; Tue, 11 Jan 2022 18:19:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Ljr-0002JH-5l; Tue, 11 Jan 2022 18:19:19 +0000
Received: by outflank-mailman (input) for mailman id 256002;
 Tue, 11 Jan 2022 18:19:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JwWh=R3=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1n7Ljp-0002J4-80
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 18:19:17 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc5eb13d-730a-11ec-9ce5-af14b9085ebd;
 Tue, 11 Jan 2022 19:19:16 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:46998)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1n7Ljo-000aR3-6i (Exim 4.95) (return-path <amc96@srcf.net>);
 Tue, 11 Jan 2022 18:19:16 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id D8B9E1FB3A;
 Tue, 11 Jan 2022 18:19:15 +0000 (GMT)
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
X-Inumbo-ID: fc5eb13d-730a-11ec-9ce5-af14b9085ebd
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <b6526d7d-4086-30b3-181a-1a34c44137e3@srcf.net>
Date: Tue, 11 Jan 2022 18:19:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
References: <20220111145817.22170-1-jgross@suse.com>
 <20220111145817.22170-19-jgross@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH v2 18/18] mini-os: remove file type FTYPE_XC
In-Reply-To: <20220111145817.22170-19-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/01/2022 14:58, Juergen Gross wrote:
> The only reason for the file type FTYPE_XC has been gone long time
> ago: it was needed for xc_map_foreign_bulk(), which has been switched
> to use libxenforeignmemory and doesn't need this special file any
> more.
>
> So remove everything related to FTYPE_XC.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

You'd have less churn in the series if this came ahead of patch 17. 
There are at least 3 hunks below that you've already converted once, and
one of those hunks already needs a hard tabs fixup.

~Andrew

