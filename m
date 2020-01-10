Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE69136B38
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2020 11:41:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iprgY-00043x-Ad; Fri, 10 Jan 2020 10:38:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qFeI=27=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iprgX-00043s-7m
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2020 10:38:33 +0000
X-Inumbo-ID: 54219360-3395-11ea-b89f-bc764e2007e4
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 54219360-3395-11ea-b89f-bc764e2007e4;
 Fri, 10 Jan 2020 10:38:24 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id p9so1449888wmc.2
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jan 2020 02:38:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JaOEUG4vKPO4bhQI+ntqA7V1HHRNKk/AK56RlAZy2o8=;
 b=koZftDNvq6WMwOUIEcrCoGvOHEekP7ca+TWq8JObChjtPUh9zxTIR64G3HuH8PTkEw
 eP1kuqQAsh/k9k5iOtQhDzYov6gnGT0z3F3ZkRQTtOpFJNO7mghrMNhDskoOIYgGa+CA
 5YxjA99LOC2RTgamYfbQ89gSRqAUrQtfbAMYabrXBVcVCa91aAxH259z1i7Vd5FHnSPH
 pO+FHwBvzZeOZnVDrpjAuGF3sKfVDJq9KjWpLHti0hxvO11rKqnsGBfMizU1LahNQwpH
 sneorJMJYaqS+LNgmnrYttYdSRbObNUGUCoy2n9sQGbjzNIAg9MTqo1VMGLpQr09Kr20
 EgvA==
X-Gm-Message-State: APjAAAVtaxD8Uu/VSszYbNs7s1f3N2o9JTewdSblhOnkJFLquPv22+iJ
 77zEocy1emoauCHUTThJOSg=
X-Google-Smtp-Source: APXvYqxoQ2pbOpJz+8vTvVwid55mJ1zO7GSRuJNkqeOLtK0iVxXZNTXmaNGKpOC9bzgo5GvX7z8SRA==
X-Received: by 2002:a1c:6389:: with SMTP id x131mr3237927wmb.155.1578652703913; 
 Fri, 10 Jan 2020 02:38:23 -0800 (PST)
Received: from debian (11.163.200.146.dyn.plus.net. [146.200.163.11])
 by smtp.gmail.com with ESMTPSA id o4sm1687397wrx.25.2020.01.10.02.38.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2020 02:38:23 -0800 (PST)
Date: Fri, 10 Jan 2020 10:38:21 +0000
From: Wei Liu <wl@xen.org>
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
Message-ID: <20200110103821.rvl4glx24q7xbe4k@debian>
References: <20200109111505.12328-1-pdurrant@amazon.com>
 <20200109135217.wdvaxvp2i7jemqsv@debian>
 <a8596f255bfd46d3adefd4ca7f088056@EX13D32EUC003.ant.amazon.com>
 <20200109164106.attj6j44qcczixru@debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200109164106.attj6j44qcczixru@debian>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] tools/Rules.mk: fix distclean
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMDksIDIwMjAgYXQgMDQ6NDE6MDZQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBUaHUsIEphbiAwOSwgMjAyMCBhdCAwMjowMjo1NVBNICswMDAwLCBEdXJyYW50LCBQYXVs
IHdyb3RlOgo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4gPiBGcm9tOiBXZWkg
TGl1IDx3bEB4ZW4ub3JnPgo+ID4gPiBTZW50OiAwOSBKYW51YXJ5IDIwMjAgMTM6NTIKPiA+ID4g
VG86IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jby51az4KPiA+ID4gQ2M6IHhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgSWFuIEphY2tzb24KPiA+ID4gPGlhbi5qYWNrc29u
QGV1LmNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgQW50aG9ueSBQRVJBUkQKPiA+
ID4gPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0hd
IHRvb2xzL1J1bGVzLm1rOiBmaXggZGlzdGNsZWFuCj4gPiA+IAo+ID4gPiBPbiBUaHUsIEphbiAw
OSwgMjAyMCBhdCAxMToxNTowNUFNICswMDAwLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4gPiA+ID4g
UnVubmluZyAnbWFrZSBkaXN0Y2xlYW4nIHVuZGVyIHRvb2xzIHdpbGwgY3VycmVudGx5IHJlc3Vs
dCBpbjoKPiA+ID4gPgo+ID4gPiA+IHRvb2xzL1J1bGVzLm1rOjI0NTogKioqIFlvdSBoYXZlIHRv
IHJ1biAuL2NvbmZpZ3VyZSBiZWZvcmUgYnVpbGRpbmcgb3IKPiA+ID4gaW5zdGFsbGluZyB0aGUg
dG9vbHMuICBTdG9wLgo+ID4gPiA+Cj4gPiA+ID4gVGhpcyBwYXRjaCBhZGRzICdkaXN0Y2xlYW4n
LCAnc3ViZGlyLWRpc3RjbGVhbiUnIGFuZCAnc3ViZGlyLWNsZWFuJScgdG8KPiA+ID4gPiBuby1j
b25maWd1cmUtdGFyZ2V0cywgd2hpY2ggYWxsb3dzICdtYWtlIGRpc3RjbGVhbicgdG8gcnVuIHRv
Cj4gPiA+IGNvbXBsZXRpb24uCj4gPiA+ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1
cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+Cj4gPiA+IAo+ID4gPiBGaXhlczogMDA2OTFjNmM5
MGIKPiA+ID4gCj4gPiA+IFNvcnJ5IGZvciBub3Qgbm90aWNpbmcgdGhlIGJyZWFrYWdlIHdoaWxl
IHJldmlld2luZyB0aGF0IHBhdGNoLgo+ID4gPiAKPiA+IAo+ID4gT2suIEknbSBzdXJlIHRoYXQg
Y291bGQgYmUgYWRkZWQgYXQgY29tbWl0IGlmIHRoZXJlIGFyZSBubyBvdGhlciBjaGFuZ2VzIG5l
ZWRlZC4KPiAKPiBZZXMuIFN1cmUuCj4gCj4gPiAKPiA+ID4gSXMgdGhlcmUgYSB3YXkgdG8gcGF0
dGVybiBtYXRjaCBhbGwgdGFyZ2V0cyBjb250YWluaW5nICJjbGVhbiI/Cj4gPiA+IAo+ID4gPiAo
V291bGQgaGF2ZSBsb29rZWQgaW50byBpdCBteXNlbGYgYnV0IC1FVElNRSB0b2RheSkKPiA+IAo+
ID4gSSBjb3VsZG4ndCBwZXJzdWFkZSBmaWx0ZXIgdG8gbWF0Y2ggYWdhaW5zdCBwYXR0ZXJucyB3
aXRoIG11bHRpcGxlICUKPiA+IHNvIHRoaXMgd2FzIHRoZSBiZXN0IEkgY291bGQgY29tZSB1cCB3
aXRoLgo+ID4gCj4gCj4gT0suCgpJZiBJIGhlYXIgbm8gb2JqZWN0aW9uIG9yIHN1Z2dlc3Rpb24g
Zm9yIGltcHJvdmVtZW50IHRvZGF5IEkgd2lsbCBjb21taXQKdGhpcyBwYXRjaC4KCldlaS4KCj4g
Cj4gV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
