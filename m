Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFF14FC0AF
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 17:29:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303144.517198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndvy4-0001wK-T1; Mon, 11 Apr 2022 15:28:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303144.517198; Mon, 11 Apr 2022 15:28:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndvy4-0001tS-PS; Mon, 11 Apr 2022 15:28:40 +0000
Received: by outflank-mailman (input) for mailman id 303144;
 Mon, 11 Apr 2022 15:28:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=as7e=UV=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1ndvy3-0001tM-Hu
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 15:28:39 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0debb30f-b9ac-11ec-a405-831a346695d4;
 Mon, 11 Apr 2022 17:28:37 +0200 (CEST)
Received: from DB6P18901CA0002.EURP189.PROD.OUTLOOK.COM (2603:10a6:4:16::12)
 by DB8PR08MB5066.eurprd08.prod.outlook.com (2603:10a6:10:e4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 15:28:25 +0000
Received: from DB5EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:16:cafe::80) by DB6P18901CA0002.outlook.office365.com
 (2603:10a6:4:16::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29 via Frontend
 Transport; Mon, 11 Apr 2022 15:28:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT046.mail.protection.outlook.com (10.152.21.230) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.21 via Frontend Transport; Mon, 11 Apr 2022 15:28:24 +0000
Received: ("Tessian outbound 78191104f1b7:v118");
 Mon, 11 Apr 2022 15:28:24 +0000
Received: from 039ddf7bd700.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4229D09E-3367-45F0-9289-BBFA6D3D4032.1; 
 Mon, 11 Apr 2022 15:28:15 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 039ddf7bd700.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 11 Apr 2022 15:28:15 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 (2603:10a6:203:4c::14) by HE1PR0801MB1867.eurprd08.prod.outlook.com
 (2603:10a6:3:53::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 15:28:10 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::7cce:cf19:817f:57a0]) by AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::7cce:cf19:817f:57a0%11]) with mapi id 15.20.5144.029; Mon, 11 Apr
 2022 15:28:09 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 0debb30f-b9ac-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gt5jAdlLFKn2FKYVejnnvArgY2fNHKot2ohec1+lUUQ=;
 b=3Q7vncL0bET78Yp47Zr5FLUkdPDlCEox9gE/7j0BeAAdUVAowW5K4zRukwrpjK23rzgG+uFI69MzxtMMgEGg/XhTd7/6KF9vi9Qn1RW01rVWt1iORP7TNCjtSqdhPlvOTpQGFyFBmuPB7odF5dQOBTSnmuR2zYzVj1noZNZ+ygI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 21b5160bac740deb
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EyPJ2tUUFlWKDhLAVZ/n0lfwiFJfMKBXf/PDpMn7OO7PngBy+e2Jkg61EpITU0nzyTZnFxxwx0355ZJy8JCQX+f0IZSC5QHTGuOizcylpKejlQDJeXmIJCc9NUbiU1xanvyzSSENb/gLSllAgDFNqyAUJl5S2l/iPG9Me5CujuifQ5zGgCfGbw+XiQUlj3Mg8lYXf6dXGUMAsOMnAX9cR7T8daNbP5zK4EZpgjatExnEDVIJJYmXNheOuOqjHyuhjCGhQds3zrGzPyyShR+now5Et0N3ODsQbkXvZS66q/bTSr8Kvrfzek3lkYeg8sKoI6co2PL5bsVwSaUGL910LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gt5jAdlLFKn2FKYVejnnvArgY2fNHKot2ohec1+lUUQ=;
 b=b5e6ygkph/iW8cUmPzdVfY6rxa5d5iF/nmOUyHsPF59Io7xM5RdqPcnDXqSM6XIWMWntPGRDVWl/P5ZpmqnTo4vHtCgO+syDB3ASivB7LWMLin870rZDDgmL+ZEY3uOhj3busCfDEhz6f5qRxxzKd+//nsdOF5lNpCLmCiZgeYQasJlNDNxncfzDP8vAXWyXtWziG/DmZzMk6J5Am7QkIYFcGzGE7aKUOVISsQAAb4+sNIOJFFCHbCIjzJJ/GkFTeNCplGOlLe/tTdCAD6J9EQ50NaPdZxMk2NZi7eHqUWwzCkbBmHinvYzdwbWZpY69KF8jlGFJapCRRXOHPk9S4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gt5jAdlLFKn2FKYVejnnvArgY2fNHKot2ohec1+lUUQ=;
 b=3Q7vncL0bET78Yp47Zr5FLUkdPDlCEox9gE/7j0BeAAdUVAowW5K4zRukwrpjK23rzgG+uFI69MzxtMMgEGg/XhTd7/6KF9vi9Qn1RW01rVWt1iORP7TNCjtSqdhPlvOTpQGFyFBmuPB7odF5dQOBTSnmuR2zYzVj1noZNZ+ygI=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xen/evtchn: Add design for static event channel signaling
 for domUs..
Thread-Topic: [PATCH] xen/evtchn: Add design for static event channel
 signaling for domUs..
Thread-Index: AQHYPsy9MfyfmFhecEGJuSNYyusIgKzm3KwAgAQXOAA=
Date: Mon, 11 Apr 2022 15:28:09 +0000
Message-ID: <D0911130-8E46-478D-86C1-EF8EE67B3CDA@arm.com>
References:
 <4836304496e6fbbea41348ed8cc9fcf6b0f3e893.1648049827.git.rahul.singh@arm.com>
 <alpine.DEB.2.22.394.2204081649370.3066615@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2204081649370.3066615@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 9a9783e6-500e-4dc9-d83b-08da1bcfeb48
x-ms-traffictypediagnostic:
	HE1PR0801MB1867:EE_|DB5EUR03FT046:EE_|DB8PR08MB5066:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB506661296608973766437101FCEA9@DB8PR08MB5066.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 L42a37pB8LU8HR5wxIoNo4cl/3iLJa3ylvG5hoInWkIeVXoJvPQjrZ8gwW8JPXkwlElR6kXEVoatSsYPZ4/vdVW2+/ZBk9Pb/+jIVLpPtuCUtDSxAnwBvcJhe6fxozHYQOEwvju8HsaUEBXqSwI8292AvPzdjoFsbKKYI1g4JFOenzcS+NO2RMjARJ3sJbmrGk3M1LfEsvrD2BReu3OTfizR4misS+ACQ9oRJSQL3cbXB+QdUvAoO0daAHdeXcnQtc5yu/Q1bgCBWCF+OBaG6QgEVlNSIL/5I6y+P4Qp71Rlnt16VJBgcYYlXikAeh6EfKtYfoFlg41snFrxsMrbmJny0v8vLMP86s7YPqDXfpHH8GWXeInDmCq8b8NKIkkJUgXeI/PEp+hojT+Lchkb58+G/9VV86QhfnZEYlFoA0AwZtLZzSKRxge17F5rVcF7LKdD/L3myTla9UTtxQAMUU3qOdrZdsABMVeo8q3AjKAXmkZeZk19msji+4KQp7da6Nf8Wu2JIDY1Oi9nlXR/jbGtBY+YbqXNlPmNGTqmPSXL0m8hpnB6J4OQ5N1LaeWP/3M7S5USOo4T/K7Q11nDzksxwr41VvDoqWWGrdabzML+ge0QBXJ6fgeIZcVL9AqDvXdbOf6C3OKSKDVbflX1FVhb0K7/24GXesj17iXdbmtxRTUdXb8RrTsGgAS0gjIwgT2PeU5tWySsfrRaPyrO//GKBC3rGhdSdR8ju4iOo8M=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0801MB2020.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(26005)(186003)(66946007)(66556008)(508600001)(8676002)(64756008)(6486002)(83380400001)(86362001)(66476007)(66446008)(71200400001)(76116006)(91956017)(4326008)(5660300002)(6916009)(53546011)(33656002)(38070700005)(6506007)(36756003)(316002)(38100700002)(54906003)(122000001)(8936002)(2906002)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4B3737BEFBD5BF46BA57E77B3C344B24@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1867
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	55ef9268-7c76-4601-4cfd-08da1bcfe272
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Hbq0S58CZGJSR7F3qwFJ+261Tqcq42N1azP0R+hxCmrmyrU94GHR6e+1YEFuh8XJ6OhPd6C+A5Mju06Yyx+7Qop9CuCnC5lyqm6IS1lFVfUnYcm5kScGSFMuttzbfSt7cnJl+OFo7E5tKVeBDmzNVLSOQULboMVLZWGIbZq14y1hGt/4rUb80vmda+T4+FA+oBhnBGCDEeilyPGReDbMX08Esejh5F3eu58wK7h6SSLuitUQKts1lfGScwjKzW3jeAbV6tjHCoXUgWG1gsyfKF7B5IjJ6NrcL4Tj6rkmLIQjNkbpw0AZHlUdRglGVll0023Rs0UVFe1LyXxLl5KpIsvIfF4uR9+j/0zjq7GFIsj0x/ttDa429PfwS8aT2I9LhaRVFF5wFoaLMAFNT0pn4Cb/192N7cg6VHpgKTz1iXHrj7z/e9Sw2vIYg68l8w4UhHbaH/Gi0OjTlBhgxk4PrvHCcswvnDM0ehIbseF39B9vSnaqmoD41wTES9dfSwCXFRNa8RX85h+i/0ZHoFRIwr0KNX8vwPolmiE1wu8cbhI0R2UZlkmXw0Tt0+zgltmcnuL/d5A8my08ASEmxeab4PRheEi6cq4Q27giIoAewxKcMfh2jsbJzGg5W41qc6OYpziWs8/cAZakg8k7Zc1MRi8oYhKUNocI6GW0bqjmGCVgWeu7MPQFuwFjr2nT1DQR
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(83380400001)(26005)(86362001)(336012)(82310400005)(356005)(40460700003)(54906003)(33656002)(316002)(47076005)(186003)(70586007)(8676002)(4326008)(70206006)(508600001)(6862004)(2616005)(6486002)(53546011)(6512007)(81166007)(36860700001)(6506007)(8936002)(5660300002)(2906002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 15:28:24.5946
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a9783e6-500e-4dc9-d83b-08da1bcfeb48
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5066

SGkgU3RlZmFubywNCg0KVGhhbmtzIGZvciByZXZpZXdpbmcgdGhlIGRlc2lnbi4NCg0KPiBPbiA5
IEFwciAyMDIyLCBhdCAyOjAwIGFtLCBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtl
cm5lbC5vcmc+IHdyb3RlOg0KPiANCj4gT24gV2VkLCAyMyBNYXIgMjAyMiwgUmFodWwgU2luZ2gg
d3JvdGU6DQo+PiBpbiBkb20wbGVzcyBzeXN0ZW0uIFRoaXMgcGF0Y2ggaW50cm9kdWNlIHRoZSBu
ZXcgZmVhdHVyZSB0byBzdXBwb3J0IHRoZQ0KPj4gc2lnbmFsaW5nIGJldHdlZW4gdHdvIGRvbVVz
IGluIGRvbTBsZXNzIHN5c3RlbS4NCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogUmFodWwgU2luZ2gg
PHJhaHVsLnNpbmdoQGFybS5jb20+DQo+PiAtLS0NCj4+IGRvY3MvZGVzaWducy9kb20wbGVzcy1l
dnRjaG4ubWQgfCA5NiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+IDEgZmls
ZSBjaGFuZ2VkLCA5NiBpbnNlcnRpb25zKCspDQo+PiBjcmVhdGUgbW9kZSAxMDA2NDQgZG9jcy9k
ZXNpZ25zL2RvbTBsZXNzLWV2dGNobi5tZA0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEvZG9jcy9kZXNp
Z25zL2RvbTBsZXNzLWV2dGNobi5tZCBiL2RvY3MvZGVzaWducy9kb20wbGVzcy1ldnRjaG4ubWQN
Cj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+PiBpbmRleCAwMDAwMDAwMDAwLi42YTFiN2U4YzIy
DQo+PiAtLS0gL2Rldi9udWxsDQo+PiArKysgYi9kb2NzL2Rlc2lnbnMvZG9tMGxlc3MtZXZ0Y2hu
Lm1kDQo+PiBAQCAtMCwwICsxLDk2IEBADQo+PiArIyBTaWduYWxpbmcgc3VwcG9ydCBiZXR3ZWVu
IHR3byBkb21VcyBvbiBkb20wbGVzcyBzeXN0ZW0NCj4+ICsNCj4+ICsjIyBDdXJyZW50IHN0YXRl
OuKAr0RyYWZ0IHZlcnNpb24NCj4+ICsNCj4+ICsjIyBQcm9wb3NlcihzKTogUmFodWwgU2luZ2gs
IEJlcnRyYW5kIE1hcnF1aXMNCj4+ICsNCj4+ICsjIyBQcm9ibGVtIFN0YXRlbWVudDoNCj4+ICsN
Cj4+ICtUaGUgZ29hbCBvZiB0aGlzIHdvcmsgaXMgdG8gZGVmaW5lIGEgc2ltcGxlIHNpZ25hbGlu
ZyBzeXN0ZW0gYmV0d2VlbiBYZW4gZ3Vlc3RzDQo+PiAraW4gZG9tMGxlc3Mgc3lzdGVtcy4NCj4+
ICsNCj4+ICtJbiBkb20wbGVzcyBzeXN0ZW0sIHdlIGNhbm5vdCBtYWtlIHVzZSBvZiB4ZW5idXMg
YW5kIHhlbnN0b3JlIHRoYXQgYXJlIHVzZWQgaW4NCj4+ICtub3JtYWwgc3lzdGVtcyB3aXRoIGR5
bmFtaWMgVk1zIHRvIGNvbW11bmljYXRlIGJldHdlZW4gZG9tYWlucyBieSBwcm92aWRpbmcgYQ0K
Pj4gK2J1cyBhYnN0cmFjdGlvbiBmb3IgcGFyYXZpcnR1YWxpemVkIGRyaXZlcnMuDQo+PiArDQo+
PiArT25lIHBvc3NpYmxlIHNvbHV0aW9uIHRvIGltcGxlbWVudCB0aGUgc2lnbmFsaW5nIHN5c3Rl
bSBiZXR3ZWVuIGRvbVVzIGlzIGJhc2VkDQo+PiArb24gZXZlbnQgY2hhbm5lbHMuDQo+IA0KPiBJ
IHN1Z2dlc3QgdG8gcmV3b3JkIHRoaXMgYXMgZm9sbG93czoNCj4gDQo+IC0tLQ0KPiBEb20wbGVz
cyBndWVzdHMgd291bGQgYmVuZWZpdCBmcm9tIGEgc3RhdGljYWxseS1kZWZpbmVkIG1lbW9yeSBz
aGFyaW5nDQo+IGFuZCBzaWduYWxseSBzeXN0ZW0gZm9yIGNvbW11bmljYXRpb24uIE9uZSB0aGF0
IHdvdWxkIGJlIGltbWVkaWF0ZWx5DQo+IGF2YWlsYWJsZSBhdCBib290IHdpdGhvdXQgYW55IG5l
ZWQgZm9yIGR5bmFtaWMgY29uZmlndXJhdGlvbnMuDQo+IA0KPiBJbiBlbWJlZGRlZCBhIGdyZWF0
IHZhcmlldHkgb2YgZ3Vlc3Qgb3BlcmF0aW5nIHN5c3RlbSBrZXJuZWxzIGV4aXN0LA0KPiBtYW55
IG9mIHdoaWNoIGRvbid0IGhhdmUgc3VwcG9ydCBmb3IgeGVuc3RvcmUsIGdyYW50IHRhYmxlIG9y
IG90aGVyDQo+IGNvbXBsZXggZHJpdmVycy4gU29tZSBvZiB0aGVtIGFyZSBzbWFsbCBrZXJuZWwt
c3BhY2UgYXBwbGljYXRpb25zIChvZnRlbg0KPiBjYWxsZWQgImJhcmVtZXRhbCIsIG5vdCB0byBi
ZSBjb25mdXNlZCB3aXRoIHRoZSB0ZXJtICJiYXJlbWV0YWwiIHVzZWQgaW4NCj4gZGF0YWNlbnRl
ciB3aGljaCBtZWFucyAid2l0aG91dCBoeXBlcnZpc29ycyIpIG9yIFJUT1Nlcy4gQWRkaXRpb25h
bGx5LA0KPiBmb3Igc2FmZXR5IHJlYXNvbnMsIHVzZXJzIG9mdGVuIG5lZWQgdG8gYmUgYWJsZSB0
byBjb25maWd1cmUgdGhlIGZ1bGwNCj4gc3lzdGVtIHN0YXRpY2FsbHkgc28gdGhhdCBpdCBjYW4g
YmUgdmVyaWZpZWQgc3RhdGljYWxseS4NCj4gDQo+IEV2ZW50IGNoYW5uZWxzIGFyZSB2ZXJ5IHNp
bXBsZSBhbmQgY2FuIGJlIGFkZGVkIGV2ZW4gdG8gYmFyZW1ldGFsDQo+IGFwcGxpY2F0aW9ucy4g
VGhpcyBwcm9wb3NhbCBpbnRyb2R1Y2VzIGEgd2F5IHRvIGRlZmluZSB0aGVtIHN0YXRpY2FsbHkN
Cj4gdG8gbWFrZSB0aGVtIHN1aXRhYmxlIHRvIGRvbTBsZXNzIGVtYmVkZGVkIGRlcGxveW1lbnRz
Lg0KPiAtLS0NCj4gDQoNCk9rLiBUaGlzIGlzIHJlYWxseSBhIGdvb2QgZXhwbGFuYXRpb24gSSB3
aWxsIGFkZCB0aGlzIGluIG5leHQgdmVyc2lvbi4NCj4gDQo+PiArIyMgUHJvcG9zYWw6DQo+PiAr
DQo+PiArRXZlbnQgY2hhbm5lbHMgYXJlIHRoZSBiYXNpYyBwcmltaXRpdmUgcHJvdmlkZWQgYnkg
WGVuIGZvciBldmVudCBub3RpZmljYXRpb25zLg0KPj4gK0FuIGV2ZW50IGNoYW5uZWwgaXMgYSBs
b2dpY2FsIGNvbm5lY3Rpb24gYmV0d2VlbiAyIGRvbWFpbnMgKG1vcmUgc3BlY2lmaWNhbGx5DQo+
PiArYmV0d2VlbiBkb20xLHBvcnQxIGFuZCBkb20yLHBvcnQyKS4gVGhleSBlc3NlbnRpYWxseSBz
dG9yZSBvbmUgYml0IG9mDQo+PiAraW5mb3JtYXRpb24sIHRoZSBldmVudCBvZiBpbnRlcmVzdCBp
cyBzaWduYWxsZWQgYnkgdHJhbnNpdGlvbmluZyB0aGlzIGJpdCBmcm9tDQo+PiArMCB0byAxLiBB
biBldmVudCBpcyBhbiBlcXVpdmFsZW50IG9mIGEgaGFyZHdhcmUgaW50ZXJydXB0Lg0KPj4gKw0K
Pj4gK05vdGlmaWNhdGlvbnMgYXJlIHJlY2VpdmVkIGJ5IGEgZ3Vlc3QgdmlhIGFuIGludGVycnVw
dCBmcm9tIFhlbiB0byB0aGUgZ3Vlc3QsDQo+PiAraW5kaWNhdGluZyB3aGVuIGFuIGV2ZW50IGFy
cml2ZXMgKHNldHRpbmcgdGhlIGJpdCkuIEZ1cnRoZXIgbm90aWZpY2F0aW9ucyBhcmUNCj4+ICtt
YXNrZWQgdW50aWwgdGhlIGJpdCBpcyBjbGVhcmVkIGFnYWluLiBXaGVuIGEgZG9tYWluIHdhbnRz
IHRvIHdhaXQgZm9yIGRhdGEgaXQNCj4+ICt3aWxsIGJsb2NrIHVudGlsIGFuIGV2ZW50IGFycml2
ZXMsIGFuZCB0aGVuIHNlbmQgYW4gZXZlbnQgdG8gc2lnbmFsIHRoYXQgZGF0YQ0KPj4gK2hhcyBi
ZWVuIGNvbnN1bWVkLiBFdmVudHMgYXJlIGRlbGl2ZXJlZCBhc3luY2hyb25vdXNseSB0byBndWVz
dHMgYW5kIGFyZQ0KPj4gK2VucXVldWVkIHdoZW4gdGhlIGd1ZXN0IGlzIG5vdCBydW5uaW5nLg0K
Pj4gKw0KPj4gK0V2ZW50IGNoYW5uZWwgY29tbXVuaWNhdGlvbiB3aWxsIGJlIGVzdGFibGlzaGVk
IHN0YXRpY2FsbHkgYmV0d2VlbiB0d28gZG9tVQ0KPj4gK2d1ZXN0cyBiZWZvcmUgdW5wYXVzaW5n
IHRoZSBkb21haW5zIGFmdGVyIGRvbWFpbiBjcmVhdGlvbi4gRXZlbnQgY2hhbm5lbA0KPj4gK2Nv
bm5lY3Rpb24gaW5mb3JtYXRpb24gYmV0d2VlbiBkb21VcyB3aWxsIGJlIHBhc3NlZCB0byBYRU4g
dmlhIGRldmljZSB0cmVlDQo+PiArbm9kZS4NCj4+ICsNCj4+ICtVbmRlciB0aGUgL2Nob3NlbiBu
b2RlLCB0aGVyZSBuZWVkcyB0byBiZSBzdWIgbm9kZXMgd2l0aCBjb21wYXRpYmxlDQo+PiArInhl
bixldnRjaG4iIHRoYXQgZGVzY2liZXMgdGhlIGV2ZW50IGNoYW5uZWwgY29ubmVjdGlvbiBiZXR3
ZWVuIHR3byBkb21Vcy4NCj4+ICsNCj4+ICtUaGUgZXZlbnQgY2hhbm5lbCBzdWItbm9kZSBoYXMg
dGhlIGZvbGxvd2luZyBwcm9wZXJ0aWVzOg0KPj4gKw0KPj4gKy0gY29tcGF0aWJsZQ0KPj4gKw0K
Pj4gKyAieGVuLGV2dGNobiINCj4+ICsNCj4+ICstIHhlbixldnRjaG4NCj4+ICsNCj4+ICsgVGhl
IHByb3BlcnR5IGlzIGZvdXIgbnVtYmVycyBvZiB0dXBsZXMgb2YNCj4+ICsgKGxvY2FsLXBvcnQt
ZG9tVTEsZG9tVTEtcGhhbmRsZSxsb2NhbC1wb3J0LWRvbVUyLGRvbVUyLXBoYW5kbGUpIHdoZXJl
Og0KPj4gKw0KPj4gKyBsb2NhbC1wb3J0LWRvbVUxIGlzIGFuIGludGVnZXIgdmFsdWUgdGhhdCB3
aWxsIGJlIHVzZWQgdG8gYWxsb2N0ZSBsb2NhbA0KPj4gKyBwb3J0IGZvciBkb21VMSB0byBzZW5k
IGFuIGV2ZW50IG5vdGlmaWNhdGlvbiB0byB0aGUgcmVtb3RlIGRvbWFpbi4NCj4+ICsNCj4+ICsg
ZG9tVTEtcGhhbmRsZSBpcyBhIHNpbmdsZSBwaGFuZGxlIHRvIGFuIGRvbWFpbiB0byB3aGljaCBs
b2NhbC1wb3J0LWRvbVUxDQo+PiArIHdpbGwgYmUgYWxsb2NhdGVkLg0KPj4gKw0KPj4gKyBsb2Nh
bC1wb3J0LWRvbVUyIGlzIGFuIGludGVnZXIgdmFsdWUgdGhhdCB3aWxsIGJlIHVzZWQgdG8gYWxs
b2N0ZSBsb2NhbA0KPj4gKyBwb3J0IGZvciBkb21VMiB0byBzZW5kIGFuIGV2ZW50IG5vdGlmaWNh
dGlvbiB0byB0aGUgcmVtb3RlIGRvbWFpbi4NCj4+ICsNCj4+ICsgZG9tVTItcGhhbmRsZSBpcyBh
IHNpbmdsZSBwaGFuZGxlIHRvIGFuIGRvbWFpbiB0byB3aGljaCBsb2NhbC1wb3J0LWRvbVUyDQo+
PiArIHdpbGwgYmUgYWxsb2NhdGVkLg0KPj4gKw0KPj4gK0V4YW1wbGU6DQo+PiArDQo+PiArIGNo
b3NlbiB7DQo+PiArIC4uLi4NCj4+ICsNCj4+ICsgZG9tVTE6IGRvbVUxIHsNCj4+ICsgLi4uLi4u
DQo+PiArIH07DQo+PiArDQo+PiArIGRvbVUyOiBkb21VMiB7DQo+PiArIC4uLi4uLg0KPj4gKyB9
Ow0KPj4gKw0KPj4gKyBldnRjaG5AMSB7DQo+PiArIGNvbXBhdGlibGUgPSAieGVuLGV2dGNobiI7
DQo+PiArIHhlbixldnRjaG4gPSA8MHhhICZkb21VMSAweGIgJmRvbVUyPjsNCj4+ICsgfTsNCj4+
ICsNCj4+ICsgZXZ0Y2huQDIgew0KPj4gKyBjb21wYXRpYmxlID0gInhlbixldnRjaG4iOw0KPj4g
KyB4ZW4sZXZ0Y2huID0gPDB4YyAmZG9tVTEgMHhkICZkb21VMj47DQo+PiArIH07DQo+PiArIH07
DQo+IA0KPiBUaGVyZSBpcyBubyBuZWVkIHRvIHVzZSB0d28gZXZ0Y2huIG5vZGVzIGZvciB0aGlz
IGdpdmVuIHRoYXQgaW4gZGV2aWNlDQo+IHRyZWUgaXQgaXMgZW50aXJlbHkgbm9ybWFsIHRvIGhh
dmUgbXVsdGlwbGUgdHVwbGV0cyBpbiBhIHByb3BlcnR5LiBBbHNvLA0KPiBpdCB3b3VsZCBiZSBn
b29kIHRvIGhhdmUgYSB2ZXJzaW9uIG51bWJlciBpbiB0aGUgY29tcGF0aWJsZSBzdHJpbmcgc28N
Cj4gdGhhdCB3ZSBjYW4gY2hhbmdlIHZlcnNpb24gaW4gdGhlIGZ1dHVyZS4NCj4gDQo+IDEpDQo+
IGNob3NlbiB7DQo+IC4uLi4NCj4gDQo+IGRvbVUxOiBkb21VMSB7DQo+IC4uLi4uLg0KPiB9Ow0K
PiANCj4gZG9tVTI6IGRvbVUyIHsNCj4gLi4uLi4uDQo+IH07DQo+IA0KPiBldnRjaG4gew0KPiBj
b21wYXRpYmxlID0gInhlbixldnRjaG4tdjEiOw0KPiB4ZW4sZXZ0Y2huID0gPDB4YSAmZG9tVTEg
MHhiICZkb21VMiAweGMgJmRvbVUxIDB4ZCAmZG9tVTI+Ow0KPiB9Ow0KPiB9Ow0KPiANCg0KSSBh
Z3JlZSBpZiB3ZSBjYW4gaGF2ZSBtdWx0aXBsZSB0dXBsZXMgaW4gYSBwcm9wZXJ0eS4gSSB3aWxs
IG1vZGlmeSB0aGUgZGVzaWduIGluIG5leHQgdmVyc2lvbg0KdG8gaGF2ZSBtdWx0aXBsZSB0dXBs
ZXMgaW4gYSBwcm9wZXJ0eS4gDQo+IA0KPiBJIHNob3VsZCBtZW50aW9uIHRoYXQgaXQgd291bGQg
YmUgYWxzbyBwb3NzaWJsZSB0byB1c2Ugc3ViLW5vZGVzIHRvDQo+IGV4cHJlc3MgdGhpcyBpbmZv
cm1hdGlvbjoNCj4gDQo+IDIpDQo+IGRvbVUxOiBkb21VMSB7DQo+IC4uLg0KPiAvKiBvbmUgc3Vi
LW5vZGUgcGVyIGxvY2FsIGV2ZW50IGNoYW5uZWwgKi8NCj4gZWMxOiBldnRjaG5AYSB7DQo+IGNv
bXBhdGlibGUgPSAieGVuLGV2dGNobi12MSI7DQo+IC8qIGxvY2FsLWV2dGNobiBsaW5rLXRvLWZv
cmVpZ24tZXZ0Y2huICovDQo+IHhlbixldnRjaG4gPSA8MHhhICZlYzM+DQo+IH07DQo+IGVjMjog
ZXZ0Y2huQGMgew0KPiBjb21wYXRpYmxlID0gInhlbixldnRjaG4tdjEiOw0KPiB4ZW4sZXZ0Y2hu
ID0gPDB4YyAmZWM0Pg0KPiB9Ow0KPiB9Ow0KPiANCj4gZG9tVTI6IGRvbVUyIHsNCj4gLi4uDQo+
IGVjMzogZXZ0Y2huQGIgew0KPiBjb21wYXRpYmxlID0gInhlbixldnRjaG4tdjEiOw0KPiB4ZW4s
ZXZ0Y2huID0gPDB4YiAmZWMxPg0KPiB9Ow0KPiBlYzQ6IGV2dGNobkBkIHsNCj4gY29tcGF0aWJs
ZSA9ICJ4ZW4sZXZ0Y2huLXYxIjsNCj4geGVuLGV2dGNobiA9IDwweGEgJmVjMj4NCj4gfTsNCj4g
fTsNCj4gfTsNCj4gDQo+IFRoaXMgZm9ybWF0IGhhcyB0aGUgYWR2YW50YWdlIHRoYXQgZG9lc24n
dCBuZWVkIGEgbmV3IHRvcC1sZXZlbCBub2RlDQo+IHR5cGUgdW5kZXIgL2Nob3Nlbi4gVGhhdCBp
cyBkZXNpcmFibGUgZmV3IGEgZmV3IHJlYXNvbnMuIFRvZGF5IHdlIG9ubHkNCj4gaGF2ZSBkb21h
aW5zIChkb20wIGlzIGxlZ2FjeSkuIEluIHRoZSBmdXR1cmUgd2UgbWlnaHQgaGF2ZSBuZXN0ZWQN
Cj4gZG9tYWlucyBhbmQgbm9uLVhlbiBkb21haW5zLiBXaXRoIFN5c3RlbSBEZXZpY2UgVHJlZSwg
ZG9tYWlucyBhcmUgdW5kZXINCj4gL2RvbWFpbnMgaW5zdGVhZCBvZiAvY2hvc2VuLg0KPiANCj4g
U28gbm9ybWFsbHkgSSB3b3VsZCBhcmd1ZSB0byB1c2UgdGhlIHN1Yi1ub2RlIGZvcm1hdCBiZWNh
dXNlIGl0IGRvZXNuJ3QNCj4gbmVlZCBhIG5ldyB0b3AtbGV2ZWwgbm9kZSB1bmRlciAvY2hvc2Vu
LiBIb3dldmVyLCBpbiB0aGlzIGNhc2UgaXQgbG9va3MNCj4gbGlrZSB0aGUgMSkgZm9ybWF0IGlz
IHNpbXBsZXIgdG8gd3JpdGUgYW5kIGFsc28gc2ltcGxlciB0byBwYXJzZSBpbiBYZW4uDQo+IA0K
PiBJbiAxKSwgd2Ugd291bGQgbmVlZCB0byBsb29wIG92ZXIgeGVuLGV2dGNobiBhbmQgZm9yIGVh
Y2ggdHVwbGV0IHdlDQo+IHdvdWxkIG9ubHkgbmVlZCB0byBmZXRjaCB0aGUgZm9yZWlnbiBkb21p
ZC4NCj4gDQo+IEluIDIpLCB3ZSB3b3VsZCBuZWVkIHRvIGNoZWNrIHRoZSBjb21wYXRpYmxlIHN0
cmluZyBvZiBldmVyeQ0KPiAieGVuLGV2dGNobi12MSIgbm9kZSwgYW5kIHdlIHdvdWxkIGhhdmUg
dG8gZmV0Y2ggZnJvbSB0aGUgcGhhbmRsZSBib3RoDQo+IHRoZSByZW1vdGUgZXZlbnQgY2hhbm5l
bCBudW1iZXIgYnV0IGFsc28gdGhlIGRvbWFpbi1pZCBvZiB0aGUgcGFyZW50Lg0KDQo+IA0KPiBT
byBpdCBsb29rcyBsaWtlIDEpIGlzIGJldHRlciBiZWNhdXNlIGl0IGlzIG11Y2ggc2ltcGxlciB0
byBwYXJzZS4gRG8NCj4geW91IGFncmVlPw0KDQpZZXMgSSBhZ3JlZSB3aXRoIHlvdSwgZm9yIHRo
aXMgY2FzZSB3ZSBuZWVkIHRvIHBhcnNlIGFsbCB0aGUgInhlbixldnRjaG4tdjHigJ0gY29tcGF0
aWJsZSBub2RlDQphbmQgZnJvbSB0aGF0IG5vZGUsIHdlIG5lZWQgdG8gZmluZCB0aGUgcmVtb3Rl
IGV2ZW50IGNoYW5uZWwgYW5kIGRvbS1pZCBmcm9tIHRoZSBwaGFuZGxlLg0KDQpJIHN0YXJ0ZWQg
ZnJvbSB0aGlzIGNvbmZpZ3VyYXRpb24gYW5kIGxhdGVyIHJlYWxpemUgdGhhdCBpZiB3ZSB1c2Ug
dGhpcyBjb25maWd1cmF0aW9uIGNvZGUgd2lsbCBiZWNvbWUNCm1vcmUgY29tcGxleCBhbmQgZGVm
aW5pbmcgdGhlIGV2ZW50LWNoYW5uZWwgY29ubmVjdGlvbiBpbiBEVCB3aWxsIGFsc28gbm90IGJl
IHNpbXBsZS4NCj4gDQo+PiArSW4gYWJvdmUgZXhhbXBsZSB0d28gZXZlbnQgY2hhbm5lbCBjb211
bmljYXRpb24gd2lsbCBiZSBlc3RhYmxpc2hlZCBiZXR3ZWVuDQo+PiArZG9tVTEgYW5kIGRvbVUy
Lg0KPj4gKw0KPj4gKyBkb21VMSAocG9ydCAweGEpIDwtLS0tLS0tLS0tLS0tLS0tLT4gZG9tVTIg
KHBvcnQgMHhiKQ0KPj4gKyBkb21VMSAocG9ydCAweGMpIDwtLS0tLS0tLS0tLS0tLS0tLT4gZG9t
VTIgKHBvcnQgMHhkKQ0KPj4gKw0KPj4gK2RvbVUxIGFuZCBkb21VMiBjYW4gc2VuZCB0aGUgc2ln
bmFsIHRvIHJlbW90ZSBkb21haW4gdmlhIGh5cGVyY2FsbA0KPj4gK0VWVENITk9QX3NlbmQoLikg
b24gbG9jYWwgcG9ydC4NCj4gDQo+IEkgdGhpbmsgdGhpcyBpcyBmaW5lIGluIHByaW5jaXBsZS4g
TGlrZSBKYW4gd3JvdGUsIGF0IHNvbWUgcG9pbnQgd2UnbGwNCj4gbmVlZCB0byBzcGVjaWZ5IHRo
ZSBkZXZpY2UgdHJlZSBiaW5kaW5nIHRvIGV4cG9zZSB0aGlzIGluZm9ybWF0aW9uIHRvDQo+IHRo
ZSBndWVzdC4NCg0KUmVnYXJkcywNClJhaHVsDQoNCg==

