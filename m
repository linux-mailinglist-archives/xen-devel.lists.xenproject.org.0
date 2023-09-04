Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 133387916FB
	for <lists+xen-devel@lfdr.de>; Mon,  4 Sep 2023 14:17:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595128.928640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd8WM-000891-MI; Mon, 04 Sep 2023 12:17:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595128.928640; Mon, 04 Sep 2023 12:17:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd8WM-00086v-IK; Mon, 04 Sep 2023 12:17:34 +0000
Received: by outflank-mailman (input) for mailman id 595128;
 Mon, 04 Sep 2023 12:17:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5g5r=EU=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qd8WL-0007aj-HU
 for xen-devel@lists.xenproject.org; Mon, 04 Sep 2023 12:17:33 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20617.outbound.protection.outlook.com
 [2a01:111:f400:7d00::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 065baf11-4b1d-11ee-8783-cb3800f73035;
 Mon, 04 Sep 2023 14:17:32 +0200 (CEST)
Received: from DUZPR01CA0218.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::21) by GV2PR08MB8582.eurprd08.prod.outlook.com
 (2603:10a6:150:b5::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Mon, 4 Sep
 2023 12:17:28 +0000
Received: from DBAEUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b4:cafe::c4) by DUZPR01CA0218.outlook.office365.com
 (2603:10a6:10:4b4::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32 via Frontend
 Transport; Mon, 4 Sep 2023 12:17:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT056.mail.protection.outlook.com (100.127.142.88) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.22 via Frontend Transport; Mon, 4 Sep 2023 12:17:27 +0000
Received: ("Tessian outbound 0b7d6027328f:v175");
 Mon, 04 Sep 2023 12:17:27 +0000
Received: from 3fccac754c3c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 28085554-2D12-44FE-9F3B-B7CA9BE77163.1; 
 Mon, 04 Sep 2023 12:16:38 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3fccac754c3c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 04 Sep 2023 12:16:38 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB8PR08MB5482.eurprd08.prod.outlook.com (2603:10a6:10:116::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Mon, 4 Sep
 2023 12:16:36 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a%4]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 12:16:36 +0000
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
X-Inumbo-ID: 065baf11-4b1d-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fT1+/3FFo8sr+A3+bTatit0MNOKNX3/wCVSxe1aBOn0=;
 b=ZLMwddM4XUB4r7kgQ095yhxKImNqDkRh738a18JCulQ41K4jmPZKWlIB2Uwh55wktklfBTyC6lJR/wFaRXwtWyODJZ3u4oD0fVtM0N7U63gVPOQMJXO/sKY1xbOwnuK0wMKRtHLc6Wai1H5k1Dk5HsrpKb0WXVmkXDpHuQOnuQI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 62e32a9d75c85eda
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fVNPOrBjCAVDr/UajzXHSoXZJIHmrHJoF1tSbRtDR0pbmWmUmEXPS4OKywLvX3pBBUa5eGL7vtjVqcWEwxYyIN9yKmhq78g9Y9aB2mZn+u9pMQU/LlZMJHv9+TfiTgBAPilYpNIzMfIWGfEs4ApAD0brf72rGcYH0iSaxTlVpfTpJ4tEc1GUFVwTk5WlWYuBy0dWq6RQYJsfQ4qth3tSfcjgrQCrg6gwe2NSMaLQoS47fRYfAdwCD5EVkMytW4utKincFlsV7Yz3s44WJtONPZwBD1GVoU6hz0Wv0s7v93uPViE+yaZhElE3YbyjQEgnDFe1KYnfCOvrL3rqd0g38A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fT1+/3FFo8sr+A3+bTatit0MNOKNX3/wCVSxe1aBOn0=;
 b=aAoMVC6BzLYBVHCLkvhR2vbOGWX8G/p0ZIam0YQDRGMOP1vAJAZ5bywmdgWr7QI1FxcPrEZWKFB+OPkgcjaGkRfzauooEMsVRx2xJydc2KLhcHgfrNc+x4etwOvH/G7C84j4MMBmnPcnk2QyoequDGek+56nWlAvYdtz4CwlK3WZ3EwdApAMcPPyEYYJ9tfB1edtHJKsbx9dEyuP3BJpHVvCcoIh/gxhFjKSNLm+TCbUUrSxoxgKpbJ0iMJUDokzLXjckyly2HcHcaR1Q/oUs+MJhH1YVIyB1Tn0Vj2I3fsZcPgTW4ASxrOPDTy2ZBw9H61gAITjd00V++SmqzRxLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fT1+/3FFo8sr+A3+bTatit0MNOKNX3/wCVSxe1aBOn0=;
 b=ZLMwddM4XUB4r7kgQ095yhxKImNqDkRh738a18JCulQ41K4jmPZKWlIB2Uwh55wktklfBTyC6lJR/wFaRXwtWyODJZ3u4oD0fVtM0N7U63gVPOQMJXO/sKY1xbOwnuK0wMKRtHLc6Wai1H5k1Dk5HsrpKb0WXVmkXDpHuQOnuQI=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>
Subject: Re: xen-analysis ECLAIR support
Thread-Topic: xen-analysis ECLAIR support
Thread-Index: AQHZ1tnZvpm8hZMDREGKKcjBarux3K/6qaOAgADmnoCADxVLAA==
Date: Mon, 4 Sep 2023 12:16:36 +0000
Message-ID: <9CD36BEE-F8E4-40DF-96DF-9C280A58D646@arm.com>
References:
 <alpine.DEB.2.22.394.2308241453470.6458@ubuntu-linux-20-04-desktop>
 <da8dce5678814f7e0805522a5111b09e@bugseng.com>
 <alpine.DEB.2.22.394.2308251455070.6458@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2308251455070.6458@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB8PR08MB5482:EE_|DBAEUR03FT056:EE_|GV2PR08MB8582:EE_
X-MS-Office365-Filtering-Correlation-Id: 727ddefe-771e-4c24-0a8f-08dbad40e785
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /3APB1ju6Miz4AVaLj6Yd3CJ5HU0fS67WNOTGmeB8fffDw+ubntA38Skqr9o6tegSlu3PA6lDHZ+v6vA5yAUprPQxCvCZdQ0kM/imMIj9BtNHDeYhBl9CWXY0ALU28GDNbEK+5FlVCmIJCc4/nPIANulifVaBfR/BkaADdpKQNGSHlnVaybn8sjWh4AcFxHfGZPw9md2L9auDKGn2MO/J93pO+DNH+7graq0xy/wK2Vb9sB+myaVVtnwORL5nwDwTUsVPrnSB7+0quoHmV1G36jEcEQVN7fzXID+oEwW6Rv70uL0N2gwhdR1CvKHgd2Ev9eoa/1mLNjKmQ0wws3S1CLBwvfT3Q5BzUyapm3Cf+vIiO6cMHFomxHFBuH6r1HMuDLjdcrVqiBP4APFDD6Vs1XXHeqJEbhMZBSLjyAMnw1KgMpwilpLkkwpe/esXXzzfbMJn6N3gsinUUiIRe+ujatxbBlFOiJXorzN/sjmadpOJNsGER3IMyg0FF/Sj6+4Cfphk2vhhaFD4KeVGS/AL0FIowg4GM7nKoq9C+B99wX0A6cVY2a07ZZJkQ1gJCmecKYBniiZDtjisaM3xrRqrfcyakiUjpHO7NXiV4bRur758FlZaKX0t6aPgUXnmEGj8Kka8E83DybeNp0gtkNrOw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(366004)(396003)(39860400002)(451199024)(186009)(1800799009)(3480700007)(38100700002)(122000001)(38070700005)(33656002)(41300700001)(5660300002)(36756003)(86362001)(66556008)(66476007)(66946007)(66446008)(76116006)(26005)(64756008)(478600001)(2616005)(91956017)(71200400001)(8936002)(8676002)(4326008)(316002)(53546011)(6512007)(6486002)(54906003)(2906002)(6506007)(6916009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4301032FC519AE41A1A747272C309767@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5482
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	78208f8f-9e37-4c45-6b0e-08dbad40c92a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9Spd+5nma+fOqrAlla8l6FjNUyV6/JFvIkwmmedPRoCK1jjwXtUWv3YL7FM7HpNRKwUd8qc5MH9l3BU/OQqS/QiXiC3HeBH0VGIwrFmLpOzrf7odOrcL9RNWg8IOXj76CQ3YJTYVMosElaP6jgyANCUhHDFvypiJo5MTZGyyCyLVmzVv/D4tfxpBD2/gThhQblqT8PQodE2EOilMA4L/Ej29dg7SbxgCSfLLJktAxLDmnOaO6mg2Ss34bwbFh7KsP4ObgK/NAdTgDwYXhn9cNEZH1rDRopiDiCnEIPuLngeTuFj5KAymChcrbjbCKnBGN20JtM1yK8HhaOCP1JN3xXshdHJVQVJy5MYiKkBoagPSfl6jTFVNBgN/z3tc9s/flqkeyC1odqaVwSJd7x45aiug3y52ade+QvzMwrxLQFA4EUNuybMxmluL9ZMxJw2y7ApY6mtJPjlACEUtZ/Uafmy4mKFmWvAiECiQfIR1Ep3BQjZfBXzvwwNRI2qPm7acBH9/A5b5XVBtI6mfqkQMpae1BgRB/laCHeglUwHkjxVb+LzxsU/CcCgSsHCA+xr92hFU6m4BpmC/WZW89E9OpPv0dHXSZDMig2zxTZ2Fx86jlzdBSNhenxAgWwJLXjtF6bO8aS3YUbsOzJUZYvTdAfktbSOjMMVZOWQ5xmNElB7VGEhkuKBPkYt1ni+qu/sYt59d9N3Rq7+4x1oCgAnWCwFzQPAJoo42JgPL6F4bxa/wpxeejGYRXByHzMXt52KR
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(346002)(376002)(396003)(1800799009)(82310400011)(451199024)(186009)(46966006)(36840700001)(40470700004)(8676002)(6862004)(5660300002)(316002)(36756003)(2906002)(54906003)(70586007)(70206006)(8936002)(4326008)(41300700001)(40460700003)(6506007)(6486002)(53546011)(36860700001)(26005)(336012)(6512007)(3480700007)(40480700001)(47076005)(81166007)(82740400003)(356005)(478600001)(2616005)(86362001)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 12:17:27.6825
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 727ddefe-771e-4c24-0a8f-08dbad40e785
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8582

DQoNCj4gT24gMjUgQXVnIDIwMjMsIGF0IDIyOjU2LCBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4gT24gRnJpLCAyNSBBdWcgMjAyMywgTmlj
b2xhIFZldHJpbmkgd3JvdGU6DQo+PiBPbiAyNS8wOC8yMDIzIDAwOjI0LCBTdGVmYW5vIFN0YWJl
bGxpbmkgd3JvdGU6DQo+Pj4gSGkgTHVjYSwNCj4+PiANCj4+PiBXZSBhcmUgbG9va2luZyBpbnRv
IGFkZGluZyBFQ0xBSVIgc3VwcG9ydCBmb3IgeGVuLWFuYWx5c2lzIHNvIHRoYXQgd2UNCj4+PiBj
YW4gdXNlIHRoZSBTQUYtbi1zYWZlIHRhZ3MgYWxzbyB3aXRoIEVDTEFJUi4NCj4+PiANCj4+PiBP
bmUgcXVlc3Rpb24gdGhhdCBjYW1lIHVwIGlzIGFib3V0IG11bHRpLWxpbmUgc3RhdGVtZW50cy4g
Rm9yIGluc3RhbmNlLA0KPj4+IGluIGEgY2FzZSBsaWtlIHRoZSBmb2xsb3dpbmc6DQo+Pj4gDQo+
Pj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vaW5mbGF0ZS5jIGIveGVuL2NvbW1vbi9pbmZsYXRl
LmMNCj4+PiBpbmRleCA4ZmE0Yjk2ZDEyLi44YmRjOTIwOGRhIDEwMDY0NA0KPj4+IC0tLSBhL3hl
bi9jb21tb24vaW5mbGF0ZS5jDQo+Pj4gKysrIGIveGVuL2NvbW1vbi9pbmZsYXRlLmMNCj4+PiBA
QCAtMTIwMSw2ICsxMjAxLDcgQEAgc3RhdGljIGludCBfX2luaXQgZ3VuemlwKHZvaWQpDQo+Pj4g
ICAgIG1hZ2ljWzFdID0gTkVYVEJZVEUoKTsNCj4+PiAgICAgbWV0aG9kICAgPSBORVhUQllURSgp
Ow0KPj4+IA0KPj4+ICsgICAgLyogU0FGLTEtc2FmZSAqLw0KPj4+ICAgICBpZiAobWFnaWNbMF0g
IT0gMDM3IHx8DQo+Pj4gICAgICAgICAoKG1hZ2ljWzFdICE9IDAyMTMpICYmIChtYWdpY1sxXSAh
PSAwMjM2KSkpIHsNCj4+PiAgICAgICAgIGVycm9yKCJiYWQgZ3ppcCBtYWdpYyBudW1iZXJzIik7
DQo+Pj4gDQo+Pj4gDQo+Pj4gV291bGQgU0FGLTEtc2FmZSBjb3ZlciBib3RoIDAzNywgYW5kIGFs
c28gMDIxMyBhbmQgMDIxMz8NCj4+PiBPciB3b3VsZCBpdCBjb3ZlciBvbmx5IDAzNz8NCj4+PiAN
Cj4+PiBXZSBoYXZlbid0IHVzZSBTQUZFLW4tc2FmZSBleHRlbnNpdmVseSB0aHJvdWdoIHRoZSBj
b2RlYmFzZSB5ZXQgYnV0DQo+Pj4gbXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IFNBRkUtbi1zYWZl
IHdvdWxkIGNvdmVyIHRoZSBlbnRpcmUgc3RhdGVtZW50IG9mDQo+Pj4gdGhlIGZvbGxvd2luZyBs
aW5lLCBldmVuIGlmIGl0IGlzIG11bHRpLWxpbmUuIElzIHRoYXQgYWxzbyB5b3VyDQo+Pj4gdW5k
ZXJzdGFuZGluZz8gRG9lcyBpdCB3b3JrIGxpa2UgdGhhdCB3aXRoIGNwcGNoZWNrPw0KPj4+IA0K
Pj4+IA0KPj4+IEl0IGxvb2tzIGxpa2UgRUNMQUlSIHJlcXVpcmVzIGEgd3JpdHRlbi1kb3duIG51
bWJlciBvZiBsaW5lcyBvZiBjb2RlIHRvDQo+Pj4gZGV2aWF0ZSBpZiBpdCBpcyBtb3JlIHRoYW4g
MSBsaW5lLiBJbiB0aGlzIGV4YW1wbGUgaXQgd291bGQgYmUgMiBsaW5lczoNCj4+PiANCj4+PiAg
ICAgLyogU0FGLTEtc2FmZSAyICovDQo+Pj4gICAgIGlmIChtYWdpY1swXSAhPSAwMzcgfHwNCj4+
PiAgICAgICAgICgobWFnaWNbMV0gIT0gMDIxMykgJiYgKG1hZ2ljWzFdICE9IDAyMzYpKSkgew0K
Pj4+IA0KPj4+IE9uZSBvcHRpb24gdGhhdCBJIHdhcyB0aGlua2luZyBhYm91dCBpcyB3aGV0aGVy
IHdlIGNhbiBhZGQgdGhlIG51bWJlciBvZg0KPj4+IGxpbmVzIGF1dG9tYXRpY2FsbHkgaW4geGVu
LWFuYWx5c2lzIGJhc2VkIG9uIHRoZSBudW1iZXIgb2YgbGluZXMgb2YgdGhlDQo+Pj4gbmV4dCBz
dGF0ZW1lbnQuIFdoYXQgZG8geW91IHRoaW5rPw0KPj4+IA0KPj4+IEl0IHNlZW1zIGZyYWdpbGUg
dG8gYWN0dWFsbHkga2VlcCB0aGUgbnVtYmVyIG9mIGxpbmVzIGluc2lkZSB0aGUgU0FGDQo+Pj4g
Y29tbWVudCBpbiB0aGUgY29kZS4gSSBhbSBhZnJhaWQgaXQgY291bGQgZ2V0IG91dCBvZiBzeW5j
IGR1ZSB0byBjb2RlDQo+Pj4gc3R5bGUgcmVmYWN0b3Jpbmcgb3Igb3RoZXIgbWVjaGFuaWNhbCBj
aGFuZ2VzLg0KPj4+IA0KPj4gDQo+PiBIYXZpbmcgdGhlIG51bWJlciBvZiBsaW5lcyBhdXRvbWF0
aWNhbGx5IGluZmVycmVkIGZyb20gdGhlIGNvZGUgZm9sbG93aW5nIHRoZQ0KPj4gY29tbWVudA0K
Pj4gZG9lcyBub3Qgc2VlbSB0aGF0IHJvYnVzdCBlaXRoZXIsIGdpdmVuIHRoZSBtaW5pbWFsIGlu
Zm9ybWF0aW9uIGluIHRoZSBTQUYNCj4+IGNvbW1lbnRzDQo+PiAoZS5nLiwgd2hhdCBpZiB0aGUg
d2hvbGUgaWYgc3RhdGVtZW50IG5lZWRzIHRvIGJlIGRldmlhdGVkLCByYXRoZXINCj4+IHRoYW4g
dGhlIGNvbnRyb2xsaW5nIGV4cHJlc3Npb24/KS4NCj4+IA0KPj4gQW4gYWx0ZXJuYXRpdmUgcHJv
cG9zYWwgY291bGQgYmUgdGhlIGZvbGxvd2luZzoNCj4+ICAgICAgLyogU0FGLW4tc2FmZSBiZWdp
biAqLw0KPj4gICAgICBpZiAobWFnaWNbMF0gIT0gMDM3IHx8DQo+PiAgICAgICAgICAoKG1hZ2lj
WzFdICE9IDAyMTMpICYmIChtYWdpY1sxXSAhPSAwMjM2KSkpIHsNCj4+ICAgICAgLyogU0FGLW4t
c2FmZSBlbmQgKi8NCj4+IA0KPj4gd2hpY2ggaXMgdHJhbnNsYXRlZCwgZm9yIEVDTEFJUiwgaW50
bzoNCj4+IA0KPj4gICAgLyogLUU+IHNhZmUgPFJ1bGUgSUQ+IDIgPGZyZWUgdGV4dD4gKi8NCj4+
ICAgIGlmIChtYWdpY1swXSAhPSAwMzcgfHwNCj4+ICAgICAgICAgICgobWFnaWNbMV0gIT0gMDIx
MykgJiYgKG1hZ2ljWzFdICE9IDAyMzYpKSkgew0KPj4gDQo+PiB0aGlzIHdpbGwgZGV2aWF0ZSBo
b3dldmVyIG1hbnkgbGluZXMgYXJlIGJldHdlZW4gdGhlIGJlZ2luIGFuZCBlbmQgbWFya2Vycy4N
Cj4gDQo+IEkgdGhpbmsgdGhpcyBjb3VsZCBiZSBhIGdvb2Qgd2F5IHRvIHNvbHZlIHRoZSBwcm9i
bGVtIHdoZW4gbXVsdGktbGluZQ0KPiBkZXZpYXRpb24gc3VwcG9ydCBpcyByZXF1aXJlZC4gSW4g
dGhpcyBjYXNlLCBsaWtlIEphbiBzdWdnZXN0ZWQsIGl0DQo+IGlzIGVhc2llciB0byBwdXQgZXZl
cnl0aGluZyBvbiBhIHNpbmdsZSBsaW5lLCBidXQgaW4gb3RoZXIgY2FzZXMgaXQNCj4gbWlnaHQg
bm90IGJlIHBvc3NpYmxlLg0KDQpZZXMsIGluIHRoYXQgY2FzZSBob3dldmVyIHdlIGFyZSB0aWVk
IHRvIHdoYXQgdGhlIHVuZGVybHlpbmcgdG9vbCBhcmUgc3VwcG9ydGluZywNCmZvciBleGFtcGxl
IGVjbGFpciBpcyBwcmV0dHkgbmljZSBhbmQgc3VwcG9ydCBhbiBpbi1jb2RlIGNvbW1lbnQgd2l0
aCBhZHZhbmNlZA0KU3ludGF4LCBidXQgZm9yIGV4YW1wbGUgY3BwY2hlY2sgYW5kIGFsc28gY292
ZXJpdHkgZG9u4oCZdCwgc28gaW4gdGhlIGVuZCB3ZSB1c2VkDQp0aGUgY29tbW9uIGRlbm9taW5h
dG9yIHdoZXJlIHRoZSBjb21tZW50IHN1cHByZXNzIHRoZSBuZXh0IGxpbmUgKGNvbnRhaW5pbmcg
Y29kZSkuDQoNCg0KDQoNCg==

