Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDFiN3BVwmnNbgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 10:12:16 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BECC30556A
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 10:12:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260165.1553524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4xnN-0007aS-Ue; Tue, 24 Mar 2026 09:11:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260165.1553524; Tue, 24 Mar 2026 09:11:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4xnN-0007YH-Ru; Tue, 24 Mar 2026 09:11:29 +0000
Received: by outflank-mailman (input) for mailman id 1260165;
 Tue, 24 Mar 2026 09:11:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w4xnL-0007YA-TM
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 09:11:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4xnK-005q6L-GW
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 10:11:26 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c2553a-5cb7-0a2a0a5109dd-0a2a4502e3b4-12
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 10:11:26 +0100
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c2553c-63bb-0a2a45020019-d155dd32d189-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 10:11:24 +0100
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-439fe4985efso3253841f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 02:11:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b64714decsm32874759f8f.31.2026.03.24.02.11.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2026 02:11:24 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774343484; x=1774948284; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LUYv0lo+bI9qydu+AFKFxYiD/hyH7p+5ptOyBoQnNas=;
        b=DrjFa8POBJOH60U0f0gTtfZq6qtpZBJy7lQBQbUJy89Z3f0EvvlWJJHZfebalfwX1c
         FOT/ewdTH7OzMyzJU6haC6Ttu+Zrl/ui1xbgkXNc1cAGDQk29ChuM9cfKrAllVKoTy/g
         Wgkzy4w/GVKkz1Y7FIWdQbVrglbZ3wg/TZtsoho7OtLLlBo3116uYY6LVZL18XD9xGko
         dbMw3sXLgr1BY7olPX86HTWj32zzQC2n6NV8G3TJrMLdxNEykrM7LgsN1YNGdRQloLWD
         8hFW8sF0mbaC9BZjD98Mw2X6BMjwMCnKM+L6jLJ02t9nYrrNmZ4n12TquEe0AsxzrmBK
         fNUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774343484; x=1774948284;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LUYv0lo+bI9qydu+AFKFxYiD/hyH7p+5ptOyBoQnNas=;
        b=WcTSeF7kywVjHnag4yzLAto7ueA26kMCiP3Bo4z/6vVAUSR3iJiKwM8N1RmlHIf0za
         tD8uFBAXZZBf2Ukraxnas5pKV/CbFwGmzSeowoiAsjXdhyWFoKmuiW22h4kbHZBCnAWX
         uATrx/M3BibyhHGYDMsmWP8PVHrOhILQjcRY1+DesbHXeNOxEX2ltwvMN16Ufmh7/sgP
         ARVhXg1P25Xi9+INsmlfVU9ElIp2rnW2LgpuMaX66tFPDTfP8bDHYnSLXfGP15VGUgiZ
         /pYsOuWpVQAImOtP1K5c/lbd+cP2SR6QKlOAbeopXCQjqlSGMuL8tkXkHrHO+ijqS02Z
         2Emg==
X-Forwarded-Encrypted: i=1; AJvYcCV+P4kloJhrzgXP7PO1vIzs126ZmUrYrq7H6E44JjE2uCZ3IYAs3bebYzQxRwU0+aUaHcbQNRqKEII=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx/+DUb4XxkTGfn8xF6QDkkOyW9l0ApUfbN2GmP11Ei5HDCceH9
	hJxB1PaHq+o4OhsSrALThKNiNlhzpqroDuo6oE2Gj+UCy5NpG4suZgi+0cMtHzxkFg==
X-Gm-Gg: ATEYQzxhanSnZSvR9VAhyZ818VWXwMxzqfAWbtrpXjETPwE6wyPmk7nWlfVLuWY2FEm
	A5Zxl1V5Z4BOoMDi+hA0mxlNi+bTVhli27xlc1wuFKLa198F9KvsUzDkRSN/+Rl1jjqh8UKHZYK
	YlO1FIzaEoBDitsxI9lePkNLBoFkIiqXxd6Aos8IqbA6pMwMLRjqbsxhyVsY11wFQei8wopaJbj
	C/fPWmXy36RPMSiWYCxQvYnl6iqUo4+yuXC+b/90DbmqSNXMDsqkdWPMNV/gxlANO6qhQOPwgO9
	6U0WtYakDSgDaZEClFJ3eyIWG8c5Y7ysrkQ1k0G5RrQJWPECu5SK6xKwatF3QkxWSX2fq15mHen
	0Zz3Q4vsPkQhaeUyYsjIuQX24cBoRNqxwQGSdzb6jluIyROHax7KWaTP+moLbWzf3iii1HzO0YS
	s1ypnK6M0BAzRUB81fAuYdh+duxSNk0s5KPBU6CKV6T12h2wadrh8EPXQRwxUlhiPyEUBeqWRxw
	CuUIoJCeQbPJ5g9sRN2fXD7GA==
X-Received: by 2002:a05:6000:2484:b0:43b:4396:674c with SMTP id ffacd0b85a97d-43b6427d7a6mr22588856f8f.55.1774343484304;
        Tue, 24 Mar 2026 02:11:24 -0700 (PDT)
Message-ID: <7e4be441-c0ae-498f-9fdf-e5ea8bf11e48@suse.com>
Date: Tue, 24 Mar 2026 10:11:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] x86/vpmu: Expose PEBS and DS area in PV mode
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1773160025.git.teddy.astie@vates.tech>
 <0762ceb722be83bbdf6703cf419debf30609feb0.1773160025.git.teddy.astie@vates.tech>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <0762ceb722be83bbdf6703cf419debf30609feb0.1773160025.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1774343484-BF48FDB8-C73F42A2/0/0
X-purgate-type: clean
X-purgate-size: 750
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3BECC30556A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10.03.2026 17:44, Teddy Astie wrote:
> I don't see any reason for them for not be available, especially
> since core2_vpmu_do_wrmsr has PV specific logic for MSR_IA32_DS_AREA.

This is really dangerous: You allow PV domains to control whether the area
is actually mapped. It lacking a mapping can, iirc, on at least some CPUs
result in a complete hang. I do, in fact, have been carrying a patch to
completely disallow DS area use for PV, eliminating the misleading code
you refer to.

Also note that VPMU_CPU_HAS_DS cannot be set for PV vCPU-s anyway.

> Fixes: 27c554198666 ("x86/VPMU: add support for PMU register handling on PV guests")

Not just because of the above, I'm pretty sure a Fixes: tag is inappropriate
here.

Jan

