Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DBB456D6D
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 11:39:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227754.394050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo1Ha-0007nr-Km; Fri, 19 Nov 2021 10:38:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227754.394050; Fri, 19 Nov 2021 10:38:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo1Ha-0007m3-HI; Fri, 19 Nov 2021 10:38:14 +0000
Received: by outflank-mailman (input) for mailman id 227754;
 Fri, 19 Nov 2021 10:38:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Hp3=QG=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mo1HY-0007lw-EZ
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 10:38:12 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c96c4c57-4924-11ec-a9d2-d9f7a1cc8784;
 Fri, 19 Nov 2021 11:38:09 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:37512)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mo1HQ-000Ryq-oe (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 19 Nov 2021 10:38:04 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 7569E1FB23;
 Fri, 19 Nov 2021 10:38:04 +0000 (GMT)
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
X-Inumbo-ID: c96c4c57-4924-11ec-a9d2-d9f7a1cc8784
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <5c0fcc40-9ab1-daf7-7097-1d4968576497@srcf.net>
Date: Fri, 19 Nov 2021 10:38:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [XEN PATCH for-4.16] golang/xenlight: regen generated code
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, George Dunlap
 <george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@ainfosec.com>,
 Wei Liu <wl@xen.org>
References: <20211119102948.156887-1-anthony.perard@citrix.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <20211119102948.156887-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/11/2021 10:29, Anthony PERARD wrote:
> Fixes: 7379f9e10a3b ("gnttab: allow setting max version per-domain")
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Fixes: 1e6706b0d123 ("xen/arm: Introduce gpaddr_bits field to struct
xen_domctl_getdomaininfo")

as well, by the looks of things.

~Andrew

