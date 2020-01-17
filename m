Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01769140C65
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 15:25:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isSXD-000107-Nj; Fri, 17 Jan 2020 14:23:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1eFk=3G=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1isSXC-000102-Au
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 14:23:38 +0000
X-Inumbo-ID: ee978eb4-3934-11ea-9fd7-bc764e2007e4
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ee978eb4-3934-11ea-9fd7-bc764e2007e4;
 Fri, 17 Jan 2020 14:23:29 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1579271009; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=yGwG9M2N3//pqMiUmkqnm9OLSbrdKmSyEHzgUq9tS6o=;
 b=Z92U98aSTPdlDOUXMa0ywia89oVl37lxAI+q8zJQFNY10nAbPXNBp3ut9mqjQURorSIfkPL3
 8nAOYgT1EKtaYWQ3DDlUhjO6QlsiHw4caEqpuoXz2eieoLhkBrjKLgHVX4x3gi5MLa+R9n8V
 olkgzgQSG507W13+7BlXLN2scTM=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mxa.mailgun.org with ESMTP id 5e21c360.7fc7ed1ea270-smtp-out-n01;
 Fri, 17 Jan 2020 14:23:28 -0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id t14so7788183wmi.5
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jan 2020 06:23:27 -0800 (PST)
X-Gm-Message-State: APjAAAX4Z6G4RbScxoZZidBwmxMs7vK3Xv+SlWZRQExm6Rqnq9WrlEaW
 NFYCNiYVyUu4dMNqIH99+xaR7pP7ldim/lJxpcQ=
X-Google-Smtp-Source: APXvYqz00/hdVEUHhoC73OirbyFkNEzh7MTt8uUad9njVsQDN5KOJTGXuldmcdwG2n81vgytJRB59INOXwdczWF4yk0=
X-Received: by 2002:a05:600c:d6:: with SMTP id
 u22mr4908324wmm.77.1579271007070; 
 Fri, 17 Jan 2020 06:23:27 -0800 (PST)
MIME-Version: 1.0
References: <cover.1578503483.git.tamas.lengyel@intel.com>
 <2284645a-0496-7811-5def-2cb053ffcf51@suse.com>
 <CABfawh=pBDQTxeJ-XHbi61nQNukGzGsD-iEtSWeNXnrS-H7b1Q@mail.gmail.com>
 <fec3f76c-c85e-1bd6-2049-c0b6031005fe@suse.com>
 <20200117111521.GB1288@perard.uk.xensource.com>
In-Reply-To: <20200117111521.GB1288@perard.uk.xensource.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 17 Jan 2020 07:22:50 -0700
X-Gmail-Original-Message-ID: <CABfawhnV=TWYOCzsuBgQZjwSDWCtu87nztAoDzjxHz6qKYftnA@mail.gmail.com>
Message-ID: <CABfawhnV=TWYOCzsuBgQZjwSDWCtu87nztAoDzjxHz6qKYftnA@mail.gmail.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [Xen-devel] [PATCH v4 00/18] VM forking
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKYW4gMTcsIDIwMjAgYXQgNDoxNSBBTSBBbnRob255IFBFUkFSRAo8YW50aG9ueS5w
ZXJhcmRAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIEphbiAxNywgMjAyMCBhdCAxMDox
MjoxNEFNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+IFBsZWFzZSBub3RlIHRoYXQgbXkg
cHJldmlvdXMgbWFpbCB3YXMgX3RvXyBHZW9yZ2UsIHdpdGggeW91IG9ubHkKPiA+IF9jY18tZWQu
IEhlbmNlIHRoZSBxdWVzdGlvbiB3YXMgdG8gR2VvcmdlLCBub3QgeW91LiAoSXQgaXMgYQo+ID4g
Y29tbW9uIGlzc3VlIHdoaWNoIEkga2VlcCBtZW50aW9uaW5nIG9uIG1lZXRpbmdzIHRoYXQgdGhl
Cj4gPiBkaXN0aW5jdGlvbiBvZiBUbyBhbmQgQ2MgaXMgb2Z0ZW4gbm90IGJlaW5nIGhvbm9yZWQs
IGFsYmVpdAo+ID4gdHlwaWNhbGx5IG1vcmUgYnkgc2VuZGVycyB0aGFuIHJlY2lwaWVudHMuKQo+
Cj4gVGlwOiBKYW4sIHlvdSBjb3VsZCBhbHNvIGhhdmUgc3RhcnRlZCB0aGUgc2VudGVuY2UgYnkg
Ikdlb3JnZSwgIiBpbgo+IGFkZGl0aW9uIHRvIHByb3Blcmx5IHNldHRpbmcgdGhlICJUbzoiLCBp
dCB3b3VsZCBoZWxwIGEgbG90IEkgdGhpbmsuCj4KPiBUZWFjaGluZyBwZW9wbGUgYWJvdXQgc2V0
dGluZyBwcm9wZXJseSAiVG86IiwgYW5kIHJlYWRpbmcgaXQgYmVmb3JlCj4gcmVhZGluZyB0aGUg
ZW1haWwgaXMgYSBsb3N0IGZpZ2h0IEkgdGhpbmsuIEV2ZW4gc28gaXQgY2FuIGJlIHVzZWZ1bCB0
bwo+IGZpbHRlciBlbWFpbCB3aGljaCBuZWVkcyBhIHJlc3BvbnNlLgoKWWVhLCArMSBmb3IgdGhh
dCwgaXQgd291bGQgbWFrZSBhZGRyZXNzZWQgcXVlc3Rpb25zIG1vcmUgYXBwYXJlbnQuCkdtYWls
ICh3aGljaCBpcyB3aGF0IEkgdXNlKSBkb2Vzbid0IGJyZWFrIG91dCB0aGUgZW1haWwgaGVhZGVy
IGJ5CmRlZmF1bHQgd2l0aCBzZXBhcmF0ZSBsaW5lcyBmb3IgdG86IGFuZCBjYzosIGFsbCByZWNp
cGllbnRzIGFyZSBpbiBhCnNpbmdsZSBsaW5lIHdpdGggbm8gZGlzdGluY3Rpb24gYmV0d2VlbiB0
aGVtLgoKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
