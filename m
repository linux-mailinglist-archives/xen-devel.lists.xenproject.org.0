Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F7E7214E
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 23:08:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hq1yh-0008Im-Gn; Tue, 23 Jul 2019 21:05:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OdSp=VU=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1hq1yg-0008Ih-Gd
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 21:05:42 +0000
X-Inumbo-ID: a0a5c066-ad8d-11e9-8980-bc764e045a96
Received: from mail-qt1-x841.google.com (unknown [2607:f8b0:4864:20::841])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a0a5c066-ad8d-11e9-8980-bc764e045a96;
 Tue, 23 Jul 2019 21:05:41 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id z4so43339965qtc.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2019 14:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ahIOsf7W7EtfGxt0Yml/QBXqe56G57NObTigXSsjlXM=;
 b=F2gbRhUf/Xp/ywwHjEhUlCjRtGE4VFDYAVFyIkWHamalG8NO0SWYjlTNfdepXyZUoT
 t9VhaUfWC1munUc4T/x8M9JBb+RbXJfrRVMPSBYn0EUV8CsfE6IV0LcqMHvggHDrUjZe
 bjxHvCncsHro+Ha0NOwE43NPnAqotpF4e7NenUQ/Za+/Y0z5kJGKRTAFxCi4A9FU8wug
 ShxqP1RziFDRMrT/DF+D6KasCJ1+MCHJC+3Wux724KW24MwifaagJ2KSgjd8hY++c1cw
 IYAJ3lxJxl11f4w004qZItBHgzVAmbJOpCXMHF2U/LM2UZ2cXJcKiEoMKxjMfshcrZ82
 J9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ahIOsf7W7EtfGxt0Yml/QBXqe56G57NObTigXSsjlXM=;
 b=k7b7qdob/SjRfHnJpeQXPFztrnMKK+4wxTaHcJd46zzI/C4QHtgLjiBkGIl90DNPiH
 uS4cYnZ8+i/S8Gg+KTevEyIgxG+wQ5Bh5P2FmacEE9L8wNd0t5IPhzA47UiNJS5KYa4L
 qrMFaykmYLJqaQHMnvQbL8mnkJzxfd+0N5S6tD8v8mMDnCJhadUXaAb8Z2QhysGKd3D6
 B+8zZsiy0E6iQ/uOFf1uVkAOoR0P8+QGinT/bw+xaFafqYGiNEKWIcC4TF62mE5xbB9h
 oDlsgVj+Vw/7wEVRZ2NJloxh0qLZli0vlVcVHgSP/Ve9B+xA8er+uCaz3z/4a/mf1qkA
 Zk0g==
X-Gm-Message-State: APjAAAVC+95c+Soa5aiGLVrG4cuc2biAB2S6LiMyZfi4A/6xKwV+hb1f
 /obbttXb6iaMPBQfjwHrob3zCXMm2ZNakgDWU0BD1g==
X-Google-Smtp-Source: APXvYqwAt3oUm9bM11Hi5lwExfTA2McHavAfgPs+r/zEbWG4VfeCKmAP9jxDAR8wbeFAcqQhVSaUtZz7e37rIIVucEs=
X-Received: by 2002:ac8:60a:: with SMTP id d10mr53237110qth.31.1563915940463; 
 Tue, 23 Jul 2019 14:05:40 -0700 (PDT)
MIME-Version: 1.0
References: <b1008379-a9cf-f7ab-b34b-da463ec5f074@suse.com>
 <20190723205929.GK3433@reaktio.net>
In-Reply-To: <20190723205929.GK3433@reaktio.net>
From: Roman Shaposhnik <roman@zededa.com>
Date: Tue, 23 Jul 2019 14:05:29 -0700
Message-ID: <CAMmSBy_0KsjQ_e7S=nVxCEuowtEjfMOZ9Rf_DgHcgM6am3vCdQ@mail.gmail.com>
To: =?UTF-8?B?UGFzaSBLw6Rya2vDpGluZW4=?= <pasik@iki.fi>
Subject: Re: [Xen-devel] preparations for 4.12.1
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
Cc: Lars Kurth <lars.kurth@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMjowMCBQTSBQYXNpIEvDpHJra8OkaW5lbiA8cGFzaWtA
aWtpLmZpPiB3cm90ZToKPgo+IEhpLAo+Cj4gT24gRnJpLCBKdWwgMTksIDIwMTkgYXQgMDI6MjM6
NDRQTSArMDAwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPiBBbGwsCj4gPgo+ID4gdGhlIHJlbGVh
c2UgaXMgZHVlIGluIGVhcmx5IEF1Z3VzdC4gUGxlYXNlIHBvaW50IG91dCBiYWNrcG9ydHMgeW91
Cj4gPiBmaW5kIG1pc3NpbmcgZnJvbSB0aGUgcmVzcGVjdGl2ZSBzdGFnaW5nIGJyYW5jaCwgYnV0
IHdoaWNoIHlvdQo+ID4gY29uc2lkZXIgcmVsZXZhbnQuIFRoZSBvbmUgY29tbWl0IEkndmUgcXVl
dWVkIGFscmVhZHkgb24gdG9wIG9mCj4gPiB3aGF0IHdhcyBqdXN0IHB1c2hlZCBpcwo+ID4KPiA+
IGVjMmFiNDkxYjUgICAgeDg2L2VwdDogcGFzcyBjb3JyZWN0IGxldmVsIHRvIHAybV9lbnRyeV9t
b2RpZnkKPiA+Cj4KPiBJJ2QgbGlrZSB0byByZXF1ZXN0IGJhY2twb3J0IG9mIHRoZSBmb2xsb3dp
bmcgY29tbWl0IGZvciA0LjEyLjE6Cj4KPiAibGlieGw6IGZpeCBwY2kgZGV2aWNlIHJlLWFzc2ln
bmluZyBhZnRlciBkb21haW4gcmVib290IjoKPiBjb21taXQgIGMxOTQzNGQ5Mjg0ZTkzZTZmOWFh
ZWM5YTcwZjVmMzYxYWRiZmFiYTYKPgo+IGh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/
cD14ZW4uZ2l0O2E9Y29tbWl0O2g9YzE5NDM0ZDkyODRlOTNlNmY5YWFlYzlhNzBmNWYzNjFhZGJm
YWJhNgoKRldJVzogSSdkIGxpa2UgdG8gc2Vjb25kIHRoYXQuCgpUaGFua3MsClJvbWFuLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
