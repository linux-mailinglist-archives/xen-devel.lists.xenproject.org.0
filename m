Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AE95D62A
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 20:33:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiNX7-00041W-Uq; Tue, 02 Jul 2019 18:29:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=m1I1=U7=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1hiNX6-00041R-Sq
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 18:29:36 +0000
X-Inumbo-ID: 54d9f0ca-9cf7-11e9-ab7d-07a0f47c8f6e
Received: from mail-lj1-f194.google.com (unknown [209.85.208.194])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 54d9f0ca-9cf7-11e9-ab7d-07a0f47c8f6e;
 Tue, 02 Jul 2019 18:29:31 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id 16so17904923ljv.10
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2019 11:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1mx9G/zTTHOgzSMjfES1vqs9kHZOC5Wn6kagpRksKf8=;
 b=pWJTyVBPiVJoXS4zhRIPFI5NzUq/OVsnNYjGrBtjd30fGSrlZo1/2PcRyXKIhrrXpP
 X8nJKdJolordZYpbfpmYAmqZHpS4zZ0i8LXor6d5Vrx6Ku/G8TM+O6ggV5B/VmcawEof
 mV/4ucnEqWPfdqBX1kZgIeMlAy6RT5bTSJ32Z1z1T/+wbob3rXMaCkprh7RyZJf+PDRt
 8qkv+rtSdEa4AG/PNKsxzTXdoPjZvwH27kdQ7maktutSrmOBDUbtlso4pYTkdRvCi57m
 Pxt4qchxijq0V0Kt2UrsQtyuesow0sh3IC1AvIHyVDCBqaYrknaX3z1Ea7GMVx+Akm3j
 6P/g==
X-Gm-Message-State: APjAAAX77h+ud07LJ1WSTC4ut5s3KkkKWniCU+MruqK70zPTCo25EJck
 F5TI31mbXdtPnRKoLb6Sods1k7LBOUo=
X-Google-Smtp-Source: APXvYqzthPKB2RZnjRJPUPCashyZGpMaOOfaa++dj9vPN7rpnReKNatx7YVcnhKXQooLMl8Xs/wcOg==
X-Received: by 2002:a2e:1201:: with SMTP id t1mr17826584lje.153.1562092170116; 
 Tue, 02 Jul 2019 11:29:30 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com.
 [209.85.167.47])
 by smtp.gmail.com with ESMTPSA id p15sm4039438lji.80.2019.07.02.11.29.28
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Jul 2019 11:29:29 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id j29so12093701lfk.10
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2019 11:29:28 -0700 (PDT)
X-Received: by 2002:a19:9156:: with SMTP id y22mr14873898lfj.43.1562092168628; 
 Tue, 02 Jul 2019 11:29:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190702135327.26543-1-anthony.perard@citrix.com>
In-Reply-To: <20190702135327.26543-1-anthony.perard@citrix.com>
From: Wei Liu <wl@xen.org>
Date: Tue, 2 Jul 2019 19:29:12 +0100
X-Gmail-Original-Message-ID: <CAK9nU=pR14_7VZxHbROS+8+wavq62FrmtRpbcUsO=_vyYEp+yA@mail.gmail.com>
Message-ID: <CAK9nU=pR14_7VZxHbROS+8+wavq62FrmtRpbcUsO=_vyYEp+yA@mail.gmail.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [Xen-devel] [PATCH] MAINTAINERS: Add Anthony as libxl maintainer
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAyIEp1bCAyMDE5IGF0IDE1OjE2LCBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJh
cmRAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBDcmVhdGUgYSBuZXcgc2VjdGlvbiB3aXRoIG9ubHkg
bGlieGwuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRA
Y2l0cml4LmNvbT4KPgo+IC0tLQo+IEkndmUgY3JlYXRlZCBhIG5ldyBzZWN0aW9uIGZvciBvbmx5
IGxpYnhlbmxpZ2h0IGJ1dCBpZiB5b3Ugd291bGQKPiBwcmVmZXIgdG8gYWRkIG1lIGludG8gVE9P
TFNUQUNLIGluc3RlYWQsIHRoYXQgbWlnaHQgYmUgb2suIEkganVzdAo+IGRvbid0IGhhdmUgbXVj
aCBleHBlcmllbmNlIHdpdGggdGhlIHJlc3Qgb2YgdG9vbHMvLgo+IC0tLQo+ICBNQUlOVEFJTkVS
UyB8IDcgKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCj4KPiBkaWZm
IC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwo+IGluZGV4IDg4MmU0ZWZhMjIuLmI4
ZTRkYWFlNDEgMTAwNjQ0Cj4gLS0tIGEvTUFJTlRBSU5FUlMKPiArKysgYi9NQUlOVEFJTkVSUwo+
IEBAIC0yODQsNiArMjg0LDEzIEBAIEY6IHhlbi9pbmNsdWRlL3trZXhlYyxraW1hZ2V9LmgKPiAg
RjogICAgIHhlbi9hcmNoL3g4Ni9tYWNoaW5lX2tleGVjLmMKPiAgRjogICAgIHhlbi9hcmNoL3g4
Ni94ODZfNjQva2V4ZWNfcmVsb2MuUwo+Cj4gK0xJQlhFTkxJR0hUCj4gK006ICAgICBJYW4gSmFj
a3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KPiArTTogICAgIFdlaSBMaXUgPHdsQHhl
bi5vcmc+Cj4gK006ICAgICBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNv
bT4KPiArUzogICAgIFN1cHBvcnRlZAo+ICtGOiAgICAgdG9vbHMvbGlieGwvCj4gKwoKQWNrZWQt
Ynk6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CgpUaGFua3MgZm9yIHN0ZXBwaW5nIHVwIQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
