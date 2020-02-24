Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A25DB16A3CF
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 11:23:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6Aq6-00025c-6N; Mon, 24 Feb 2020 10:19:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BoNe=4M=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j6Aq4-00025X-Tu
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 10:19:48 +0000
X-Inumbo-ID: 2ea80b28-56ef-11ea-8ada-12813bfff9fa
Received: from mail-ed1-f66.google.com (unknown [209.85.208.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2ea80b28-56ef-11ea-8ada-12813bfff9fa;
 Mon, 24 Feb 2020 10:19:47 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id p14so11210378edy.13
 for <xen-devel@lists.xenproject.org>; Mon, 24 Feb 2020 02:19:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C51j28CBHpRtZ+/XnQ+4UChYbkJLIIVknxdO6vH4mwk=;
 b=qQLDYcbG5Fg13O1+e9lGvqgoKaR0yqAtPsdHy1vpYJ3sLbB5mDF9xEd1ucQbIedH+J
 xSwG7SZKn3TDN+OzC9JrVqdeS70OvkkFKCdfKfokU8OGShj3N3jtfHyEJ+XIaeVz323P
 cvBiR7KsWrgADA6+iCbJ5242tq6JVsgfrYXOg6npUKvIstDzzVrpUIOQHtRt8t3N0/qS
 HZHnlQqui45qTZjLRXcm5MzVErJzqWGb08G3Ox36q+hw7/1MsINwCbUzOWAwf54BB0Oc
 vjhgEytrjGxrRyCIp2+DhaD/8DP+k1vEGe3aG+3pPhY8aterhbQIOr2ynWvCmYfDhw9J
 DQVQ==
X-Gm-Message-State: APjAAAUjqa52dHo/uVRottFj+zodTs2PE5sdGV7K51Kem6vId7SOIrlC
 rG/f5k0djtNmki8IeVgchDg=
X-Google-Smtp-Source: APXvYqztLB9fjMz9iIbLL38U0lEcbP9LAsZutMV9JDhsPmQFT6NeAz5FaYoh13zJqJbwETvpoy0R9Q==
X-Received: by 2002:a17:906:1e56:: with SMTP id
 i22mr45558909ejj.314.1582539586477; 
 Mon, 24 Feb 2020 02:19:46 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-232.amazon.com.
 [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id qh18sm797095ejb.23.2020.02.24.02.19.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2020 02:19:45 -0800 (PST)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200224084400.94482-1-roger.pau@citrix.com>
 <20200224084400.94482-2-roger.pau@citrix.com>
 <6a22dad2-946a-ae9f-2304-61f60e0d7f8c@xen.org>
 <20200224100919.GH4679@Air-de-Roger>
From: Julien Grall <julien@xen.org>
Message-ID: <63c23677-1dbd-3dce-d67a-ea86c5683cc7@xen.org>
Date: Mon, 24 Feb 2020 10:19:44 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200224100919.GH4679@Air-de-Roger>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v3 1/2] atomic: add atomic_and operations
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyNC8wMi8yMDIwIDEwOjA5LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+IE9uIE1v
biwgRmViIDI0LCAyMDIwIGF0IDEwOjAyOjUzQU0gKzAwMDAsIEp1bGllbiBHcmFsbCB3cm90ZToK
Pj4gSGkgUm9nZXIsCj4+Cj4+IFRoZSBsb2dpYyBmb3IgQXJtNjQgYW5kIEFybTMyIGxvb2tzIGdv
b2QgdG8gbWUuIEkganVzdCBoYXZlIG9uZSBxdWVzdGlvbgo+PiBiZWxvdy4KPj4KPj4gT24gMjQv
MDIvMjAyMCAwODo0MywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+Pj4gVG8geDg2IGFuZCBBcm0u
IFRoaXMgcGVyZm9ybXMgYW4gYXRvbWljIEFORCBvcGVyYXRpb24gYWdhaW5zdCBhbgo+Pj4gYXRv
bWljX3QgdmFyaWFibGUgd2l0aCB0aGUgcHJvdmlkZWQgbWFzay4KPj4+Cj4+PiBSZXF1ZXN0ZWQt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4+IFNpZ25lZC1vZmYtYnk6IFJv
Z2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+Pj4gLS0tCj4+PiAgICB4ZW4v
aW5jbHVkZS9hc20tYXJtL2FybTMyL2F0b21pYy5oIHwgMTcgKysrKysrKysrKysrKysrKysKPj4+
ICAgIHhlbi9pbmNsdWRlL2FzbS1hcm0vYXJtNjQvYXRvbWljLmggfCAxNCArKysrKysrKysrKysr
Kwo+Pj4gICAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9hdG9taWMuaCAgICAgICB8ICA4ICsrKysrKysr
Cj4+PiAgICAzIGZpbGVzIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKykKPj4+Cj4+PiBkaWZmIC0t
Z2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9hcm0zMi9hdG9taWMuaCBiL3hlbi9pbmNsdWRlL2Fz
bS1hcm0vYXJtMzIvYXRvbWljLmgKPj4+IGluZGV4IGMwM2ViNjg0Y2QuLjQ2MzczODFiY2MgMTAw
NjQ0Cj4+PiAtLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL2FybTMyL2F0b21pYy5oCj4+PiArKysg
Yi94ZW4vaW5jbHVkZS9hc20tYXJtL2FybTMyL2F0b21pYy5oCj4+PiBAQCAtOTYsNiArOTYsMjMg
QEAgc3RhdGljIGlubGluZSBpbnQgYXRvbWljX3N1Yl9yZXR1cm4oaW50IGksIGF0b21pY190ICp2
KQo+Pj4gICAgCXJldHVybiByZXN1bHQ7Cj4+PiAgICB9Cj4+PiArc3RhdGljIGlubGluZSB2b2lk
IGF0b21pY19hbmQodW5zaWduZWQgaW50IG0sIGF0b21pY190ICp2KQo+Pgo+PiBBbGwgdGhlIGF0
b21pYyBoZWxwZXJzIGhhdmUgdGFrZW4gYSBzaWduZWQgaW50IHNvIGZhciBiZWNhdXNlIHRoZSBj
b3VudGVyIGlzCj4+IGFuIGludC4gQW55IHJlYXNvbiB0byBkaXZlcmdlIGZyb20gdGhhdD8KPiAK
PiBTaW5jZSB0aGlzIGlzIG5vdCBhbiBhcml0aG1ldGljIG9wZXJhdGlvbiBJIGZlbHQgdW5zaWdu
ZWQgaW50IHdhcyBhCj4gbW9yZSBzdWl0YWJsZSB0eXBlIHRvIGRlc2NyaWJlIGEgYml0bWFzazog
aXQgZmVsdCB3ZWlyZCB0byBwYXNzIGEKPiBiaXRtYXNrIHdpdGggdHlwZSBpbnQsIGJlY2F1c2Ug
c2lnbmVkbmVzcyBkb2Vzbid0IG1ha2Ugc2Vuc2Ugd2hlbgo+IHJlZmVycmluZyB0byBhIG1hc2su
CgpBdCBzb21lIHBvaW50IEkgd291bGQgbGlrZSB0byBoYXZlIG1hY3JvIGdlbmVyYXRpbmcgYWxs
IHRoZSBhdG9taWNzIGluIApvbiBBcm0gaW4gdGhlIHNhbWUgd2F5IGEgTGludXggKHNlZSBhc20t
Z2VuZXJpYy9hdG9taWMuaCkuIFRoaXMgaXMgdG8gCmF2b2lkIGR1cGxpY2F0aW9uIGFuZCBtYWtl
IGVhc3kgdG8gaW50cm9kdWNlIEFybXY4LjEgTFNFIGF0b21pY3MuIFNvIEkgCndvdWxkIGxpa2Ug
dG8gYXZvaWQgaW50cm9kdWNpbmcgZGlmZmVyZW5jZSBpbiB0aGUgcHJvdG90eXBlIHVubGVzcyBp
dCBpcyAKc3RyaWNseSBuZWNlc3NhcnkuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
