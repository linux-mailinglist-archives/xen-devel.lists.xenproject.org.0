Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E86D813E1CA
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 17:52:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1is8Lr-0005Ki-1p; Thu, 16 Jan 2020 16:50:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=F4nH=3F=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1is8Lp-0005Kd-6d
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 16:50:33 +0000
X-Inumbo-ID: 4ec36d40-3880-11ea-ac27-bc764e2007e4
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4ec36d40-3880-11ea-ac27-bc764e2007e4;
 Thu, 16 Jan 2020 16:50:32 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id u1so23452941ljk.7
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jan 2020 08:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IPOpj4vjs6N68C1/vfxlcEhfvjG5UW9jl9xEZjomQN4=;
 b=lBpmFAhJ9y5/ytkCyLFJ5rzzC+9f5TjxgwG8ovSDFSQ3jTrb5N/4FFFcMDoOmY2sK6
 lcT8Px75xASspHh7B1wL7gN8TlTup9sxgzPL7KVBGO7TtvVUDZJw/wG1I21T7pdGDFTO
 AN7ScKtFxPgMLe9IbsQWUauuXex4rvoM0zUhtbFy0mCQsIK4jcn1Tu2Hm4eHzvLb4tZ/
 kxsMPIRXisvhs0GyA5OpQUtjM4MKLmLtjwwpy2GIYHAUshpb7eDocE2fjcaU1d7rrRzh
 ft5piTHVAaURHdyL2AbZCYU8mhzljzniRyi8AdphAAJlPeTy9J6SOxLGv4kMhUp8dtd8
 bUow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IPOpj4vjs6N68C1/vfxlcEhfvjG5UW9jl9xEZjomQN4=;
 b=raAs7rQcw8+5VGJYbx2ve1njitoDWm3jXA3p669L+tD7ll1vyy7U2hDmvHCgnOKNtx
 BquHiKDTaX/AbNg/YSDYF+Z5oy5/4YhnL9+55GimQNKKu44j0hNUwYr/MWtRMMIa6blf
 /s69rj6RCSPNGJD3o637Q9oaIh3sOXh4JJds8+vrunYw/wSJFsDsWScGPNdarWHlwTHP
 3WIvhplHrxB801BgI5LbNfBjfjU+T6u6DPUekXBHtjwPqTbDv0dUqOfliS3vZkNG2N5p
 63q40DOiaukrhqLUEiq0JBicU/wCnbRnnY2fNHGySKdA+fzUOP8EwvGB00kv1xDJYUzo
 PX4g==
X-Gm-Message-State: APjAAAV1sHEstNLLnxvZyczg7giSJzTyKNjiXk+9sDpfehFnOkF1HEnf
 /K2kAPPa3dhy0bdl7iCLY0holtbTuz10pUgm8Ag=
X-Google-Smtp-Source: APXvYqzRTD8exIZQPgc75d4CI8YlLenXp6QzsDkOjCw0WjwJsc4YJp9S7muIU/5JQSsoxDlXNqmz+tCalteCj5Bf2c0=
X-Received: by 2002:a2e:98c4:: with SMTP id s4mr2910662ljj.102.1579193430859; 
 Thu, 16 Jan 2020 08:50:30 -0800 (PST)
MIME-Version: 1.0
References: <cover.1578170151.git.rosbrookn@ainfosec.com>
 <3a36857aeebe9a8ec3c4bc64f8ee77cdab035d6e.1578170151.git.rosbrookn@ainfosec.com>
 <f6ac3a54-a848-e2d1-7604-da318c871513@citrix.com>
In-Reply-To: <f6ac3a54-a848-e2d1-7604-da318c871513@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Thu, 16 Jan 2020 11:50:19 -0500
Message-ID: <CAEBZRSfZbeO6r2Qt1nfjQ_N0WCtu_xpwuZ1oS487uQ+=iXBAGw@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH v5 1/3] golang/xenlight: begin Go to C type
 marshaling
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
 Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBMb29rcyBnb29kISAgT25seSBvbmUgcXVlc3Rpb246Cj4KPiA+ICsgICAgaWYgbm90IGlzX2Nh
c3RhYmxlOgo+ID4gKyAgICAgICAgcyArPSAnaWYgZXJyIDo9IHgue30udG9DKCZ4Yy57fSk7IGVy
ciAhPSBuaWwge3tcbicuZm9ybWF0KGdvbmFtZSxjbmFtZSkKPgo+IEVyciBzaG91bGQgYmUgZGVm
aW5lZCBmdW5jdGlvbi13aWRlIGF0IHRoaXMgcG9pbnQuICBBcmUgeW91IHVzaW5nIGA6PWAKPiBv
biBwdXJwb3NlIGZvciBzb21lIHJlYXNvbj8gIFdvdWxkIGl0IG1ha2Ugc2Vuc2UgdG8gbWFrZSB0
aGlzIGA9YCBpbnN0ZWFkPwoKVGhpcyBpcyBvbiBwdXJwb3NlLiBJTU8gaXQncyBiZXR0ZXIgdG8g
a2VlcCB0aGUgdmFyaWFibGUgc2NvcGVkIHRvIHRoZQppZiBibG9jayB3aGVuIHVzaW5nIHNob3J0
IHN0YXRlbWVudCBpZiBzeW50YXguIElmIHRoZSBkZXNpcmUgaXMgdG8KYXNzaWduIHRvIHRoZSBz
YW1lIGBlcnJgIHZhcmlhYmxlLCB0aGVuIEkgd291bGQgbm90IHVzZSB0aGUgc2hvcnQKc3RhdGVt
ZW50LiBSZWFzb24gYmVpbmcgSSB0aGluayBpdCBoZWxwcyByZWFkYWJpbGl0eTsgdGhlIHNob3J0
CnN0YXRlbWVudCBzeW50YXggaXMgaGFuZHksIGJ1dCBpdCBpcyBlYXN5IHRvIGdsYW5jZSBvdmVy
IGFuZCBub3QKcmVhbGl6ZSBhbiBhc3NpZ25tZW50IGlzIGJlaW5nIG1hZGUuCgpUaGFua3MsCi1O
UgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
