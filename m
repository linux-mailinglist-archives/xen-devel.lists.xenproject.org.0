Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WZ7TJ5KLFGonOQcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2026 19:49:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FB45CD713
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2026 19:49:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319394.1587026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRZQ5-0002xo-Rn; Mon, 25 May 2026 17:48:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319394.1587026; Mon, 25 May 2026 17:48:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRZQ5-0002uy-Ob; Mon, 25 May 2026 17:48:53 +0000
Received: by outflank-mailman (input) for mailman id 1319394;
 Mon, 25 May 2026 17:48:51 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <accek@invisiblethingslab.com>) id 1wRZQ3-0002us-CR
 for xen-devel@lists.xenproject.org; Mon, 25 May 2026 17:48:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRZQ2-00FQ0h-M1
 for xen-devel@lists.xenproject.org; Mon, 25 May 2026 19:48:50 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <accek@invisiblethingslab.com>)
 id 6a148b82-bab6-0a2a0a5309dd-0a2a450ad2a2-0
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 19:48:50 +0200
Received: from [103.168.172.156] (helo=fhigh-a5-smtp.messagingengine.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <accek@invisiblethingslab.com>)
 id 6a148b81-56b3-0a2a450a0019-67a8ac9c940f-3
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 19:48:50 +0200
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 511CB14000CB;
 Mon, 25 May 2026 13:48:49 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-03.internal (MEProxy); Mon, 25 May 2026 13:48:49 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 May 2026 13:48:45 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm3 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm3 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1779731329;
	 x=1779817729; bh=Spk1z8YeAzkqrRel0/BORlN7xV9IG5P+0rVdVe7alZM=; b=
	wm+9CRvEC8Gn2wsA8RiX+gjyLWQ98kkO96N9UJX1jg24Et3/kTC+c/Lq+fT25Zre
	muZwViOQjODBQdc04mBpnj0xMhIrkxvfclaYCTB3q/pKNgudrGN4EKzAiIE3t+7W
	KrXRtx/htk/YVDkBetFF2n+sKDHZGLvkPqpREfblaQBkFekFRQKS/9lbXwl1Pd1M
	23st00aFGzIk1DgSHbprQKt9OrWF172P3BF6R87nlBaPAE4MiWntLybDsPtcQvXN
	Z3gEqOcgLDa9Dh5/RjfqsZJIXUWSNiA0k4kfHLagIym9A1J/GbEtfEZ4g3TdKZjl
	CvbQpsYVDE8HGA/T3Vqccg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1779731329; x=1779817729; bh=Spk1z8YeAzkqrRel0/BORlN7xV9IG5P+0rV
	dVe7alZM=; b=F5uoeaSOkepPeexYG6jy6DwzWxQ7Oq/ZoigjmtNqCc1L7mhO0qZ
	Yczzn21ugbvRVRKiwjP1DHF4hNuUR4ci+MivzIw7JiaUPrk2BLO7iJBxCUJVwm32
	FBnfWUu+hhAMWB+EgKFQmfFy62EkkAlP0HijtjHokMaUPPYgp5GAV1tPaLJrRrgf
	r4HnH2EEA+2c4Owk5sq0i7M4Is+UOU/sq6kWxNgC0BRlTvI2HWO/Q5Z+lb8z9STs
	3jQCbn8fnNXMLdR9etOiE9rMdMMPURX28AV3J5tGTA1baxekDyGA6YtliDH/gsDy
	H5FJ1fDSR8qL1a+AhQpzg+wCpgDQKam19UA==
X-ME-Sender: <xms:gIsUarucs7dsaavqagcsQyvJzaIfJIGKjC3rjtciW2DWalkdoBLY5g>
    <xme:gIsUai08GI-tscW_QAvYXDS_cTUVHLjZxA37XlV8JsUo5PUT6bYoFJYU_uShkNpDL
    QBKt3pq8pIGTkp9UyfleKDWS-JUKsdDbTnnCp7jwldeqHXQOg>
X-ME-Received: <xmr:gIsUarAuzq97Ps2VpCN_yWq8M6_xxqj7u8VbArgmJOmSdphvjE0ewRRs0ga34fhEH_zIb_I>
X-ME-Proxy-Cause: dmFkZTGbosfjJGJRCffYbPWpnJhrHM2h8WpK7JcOoQG8wTVgMOlZte1J949XbobpP9f3FX
    jc742bLc9g1NVZDsC9Rq/3R/MY7Uue2z5+TQZllpF0m2oBnpfQSycgKVFI6VUTvQd7nj7M
    0+H7syVYgoshHHTv80Yd0Ih6uLfaNZzlju35MYksHJEzXLz+kPylngw0gPFOe7Db2zm/UX
    1qZkUmgFBOzwlpfQ7SlLT0wfGeZ31hCHzlZRqo4kl8Sz+ZGUUffYSDeLqEOeKJ30N+Ah+z
    VearmSbcl9q4VAixTQ1Hs8hVZJ7jclx7GGu8298OReChiIIHijytSTsKzot9QZ8D1abITW
    TPa7gtp1N29yoCgDZUQ99O0mIUNEF/wCTHcmbM6Q5ZCdZjEi3MQiXqk7EaDE5DDw0HM6UY
    0hcdfrIknzJAFUznEy+32OJxiQIHF0gRISmcAb2VAT9XGX9LXF9LES0cK6dvKk8D9SN+hZ
    /TxeS88LGRaRAvSQE9s/lGtO9U2m3gWKWMf3Fq1N7axITrr6c2PhHZ5M+WAl1nFkEL6xwQ
    d8SGGIx3NL/x2qvnbmm+8IDnVU+JDs8lCqtiawcYD/eFwx5aOZCouwk0mEM1RxwrV17CAv
    qqn970Nj31n8AUdHl9thLue/vvrXilUnFZcnP6VN4QKT6hGv9eY7leFRw4ZQ
X-ME-Proxy: <xmx:gIsUaoCgaSg7xYlHlju8lC5bNc9ZvkgT6w0koXH4DIHXnIfE7aJWpQ>
    <xmx:gIsUaklhFqq9xH512112c_C6_zpCydRM3yuxkAsVVeNowPfQf1N1Kw>
    <xmx:gIsUaghO5ZEss7ZsYQeMg9Ny7BqYbvh9aDcmJaZnBrGDDxC6BsVe1w>
    <xmx:gIsUamhMC3zoYVl7qgpsK9lv6otUv2pQ9Eiqgt3xDSsAMpSYXNFPYg>
    <xmx:gYsUatT4fyDtZJ49AhVFXtAaZyl4aUJA-6ZMkdIc-sw40JPei7hm-riH>
Feedback-ID: i792e4853:Fastmail
Message-ID: <4a3ec4d5-74ec-4d91-8d3a-25da9a6f0e03@invisiblethingslab.com>
Date: Mon, 25 May 2026 19:48:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.22] EFI: Fix boot from a device without a file
 system
To: Marek Marczykowski <marmarek@invisiblethingslab.com>
Cc: Jan Beulich <jbeulich@suse.com>, oleksii.kurochko@gmail.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <5ee376dc0df448437f386ab2606c42d63a515ca1.1779194154.git.accek@invisiblethingslab.com>
 <809b9976089eaf02e864684461ced4e939dbcc83.1779271357.git.accek@invisiblethingslab.com>
 <31ee4635-0eaa-41cd-8fad-223fb11cb9bc@suse.com>
 <b7708cbf-ea9f-4ba1-a93d-3981eacabbc7@app.fastmail.com>
 <ahA35DwKm8LM9H_x@mail-itl>
Content-Language: en-US
From: =?UTF-8?Q?Szymon_Aceda=C5=84ski_=28accek=29?=
 <accek@invisiblethingslab.com>
Autocrypt: addr=accek@invisiblethingslab.com;
 keydata= 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
 3KnQZYrxAo+nbJoTkTBL3mACY9bPjKbYCJS5kE4=
In-Reply-To: <ahA35DwKm8LM9H_x@mail-itl>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Fk426hwViH2StANbI72RPW4s"
X-purgate-ID: tlsNG-4011c0/1779731330-731728B7-5FD4AC3D/0/0
X-purgate-type: clean
X-purgate-size: 9884
X-Spamd-Result: default: False [-0.59 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm3,messagingengine.com:s=fm3];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,messagingengine.com:dkim];
	FORGED_SENDER(0.00)[accek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:jbeulich@suse.com,m:oleksii.kurochko@gmail.com,m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:dpsmith@apertussolutions.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[suse.com,gmail.com,citrix.com,kernel.org,xen.org,arm.com,amd.com,epam.com,apertussolutions.com,vates.tech,lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[accek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.021];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: E2FB45CD713
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Fk426hwViH2StANbI72RPW4s
Content-Type: multipart/mixed; boundary="------------olE86i8kBD65593FeoUupJg0";
 protected-headers="v1"
From: =?UTF-8?Q?Szymon_Aceda=C5=84ski_=28accek=29?=
 <accek@invisiblethingslab.com>
To: Marek Marczykowski <marmarek@invisiblethingslab.com>
Cc: Jan Beulich <jbeulich@suse.com>, oleksii.kurochko@gmail.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Message-ID: <4a3ec4d5-74ec-4d91-8d3a-25da9a6f0e03@invisiblethingslab.com>
Subject: Re: [PATCH v2 for-4.22] EFI: Fix boot from a device without a file
 system
References: <5ee376dc0df448437f386ab2606c42d63a515ca1.1779194154.git.accek@invisiblethingslab.com>
 <809b9976089eaf02e864684461ced4e939dbcc83.1779271357.git.accek@invisiblethingslab.com>
 <31ee4635-0eaa-41cd-8fad-223fb11cb9bc@suse.com>
 <b7708cbf-ea9f-4ba1-a93d-3981eacabbc7@app.fastmail.com>
 <ahA35DwKm8LM9H_x@mail-itl>
In-Reply-To: <ahA35DwKm8LM9H_x@mail-itl>
Autocrypt-Gossip: addr=marmarek@invisiblethingslab.com;
 keydata= xsBNBE5j9EwBCACbYHjxDrxFAY3n1x9KBFvjzkG1qFSTVBnH4vpD/5Na4sZq4uDDMUCjivrm
 MzbWYaivYj96BygdOiw7PWxYrhuW0b2WYOeGudZyApgFz42g458s78EciuhgfuWBlxr8dOEN
 /9ueVFHcvtZmDbHhMVPcQ0O7gwh0JmwkOsf7P7WAfYXsQlhO/EBRrNXR0Je+GEpYADhRktxX
 h1d3Iz+oKYuwHioLX8ovoAT4+peOuecWUSpUWebpDbTR5i7NRP3PIblB4KzWJa2kh/f3mx4v
 SRGnHn+BfX42xSe0X7Ktl4Xf+KNq9Wkcjk2CZP57hV2v4pO0ZUOXD7IhlZtnfNj67WjdABEB
 AAHNP01hcmVrIE1hcmN6eWtvd3NraSAobWFybWFyZWspIDxtYXJtYXJla0BpbnZpc2libGV0
 aGluZ3NsYWIuY29tPsLAeAQTAQIAIgUCTmP0TAIbAwYLCQgHAwIGFQgCCQoLBBYCAwECHgEC
 F4AACgkQ24/THMrX1yyjJQf7BZyMAc+s87EAf9iRvmPD/qTMw8rMBu9WDQy1mCEzbZXRoCCY
 cPPX8kkYHW+qWsvhf9h862JoR/yTUcZkwhtdx1GFDeFkPQRStoexhwu2wrfIdlxFtGPMFvll
 KUaxm77UIFTBnK47lar/GWvNk9sMWyceui+ZSwxfbcv/lkl1razgmp0/g6ZqcbOP5dFyXm1q
 xNpCAy+6kxqgMQYUgr/ktlokGH/bkm0sTKvU9fsCqVwj47qaHFsMBpQvQ8C1L7dpaLO8OT4X
 5eEhOhbx/kd/2Pom9BnyaMiMyHjIf1+W9kQ1u8bfE/rkeKG3tV+inyd2TGDV/eH2m6NvPt8Y
 LyZy0s7ATQROY/RMAQgAtRWgUZ5mOy+c/qzmiVnxqDkiOJjmnIh3Pn+OqCtjcrTyPI9eVc06
 uH30Jkco0soLiG/UgwVw4XwBlm95j9n6TSUms4mPBh1YiR1hBjsjYwn8zp/Ue9xWk1N6E14H
 aj55GxmS2H3YIlOXfQLr0X3RHsmKixTOKyisrYlJu71FmettDFV7CgMXy1Bc1LbAE08asvAS
 ShHFdRiRRtkuVHvY/Ebq9L54kOxtlI6ahrflMcT0YCMON5oe4GgQRh3p2uy+d/LS2bgRcQST
 IebErj8x0lM271f97GvxV/ypHo7XVIDI5FX1u31Agzx3HQr035GHt4HV4/GVCz+V4xt4BonB
 tQARAQABwsBfBBgBAgAJBQJOY/RMAhsMAAoJENuP0xzK19cs5MgH/jWLXil2Ud4TdtWnBxc+
 2/QZZk2JCssc1PgWNzvH5wH7U+8lGSlUK8ZMOqrrF8C5rX0+xEn7deSrsZChIOnUFo8rhCZK
 y/mBV+FhkMj24FZZ0n8w3eF4KF2t68Pt+AvMjxQHwxAMdf3QftgQhD0qYkt/28eedUQ+jwz6
 kipc4qUQmqTEViQRPa3WAnKgNDQUDUwNruzthfGvHUjllf7zbPI8gkbARM0KlTkLikc9u+Ni
 VMbJTiGPB7YHyw2MIPq1n+mhSPAyXE6CVBnYkonQ7P3SLZssxC3PIarV+DTU68umQB3pfrfF
 7hMcAY5csWrK9/x/Zz4RUfgN6Q3HLrSp9UQ=

--------------olE86i8kBD65593FeoUupJg0
Content-Type: multipart/mixed; boundary="------------rZW6B1kTQWJ095byIytdA0iI"

--------------rZW6B1kTQWJ095byIytdA0iI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNS8yMi8yNiAxMzowMiwgTWFyZWsgTWFyY3p5a293c2tpIHdyb3RlOg0KPiBTcGVha2lu
ZyBvZiwgdGhlIGRpcl9oYW5kbGU9PU5VTEwgY2FzZSBpbiByZWFkX2ZpbGUoKSBpcyB1bnJl
YWNoYWJsZQ0KPiBub3csIHJpZ2h0PyBNYXliZSBjYW4gYmUgcmVwbGFjZWQgd2l0aCBhbiBh
c3NlcnQ/T2ggeWVzLCBqdXN0IHN1Ym1pdHRlZCB2MyB3aXRoIEJVR19PTighZGlyX2hhbmRs
ZSkuDQoNClN6eW1vbg0K
--------------rZW6B1kTQWJ095byIytdA0iI
Content-Type: application/pgp-keys;
 name="OpenPGP_0x9F5407A580D65788_and_old_rev.asc"
Content-Disposition: attachment;
 filename="OpenPGP_0x9F5407A580D65788_and_old_rev.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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3D=3D
=3DNpMv
-----END PGP PUBLIC KEY BLOCK-----

--------------rZW6B1kTQWJ095byIytdA0iI--

--------------olE86i8kBD65593FeoUupJg0--

--------------Fk426hwViH2StANbI72RPW4s
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEKxK5RqoWZXix6ABWn1QHpYDWV4gFAmoUi3wFAwAAAAAACgkQn1QHpYDWV4gT
Twv9HVkWA/z7ycCq1Kvn6kPULgrDAcjsknEcxuoDqWCZDV7llRf9KIofAYgOQshD1CGw9oMDP559
lflZHQVUFEb+sZ5zmRbrzVRFt9gp6DrrEsw5SymRZ/RiIoCRnXXgJr6JhGkbxSW4h980ARbN3WnF
UU86QCxgbiZmJljUs28CYuUZB4iQ/y+ExGH/xxBzzLY6AX+YeKn4QUAyCS8VQ0npcm77iwkFv3Lj
Vb/OVFrFEm8uSYLYYkk5toAYuhDl6wvoXHiAa3keULzBiAXdcuyN/X2J1BIm65vdaHucKKfPXHT4
N8InrqheCVLMdJz1MsKR3BAS9ri3rNU0drzcn4j24V5OBmxtD8GAU8B9/mRRJd+FP4hb6KZiAMXq
GosbxHKVL7BNOJY0WY0mH0zr/TixIdv+F0omqvJZR3up47MwcopbBRK+XEOLforxv3+RD3f8Dx0m
ipEIDtexVnUw+zty41T3P5bz7c6bjRcssR3jQ4aMnQXb2pjG+FgUvKExTSCF
=aPaR
-----END PGP SIGNATURE-----

--------------Fk426hwViH2StANbI72RPW4s--

