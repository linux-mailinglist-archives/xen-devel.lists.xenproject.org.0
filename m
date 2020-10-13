Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDECE28CED1
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 14:58:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6188.16384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSJsi-0008QU-70; Tue, 13 Oct 2020 12:58:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6188.16384; Tue, 13 Oct 2020 12:58:20 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSJsi-0008Q7-3d; Tue, 13 Oct 2020 12:58:20 +0000
Received: by outflank-mailman (input) for mailman id 6188;
 Tue, 13 Oct 2020 12:58:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ben2=DU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kSJsg-0008Q2-WE
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 12:58:19 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d37b0ad3-8135-4ec9-9ee1-e4fcef754c22;
 Tue, 13 Oct 2020 12:58:17 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Ben2=DU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kSJsg-0008Q2-WE
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 12:58:19 +0000
X-Inumbo-ID: d37b0ad3-8135-4ec9-9ee1-e4fcef754c22
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d37b0ad3-8135-4ec9-9ee1-e4fcef754c22;
	Tue, 13 Oct 2020 12:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602593897;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=YRUbOlX3wi7QnVjIk6mmeKln8rCi5d84oc+ZVtQlJ0E=;
  b=GebY/jXUFhkr0478e3nfykFomRUdaeRySZleyyN+w/WJHdfzq39hcLU+
   YBA8XyaEvoXpbRm35EIrGVk54Q4RJZ4v09BtGwpIT/V9N62IxbMSNkv15
   TFzyqarLN1Ih/5wbFKMCeIZXFAVuy61oup5RPvBxgBHP3iJRdfiJ3bEwl
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: pTbrwNvhuBfjRIVIZxxhHSWkIGoabKGl/dsk/EUU2R9FhgXzrohcumz39k0/4BNs3iwtAthUyL
 TM8CXHFd73MwSPgLzSSFh5KF+lOv6IEH2CCfRABgefihzNqbaNeq/s3pPY/vvm0a/w9fbyKpna
 W4W4xVZthO5fYY86QwhrkYhrFuLHyJ3iOEuB3jxxn5NhKapRym6jSO+JuwilI0L00u6KMeItOp
 zl44A/1E8clD/s5euiAdUs8hdUZVnDtgq3FMubJ14Byp8VL9Tm8Of4F9zYCCIH6XhFPywmG/tU
 Aho=
X-SBRS: 2.5
X-MesageID: 29135751
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,370,1596513600"; 
   d="scan'208";a="29135751"
Subject: Re: [PATCH v2 6/6] x86: limit amount of INT3 in IND_THUNK_*
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <62ffb078-d763-f845-c4b9-eeacb3358d02@suse.com>
 <4d66eb4d-4044-8b48-d7cc-354a236e6b26@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <5123f9c4-8a1f-6879-82f2-47afa0d48f64@citrix.com>
Date: Tue, 13 Oct 2020 13:58:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4d66eb4d-4044-8b48-d7cc-354a236e6b26@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 28/09/2020 13:32, Jan Beulich wrote:
> There's no point having every replacement variant to also specify the
> INT3 - just have it once in the base macro. When patching, NOPs will get
> inserted, which are fine to speculate through (until reaching the INT3).
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I also wonder whether the LFENCE in IND_THUNK_RETPOLINE couldn't be
> replaced by INT3 as well. Of course the effect will be marginal, as the
> size of the thunk will still be 16 bytes when including tail padding
> resulting from alignment.

There are surprising performance implications from the choice of
speculation blocker.  RSB filling in particular had a benefit (up to 6%
iirc) from unrolling the loop.

Any differences here are likely to be marginal, whereas for inline
retpoline, the code volume reduction might easily be the winning factor.

> ---
> v2: New.
>
> --- a/xen/arch/x86/indirect-thunk.S
> +++ b/xen/arch/x86/indirect-thunk.S
> @@ -11,6 +11,8 @@
>  
>  #include <asm/asm_defns.h>
>  
> +.purgem ret

This needs a comment.

~Andrew

