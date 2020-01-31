Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FD814ECA2
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 13:46:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixVeW-0007nV-QS; Fri, 31 Jan 2020 12:44:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jSpw=3U=qconsultancy.nl=joost.heijne@srs-us1.protection.inumbo.net>)
 id 1ixVeU-0007nO-Bo
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 12:44:02 +0000
X-Inumbo-ID: 5ab77080-4427-11ea-8bbe-12813bfff9fa
Received: from smtp.qconsultancy.nl (unknown [185.43.215.210])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 5ab77080-4427-11ea-8bbe-12813bfff9fa;
 Fri, 31 Jan 2020 12:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp.qconsultancy.nl (Postfix) with ESMTP id 6F3B9B8061;
 Fri, 31 Jan 2020 13:43:59 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at qconsultancy.nl
Received: from smtp.qconsultancy.nl ([127.0.0.1])
 by localhost (smtp.qconsultancy.nl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s_rYYkBPOQHR; Fri, 31 Jan 2020 13:43:57 +0100 (CET)
Received: from qserver.QCONSULT.local (qserver.qconsult.local [192.168.134.21])
 by smtp.qconsultancy.nl (Postfix) with ESMTP id 2B491B8034;
 Fri, 31 Jan 2020 13:43:57 +0100 (CET)
X-MimeOLE: Produced By Microsoft Exchange V6.5
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Fri, 31 Jan 2020 13:43:57 +0100
Message-ID: <D86093E6BC00944ABD85466C2D43B2AB023FD3C8@qserver.QCONSULT.local>
In-Reply-To: <67b07eb0-e9ac-e7b2-cf07-0a1733f7526a@posteo.de>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [Xen-devel] Windows HVM no longer boots with AMD Ryzen 3700X
Thread-Index: AQGsWNfk0zAG8ObgTBITy7sUAR9aeAIY2mxMAkKLYzYBnyvD+QKNNR58qBN2l6A=
References: <51bd31f9-4fb1-84b5-7b9b-983b53133148@posteo.de>
 <a2fecd7b-a035-48b4-ed18-cd3234be8d58@citrix.com>
 <53c70f32-9ae6-a9f8-6472-5e49d01ce2b0@posteo.de>
 <1b95b3f8-b822-1f1c-243f-728e7967d04f@citrix.com>
 <67b07eb0-e9ac-e7b2-cf07-0a1733f7526a@posteo.de>
From: "Joost Heijne" <joost.heijne@qconsultancy.nl>
To: "Andreas Kinzler" <hfp@posteo.de>,
 "Andrew Cooper" <andrew.cooper3@citrix.com>,
 <xen-devel@lists.xenproject.org>, <Paul.Durrant@citrix.com>
Subject: Re: [Xen-devel] Windows HVM no longer boots with AMD Ryzen 3700X
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpJIHJhbiBpbnRvIHRoaXMgbGlzdCBsb29raW5nIGZvciBhIHNvbHV0aW9uIGZvciB0aGUg
ZXhhY3Qgc2FtZSBwcm9ibGVtCmFzIGRlc2NyaWJlZCBoZXJlLiBJJ20gdHJ5aW5nIHRvIG1pZ3Jh
dGUgYW4gZXhpc3RpbmcgV2luZG93cwpTZXJ2ZXIgMjAxNiBpbWFnZSB0byBhIFJ5emVuIDM5MDB4
IGFuZCBlbmNvdW50ZXJlZCB0aGUgc2FtZQpkaWZmaWN1bHRpZXMuIEkgZGlzYWJsZWQgdGhlIHBy
b2Nlc3NvcidzIFNNVCBmZWF0dXJlIGluIHRoZSBCSU9TIGFuZApub3cgaXQgd29ya3MgcGVyZmVj
dGx5LgoKUmVnYXJkcywKCkpvb3N0IEhlaWpuZQoKLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0K
RnJvbTogWGVuLWRldmVsIFttYWlsdG86eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMueGVucHJvamVj
dC5vcmddIE9uIEJlaGFsZiBPZiBBbmRyZWFzIEtpbnpsZXIKU2VudDogV2VkbmVzZGF5LCBPY3Rv
YmVyIDIsIDIwMTkgMTI6MDUKVG86IEFuZHJldyBDb29wZXI7IHhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZzsgUGF1bC5EdXJyYW50QGNpdHJpeC5jb20KU3ViamVjdDogUmU6IFtYZW4tZGV2
ZWxdIFdpbmRvd3MgSFZNIG5vIGxvbmdlciBib290cyB3aXRoIEFNRCBSeXplbiAzNzAwWAoKT24g
MjAuMDguMjAxOSAyMjozOCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyMC8wOC8yMDE5IDIx
OjM2LCBBbmRyZWFzIEtpbnpsZXIgd3JvdGU6Cj4+Pj4gSXMgaXQgYSBrbm93biBwcm9ibGVtPyBE
aWQgc29tZW9uZSB0ZXN0IHRoZSBuZXcgRVBZQ3M/Cj4+PiBUaGlzIGxvb2tzIGZhbWlsaWFyLCBh
bmQgaXMgc3RpbGwgc29tZXdoZXJlIG9uIG15IFRPRE8gbGlzdC4KPj4gRG8geW91IGFscmVhZHkg
a25vdyB0aGUgcmVhc29uIG9yIGlzIHRoYXQgc3RpbGwgdG8gaW52ZXN0aWdhdGU/Cj4+PiBEb2Vz
IGJvb3Rpbmcgd2l0aCBhIHNpbmdsZSB2Q1BVIHdvcms/Cj4gSG1tIC0gcGVyaGFwcyBpdHMgbm90
IHRoZSBzYW1lIGlzc3VlIHRoZW4uwqAgRWl0aGVyIHdheSwgaXRzIGZpcm1seSBpbgo+IHRoZSAi
c3RpbGwgdG8gaW52ZXN0aWdhdGUiIHBoYXNlLgoKQW55IHVwZGF0ZSBvbiB0aGUgdG9waWM/CgpS
ZWdhcmRzIEFuZHJlYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
