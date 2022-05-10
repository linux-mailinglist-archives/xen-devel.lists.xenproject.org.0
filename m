Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EB152134A
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 13:10:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325450.548022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noNkd-0002gA-SQ; Tue, 10 May 2022 11:09:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325450.548022; Tue, 10 May 2022 11:09:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noNkd-0002dY-PD; Tue, 10 May 2022 11:09:59 +0000
Received: by outflank-mailman (input) for mailman id 325450;
 Tue, 10 May 2022 11:09:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VXvK=VS=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1noNkc-00025o-K1
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 11:09:58 +0000
Received: from ppsw-30.csi.cam.ac.uk (ppsw-30.csi.cam.ac.uk [131.111.8.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba440ca2-d051-11ec-8fc4-03012f2f19d4;
 Tue, 10 May 2022 13:09:58 +0200 (CEST)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:44498)
 by ppsw-30.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1noNkR-000XGY-cl (Exim 4.95) (return-path <amc96@srcf.net>);
 Tue, 10 May 2022 12:09:47 +0100
Received: from [192.168.1.10] (host-92-26-109-251.as13285.net [92.26.109.251])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id B53D21FBB6;
 Tue, 10 May 2022 12:09:46 +0100 (BST)
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
X-Inumbo-ID: ba440ca2-d051-11ec-8fc4-03012f2f19d4
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <474f4ad4-e1ee-0ca9-5ba5-2ee39d651286@srcf.net>
Date: Tue, 10 May 2022 12:09:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 5/6] byteorder: Remove byteorder
Content-Language: en-GB
To: Lin Liu <lin.liu@citrix.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <cover.1652170719.git.lin.liu@citrix.com>
 <97e346648d356f621170bcb89fd7d86c120aca70.1652170719.git.lin.liu@citrix.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <97e346648d356f621170bcb89fd7d86c120aca70.1652170719.git.lin.liu@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/05/2022 11:15, Lin Liu wrote:
> include/xen/byteswap.h has simplify the interface, just clean
> the old interface
>
> No functional change
>
> Signed-off-by: Lin Liu <lin.liu@citrix.com>
> ---
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: George Dunlap <george.dunlap@citrix.com>
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Julien Grall <julien@xen.org>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Wei Liu <wl@xen.org>
> ---
>  xen/include/xen/byteorder/big_endian.h    | 102 ------------
>  xen/include/xen/byteorder/generic.h       |  68 --------
>  xen/include/xen/byteorder/little_endian.h | 102 ------------
>  xen/include/xen/byteorder/swab.h          | 183 ----------------------
>  4 files changed, 455 deletions(-)

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Good riddance.

