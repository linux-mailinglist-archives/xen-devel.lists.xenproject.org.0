Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 635DF6B0B7
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 23:02:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnUYJ-0005Z5-Jm; Tue, 16 Jul 2019 20:59:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0oM/=VN=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hnUYH-0005Z0-V5
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 20:59:57 +0000
X-Inumbo-ID: a9098488-a80c-11e9-983e-fbcbe64c868e
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a9098488-a80c-11e9-983e-fbcbe64c868e;
 Tue, 16 Jul 2019 20:59:54 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1563310794; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=GrPAVjXN2KEVcpr2+yI80tbkaIHpsHPVHgY6MKOn6TI=;
 b=erb3ZHRhnhTQGuTqR1pD4MwDJJLo+jhPPLBLjohpjf36znvOzVV4pPjfNgSBdE5JKJ2qHgjQ
 mriZPidKXGTz3/KzSKW+q7tYKW9EDLBINzX0geo2M3RbapQhAv6geg8CW+IHXGIhECGHCFdX
 EIgRwo6AtoszAwje/Zu4sVTBZZ0=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mxa.mailgun.org with ESMTP id 5d2e3ac9.7f069f510230-smtp-out-n02;
 Tue, 16 Jul 2019 20:59:53 -0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id x4so22389807wrt.6
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jul 2019 13:59:53 -0700 (PDT)
X-Gm-Message-State: APjAAAUnFJbZi4nz1GZ+potKvP5R0NnqC/MVbiJ4G2+yWBoDrIK+N5BU
 ipEfXlycmUoUYAY39N0F2kgrWisMLglbPbidy78=
X-Google-Smtp-Source: APXvYqwr3aUUQZsOLSpToK5YRzFG9fEMGataA6lMJgyw6rVq8Sfkll/yD1mS4YRVE0A2cW5DcXCo9BsUTZ2BxJeuIPg=
X-Received: by 2002:adf:9486:: with SMTP id 6mr4997166wrr.242.1563310792523;
 Tue, 16 Jul 2019 13:59:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1563293545.git.ppircalabu@bitdefender.com>
 <e42d2c771da20ac7d8e3bdf0351aea1a01b1600f.1563293545.git.ppircalabu@bitdefender.com>
In-Reply-To: <e42d2c771da20ac7d8e3bdf0351aea1a01b1600f.1563293545.git.ppircalabu@bitdefender.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 16 Jul 2019 14:59:16 -0600
X-Gmail-Original-Message-ID: <CABfawhnSMtVCiS9fmS1zU1QcuVC34Z9x_3HSSEaA=euBrhzfPQ@mail.gmail.com>
Message-ID: <CABfawhnSMtVCiS9fmS1zU1QcuVC34Z9x_3HSSEaA=euBrhzfPQ@mail.gmail.com>
To: Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: Re: [Xen-devel] [PATCH v2 01/10] vm_event: Define VM_EVENT type
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvcHVibGljL3ZtX2V2ZW50LmggYi94ZW4vaW5jbHVk
ZS9wdWJsaWMvdm1fZXZlbnQuaAo+IGluZGV4IDk1OTA4M2QuLmM0OGJjMjEgMTAwNjQ0Cj4gLS0t
IGEveGVuL2luY2x1ZGUvcHVibGljL3ZtX2V2ZW50LmgKPiArKysgYi94ZW4vaW5jbHVkZS9wdWJs
aWMvdm1fZXZlbnQuaAo+IEBAIC0zNiw2ICszNiwzNyBAQAo+ICAjaW5jbHVkZSAiaW8vcmluZy5o
Igo+Cj4gIC8qCj4gKyAqIFRoZXJlIGFyZSBjdXJyZW50bHkgdGhyZWUgdHlwZXMgb2YgVk0gZXZl
bnRzLgo+ICsgKi8KClRoaXMgaXMgYSBiaXQgbWlzbGVhZGluZyBhbmQgY29uZnVzaW5nIGlmIHNv
bWVvbmUganVzdCBsb29rcyBhdCB0aGUKaGVhZGVyLiBSaWdodCBub3cgd2UgYWN0dWFsbHkgaGF2
ZSAxNCBkaWZmZXJlbnQgVk1fRVZFTlRfUkVBU09OcwpkZWZpbmVkLiBXaGF0IHdlIGhhdmUgMyBv
ZiBhcmUgdGhlIGRpZmZlcmVudCByaW5ncyB3aGVyZSB0aGVzZSBldmVudHMKd291bGQgYmUgZGVs
aXZlcmVkLCB3aXRoIHBhZ2luZyBhbmQgc2hhcmluZyBoYXZpbmcgdGhlaXIgb3duIHJpbmcKc2Vw
YXJhdGUgZnJvbSB0aGUgZXZlbnRzIHVuZGVyIHRoZSAibW9uaXRvciIgbGFiZWwuCgo+ICsKPiAr
LyoKPiArICogRG9tYWluIG1lbW9yeSBwYWdpbmcKPiArICoKPiArICogUGFnZSBtZW1vcnkgaW4g
YW5kIG91dC4KPiArICovCj4gKyNkZWZpbmUgWEVOX1ZNX0VWRU5UX1RZUEVfUEFHSU5HICAgICAg
ICAgMQo+ICsKPiArLyoKPiArICogTW9uaXRvci4KPiArICoKPiArICogVGhlIG1vbml0b3IgaW50
ZXJmYWNlIGNhbiBiZSB1c2VkIHRvIHJlZ2lzdGVyIGZvciB2YXJpb3VzIFZNIGV2ZW50cy4gRm9y
Cj4gKyAqIGV4YW1wbGUsIHRoZXJlIGFyZSBIVk0gaHlwZXJjYWxscyB0byBzZXQgdGhlIHBlci1w
YWdlIGFjY2VzcyBwZXJtaXNzaW9ucwo+ICsgKiBvZiBldmVyeSBwYWdlIGluIGEgZG9tYWluLiAg
V2hlbiBvbmUgb2YgdGhlc2UgcGVybWlzc2lvbnMtLWluZGVwZW5kZW50LAo+ICsgKiByZWFkLCB3
cml0ZSwgYW5kIGV4ZWN1dGUtLWlzIHZpb2xhdGVkLCB0aGUgVkNQVSBpcyBwYXVzZWQgYW5kIGEg
bWVtb3J5IGV2ZW50Cj4gKyAqIGlzIHNlbnQgd2l0aCB3aGF0IGhhcHBlbmVkLiBUaGUgbWVtb3J5
IGV2ZW50IGhhbmRsZXIgY2FuIHRoZW4gcmVzdW1lIHRoZQo+ICsgKiBWQ1BVIGFuZCByZWRvIHRo
ZSBhY2Nlc3Mgd2l0aCBhIFhFTl9WTV9FVkVOVF9SRVNVTUUgb3B0aW9uLgo+ICsgKi8KPiArI2Rl
ZmluZSBYRU5fVk1fRVZFTlRfVFlQRV9NT05JVE9SICAgICAgICAyCj4gKwo+ICsvKgo+ICsgKiBT
aGFyaW5nIEVOT01FTS4KPiArICoKPiArICogVXNlZCB0byBjb21tdW5pY2F0ZSBmYWlsZWQgYWxs
b2NhdGlvbnMgaW4gdGhlIHVuc2hhcmUgcGF0aC4KPiArICogWEVOTUVNX3NoYXJpbmdfb3BfcmVz
dW1lIGlzIHVzZWQgdG8gd2FrZSB1cCB2Y3B1cyB0aGF0IGNvdWxkIG5vdCB1bnNoYXJlLgo+ICsg
Ki8KPiArI2RlZmluZSBYRU5fVk1fRVZFTlRfVFlQRV9TSEFSSU5HICAgICAgICAzCj4gKwo+ICsv
Kgo+ICAgKiBNZW1vcnkgZXZlbnQgZmxhZ3MKPiAgICovCj4KPiAtLQo+IDIuNy40CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
