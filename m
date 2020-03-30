Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 041441978A6
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2020 12:16:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIrO6-0007p6-Vj; Mon, 30 Mar 2020 10:11:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vI0s=5P=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jIrO5-0007p1-BO
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 10:11:21 +0000
X-Inumbo-ID: cd3a0ea4-726e-11ea-83d8-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cd3a0ea4-726e-11ea-83d8-bc764e2007e4;
 Mon, 30 Mar 2020 10:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585563080;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=NDo6I+6A54wK2qjDDGPHPIznmLAZnduq8mtNYI2qZy4=;
 b=Pw59v7nx+W5pXJ3QQQxPeRTgEvg8wKIuVKWaWRGs9qEs5p0hb9/gdXWj
 6DK39R4DisZF9w9WgtcYr1koS/OKOcdyNlJpUGQNmSSuZkX+JjEQra3tu
 8uyMkHfCDEx7g2AvCHgGnWaGDXUuLRtIprhlXpJlZTHz/7qz9anfm+wMI A=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: H2S3hudkAHzFnhlx3zkx1Xse6jEwiaaDEjBgSs6whx+v8vp7HoC3DHv6IDyLKYV11n2WBr9dwc
 nzphRLIEPMfVbZJLN2pd45VEfE+1aIHNcZ1XNugzRc/+cjhiMlgZ7wBDlbRuuKqvGMursUH3Ck
 Z6reWjJZKLBPvBK3gw+clsCJHEJh6QZG7ICuRbjOk6ubVTdnlRWR+w0ifg0fRuj4i3VJCFZAhy
 RW2au367K6HEAcI861e1ilucC461N3jlLEyN99FJn2sKarzcRRp67vddXoFrt6k7jfK6AIDk4Y
 ToQ=
X-SBRS: 2.7
X-MesageID: 15176364
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,323,1580792400"; d="scan'208";a="15176364"
Date: Mon, 30 Mar 2020 12:11:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Simran Singhal <singhalsimran0@gmail.com>
Message-ID: <20200330101113.GP28601@Air-de-Roger>
References: <20200329045512.GA28203@simran-Inspiron-5558>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200329045512.GA28203@simran-Inspiron-5558>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2] xen/x86: Remove unnecessary cast on void
 pointer
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sun, Mar 29, 2020 at 10:25:12AM +0530, Simran Singhal wrote:
> diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
> index f049920196..2edb103205 100644
> --- a/xen/arch/x86/hvm/vmx/vvmx.c
> +++ b/xen/arch/x86/hvm/vmx/vvmx.c
> @@ -253,12 +253,12 @@ static int vvmcs_offset(u32 width, u32 type, u32 index)
>      return offset;
>  }
>  
> -u64 get_vvmcs_virtual(void *vvmcs, u32 vmcs_encoding)
> +uint64_t get_vvmcs_virtual(void *vvmcs, uint32_t vmcs_encoding)
>  {
>      union vmcs_encoding enc;
> -    u64 *content = (u64 *) vvmcs;
> +    uint64_t *content = vvmcs;
>      int offset;
> -    u64 res;
> +    uint64_t res;
>  
>      enc.word = vmcs_encoding;
>      offset = vvmcs_offset(enc.width, enc.type, enc.index);
> @@ -307,12 +307,12 @@ enum vmx_insn_errno get_vvmcs_real_safe(const struct vcpu *v, u32 encoding,
>      return virtual_vmcs_vmread_safe(v, encoding, val);
>  }
>  
> -void set_vvmcs_virtual(void *vvmcs, u32 vmcs_encoding, u64 val)
> +void set_vvmcs_virtual(void *vvmcs, uint32_t vmcs_encoding, uint64_t val)
>  {
>      union vmcs_encoding enc;
> -    u64 *content = (u64 *) vvmcs;
> +    uint64_t *content = vvmcs;
>      int offset;
> -    u64 res;
> +    uint64_t res;

Thanks for doing the switch of content to type uint64_t. You should
however not change the type of res to uint64_t also IMO, as you are
not touching that line anyway.

With that fixed:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks!

