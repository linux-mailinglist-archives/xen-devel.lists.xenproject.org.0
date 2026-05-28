Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yK/WBp0MGGpzbAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 11:36:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 714825EFB5A
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 11:36:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1321035.1588064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSX9J-0006O2-8g; Thu, 28 May 2026 09:35:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1321035.1588064; Thu, 28 May 2026 09:35:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSX9J-0006MD-5d; Thu, 28 May 2026 09:35:33 +0000
Received: by outflank-mailman (input) for mailman id 1321035;
 Thu, 28 May 2026 09:33:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nisthasarawagi35@gmail.com>) id 1wSX7b-0006Kx-NM
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 09:33:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSX7a-00HX25-Ow
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 11:33:46 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nisthasarawagi35@gmail.com>)
 id 6a180bf6-5cb7-0a2a0a5109dd-0a2a450ba70e-22
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 11:33:46 +0200
Received: from [209.85.208.182] (helo=mail-lj1-f182.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <nisthasarawagi35@gmail.com>)
 id 6a180bfa-212f-0a2a450b0019-d155d0b6b108-3
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 11:33:46 +0200
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-39393c1b5aaso53361861fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 02:33:46 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="To:Subject:Message-ID:Date:From:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1779960826; cv=none;
        d=google.com; s=arc-20240605;
        b=LdryZ7fBMcLvG9KCvXF5Vg1Bc7QeCwYZ5vew5l3/l8LwWAiVurHdI8fh/ywM3fcGsy
         hEbARc7V3UPnOktSmcK5wkJOkkEha+CTuXnvya3rz8IxmsBsG2a7QullnHBtdJEiuZxY
         Bv3ZZ5/pXHM8ED6uwALJf2EnywP+f0CXE5nrkrtZjW7ZfALtj59CRzjWxhjjoBEzu1pS
         czozR/6hSG5XSR21e8lAdkXflFY7pHegNdoTmnzi8OgtvUpIbjlowYxX0ykIo6ycyOaS
         xRkvP6q7cC9YeYiHXvJt2j3JZDLlEA4gYQZUOaGwH3En6/bMj+XqU6uZXOvQdu3bomuD
         CD/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=nO0glx3qkIy3cEq9pHxEidjea7rVy6x1ETyt83oKVUI=;
        fh=quJY5mN2l4ZorNvEoO9ngNXalhEvTdq/+W8CvHWhECs=;
        b=IJYLQIe7P5sK7hhiryvonFoHv9MW96DZ0GAsoff983ZV8ZEBx9R3j3y6wND/FWn8Oz
         TVQNU6trW8alZ0du3ek2ioHiBVz3x5ytFuX7FvDF2BCc1HiSPgNhAX9i8eHBJ3nQ4U0O
         mY9cTeRAdhWFR5ehuQYPhXy+hTBKZuuZCdeSgzv6svnWgTxGR2AMPiHATfOuSY7jEEQw
         vGNrm36gdinQvWR9gbv3n5g641hBlDSCxmsZLh222i0SFiaj947iKbnxlCH434E9V3rd
         Q739sMY8hQ7V0WY0r5JRBt5/WJr5rh5ipKTxH+TGtKMbLPzkjd5FuDG3sxavBe1nIn0v
         BejQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779960826; x=1780565626; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nO0glx3qkIy3cEq9pHxEidjea7rVy6x1ETyt83oKVUI=;
        b=WIGnvw3AE0pkvSTX2YfgRRtcxy8ctb2uE9qnv8cRYyBxvXD2Tna5xNA0hzldAONjrl
         GYMZyaXHvQga5XhCIJJDrlOZPLoG6aFlKfhjFAhRUTTLy0iskpBaCrmjNUo3Q/IPcx9O
         7Aka0xAcXcS4QIpKdkFMtxQMiCUJE5pYm7NXvMi/noaNQyNovVr5Aihs1JiTMTMUuIGA
         h+sPn8xFNqpY1vt8l8EKEXyoZfnmYHuCGNefVctlKvrZey2Und0+ppAk4chaPhdBwusZ
         z5QWjAd9Q2qMzgzXJ2S/hFK+XeciL9676TlD+sLOd3L2XLzfiho4RrtwtYr1wsMr2kW4
         LNEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779960826; x=1780565626;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nO0glx3qkIy3cEq9pHxEidjea7rVy6x1ETyt83oKVUI=;
        b=hPWWgK2pAqkieUc+3xmVih6pyWb+wMbnZ6WZzevdN0eJzvXBuPleV/YVFvDWxgGWcL
         Cb86vd/8VKGQEAmt1ruj3oNG8C2K5aZDAxDAyCrVRGEq2xTo0H8XdyhprhueJRH4r5gq
         zwfQYRNE5f+I7bOmiYLV/vty9FAET4i5+mvJykgfNLuLYFYrk6+A/Oy4KGEwPc94vHur
         fJ33mqeCX6h1ehFFmJxPNF6jtK24qSirG/V0Yo1nMIPX+KfvTS/fEQIyCH1FLDjSaQmm
         RviAwoKHUU0m7tOcPd7hUwlaSNsWNiTcmlg5ojVYbX8hVpDy7yhvM/o2IZlWOn6JnIbu
         RSkQ==
X-Gm-Message-State: AOJu0Yxjgu71tsz4XINipTEXpOXiXwW+S2+rLfgsW2p454i8+ofonTTa
	FPIYBjBe1DbUzOn/5OiHW2z65tJJHXQDG82BbNAaR8RnHagid05EGg6zoCxh/LaABGVprhDQ8cQ
	B+J+dslXhA+xhDMWJbDBh2V9dqNbHT9tuqTNyWOY=
X-Gm-Gg: Acq92OFt6CjbkLFfp/XKGEvFcWleWio7F8JPs+zryQv02gu0p0ZxsmSOxfD/GRSh2lC
	a4agcK9pyvC2x0m2hSDwIY/yF+PRgkwQwQcMMC2LAl/bNvJx2fJkE4n9l6x7CVeRstrBMuBn8ZE
	UTtaSjeOpPsNVqrKRpp5yAbo1muhQGiCc9aShU7Sdd+bGMLBMoF3EXGQgnrFQHpKSGwymfmxkOY
	b8Ov1hS5V3owEfVmF0sk1TEWzLe26HdqNizLuLdSSeYjGLSsCgZIqdNHFgOrl5CFgsRLbuIpOL0
	nUfdyMO5HqVfNoJ061PgFNd+NtUsEVczbjA=
X-Received: by 2002:a2e:a994:0:b0:396:28df:1133 with SMTP id
 38308e7fff4ca-39628df1db6mr25971231fa.16.1779960825784; Thu, 28 May 2026
 02:33:45 -0700 (PDT)
MIME-Version: 1.0
From: Nistha Sarawagi <nisthasarawagi35@gmail.com>
Date: Thu, 28 May 2026 15:03:31 +0530
X-Gm-Features: AVHnY4IAEbee794_IKpp6A3pc4dRXLzZLS1cQEEVZXACIZ6OgsJCO5qMXPJ0Q18
Message-ID: <CAJRCM3CRheT3SqevEjqJZ4+oLAPuawc5VDYiEJ4U6Yq=PcdHbw@mail.gmail.com>
Subject: [INTRO] Prospective LFX Mentee - Interested in Xen Project
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000bc2c5d0652dd6cc0"
X-purgate-ID: tlsNG-42698a/1779960826-20E7CF3B-756D066D/0/0
X-purgate-type: clean
X-purgate-size: 2252
X-Spamd-Result: default: False [-0.19 / 15.00];
	INTRODUCTION(2.00)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid];
	RCPT_COUNT_ONE(0.00)[1];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER(0.00)[nisthasarawagi35@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nisthasarawagi35@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.912];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 714825EFB5A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--000000000000bc2c5d0652dd6cc0
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

My name is Nistha, and I am an undergraduate student currently applying to
the Xen Project through the LFX Mentorship Program (Summer 2026).

I have a background in Python, Java, and JavaScript, and I am actively
working on building my C skills as I explore the Xen codebase. While I do
not yet have a systems programming background, I am genuinely motivated to
learn and contribute to open source virtualization ,which is why Xen
Project stood out to me.

I would love to get some guidance from the community on where a beginner
can meaningfully start whether that is documentation, tooling, or smaller
issues in the codebase. I am also happy to take on any tasks that would
help me better understand the project ahead of the mentorship.

Thank you for your time, and I look forward to being part of this community.

Best regards,
Nistha Sarawagi
Scaler School of Technology
https://github.com/nistha-coder

--000000000000bc2c5d0652dd6cc0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi everyone,<br><br>My name is Nistha, and I am an undergr=
aduate student currently applying to the Xen Project through the LFX Mentor=
ship Program (Summer 2026).<br><br>I have a background in Python, Java, and=
 JavaScript, and I am actively working on building my C skills as I explore=
 the Xen codebase. While I do not yet have a systems programming background=
, I am genuinely motivated to learn and contribute to open source virtualiz=
ation ,which is why Xen Project stood out to me.<br><br>I would love to get=
 some guidance from the community on where a beginner can meaningfully star=
t whether that is documentation, tooling, or smaller issues in the codebase=
. I am also happy to take on any tasks that would help me better understand=
 the project ahead of the mentorship.<br><br>Thank you for your time, and I=
 look forward to being part of this community.<br><br>Best regards,<br>Nist=
ha Sarawagi<br>Scaler School of Technology<br><a href=3D"https://github.com=
/nistha-coder">https://github.com/nistha-coder</a></div>

--000000000000bc2c5d0652dd6cc0--

