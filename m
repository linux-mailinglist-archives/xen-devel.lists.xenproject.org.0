Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F32E7AD17F
	for <lists+xen-devel@lfdr.de>; Mon, 25 Sep 2023 09:22:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.607652.945925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkfuV-0005Zp-VY; Mon, 25 Sep 2023 07:21:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607652.945925; Mon, 25 Sep 2023 07:21:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkfuV-0005Xd-SF; Mon, 25 Sep 2023 07:21:39 +0000
Received: by outflank-mailman (input) for mailman id 607652;
 Mon, 25 Sep 2023 07:21:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LToL=FJ=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qkfuU-0005XX-5f
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 07:21:38 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20624.outbound.protection.outlook.com
 [2a01:111:f400:7d00::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29c96ad2-5b74-11ee-878a-cb3800f73035;
 Mon, 25 Sep 2023 09:21:37 +0200 (CEST)
Received: from AS9PR04CA0172.eurprd04.prod.outlook.com (2603:10a6:20b:530::18)
 by AS4PR08MB8093.eurprd08.prod.outlook.com (2603:10a6:20b:588::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 07:21:34 +0000
Received: from AM7EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:530:cafe::af) by AS9PR04CA0172.outlook.office365.com
 (2603:10a6:20b:530::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.35 via Frontend
 Transport; Mon, 25 Sep 2023 07:21:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT026.mail.protection.outlook.com (100.127.140.154) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.20 via Frontend Transport; Mon, 25 Sep 2023 07:21:34 +0000
Received: ("Tessian outbound c99fbc01d472:v175");
 Mon, 25 Sep 2023 07:21:34 +0000
Received: from 5e301ea606dc.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4FB22430-2620-4C56-8D57-A231DFF06767.1; 
 Mon, 25 Sep 2023 07:21:27 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5e301ea606dc.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 25 Sep 2023 07:21:27 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS4PR08MB8220.eurprd08.prod.outlook.com (2603:10a6:20b:51f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 07:21:25 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%6]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 07:21:25 +0000
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
X-Inumbo-ID: 29c96ad2-5b74-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Ls2NwEeUB+Rop6IL5Pgc0Zxn5JPEwYF14Rv6XpxRcA=;
 b=gPVMhZgWyDkuBWEECCwt8dPT+Z3jE4zOAuCDwdoB8isYiYE1GFVLVVDnjLvt0WBWB01pNBhhsjEJPNMg7detCIAdEEBSkJVF0XzY1ZgSktYIdU3wAPoOt123RXpCZDXA7cAhjZVOIjrKXHLQeDYBtyCnIMQGe7616080O28qsG8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a58667fbd95c696a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JizK7gQPDkkjrmHr78hMryJJzTXzZy3gWCMs/nFgLbRNgsrF8Acp6ZQQ58fSYVV72MChqs9QiWw7fctxU/Cym1oZxyhKMKk24UhC33bUb2F4+j7yineO12HkOMGJUgDLYiEnxsTvZqHD+PfdbP4LYwnhFRQnIBSKYnKUguonNDkEvUm/HnvIAOvLuM7Hn/MtmjQk+ggarofk8xjmSD8UG3xUqsYoMgwQVR7TKipx8LEpk64Y4dyS6UPolwRJayKYh3fhKjYEe27d3pMSD7hx9ZOs8JvQ6f+4iPLdugA/CnQIfKeaBqPTVEmZIEdg/P2aCUMIkiDMsrtI7b750OTaJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Ls2NwEeUB+Rop6IL5Pgc0Zxn5JPEwYF14Rv6XpxRcA=;
 b=gRJ64YSOe6cYxSaCWrEz0loht6/JQM2Vo3kINYgShhZTESAEnr5vyYdDC5GWoMFe8Ud3d8IIbbJxof/8l++dskqq7npmp/FxsF9jRpoZsyz+gHdsEu4aEGt1XmVyJQGUzw6bkvZUtaplKOW8xgUpnkIYoHSlVlJHgCxqW5FTbLf0CLmA4eWRRW/HMlm5oxbjL5FDfsM+7VIkNeus1bF6pSMrK/qfKvSOMZnyVtVBsT9U6Dl3Zr2R4v6hYqhd+0rZYUeL7V+mPlhdSeEwL7vngWRpQXEqdY96xARpVmm1yvFSZiLYPG+5tWy1VeZCHZ58BlLM8vUV7Z0pc0E8C1ekSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Ls2NwEeUB+Rop6IL5Pgc0Zxn5JPEwYF14Rv6XpxRcA=;
 b=gPVMhZgWyDkuBWEECCwt8dPT+Z3jE4zOAuCDwdoB8isYiYE1GFVLVVDnjLvt0WBWB01pNBhhsjEJPNMg7detCIAdEEBSkJVF0XzY1ZgSktYIdU3wAPoOt123RXpCZDXA7cAhjZVOIjrKXHLQeDYBtyCnIMQGe7616080O28qsG8=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "jgross@suse.com" <jgross@suse.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, "community.manager@xenproject.org"
	<community.manager@xenproject.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "committers@xenproject.org"
	<committers@xenproject.org>
Subject: Re: Xen 4.18 release: Reminder about code freeze
Thread-Topic: Xen 4.18 release: Reminder about code freeze
Thread-Index: AQHZ705Dwyrpd4I60kahQfZlaJ2JtLArFXGAgAACIQCAAAmkAIAAAeYA
Date: Mon, 25 Sep 2023 07:21:23 +0000
Message-ID: <BDC96279-1FB6-4C7D-BC7B-58173EFD87C1@arm.com>
References:
 <AS8PR08MB7991D1099E32CC9F03B0E0F692FCA@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <6399a816-ac1a-b741-ed52-b5d03b498ee6@suse.com>
 <2AB20BED-9ED9-4713-A39A-59891E09E02C@arm.com>
 <aebd0b15-4e1d-3ca0-ede9-524aff777576@suse.com>
In-Reply-To: <aebd0b15-4e1d-3ca0-ede9-524aff777576@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS4PR08MB8220:EE_|AM7EUR03FT026:EE_|AS4PR08MB8093:EE_
X-MS-Office365-Filtering-Correlation-Id: c90aa9c8-75a0-443a-ae70-08dbbd980c60
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 333vtC2SVGZDQDMlJ+CFgftrxUjOqc8/xFyCQBDWbuXB+jE973O50yKaSWn4yS94o4wkrVkz/wZa/Ay3KARMbc6pX5LTg4fh2QqAapkNueMxuga/AjyY6VX6RQBp/HttTw9yzt8rAROxa32V8V7tugxDnzGK6/WkcPRwfccDYCIAHwiypsos03rq8XkLc232KD0PjEisCv0fePhcz8WRT0BitiJ4Z2mH2+dvd+2WWW7B4h97zxC2f7CSADNZyYUCORcsDYTEE41AP3K81f2V9yFi3ov8nhBnbAMVgeAtPZ30sYKoQSLBoLzdEoCa4lvmXn+r73VH/wgnSke9Y0sTHoxr8QoOrSogjTEkO6eQMdHtMhbHWERXDvlJ8uR2l30IutrvcApcIKleqfrSV80rn9MSTyRyWpfnrpAR0kA5Kqu6BHL/DEdIUc2o/UpddcK8FoYiyngz8FobEikuruwFWJ8oY0pcYKmSxH3ctTafSqUC0kzQUqjUA/JRdOO+CL9sLEAbasYW72XQH3dnICDNxuM0N8Ve6lKv+OH0vy5DMVLIFNK3W/QqK6eTYysZKQmU6jYQUqIEKSUtjPOuLLU/Ccp+qXLW1W5dKU2R/ERgVOYkf/2bT8jJlm6LjcLIIe8xtZCc8ylKdbwetdw+XJMeCw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(366004)(396003)(39860400002)(230922051799003)(451199024)(186009)(1800799009)(54906003)(316002)(41300700001)(66556008)(66476007)(66446008)(66946007)(76116006)(64756008)(6916009)(91956017)(7416002)(6512007)(8936002)(8676002)(2906002)(4326008)(478600001)(26005)(71200400001)(5660300002)(6486002)(38100700002)(38070700005)(33656002)(6506007)(53546011)(83380400001)(36756003)(66899024)(2616005)(86362001)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <ABF7D4C2D4250D47A7CD3A457F06B020@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8220
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	02b30b4d-705d-466c-6d37-08dbbd9805c0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	H1hdF8UPJCufipZfFglcyj1FJZAolCD9IcOJh8r7azfjCulzyZRkZt08kV0K78en9xHx/CQm7q8i8mwbPNKnosSqxC70adep+ZWGXKuQgEFfCoyvVWPwwAYNtB/atxmBPnEbjHSl9LUXWG4hYjUcNh+gV+EJUcR9hD+z9dn9tyTzyh0KtDoY5TkjRtKZLHmVeJwHYEJf0gbw8RMbgMBjUflEBCXwsGZPNN3pthUMX9NVRpg0JIl9lNcTa/KRChIYZxcsA116wXC+Xk6+TyaGv7oqEDWxtTvFTjEuFOwfLcH2eSClP48SHHhGe3GGmKZAoKVvRvoLZTT+tglNTumkPlhiCV3zTZyREoj+IqIw8YJP4A9pxdFFjwxn2cZTqXaobNDH7n7EjIAuhrA171ix5IrhHTZ36ErAK/jC1tGzw1MZdrDiIOusNrm50s/dWN8fAk6eE2bYA3jnNt2XQDBcC6p6eQofj5SSj5eYNqLDEF21uWN0+l1mG0qfKO3SzWlA0ReJSVXf0i8UzZG4Hrhih0jPucl4VsyIjZjEnw6iw5dQkE+4+Pj6YJrnMcP2pzgAORmXl0ZneVa3GS9B/Y2a49y0kuR5Gtewlk7x2YX6oXBPJy3jkaWekPaSCrXeRiq4g3Z22IT66Rf0hyz2JQLQY5OMYDC7OLSD1Ti+7OPaW9QFhu/gNUMyYc2aiO+R9qnlx06CCMVyWzjm4bbq1DBjt1QfXc5xC15If9eWMcnJTX4YB6QnqYRT9PLux6yypOsa
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(376002)(396003)(346002)(230922051799003)(451199024)(1800799009)(82310400011)(186009)(40470700004)(36840700001)(46966006)(54906003)(40480700001)(5660300002)(70586007)(70206006)(41300700001)(8936002)(316002)(8676002)(4326008)(6862004)(2906002)(40460700003)(81166007)(47076005)(82740400003)(356005)(83380400001)(478600001)(86362001)(26005)(336012)(2616005)(53546011)(33656002)(66899024)(36860700001)(6506007)(6512007)(6486002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 07:21:34.2617
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c90aa9c8-75a0-443a-ae70-08dbbd980c60
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8093

SGkgSmFuLA0KDQo+IE9uIFNlcCAyNSwgMjAyMywgYXQgMTU6MTQsIEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAyNS4wOS4yMDIzIDA4OjQwLCBIZW5yeSBX
YW5nIHdyb3RlOg0KPj4gSGkgSmFuLA0KPj4gDQo+Pj4gT24gU2VwIDI1LCAyMDIzLCBhdCAxNDoz
MiwgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+PiANCj4+PiBPbiAy
NS4wOS4yMDIzIDAzOjI1LCBIZW5yeSBXYW5nIHdyb3RlOg0KPj4+PiBIaSBldmVyeW9uZSwNCj4+
Pj4gDQo+Pj4+IFRoaXMgaXMgdGhlIHJlbWluZGVyIHRoYXQgd2UgYXJlIGN1cnJlbnRseSBpbiBj
b2RlIGZyZWV6ZS4gVGhlIGhhcmQgY29kZQ0KPj4+PiBmcmVlemUgZGF0ZSB3aWxsIGJlIGluIHR3
byB3ZWVrcywgaS5lLiBGcmkgT2N0IDYsIDIwMjMuDQo+Pj4gDQo+Pj4gQ291bGQgeW91IGZ1cnRo
ZXIgcmVtaW5kIHVzIGFib3V0IHdoYXQgaXMgKG5vdCkgcGVybWl0dGVkIHRvIGdvIGluIGR1cmlu
Zw0KPj4+IHRoaXMgdGltZT8NCj4+IA0KPj4gU29ycnksIG15IGJhZC4gRnJvbSBjb2RlIGZyZWV6
ZSwgdGVjaG5pY2FsbHkgb25seSBidWdmaXhlcyBhbmQgcmVsZWFzZQ0KPj4gQmxvY2tlcnMgY2Fu
IGdvIGluLg0KPj4gDQo+Pj4gSSBhbHNvIHVuZGVyc3RhbmQgYWxsIGNvbW1pdHMgbmVlZCBhIHJl
bGVhc2UgYWNrIGZyb20gbm93IG9uPw0KPj4gDQo+PiBJIHRoaW5rIHNvLg0KPj4gDQo+Pj4gKEkn
bSBzb3JyeSwgd2UncmUgZG9pbmcgcmVsZWFzZXMgb25seSBldmVyeSBvbmNlIGluIGEgd2hpbGUs
IHNvIGl0IGlzDQo+Pj4gYWx3YXlzIGdvb2QgZm9yIHRoaW5ncyB0byBiZSByZS1zcGVsbGVkIG91
dCwgaS5lLiBldmVuIGlmIHRoZXkgaGF2ZW4ndA0KPj4+IGNoYW5nZWQgZnJvbSBlYXJsaWVyIHJl
bGVhc2VzLikNCj4+IA0KPj4gQWN0dWFsbHksIHRoYW5rcyBmb3IgYXNraW5nISBGb3IgTUlTUkEg
d29yay4uLg0KPj4gDQo+PiANCj4+PiBUaGlzLCBmb3IgZXhhbXBsZSwgd291bGQgdGhlbiBsaWtl
bHkgbWVhbg0KPj4+IHRoYXQgYWxsIE1pc3JhIHdvcmsgbm93IG5lZWRzIHF1ZXVpbmcgZm9yIGFm
dGVyIHRoZSB0cmVlIHJlLW9wZW5zIC4uLg0KPj4gDQo+PiDigKZJIGFsc28gdGhvdWdodCBhYm91
dCB0aGlzLCB0byBiZSBob25lc3QgSSBhbSB0ZW1wdGVkIHRvIGxvb3NlIHRoZSBjb250cm9sDQo+
PiBvciBhdCBsZWFzdCBvZmZlciBzb21lIGZsZXhpYmlsaXR5IG9uIHRoaXMgc3BlY2lmaWMgcGFy
dCwgYXMgbm9ybWFsbHkgTUlTUkENCj4+IHJlbGF0ZWQgY2hhbmdlcyBhcmUgaGFybWxlc3MgYW5k
IGFjdHVhbGx5IGhhcmRlbiB0aGUgY29kZS4gSSBhbSB3b25kZXJpbmcNCj4+IGlmIHRoZXJlIGFy
ZSBhbnkgb2JqZWN0aW9ucyBmcm9tIG90aGVyc+KApg0KPiANCj4gT24gYSBjYXNlIGJ5IGNhc2Ug
YmFzaXMsIHN0aWxsIGFsbG93aW5nIHNvbWUgaW4gbWlnaHQgYmUgb2theS4gWW91IHdpbGwgd2Fu
dA0KPiB0byByZWxlYXNlLWFjayB0aGVtLCB0aG91Z2guIFJpZ2h0IG5vdyBJIGhhdmUgdGhyZWUg
cGVuZGluZyBmb3IgY29tbWl0IHdoaWNoDQo+IG1pZ2h0IHF1YWxpZnk6DQo+IHhlbi9udW1hOiBh
ZGRyZXNzIGEgdmlvbGF0aW9uIG9mIE1JU1JBIEM6MjAxMiBSdWxlIDguMw0KPiB4ZW4vaHlwZXJj
YWxsczogYWRkcmVzcyB2aW9sYXRpb25zIG9mIE1JU1JBIEM6MjAxMiBSdWxlIDguMw0KPiB4ZW4v
ZW11bC1pODI1NDogcmVtb3ZlIGZvcndhcmQgZGVjbGFyYXRpb25zIGFuZCByZS1vcmRlciBmdW5j
dGlvbnMNCg0KVGhhbmtzIGZvciB0aGUgbGlzdCwgeW91ciBwcm9wb3NhbCBzb3VuZHMgZ29vZCB0
byBtZSBhbmQgYWxsIHJlbGVhc2UtYWNrZWQuDQoNCj4gDQo+IEknbGwgYWxzbyBjb21taXQgIk1B
SU5UQUlORVJTOiBSZW1vdmUgbXlzZWxmIGFzIFJJU0MtViBtYWludGFpbmVyIiwgd2l0aG91dA0K
PiB0aGlua2luZyB0aGF0IGl0IHdvdWxkIG5lZWQgYSByZWxlYXNlIGFjay4NCg0KU3VyZSwgb2Yg
Y291cnNlLg0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQo+IA0KPiBKYW4NCg0K

