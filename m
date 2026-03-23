Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGEVFt0NwWngQAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 10:54:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2622EF6C2
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 10:54:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259133.1552447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4bzL-0006Ko-QG; Mon, 23 Mar 2026 09:54:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259133.1552447; Mon, 23 Mar 2026 09:54:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4bzL-0006JA-Mh; Mon, 23 Mar 2026 09:54:23 +0000
Received: by outflank-mailman (input) for mailman id 1259133;
 Mon, 23 Mar 2026 09:54:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+HLc=BX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w4bzJ-0006J0-RH
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 09:54:21 +0000
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4356ab68-269e-11f1-b166-2bf370ae4941;
 Mon, 23 Mar 2026 10:54:20 +0100 (CET)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-439b2965d4bso1787739f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 02:54:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48704f14441sm51581255e9.9.2026.03.23.02.54.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Mar 2026 02:54:19 -0700 (PDT)
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
X-Inumbo-ID: 4356ab68-269e-11f1-b166-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774259660; x=1774864460; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MkkAi4GPXI4BL/Ro10p8I+HRaEZcrEneOKdYbsdT9G8=;
        b=XvkhzO7hT1Bez8Bp4awHzRfxYJozoXhYUFXTa/gn2dwFnstSwVIn5yzszpA2dkQCq2
         VCLi0CnisJqm8DChK66H8QMc3eBp4K/KRK1WI8AjsEfWMdLMF72UiRpvLobA9CYdmbND
         CuXifbfNiKIMfZqGsLX3R9utBzoUlV3vYiUQe3ER1F34KQDnLfhyIJZeYxdR3/578Skm
         egxYUmCJJiqlocjoqdiU8oOghFz/vcK5j4tW57NkhlrRgKBmkdvFYk5qexyKt+AXkMk+
         KQvVZtDWX8r+isMIahxPnUi59sMxmlSJOGbSiseCwQbjCvaPDBs+aCrcc1FEl7vVktfr
         KiWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774259660; x=1774864460;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MkkAi4GPXI4BL/Ro10p8I+HRaEZcrEneOKdYbsdT9G8=;
        b=U1lsFT0S7CNpqrnB21txMpgSWWsnok9/nzJrGPT/8j0fPOFIKMoKj2HSCt5x5JYZHw
         VbZYpdOxOmiTSFfRhW5lq0dI3GpJloTyDMJUaW6pHFiWuSj2UW74eR4es6slyAkb7REY
         4cZ7gODrCnNe0Fr8464tePp9TVPNMmRabpoXd+YFVSTIT8FsJPqO2RSXg+GLkv/VSwx4
         0GT7YPOcJNJecR/PJnKOM3pRXbP2eQYGT87R5T8Dar6av6klauVZL/gI2bcMKLt1qPTl
         QqZfUE6VVX+edj5/STYmUUk5u6FGDknsk6IQ5BWaDdQAo1SFYgRrIGuVgkTHlilV8QGT
         yM7w==
X-Forwarded-Encrypted: i=1; AJvYcCXdgfgEQYWqSg289N3jIHGl+uIVQlkOwhCTHnf6wv37ZVLoUrRsmVaWT0dlvTAw7DYXa4ghyAt5AB4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwjUcNhl1Fj42vGhyxxOP5Z72DinA+Bk00/Vw4d8d6KuTDb0kn/
	5SyfQ7y8h/ZVuidi35MUQ1O40OV1pMgriYWUsREVgzXy3ukf/Vtk2EPLvHxMNS1oow==
X-Gm-Gg: ATEYQzzWAjoCyGwRVU40fYfveV6vMfbFkNTHb7W0OEEoq2kiRsmD0wG/UXyqYD/xJtr
	liqOfrI3xdSj8RCTT6FQcEQr5BZ/JyyldmjgtYaGCFs+V7WRLamCGCMMPVSZqS1V1If2o+V/DVO
	Ktgzjd71EnAZvR7aTM9O2XgG6Wyk1gVh0hdp9cVnGp1vceoJqNERO9ysPFgedDZ0kbEmVsycg5d
	o7UonpNQ849EbIi4dnYFCQUirMyFvCYo5u+6PIImzZL7E3oPJtCuMPZpvaQw3BSyYGBbmyb/+Nq
	4jJ+XbqnoIio99EmgS3eh0/7dEvVTWujALfVXIcLuDHnu9mru/rlnQfp1kq5RxVBffmoc3PKC5t
	DskDF1pWwj53MYSDO/Og4g1qUip/EYjKZxCxPBKofALVFil8+ZjLvAR6rcxzQ3qs6E/uX7ptjHX
	BfUJO5y5vw8PtGsUKhBDImeN/ups3+Jiw36A/xb6MrKqRbQL+rLjg1GAoFqu9brcXgZYbDdtiWg
	Ud6Pz0NbSZArhTJXMm3TWaLTQ==
X-Received: by 2002:a05:600c:8b83:b0:486:fa9c:185 with SMTP id 5b1f17b1804b1-486fee2ffd5mr149546015e9.31.1774259659574;
        Mon, 23 Mar 2026 02:54:19 -0700 (PDT)
Message-ID: <9c69f190-72e1-4ca2-bebe-4b92031fd26f@suse.com>
Date: Mon, 23 Mar 2026 10:54:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v v3 1/7] x86: relax some CPU checks for non-64 bit CPUs
To: Kevin Lampis <kevin.lampis@citrix.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org
References: <20260313163630.1073019-1-kevin.lampis@citrix.com>
 <20260313163630.1073019-2-kevin.lampis@citrix.com>
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
In-Reply-To: <20260313163630.1073019-2-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kevin.lampis@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: EE2622EF6C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13.03.2026 17:36, Kevin Lampis wrote:
> These checks were guarding against non-64 bit CPU models but they are
> not supported by Xen anymore so the checks are no longer needed.
> 
> The switch statement was removed from mcheck_init()
> to support Intel family 18/19.
> 
> Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


