Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E73F5F1492
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2019 12:06:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSJ6X-0007k7-JC; Wed, 06 Nov 2019 11:04:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MOxY=Y6=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iSJ6V-0007k0-S4
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2019 11:03:59 +0000
X-Inumbo-ID: 21733074-0085-11ea-a1a9-12813bfff9fa
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 21733074-0085-11ea-a1a9-12813bfff9fa;
 Wed, 06 Nov 2019 11:03:58 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id j15so4553651wrw.5
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2019 03:03:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=N6f9P1bSdT5g56cNB6luxijYnxeOaTRY8mR/Xxa6IJs=;
 b=FW+lGX5uDKHqlvGppJ3a3AyqaoX8j6PuyW7zBOwSW/UlBOFfIGHSmQRpiqJwtTcoBA
 oVNrrnnEfGk78QSP4ng+vfqnzR/LAulVNBmtORvisuJxYATpQ6wtCG4XW/tXNPh1DATD
 22WZEdLIzlif/DcVDOVYT3Jrwb0NVvPI7s36RHK8qGDbilB64FEdXT8n1p4n3+oLFc/7
 tFcnHfDQId+n6RHmyeVlvucljkjqxO2c+tf7Eye/zSsii3YCKvRB8zZm5lmtYUxGDQ7E
 DH0gAlgfUGXmXo0ZWHsP/Ck4lq0QZi1oHTefNT5cjtQe7s5IZEBoIAG95WkWzUjklc61
 LjKA==
X-Gm-Message-State: APjAAAXznYfYVYIR0i0E21z7wiKpDXCk4i/UG4EYhuPDDa8gP4sNlps4
 N1t8PSww326LGc6iND11PuM=
X-Google-Smtp-Source: APXvYqxKyM7xw2bPXvztlC0VZpeHNVTMgRCTNkf/eX/GWt5mFeBbuiK7e8/DuMzLEtTlROMwcyxIKA==
X-Received: by 2002:a5d:4585:: with SMTP id p5mr2136656wrq.134.1573038237680; 
 Wed, 06 Nov 2019 03:03:57 -0800 (PST)
Received: from debian (108.162.147.147.dyn.plus.net. [147.147.162.108])
 by smtp.gmail.com with ESMTPSA id z15sm23252711wrr.19.2019.11.06.03.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 03:03:57 -0800 (PST)
Date: Wed, 6 Nov 2019 11:03:55 +0000
From: Wei Liu <wl@xen.org>
To: Julian Tuminaro <julian.tuminaro@gmail.com>
Message-ID: <20191106110355.yxvge52aepy53qz5@debian>
References: <20191106022427.9088-1-julian.tuminaro@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191106022427.9088-1-julian.tuminaro@gmail.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH 1/1] kdd.c: Add support for initial
 handshake in KD protocol for Win 7, 8 and 10 (64 bit)
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
Cc: wl@xen.org, paul@xen.org, ian.jackson@eu.citrix.com,
 Jenish Rakholiya <rjenish@cmu.edu>, tim@xen.org,
 Julian Tuminaro <jtuminar@andrew.cmu.edu>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVsaWFuCgpUaGFua3MgZm9yIHlvdXIgcGF0Y2guCgpPbiBUdWUsIE5vdiAwNSwgMjAxOSBh
dCAwOToyNDoyN1BNIC0wNTAwLCBKdWxpYW4gVHVtaW5hcm8gd3JvdGU6ClsuLi5dCj4gIAo+ICsj
aWYgMAo+ICsvKioKPiArICogQGJyaWVmIFRlbXBvcmFyeSBmdW5jdGlvbiBmb3IgcHJpbnRpbmcg
bWVtb3J5IGR1bXAgd2hpbGUgZGVidWdnaW5nCj4gKyAqIER1bXBzIGluIHRoZSBmb3JtYXQgb2Yg
UVdPUkQgdHlwZQo+ICsgKgo+ICsgKiBAcGFyYW0gcyBQb2ludGVyIHRvIHRoZSBrZGRfc3RhdGUg
c3RydWN0dXJlCj4gKyAqIEBwYXJhbSBhZGRyIEFkZHJlc3MgdG8gc3RhcnQgZHVtcGluZyBtZW1v
cnkgZnJvbQo+ICsgKiBAcGFyYW0gc2l6ZSBOdW1iZXIgb2YgYnl0ZXMgdG8gcHJpbnQgKGF1dG9t
YXRpY2FsbHkgYWxpZ25lZCB0byBoaWdoZXIKPiArICogbXVsdGlwbGUgb2YgOCBieXRlcwo+ICsg
Kgo+ICsgKiBAbm90ZSBUT0RPOiBSZW1vdmUgdGhpcyBiZWZvcmUgcHVzaGluZyB0byBtYXN0ZXIK
CjotKQoKPiArICogQG5vdGUgVE9ETzogTWF5YmUgYWRkIGxldmVsIG9mIGxvZ2dpbmcgdG8ga2Rk
ICh1c2luZyAtdiBvcHRpb24pIC0gVGhlCj4gKyAqIGlkZWEgb2YgdXNpbmcgcHJpbnRmIGluc3Rl
YWQgb2YgS0REX0xPRyB3YXMgdG8gbm90IHByaW50IGFsbCBvdGhlciB1bndhbnRlZAo+ICsgKiBs
b2dnaW5nIG91dHB1dAo+ICsgKi8KPiArc3RhdGljIHZvaWQgbXlfbWVtZHVtcChrZGRfc3RhdGUg
KnMsIHVpbnQ2NF90IGFkZHIsIGludCBzaXplKQoKSWYgdGhpcyBmdW5jdGlvbiBpcyBub3QgdXNl
ZCwgcGxlYXNlIGxlYXZlIGl0IG91dC4gSSBnZW5lcmFsbHkgcHJlZmVyIHRvCm5vdCBjb21taXQg
ZGVhZCBjb2RlIHVubGVzcyBhYnNvbHV0ZWx5IG5lY2Vzc2FyeS4KCkFsc28gdGhlIGNvZGUgY2Fu
IHVzZSBhIGJpdCBvZiBjbGVhbnVwIGJlY2F1c2UgaXQgY29udGFpbnMgYSBsb3Qgb2YKY29tbWVu
dGVkIG91dCBjb2RlIHdoaWNoIGlzIHByb2JhYmx5IGZvciBkZWJ1Z2dpbmcgb25seS4KCkknbSBu
b3QgZmFtaWxpYXIgd2l0aCBLREQgc28gSSB3aWxsIGxlYXZlIHRoZSBqdWRnZW1lbnQgb2YgdGhp
cyBwYXRjaCB0bwpQYXVsIGFuZCBUaW0uIFBsZWFzZSB3YWl0IGZvciB0aGVtIHRvIHJlcGx5IGJl
Zm9yZSBzZW5kaW5nIG91dCBhIG5ldwp2ZXJzaW9uLgoKV2VpLgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
