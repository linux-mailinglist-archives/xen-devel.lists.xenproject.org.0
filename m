Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BCE5212C6
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 12:52:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325406.547967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noNTR-0006qd-5u; Tue, 10 May 2022 10:52:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325406.547967; Tue, 10 May 2022 10:52:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noNTR-0006o6-1w; Tue, 10 May 2022 10:52:13 +0000
Received: by outflank-mailman (input) for mailman id 325406;
 Tue, 10 May 2022 10:52:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VXvK=VS=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1noNTP-0005rW-Te
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 10:52:11 +0000
Received: from ppsw-41.csi.cam.ac.uk (ppsw-41.csi.cam.ac.uk [131.111.8.141])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d1f3320-d04f-11ec-a406-831a346695d4;
 Tue, 10 May 2022 12:52:10 +0200 (CEST)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:60476)
 by ppsw-41.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1noNTI-000086-QN (Exim 4.95) (return-path <amc96@srcf.net>);
 Tue, 10 May 2022 11:52:04 +0100
Received: from [192.168.1.10] (host-92-26-109-251.as13285.net [92.26.109.251])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id EFA221FA59;
 Tue, 10 May 2022 11:52:03 +0100 (BST)
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
X-Inumbo-ID: 3d1f3320-d04f-11ec-a406-831a346695d4
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <2bf10a9c-f5bf-3d7f-95a8-2151440f5b06@srcf.net>
Date: Tue, 10 May 2022 11:52:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 3/6] arm64/find_next_bit: Remove ext2_swab()
Content-Language: en-GB
To: Lin Liu <lin.liu@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1652170719.git.lin.liu@citrix.com>
 <48bdc1be03a77bcc405e327b8022fcd937186e9e.1652170719.git.lin.liu@citrix.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <48bdc1be03a77bcc405e327b8022fcd937186e9e.1652170719.git.lin.liu@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/05/2022 11:15, Lin Liu wrote:
> ext2 has nothing to do with this logic.  Clean up the code with
> xen/byteswap.h which now has an unsigned long helper.
>
> No functional change.
>
> Signed-off-by: Lin Liu <lin.liu@citrix.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

