Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DE31325DA
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 13:15:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ionjx-0006Wd-0E; Tue, 07 Jan 2020 12:13:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Heq1=24=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ionju-0006WX-VU
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 12:13:38 +0000
X-Inumbo-ID: 2263e40e-3147-11ea-abec-12813bfff9fa
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2263e40e-3147-11ea-abec-12813bfff9fa;
 Tue, 07 Jan 2020 12:13:38 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id t2so53670700wrr.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2020 04:13:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=c6QmTk1aia9bkxv37lc3PtC9TMCzNwKAJAc/CoMRahA=;
 b=QKlCeEaDDl1eG2eg21dj3kZZVgTA16s2WDj/SmbWkRtc5JmZa5WuX4/OwCQ63XuUCi
 IbqPfhrAhdM4BoLVjW/dWZwsAss9GOCQCjV3BB3LVpREYJwURn0EBVmCxIoQmMOypOAa
 pMYOmWGtIuzM4GGWQdMOksFXDsaI4tRxEBawLT2DbzcxqjbY2AyVz/1pIiiX+3FLJ7w0
 LPB42koGK96kqZmm02gpTDqTnf1Xdq1TGTHfCNI7Biz6eQVo9cIPL8CqLmn58yPOgQqd
 ON9yIbN5vxLExUtVSdw5rnH6rmZKaZkdKeptScspT8Aao8uuBn/F4guCbBchvsINeojE
 KyUw==
X-Gm-Message-State: APjAAAUqau4lsGeI2WOT6JXlqylujjHlLQb7b0O8y15hFgw4GLpO1fwi
 nyaRgnhDEBaqA8mEIL+rmYk=
X-Google-Smtp-Source: APXvYqx0HzmAJmuvfhoK2sMjQ1btutL5LtHGknhS6++aHsvz/idd/yUwcGJdbE5iaLyI8RnsGsI2mg==
X-Received: by 2002:adf:f847:: with SMTP id d7mr112287551wrq.35.1578399217495; 
 Tue, 07 Jan 2020 04:13:37 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id e18sm75831703wrr.95.2020.01.07.04.13.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 04:13:37 -0800 (PST)
Date: Tue, 7 Jan 2020 12:13:35 +0000
From: Wei Liu <wl@xen.org>
To: Hongyan Xia <hongyxia@amazon.com>
Message-ID: <20200107121335.nqb3kx4eos3yfiwb@debian>
References: <cover.1578397252.git.hongyxia@amazon.com>
 <3b373c553a15dfdcd26c21e4f39c30404c7c2fa9.1578397252.git.hongyxia@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3b373c553a15dfdcd26c21e4f39c30404c7c2fa9.1578397252.git.hongyxia@amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v5 1/7] x86: move some xen mm function
 declarations
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
Cc: Wei Liu <wei.liu2@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, jgrall@amazon.com,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMDcsIDIwMjAgYXQgMTI6MDY6NDNQTSArMDAwMCwgSG9uZ3lhbiBYaWEgd3Jv
dGU6Cj4gRnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiAKPiBUaGV5IHdlcmUg
cHV0IGludG8gcGFnZS5oIGJ1dCBtbS5oIGlzIG1vcmUgYXBwcm9wcmlhdGUuCj4gCj4gVGhlIHJl
YWwgcmVhc29uIGlzIHRoYXQgSSB3aWxsIGJlIGFkZGluZyBzb21lIG5ldyBmdW5jdGlvbnMgd2hp
Y2gKPiB0YWtlcyBtZm5fdC4gSXQgdHVybnMgb3V0IGl0IGlzIGEgYml0IGRpZmZpY3VsdCB0byBk
byBpbiBwYWdlLmguCj4gCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCj4gCj4gU2lnbmVkLW9mZi1i
eTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiBBY2tlZC1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgoKSSB3aWxsIGNvbW1pdCB0aGlzIHRyaXZpYWwgcGF0Y2ggc29v
bi1pc2ggdG8gcmVkdWNlIEhvbnlhbidzIHBhdGNoIHF1ZXVlCmxlbmd0aC4KClNob3V0IGlmIHlv
dXIgZGlzYWdyZWUuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
