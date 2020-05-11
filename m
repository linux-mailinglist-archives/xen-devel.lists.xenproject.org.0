Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF131CD885
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2020 13:34:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jY6gu-0002jq-CL; Mon, 11 May 2020 11:33:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tL/r=6Z=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jY6gt-0002jl-Km
 for xen-devel@lists.xenproject.org; Mon, 11 May 2020 11:33:47 +0000
X-Inumbo-ID: 46a59c4a-937b-11ea-b9cf-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 46a59c4a-937b-11ea-b9cf-bc764e2007e4;
 Mon, 11 May 2020 11:33:46 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id l11so4590295wru.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2020 04:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=ibSaSQ6KUOEi7BJQa1f+0VwxcleRpXDIX9+5LG695rQ=;
 b=BTKToUSqHmq1CsGsuofoThOFZ3e88uPkBM1rxKpGBciDwDR/BSUzQt+QmYfmqKvH5u
 JmsEK1W9weXDyUiNyyoK/dScvp6UxNmf9Ws4dKCRN7kN3YndeD6Wxq0WU7WyLPj9mxi+
 QIfhkfmZpP8t8CJ0hEC7RMI1nB9Vx5zu5wBk12mdU+pp/GIfOaA+ULztXvPN7aIzuEvK
 xAmgyfQyXLpTlyUQaUQGCi3CLGu/nzz27F2orZMoCAZyUfpQBAo9YDW48wFBGCI1Amkr
 QRWrv+5ckBPKiPC6G+Bou93i/bUPbU2YsbKCOdu1eLdmpFXnv8BJs0BnorTriAWryj8/
 UR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=ibSaSQ6KUOEi7BJQa1f+0VwxcleRpXDIX9+5LG695rQ=;
 b=ce7Gu+xMcNVDGJOhL9Hie6fn2VeqaK0pFryAw8vrOIC+tmH6YRWCcFxy+cHVs5AlIl
 NfApUiOR8Mtgp2vCsHKmvPXacN/wr+kNuFiXqiPkxJsMqqDDVWCAkXsy/XQDlYsKvy4K
 VAv5+gZTDXcJrfD4H4hfEq0owAejmLRnEg7FGlmpoLITiQVscSRVFOh2PzYrnelkbQHd
 n94obpZTti3O5HFY2enPni3GbCXDdVa05slIu5QeG0Q3xTbvw8PIWD+Ljgeqju95uaMT
 /HWXUnEMzv2qR5J101aWzqzxSjfuF4NkGLQs7wgBRneZaJDMJtrsJ87QX4SMD189lGwF
 VmPQ==
X-Gm-Message-State: AGi0PubDjmdRzJlNqkhU1rpkfaXEkk9iFkRVJEBxq91KCgO7sbxvd/Kv
 IjMEBSKqtYaZkEg0tmofFgE=
X-Google-Smtp-Source: APiQypItTJc0a/Dyy2ztp469G12LZGZVCDJLuGadxEshDSX9SeDBDctzYseSeFOoHhSQc+496GxWtw==
X-Received: by 2002:adf:f1c3:: with SMTP id z3mr19731530wro.201.1589196826026; 
 Mon, 11 May 2020 04:33:46 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id g184sm11752793wmg.1.2020.05.11.04.33.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 May 2020 04:33:45 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Roger Pau Monne'" <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
References: <20200511103145.37098-1-roger.pau@citrix.com>
In-Reply-To: <20200511103145.37098-1-roger.pau@citrix.com>
Subject: RE: [PATCH] changelog: add relevant changes during 4.14 development
 window
Date: Mon, 11 May 2020 12:33:44 +0100
Message-ID: <000d01d62788$07d16fd0$17744f70$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQCqoBtxXRpJrkR7COjPNOw6eVixCar5z8Ew
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Community Manager' <community.manager@xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Roger Pau Monne <roger.pau@citrix.com>
> Sent: 11 May 2020 11:32
> To: xen-devel@lists.xenproject.org
> Cc: Roger Pau Monne <roger.pau@citrix.com>; Paul Durrant =
<paul@xen.org>; Community Manager
> <community.manager@xenproject.org>
> Subject: [PATCH] changelog: add relevant changes during 4.14 =
development window
>=20
> Add entries for the relevant changes I've been working on during the
> 4.14 development time frame. Mostly performance improvements related
> to pvshim scalability issues when running with high number of vCPUs.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Acked-by: Paul Durrant <paul@xen.org>

> ---
>  CHANGELOG.md | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index b11e9bc4e3..554eeb6a12 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -8,6 +8,12 @@ The format is based on [Keep a =
Changelog](https://keepachangelog.com/en/1.0.0/)
>=20
>  ### Added
>   - This file and MAINTAINERS entry.
> + - Use x2APIC mode whenever available, regardless of interrupt =
remapping
> +   support.
> + - Performance improvements to guest assisted TLB flushes, either =
when using
> +   the Xen hypercall interface or the viridian one.
> + - Assorted pvshim performance and scalability improvements plus some =
bug
> +   fixes.
>=20
>  ## =
[4.13.0](https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dshortlog;h=3DREL=
EASE-4.13.0) - 2019-12-17
>=20
> --
> 2.26.2



