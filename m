Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 685A84FC1C2
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 18:02:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303169.517230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndwUY-0007sU-4Z; Mon, 11 Apr 2022 16:02:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303169.517230; Mon, 11 Apr 2022 16:02:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndwUY-0007py-1U; Mon, 11 Apr 2022 16:02:14 +0000
Received: by outflank-mailman (input) for mailman id 303169;
 Mon, 11 Apr 2022 16:02:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=as7e=UV=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1ndwUX-0007ps-5K
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 16:02:13 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062a.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf59bb36-b9b0-11ec-a405-831a346695d4;
 Mon, 11 Apr 2022 18:02:11 +0200 (CEST)
Received: from DU2PR04CA0266.eurprd04.prod.outlook.com (2603:10a6:10:28e::31)
 by AM6PR08MB4935.eurprd08.prod.outlook.com (2603:10a6:20b:d5::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 16:02:01 +0000
Received: from DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28e:cafe::a1) by DU2PR04CA0266.outlook.office365.com
 (2603:10a6:10:28e::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29 via Frontend
 Transport; Mon, 11 Apr 2022 16:02:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT012.mail.protection.outlook.com (10.152.20.161) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.21 via Frontend Transport; Mon, 11 Apr 2022 16:02:00 +0000
Received: ("Tessian outbound ac9bb5dd84f6:v118");
 Mon, 11 Apr 2022 16:02:00 +0000
Received: from ae95cf4c58a1.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 11395AC2-EF66-47CF-BF3E-AB8C5816725B.1; 
 Mon, 11 Apr 2022 16:01:49 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ae95cf4c58a1.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 11 Apr 2022 16:01:49 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 (2603:10a6:203:4c::14) by AM0PR08MB3347.eurprd08.prod.outlook.com
 (2603:10a6:208:5f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 16:01:46 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::7cce:cf19:817f:57a0]) by AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::7cce:cf19:817f:57a0%11]) with mapi id 15.20.5144.029; Mon, 11 Apr
 2022 16:01:46 +0000
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
X-Inumbo-ID: bf59bb36-b9b0-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OIO6EzaPgN5Wx9Dx6ReWJ5NqmFLU9C89nzEVqcF4ays=;
 b=CJH+VzjAtwm79j4YCnsOS0ZccNW10swJQk9IezpHAM1tEdm6o6tE/Ov7RHC6PFXJL4B0QAGD3ac82u91MOjqVwkZ6vD1DbxwqIWIOP6uXHSM7MraUxx/uWek48TrHWLItuDBi3nxZSOLl+UBEiZrzyOlkxBWhwkb7Xl7cbwypQI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: ca765066d095575e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJOUw7aTcZUPekfdhW9OgrnId1XDmjPJmAAcHhr3LxcP2ZvixPc0MqXCQVpyA5i8Qu1b4q5UFHYsJ80F9SL04emWDT6PSP1YF0NUPyEwhjzrryDH85Ik/UnoeRdHJagry8fZ/bq2XoKNRJBpbpx2IjAGTeUFt8q5RVqeJ7Kiq0anc/V+4PS1U50PPmKpN4DXaf1ibH6Dkec01w2EwwgIrfMVI1sptFTmcbjD7NFuvwiXGuDqvvVvwuSkFQY71rZ28Cvdn21VSAbJ/IEDIzRAYsG53HHGEpF/k9vj7ctmv7Ru727ejAsjFZYhjRMa99VY7k1tpKEYmx1nE/D/oMVkZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OIO6EzaPgN5Wx9Dx6ReWJ5NqmFLU9C89nzEVqcF4ays=;
 b=izP5UexVHDY1n7Y0Jhv1Gteb8n+AKlHTt3O+ghHoKnDTr4UhQSZf3pGaBgqMBIJCZ5+8ohc6Gf1RyzqwnVh3BLwpg7w/JjQiakTvZhcmggOCmkLcnKRAmb+/RZxLqfGLnC6U2LRL2Syhc4MBj4s7tt+ksA4/hXmgHcznv/vMnF26AdQAQx14DYc8G5qjVFV5FOsy7bsPmC0oG0jZS+iKgiSVATRKKu1eP4z5EPJv5OP/mgUl4cY3C5GLx9GxlEFcclBHLU4Kh88RTMlh89XHBvr5CNXkQfhroWG7uerqWVmLtfTx+mjPp/hIh06aTSb6kf7BfEwRpxO/6PxczTdcHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OIO6EzaPgN5Wx9Dx6ReWJ5NqmFLU9C89nzEVqcF4ays=;
 b=CJH+VzjAtwm79j4YCnsOS0ZccNW10swJQk9IezpHAM1tEdm6o6tE/Ov7RHC6PFXJL4B0QAGD3ac82u91MOjqVwkZ6vD1DbxwqIWIOP6uXHSM7MraUxx/uWek48TrHWLItuDBi3nxZSOLl+UBEiZrzyOlkxBWhwkb7Xl7cbwypQI=
From: Rahul Singh <Rahul.Singh@arm.com>
To: David Vrabel <dvrabel@cantab.net>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH] xen/evtchn: Add design for static event channel signaling
 for domUs..
Thread-Topic: [PATCH] xen/evtchn: Add design for static event channel
 signaling for domUs..
Thread-Index: AQHYPsy9MfyfmFhecEGJuSNYyusIgKzOdqoAgByGnQA=
Date: Mon, 11 Apr 2022 16:01:45 +0000
Message-ID: <3A5B600D-9251-4424-800F-AD5B910A78BD@arm.com>
References:
 <4836304496e6fbbea41348ed8cc9fcf6b0f3e893.1648049827.git.rahul.singh@arm.com>
 <35700440-4614-cbd3-361c-3a82cb3d37a9@cantab.net>
In-Reply-To: <35700440-4614-cbd3-361c-3a82cb3d37a9@cantab.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 0f353282-a9a7-4b03-c342-08da1bd49d13
x-ms-traffictypediagnostic:
	AM0PR08MB3347:EE_|DB5EUR03FT012:EE_|AM6PR08MB4935:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB493501909CE95BF960DD6A0CFCEA9@AM6PR08MB4935.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 rfHVSIxQF2I2zymC3fEtdtmYTRxy1tv0pnT67/D+RD9vyfKlsYj5CEIf9BF+MwnrWu6XfH+F2ghUzQiSYcs6TPJZll6TG2I9zrpP5nLCWjJAIMeSWWJ1fe+t5yp2mTjkaIxu8latZLeKV+6THVcRPy20i2gDyhtsPzmaJbeVHTtK0kki/1/vY7ITM+kMHnJifpZSwNHLA8gD8Zf4HHdfYw/Fyf0aolok0mS9bmNSFG7aClmm8Th2GnoEwp2K2Kc/5oJBuK2rMetrCknSJ3XNLcwfydhoQOeC51WPbQpnmtGAdyskEXw/l1FmEf4/HNJ3wHoNf532QsVTxesaB+otPQLa3FH3Hg+W4WfS63B+oM5LcQJuD8ElTMEmzJpFv5Bz1Wa/zunsynAPL9a06PJeCpDnkmzEMyc9R8HLxcF6meQ7ovtINRyhOlyi+/1hsjOljSJetDkEwYkGoxMnktslJ/9A7+4xhtilHjMAz/eSBuxWJZdU/qHomx0+kyOFVm4U6MugxuaxDpltAakA80ENW0lSVyyrUtyuT4F/qUDw9nYFGnv2MBJxqPd9Sqt2Gy55LcBD2hPOoY8Xc7VeK8I2myizd3PPyQlDwpGAbe/m1uvQdnKMgAQjpxmIh8nINvrKQgXFg/ieVgfcSN7Ngv98bfaxJr4HdGVkkvSBpXu7op7haUVgG10lz1YXyDSSIvM1L5wo/QlY8Fjyxc4XveNiF9/Kchb7Nns28+mZ9z0subegJKOaFEQ+Sd5JW4IzEaMm
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0801MB2020.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(33656002)(6486002)(38100700002)(8936002)(26005)(186003)(5660300002)(36756003)(2906002)(508600001)(8676002)(76116006)(66946007)(6916009)(64756008)(86362001)(316002)(54906003)(66476007)(66556008)(66446008)(2616005)(4326008)(6506007)(53546011)(6512007)(71200400001)(122000001)(91956017)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DE9C5DDE1F206B4EB22338FBFCBC9323@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3347
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b503ff3b-fee9-40ba-3628-08da1bd49484
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0u/yh0xIoouuiWdJFKZIYFWCXD0xICXaxrdJTxfguK5eg697jY6kupM7xJFMZ/0/nyuZYEjk2K6Kyi2rBqkIDBgFIOxCxOMuhHn3wVCKs10NZLYo9qm0f/pT+Gu46PWxPVBgihAx72wWtDxlp3glzPiNLdvqj/tOsjeuz839HbRc5WYAiq9+e6k+ETKCCsLA3nB3x01IDiYDTw07WpfdVdvkPkTi0nZOYO243zjuuxXHdw2RWliakD4ydljzQaDPo/TYK7yIU2zpob2LSL8RqToMc3ncjoA1KEcI/LrYAb1x2YxnB8Hs0q8CL90GA7Wu7hnaJf/m/kS0c1dB09BvBtPA3QDm369OTnf84u19Rax2Gn1IqCToVb67Swil62q0sWt4PjXLna8dWwmNblJPudeSmmsmO1kHZa7d6bYMmEeTOTxlGpqS0+4j1xhKPGPSG8Y7NdpiSXVfBCbU+P0febQJrPzol5/HznAlMNyUieUC7pJpXWU3WFKxzu5+0IZaeNSMQSYXPaQl7XK8bkDYUGT6isKWbTxCyLfkGH3uo65/FVkLZJXgS5/qIfU5whERlSBRXS1/2S0cUGFeZPXfY7gQiYu/s1zXK+YF4ScxPqcW7182nQiaHS3MWeqSXu6LnSM+jp+YYJ1O4l9DGya3l86aQhQlzE6jq5tZYxPcWkDTQE7qwyfeIaG9QcKqJbj9
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(8676002)(5660300002)(4326008)(81166007)(70206006)(2906002)(70586007)(6486002)(8936002)(356005)(2616005)(186003)(316002)(6862004)(86362001)(6506007)(53546011)(6512007)(47076005)(40460700003)(54906003)(336012)(26005)(508600001)(36860700001)(82310400005)(36756003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 16:02:00.8525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f353282-a9a7-4b03-c342-08da1bd49d13
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4935

SGVsbG8gRGF2aWQsDQoNClRoYW5rcyBmb3IgcmV2aWV3aW5nIHRoZSBkZXNpZ24gYW5kIHNvcnJ5
IGZvciB0aGUgbGF0ZSByZXBseS4gDQoNCj4gT24gMjQgTWFyIDIwMjIsIGF0IDEyOjI0IHBtLCBE
YXZpZCBWcmFiZWwgPGR2cmFiZWxAY2FudGFiLm5ldD4gd3JvdGU6DQo+IA0KPiANCj4gDQo+IE9u
IDIzLzAzLzIwMjIgMTU6NDMsIFJhaHVsIFNpbmdoIHdyb3RlOg0KPj4gaW4gZG9tMGxlc3Mgc3lz
dGVtLiBUaGlzIHBhdGNoIGludHJvZHVjZSB0aGUgbmV3IGZlYXR1cmUgdG8gc3VwcG9ydCB0aGUN
Cj4+IHNpZ25hbGluZyBiZXR3ZWVuIHR3byBkb21VcyBpbiBkb20wbGVzcyBzeXN0ZW0uDQo+PiBT
aWduZWQtb2ZmLWJ5OiBSYWh1bCBTaW5naCA8cmFodWwuc2luZ2hAYXJtLmNvbT4NCj4+IC0tLQ0K
Pj4gZG9jcy9kZXNpZ25zL2RvbTBsZXNzLWV2dGNobi5tZCB8IDk2ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKw0KPj4gMSBmaWxlIGNoYW5nZWQsIDk2IGluc2VydGlvbnMoKykNCj4+
IGNyZWF0ZSBtb2RlIDEwMDY0NCBkb2NzL2Rlc2lnbnMvZG9tMGxlc3MtZXZ0Y2huLm1kDQo+PiBk
aWZmIC0tZ2l0IGEvZG9jcy9kZXNpZ25zL2RvbTBsZXNzLWV2dGNobi5tZCBiL2RvY3MvZGVzaWdu
cy9kb20wbGVzcy1ldnRjaG4ubWQNCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+PiBpbmRleCAw
MDAwMDAwMDAwLi42YTFiN2U4YzIyDQo+PiAtLS0gL2Rldi9udWxsDQo+PiArKysgYi9kb2NzL2Rl
c2lnbnMvZG9tMGxlc3MtZXZ0Y2huLm1kDQo+PiBAQCAtMCwwICsxLDk2IEBADQo+PiArIyBTaWdu
YWxpbmcgc3VwcG9ydCBiZXR3ZWVuIHR3byBkb21VcyBvbiBkb20wbGVzcyBzeXN0ZW0NCj4+ICsN
Cj4+ICsjIyBDdXJyZW50IHN0YXRlOuKAr0RyYWZ0IHZlcnNpb24NCj4+ICsNCj4+ICsjIyBQcm9w
b3NlcihzKTogUmFodWwgU2luZ2gsIEJlcnRyYW5kIE1hcnF1aXMNCj4+ICsNCj4+ICsjIyBQcm9i
bGVtIFN0YXRlbWVudDoNCj4+ICsNCj4+ICtUaGUgZ29hbCBvZiB0aGlzIHdvcmsgaXMgdG8gZGVm
aW5lIGEgc2ltcGxlIHNpZ25hbGluZyBzeXN0ZW0gYmV0d2VlbiBYZW4gZ3Vlc3RzDQo+PiAraW4g
ZG9tMGxlc3Mgc3lzdGVtcy4NCj4+ICsNCj4+ICtJbiBkb20wbGVzcyBzeXN0ZW0sIHdlIGNhbm5v
dCBtYWtlIHVzZSBvZiB4ZW5idXMgYW5kIHhlbnN0b3JlIHRoYXQgYXJlIHVzZWQgaW4NCj4+ICtu
b3JtYWwgc3lzdGVtcyB3aXRoIGR5bmFtaWMgVk1zIHRvIGNvbW11bmljYXRlIGJldHdlZW4gZG9t
YWlucyBieSBwcm92aWRpbmcgYQ0KPj4gK2J1cyBhYnN0cmFjdGlvbiBmb3IgcGFyYXZpcnR1YWxp
emVkIGRyaXZlcnMuDQo+PiArDQo+PiArT25lIHBvc3NpYmxlIHNvbHV0aW9uIHRvIGltcGxlbWVu
dCB0aGUgc2lnbmFsaW5nIHN5c3RlbSBiZXR3ZWVuIGRvbVVzIGlzIGJhc2VkDQo+PiArb24gZXZl
bnQgY2hhbm5lbHMuDQo+IA0KPiBUaGlzIHByb2JsZW0gc3RhdGVtZW50IGNvdWxkIGRvIHdpdGgg
c29tZSBleGFtcGxlIHVzZSBjYXNlcyB0aGF0IGFyZSB1c2VmdWxseSBzb2x2ZWQgYnkgdGhpcyBw
cm9wb3NlZCBzb2x1dGlvbi4NCj4gDQo+ICJXZSBkb24ndCBoYXZlIHhlbnN0b3JlIHNvIGNhbid0
IHNldCB1cCBzaGFyZWQgcmluZ3MsIGJ1dCBoZXJlJ3MgYSByZXBsYWNlbWVudCBjb21tcyBtZWNo
YW5pc20gdGhhdCBjYW4gZG8gYSBzaW5nbGUgYml0LiIgRG9lc24ndCBzZWVtIHZlcnkgY29tcGVs
bGluZyB0byBtZS4NCg0KT2suIExldCBtZSBhZGQgbW9yZSBpbmZvcm1hdGlvbiBpbiBuZXh0IHZl
cnNpb24uDQo+IA0KPj4gKyBjaG9zZW4gew0KPj4gKyAuLi4uDQo+PiArDQo+PiArIGRvbVUxOiBk
b21VMSB7DQo+PiArIC4uLi4uLg0KPj4gKyB9Ow0KPj4gKw0KPj4gKyBkb21VMjogZG9tVTIgew0K
Pj4gKyAuLi4uLi4NCj4+ICsgfTsNCj4+ICsNCj4+ICsgZXZ0Y2huQDEgew0KPj4gKyBjb21wYXRp
YmxlID0gInhlbixldnRjaG4iOw0KPj4gKyB4ZW4sZXZ0Y2huID0gPDB4YSAmZG9tVTEgMHhiICZk
b21VMj47DQo+PiArIH07DQo+PiArDQo+PiArIGV2dGNobkAyIHsNCj4+ICsgY29tcGF0aWJsZSA9
ICJ4ZW4sZXZ0Y2huIjsNCj4+ICsgeGVuLGV2dGNobiA9IDwweGMgJmRvbVUxIDB4ZCAmZG9tVTI+
Ow0KPj4gKyB9Ow0KPiANCj4gSG93IGlzIHRoZSBkb21haW4gc3VwcG9zZWQgdG8ga25vdyB3aGF0
IHRoZXNlIGV2ZW50IGNoYW5uZWxzIGFyZSBmb3I/DQoNCkFzIHdlIGFyZSBzdGF0aWNhbGx5IGRl
ZmluaW5nIHRoZSBldmVudCBjaGFubmVsIGluIFhFTiwgd2UgY2FuIGRvY3VtZW50IHRoZSBldmVu
dA0KY2hhbm5lbCBjb25uZWN0aW9uIGluZm9ybWF0aW9uIGZvciB0aGUgZW5kLXVzZXIgaW4gdGhl
IGVuZC11c2VyIGRvY3VtZW50YXRpb24gYW5kDQpsZXQgdGhlIHVzZXIgZGVjaWRlIGhvdyBoZSBp
cyBnb2luZyB0byB1c2UgaXQuICANCg0KPiANCj4gSSdtIG5vdCB0aGF0IGZhbWlsaWFyIHdpdGgg
ZGV2aWNlIHRyZWUuIElzIGl0IHBvc3NpYmxlIHRvIGdpdmUgdGhlc2UgZW50cmllcyBuYW1lPw0K
DQpBcyBwZXIgdGhlIGRldmljZS10cmVlIHNwZWNpZmljYXRpb24sIGVhY2ggbm9kZSBpbiB0aGUg
ZGV2aWNlIHRyZWUgaXMgbmFtZWQgYWNjb3JkaW5nIHRvIHRoZSBmb2xsb3dpbmcgY29udmVudGlv
bg0KCW5vZGUtbmFtZUB1bml0LWFkZHJlc3MNCg0KV2UgY2FuIGdpdmUgdGhlIG5hbWUgdG8gdGhl
c2UgZW50cmllcyBidXQgaW4gYW5vdGhlciBlbWFpbCwgd2UgYXJlIGRpc2N1c3NpbmcgaGF2aW5n
IHNpbmdlIG5vZGUsIGluIHRoYXQNCmNhc2UgdGhlcmUgaXMgbm8gbmVlZCB0byBnaXZlIGEgbmFt
ZS4NCg0KZXZ0Y2huIHsNCgljb21wYXRpYmxlID0gInhlbixldnRjaG4tdjHigJ07DQoJeGVuLGV2
dGNobiA9IDwweGEgJmRvbVUxIDB4YiAmZG9tVTIgMHhjICZkb21VMSAweGQgJmRvbVUyPjsNCn07
DQoNClJlZ2FyZHMuDQpSYWh1bA0KPiANCj4gRGF2aWQNCg0K

