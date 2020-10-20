Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E96382937C8
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 11:16:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9006.24222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUnkS-0006PF-EV; Tue, 20 Oct 2020 09:16:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9006.24222; Tue, 20 Oct 2020 09:16:04 +0000
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
	id 1kUnkS-0006Oq-BL; Tue, 20 Oct 2020 09:16:04 +0000
Received: by outflank-mailman (input) for mailman id 9006;
 Tue, 20 Oct 2020 09:16:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dZuW=D3=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kUnkQ-0006Ol-C1
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 09:16:02 +0000
Received: from mail-ej1-x632.google.com (unknown [2a00:1450:4864:20::632])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8ef99ae0-19dd-4272-aacb-cc74fdb0e37f;
 Tue, 20 Oct 2020 09:16:01 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id u8so1629422ejg.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2020 02:16:01 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id m6sm2056922ejl.94.2020.10.20.02.15.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 20 Oct 2020 02:16:00 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dZuW=D3=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kUnkQ-0006Ol-C1
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 09:16:02 +0000
X-Inumbo-ID: 8ef99ae0-19dd-4272-aacb-cc74fdb0e37f
Received: from mail-ej1-x632.google.com (unknown [2a00:1450:4864:20::632])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8ef99ae0-19dd-4272-aacb-cc74fdb0e37f;
	Tue, 20 Oct 2020 09:16:01 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id u8so1629422ejg.1
        for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2020 02:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=GRAttMbN/GcTabZL2HUfvGNlRSn0zQv6Um7v05WMMG4=;
        b=C2NDlWHKUTTeBiGQggAsU3O35HRh3ogDeGUzF7TjXDrHqMSagxqViXojg+naxG3MO+
         ZKGg116pfVPt9ofImjjpyrwrnq1MATA0XD8uqfmSerTOBrzi1pqC3h7Z354CmvLIOKoJ
         CnLW44MINUrOFGImC06xxnbJaJJYdvpey5GWFKGfzZWSOVBtjxeYBNxdnGrX1gM34uNe
         Wz5899HXfxBPo44MwkAUbcvIkgxKkvSEinyepuErijEWYf0AQnrpYkVyK/tonu0KQqmF
         B8Dk/sQTNhQVP8eUtEXs281mc5pmkD1kk7QlmxGc9Bc+CZpOr9c6fjK0NtsRtmO8jwJg
         0J7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=GRAttMbN/GcTabZL2HUfvGNlRSn0zQv6Um7v05WMMG4=;
        b=E0iJDRgX+WSGJG+HxZsN7WhMISxi1R2JzCL26Rg3OfArQORFRpoJzbhpUhaKMVQ/2m
         acMJxdrTudOkX9QyliFS2R8wnNOJnAv5Nyq8V6sHH8O7tPc68TsiIKcJBHLJcgsmtoGk
         h1aa88pz4InWIZiqDyoGVgBQSgHXm1LapvFAeX6vXEEt+/IjINSeusfTyN2o772sJinv
         KX1ucpNlD/2VkyoHG5HcWLMDgc4QfHntuOKqrHNvy/3rMok4KbIBB+/ZRXHekRXb/wZn
         K0k2Ysrs6P1gXqOa8gv7iufZPOW5QX7XSo+Fn9bFHhuGdMzrJiq1xaz1DbUOpuk5bVFj
         feeg==
X-Gm-Message-State: AOAM533RrUU5azdq8k8A6m7bajYBD2W8UxTieuTgVFhIHOlkYBjDAIgw
	iyvCqE9JhKgZuzwFgylReyY=
X-Google-Smtp-Source: ABdhPJz1+5NjxWARe/OSr65OJVNY8jninmojNdKdiTyYMD1HOp5fKvZkS4ZgZJ/+l42RcnRKLmd82w==
X-Received: by 2002:a17:906:4a98:: with SMTP id x24mr2084363eju.319.1603185360609;
        Tue, 20 Oct 2020 02:16:00 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-238.amazon.com. [54.240.197.238])
        by smtp.gmail.com with ESMTPSA id m6sm2056922ejl.94.2020.10.20.02.15.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Oct 2020 02:16:00 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Oleksandr Tyshchenko'" <olekstysh@gmail.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Oleksandr Tyshchenko'" <oleksandr_tyshchenko@epam.com>,
	"'Jan Beulich'" <jbeulich@suse.com>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	=?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
	"'Wei Liu'" <wl@xen.org>,
	"'Julien Grall'" <julien@xen.org>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Julien Grall'" <julien.grall@arm.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com> <1602780274-29141-6-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1602780274-29141-6-git-send-email-olekstysh@gmail.com>
Subject: RE: [PATCH V2 05/23] xen/ioreq: Make x86's hvm_mmio_first(last)_byte() common
Date: Tue, 20 Oct 2020 10:15:58 +0100
Message-ID: <004801d6a6c1$a0381fe0$e0a85fa0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFqp5MaNUj6MKEiN9RM6S6pfA5bVAF29sarqmx8LuA=
Content-Language: en-gb

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of =
Oleksandr Tyshchenko
> Sent: 15 October 2020 17:44
> To: xen-devel@lists.xenproject.org
> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Paul Durrant =
<paul@xen.org>; Jan Beulich
> <jbeulich@suse.com>; Andrew Cooper <andrew.cooper3@citrix.com>; Roger =
Pau Monn=C3=A9
> <roger.pau@citrix.com>; Wei Liu <wl@xen.org>; Julien Grall =
<julien@xen.org>; Stefano Stabellini
> <sstabellini@kernel.org>; Julien Grall <julien.grall@arm.com>
> Subject: [PATCH V2 05/23] xen/ioreq: Make x86's =
hvm_mmio_first(last)_byte() common
>=20
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>=20
> The IOREQ is a common feature now and these helpers will be used
> on Arm as is. Move them to xen/ioreq.h and replace "hvm" prefixes
> with "ioreq".
>=20
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> CC: Julien Grall <julien.grall@arm.com>
>=20

Reviewed-by: Paul Durrant <paul@xen.org>


