Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mA6EBy6QHmpTlAkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 10:11:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7439262A421
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 10:11:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1324537.1590066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUKCj-00078S-L1; Tue, 02 Jun 2026 08:10:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324537.1590066; Tue, 02 Jun 2026 08:10:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUKCj-00076D-IC; Tue, 02 Jun 2026 08:10:29 +0000
Received: by outflank-mailman (input) for mailman id 1324537;
 Tue, 02 Jun 2026 08:10:28 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUKCi-000767-O0
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 08:10:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUKCi-002Kvh-1N
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 10:10:28 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1e8ff3-e002-0a2a0a5209dd-0a2a450b9664-6
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 10:10:27 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1e8ff3-212f-0a2a450b0019-d1558031d10d-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 10:10:27 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-490ace40f4bso18189875e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 01:10:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b0daefbbsm83827365e9.0.2026.06.02.01.10.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 01:10:26 -0700 (PDT)
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
        d=suse.com; s=google; t=1780387827; x=1780992627; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ntSmeBB7M9YoPDLloTHlNm/+hIUx1/s2n4T5OhegxC8=;
        b=f5omMzd0I80Fc6Wz9qLmqjs/8ncFedaBfRZ40OmmdSBMHD8wQAFtd/8pQmmv43tykd
         ZZiWhQ9hEAFu6oZgEjau7Yv6dMJ/P5exz+MelWBDUim0Fp6jmTN2kZhWjKBT3V0G93g7
         dvAFBVmkSw1jgixUGvIJ7ntt95Y4X2SOSLaKZGtHyix4KfVzhHwIrbed5hfAaOw42pH+
         793cAUPA5oAobvR7n45H8xWdN444GTTubxRQP2xUPGcvNWiQqCamG71i7o3/hDMtiWJ7
         tI3oeELLESS0zzNrd2fm1TtOVNISQMOfq/nfCL1gynKQywjR/iWmGX74FGBC2cPL+0Dc
         gYEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780387827; x=1780992627;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntSmeBB7M9YoPDLloTHlNm/+hIUx1/s2n4T5OhegxC8=;
        b=dHvyhxxqz2Kp+1gWiDuEbCScdAeh/4ec6htUAmQ5+Z9PSoZnM7D8+q1uPjlD+IGC9T
         evbZIM6UNl0Np0SfVxngQzFVKuAW2f1rPUhlGxaiVNfGpWLLoRwzBGt78+V+P1oodyRM
         GYkv/VmZo3J5wNkK4GIm21qej4+CymPN4yPDHLl8y9yDLNcNtcrn8196u5Fwv9ya6Bj+
         h+7hxw4oF69Tj49bZb0JGfoxFvbYUxIsUaXc1XkPdEZnhreB4LSDzFYA3JIZljAY1Z//
         gc9sDtx/VgHk7KLPyYty90ROVyEcQr7u/BWeWmjTRf0ljSmKcB/y6Zz17NANQWpedIwC
         gqyQ==
X-Forwarded-Encrypted: i=1; AFNElJ9zpaB+S3foGrn8tVh5Tfr+vRppNANrsjVi+m8h3uvAXcd8aoyCrA9QnnJHp6kCmXqWe62Pr7W8ohg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyKW4q5C7+nybRljvU10cyQyW1XLKhkItkDuGfDm3N3T5mLfobq
	440uoZq4JGlosDBMW45ShNM8SonU9Kqkf6LgoFZ/DE2bd/PqKBTDa/aLoATHTCaDvQ==
X-Gm-Gg: Acq92OEdsbKUUY6DRnC1kIcrwRdhccRaaiD4ZcwtMIK/Wl0b1+AAKyzdjjK2E5SLr80
	3T8Odxme27cgtKYHVWMPNSqXmiQXM2kZ2++/8nvGQylSMEsqq49fg7sXWAhuf8LayUH3Od0+9ge
	WpMfHjZYtpI1q7l32hq34IPt5fL4NDeiFOK4xxbVAJKCkGCgPedaApEvsuBHYYD9j0GGOTKqNnW
	9+bn8oXPGBEVbl28x/39FrfYv2mXEjjXgmAwzkL4A2WPdxFTnLsivX1lCWTmttbiKfUx6Nj0NQ1
	0hjNJtMOwvoZLjH1e6rr8n0cZeRZEUyRNSKnSptUVStEf2t/w+4qElSUynOQFrQqBkzxf0BEgpO
	mz3N8rzq2bgacc0bp9orvDJ8dKI0uaVmylARdhaFThaW/2tN2AzufcqXMg7ZAYAcN8ruH8ZUeOn
	Y5yQaPIBnJ8vthcjTya2NpnCMhmdtR9RLeYkNEBBy5Y63vcVfWMmB2OmC58qqpqWAVC0hwKxyzE
	l1oQZVdNzZwnnG7Ipl2c2LMzw==
X-Received: by 2002:a05:600c:8b57:b0:490:3c15:7146 with SMTP id 5b1f17b1804b1-490a5013670mr225647675e9.19.1780387827243;
        Tue, 02 Jun 2026 01:10:27 -0700 (PDT)
Message-ID: <efd6830e-493b-462a-aba7-d56d85943aa3@suse.com>
Date: Tue, 2 Jun 2026 10:10:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/3] tools/ocaml: Add OCaml binding for NUMA claim sets
To: Bernhard Kaindl <bernhard.kaindl@citrix.com>
Cc: Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Christian Lindig <christian.lindig@cloud.com>,
 Andrew Cooper <andrew.cooper@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1778272036.git.bernhard.kaindl@citrix.com>
 <10726c7afb43856a1014c6b6e24700442ff8740e.1778272036.git.bernhard.kaindl@citrix.com>
 <b60c1209-fdaf-4e9a-b93a-878a3aeb64fc@suse.com>
 <LV3PR03MB7707CEA80CEC74939A6E508187092@LV3PR03MB7707.namprd03.prod.outlook.com>
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
In-Reply-To: <LV3PR03MB7707CEA80CEC74939A6E508187092@LV3PR03MB7707.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1780387827-21382F3B-A8E9AB31/0/0
X-purgate-type: clean
X-purgate-size: 1670
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bernhard.kaindl@citrix.com,m:christian.lindig@citrix.com,m:dave@recoil.org,m:anthony.perard@vates.tech,m:christian.lindig@cloud.com,m:andrew.cooper@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,citrix.com:email];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7439262A421
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 28.05.2026 10:37, Bernhard Kaindl wrote:
>> -----Original Message-----
>>> Acked-by: Christian Lindig <christian.lindig@cloud.com>
>>> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
>>
>> Nit: Chronologically order tags, please: Christian can't have ack-ed
>> this before you signed off on it.
> 
> Hi Jan, as this was the last patch in this series,
> 
> I assume you found no reason which can't be fixed on merge for this
> series and you can ack it? (I think item could be fixed on merge)

Why would I ack an OCaml patch?

As to fixing while committing - perhaps that's easily possible here, but
(a) I wouldn't commit this (tools) patch on its own and (b) the other
two patches look to still be pending (with me just having returned from
a week of PTO I still didn't get around to read xen-develq, though).
However, edits upon committing is strictly an offer by the committer. It
shouldn't normally be the submitter to be asking for such.

> If you could, please do so, otherwise could I you expedite your review
> of it?

Expedite review of what? As this isn't the first time to try to apply
pressure for me to review your patches: May I please ask that you don't?
Your patches aren't any different from patches by others.

> At lot of further NUMA work depends on it, and it as it has been posted
> in this or very similar form before the deadlines for Xen 4.22, it would
> be nice if it could be considered for merge.

Again, without having read xen-devel@ yet, it was my understanding
(assumption) that the NUMA work has missed the 4.22 window.

Jan

