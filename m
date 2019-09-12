Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD9DB08AF
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 08:13:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8IJH-0004zZ-H6; Thu, 12 Sep 2019 06:10:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=A35O=XH=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1i8IJF-0004zU-Bm
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 06:10:25 +0000
X-Inumbo-ID: 0201b1d4-d524-11e9-a337-bc764e2007e4
Received: from mail-qk1-x732.google.com (unknown [2607:f8b0:4864:20::732])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0201b1d4-d524-11e9-a337-bc764e2007e4;
 Thu, 12 Sep 2019 06:10:24 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id u184so20479253qkd.4
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2019 23:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4khJvtvRajDiMZAc3ZHaMmXatlkqitFCDNje/5kVeWA=;
 b=ec87IIKFZ1vjnOvQL7sIPZQqXgsBNPXHPicAeN/0Xy73tbRHR12R92uvCdOjQLuiq5
 5Mhzuh2QawjigKhun9cObuBHHE78CMEw1rcPJQVymD+IuYrqFGmoE4RAUzHqIki8eNdc
 skZypa7m+vlbRxRGamJ6kEJl2gyy6ryvkAUzB+MHoRkpeZAE3misfZvzOguj5fcG/2tB
 XfYHIzmEBy+TzIHCFgk4uEm+yPvPDzph7BT0/RKWtbNNY8ZzFSe2nt/h/Fawdo8F4kiC
 KC2co8DDAuvFF3gehY1xeHpZUz1DQPi483ywUe2ApvJyvWzQy0EHU7spnB+fJZB2BDU6
 KCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4khJvtvRajDiMZAc3ZHaMmXatlkqitFCDNje/5kVeWA=;
 b=rGqLpZRF5ABbJ9mLxnSA+BcYV7sJ2UKmLV2gqprm4K0FtDqqg2VG8zSpZ/ModyDci4
 peZtJA+gbFosg5ndtepIGGUlPqbdIM7Y6wxan49n8A8pa1BOFBxcI88IDvZwnMyn0GJR
 bGhyCr2WI8aUi9UK3h+SjOrQudDXSd1qDywAP50G28syViBpD1t8MMEMLVzfORUZO0RM
 kDXRKSusBXNJLb+hkDSTKJ2izErPqIQBkKFmAopvDEQhY/v5X9kWt/e0CdOtWGqeykoM
 uDI/+tYBi9GIAQn5L3m9B51B3B76JI09IlsrGv2WL17FkhVIGhkOGhoxxocF++qbI1S3
 Ze+A==
X-Gm-Message-State: APjAAAUVcw8mLvlSCr3J64kzKp2n2x8XMdJydo/TcFTM33rXYgNgEw4X
 6vtVQ5b2VMHvM7g0kWlxAVEQjLmsfTLcUGNknUEd/Q==
X-Google-Smtp-Source: APXvYqxNEs/Trtec6OipU42Duxi6N9aItS14VrywkMfHlH2Vf8h9ZLmPGO9E7DSLyZRHQa0MzxrFw38JrmDPeU4bI5Y=
X-Received: by 2002:a37:c14:: with SMTP id 20mr38213566qkm.291.1568268623656; 
 Wed, 11 Sep 2019 23:10:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190906074058.21782-1-jgross@suse.com>
In-Reply-To: <20190906074058.21782-1-jgross@suse.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Wed, 11 Sep 2019 23:10:12 -0700
Message-ID: <CAMmSBy_huA=jDwwGfzN1cB8zt3DNP5iJZNSQ_doe1RK-4kzw8Q@mail.gmail.com>
To: Juergen Gross <jgross@suse.com>
Subject: Re: [Xen-devel] [ANNOUNCE] Xen 4.13 Development Update
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
Cc: luwei.kang@intel.com, Wei Liu <wl@xen.org>, konrad.wilk@oracle.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>, olekstysh@gmail.com,
 Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 puwen@hygon.cn, xen-devel@lists.xenproject.org, chao.gao@intel.com,
 Volodymyr_Babchuk@epam.com,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkhCgpPbiBGcmksIFNlcCA2LCAyMDE5IGF0IDEyOjQxIEFNIEp1ZXJnZW4gR3Jvc3MgPGpncm9z
c0BzdXNlLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIGVtYWlsIG9ubHkgdHJhY2tzIGJpZyBpdGVtcyBm
b3IgeGVuLmdpdCB0cmVlLiBQbGVhc2UgcmVwbHkgZm9yIGl0ZW1zIHlvdQo+IHdvdWxkIGxpa2Ug
dG8gc2VlIGluIDQuMTMgc28gdGhhdCBwZW9wbGUgaGF2ZSBhbiBpZGVhIHdoYXQgaXMgZ29pbmcg
b24gYW5kCj4gcHJpb3JpdGlzZSBhY2NvcmRpbmdseS4KPgo+IFlvdSdyZSB3ZWxjb21lIHRvIHBy
b3ZpZGUgZGVzY3JpcHRpb24gYW5kIHVzZSBjYXNlcyBvZiB0aGUgZmVhdHVyZSB5b3UncmUKPiB3
b3JraW5nIG9uLgo+Cj4gPSBUaW1lbGluZSA9Cj4KPiBXZSBub3cgYWRvcHQgYSBmaXhlZCBjdXQt
b2ZmIGRhdGUgc2NoZW1lLiBXZSB3aWxsIHJlbGVhc2UgYWJvdXQgZXZlcnkgOCBtb250aHMuCj4g
VGhlIHVwY29taW5nIDQuMTMgdGltZWxpbmUgYXJlIGFzIGZvbGxvd2VkOgo+Cj4gKiBMYXN0IHBv
c3RpbmcgZGF0ZTogU2VwdGVtYmVyIDEzdGgsIDIwMTkKCk5haXZlIHF1ZXN0aW9uIHBlcmhhcHMs
IGJ1dCBzaW5jZSB0aGUgZmlyc3QgZGVhZGxpbmUgaXMgdHdvIGRheXMgYXdheSwKSSdtIHdvbmRl
cmluZwp3aGF0J3MgbXkgYmVzdCBvcHRpb24gdG8gcHJvdmlkZSBlYXJseSBmZWVkYmFjaz8gQ3Vy
cmVudGx5IHdlJ3JlIHRlc3Rpbmcgd2l0aAptYXN0ZXIgYnJhbmNoIGluIFByb2plY3QgRVZFLCBi
dXQgSSd2ZSBub3RpY2VkIHRoYXQgaXQgaXMgNCB3ZWVrcyBiZWhpbmQgc3RhZ2luZwphdCB0aGlz
IHBvaW50LgoKV2hlbiBpcyBpdCBleHBlY3RlZCB0byBjYXRjaCB1cD8KCj4gKiBIYXJkIGNvZGUg
ZnJlZXplOiBTZXB0ZW1iZXIgMjd0aCwgMjAxOQo+ICogUkMxOiBUQkQKPiAqIFJlbGVhc2U6IE5v
dmVtYmVyIDd0aCwgMjAxOQo+Cj4gTm90ZSB0aGF0IHdlIGRvbid0IGhhdmUgZnJlZXplIGV4Y2Vw
dGlvbiBzY2hlbWUgYW55bW9yZS4gQWxsIHBhdGNoZXMKPiB0aGF0IHdpc2ggdG8gZ28gaW50byA0
LjEzIG11c3QgYmUgcG9zdGVkIGluaXRpYWxseSBubyBsYXRlciB0aGFuIHRoZQo+IGxhc3QgcG9z
dGluZyBkYXRlIGFuZCBmaW5hbGx5IG5vIGxhdGVyIHRoYW4gdGhlIGhhcmQgY29kZSBmcmVlemUu
IEFsbAo+IHBhdGNoZXMgcG9zdGVkIGFmdGVyIHRoYXQgZGF0ZSB3aWxsIGJlIGF1dG9tYXRpY2Fs
bHkgcXVldWVkIGludG8gbmV4dAo+IHJlbGVhc2UuCj4KPiBSQ3Mgd2lsbCBiZSBhcnJhbmdlZCBp
bW1lZGlhdGVseSBhZnRlciBmcmVlemUuCj4KPiBXZSByZWNlbnRseSBpbnRyb2R1Y2VkIGEgamly
YSBpbnN0YW5jZSB0byB0cmFjayBhbGwgdGhlIHRhc2tzIChub3Qgb25seSBiaWcpCj4gZm9yIHRo
ZSBwcm9qZWN0LiBTZWU6IGh0dHBzOi8veGVucHJvamVjdC5hdGxhc3NpYW4ubmV0L3Byb2plY3Rz
L1hFTi9pc3N1ZXMuCj4KPiBTb21lIG9mIHRoZSB0YXNrcyB0cmFja2VkIGJ5IHRoaXMgZS1tYWls
IGFsc28gaGF2ZSBhIGNvcnJlc3BvbmRpbmcgamlyYSB0YXNrCj4gcmVmZXJyZWQgYnkgWEVOLU4u
Cj4KPiBJIGhhdmUgc3RhcnRlZCB0byBpbmNsdWRlIHRoZSB2ZXJzaW9uIG51bWJlciBvZiBzZXJp
ZXMgYXNzb2NpYXRlZCB0byBlYWNoCj4gZmVhdHVyZS4gQ2FuIGVhY2ggb3duZXIgc2VuZCBhbiB1
cGRhdGUgb24gdGhlIHZlcnNpb24gbnVtYmVyIGlmIHRoZSBzZXJpZXMKPiB3YXMgcG9zdGVkIHVw
c3RyZWFtPwo+Cj4gPSBQcm9qZWN0cyA9Cj4KPiA9PSBIeXBlcnZpc29yID09Cj4KPiAqICBQZXIt
Y3B1IHRhc2tsZXQKPiAgIC0gIFhFTi0yOAo+ICAgLSAgS29ucmFkIFJ6ZXN6dXRlayBXaWxrCj4K
PiAqICBDb3JlIHNjaGVkdWxpbmcgKHYyKQo+ICAgLSAgSnVlcmdlbiBHcm9zcwo+Cj4gPT09IHg4
NiA9PT0KPgo+ICogIFBWLUlPTU1VICh2NykKPiAgIC0gIFBhdWwgRHVycmFudAo+Cj4gKiAgSFZN
IGd1ZXN0IENQVSB0b3BvbG9neSBzdXBwb3J0IChSRkMpCj4gICAtICBDaGFvIEdhbwo+Cj4gKiAg
SW50ZWwgUHJvY2Vzc29yIFRyYWNlIHZpcnR1YWxpemF0aW9uIGVuYWJsaW5nICh2MSkKPiAgIC0g
IEx1d2VpIEthbmcKPgo+ICogIExpbnV4IHN0dWIgZG9tYWlucyAoUkZDIHYyKQo+ICAgLSAgTWFy
ZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpCj4KPiAqICBJbXByb3ZlIGxhdGUgbWljcm9jb2RlIGxv
YWRpbmcgKHY5KQo+ICAgLSAgQ2hhbyBHYW8KPgo+ICogIEZpeGVzIHRvICNEQiBpbmplY3Rpb24K
PiAgIC0gIEFuZHJldyBDb29wZXIKPgo+ICogIENQVUlEL01TUiBYZW4vdG9vbHN0YWNrIGltcHJv
dmVtZW50cwo+ICAgLSAgQW5kcmV3IENvb3Blcgo+Cj4gKiAgSW1wcm92ZW1lbnRzIHRvIGRvbWFp
bl9jcmFzaCgpCj4gICAtICBBbmRyZXcgQ29vcGVyCj4KPiAqICBFSUJSUwo+ICAgLSAgQW5kcmV3
IENvb3Blcgo+Cj4gKiAgWGVuIGlvcmVxIHNlcnZlciAodjIpCj4gICAtICBSb2dlciBQYXUgTW9u
bmUKPgo+ID09PSBBUk0gPT09Cj4KPiAqICBURUUgbWVkaWF0b3IgKGFuZCBPUC1URUUpIHN1cHBv
cnQgaW4gWEVOICh2NykKPiAgIC0gIFZvbG9keW15ciBCYWJjaHVrCj4KPiAqICBSZW5lc2FzIElQ
TU1VLVZNU0Egc3VwcG9ydCArIExpbnV4J3MgaW9tbXVfZndzcGVjICh2MikKPiAgIC0gIE9sZWtz
YW5kciBUeXNoY2hlbmtvCj4KPiA9PSBDb21wbGV0ZWQgPT0KPgo+ICogIERyb3AgdG1lbQo+ICAg
LSAgV2VpIExpdQo+Cj4gKiAgQWRkIHN1cHBvcnQgZm9yIEh5Z29uIERoeWFuYSBGYW1pbHkgMTho
IHByb2Nlc3Nvcgo+ICAgLSAgUHUgV2VuCj4KPiAqICBoeXBlcnZpc29yIHg4NiBpbnN0cnVjdGlv
biBlbXVsYXRvciBhZGRpdGlvbnMgZm9yIEFWWDUxMgo+ICAgLSAgSmFuIEJldWxpY2gKPgo+ICog
IHgyQVBJQyBzdXBwb3J0IGZvciBBTUQKPiAgIC0gIEphbiBCZXVsaWNoCj4KPgo+IEp1ZXJnZW4g
R3Jvc3MKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdAo+IFhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
Zwo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
