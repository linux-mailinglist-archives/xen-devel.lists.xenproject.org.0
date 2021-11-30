Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EF8463BD7
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 17:34:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235356.408352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms65A-0004b1-G4; Tue, 30 Nov 2021 16:34:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235356.408352; Tue, 30 Nov 2021 16:34:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms65A-0004Xa-D7; Tue, 30 Nov 2021 16:34:16 +0000
Received: by outflank-mailman (input) for mailman id 235356;
 Tue, 30 Nov 2021 16:34:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ICIV=QR=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1ms658-0004E2-N3
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 16:34:14 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58080981-51fb-11ec-b941-1df2895da90e;
 Tue, 30 Nov 2021 17:34:10 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:34606)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1ms657-0009vC-73 (Exim 4.95) (return-path <amc96@srcf.net>);
 Tue, 30 Nov 2021 16:34:13 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id E3D4A1FA51;
 Tue, 30 Nov 2021 16:34:12 +0000 (GMT)
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
X-Inumbo-ID: 58080981-51fb-11ec-b941-1df2895da90e
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <fe01785d-7983-0541-83f2-ecc7f6e5beee@srcf.net>
Date: Tue, 30 Nov 2021 16:34:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] x86/monitor: don't open-code
 hvm_has_set_descriptor_access_exiting()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>
References: <925bb889-8048-e275-12e7-a4f5d31fb76d@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <925bb889-8048-e275-12e7-a4f5d31fb76d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/11/2021 16:11, Jan Beulich wrote:
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

