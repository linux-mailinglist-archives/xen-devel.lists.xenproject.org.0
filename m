Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C2112E8DF
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2020 17:46:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1in3ZU-0003DD-TK; Thu, 02 Jan 2020 16:43:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3gH+=2X=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1in3ZT-0003D8-Uj
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2020 16:43:39 +0000
X-Inumbo-ID: 066512a8-2d7f-11ea-a398-12813bfff9fa
Received: from mail-lj1-f194.google.com (unknown [209.85.208.194])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 066512a8-2d7f-11ea-a398-12813bfff9fa;
 Thu, 02 Jan 2020 16:43:38 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id y6so33272174lji.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jan 2020 08:43:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0i4VVO+4EXhZFCqMP7tCmXSpwrVqAoNwqx+qxJOj5Ao=;
 b=fVaing9gKf/LqubwJ1fWtRSiXjUIpWOSJgaurcO9vuqmDQIJGoZfFl9vihUgHSyhxt
 I0oP0wLvOHS9CLnPbzNM3eHXJP/Y7fZQTtR3gCeUShutH0ggxxZBVBRQ+/PQefCVyWnY
 99Q9qHV3vlNAyjo70dmVzbiMC3NWRft2JHXNMlHA3rOV3cjDxHDXO5nfXCXuSSPxrjMt
 5/CswGXpb+lZpjHruj9dP4w0zsVJVKoxLypN358RT52Orh1HzrqE1Unk4b7ag+0eB5Ar
 aZLOFsgasNMVlYyxgQGBvNhlqQITUmSSiGz3nABuS9h0iXxSbTUg8rnQ61GUHrgWe9cT
 aEhg==
X-Gm-Message-State: APjAAAX6Zhh8YDrtoWEJKKufpu2gGfn9H/Vk/uX2AUauYuGMbLINBrqr
 ac1dbxHEygP7bDg2fKVgsvLpooElaWk=
X-Google-Smtp-Source: APXvYqwtzVt8dwXqfJjJI+bKsBT/pLnHOLftcfDuuHJL2+Ri6BSXdS8ZloZAn+R2V4ZBRE0l8Umfrg==
X-Received: by 2002:a05:651c:111a:: with SMTP id
 d26mr44552195ljo.153.1577983417382; 
 Thu, 02 Jan 2020 08:43:37 -0800 (PST)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com.
 [209.85.167.46])
 by smtp.gmail.com with ESMTPSA id y10sm22995564ljm.93.2020.01.02.08.43.36
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jan 2020 08:43:37 -0800 (PST)
Received: by mail-lf1-f46.google.com with SMTP id l18so22071098lfc.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jan 2020 08:43:36 -0800 (PST)
X-Received: by 2002:ac2:4a89:: with SMTP id l9mr46936230lfp.121.1577983416850; 
 Thu, 02 Jan 2020 08:43:36 -0800 (PST)
MIME-Version: 1.0
References: <20200102162104.5102-1-andrew.cooper3@citrix.com>
In-Reply-To: <20200102162104.5102-1-andrew.cooper3@citrix.com>
From: Wei Liu <wl@xen.org>
Date: Thu, 2 Jan 2020 16:43:21 +0000
X-Gmail-Original-Message-ID: <CAK9nU=rN2622Jmeo8efB+ymRcbQXXqQ-NQ7vY_hXHcbr_7ryGw@mail.gmail.com>
Message-ID: <CAK9nU=rN2622Jmeo8efB+ymRcbQXXqQ-NQ7vY_hXHcbr_7ryGw@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH] x86/trampoline: Drop stale comment
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAyIEphbiAyMDIwIGF0IDE2OjIxLCBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPiB3cm90ZToKPgo+IFRoaXMgb3VnaHQgdG8gaGF2ZSBkaXNhcHBlYXJlZCBp
biBjL3MgNjA2ODUwODljYjAKPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
