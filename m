Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0302B122DCF
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 15:00:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihDLt-000859-SK; Tue, 17 Dec 2019 13:57:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7KW0=2H=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ihDLs-000854-0k
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 13:57:28 +0000
X-Inumbo-ID: 28116b39-20d5-11ea-8ecb-12813bfff9fa
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 28116b39-20d5-11ea-8ecb-12813bfff9fa;
 Tue, 17 Dec 2019 13:57:27 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id c14so11405742wrn.7
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2019 05:57:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3uDditNcGe9w+Xvsl4KcxLbs5eEjJIOyqBnyaX64IUI=;
 b=jx+uS/dxAf3F/z9G/BeG1SHQSsCxKZ4hGV3VFCfYqKzOF9EfW1t8SND/86niDn3Nbg
 2xLcvYA0aSHP4K1ahD1vxtsqm8qyjEMzD3SDSsBnsHnmVnqG+fxE7RDctqXYoR8PDCsj
 CeaG1BaWk4ZxOv6u5b+WsAwsynYP99I+mPlOXposmHZux6cGOB2zXcXTDEPCt1qU5IbZ
 yGY49iUdpLDN5Os1UvpCc5NyBuu/fSTz9/SJGVpM2PNfu5m43W+bAOFMCDTOTD3aMh/J
 qE2DpMIRw7J5Sjh2UkaAavOd0P/yLBT9WoXn9g6FEH8XePhXKsfcYbUbwFPqSAPtFLKD
 jWxQ==
X-Gm-Message-State: APjAAAVX56IrXFAn1m7H9cKonT+7tj4DGKVI/0XTibaWMxvCdBCEXAIz
 fDf9PIHDBUIKNUdoFUt12sk=
X-Google-Smtp-Source: APXvYqyXhl1j1wzf6VgLhjeEg9PZj0KN/NzvWleCYc3GgvoAj7VYxCyPA40f+pIWiWvL9zOPWWqs2Q==
X-Received: by 2002:a05:6000:149:: with SMTP id
 r9mr36945977wrx.147.1576591046491; 
 Tue, 17 Dec 2019 05:57:26 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id z3sm25504747wrs.94.2019.12.17.05.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 05:57:25 -0800 (PST)
Date: Tue, 17 Dec 2019 13:57:24 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191217135724.6ij5nsjps3e2kxj3@debian>
References: <20191217134956.15137-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191217134956.15137-1-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] libxc/restore: Fix error message for
 unrecognised stream version
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBEZWMgMTcsIDIwMTkgYXQgMDE6NDk6NTZQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBUaGUgRXhwZWN0ZWQgYW5kIEdvdCB2YWx1ZXMgYXJlIHJlbmRlcmVkIGluIHRoZSB3
cm9uZyBvcmRlci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPgoKQWNrZWQtYnk6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
