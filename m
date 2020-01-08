Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA81133E01
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 10:14:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ip7N8-0000Un-QN; Wed, 08 Jan 2020 09:11:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ReGW=25=gmail.com=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ip7N7-0000Ui-2R
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 09:11:25 +0000
X-Inumbo-ID: d7f7bc32-31f6-11ea-bf56-bc764e2007e4
Received: from mail-pl1-x641.google.com (unknown [2607:f8b0:4864:20::641])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d7f7bc32-31f6-11ea-bf56-bc764e2007e4;
 Wed, 08 Jan 2020 09:11:24 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id c23so877526plz.4
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2020 01:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l9SYbUVxNQbnhUQC9H8nVhcsJFPWIVYsWzkFwA3c7kw=;
 b=OIpioCy5Qxt0qlb9SfczD/Hijp1FF5c/0lJiBhl2hi7zAij+W+o52oZW0XnIj/PPZf
 gdrd+4ZXCmB0ilHO/jmVlFxEsg+ZJYDwmC/N6ZZrEJY0uYs61uZ0zWwgf0ROlQKLrmtz
 eeUbO5yGQXzGkYAlDVlMwZMvenAdP0xXF0FmiW8Ic8c4/kiFqmbUzbPgRHzo3qcGNKN9
 ic3+1sgXpxycYlz48gAM8YpmqNVXJAvg8NJpqlpp4fZlzMBdpatznDP4z5jvC/fK1g57
 XmblbW6LoVo5KxIcFOCBKIf5CeW8SK6aUwTFN64+3TJBvXutlmzZDf1PgzQczgohQyJs
 QWBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l9SYbUVxNQbnhUQC9H8nVhcsJFPWIVYsWzkFwA3c7kw=;
 b=RkCD6U4GIl1EOz/IX33diGCMTLsNyTSuKWM0pLhY2W8V4pwdHCJhxfn1CYq8H1ft5T
 XascIMcuwK2SGTUsA1NZdxU30elpSxgCOCALSJqdppnVPYr3SASaTntNwyUFhn3b+G+w
 OPXXXPuTxiqDQK8gMbGFPRNnQ/6aANvKKoguZYU1iQZ7th+MBn7q045mZW0rRP9PajAx
 vUHkoWTJ6vETRxxO0x78h57H7YjGMv4648JDYxQuRNoy4RDJBI76hRhiQOVg/5c6F51/
 4Us/BKzti35Z0kQee79D6fg3Pl0jRyrePMy8h6QhMsbCjdHV9zzis3H6ewN+Wac+BkG+
 Q0Bw==
X-Gm-Message-State: APjAAAXv0tZVV0yXSxEZLpYPv3BqXG5v0YrTSjt1QWTgp1qMcaWupkTx
 K4kZ4b+KN93cv/8aP5Dt88JkBOm3QB9OHKEknuQ=
X-Google-Smtp-Source: APXvYqzfviXy/a530344EasaLyO8v6M8oGn9rJ6bCRpJFkt1FIkpjG7xS8sRvVIo9tOVHqDNXl44uRzMmoBtyKl2yT0=
X-Received: by 2002:a17:902:7004:: with SMTP id
 y4mr4318651plk.263.1578474683852; 
 Wed, 08 Jan 2020 01:11:23 -0800 (PST)
MIME-Version: 1.0
References: <20200107173902.13768-1-liuwe@microsoft.com>
 <20200107173902.13768-3-liuwe@microsoft.com>
In-Reply-To: <20200107173902.13768-3-liuwe@microsoft.com>
From: Paul Durrant <pdurrant@gmail.com>
Date: Wed, 8 Jan 2020 09:11:12 +0000
Message-ID: <CACCGGhAGY+VtgCtwMz39eRmPT0nch92r8P3JBGhhrWWPtYd+mQ@mail.gmail.com>
To: Wei Liu <wl@xen.org>
Subject: Re: [Xen-devel] [PATCH 2/2] x86/hyperv: drop all __packed from
 hyperv-tlfs.h
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
Cc: Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <JBeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCA3IEphbiAyMDIwIGF0IDE3OjM5LCBXZWkgTGl1IDx3bEB4ZW4ub3JnPiB3cm90ZToK
Pgo+IEFsbCBzdHJ1Y3R1cmVzIGFyZSBhbHJlYWR5IG5hdHVyYWxseSBhbGlnbmVkLiBMaW51eCBh
ZGRlZCB0aG9zZQo+IGF0dHJpYnV0ZXMgb3V0IG9mIHBhcmFub2lhLgo+Cj4gSW4gWGVuIHdlJ3Zl
IGhhZCBpbnN0YW5jZSB3ZSBoYWQgdG8gZHJvcCBwb2ludGxlc3MgX19wYWNrZWQgdG8gcGxhY2F0
ZQo+IGdjYyA5IChzZWUgY2E5MzEwYjI0ZQoKSSB0aGluayB5b3Ugc2hvdWxkIGFkZDoKCiJ4ODYv
SU8tQVBJQzogZml4IGJ1aWxkIHdpdGggZ2NjOSIKCmhlcmUuCgo+ICksIGl0IGlzIGJldHRlciBk
cm9wIHRob3NlIGF0dHJpYnV0ZXMuCj4KPiBSZXF1ZXN0ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQu
Y29tPgoKICBQYXVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
