Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB241B6A44
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 20:09:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAeKO-0006SX-Nq; Wed, 18 Sep 2019 18:05:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Zcq4=XN=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iAeKM-0006SF-LJ
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 18:05:18 +0000
X-Inumbo-ID: de9ca8f0-da3e-11e9-978d-bc764e2007e4
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id de9ca8f0-da3e-11e9-978d-bc764e2007e4;
 Wed, 18 Sep 2019 18:05:17 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id i18so342373wru.11
 for <xen-devel@lists.xenproject.org>; Wed, 18 Sep 2019 11:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6qmWF32pENIP//isORy9Ptu21rCJiW7G6CWYUUEI8jg=;
 b=netlfep0iH36/RkXZEpDLZwFucwNsBtvUBA9/uxlZoDg4bRLBYTSeNUEKHmHSWuP0c
 o6JvyCVPp/G2xScpfFE4N0iuTgqkWezvgqDV7XpFDIGys5QpCOs4McZX9It7CKqQcghk
 NBDmMtWJcdsFM0SjebMpQMVwTgJ2/PPOVFBD5XfdKuwuek0XA+EqhYXY4Ol/eQRAujYl
 EtOQkAYaJfLZ4l5VRi00VMJsDCA3gPleGBZ8QAf9DmUaaBCMk0uwOJzvKN7jvht77eG6
 Io22JOfKfaRORHvQNF+J+Wll56YhJFPKlQkrniC/IY087D5PjLUU3ZOADPa5/zoBEBHV
 XdbQ==
X-Gm-Message-State: APjAAAVx+DbzH2kITZI7eeSfcA4bmWFmCVcYfJ2x7xQb53wNxA4B7iDP
 wQMd5agrd5TzsLdAoKCiduo=
X-Google-Smtp-Source: APXvYqwj/kG9SQ5pyRf9xBsCxz3QO3+Fi+YjLREBacIFaNYmOFSTsnQXsdH8nB6uv++uzBxJl2ZlIA==
X-Received: by 2002:adf:c7cf:: with SMTP id y15mr3017735wrg.54.1568829916521; 
 Wed, 18 Sep 2019 11:05:16 -0700 (PDT)
Received: from debian (104.163.200.146.dyn.plus.net. [146.200.163.104])
 by smtp.gmail.com with ESMTPSA id r65sm3631217wmr.9.2019.09.18.11.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 11:05:15 -0700 (PDT)
Date: Wed, 18 Sep 2019 19:05:13 +0100
From: Wei Liu <wl@xen.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Message-ID: <20190918180513.zmg2if6wkuegz2m5@debian>
References: <20190918161406.19208-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190918161406.19208-1-ian.jackson@eu.citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] tools/configure: Allow specifying python to
 be found from path
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
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBTZXAgMTgsIDIwMTkgYXQgMDU6MTQ6MDZQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gLi9jb25maWd1cmUgdGFrZXMgYSBQWVRIT049Li4uIGFyZ3VtZW50LiAgWW91IGNhbiB1
c2UgdGhpcyB0byBzcGVjaWZ5Cj4gdGhlIHB5dGhvbiBpbnRlcnByZXRlci4gIEhvd2V2ZXIsIGZv
ciBubyBnb29kIHJlYXNvbiwgaXQgZXhwZWN0cyBhbgo+IGFic29sdXRlIHBhdGguCj4gCj4gRml4
IHRoaXMuICBUaGUgbmV3IGxvZ2ljIGlzOgo+ICAqIGlmIG5vdCBzZXQsIGRlZmF1bHQgdG8gYHB5
dGhvbicKPiAgKiBpZiBub3QgYWJzb2x1dGUsIGxvb2sgaXQgdXAgd2l0aCB0eXBlIC1wCj4gICog
c3BsaXQgaW50byBkaXJlY3RvcnkgYW5kIGV4ZWN1dGFibGUgbmFtZQo+IAo+IFRoZSByZXN1bHRz
IGluIGNvbmZpZy9Ub29scy5tayAod2hpY2ggY29udGFpbnMgQFBZVEhPTkAgYW5kCj4gQFBZVEhP
TlBBVEhAKSBhcmUgaWRlbnRpY2FsIGZvciBib3RoCj4gICAuL2NvbmZpZ3VyZQo+ICAgLi9jb25m
aWd1cmUgUFlUSE9OPS91c3IvYmluL3B5dGhvbgo+IHNvIEkgYXNzZXJ0IHRoaXMgaGFzIG5vIGZ1
bmN0aW9uYWwgY2hhbmdlIGV4Y2VwdCB0aGF0IG5vdyB5b3UgY2FuIHNheQo+ICAgLi9jb25maWd1
cmUgUFlUSE9OPXB5dGhvbgo+IAo+IEluIHBhcnRpY3VsYXIgeW91IGNhbiBub3cgc2F5Cj4gICAu
L2NvbmZpZ3VyZSBQWVRIT049cHl0aG9uMgo+ICAgLi9jb25maWd1cmUgUFlUSE9OPXB5dGhvbjMK
PiAKPiBUaGUgbGF0dGVyIGlzIHVzZWZ1bCBpZiB5b3Ugd2FudCBweXRob24zICh3aGljaCBzaG91
bGQgcHJvYmFibHkgYmUgdGhlCj4gZGVmYXVsdCwgYnV0IGRvZXMgbm90IHdvcmsgcmlnaHQgbm93
KS4gIFRoZSBmb3JtZXIgaXMgdXNlZnVsIGlmIHlvdQo+IHdhbnQgcHl0aG9uMiBidXQgeW91ciBk
aXN0cm8gaGFzIGZvb2xpc2hseSBtYWRlICJweXRob24iIHJlZmVyIHRvCj4gcHl0aG9uMy4KPiAK
PiBDQzogRG91ZyBHb2xkc3RlaW4gPGNhcmRvZUBjYXJkb2UuY29tPgo+IENDOiBXZWkgTGl1IDx3
bEB4ZW4ub3JnPgo+IENDOiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+
Cj4gU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+
CgpBY2tlZC1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
