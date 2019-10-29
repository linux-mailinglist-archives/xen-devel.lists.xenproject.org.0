Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3598BE8875
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2019 13:42:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPQlz-0006Vz-62; Tue, 29 Oct 2019 12:38:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Jy4k=YW=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iPQly-0006Vu-47
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2019 12:38:54 +0000
X-Inumbo-ID: 1072c984-fa49-11e9-9511-12813bfff9fa
Received: from mail-lf1-f67.google.com (unknown [209.85.167.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1072c984-fa49-11e9-9511-12813bfff9fa;
 Tue, 29 Oct 2019 12:38:53 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id u16so10401119lfq.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2019 05:38:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/23DWlstsunoPqkEzdA+tZRSeTwkqkDiMo22lF8Je2E=;
 b=m9D5SzBfW5UP0vpufzrScj09EG7pFtaC8Dt1+CiEQWuOifnD7ry15tJQeiYxhuAgIN
 3GWBkaWMPyN73KZEV+YGtdCci9YhiaTkcD20j2eq/uKbE9Y9H9+0Z7FpnOBqq9J3JmqU
 Nz56zHbIXMc9Po7f7QmkHQju1Hrbzvh0vt6BDIhHC6ciLFkVE8khzKBM1E6RyEQpHR6C
 c1JvukbLjSGIFSxbh6pbqJaOpcKRCF4K3ztgFqR5Xg3YAQ3WfKuDnw/zaJyO3+j6zw+b
 qDJpVLmVyLbddq0Y1IqlZIel2c2IkmOkyqVY4qCeyFK+bAB/6uE78DUuDVbU2SFTzi95
 6X6Q==
X-Gm-Message-State: APjAAAXMxB1/wQDOfqEVjsAE1Lq7BaGBfUhSMUobxG/aVy538ZJgBx3E
 nupqhM20NOn8tiXUbxOB1gCBPqqPKJY=
X-Google-Smtp-Source: APXvYqxrDTfXAoFij/urQgwB2EpPf3Jtu8CvUXz/Xoos2lNhixPbr+Db1MSRq/MQ4K1ClSd6FbRT8Q==
X-Received: by 2002:a19:4848:: with SMTP id v69mr2337937lfa.6.1572352732099;
 Tue, 29 Oct 2019 05:38:52 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com.
 [209.85.167.42])
 by smtp.gmail.com with ESMTPSA id q26sm3602780lfo.65.2019.10.29.05.38.51
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2019 05:38:51 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id j14so5451998lfb.8
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2019 05:38:51 -0700 (PDT)
X-Received: by 2002:a19:750:: with SMTP id 77mr2320252lfh.81.1572352731567;
 Tue, 29 Oct 2019 05:38:51 -0700 (PDT)
MIME-Version: 1.0
References: <e9520623cacf33574d2f395584f487410aae8934.1572280689.git.ppircalabu@bitdefender.com>
In-Reply-To: <e9520623cacf33574d2f395584f487410aae8934.1572280689.git.ppircalabu@bitdefender.com>
From: Wei Liu <wl@xen.org>
Date: Tue, 29 Oct 2019 12:38:35 +0000
X-Gmail-Original-Message-ID: <CAK9nU=otVy8SGgH8PggNXKaHYqeFYJ9e4uXvAGQMDh_WVAniMg@mail.gmail.com>
Message-ID: <CAK9nU=otVy8SGgH8PggNXKaHYqeFYJ9e4uXvAGQMDh_WVAniMg@mail.gmail.com>
To: Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: Re: [Xen-devel] [PATCH v2] tools/ocaml: Fix build error with Arch
 Linux
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, Wei Liu <wl@xen.org>,
 David Scott <dave@recoil.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyOCBPY3QgMjAxOSBhdCAxNjozOCwgUGV0cmUgUGlyY2FsYWJ1CjxwcGlyY2FsYWJ1
QGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4KPiBnY2MgKEdDQykgOS4yLjAgY29tcGxhaW5zOgo+
Cj4geGVudG9vbGxvZ19zdHVicy5jOiBJbiBmdW5jdGlvbiDigJhzdHViX3h0bF9vY2FtbF92bWVz
c2FnZeKAmToKPiB4ZW50b29sbG9nX3N0dWJzLmM6OTM6MTY6IGVycm9yOiBpbml0aWFsaXphdGlv
biBkaXNjYXJkcyDigJhjb25zdOKAmSBxdWFsaWZpZXIgZnJvbSBwb2ludGVyIHRhcmdldCB0eXBl
IFstV2Vycm9yPWRpc2NhcmRlZC1xdWFsaWZpZXJzXQo+ICAgIDkzIHwgIHZhbHVlICpmdW5jID0g
Y2FtbF9uYW1lZF92YWx1ZSh4dGwtPnZtZXNzYWdlX2NiKSA7Cj4gICAgICAgfCAgICAgICAgICAg
ICAgICBefn5+fn5+fn5+fn5+fn5+Cj4KPiBUaGlzIHBhdGNoIGNvbnN0aWZpZXMgdGhlIHBvaW50
ZXIgcmV0dXJuZWQgYnkgY2FtbF9uYW1lZF92YWx1ZSBpbiBvcmRlcgo+IHRvIHRoZSBhY2NvbW1v
ZGF0ZSBuZXdlciB2ZXJzaW9ucyBvZiBPQ2FtbC4KPiBJbiBPQ2FtbCA+PSA0LjA5IHRoZSByZXR1
cm4gdmFsdWUgcG9pbnRlciBvZiBjYW1sX25hbWVkX3ZhbHVlIGlzCj4gZGVjbGFyZWQgY29uc3Qu
Cj4KPiBodHRwczovL2dpdGh1Yi5jb20vb2NhbWwvb2NhbWwvY29tbWl0LzRmMDNhMTQ2N2QyOWNm
NTg3ZGY1YTE5MTgzMGYxNTI1NTA2ZWUwZTMKPgo+IFNpZ25lZC1vZmYtYnk6IFBldHJlIFBpcmNh
bGFidSA8cHBpcmNhbGFidUBiaXRkZWZlbmRlci5jb20+Cj4gUmV2aWV3ZWQtYnk6IEFudGhvbnkg
UEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgo+IFJlbGVhc2UtYWNrZWQtYnk6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCkFja2VkLWJ5OiBXZWkgTGl1IDx3bEB4ZW4u
b3JnPgoKSSB3aWxsIHdhaXQgYSBmZXcgZGF5cyBmb3IgQ2hyaXN0aWFuIGFuZCBEYXZpZCB0byBj
aGltZSBpbi4gSWYgSSBkb24ndApoZWFyIGJhY2sgYnkgTW9uZGF5LCBJJ20gZ29pbmcgdG8gY29t
bWl0IHRoaXMgcGF0Y2ggLS0gdGhpcyBpcyBwcmV0dHkKbWVjaGFuaWNhbCBhbnl3YXkuCgpXZWku
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
