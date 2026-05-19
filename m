Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJaZLFU/DGqqawUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 12:45:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CD157CB81
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 12:45:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312745.1582838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPHws-000344-Uw; Tue, 19 May 2026 10:45:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312745.1582838; Tue, 19 May 2026 10:45:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPHws-00032L-S0; Tue, 19 May 2026 10:45:18 +0000
Received: by outflank-mailman (input) for mailman id 1312745;
 Tue, 19 May 2026 10:45:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1wPHwr-00032F-0e
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 10:45:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPHwo-00Bb98-1k
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 12:45:14 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a0c3f33-2eae-0a2a0a5409dd-0a2a45038bda-26
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 12:45:13 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a0c3f39-672d-0a2a45030019-a237832f88aa-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 12:45:13 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 7B6764EE3CE1;
 Tue, 19 May 2026 12:45:13 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1779187513;
	b=oYPeEcgGPUgB0qDvE2MeLkxbCXzkg1BwjUB3D0E6At9TNqJt8hPnMqVbpgWsNXhyIM8u
	 rIKP03XE6xV+o+QtOYV/l4aA5Ju+euW//KL61gzQAJpflWejGN363kR4zdTxpRGk06R03
	 t55sz1VG1wq9hXzUKPwaKoxJPg3aeOesaUJMtNO1NMTeMIY+pCjDaSCMZomgBDHwXiS29
	 NK6Zx470cgUUDNskBjBjogHeEdV34Q8vZGwi6SPXNSZVvlhGUlGCo4wGOfl6kileq4hXi
	 9xcCpOz3rSco9Uma6bG9CqtxTYG+Wvtt0CrtnZYi3tbExsBGBxxoQYfn93Pl8v/HUkmbd
	 l0gydEqOMYJGYEGM6ULjJIH9Xe4dTM0fka6+WxSKgjfbZhZOLSYtSydYr1RKFqIM0xVVA
	 NSsts9XM9kH8xLb/uwb6QrzfJ48IFs+aofXWegp8hy1E9lcT0JgTMHJ/PLGUyZxi+lpKt
	 WQYgU6Iu26fRX87KFCeOD5KDRCukwoWZyNj9ab7uDMGiipfylXafzR64oKPIME4SeJdEo
	 yo7FVZii5w4cHXkTvGN2oIBe+7qp/0grmH8Sny/x5TvWVrBS6pCH7/7hMuo+8ftcbipuz
	 Gm7ZgrqRHd18DDrv587saNCimczJqz2SSsfLR8nuSA9XhEAGeL3Be1il+XNJNZ0=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1779187513;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=l+pWLWhZltNhxfkU1Tbvx1ofcBWtjiktpSBSBMEySK4=;
	b=5tm1fckGJ377BtVajf74/ShqvWHVRI6lMFjWVS+JLTRAqdoiGUoLanQSWOfS0jio/1rz
	 1q2Iq3algm6F7fvuH1Fj5Domna5sEfnk6nlAvofLCulnq+Cr4RvxWiW462ysIzcfywVva
	 6MzkOLT5VpH1tg7RH5ZisoBFucwQfCA76cbrxLyLmJ5RmCvffQjFYTmPhA+9yR39I/SzT
	 ggmHAMCr7g6BU+0Y/SdvxEZicG1c0UJ0ZWE1nCPKYSMlXYlTTcarhN1gQPqDiFJypjYrO
	 DsfieXLBGa3K3wX97tVRb+PAOfH2/aruTleU0TvvS1bmYZlQ3lQkRwFYp9eAqsruGUD7k
	 VjJV7uiMWCw4Rujf/N2eTg7v7k0pwjKrkT8eb5lyv9Nkbgh3dckiqJp6utURtTIV3I+1q
	 eUq9c3VpbvJRZdwZgMAG2RezC4d2BdpaFxG8DaD12a2fud/6DzW56TgnH52Q4kdEX9f53
	 0ZvJ8+KWEE2WBT2hwljnARXjfAOAm1V2e6mIXFhf5QDFQtNzeRC2oEiw3G5aZfzeVdMaB
	 LeKNYljg/bWDxJXYkF0xWajN3X+C0jFtTbhrWFCConXWvbXKsZyuszHNtatJf8RIoLLhg
	 li0ArbQtMRns8ovB+lTLmiTPOOMRRgkUlCXcOF0c9bocuii9LCRPhRDyc1B4cPM=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Tue, 19 May 2026 12:45:13 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] automation/eclair: export XEN_TARGET_ARCH during
 assignment
In-Reply-To: <8b3120f7302e591b2828cb77c5f903c84149d498.1779186401.git.dmytro_prokopchuk1@epam.com>
References: <8b3120f7302e591b2828cb77c5f903c84149d498.1779186401.git.dmytro_prokopchuk1@epam.com>
Message-ID: <0700a54389d4071c7308b8eb3a52c9ab@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1779187513-36F42938-9A059A16/0/0
X-purgate-type: clean
X-purgate-size: 1429
X-Spamd-Result: default: False [-1.39 / 15.00];
	ARC_ALLOW(-1.00)[bugseng.com:s=openarc:i=1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[bugseng.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmytro_prokopchuk1@epam.com,m:xen-devel@lists.xenproject.org,m:cardoe@cardoe.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo,linkedin.com:url,b.sc:url,bugseng.com:url,bugseng.com:mid]
X-Rspamd-Queue-Id: 68CD157CB81
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-05-19 12:27, Dmytro Prokopchuk1 wrote:
> Move XEN_TARGET_ARCH export into the architecture selection
> branches instead of exporting the variable before assignment.
> This ensures the selected architecture value is correctly
> propagated.
> 

Did you see a case where this is not correctly propagated? As far as I 
understand, the value of XEN_TARGET_ARCH seen by subprocesses is the 
last value set for the variable, regardless of where the export command 
is placed.

> No functional changes.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> ---
>  automation/eclair_analysis/prepare.sh | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/automation/eclair_analysis/prepare.sh 
> b/automation/eclair_analysis/prepare.sh
> index e941e6edc4..fde83c2d2d 100755
> --- a/automation/eclair_analysis/prepare.sh
> +++ b/automation/eclair_analysis/prepare.sh
> @@ -22,12 +22,10 @@ if [ $# -ne 1 ]; then
>    exit 1
>  fi
> 
> -export XEN_TARGET_ARCH
> -
>  if [ "$1" = "X86_64" ]; then
> -  XEN_TARGET_ARCH=x86_64
> +  export XEN_TARGET_ARCH=x86_64
>  elif [ "$1" = "ARM64" ]; then
> -  XEN_TARGET_ARCH=arm64
> +  export XEN_TARGET_ARCH=arm64
>  else
>    fatal "Unknown configuration: $1"
>  fi

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

