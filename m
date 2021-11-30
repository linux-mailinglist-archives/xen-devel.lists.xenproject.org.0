Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 231E5463BD8
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 17:34:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235355.408342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms64y-0004Go-6R; Tue, 30 Nov 2021 16:34:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235355.408342; Tue, 30 Nov 2021 16:34:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms64y-0004E8-2h; Tue, 30 Nov 2021 16:34:04 +0000
Received: by outflank-mailman (input) for mailman id 235355;
 Tue, 30 Nov 2021 16:34:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ICIV=QR=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1ms64w-0004E2-Fc
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 16:34:02 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f847823-51fb-11ec-b941-1df2895da90e;
 Tue, 30 Nov 2021 17:33:56 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:40048)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1ms64p-000yQH-nR (Exim 4.95) (return-path <amc96@srcf.net>);
 Tue, 30 Nov 2021 16:33:55 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 193C71FA51;
 Tue, 30 Nov 2021 16:33:55 +0000 (GMT)
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
X-Inumbo-ID: 4f847823-51fb-11ec-b941-1df2895da90e
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <c0e792a4-c0ce-a746-b925-1439971f2bdf@srcf.net>
Date: Tue, 30 Nov 2021 16:33:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH RFC] SUPPORT.md: limit security support for hosts with
 very much memory
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <fff23663-b114-0726-e37f-06461b5ea63d@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <fff23663-b114-0726-e37f-06461b5ea63d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/11/2021 16:14, Jan Beulich wrote:
> Sufficient and in particular regular testing on very large hosts cannot
> currently be guaranteed. Anyone wanting us to support larger hosts is
> free to propose so, but will need to supply not only test results, but
> also a test plan.
>
> This is a follow-up to XSA-385.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

