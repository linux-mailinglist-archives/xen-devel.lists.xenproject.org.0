Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 780161341AA
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 13:28:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipAQ7-0002Et-NE; Wed, 08 Jan 2020 12:26:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=e5qD=25=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ipAQ6-0002Eg-8z
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 12:26:42 +0000
X-Inumbo-ID: 1f8808c0-3212-11ea-b7d9-12813bfff9fa
Received: from mail-ed1-f68.google.com (unknown [209.85.208.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1f8808c0-3212-11ea-b7d9-12813bfff9fa;
 Wed, 08 Jan 2020 12:26:41 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id f8so2425189edv.2
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2020 04:26:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=L9JumfPMGvNZLrs9bMRxzumT5ohIHviEoLuieuqud0k=;
 b=Vy7yI72Wxt6CRffUw28MIDmfvNHY9ucpiQAxLzuNKvkk736vfpc/Tz7RmEOwp3sVQQ
 F8uReDQN05LB8Lsq2mBd21mDFsblGUare3KmqA1DsXP+YMvdW7XyaLLvIJwh2QfGTxHY
 O8hrd602Xrl73drLGVHXodFabew70gU8JRgjxiwTbJmQOEzSwPkAY2tJj8fQbR60j8xc
 B+44pUPNncuWklmlxojghN3ssMreVMkFQJ2cT0seFaBWMvxm2FRpGuD44Bc5aNjAsxEL
 oXELxsmfZA5bIcLMBFKQyKg89C6SMiwYZKOQdDQOZWxXzzqCx8cHbpS681skGiQGuQ7I
 xq2A==
X-Gm-Message-State: APjAAAU572yZZJ6BvlJrJz14yPs2CaPoiWI6PHZ5tyNGWEtN1A22Tkw2
 J9hy+aZN4Y1L6Ns+yb3mNlyZCpqmgBw=
X-Google-Smtp-Source: APXvYqx5PpFmXaRxmcMNLsGVaxuxbqlcVJ+0c2uKsH/G1ucdKj5o9cmqRi0zcBZJFnV7nz3FBjZxvA==
X-Received: by 2002:adf:df83:: with SMTP id z3mr4398254wrl.389.1578486399614; 
 Wed, 08 Jan 2020 04:26:39 -0800 (PST)
Received: from debian (11.163.200.146.dyn.plus.net. [146.200.163.11])
 by smtp.gmail.com with ESMTPSA id y139sm3753987wmd.24.2020.01.08.04.26.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 04:26:39 -0800 (PST)
Date: Wed, 8 Jan 2020 12:26:37 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <pdurrant@gmail.com>
Message-ID: <20200108122637.tc2aqdor4ykpk7ub@debian>
References: <20200107173902.13768-1-liuwe@microsoft.com>
 <20200107173902.13768-3-liuwe@microsoft.com>
 <CACCGGhAGY+VtgCtwMz39eRmPT0nch92r8P3JBGhhrWWPtYd+mQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACCGGhAGY+VtgCtwMz39eRmPT0nch92r8P3JBGhhrWWPtYd+mQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <JBeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMDgsIDIwMjAgYXQgMDk6MTE6MTJBTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IE9uIFR1ZSwgNyBKYW4gMjAyMCBhdCAxNzozOSwgV2VpIExpdSA8d2xAeGVuLm9yZz4g
d3JvdGU6Cj4gPgo+ID4gQWxsIHN0cnVjdHVyZXMgYXJlIGFscmVhZHkgbmF0dXJhbGx5IGFsaWdu
ZWQuIExpbnV4IGFkZGVkIHRob3NlCj4gPiBhdHRyaWJ1dGVzIG91dCBvZiBwYXJhbm9pYS4KPiA+
Cj4gPiBJbiBYZW4gd2UndmUgaGFkIGluc3RhbmNlIHdlIGhhZCB0byBkcm9wIHBvaW50bGVzcyBf
X3BhY2tlZCB0byBwbGFjYXRlCj4gPiBnY2MgOSAoc2VlIGNhOTMxMGIyNGUKPiAKPiBJIHRoaW5r
IHlvdSBzaG91bGQgYWRkOgo+IAo+ICJ4ODYvSU8tQVBJQzogZml4IGJ1aWxkIHdpdGggZ2NjOSIK
PiAKPiBoZXJlLgoKSSBoYXZlIGZpeGVkIGl0IHVwIGxvY2FsbHkuIERvIHlvdSB3YW50IG1lIHRv
IHJlc2VuZCB0aGVzZSB0d28gcGF0Y2hlcwpqdXN0IGZvciB0aGlzIHVwZGF0ZT8KCldlaS4KCj4g
Cj4gPiApLCBpdCBpcyBiZXR0ZXIgZHJvcCB0aG9zZSBhdHRyaWJ1dGVzLgo+ID4KPiA+IFJlcXVl
c3RlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+ID4gU2lnbmVkLW9mZi1i
eTogV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0LmNvbT4KPiAKPiAgIFBhdWwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
