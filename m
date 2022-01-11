Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD7B48B2BC
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 17:59:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255969.438989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7KUH-0008QM-VH; Tue, 11 Jan 2022 16:59:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255969.438989; Tue, 11 Jan 2022 16:59:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7KUH-0008OY-R9; Tue, 11 Jan 2022 16:59:09 +0000
Received: by outflank-mailman (input) for mailman id 255969;
 Tue, 11 Jan 2022 16:59:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JwWh=R3=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1n7KUG-0008OS-VP
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 16:59:08 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c85a3d74-72ff-11ec-9ce5-af14b9085ebd;
 Tue, 11 Jan 2022 17:59:07 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:46960)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1n7KUC-000Jtz-71 (Exim 4.95) (return-path <amc96@srcf.net>);
 Tue, 11 Jan 2022 16:59:04 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id E3D1F1FB3A;
 Tue, 11 Jan 2022 16:59:03 +0000 (GMT)
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
X-Inumbo-ID: c85a3d74-72ff-11ec-9ce5-af14b9085ebd
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <0e2be14c-ee00-c106-2898-8c9f51ba6959@srcf.net>
Date: Tue, 11 Jan 2022 16:59:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 1/2] x86/paging: tidy paging_mfn_is_dirty()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <61c1d38c-65a6-e150-ed53-b565d30c18c9@suse.com>
 <aa49dc63-965a-bf9b-3d42-11286b709a24@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <aa49dc63-965a-bf9b-3d42-11286b709a24@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/12/2021 13:25, Jan Beulich wrote:
> The function returning a boolean indicator, make it return bool. Also
> constify its struct domain parameter, albeit requiring to also adjust
> mm_locked_by_me(). Furthermore the function is used by shadow code only.
>
> Since mm_locked_by_me() needs touching anyway, also switch its return
> type to bool.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

