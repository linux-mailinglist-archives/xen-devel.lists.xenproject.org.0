Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 155DB6A6DF
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 13:00:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnL97-00029l-RL; Tue, 16 Jul 2019 10:57:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YMz1=VN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hnL95-00029f-LX
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 10:57:19 +0000
X-Inumbo-ID: 786f3ace-a7b8-11e9-b5fd-936f2fe43351
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 786f3ace-a7b8-11e9-b5fd-936f2fe43351;
 Tue, 16 Jul 2019 10:57:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 47441AF46;
 Tue, 16 Jul 2019 10:57:14 +0000 (UTC)
To: Zhenzhong Duan <zhenzhong.duan@oracle.com>, linux-kernel@vger.kernel.org
References: <1562846532-32152-1-git-send-email-zhenzhong.duan@oracle.com>
 <1562846532-32152-5-git-send-email-zhenzhong.duan@oracle.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <2433589d-a2d2-6b51-cfbd-c1141014ab93@suse.com>
Date: Tue, 16 Jul 2019 12:57:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1562846532-32152-5-git-send-email-zhenzhong.duan@oracle.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v7 4/5] x86/paravirt: Remove const mark from
 x86_hyper_xen_hvm variable
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
Cc: sstabellini@kernel.org, mingo@redhat.com, bp@alien8.de,
 xen-devel@lists.xenproject.org, tglx@linutronix.de, boris.ostrovsky@oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDcuMTkgMTQ6MDIsIFpoZW56aG9uZyBEdWFuIHdyb3RlOgo+IC4uIGFzICJub3B2IiBz
dXBwb3J0IG5lZWRzIGl0IHRvIGJlIGNoYW5nZWFibGUgYXQgYm9vdCB1cCBzdGFnZS4KPiAKPiBD
aGVja3BhdGNoIHJlcG9ydCB3YXJuaW5nLCBzbyBtb3ZlIHZhcmlhYmxlIGRlY2xhcmF0aW9ucyBm
cm9tCj4gaHlwZXJ2aXNvci5jIHRvIGh5cGVydmlzb3IuaAo+IAo+IFNpZ25lZC1vZmYtYnk6IFpo
ZW56aG9uZyBEdWFuIDx6aGVuemhvbmcuZHVhbkBvcmFjbGUuY29tPgo+IENjOiBCb3JpcyBPc3Ry
b3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgo+IENjOiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+Cj4gQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2Vy
bmVsLm9yZz4KPiBDYzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+Cj4gQ2M6
IEluZ28gTW9sbmFyIDxtaW5nb0ByZWRoYXQuY29tPgo+IENjOiBCb3Jpc2xhdiBQZXRrb3YgPGJw
QGFsaWVuOC5kZT4KPiAtLS0KPiAgIGFyY2gveDg2L2luY2x1ZGUvYXNtL2h5cGVydmlzb3IuaCB8
IDggKysrKysrKysKPiAgIGFyY2gveDg2L2tlcm5lbC9jcHUvaHlwZXJ2aXNvci5jICB8IDggLS0t
LS0tLS0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9oeXBlcnZpc29yLmggYi9h
cmNoL3g4Ni9pbmNsdWRlL2FzbS9oeXBlcnZpc29yLmgKPiBpbmRleCBmN2I0YzUzLi5lNDFjYmYy
IDEwMDY0NAo+IC0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2h5cGVydmlzb3IuaAo+ICsrKyBi
L2FyY2gveDg2L2luY2x1ZGUvYXNtL2h5cGVydmlzb3IuaAo+IEBAIC01OCw2ICs1OCwxNCBAQCBz
dHJ1Y3QgaHlwZXJ2aXNvcl94ODYgewo+ICAgCWJvb2wgaWdub3JlX25vcHY7Cj4gICB9Owo+ICAg
Cj4gK2V4dGVybiBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl94ODYgeDg2X2h5cGVyX3Ztd2FyZTsK
PiArZXh0ZXJuIGNvbnN0IHN0cnVjdCBoeXBlcnZpc29yX3g4NiB4ODZfaHlwZXJfbXNfaHlwZXJ2
Owo+ICtleHRlcm4gY29uc3Qgc3RydWN0IGh5cGVydmlzb3JfeDg2IHg4Nl9oeXBlcl94ZW5fcHY7
Cj4gK2V4dGVybiBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl94ODYgeDg2X2h5cGVyX2t2bTsKPiAr
ZXh0ZXJuIGNvbnN0IHN0cnVjdCBoeXBlcnZpc29yX3g4NiB4ODZfaHlwZXJfamFpbGhvdXNlOwo+
ICtleHRlcm4gY29uc3Qgc3RydWN0IGh5cGVydmlzb3JfeDg2IHg4Nl9oeXBlcl9hY3JuOwo+ICtl
eHRlcm4gc3RydWN0IGh5cGVydmlzb3JfeDg2IHg4Nl9oeXBlcl94ZW5faHZtOwoKVGhpcyBzaG91
bGQgZWl0aGVyIHN0YXkgY29uc3QgYW5kIGJlIGNoYW5nZWQgaW4gcGF0Y2ggNSwgb3IgeW91CnNo
b3VsZCBhZGFwdCBpdHMgZGVmaW5pdGlvbiBpbiBhcmNoL3g4Ni94ZW4vZW5saWdodGVuX2h2bS5j
IGluCnRoaXMgcGF0Y2guCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
