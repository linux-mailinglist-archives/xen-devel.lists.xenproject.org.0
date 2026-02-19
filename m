Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJP5N//tlmngrAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 12:03:27 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E8715E223
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 12:03:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236122.1538884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt1oQ-0007YC-19; Thu, 19 Feb 2026 11:03:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236122.1538884; Thu, 19 Feb 2026 11:03:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt1oP-0007VI-UZ; Thu, 19 Feb 2026 11:03:13 +0000
Received: by outflank-mailman (input) for mailman id 1236122;
 Thu, 19 Feb 2026 11:03:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zdoi=AX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vt1oP-0007VC-0v
 for xen-devel@lists.xenproject.org; Thu, 19 Feb 2026 11:03:13 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94b94a99-0d82-11f1-b164-2bf370ae4941;
 Thu, 19 Feb 2026 12:03:11 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-6580dbdb41eso958264a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 19 Feb 2026 03:03:11 -0800 (PST)
Received: from ?IPV6:2a00:12d0:af5b:2f01:4042:c03:ce4d:a5a1?
 (2a00-12d0-af5b-2f01-4042-c03-ce4d-a5a1.ip.tng.de.
 [2a00:12d0:af5b:2f01:4042:c03:ce4d:a5a1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc763bacfsm563417766b.36.2026.02.19.03.03.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Feb 2026 03:03:10 -0800 (PST)
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
X-Inumbo-ID: 94b94a99-0d82-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771498991; x=1772103791; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6CFVVZ0e+fgUSIGgmwfWBMGl5JxSWh26xJ8QLV3kzqI=;
        b=fnziC0U+D7FNENp4umc6FAAGzlWaodAFodS/WkGhu9YHfYMe//BRk9t8lFw4h14bIY
         rkpOzIxMn7a0497R+yh4dfN8i0YAgkBQYi113QvuG0eXLxemBjuHcdad5qYt7B6KkngS
         tsQMiwe73ZiwvWnueK47NBD0mnBaMCSpzRV416uXeynXzXuQ1CfiN6zW5OmcbMa3ZcH1
         I/BIoeMqUF5And7/Cnylypb7w+lFc8QhJgT/dOQFGjhjf8QvWUSAdlkg+7Hmy6eqoHtz
         n0UIskwlsk+rViy0lwi9Xl79JWgWX0MzeVpMbPLIT3xL/cDx9nGikXV72q2UidAUGE7b
         2lmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771498991; x=1772103791;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6CFVVZ0e+fgUSIGgmwfWBMGl5JxSWh26xJ8QLV3kzqI=;
        b=vS/OXhsM8TYLkz9LfiewFfWxw7+Hujz7MCaxJjWuvFR07bNz8ny8rLm2OF+5nCI40Q
         OS7qqWxHh7EW9UXuqdS2GEaznCrdpbtFT90D/cnOheldhuu3ozil5+hA0yMqCAQdEuiV
         1bPl35W3ZC1NJEKgc7vK/NgCNREnu4PwxT9XIADV7g1GOqgx6XMC8Pw26ZZTZ/foOrEE
         qRmonhgJQYxplGwCf2/dCm07QfHBEgPFcFalJdklrQLNYAtlaHM8ergryI8xRAHggdDc
         CVj3UPPF0ASbsEKdUxG2TghOWYY2fTYnqqIeAbsqqTtc4Xb2sh5VsXp2vXIX6wPlpaGn
         Y/aQ==
X-Forwarded-Encrypted: i=1; AJvYcCWq7LfPejCROFPMt76VHhX+B0qCt7onYuq7XTZXvOaLF5bSIiuFUSgY6l9xfy76utc8lsEFxcMBYLM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxp9TErgwACzR6zWaEEJ4C8vbxVNwOyw8h5uIOBRlLCDL8j4IOq
	8YGoP/DuQum0E5C2uiBx/JwIKg/4eP+T0Q+gd6b/fWqnLlSt5oOq790JLnfpAhM9qyk=
X-Gm-Gg: AZuq6aLe4QDBopYdDEuy8YiRHgt9Ar/t5XbmHlo+S/I9Xcl1rm7qMcIFeJ7cwSUEpaT
	gp4IjfHQhqgO1IqQwsKQTGigAFkvCifmIEFx83C27MN/dYzb7pBzD1PHsFunkOM4MOQZs50UnjC
	YYPidlDk53EFo6Whsz80ppJRV01rAehBu8hVDPDaQafSmokoMaunkybSBST+1Mpk6jju5fG3dhX
	4yrdU+aL8uy2lCx+hpdmZlCxZnKrwURN8jcpE9NLsx38Xjs1ilrkYkjIlLFEGUgUuCqpydmfZL/
	OI956qdr30RzkrE91X0FUtJuYdwYNJREK1ngPJnqQIwPn6y79R7CsDnCH/FaYJplgigo5Fq+Q8t
	EfADcDDMuLagy/hjcsPsqjFdDK0L01UJYFXjSJVRQQXXJZT91ZxWhXdjvo+xJ9VFgJSdHi/KjsD
	chSqz8KGsbcczvZXe2Fc1uQBlr1Bj16AB2UJohXZYuWwC/Ls8GK55FcRB3H+JBH9HkIqTv7LfPB
	hJFCywQEqx8snU+sWTc389tGHDN3Ky7PfAIZmpJ2Am3+N/WvVLAqZ/k2Gxf
X-Received: by 2002:a17:907:3fa0:b0:b87:c92:25bf with SMTP id a640c23a62f3a-b903dc90367mr360320666b.33.1771498990858;
        Thu, 19 Feb 2026 03:03:10 -0800 (PST)
Message-ID: <a13a45a1-9da4-4fab-9d5d-59ac06ea7b23@suse.com>
Date: Thu, 19 Feb 2026 12:03:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG v2] common/domctl: xsm update for get_domain_state access
To: Jan Beulich <jbeulich@suse.com>, Jason Andryuk <jason.andryuk@amd.com>
Cc: Chris Rogers <rogersc@ainfosec.com>,
 Dmytro Firsov <dmytro_firsov@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20260218190855.7272-1-dpsmith@apertussolutions.com>
 <1b0a2f66-e03d-4428-a9c0-f26f84e7f348@amd.com>
 <fd69b278-6e7d-46b0-95ac-fff3926b1c4f@suse.com>
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <fd69b278-6e7d-46b0-95ac-fff3926b1c4f@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------fVcjL7tDyLmtviyNFhIpRlCM"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:jason.andryuk@amd.com,m:rogersc@ainfosec.com,m:dmytro_firsov@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ATTACHMENT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 57E8715E223
X-Rspamd-Action: no action

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------fVcjL7tDyLmtviyNFhIpRlCM
Content-Type: multipart/mixed; boundary="------------Uqq6ry7BW0mSsmCrqc0Frrvi";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Jason Andryuk <jason.andryuk@amd.com>
Cc: Chris Rogers <rogersc@ainfosec.com>,
 Dmytro Firsov <dmytro_firsov@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Message-ID: <a13a45a1-9da4-4fab-9d5d-59ac06ea7b23@suse.com>
Subject: Re: [BUG v2] common/domctl: xsm update for get_domain_state access
References: <20260218190855.7272-1-dpsmith@apertussolutions.com>
 <1b0a2f66-e03d-4428-a9c0-f26f84e7f348@amd.com>
 <fd69b278-6e7d-46b0-95ac-fff3926b1c4f@suse.com>
In-Reply-To: <fd69b278-6e7d-46b0-95ac-fff3926b1c4f@suse.com>
Autocrypt-Gossip: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJ3BBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AAIQkQoDSui/t3IH4WIQQ+pJkfkcoLMCa4X6CgNK6L+3cgfgn7AJ9DmMd0SMJE
 ePbc7/m22D2v04iu7ACffXTdZQhNl557tJuDXZSBxDmW/tLOwU0EWTecRBAIAIK5OMKMU5R2
 Lk2bbjgX7vyQuCFFyKf9rC/4itNwhYWFSlKzVj3WJBDsoi2KvPm7AI+XB6NIkNAkshL5C0kd
 pcNd5Xo0jRR5/WE/bT7LyrJ0OJWS/qUit5eNNvsO+SxGAk28KRa1ieVLeZi9D03NL0+HIAtZ
 tecfqwgl3Y72UpLUyt+r7LQhcI/XR5IUUaD4C/chB4Vq2QkDKO7Q8+2HJOrFIjiVli4lU+Sf
 OBp64m//Y1xys++Z4ODoKh7tkh5DxiO3QBHG7bHK0CSQsJ6XUvPVYubAuy1XfSDzSeSBl//C
 v78Fclb+gi9GWidSTG/4hsEzd1fY5XwCZG/XJJY9M/sAAwUH/09Ar9W2U1Qm+DwZeP2ii3Ou
 14Z9VlVVPhcEmR/AFykL9dw/OV2O/7cdi52+l00reUu6Nd4Dl8s4f5n8b1YFzmkVVIyhwjvU
 jxtPyUgDOt6DRa+RaDlXZZmxQyWcMv2anAgYWGVszeB8Myzsw8y7xhBEVV1S+1KloCzw4V8Z
 DSJrcsZlyMDoiTb7FyqxwQnM0f6qHxWbmOOnbzJmBqpNpFuDcz/4xNsymJylm6oXiucHQBAP
 Xb/cE1YNHpuaH4SRhIxwQilCYEznWowQphNAbJtEKOmcocY7EbSt8VjXTzmYENkIfkrHRyXQ
 dUm5AoL51XZljkCqNwrADGkTvkwsWSvCSQQYEQIACQUCWTecRAIbDAAKCRCgNK6L+3cgfuef
 AJ9wlZQNQUp0KwEf8Tl37RmcxCL4bQCcC5alCSMzUBJ5DBIcR4BY+CyQFAs=

--------------Uqq6ry7BW0mSsmCrqc0Frrvi
Content-Type: multipart/mixed; boundary="------------GjJX9a8xbqtz5xTDZxOw5Bma"

--------------GjJX9a8xbqtz5xTDZxOw5Bma
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTkuMDIuMjYgMTE6NTIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxOS4wMi4yMDI2
IDAwOjA0LCBKYXNvbiBBbmRyeXVrIHdyb3RlOg0KPj4gT24gMjAyNi0wMi0xOCAxNDowOCwg
RGFuaWVsIFAuIFNtaXRoIHdyb3RlOg0KPj4+IC0tLSBhL3hlbi9jb21tb24vZG9tYWluLmMN
Cj4+PiArKysgYi94ZW4vY29tbW9uL2RvbWFpbi5jDQo+Pj4gQEAgLTIxMCw3ICsyMTAsNyBA
QCBzdGF0aWMgdm9pZCBzZXRfZG9tYWluX3N0YXRlX2luZm8oc3RydWN0IHhlbl9kb21jdGxf
Z2V0X2RvbWFpbl9zdGF0ZSAqaW5mbywNCj4+PiAgICBpbnQgZ2V0X2RvbWFpbl9zdGF0ZShz
dHJ1Y3QgeGVuX2RvbWN0bF9nZXRfZG9tYWluX3N0YXRlICppbmZvLCBzdHJ1Y3QgZG9tYWlu
ICpkLA0KPj4+ICAgICAgICAgICAgICAgICAgICAgICAgIGRvbWlkX3QgKmRvbWlkKQ0KPj4+
ICAgIHsNCj4+PiAtICAgIHVuc2lnbmVkIGludCBkb207DQo+Pj4gKyAgICB1bnNpZ25lZCBp
bnQgZG9tID0gLTE7DQo+Pj4gICAgICAgIGludCByYyA9IC1FTk9FTlQ7DQo+Pj4gICAgICAg
IHN0cnVjdCBkb21haW4gKmhkbDsNCj4+PiAgICANCj4+PiBAQCAtMjE5LDYgKzIxOSwxMCBA
QCBpbnQgZ2V0X2RvbWFpbl9zdGF0ZShzdHJ1Y3QgeGVuX2RvbWN0bF9nZXRfZG9tYWluX3N0
YXRlICppbmZvLCBzdHJ1Y3QgZG9tYWluICpkLA0KPj4+ICAgIA0KPj4+ICAgICAgICBpZiAo
IGQgKQ0KPj4+ICAgICAgICB7DQo+Pj4gKyAgICAgICAgcmMgPSB4c21fZ2V0X2RvbWFpbl9z
dGF0ZShYU01fWFNfUFJJViwgZCk7DQo+Pj4gKyAgICAgICAgaWYgKCByYyApDQo+Pj4gKyAg
ICAgICAgICAgIHJldHVybiByYzsNCj4+PiArDQo+Pj4gICAgICAgICAgICBzZXRfZG9tYWlu
X3N0YXRlX2luZm8oaW5mbywgZCk7DQo+Pj4gICAgDQo+Pj4gICAgICAgICAgICByZXR1cm4g
MDsNCj4+PiBAQCAtMjM4LDI4ICsyNDIsMzkgQEAgaW50IGdldF9kb21haW5fc3RhdGUoc3Ry
dWN0IHhlbl9kb21jdGxfZ2V0X2RvbWFpbl9zdGF0ZSAqaW5mbywgc3RydWN0IGRvbWFpbiAq
ZCwNCj4+DQo+PiBCZXR3ZWVuIHRoZSB0d28gaHVua3MgaXMgdGhpczoNCj4+DQo+PiAgICAg
ICBoZGwgPSBsb2NrX2RvbV9leGNfaGFuZGxlcigpOw0KPj4NCj4+ICAgICAgIC8qDQo+PiAg
ICAgICAgKiBPbmx5IGRvbWFpbiByZWdpc3RlcmVkIGZvciBWSVJRX0RPTV9FWEMgZXZlbnQg
aXMgYWxsb3dlZCB0byBxdWVyeQ0KPj4gICAgICAgICogZG9tYWlucyBoYXZpbmcgY2hhbmdl
ZCBzdGF0ZS4NCj4+ICAgICAgICAqLw0KPj4gICAgICAgaWYgKCBjdXJyZW50LT5kb21haW4g
IT0gaGRsICkNCj4+ICAgICAgIHsNCj4+ICAgICAgICAgICByYyA9IC1FQUNDRVM7DQo+PiAg
ICAgICAgICAgZ290byBvdXQ7DQo+PiAgICAgICB9DQo+Pg0KPj4gU28gaXQgaXMgb25seSB0
aGUgZG9tYWluIHdpdGggVklSUV9ET01fRVhDIHRoYXQgY2FuIGVudGVyIHRoZSB3aGlsZSBs
b29wOg0KPj4NCj4+PiAgICANCj4+PiAgICAgICAgd2hpbGUgKCBkb21fc3RhdGVfY2hhbmdl
ZCApDQo+Pj4gICAgICAgIHsNCj4+PiAtICAgICAgICBkb20gPSBmaW5kX2ZpcnN0X2JpdChk
b21fc3RhdGVfY2hhbmdlZCwgRE9NSURfTUFTSyArIDEpOw0KPj4+ICsgICAgICAgIGRvbSA9
IGZpbmRfbmV4dF9iaXQoZG9tX3N0YXRlX2NoYW5nZWQsIERPTUlEX01BU0sgKyAxLCBkb20g
KyAxKTsNCj4+PiAgICAgICAgICAgIGlmICggZG9tID49IERPTUlEX0ZJUlNUX1JFU0VSVkVE
ICkNCj4+PiAgICAgICAgICAgICAgICBicmVhazsNCj4+PiArDQo+Pj4gKyAgICAgICAgZCA9
IHJjdV9sb2NrX2RvbWFpbl9ieV9pZChkb20pOw0KPj4+ICsgICAgICAgIGlmICggZCAmJiB4
c21fZ2V0X2RvbWFpbl9zdGF0ZShYU01fWFNfUFJJViwgZCkgKQ0KPj4NCj4+IC4uLiBpZiB0
aGUgVklSUV9ET01fRVhDIG93bmVyIGlzIGRlbmllZCBmb3IgZG9tYWluIGQgLi4uDQo+Pg0K
Pj4+ICsgICAgICAgIHsNCj4+PiArICAgICAgICAgICAgcmN1X3VubG9ja19kb21haW4oZCk7
DQo+Pj4gKyAgICAgICAgICAgIGQgPSBOVUxMOw0KPj4+ICsgICAgICAgICAgICBjb250aW51
ZTsNCj4+DQo+PiAuLi4gdGhlIGNhbGxlciB3b3VsZCBjb250aW51ZSAuLi4NCj4+DQo+Pj4g
KyAgICAgICAgfQ0KPj4+ICsNCj4+PiAgICAgICAgICAgIGlmICggdGVzdF9hbmRfY2xlYXJf
Yml0KGRvbSwgZG9tX3N0YXRlX2NoYW5nZWQpICkNCj4+DQo+PiAuLi4gYW5kIHRoaXMgYml0
IHdvdWxkIG5ldmVyIGJlIGNsZWFyZWQuICBTaG91bGQgdGhlIFZJUlFfRE9NX0VYQyBvd25l
cg0KPj4gYWx3YXlzIGdldCB0byBjbGVhciB0aGUgYml0IGV2ZW4gaWYgaXQgY2Fubm90IHNl
ZSB0aGUgcmVzdWx0Pw0KPiANCj4gSSBkb24ndCB0aGluayBzbywgbm8uIFdoZW5ldmVyIGEg
bGVnaXRpbWF0ZSBjb25zdW1lciBvY2N1cnMgKHRoZSBvd25lciBvZg0KPiBWSVJRX0RPTV9F
WEMgY2FuIGNoYW5nZSwgYWZ0ZXIgYWxsKSwgaXQnbGwgdGhlbiBjb25zdW1lIHRoZSBiaXRz
IGFzIG5lZWRlZC4NCj4gTW9yZSBnZW5lcmFsbHksIEkgdGhpbmsgd2UncmUgYmV0dGVyIG9m
ZiBub3QgbWFraW5nIHRoZSBjb2RlIGhlcmUgZGVwZW5kDQo+IHRvbyBtdWNoIG9uIHRoYXQg
c3BlY2lhbCBWSVJRX0RPTV9FWEMgcHJvcGVydHkuDQoNCk9UT0ggYSBuZXcgVklSUV9ET01f
RVhDIG93bmVyIHdpbGwgcmVzdWx0IGluIGEgY29tcGxldGUgcmVzZXQgb2YgdGhlIGJpdG1h
cA0KYW55d2F5ICh0aGF0IGlzOiB0aGUgYml0cyBmb3IgYWxsIGV4aXN0aW5nIGRvbWFpbnMg
d2lsbCBiZSBzZXQsIHdoaWxlIGFsbA0Kb3RoZXJzIHdpbGwgYmUgY2xlYXJlZCkuDQoNCg0K
SnVlcmdlbg0K
--------------GjJX9a8xbqtz5xTDZxOw5Bma
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------GjJX9a8xbqtz5xTDZxOw5Bma--

--------------Uqq6ry7BW0mSsmCrqc0Frrvi--

--------------fVcjL7tDyLmtviyNFhIpRlCM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmmW7e0FAwAAAAAACgkQsN6d1ii/Ey/X
nQf/SQ/VihRl0VSCpIHPg07wF7m42LTfBWyT4SUGdEkZycFQlUns6fow2kRmm5tNB4VdgTxbWIEI
oPWpLfbRt+qpadOa8QmJmR4farjCnRQ9FDxN2XlcwByT4CGIpIqGZ+++jfdfOXLpJwma+LtkuBPn
5ETSOXB5Pc0qY5o0uGIkdRanfSCOXUTAFSgCXeSMYPcuwYh8+PpaJhGe5MUaaTTyrz8vKSZC7iBU
zoge6P3/eW9ev9yUL2cNVK7++JQnRit8Rua02n6ZkeRYWuHiT3UVk6wnvaKzjTeH0DBHgdZGVKHg
8aFlUOTLLF5D70lPDoYYVTfnGLvIol6oypCkZfY1xA==
=YSjd
-----END PGP SIGNATURE-----

--------------fVcjL7tDyLmtviyNFhIpRlCM--

