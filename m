Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3C35824AD
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 12:44:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376044.608628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGeWX-0004xF-Gp; Wed, 27 Jul 2022 10:44:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376044.608628; Wed, 27 Jul 2022 10:44:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGeWX-0004ui-DI; Wed, 27 Jul 2022 10:44:17 +0000
Received: by outflank-mailman (input) for mailman id 376044;
 Wed, 27 Jul 2022 10:44:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6xE9=YA=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1oGeWW-0004uY-CR
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 10:44:16 +0000
Received: from ppsw-42.srv.uis.cam.ac.uk (ppsw-42.srv.uis.cam.ac.uk
 [131.111.8.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e857b44-0d99-11ed-924f-1f966e50362f;
 Wed, 27 Jul 2022 12:44:15 +0200 (CEST)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:54812)
 by ppsw-42.srv.uis.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1oGeWU-000AB7-Cw (Exim 4.96) (return-path <amc96@srcf.net>);
 Wed, 27 Jul 2022 11:44:14 +0100
Received: from [10.80.3.248] (default-46-102-197-194.interdsl.co.uk
 [46.102.197.194]) (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id BECE11FB69;
 Wed, 27 Jul 2022 11:44:13 +0100 (BST)
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
X-Inumbo-ID: 0e857b44-0d99-11ed-924f-1f966e50362f
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <b5c3d4e0-5055-f220-691d-8367536e1ead@srcf.net>
Date: Wed, 27 Jul 2022 11:44:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] x86/PV: correct post-preemption progress recording in
 iommu_memory_setup()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>
References: <13f6ca1c-559d-b89e-207b-d2685ea80bef@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <13f6ca1c-559d-b89e-207b-d2685ea80bef@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/07/2022 11:41, Jan Beulich wrote:
> Coverity validly points out that the mfn_add() as used was dead code.
>
> Coverity ID: 1507475
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

