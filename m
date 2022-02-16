Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 020064B8B8E
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 15:36:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274174.469537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKLPY-0003IS-T1; Wed, 16 Feb 2022 14:36:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274174.469537; Wed, 16 Feb 2022 14:36:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKLPY-0003GI-Pf; Wed, 16 Feb 2022 14:36:04 +0000
Received: by outflank-mailman (input) for mailman id 274174;
 Wed, 16 Feb 2022 14:36:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bXi8=S7=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nKLPW-0003GC-RF
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 14:36:03 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on0610.outbound.protection.outlook.com
 [2a01:111:f400:fe07::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c35053cc-8f35-11ec-b215-9bbe72dcb22c;
 Wed, 16 Feb 2022 15:36:02 +0100 (CET)
Received: from AM6PR10CA0046.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::23)
 by DB9PR08MB6650.eurprd08.prod.outlook.com (2603:10a6:10:26d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Wed, 16 Feb
 2022 14:35:59 +0000
Received: from AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:80:cafe::31) by AM6PR10CA0046.outlook.office365.com
 (2603:10a6:209:80::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14 via Frontend
 Transport; Wed, 16 Feb 2022 14:35:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT041.mail.protection.outlook.com (10.152.17.186) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11 via Frontend Transport; Wed, 16 Feb 2022 14:35:58 +0000
Received: ("Tessian outbound 31aeb3346a45:v113");
 Wed, 16 Feb 2022 14:35:58 +0000
Received: from 5f0a8bae4a9c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 30A2932F-D30C-4805-A898-09554111A661.1; 
 Wed, 16 Feb 2022 14:35:52 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5f0a8bae4a9c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 16 Feb 2022 14:35:52 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM9PR08MB6951.eurprd08.prod.outlook.com (2603:10a6:20b:412::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.15; Wed, 16 Feb
 2022 14:35:47 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::aca7:79c4:fa65:dac6]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::aca7:79c4:fa65:dac6%5]) with mapi id 15.20.4995.014; Wed, 16 Feb 2022
 14:35:47 +0000
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
X-Inumbo-ID: c35053cc-8f35-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HjxCSrsU0cva+FalFgQD+jjys6l5iSe0Frp/qBjff04=;
 b=67bsjXi6kAk4zfEvwRwcPf6tg+UxFAqcQl/jQ/TsxeyAh5zKULH/I68CRURFhKhtUgW/hlq52C+QAQKHWgKbbxGOinc9C9ScIxd4uEb1bXyPtrjHSfUaXh1zNoku/qx0ctcVE2UxNGaf0J3pdJi2xOJgLfX1NkCAvgmmIcjbqDo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0ff8043b23f4f351
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T0s6L5LzVEr+JRly3K4pmLcxUrebUwfMgkG91pPjdmdz4cdyqTVw8Q3pkeVArSnt47WrXkzvvbQFoXFuIJFmp+VYF8DiJjDOhNa84fcFgt1qoCThs95jEsuoFHIzJgklLSaKQZUXN9rRNuS1VvkDC8s26NM+dhW8idLpwKmOEK1z4DHal02rb+Vx+ltaDplDgzdpUiomQzGiP7qwOi1s3n35YUiHurCODwNfcs+Hz9ffm3f7nn1XViGYcYtv4Q/olvDQAOOyuNURy4mSdZZgn2mcjxxScxAQaPXB02YAnmXoCCjHdt0th514L8jyTR/cKkSidaoaZJm3X11Ppf8umQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HjxCSrsU0cva+FalFgQD+jjys6l5iSe0Frp/qBjff04=;
 b=XjNujYl5Kwk5U4N+1G4Q36P6AYIB9K9bt+4xhJP9AiynyxM7p3iuErkDaWj34fxsrwyyiDbCPXEID8sr8Lm/t8W3pLb6X9O/ECj7ffnc6b+jYDoe8MSDV4ztXIyaspRslSNYenQAGa6derX1y4MolpMcJLYbrr5div2gnkxdHTtVA2VdZKZOVVq/yeBYlMAZ4O9GJEuxuM0N9sAEbf+fpMhJU6tQu8SQcDK1653rJR942Bq+93B+1OyOH9pTEAxl1eILx1w09M6TL70J0eeW+0Fwn2BrV7t7lVLBvFegMCHOEjuq7JD2cCNaeeRH8u37Uyv7iwo/oS/os/G1g2wlTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HjxCSrsU0cva+FalFgQD+jjys6l5iSe0Frp/qBjff04=;
 b=67bsjXi6kAk4zfEvwRwcPf6tg+UxFAqcQl/jQ/TsxeyAh5zKULH/I68CRURFhKhtUgW/hlq52C+QAQKHWgKbbxGOinc9C9ScIxd4uEb1bXyPtrjHSfUaXh1zNoku/qx0ctcVE2UxNGaf0J3pdJi2xOJgLfX1NkCAvgmmIcjbqDo=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Roger Pau Monne
	<roger.pau@citrix.com>, Julien Grall <julien@xen.org>, George Dunlap
	<George.Dunlap@citrix.com>
Subject: Re: [PATCH v2] lib: extend ASSERT()
Thread-Topic: [PATCH v2] lib: extend ASSERT()
Thread-Index:
 AQHYE4sUwaOwwc8tCU249z99fRIDqqyVNw0AgADQBoCAAAHjAIAAIjuAgAACWYCAAAt3gIAAGi0AgAABjYCAAAkmAA==
Date: Wed, 16 Feb 2022 14:35:47 +0000
Message-ID: <0BF64A25-F218-404A-8547-4896FCB27E2C@arm.com>
References: <75125344-b0e1-9663-4c1a-84bb35870fef@suse.com>
 <35d82770-66cf-e030-5bcc-3c030e4463d7@xen.org>
 <3F58400B-5151-42F2-8F39-109DDF50EE1E@arm.com>
 <a89223c8-f59a-24cc-96a7-e40feb28813f@suse.com>
 <DB014136-7797-4A61-9681-33A7D85403AA@citrix.com>
 <732e8e39-36c4-1651-61f3-9b55caf29fe8@suse.com>
 <46408EAE-5EA4-4B22-B685-BA6D313B5D3A@citrix.com>
 <FEF187A8-0A09-4D50-A0E5-F46E014DB3E1@arm.com>
 <63811bb5-cce4-d542-461e-a24926f01b34@suse.com>
In-Reply-To: <63811bb5-cce4-d542-461e-a24926f01b34@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: d7e890d8-c41c-420d-9763-08d9f159a5cc
x-ms-traffictypediagnostic:
	AM9PR08MB6951:EE_|AM5EUR03FT041:EE_|DB9PR08MB6650:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB66502E27DEBE8F2F361345F49D359@DB9PR08MB6650.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /MMsKd/qsYMGufiDMJOd6bRY2CbI3TYbb3d6VhLpq7NOLVHNmV6iehED59S5CL5zysbGXZAFF/SIOBMgY51RnBfsqNSOWMYpqzKAOBUVt6GnbBDvhnYMAYrWZ1+ddNAcrNH/5a3/718Wsj/v+gkO6sgsuW9wZ68iqTY/ZviuBQEmwgyIhChVPwrGBvN9Qrb/NY8Jvv9ycgrshBJb+twpbD+H1SfHQsGdfiS8z9v0t9khVimroDp3CEkP8ZJ3q6A7EJFSLvQWmki/ZAY8JDxIMrmAFuZXykUxcYeHJ6Ec2lhgezoJ/ADpQLpVSLqPB1JbbbtLOdvPM8iKC47o1S1vlm2V3qaEk8uQDsjHIYCi19U1uTFTvZbQKLfJds7/FwJIBDPaDtf6p4U2NdvCe1ZoMuKfUSzFnsW2uWAMpqTW9ZX8806obIThqNsGuxQ1/jqYK7kAMKjcFu76OBFz13sEPtDK4flbInk4P+W0d1mmYtu3NzMkxccwfCBhM60TY68Vq5H7adRQR84wVYqEsWQODLFXLjl+CmJyIqk7fmzHKSvK+bNpk2wZ1nUdMXVALR2Xkq9qY2vOu2acwvHC7G/C19a+Oi+p7xyP4/9hH+1BjM2ZawVORN4BM4qB5ZjaFtoG3/60JrelM0OqnyRYQ1ebyrXO7q7Te/OVigAe4LlgGIwZz7OLT+vZPuO8aElSKaeATK49ccE0tPbWvGOzAnpkaSQZxOwDNiA8ku2cdahyczRoHUybLYdgjktWdz9vxtjIaJbl5OG6oepsx+44sd2oJGiL87rfLPll/xRSwP3mwWE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(6506007)(186003)(38100700002)(26005)(38070700005)(33656002)(36756003)(2906002)(5660300002)(53546011)(6916009)(64756008)(316002)(66556008)(66946007)(71200400001)(8676002)(66476007)(86362001)(2616005)(6512007)(54906003)(8936002)(4326008)(122000001)(76116006)(6486002)(508600001)(66446008)(91956017)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <440D40EF75CAAD4C9A69ADCFCC027084@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6951
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1f17844e-06e6-4447-29af-08d9f1599f54
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9Yh1tYyQAphHZVVej8QKY77T0SFlGd/dz/snLKEcvGNAh4n/qCBL8yI8CeW2oC2T6JhDJDX8pENk4yrFVUpI+FgN6VCjq/OVHAbGH8p/qvdedKTD1HRpL+H1k2F5S11MZck1n+iOThNowCFUhVTZnoBosBMgvY6RP0db+d3o7bbz0wXuiOsnPxFfgZHOB/S9w0lfBTgbakhoT/zcQCgZjnkzboFxgkqdp9TrsE86HhRv8d1cXPbAeFJ7rsFumyEM7nZN+6o1ghNKSMSva68jQdmrFwCCGlmaDxiWByFlHWZl/30RTBbIfJemzt8tNyGd/AXbOqNRNuyB6Evmy5YvhYVq2K3M4RY+zfghkzxd5BefHz/W5rOYy/gv1MbCsu1oy0k3DlmIMe8fiAe/C7vE5KAKfZxEDWJwSr9TWYX9AMtk7H5ugJQLYlWPQJQhSuh/hkkIJcoYfufEovp2X9P3FMfgtDxUchaAm4Mc8PXDy+nRrSx3aIgq+Sf3JAEbOw8SfogdmaApzLgPhRFqWCHVPIWJ1LUwipeYt4u21REgH3sAUrm9EVZefxLVemKNI0VdA9m/LMKT+mdfcbxT9b2sf9Yp6gSyWlAEMuLK8b91b5TefZO3RoH65F5Ad0orIMwwZYUqIhUbAos79BTGhxFEtNvzf2QVLd/aM57swEvWh308SFdWmuJcPmBHtL/8vDeuX+ZhNl+AZI1IrVW67YKimtq3wMtjEViDkC4LX0O4UVr1K296s3eOIkk1XYn9LIX9KuSGxEkLBKiA6ezWjfijEg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(40470700004)(46966006)(36840700001)(70206006)(8936002)(316002)(6512007)(8676002)(81166007)(36756003)(336012)(508600001)(5660300002)(6486002)(70586007)(86362001)(2616005)(40460700003)(2906002)(82310400004)(54906003)(36860700001)(53546011)(33656002)(4326008)(26005)(83380400001)(6862004)(6506007)(47076005)(356005)(186003)(107886003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 14:35:58.4730
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7e890d8-c41c-420d-9763-08d9f159a5cc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6650

SGkgSmFuLA0KDQo+IE9uIDE2IEZlYiAyMDIyLCBhdCAxNDowMywgSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IE9uIDE2LjAyLjIwMjIgMTQ6NTcsIEJlcnRyYW5k
IE1hcnF1aXMgd3JvdGU6DQo+Pj4gT24gMTYgRmViIDIwMjIsIGF0IDEyOjIzLCBHZW9yZ2UgRHVu
bGFwIDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOg0KPj4+PiBPbiBGZWIgMTYsIDIw
MjIsIGF0IDExOjQyIEFNLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdyb3RlOg0K
Pj4+PiBPbiAxNi4wMi4yMDIyIDEyOjM0LCBHZW9yZ2UgRHVubGFwIHdyb3RlOg0KPj4+Pj4gSSBh
bSBvcHBvc2VkIHRvIG92ZXJsb2FkaW5nIOKAnEFTU0VSVOKAnSBmb3IgdGhpcyBuZXcga2luZCBv
ZiBtYWNybzsgSSB0aGluayBpdCB3b3VsZCBub3Qgb25seSBiZSB1bm5lY2Vzc2FyaWx5IGNvbmZ1
c2luZyB0byBwZW9wbGUgbm90IGZhbWlsaWFyIHdpdGggb3VyIGNvZGViYXNlLCBidXQgaXQgd291
bGQgYmUgdG9vIGVhc3kgZm9yIHBlb3BsZSB0byBmYWlsIHRvIG5vdGljZSB3aGljaCBtYWNybyB3
YXMgYmVpbmcgdXNlZC4NCj4+Pj4+IA0KPj4+Pj4gQVNTRVJUX0FDVElPTihjb25kaXRpb24sIGNv
ZGUpIChvciBldmVuIEFTU0VSVF9PUl9BQ1RJT04oKSkgd291bGQgYmUgYSBiYXJlIG1pbmltdW0g
Zm9yIG1lLg0KPj4+Pj4gDQo+Pj4+PiBCdXQgSSBjYW7igJl0IGltYWdpbmUgdGhhdCB0aGVyZSBh
cmUgbW9yZSB0aGFuIGEgaGFuZGZ1bCBvZiBhY3Rpb25zIHdlIG1pZ2h0IHdhbnQgdG8gdGFrZSwg
c28gZGVmaW5pbmcgYSBtYWNybyBmb3IgZWFjaCBvbmUgc2hvdWxkbuKAmXQgYmUgdG9vIGJ1cmRl
bnNvbWUuDQo+Pj4+PiANCj4+Pj4+IEZ1cnRoZXJtb3JlLCB0aGUgdmVyeSBmbGV4aWJpbGl0eSBz
ZWVtcyBkYW5nZXJvdXM7IHlvdeKAmXJlIG5vdCBzZWVpbmcgd2hhdCBhY3R1YWwgY29kZSBpcyBn
ZW5lcmF0ZWQsIHNvIGl04oCZcyB0byBlYXN5IHRvIGJlIOKAnGNsZXZlcuKAnSwgYW5kL29yIHdy
aXRlIGNvZGUgdGhhdCBlbmRzIHVwIGRvaW5nIHNvbWV0aGluZyBkaWZmZXJlbnQgdGhhbiB5b3Ug
ZXhwZWN0Lg0KPj4+Pj4gDQo+Pj4+PiBBdCB0aGUgbW9tZW50IEkgdGhpbmsgQVNTRVJUX09SX1JF
VFVSTihjb25kaXRpb24sIGNvZGUpLCBwbHVzIG90aGVyIG5ldyBtYWNyb3MgZm9yIHRoZSBvdGhl
ciBiZWhhdmlvciBpcyBuZWVkZWQsIHdvdWxkIGJlIGJldHRlci4NCj4+Pj4gDQo+Pj4+IEhtbSwg
d2hpbGUgSSBzZWUgeW91ciBwb2ludCBvZiB0aGluZ3MgcG9zc2libHkgbG9va2luZyBjb25mdXNp
bmcgb3INCj4+Pj4gdW5leHBlY3RlZCwgc29tZXRoaW5nIGxpa2UgQVNTRVJUX09SX1JFVFVSTigp
IChzaG91bGRuJ3QgaXQgYmUNCj4+Pj4gQVNTRVJUX0FORF9SRVRVUk4oKT8pIGlzIGltbyBsZXNz
IHJlYWRhYmxlLiBJbiBwYXJ0aWN1bGFyIEkgZGlzbGlrZQ0KPj4+PiB0aGUgbGFyZ2VyIGFtb3Vu
dCBvZiB1cHBlcmNhc2UgdGV4dC4gQnV0IHllcywgSSBjb3VsZCBhY2NlcHQgdGhpcw0KPj4+PiBh
cyBhIGNvbXByb21pc2UgYXMgaXQgc3RpbGwgc2VlbXMgYmV0dGVyIHRvIG1lIHRoYW4gdGhlIG11
bHRpLWxpbmUNCj4+Pj4gY29uc3RydWN0cyB3ZSBjdXJyZW50bHkgdXNlLg0KPj4+IA0KPj4+IEkg
c2VlIHdoYXQgeW914oCZcmUgc2F5aW5nIHdpdGggQU5EL09SOyBJIHBlcnNvbmFsbHkgc3RpbGwg
cHJlZmVyIE9SIGJ1dCB3b3VsZG7igJl0IGFyZ3VlIHRvIGhhcmQgYWdhaW5zdCBBTkQgaWYgb3Ro
ZXJzIHByZWZlcnJlZCBpdC4NCj4+PiANCj4+PiBBcyBmYXIgYXMgSeKAmW0gY29uY2VybmVkLCB0
aGUgZmFjdCB0aGF0IHdl4oCZcmUgcmVkdWNpbmcgbGluZXMgb2YgY29kZSBpc27igJl0IGEgcmVh
c29uIHRvIHVzZSB0aGlzIGF0IGFsbC4gIEFzIG91ciBDT0RJTkdfU1RZTEUgc2F5cywgQVNTRVJU
KCkgaXMganVzdCBhIGxvdWRlciBwcmludGsuICBXZSB3b3VsZCBuZXZlciBjb25zaWRlciB3cml0
aW5nIFBSSU5US19BTkRfUkVUVVJOKCksIGFuZCB3ZSB3b3VsZCBuZXZlciBjb25zaWRlciB3cml0
aW5nIGEgbWFjcm8gbGlrZSBDT05EUkVUKGNvbmRpdGlvbiwgcmV0dmFsKSB0byByZXBsYWNlDQo+
Pj4gDQo+Pj4gaWYgKGNvbmRpdGlvbikNCj4+PiAgIHJldHVybiByZXR2YWw7DQo+Pj4gDQo+Pj4g
VGhlIG9ubHkganVzdGlmaWNhdGlvbiBmb3IgdGhpcyBraW5kIG9mIG1hY3JvLCBpbiBteSBvcGlu
aW9uLCBpcyB0byBhdm9pZCBkdXBsaWNhdGlvbiBlcnJvcnM7IGkuZS4gcmVwbGFjaW5nIHlvdXIg
Y29kZSBzZWdtZW50IHdpdGggdGhlIGZvbGxvd2luZzoNCj4+PiANCj4+PiBpZiAoY29uZGl0aW9u
KSB7DQo+Pj4gICBBU1NFUlQoIWNvbmRpdGlvbik7DQo+Pj4gICByZXR1cm4gZm9vOw0KPj4+IH0N
Cj4+PiANCj4+PiBpcyB1bmRlc2lyYWJsZSBiZWNhdXNlIHRoZXJl4oCZcyB0b28gbXVjaCByaXNr
IHRoYXQgdGhlIGNvbmRpdGlvbnMgd2lsbCBkcmlmdCBvciBiZSBpbnZlcnRlZCBpbmNvcnJlY3Rs
eS4gQnV0IGhhdmluZyBjb250cm9sIHN0YXRlbWVudHMgbGlrZSDigJhyZXR1cm7igJkgYW5kIOKA
mGNvbnRpbnVl4oCZIGluIGEgbWFjcm8gaXMgYWxzbyB1bmRlc2lyYWJsZSBpbiBteSBvcGluaW9u
OyBJ4oCZbSBwZXJzb25hbGx5IG5vdCBzdXJlIHdoaWNoIEkgZmluZCBtb3N0IHVuZGVzaXJhYmxl
Lg0KPj4+IA0KPj4+IEkgZ3Vlc3Mgb25lIGFkdmFudGFnZSBvZiBzb21ldGhpbmcgbGlrZSBBU1NF
UlRfT1IoY29uZGl0aW9uLCByZXR1cm4gZm9vKTsgb3IgQVNTRVJUX09SKGNvbmRpdGlvbiwgY29u
dGludWUpOyBpcyB0aGF0IHNlYXJjaGluZyBmb3Ig4oCccmV0dXJu4oCdIG9yIOKAnGNvbnRpbnVl
4oCdIHdpbGwgY29tZSB1cCBldmVuIGlmIHlvdeKAmXJlIGRvaW5nIGEgY2FzZS1zZW5zaXRpdmUg
c2VhcmNoLiAgQnV0IEnigJltIHN0aWxsIHdhcnkgb2YgdW5pbnRlbmRlZCBzaWRlIGVmZmVjdHMu
DQo+Pj4gDQo+Pj4gQmVydHJhbmQgLyBKdWxpZW4sIGFueSBtb3JlIHRob3VnaHRzPw0KPj4gDQo+
PiBJIHRoaW5rIHRoYXQgaGF2aW5nIG1hY3JvcyB3aGljaCBhcmUgbWFnaWMgbGlrZSB0aGF0IG9u
ZSB3aGljaCBpbmNsdWRlcyBhIHBvc3NpYmxlIHJldHVybiBhbmQgdGhlIGZhY3QgdGhhdCB0aGUg
bWFjcm8gaXMgdGFraW5nIGNvZGUgYXMgYXJndW1lbnQgaXMgbWFraW5nIHRoZSBjb2RlIHJlYWxs
eSBoYXJkIHRvIHJlYWQgYW5kIHVuZGVyc3RhbmQgZm9yIHNvbWVvbmUgbm90IGtub3dpbmcgdGhp
cy4NCj4+IEV2ZW4gdGhlIGNvZGUgaXMgbG9uZ2VyIHJpZ2h0IG5vdywgaXQgaXMgbW9yZSByZWFk
YWJsZSBhbmQgZWFzeSB0byB1bmRlcnN0YW5kIHdoaWNoIG1lYW5zIGxlc3MgY2hhbmNlIGZvciBl
cnJvcnMgc28gSSBkbyBub3QgdGhpbmsgdGhlIG1hY3JvIHdpbGwgYXZvaWQgZXJyb3JzIGJ1dCBt
aWdodCBpbiBmYWN0IGludHJvZHVjZSBzb21lIGluIHRoZSBmdXR1cmUuDQo+PiANCj4+IFNvIEkg
YW0gdm90aW5nIHRvIGtlZXAgdGhlIGN1cnJlbnQgbWFjcm8gYXMgaXQgaXMuDQo+IA0KPiBCdXQg
eW91IHJlY2FsbCB0aGF0IHRoZXJlIHdlcmUgdHdvIGFzcGVjdHMgdG8gbWUgd2FudGluZyB0aGUg
c3dpdGNoPw0KPiAoU291cmNlKSBjb2RlIHNpemUgd2FzIG9ubHkgb25lLiBUaGUgb3RoZXIgd2Fz
IHRoYXQgQVNTRVJUX1VOUkVBQ0hBQkxFKCkNCj4gZG9lc24ndCBzaG93IHRoZSBvcmlnaW5hbCBl
eHByZXNzaW9uIHdoaWNoIGhhcyB0cmlnZ2VyZWQgdGhlIGZhaWx1cmUsDQo+IHVubGlrZSBBU1NF
UlQoKSBkb2VzLg0KDQpTb3JyeSBJIGZvY3VzZWQgb24gdGhlIG1hY3JvIHBhcnQgYWZ0ZXIgSnVs
aWVuIGFza2VkIG1lIHRvIGNvbW1lbnQgZnJvbSB0aGUgRnVzYSBwb2ludCBvZiB2aWV3Lg0KDQpU
aGUgdXN1YWwgZXhwZWN0YXRpb24gaXMgdGhhdCBhbiBBU1NFUlQgc2hvdWxkIG5ldmVyIG9jY3Vy
IGFuZCBpcyBhbiBoZWxwIGZvciB0aGUgcHJvZ3JhbW1lciB0byBkZXRlY3QgcHJvZ3JhbW1pbmcg
ZXJyb3JzLiBVc3VhbGx5IGFuIGFzc2VydCBpcyBjcmFzaGluZyB0aGUgYXBwbGljYXRpb24gd2l0
aCBhbiBpbmZvcm1hdGlvbiBvZiB3aGVyZSBhbiBhc3NlcnQgd2FzIHRyaWdnZXJlZC4NCkluIHRo
ZSBjdXJyZW50IGNhc2UsIHRoZSBhc3NlcnQgaXMgdXNlZCBhcyBkZWJ1ZyBwcmludCBhbmQgaW4g
cHJvZHVjdGlvbiBtb2RlIGFuIGVycm9yIGlzIHJldHVybmVkIGlmIHRoaXMgaXMgaGFwcGVuaW5n
IHdpdGhvdXQgYW55IHByaW50LiBJc27igJl0IHRoaXMgYSBkZWJ1ZyBwcmludCBjYXNlIGluc3Rl
YWQgb2YgYW4gYXNzZXJ0ID8NCg0KQmVydHJhbmQNCg0KPiANCj4gSmFuDQo+IA0KDQo=

