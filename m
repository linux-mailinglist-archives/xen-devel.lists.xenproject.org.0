Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF14134604
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 16:23:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipD8T-0003ge-Cq; Wed, 08 Jan 2020 15:20:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=e5qD=25=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ipD8S-0003gX-1P
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 15:20:40 +0000
X-Inumbo-ID: 6d293cda-322a-11ea-b82c-12813bfff9fa
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6d293cda-322a-11ea-b82c-12813bfff9fa;
 Wed, 08 Jan 2020 15:20:39 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id t2so3840516wrr.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2020 07:20:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yi5Gy2myYfIZf5w6uITG2R3sS1g+9tZ2u0N+bHmhukQ=;
 b=dBcOAw2zRmINuI9nfgHD8F9poTjp0l3+syOqPBVeLB0QbH2J2lvpG3a2fXJgEtJERX
 cO7sBnbU9v+nHpZKibAsS+HhVE/5exzPvLBarGH54M76iSK5iUJQWPT+XnXBZ3eau7Nd
 YqxSgXqlDEElUF+vN0BmV2d4y2P1DfqfY9DUrX9LfGwpsduJBJUdJLdxeZWaq4IulcIq
 RJHs0x+zc89Uu35CwaC0Ty+zcJVZXeMFDzu9cpGtjOHmeVws8Yv6TVFwHfHJk+wr2YbO
 rZTGRyJyd0aBun7dWffW6vASepirUHPbrEv8ZLcIn3vGGGInzxLLv7jSDg/lhnnoP9cl
 wrGA==
X-Gm-Message-State: APjAAAVNlNzFOBiXviokjrGraTi8R5VuCEicqQlRGaUoqihjz/LhTMqR
 JlH2EAoVPF64BlQFVZM637w=
X-Google-Smtp-Source: APXvYqyL8xHTgelCTZFTK1XvuTviDCtpozk/rXpcto6Si2lzLm34GVCrhM1KvLT199JLgKdgCYsKTA==
X-Received: by 2002:adf:df0e:: with SMTP id y14mr4802625wrl.377.1578496838669; 
 Wed, 08 Jan 2020 07:20:38 -0800 (PST)
Received: from debian (11.163.200.146.dyn.plus.net. [146.200.163.11])
 by smtp.gmail.com with ESMTPSA id b15sm4038149wmj.13.2020.01.08.07.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 07:20:38 -0800 (PST)
Date: Wed, 8 Jan 2020 15:20:36 +0000
From: Wei Liu <wl@xen.org>
To: Rich Persaud <persaur@gmail.com>
Message-ID: <20200108152036.yfccdzesfigkmpv3@debian>
References: <5A310C33-58F6-47F0-8892-1BE7D256A374@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5A310C33-58F6-47F0-8892-1BE7D256A374@gmail.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] Making save/restore optional in toolstack,
 for edge/embedded derivatives
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
 Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMDIsIDIwMjAgYXQgMDE6NTE6MjFQTSAtMDUwMCwgUmljaCBQZXJzYXVkIHdy
b3RlOgo+IExpbnV4IHN0dWJkb20gcGF0Y2hlcyBjdXJyZW50bHkgcmVxdWlyZSBxZW11IGluIGRv
bTAgZm9yIGNvbnNvbGVzIFsxXSwKPiBkdWUgdG8gdGhlIHVwc3RyZWFtIHRvb2xzdGFjayBuZWVk
IGZvciBzYXZlL3Jlc3RvcmUuICBVbnRpbCBhCj4gbG9uZy10ZXJtIHNvbHV0aW9uIGlzIGF2YWls
YWJsZSAobXVsdGlwbGUgY29uc29sZSBzdXBwb3J0IGluCj4geGVuY29uc29sZWQpLCB3b3VsZCB0
b29scyBtYWludGFpbmVycyBjb25zaWRlciBhIHBhdGNoIHRoYXQgbWFkZQo+IHNhdmUvcmVzdG9y
ZSBidWlsZC10aW1lIGNvbmZpZ3VyYWJsZSBmb3IgdGhlIHRvb2xzdGFjaz8gIFRoaXMgd291bGQK
PiBhdm9pZCBYZW4gZWRnZS9lbWJlZGRlZCBkZXJpdmF0aXZlcyBoYXZpbmcgdG8gcGF0Y2ggZG93
bnN0cmVhbSB0bwo+IHJlbW92ZSBzYXZlL3Jlc3RvcmUsIGUuZy4gdG8gYXZvaWQgcWVtdSBpbiBk
b20wLgoKUmUgbXVsdGlwbGUgY29uc29sZSBzdXBwb3J0LCBJIHRoaW5rIHRoYXQncyBhZGRlZCBi
YWNrIGluIDIwMTcgZm9yIEFybQpndWVzdHMuIFdoYXQgaXMgbWlzc2luZz8KCihOb3Qgc3VnZ2Vz
dGluZyBpdCBpcyBmaXQgZm9yIHB1cnBvc2UgYXMtaXMpCgpXZWkuCgo+IAo+IFJpY2gKPiAKPiBo
dHRwczovL2dpdGh1Yi5jb20vbWFybWFyZWsveGVuL2NvbW1pdC8xM2M2ZDI3MjU5OTI5ZWNhNTZh
MTFiZDBkYWNiZTU1NzI3NDIyNGQzCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
