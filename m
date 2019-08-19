Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C5191E8A
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 10:03:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzcaz-0000l1-Kd; Mon, 19 Aug 2019 08:00:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Zvmd=WP=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1hzcax-0000kv-IQ
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 08:00:51 +0000
X-Inumbo-ID: 75ab3e46-c257-11e9-b90c-bc764e2007e4
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 75ab3e46-c257-11e9-b90c-bc764e2007e4;
 Mon, 19 Aug 2019 08:00:50 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id j16so7645682wrr.8
 for <xen-devel@lists.xenproject.org>; Mon, 19 Aug 2019 01:00:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=oFEd2AuWpPNsTca94G0kHjSfrBNsaO71rwcTO1bUcok=;
 b=cWkh1iApMNAw9v+leMAy16pNR38bPeo3Q3wlM6jeAKWI8IZqPI39dilItC2n3lZpx2
 656SCvkn+FhLv9tFfUNc6az/zNe+cj6wp0FtmcmpRF1k0V71IRANKFx3S6slM6gxEAFP
 4QZaHQqH7ea4U/9p11/14KsFaNYEWSWjJ9h8jhYSa97KZYgMnmVeU8+0S++g3q/yS06o
 pVsgredejoafhJckaI64V4WGi2USaF4OnaMxzEVe9lo1AgHfbJkj2skSY9bmrBLhDuLr
 nu8/dmBnXwcyi+fZwoKGRdiJNnd31i6XpfOuzA3uKZ2rga4WKyO/xT8eQ4MBx7Aorj8I
 B8Hg==
X-Gm-Message-State: APjAAAWsotPTIQ2jR/Qx+unONLK1vfLB3Qnls2RWxvC4lfmd/VECGTsd
 +0Vbk6k79uVQwKftrL0HXp8=
X-Google-Smtp-Source: APXvYqw0ReypeCKsYhQ1z5077cRWZ50Ir6/6XIXH2LWo1FBr0F527nPXWxH09bc+pp3ATaiVD+BO1g==
X-Received: by 2002:a5d:6606:: with SMTP id n6mr26945240wru.346.1566201650081; 
 Mon, 19 Aug 2019 01:00:50 -0700 (PDT)
Received: from
 liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.140.50.101])
 by smtp.gmail.com with ESMTPSA id f23sm10532903wmj.37.2019.08.19.01.00.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 01:00:49 -0700 (PDT)
Date: Mon, 19 Aug 2019 08:00:48 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190819080048.a76nfrnnb2tbdcxo@liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <20190621093005.29329-1-olaf@aepfle.de>
 <20190818172026.25jeivjl7gpydynh@debian>
 <0343263e-ae0e-d178-f940-838021d7cae3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0343263e-ae0e-d178-f940-838021d7cae3@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v1] docs: substitute XEN_CONFIG_DIR in
 xl.conf.5
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
Cc: xen-devel@lists.xenproject.org, Olaf Hering <olaf@aepfle.de>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU3VuLCBBdWcgMTgsIDIwMTkgYXQgMDY6Mjc6MjZQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxOC8wOC8yMDE5IDE4OjIwLCBXZWkgTGl1IHdyb3RlOgo+ID4gT24gRnJpLCBK
dW4gMjEsIDIwMTkgYXQgMTE6MzA6MDVBTSArMDIwMCwgT2xhZiBIZXJpbmcgd3JvdGU6Cj4gPj4g
eGwoMSkgb3BlbnMgeGwuY29uZiBpbiBYRU5fQ09ORklHX0RJUi4KPiA+PiBTdWJzdGl0dXRlIHRo
aXMgdmFyaWFibGUgYWxzbyBpbiB0aGUgbWFuIHBhZ2UuCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5
OiBPbGFmIEhlcmluZyA8b2xhZkBhZXBmbGUuZGU+Cj4gPj4gLS0tCj4gPj4gIGRvY3MvbWFuL3hs
LjEucG9kLmluICAgICAgfCAyICstCj4gPj4gIGRvY3MvbWFuL3hsLmNvbmYuNS5wb2QuaW4gfCAy
ICstCj4gPj4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2RvY3MvbWFuL3hsLjEucG9kLmluIGIvZG9jcy9tYW4v
eGwuMS5wb2QuaW4KPiA+PiBpbmRleCAzZDY0ZWFhNWIyLi5mYjE3MTUzNjM1IDEwMDY0NAo+ID4+
IC0tLSBhL2RvY3MvbWFuL3hsLjEucG9kLmluCj4gPj4gKysrIGIvZG9jcy9tYW4veGwuMS5wb2Qu
aW4KPiA+PiBAQCAtNTAsNyArNTAsNyBAQCBzZXR1cCB0aGUgYnJpZGdlLgo+ID4+ICAKPiA+PiAg
SWYgeW91IHNwZWNpZnkgdGhlIGFtb3VudCBvZiBtZW1vcnkgZG9tMCBoYXMsIHBhc3NpbmcgQjxk
b20wX21lbT4gdG8KPiA+PiAgWGVuLCBpdCBpcyBoaWdobHkgcmVjb21tZW5kZWQgdG8gZGlzYWJs
ZSBCPGF1dG9iYWxsb29uPi4gRWRpdAo+ID4+IC1CPC9ldGMveGVuL3hsLmNvbmY+IGFuZCBzZXQg
aXQgdG8gMC4KPiA+PiArQjxAWEVOX0NPTkZJR19ESVJAL3hsLmNvbmY+IGFuZCBzZXQgaXQgdG8g
MC4KPiA+PiAgCj4gPj4gID1pdGVtIHJ1biB4bCBhcyBCPHJvb3Q+Cj4gPj4gIAo+ID4+IGRpZmYg
LS1naXQgYS9kb2NzL21hbi94bC5jb25mLjUucG9kLmluIGIvZG9jcy9tYW4veGwuY29uZi41LnBv
ZC5pbgo+ID4+IGluZGV4IDJiZWIyMTE5YTguLmIxNjAzNmFhZWIgMTAwNjQ0Cj4gPj4gLS0tIGEv
ZG9jcy9tYW4veGwuY29uZi41LnBvZC5pbgo+ID4+ICsrKyBiL2RvY3MvbWFuL3hsLmNvbmYuNS5w
b2QuaW4KPiA+IFNvcnJ5IGZvciB0aGUgbGF0ZSByZXBseS4KPiA+Cj4gPiBUaGlzIGRvZXNuJ3Qg
YXBwbHkuIFRoZXJlIGlzIG5vIHN1Y2ggZmlsZS4KPiAKPiBIbW0uwqAgV2UgaGF2ZSBhIHhsLmNv
bmYuNS5wb2Qgd2hpY2ggaGFzIG5vIHN1YnN0aXR1dGlvbnMgaW4sIGFuZCBJIGRvbid0Cj4gcmVj
YWxsIHRoaXMgY2hhbmdpbmcuwqAgUGVyaGFwcyBhIGxvZ2ljYWwgZGVwZW5kZW5jeSBlYXJsaWVy
IGluIHRoZSBTVVNFCj4gcGF0Y2ggcXVldWU/Cj4gCj4gSSB0aGluayB0aGlzIHBhdGNoIG5lZWRz
IGEge3BvZD0+cG9kLmlufSByZW5hbWUgYXMgd2VsbCwgZm9yIGl0IHRvIGFwcGx5Cj4gdG8gc3Rh
Z2luZyBhbmQgd29yayBhcyBpbnRlbmRlZC4KCkkgZmlndXJlZCB0aGF0IGFzIHdlbGwuCgpQZXJo
YXBzIEkgbWlzc2VkIHRoZSBwYXRjaCB0aGF0IGRpZCB0aGUgcmVuYW1pbmcgZnJvbSBPbGFmLgpV
bmZvcnR1bmF0ZWx5IEkgZG9uJ3QgaGF2ZSB0aGUgZnVsbCB4ZW4tZGV2ZWwgYXJjaGl2ZSBpbiBt
eSBtYWlsYm94IG5vdy4KCldlaS4KCj4gCj4gfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
