Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7977114822
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 21:32:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icxjm-0000H5-5R; Thu, 05 Dec 2019 20:28:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Jbs=Z3=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1icxjk-0000H0-JC
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 20:28:32 +0000
X-Inumbo-ID: ccd6c24f-179d-11ea-823a-12813bfff9fa
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ccd6c24f-179d-11ea-823a-12813bfff9fa;
 Thu, 05 Dec 2019 20:28:31 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id z7so5125119wrl.13
 for <xen-devel@lists.xenproject.org>; Thu, 05 Dec 2019 12:28:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uVC5issQD2U4WX+ztOyjP/+QkKkY0kuizQMPpOg3cGw=;
 b=gHHeEpXvUGEdkaIOXLnQ0+7fmcSxOLvLyLOsutPYnv8Erng++gHrfOEM6ODRD/8bdg
 cnbsV6mNh5cN2yXCJ7PnEvj/BvBvlIXJmuVQEJ44qsd8gzDKJClljjb5RKiQnb2mio/K
 oDc3IuxRTraOvJLyEjfthFh6/jt65Y1Fkl/w323va33WMxxX3c0pvtGKX/bhsa/cJzq9
 YlbYG11Dm3By6HJRx9wRw8tr1j5QfnwMxF5hEDqi2zbudH7q/cMiol9VNQ993lWSXOqQ
 yHI1AqlQu4Rgb44cF4sIWJQ/XzK2nUD6PBVELsES/v3lyPCMohEMxb6sTE7MSw3MsjuF
 P6cw==
X-Gm-Message-State: APjAAAWv3VTcfPwbVYznFWrzHd3Q/t0bURR20XG8eaOqb74XW4SdAg6N
 BaYk9HeG1L4MaUn6he3gRcs=
X-Google-Smtp-Source: APXvYqwrE7oZc6sXInosEw5xbwjpz1TkGq2jZyJQ71f3JbsLi/Qp0mggZW5hGKElUMvaBqtKEGZGsg==
X-Received: by 2002:adf:f288:: with SMTP id k8mr12697396wro.301.1575577710981; 
 Thu, 05 Dec 2019 12:28:30 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com
 (cpc91200-cmbg18-2-0-cust94.5-4.cable.virginm.net. [81.100.41.95])
 by smtp.gmail.com with ESMTPSA id l204sm1091397wmf.2.2019.12.05.12.28.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Dec 2019 12:28:30 -0800 (PST)
To: Jeff Kubascik <jeff.kubascik@dornerworks.com>,
 xen-devel@lists.xenproject.org
References: <20191126211324.122736-1-jeff.kubascik@dornerworks.com>
 <4bb351b7-a7b0-4491-fdc5-265724457359@xen.org>
 <bf9c620e-600a-37d4-e1b0-d329d8d225be@dornerworks.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5a335a96-930c-bf59-19ae-0fbc21600809@xen.org>
Date: Thu, 5 Dec 2019 20:28:29 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <bf9c620e-600a-37d4-e1b0-d329d8d225be@dornerworks.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v2] xen/arm: remove physical timer offset
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
Cc: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwNS8xMi8yMDE5IDE5OjE3LCBKZWZmIEt1YmFzY2lrIHdyb3RlOgo+IE9uIDEyLzMv
MjAxOSAxOjA0IFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpLAo+Pgo+PiBPbiAyNi8xMS8y
MDE5IDIxOjEzLCBKZWZmIEt1YmFzY2lrIHdyb3RlOgo+Pj4gVGhlIHBoeXNpY2FsIHRpbWVyIHRy
YXBzIGFwcGx5IGFuIG9mZnNldCBzbyB0aGF0IHRpbWUgc3RhcnRzIGF0IDAgZm9yCj4+PiB0aGUg
Z3Vlc3QuIEhvd2V2ZXIsIHRoaXMgb2Zmc2V0IGlzIG5vdCBjdXJyZW50bHkgYXBwbGllZCB0byB0
aGUgcGh5c2ljYWwKPj4+IGNvdW50ZXIuIFBlciB0aGUgQVJNdjggUmVmZXJlbmNlIE1hbnVhbCAo
QVJNIERESSAwNDg3RS5hKSwgc2VjdGlvbgo+Pj4gRDExLjIuNCBUaW1lcnMsIHRoZSAiT2Zmc2V0
IiBiZXR3ZWVuIHRoZSBjb3VudGVyIGFuZCB0aW1lciBzaG91bGQgYmUKPj4+IHplcm8gZm9yIGEg
cGh5c2ljYWwgdGltZXIuIFRoaXMgcmVtb3ZlcyB0aGUgb2Zmc2V0IHRvIG1ha2UgdGhlIHRpbWVy
IGFuZAo+Pj4gY291bnRlciBjb25zaXN0ZW50Lgo+Pj4KPj4+IEZ1cnRoZXJtb3JlLCBzZWN0aW9u
IEQxMS4yLjQgc3BlY2lmaWVzIHRoYXQgdGhlIHZhbHVlcyBpbiB0aGUgVGltZXJWYWx1ZQo+Pj4g
dmlldyBvZiB0aGUgdGltZXJzIGFyZSBzaWduZWQgaW4gc3RhbmRhcmQgdHdvJ3MgY29tcGxlbWVu
dCBmb3JtLiBXaGVuCj4+PiB3cml0aW5nIHRvIHRoZSBUaW1lclZhbHVlIHJlZ2lzdGVyLCBpdCBz
aG91bGQgYmUgc2lnbmVkIGV4dGVuZGVkIGFzCj4+PiBkZXNjcmliZWQgYnkgdGhlIGVxdWF0aW9u
Cj4+Pgo+Pj4gICAgIENvbXBhcmVWYWx1ZSA9IChDb3VudGVyWzYzOjBdICsgU2lnbkV4dGVuZChU
aW1lclZhbHVlKSlbNjM6MF0KPj4KPj4gSSBhbSBhIGJpdCBjb25mdXNlZCwgaXMgaXQgYSBuZXcg
YnVnIGludHJvZHVjZWQgYnkgdGhlIGNoYW5nZSBvcgo+PiBwcmV2aW91c2x5IGV4aXN0aW5nPyBJ
ZiB0aGUgbGF0dGVyLCB0aGVuIEkgdGhpbmsgdGhpcyBzaG91bGQgYmUgbW9kaWZpZWQKPj4gaW4g
YSBzZXBhcmF0ZSBwYXRjaC4KPiAKPiBUaGlzIHdvdWxkIGJlIGEgcHJldmlvdXNseSBleGlzdGlu
ZyBidWcgLSBhIHF1aXJrIGluIHRoZSB0aW1lciBkZXNpZ24gdGhhdAo+IHdhc24ndCBlbXVsYXRl
ZCBjb3JyZWN0bHkgYmVmb3JlLiBJIGNhbiBicmVhayB0aGlzIG91dCBpbnRvIGEgc2VwYXJhdGUg
cGF0Y2guCgpJdCB3b3VsZCBiZSBncmVhdCBpZiB5b3UgY2FuIHNwbGl0IGl0LiBUaGFuayB5b3Uh
CgpbLi4uXQoKCj4+PiBAQCAtMTg1LDcgKzE4NCw3IEBAIHN0YXRpYyBib29sIHZ0aW1lcl9jbnRw
X2N0bChzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncywgdWludDMyX3QgKnIsIGJvb2wgcmVhZCkK
Pj4+ICAgICAgICAgICAgaWYgKCB2LT5hcmNoLnBoeXNfdGltZXIuY3RsICYgQ05UeF9DVExfRU5B
QkxFICkKPj4+ICAgICAgICAgICAgewo+Pj4gICAgICAgICAgICAgICAgc2V0X3RpbWVyKCZ2LT5h
cmNoLnBoeXNfdGltZXIudGltZXIsCj4+PiAtICAgICAgICAgICAgICAgICAgICAgIHYtPmFyY2gu
cGh5c190aW1lci5jdmFsICsgdi0+ZG9tYWluLT5hcmNoLnBoeXNfdGltZXJfYmFzZS5vZmZzZXQp
Owo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICB0aWNrc190b19ucyh2LT5hcmNoLnBoeXNfdGlt
ZXIuY3ZhbCAtIGJvb3RfY291bnQpKTsKPj4KPj4gY3ZhbCBtYXkgYmUgc21hbGxlciB0aGFuIGJv
b3RfY291bnQuIEluIHRoYXQgY2FzZSwgd2Ugd2lsbCBzZXQgdGhlIHRpbWVyCj4+IHRvIGV4cGly
ZSBhIHZlcnkgbG9uZyB0aW1lLiBUaGlzIGlzIG5vdCB0aGUgZXhwZWN0ZWQgYmVoYXZpb3IgZnJv
bSB0aGUKPj4gZ3Vlc3QuCj4+Cj4+IEluc3RlYWQsIHdlIHNob3VsZCBlaXRoZXIgdXNlIDAgdG8g
Y3JlYXRlIHRoZSB0aW1lciBvciBjYWxsCj4+IHBoeXNfdGltZXJfZXhwaXJlZCBkaXJlY3RseS4K
PiAKPiBJIGRpc2FncmVlIC0gaWYgeW91IHNldCBjdmFsIHRvIGEgdmFsdWUgc21hbGxlciB0aGFu
IGJvb3RfY291bnQsIHlvdSBhcmUgc2V0dGluZwo+IGN2YWwgdG8gYSB2YWx1ZSBsZXNzIHRoYW4g
dGhlIHBoeXNpY2FsIGNvdW50ZXIgdmFsdWUuIFRoaXMgd291bGQgcmVzdWx0IGluIHRoZQo+IHRp
bWVyIGhhdmluZyBhIGxvbmcgZXhwaXJhdGlvbiB0aW1lLgoKYm9vdF9jb3VudCByZWZlcnMgdG8g
d2hlbiBYZW4gYmVnYW4gdG8gYm9vdCwgbm90IHRoZSBzdGFydCBvZiB0aGUgCnBoeXNpY2FsIGNv
dW50ZXIuIElmIHlvdSBsb29rIGF0IHRoZSBjb25kaXRpb24gdG8gZmlyZSB0aGUgdGltZXIgKHNl
ZSAKYmVsb3cpLCB0aGVuIGl0IG1lYW5zIHRoZSB0aW1lciB3aWxsIGZpcmUgcmlnaHQgbm93IGJl
Y2F1c2UgdGhlIHBoeXNpY2FsIApjb3VudGVyIGlzIHBhc3QgQ29tcGFyZVZhbHVlIChjdmFsKS4K
ClRpbWVyQ29uZGl0aW9uTWV0ID0gKCgoQ291bnRlcls2MzowXSDigJMgT2Zmc2V0WzYzOjBdKVs2
MzowXSAtIApDb21wYXJlVmFsdWVbNjM6MF0pID49IDApCgpXZSBvbmx5IHN1YnRyYWN0IGJvb3Rf
Y291bnQgaGVyZSBhcyB0aGUgdGltZXIgc3Vic3lzdGVtIGV4cGVjdHMgYSAKcmVsYXRpdmUgbnVt
YmVyIG9mIG5hbm9zZWNvbmRzIGZyb20gd2hlbiBYZW4gYm9vdGVkLgoKPiAKPiBIb3dldmVyLCBz
ZXRfdGltZXIgZXhwZWN0cyBhIHNpZ25lZCA2NCBiaXQgdmFsdWUgaW4gbnMuIFRoZSBjb252ZXJz
aW9uIG9mIGN2YWwKPiAodW5zaWduZWQgNjQgYml0KSBmcm9tIHRpY2tzIHRvIG5zIGlzIGdvaW5n
IHRvIG92ZXJmbG93IHRoaXMuIEknbSBub3Qgc3VyZSB3aGF0Cj4gd291bGQgYmUgdGhlIGJlc3Qg
d2F5IHRvIHdvcmsgYXJvdW5kIHRoaXMgbGltaXRhdGlvbi4gQXQgdGhlIHZlcnkgbGVhc3QsIEkg
dGhpbmsKPiB3ZSBzaG91bGQgcHJpbnQgYSB3YXJuaW5nIG1lc3NhZ2UuCgpBIHdhcm5pbmcgbWVz
c2FnZSBpbiBlbXVsYXRpb24gaXMgZGVmaW5pdGVseSBub3QgdGhlIHJpZ2h0IHNvbHV0aW9uLiBJ
ZiAKYSB1c2VyIGFza3Mgc29tZXRoaW5nIHRoYXQgaXMgdmFsaWQgZnJvbSB0aGUgc3BlYyBQb1Yg
dGhlbiB3ZSBzaG91bGQgCmltcGxlbWVudCBpdCBjb3JyZWN0bHkuIFRoZSBtb3JlIHRoYXQgSSBk
b24ndCB0aGluayBib290X2NvdW50IHN0b3JlIAp3aGF0IHlvdSBleHBlY3QgKHNlZSBhYm92ZSku
CgpCdXQgd2UgZGVmaW5pdGVseSBjYW4ndCBhbGxvdyB0aGUgY2FsbGVyIG9mIHRpY2tzX3RvX25z
KCkgdG8gcGFzcyBhIApuZWdhdGl2ZSB2YWx1ZSBhcyBhcmd1bWVudCBiZWNhdXNlIChjdmFsIC0g
Ym9vdF9jb3VudCkgbWF5IGJlIG92ZXIgMl42MyAKZm9yIGluc3RhbmNlIGlmIHRoZSB1c2VyIHJl
cXVlc3RzIGEgdGltZXIgdG8gYmUgc2V0IGluIGEgbWlsbGlvbiBvZiB5ZWFyIAooSSBkaWRuJ3Qg
ZG8gdGhlIG1hdGghKS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
