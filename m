Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E34BEFBA46
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2019 21:57:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUze6-0003k6-E4; Wed, 13 Nov 2019 20:53:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QW09=ZF=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iUze4-0003jx-Vu
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2019 20:53:45 +0000
X-Inumbo-ID: ad9b1b5c-0657-11ea-b678-bc764e2007e4
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ad9b1b5c-0657-11ea-b678-bc764e2007e4;
 Wed, 13 Nov 2019 20:53:44 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id n21so4118491ljg.12
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2019 12:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Bi73+tOEPP0o8yZ+qvrMj17pzlbfyctYH+mLhH/4fME=;
 b=MxkeuLnSTnYJei09eLqur6hZmat0zcKZNAAIhHgwuYV/Wbu6k1TJjSuFtte544HnMF
 LbeJN0lXVtAr9H27D1ZgyEox9uaSTEEtNryzXQpHN39WnbmJDHVRIITGLYi3TqiEEIRs
 0Kmw7V5OUUsjH5GoBldM+FfhR2v93OBf3dL+ZGDNI6zBVDtlTo0m7fYtygp7i6clIh6+
 lrQGIzUV8VJ+lH+BQzqz8cGnCMJzBHFxzE8J5Q3J1mFsEJooz63jc1ZPXtFq0YfrbPJI
 Zzynx6HT75K8wSLwA1gmd3MkhMq2T/Mq+ODTCHmu/qdCr+KSd7DdpGI7FmZraMBUON/l
 mgpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Bi73+tOEPP0o8yZ+qvrMj17pzlbfyctYH+mLhH/4fME=;
 b=T0ybFbo5nFOt40v4691v+K/pGYaQ21GomJ5lp2ENZVEE0ebn9bcCjBaDTyl2hozXm1
 xTIIrrlz5j4jvmfAQGiUWN1eY+vvJ/8+Gil3lpsIZ51xazp06G5HxIYksmG3EOild3yS
 2Xr1CvMSgXynC28mCFmlqceB2OzTITDs9LvlIeCvAYbZ24+mN8vLve/8kuFjaA5Y2eHj
 q/q7IR1RhFnELfc4lAp3LPebUiFVfYVxuH+qhhS9zA2vuSIXxDF5XUFfT/nfRYbMq/LC
 nIN4lwdJ54+bnKRiEskwbN9tisKwtv4oYLSK3qSeqSeNmVZ1868KO74DFH2Wig4sF/dH
 i0bw==
X-Gm-Message-State: APjAAAUeg57tksIhhFgJhKlwB70moeABp9j7mYjCkPAKwLjD4V5V7rki
 ktvoXS+mXoivq+Plw4ZNbDurpQSa8qgfIDnRyLI=
X-Google-Smtp-Source: APXvYqxV6eDWr9Tj9Qbk9BCmeKymP36PevVicFi0cszZO+KJXwK0FZl/FID1xQ/8kC7CESphxHLUHTstgKTUDYUldp0=
X-Received: by 2002:a05:651c:95:: with SMTP id 21mr4085685ljq.40.1573678422509; 
 Wed, 13 Nov 2019 12:53:42 -0800 (PST)
MIME-Version: 1.0
References: <cover.1570456846.git.rosbrookn@ainfosec.com>
 <e6f9c93bd09a247fb0675b01aae8c1f2819f9a70.1570456846.git.rosbrookn@ainfosec.com>
 <785579f1-05c8-d5c8-d3a6-450126232708@citrix.com>
In-Reply-To: <785579f1-05c8-d5c8-d3a6-450126232708@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Wed, 13 Nov 2019 15:53:31 -0500
Message-ID: <CAEBZRScFS1qfbQYBwL3j1CKSrz=c5oUPavEv9vWT9-nUkjWu9g@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH 06/24] golang/xenlight: re-name Bitmap
 marshaling functions
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, kerriganb@ainfosec.com,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBBbnkgcGFydGljdWxhciByZWFzb24gdG8gdXNlIGBjc2xpY2VgIGhlcmUgcmF0aGVyIHRoYW4g
YG1hcHNsaWNlYCAob3IKPiB2aWNlIHZlcnNhKT8KPgo+IE5vdCBhIGJpZyBkZWFsLCBidXQgc2lu
Y2UgdGhleSdyZSBvZiB0aGUgY2FtZSBlbGVtZW50IGluIHRoZSBDIHN0cnVjdCwKPiBpdCBzZWVt
cyBsaWtlIGl0IHdvdWxkIGJlIGJldHRlciB0byBnaXZlIHRoZW0gdGhlIHNhbWUgbmFtZS4gIChE
b24ndAo+IGhhdmUgYSBzdHJvbmcgb3BpbmlvbiBvbiB3aGljaCBvbmUpLgoKSUlSQywgSSBmb3Vu
ZCB0aGUgbmFtZSBgbWFwc2xpY2VgIGEgbGl0dGxlIGNvbmZ1c2luZywgc2luY2UgaXQgd2Fzbid0
Cm9mIHR5cGUgW11tYXBbVDFdVDIuIEJ1dCwgYXMgdG8gdGhlIGluY29uc2lzdGVudCBuYW1pbmcg
YmV0d2VlbiB0aGUKdHdvIGZ1bmN0aW9ucywgSSBhZ3JlZS4gSSdsbCBuYW1lIHRoZW0gYm90aCBg
Y3NsaWNlYC4KCi1OUgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
