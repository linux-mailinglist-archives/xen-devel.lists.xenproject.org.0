Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D824140C72
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 15:29:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isSa6-0001GA-04; Fri, 17 Jan 2020 14:26:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1eFk=3G=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1isSa4-0001G2-Ps
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 14:26:36 +0000
X-Inumbo-ID: 5bb1723a-3935-11ea-b543-12813bfff9fa
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5bb1723a-3935-11ea-b543-12813bfff9fa;
 Fri, 17 Jan 2020 14:26:32 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1579271192; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=HKFiJXCadNlgYdRuXeoyh9N2R92xnUQSajtcv6AqyuU=;
 b=JoSU6fms3MxcHCl5begqYBTI4kGTDnNHmbvWL4NmoTwtRm/jmgaT9h/UjkX2BY5pl/QkG3XH
 Hz4UdqJih0rFCJvdu9oP/crhVrFE//lCZQ4qMkFSX5enYqNzRFmvzfD2P42xquDJZwVVZL+k
 RUD08aQFx1oTej8fJNmlSuqzKjE=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mxa.mailgun.org with ESMTP id 5e21c415.7f5b8d0604b0-smtp-out-n03;
 Fri, 17 Jan 2020 14:26:29 -0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id y17so22917014wrh.5
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jan 2020 06:26:29 -0800 (PST)
X-Gm-Message-State: APjAAAVa9ir5LHpPelGsAQr1aK1eyXl4wMYg3129tW1hEALgeE7g7fB+
 4TIMv8R0D3qcunuLz/KO2f+jP4kch7QD94jyOHo=
X-Google-Smtp-Source: APXvYqwqoAXFozOvu6n3csq8EhuMrjJaZyrNRmWdGVNBeBsljtlQ6foaTOdei7eDbxhDDwQYSA456Ku0atLSDWwcyVA=
X-Received: by 2002:adf:f5cf:: with SMTP id k15mr3447422wrp.182.1579271187898; 
 Fri, 17 Jan 2020 06:26:27 -0800 (PST)
MIME-Version: 1.0
References: <cover.1578503483.git.tamas.lengyel@intel.com>
 <2284645a-0496-7811-5def-2cb053ffcf51@suse.com>
 <CABfawh=pBDQTxeJ-XHbi61nQNukGzGsD-iEtSWeNXnrS-H7b1Q@mail.gmail.com>
 <fec3f76c-c85e-1bd6-2049-c0b6031005fe@suse.com>
In-Reply-To: <fec3f76c-c85e-1bd6-2049-c0b6031005fe@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 17 Jan 2020 07:25:51 -0700
X-Gmail-Original-Message-ID: <CABfawhmYLsC3-_8CRwsRvnWEdBq8eCom=Wv2vKjNRRPY4x0bvQ@mail.gmail.com>
Message-ID: <CABfawhmYLsC3-_8CRwsRvnWEdBq8eCom=Wv2vKjNRRPY4x0bvQ@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiA+IFByb3ZpZGVkIHRoaXMgaXMgdjQgbm93IG9mIHRoZSBzZXJpZXMgYW5kIG5vIGlzc3Vlcwo+
ID4gd2VyZSByYWlzZWQgc28gZmFyIGZvciB0aGVzZSBwYXJ0aWN1bGFyIHBhdGNoZXMgdGhleSBj
YW4gYmUgbWVyZ2VkCj4gPiB3aXRoIHlvdXIgUmV2aWV3ZWQtYnkuCj4KPiBJIGRvbid0IHRoaW5r
IHNvLCB1bmRlciB0aGUgY3VycmVudCAoc3VmZmljaWVudGx5KSBjb21tb24KPiB1bmRlcnN0YW5k
aW5nIG9mIHRoZSBydWxlcy4gU2VlIEdlb3JnZSdzIHByb3Bvc2FsIHRvIGNoYW5nZSB0byBhCj4g
bW9kZWwgbGlrZSB3aGF0IHlvdSBpbXBseToKPiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMjAtMDEvbXNnMDA4ODUuaHRtbAo+CgpBaCBPSywg
SSB0aG91Z2ggdGhhdCB3YXMgYWxyZWFkeSBhZ3JlZWQgdXBvbi4gSSB3b3VsZCBjZXJ0YWlubHkg
cHJlZmVyCnRoYXQgbW9kZWwgdG8gc3BlZWQgdGhpbmdzIHVwIGFuZCByZWR1Y2UgdGhlIGhhc3Ns
ZSB0byB3b3JrIHdpdGggY29kZQpub29uZSBlbHNlIG1haW50YWlucyB0aGVuIG1lLgoKVGFtYXMK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
