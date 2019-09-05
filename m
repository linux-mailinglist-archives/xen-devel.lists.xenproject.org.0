Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBD3A9C27
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 09:44:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5mOV-00039V-6F; Thu, 05 Sep 2019 07:41:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=sH3W=XA=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1i5mOT-00039Q-HT
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 07:41:25 +0000
X-Inumbo-ID: 8fd34528-cfb0-11e9-978d-bc764e2007e4
Received: from mail-io1-xd42.google.com (unknown [2607:f8b0:4864:20::d42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8fd34528-cfb0-11e9-978d-bc764e2007e4;
 Thu, 05 Sep 2019 07:41:24 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id j4so2527747iog.11
 for <xen-devel@lists.xenproject.org>; Thu, 05 Sep 2019 00:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=58MSgYcKLi2yz6OJBASGRmGZDTjZC+cVgpFIPxw56Gg=;
 b=MWqZB5CUJsSTUicd+hpXJ1I+3ALY9uyR1nCERA5ZO7zC9TB/CLuL85uUwr1UTlGZi9
 5RbqquuNkCCJYRtP15SrNOOvn4aBA3iUjH9ztTeWpGWQ/+rW9K/GsnlYSFF2jU6OHria
 9jf/F+7eVWv77Oge/EqTO38J9EEYjPJgrGY/Ildq4KB1k2ueMCtf2IGWiIT3CqaqD0M0
 gS/WRpRFGXTrROQvPWBj5r/aiEfPLZXX/BBxu5F9hOURX+s0qY2c0Dn4R8Vqyv5mknnu
 mb4ugjneP+zSWUq4L3nJxiz+B70cazdJZXRa3fdmhG762NbHS5FAucRDLQOkU1ZscgIK
 iXjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=58MSgYcKLi2yz6OJBASGRmGZDTjZC+cVgpFIPxw56Gg=;
 b=MqqvhzZS+JvPr4+OrKdlHKFhOBAsqsSu0EmOKUKQzDi+x7N9Sg9mwa1BvOq6D6tQA9
 UVRHexd8DlA693R6FvvHB/LJ07dEeXtMEqEvIq6xqWiT6niAXltFuI5BwCmQaZQVpiBX
 DYfzMqy/58EIKyFd7UXXc1xrKCMWu2MzV0yuRyhtUvJVAbIKs7kgS3gmhEZZbgze+p7z
 OozPXP/nDMIcLUts6hoZcYwi4B3EnFLe0HJy1Wk6f0wJ0RAq/KoMlrEbGsG9WDTuGTTK
 N4PxC20zNFBSXTXEXzOYSR0pBInG2swS3reCTGS9ARiUVdt16npho/jpWUk1wDbq9rAk
 vuvQ==
X-Gm-Message-State: APjAAAVziruC81+rK5Ow4/rjALq/yR6ugfr2sFhFOE5ABoDvQXlCDmef
 oOrX+mYFWyHM0XUq85oXH2M=
X-Google-Smtp-Source: APXvYqwmvPk75sHglFLlccGEWyFr76OQLpk0NDetr3Q1FNoAarKigJPlwhW3GXkbXTiB19SXUKuNDQ==
X-Received: by 2002:a5d:8d19:: with SMTP id p25mr2304351ioj.247.1567669284257; 
 Thu, 05 Sep 2019 00:41:24 -0700 (PDT)
Received: from [100.64.72.214] ([205.185.206.122])
 by smtp.gmail.com with ESMTPSA id l21sm993094iom.24.2019.09.05.00.41.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 05 Sep 2019 00:41:23 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Rich Persaud <persaur@gmail.com>
X-Mailer: iPad Mail (16G102)
In-Reply-To: <b434d04f-d4e8-3b00-4efb-bf71c02e5075@suse.com>
Date: Thu, 5 Sep 2019 03:41:22 -0400
Message-Id: <11D8BF8A-BF9E-4610-8A80-8698B705AFAB@gmail.com>
References: <6DA859DE-62FD-48C1-BBEE-C7A63D751B3E@citrix.com>
 <E8BC34C9-934A-4383-833B-B9AE6C9540A9@gmail.com>
 <b434d04f-d4e8-3b00-4efb-bf71c02e5075@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [ANNOUNCE] Call for agenda items for September 5th
 Community Call @ 15:00 UTC
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
Cc: Rian Quinn <rianquinn@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Doug Goldstein <cardoe@cardoe.com>, Julien Grall <julien.grall@arm.com>,
 "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>,
 Matt Spencer <Matt.Spencer@arm.com>,
 "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>,
 John Ji <john.ji@intel.com>, "robin.randhawa@arm.com" <robin.randhawa@arm.com>,
 "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>,
 "mirela.simonovic@aggios.com" <mirela.simonovic@aggios.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Lars Kurth <lars.kurth@citrix.com>,
 Juergen Gross <jgross@suse.com>, Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Paul Durrant <Paul.Durrant@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "vfachin@de.adit-jv.com" <vfachin@de.adit-jv.com>,
 "intel-xen@intel.com" <intel-xen@intel.com>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Sergey Dyasli <sergey.dyasli@citrix.com>, Brian Woods <brian.woods@amd.com>,
 Jeff Kubascik <Jeff.Kubascik@dornerworks.com>,
 Janakarajan Natarajan <jnataraj@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBPbiBTZXAgNSwgMjAxOSwgYXQgMDM6MTksIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4gd3JvdGU6Cj4gCj4+IE9uIDA1LjA5LjIwMTkgMDQ6MzIsIFJpY2ggUGVyc2F1ZCB3cm90ZToK
Pj4gQWdlbmRhIGl0ZW06ICBEb21haW4gbmFtZSBzZXJ2aWNlIGZvciBuZXN0ZWQgdmlydCBhbmQg
ZGlzYWdncmVnYXRpb24gCj4+IAo+PiAodGV4dCBiYXNlZCBvbiBkcmFmdCBieSBEYW5pZWwgU21p
dGgsIHdobyB3aWxsIHNwZWFrIHRvIHRoaXMgYWdlbmRhIGl0ZW0pCj4+IAo+PiBJZiBhIGZ1dHVy
ZSwgbWluaW1hbCAiTDAgWGVuIiBoeXBlcnZpc29yIGNhbiBiZSBvcHRpbWl6ZWQgZm9yIG5lc3Rl
ZCB2aXJ0dWFsaXphdGlvbiBpbiBncmVlbmZpZWxkIGRlcGxveW1lbnRzIChpLmUuIG5vIHJlcXVp
cmVtZW50IHRvIG1haW50YWluIGV4aXN0aW5nIGh5cGVydmlzb3ItZ3Vlc3QgaW50ZXJmYWNlcyks
IHRoZW4gUFYgZHJpdmVyIG1lY2hhbmlzbXMgb3RoZXIgdGhhbiBncmFudHMsIGV2ZW50cyBhbmQg
eGVuc3RvcmUgY291bGQgYmUgY29uc2lkZXJlZC4gIFRoaXMgd2FzIGRpc2N1c3NlZCBpbiBhIFhl
biBTdW1taXQgMjAxOSBkZXNpZ24gc2Vzc2lvbjoKPj4gaHR0cHM6Ly9saXN0cy5ndC5uZXQveGVu
L2RldmVsLzU2MDk3Mwo+PiAKPj4gRm9yIHNvbWUgT3BlblhUIHVzZSBjYXNlcywgd2UgYXJlIGlu
IHRoZSBwcm9jZXNzIG9mIGZ1cnRoZXIgZGlzYWdncmVnYXRpbmcgdGhlIHBsYXRmb3JtLiAgV2Ug
bmVlZCBhIG5hbWUgc2VydmljZSB0byBlbmFibGUgdGhlIGRpc2FnZ3JlZ2F0ZWQgc2VydmljZSBk
b21haW5zIHRvIGRpc2NvdmVyIHRoZSBvdGhlciBzZXJ2aWNlIGRvbWFpbnMgd2l0aCB3aGljaCB0
aGV5IG5lZWQgdG8gY29tbXVuaWNhdGUuICBYZW5zdG9yZSBpcyBub3Qgc3VmZmljaWVudCwgYXMg
d2Ugd291bGQgbGlrZSB0byB1c2UgRmxhc2sgdG8gY29udHJvbCB0aGUgZGF0YSBmbG93LCBhcyB3
ZWxsIGFzIGFwcGx5aW5nIG1hbmRhdG9yeSBhY2Nlc3MgY29udHJvbCB0byBzZXJ2aWNlIGNhbGxz
LiAKPj4gCj4+IFdlIGFyZSByZWFjaGluZyBvdXQgdG8gdGhlIFhlbiBDb21tdW5pdHkgdG8gZWxp
Y2l0IGlucHV0IG9uIGFwcHJvYWNoZXMsIHN1Y2ggdGhhdCB3ZSBtaWdodCBiZSBhYmxlIHRvIHN1
Ym1pdCBhbiB1cHN0cmVhbSBSRkMgYmFzZWQgb24gb3VyIGVhcmx5IHdvcms6Cj4+IAo+PiAtIEZv
ciBhIGNvbW11bmljYXRpb24gY2hhbm5lbCB3ZSBhcmUgbG9va2luZyB0byBsZXZlcmFnZSBBcmdv
LCB3aGljaCBpcyBjdXJyZW50bHkgaW4gZXhwZXJpbWVudGFsIHN0YXR1cy4gSXRzIHByZWRlY2Vz
c29yICh2NHYpIGlzIGFscmVhZHkgYmVpbmcgdXNlZCBpbiBhIHNpbWlsYXIgZmFzaGlvbiBieSBC
cm9taXVtIHVYZW4gKGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVueHQvdXhlbiksIHdoaWNoIGZ1bmN0
aW9ucyB3ZWxsIGFjcm9zcyBuZXN0ZWQgaHlwZXJ2aXNvcnMuICB1WGVuIHY0diBpbmNsdWRlcyBh
IG1lY2hhbmlzbSB0byBjb250cm9sIGluZm9ybWF0aW9uIGZsb3cuCj4+IAo+PiAtIEFuIG9wZW4g
cXVlc3Rpb24gaXMgaG93IHRvIGFkZHJlc3MgdGhlIGRvbWFpbnMuIFhlbiBkb21haW4gaWRzIGFy
ZSByZXVzZWQgYW5kIGhhdmUgbm8gZ3VhcmFudGVlIGZvciB1bmlxdWVuZXNzLiAgVVVJRHMgYXJl
IGF2YWlsYWJsZSBhbmQgY2FuIHByb3ZpZGUgYmV0dGVyIGd1YXJhbnRlZXMgZm9yIHVuaXF1ZW5l
c3MuIEFub3RoZXIgYXBwcm9hY2ggaXMgdG8gdXNlIHRoZSBuYW1lIHN0cmluZyB3aGljaCBhbGxv
d3MgdGhlIGFiaWxpdHkgZm9yIHB1bmN0dWF0aW9uIGNoYXJhY3RlcnMsIGVnLiA6IG9yIC8sIHRv
IGNyZWF0ZSBuYW1lc3BhY2VkIG5hbWVzIGZvciB0aGUgZG9tYWlucy4KPiAKPiBGb3JnaXZlIG1l
IGFza2luZywgYnV0IHdoeSBpcyB0aGlzIHB1dCB1cCBhcyBhbiBhZ2VuZGEgaXRlbSBoZXJlPwo+
IElNTyB0aGlzIGlzIHRoZSBraW5kIG9mIHRoaW5nIHdoZXJlIHlvdSB3b3VsZCBzZW5kIGEgcHJv
cG9zYWwgYW5kCj4gcmVxdWVzdCBmZWVkYmFjayBieSBlbWFpbCBmaXJzdCwgYW5kIHB1dCBpdCB1
cCBhcyBhbiBhZ2VuZGEgaXRlbQo+IGhlcmUgb25seSBpZiBpdCBnb3Qgc3RhbGxlZCB0aGVyZS4g
KEFwb2xvZ2llcyBpZiBJJ3ZlIG92ZXJsb29rZWQKPiBzdWNoIGEgc3RhbGxlZCB0aHJlYWQuKQoK
SWYgWGVuIGNvbW11bml0eSBjYWxsIHRvcGljcyBhcmUgbGltaXRlZCB0byBlc2NhbGF0aW9ucyBv
ZiB4ZW4tZGV2ZWwgdGhyZWFkcywgdGhlbiBhIG5ldyB0aHJlYWQgY2FuIGJlIGNyZWF0ZWQgZm9y
IHRoaXMgdG9waWMuIFhlbiBjb21tdW5pdHkgY2FsbHMgaGF2ZSBhbHNvIHByb3ZpZGVkIHJlYWwt
dGltZSwgaW50ZXJhY3RpdmUgZmVlZGJhY2sgb24gY2FuZGlkYXRlIHByb3Bvc2FscywgYWxvbmcg
d2l0aCBndWlkYW5jZSBvbiBhcmVhcyB3aGljaCBuZWVkIGRvY3VtZW50YXRpb24gYmVmb3JlIGEg
Zm9ybWFsIHByb3Bvc2FsIGlzIG1hZGUgdG8geGVuLWRldmVsLiAgIFN1Y2ggYWdlbmRhIGl0ZW1z
IGFyZSB0eXBpY2FsbHkgY292ZXJlZCBhZnRlciBhbGwgc2VyaWVzIGFuZCBwcmlvcml0eSB0b3Bp
Y3MgaGF2ZSBiZWVuIGFkZHJlc3NlZC4KClJpY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
