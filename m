Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KKsIXZbe2nXEAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 14:07:02 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0B4B03F8
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 14:07:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216412.1526364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlRij-0002cg-VB; Thu, 29 Jan 2026 13:06:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216412.1526364; Thu, 29 Jan 2026 13:06:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlRij-0002ax-SA; Thu, 29 Jan 2026 13:06:01 +0000
Received: by outflank-mailman (input) for mailman id 1216412;
 Thu, 29 Jan 2026 13:06:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g1vo=AC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vlRii-0002ar-8H
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 13:06:00 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 409c2d7f-fd13-11f0-9ccf-f158ae23cfc8;
 Thu, 29 Jan 2026 14:05:58 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-47ff94b46afso8560335e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jan 2026 05:05:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066c428basm205808615e9.12.2026.01.29.05.05.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jan 2026 05:05:57 -0800 (PST)
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
X-Inumbo-ID: 409c2d7f-fd13-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769691957; x=1770296757; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=a3i8WqonQMKs9H/sjTYiUDanR10Xxf6OwmqHHveUfvg=;
        b=O1nZbU+m+d0UHxd9dqnlwlGMajwb1PD/9YGDPAiSPB+lNpREWRO3awTmO8CUL8XL/k
         x7irybHZl5PuFbdyGQQZUE9lzSwDWKjx3Sdv9AdN+C8E/ZLrB041QBVfPjS9uSUj8F4Z
         Gaz2sGc+nhtk229OE6N4uiDSSEYbtftD7BV0NpB/gDz1jVA06vyHQI11aslARBI0QBoL
         Mvv1OFeRxJiBCOisLd+2pSHAscliec2FvhZYqwR0deApL5zg7OucBBO4HENLEjpAG7pX
         YFDseJg2WbNhY7APT7tevZhnm4eeVG/QOhwvbFGkTy6klQJg7p3WwGLo1Al7N8Uy6s17
         XHGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769691957; x=1770296757;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a3i8WqonQMKs9H/sjTYiUDanR10Xxf6OwmqHHveUfvg=;
        b=N9ydEdClbHJYlT/Fvd2nnERoBfMhsdeVr++iJZ+FZ/TlyqA2yKTDA08ipVUakOuT20
         424257EtxvZ25phE1bVBAwcGk8FrepXpCdQNyhbSx+HaUKVNMVgdG5V7UlYtJkT/OHfR
         RKQLpMfzA531lcPFFZguvLL7MakRF9z7uv5CopfWWD6JCcaI6/QtC/JHI/BfB8H5G/Yv
         36uBvJgPJsh/xR/oDSnIVL/cW/oDZ6BmtxNJqkb4W8IZ0HMsISavMGKQQ7ylqDl8kr6o
         HE58UlFCXzL+cgdAKxpTc5LeLoP6pWeZ5pd3s/7cvhP25ednCqEeXAioSiR2HQlCCHZ8
         6R0g==
X-Gm-Message-State: AOJu0Yw/Q4h4GKCNAensY1m1IzqaNVjCszDl4hjiHi2NUUhyoeu20rAG
	9UQrA21uJKUNkTPOMf0v0a0kkgiaNMqMsRRk7FFaBs82u/ZSm0ckRzuXQ/JBKhKuL5x//gi+QU4
	Ime8=
X-Gm-Gg: AZuq6aL+Z7Td9Uho1ACPE63UXM+AO1ET/t1OQkAZKTYSYT/YySeJmHenhdX9FV+kb36
	sMcd5jdKCKdRdjl2kP1s9MpAIbeHbTxJE2AuPsOXtAwWnJbreg7NVMAgNdEfpjvLfpkYGeeU0La
	34UBoEc8CpCuo8QuI5SHa5soT2enz3P5V8maCOdKH4x4B4jSClo0OmKY2OyGLr70SsnqbItqzjr
	PHu/tG3O/+k3WiSm2Kixrrs+qNZ3lKbVPQGgtJSk5TkTiuZQGil3dZBJusi4O1Sc84v87xg9lkk
	9lul7n/bTrQNvwg2FAg0QapOhVo2Rw8FtdL9GfWRAcKftENo702LT8EGfZhur1ig+7izyc7Ru+x
	4GgTwgIAJKpkiXlBLI2+slWKc0dMSBE78XCZMmIfN2G2PXNVGyMidwQu983LVgPK46qfpKXHDKE
	Lee8TErhPyh1V4R89gZz0AV3eGql4lIoTc++En4bnZy9P4E1pOUzvJ/tj8MuWCnN5BcfmRThdi3
	2+4pK58aRflDA==
X-Received: by 2002:a05:600c:3143:b0:47e:e2b8:66e6 with SMTP id 5b1f17b1804b1-480829b1c51mr41191065e9.14.1769691957349;
        Thu, 29 Jan 2026 05:05:57 -0800 (PST)
Message-ID: <a67e69b8-c1e9-4448-adbd-17a19dfe13de@suse.com>
Date: Thu, 29 Jan 2026 14:05:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 0/6] (v)PCI: extended capability handling
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stewart Hildebrand <stewart.hildebrand@amd.com>
Content-Language: en-US
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 2E0B4B03F8
X-Rspamd-Action: no action

This is a follow-on to 'vPCI: avoid bogus "overlap in extended cap list"
warnings', addressing further issues noted there.

v3: Three new patches and some other re-work. See individual patches.

1: PCI: handle PCI->PCIe bridges as well in free_pdev()
2: PCI: determine whether a device has extended config space
3: PCI: don't look for ext-caps when there's no extended cfg space
4: vPCI/DomU: really no ext-caps without extended config space
5: x86/PCI: avoid re-evaluation of extended config space accessibility
6: vPCI: re-init extended-capability lists when MMCFG availability changed

Jan

