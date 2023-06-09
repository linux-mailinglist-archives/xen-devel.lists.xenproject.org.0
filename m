Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 410F37296C3
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 12:23:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545845.852464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7ZGc-00036L-RS; Fri, 09 Jun 2023 10:22:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545845.852464; Fri, 09 Jun 2023 10:22:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7ZGc-00033i-ND; Fri, 09 Jun 2023 10:22:50 +0000
Received: by outflank-mailman (input) for mailman id 545845;
 Fri, 09 Jun 2023 10:22:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1HUa=B5=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1q7ZGa-00033a-Dc
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 10:22:48 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060c.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 932dca7b-06af-11ee-b232-6b7b168915f2;
 Fri, 09 Jun 2023 12:22:45 +0200 (CEST)
Received: from DUZPR01CA0024.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::11) by DBAPR08MB5589.eurprd08.prod.outlook.com
 (2603:10a6:10:1a2::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.39; Fri, 9 Jun
 2023 10:22:42 +0000
Received: from DBAEUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:46b:cafe::d9) by DUZPR01CA0024.outlook.office365.com
 (2603:10a6:10:46b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.25 via Frontend
 Transport; Fri, 9 Jun 2023 10:22:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT042.mail.protection.outlook.com (100.127.142.143) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.26 via Frontend Transport; Fri, 9 Jun 2023 10:22:42 +0000
Received: ("Tessian outbound 99a3040377ca:v136");
 Fri, 09 Jun 2023 10:22:42 +0000
Received: from 5410ba077d60.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2F476C90-AF23-411F-B304-3F646160C3EA.1; 
 Fri, 09 Jun 2023 10:22:34 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5410ba077d60.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 09 Jun 2023 10:22:34 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB9PR08MB6377.eurprd08.prod.outlook.com (2603:10a6:10:259::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 9 Jun
 2023 10:22:32 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b%4]) with mapi id 15.20.6455.037; Fri, 9 Jun 2023
 10:22:32 +0000
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
X-Inumbo-ID: 932dca7b-06af-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VEgxVGj/6Ts1+OXEIwG0zdMv408dRVj+MkNs94KIegY=;
 b=ITNMsGuIpnln2p0zybToKANg533APART6QXCkoH5IxW5IxMH6AVrhjSIV7P/mzKLrrqsAnsOFiOY+8mZki4tBhBmpu6a1OdNYeG/n+GD4xFE2wrsb+7SUzVhA93wiVdksqsjRAt+6ATO4sCpGpV4n5Kr+Xv7qUaban1A/+KWlRQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 04539b9a38a8afe3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PhVAhJRUsNCyvPYv/Q8LuyDTMFLnJAJCbiySIerzavSD67BZCMCxTlzv+dDhuXrSbTtAkvViFxeWmVJJYv3WdfERkfkCnaouhJM0yM6bzAf2aSM/VlPB8S0cyfMEBimFO1ulF//MYynNlyYjJ80+EKRp+Jy9V9L/uCzWr+2gz9fonBJbrpzYiSHomAMNNX0TDiJzTpWiLvr5g+JJehTF77T2PlNDtRUAxuBBnDA/qwGn5BBSLdKRxb5kMv2sj1Aw/dn1TdUWe+n+cgzXZHxy/H3yVA7czfsAzfMH1+IaZX2HgkmihHBcg5LiXBSTXJ6iFbnh0udOC0r9VoeE0ZwbQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VEgxVGj/6Ts1+OXEIwG0zdMv408dRVj+MkNs94KIegY=;
 b=JoalCeqfQ9gfUDPdrQqzQFEeJ17OLjzF3Tq84cOt+7WzvbzbCM6+qBxk+0shtYtF6c149wrmApdz6RE5F4RiEq4IPGvFLkhsWeCoxMV6dKfwUfinKn4EpV9aPsazZgAWo/lO/+ajSi38VFPrGZOCT71zV523tv0dsQe1K1osv1Ns5c+0IJtBrICqoAwvtBv9mGFSCC3tKrXBvCtnwB81nJglHcz8J3sATqaLs/yPt384DmjMnkCLvBR1ejwbbalP7NnKG5kHVIGL4guQ62ttPJOnmg9OXnswEyxNLyJo4xGPvZmi5PVemRb9bVdDoJjMA1bGC+X4jG3I0Ck8rvEOzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VEgxVGj/6Ts1+OXEIwG0zdMv408dRVj+MkNs94KIegY=;
 b=ITNMsGuIpnln2p0zybToKANg533APART6QXCkoH5IxW5IxMH6AVrhjSIV7P/mzKLrrqsAnsOFiOY+8mZki4tBhBmpu6a1OdNYeG/n+GD4xFE2wrsb+7SUzVhA93wiVdksqsjRAt+6ATO4sCpGpV4n5Kr+Xv7qUaban1A/+KWlRQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Jan Beulich
	<JBeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] tools: Move MASK_INSR to common-macros.h
Thread-Topic: [PATCH] tools: Move MASK_INSR to common-macros.h
Thread-Index: AQHZmrrAvvMQGZvR/EOn/oeFX1CtTq+CQxeA
Date: Fri, 9 Jun 2023 10:22:32 +0000
Message-ID: <EDB3F031-CF9C-48A9-8E95-E4C5252FA7CE@arm.com>
References: <20230609101105.2585951-1-andrew.cooper3@citrix.com>
In-Reply-To: <20230609101105.2585951-1-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB9PR08MB6377:EE_|DBAEUR03FT042:EE_|DBAPR08MB5589:EE_
X-MS-Office365-Filtering-Correlation-Id: fde72a71-4023-42fa-6791-08db68d37574
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 7J+RmnZnWZz+28yafLkIaw9oM7ybFcl0yt6h6l4GEPj50iFIUncY3tgFqfefQQv6eUDTnv3VL28Ihg5YZAhb7ykKHN6ON1off4GG44188F71ljF4615Oty12kTw4maa0CAlNGjIZBTEyUwK5furJ0ZWf42qf6Qe42FDwbRH0cRZcbYCJQdphjEwEdvQFCOmcz2vU75jTpbKp2tbTAL46ETo8SHP98pVMhHbZplb/6r2mCInmKGP+VpivmsY3N/37ePUOhyRsLw/ICZ9lyPc4H/le30BhnOgixOI58qSppGp1h9AhfjLo1Vjka9TUOS/O98XrF9TyrWew89YpfzHUB4UCxCMlEn3RcQdXmPKtcu0KsHQCx08KrExUi+4DOMzIILrCIlQS2eP0vvhaUe0x4Z2anNv5XXxWnLuvlzNMJmP7qkWODgqgSM2kokJCZ175vRK/DQrBW4m8l7MACMO8TIEOKvOFYqQ7lT5Z1gs7qeYj0oIF4BSc1aYM9U1ESAkELD3Or43oETIgAuldiU/vSr8E2rjW1dt4lo8HmEhhMENTlhc8YMfEwkcw+ooSZPFtMw7YcvII/gn7jsM4E9piJVML+WpkU+0AJkywBkdaFpLpQvkMG4Lkgca+FCZzL0DunwjOoJgnBSS3V3X7W1pNBQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(451199021)(83380400001)(5660300002)(122000001)(38100700002)(38070700005)(186003)(53546011)(6512007)(6506007)(26005)(2616005)(54906003)(2906002)(33656002)(71200400001)(478600001)(6486002)(8676002)(36756003)(66556008)(66476007)(91956017)(76116006)(6916009)(4326008)(8936002)(66946007)(86362001)(66446008)(41300700001)(316002)(64756008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3D664FD96C72AE4D834F230AAFA56739@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6377
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6202629f-59b7-45e4-d38e-08db68d36f8b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mltsPOk73QDBYPqYOVh5HWmQEJKdMi0coFTE6DZhYMp2S9rDau1E0ydi43UzbH36TwNiTU1Y40WHfFcMWTOr2w3h6WseBzKnrspKYGnfyUVeQqzfqjJ7CQnw4fVvu5sqKYuyJoLP+aHNl6ep/SpgI8nlLYBWH/GDB89I198CZvrbhxiKggUn8n8dROU7Ip+osn/PHQGmqg75hmz/hhm6rTE7ynUcJM3sc/UiHP639Hnxo8Le3z07xiGl+gHkxRstCSeUw8gs+9hHVfquDbpmcecYXIoS6zCI3j2ofzBD7BTE2N9ZGllX8OOjkbi8d8AOHxkQcSewHFSNCfWqMkAipUpX4LjJIFSbExkB6d9CsdJXhYoheWTzgIKs2cFYJn51KOaNVOxGylgTGMZ3JmJN7zbd4ZYi3Blri6pW3GR8BdtpUZuQeQxNITvFGZMZcsDOW+ntCDWt1IgTmDzLh1MviT6tWx/ktWt9K/1tMkwbb0fdSuzM9JqVNB+hs9oU+q187k5CF8nto1LlA7e9hO7HS4pijfbD3+qceBq4R8sOprXev6neC64ijaqjEUFLPAqtgOIvAAiWGH9wCOk4wpKFpna+Soi+ixetJZAL25DVqSb1HdAejg9QzGZJnTF7CWRkAGyhJA0GzAu2csSggpyydVMCiDXBlS9eVwcyLg0wx7J0SyYcqPzGYSdl2cxti/Op4dF7/stmuq94ddP0xaadqKNH9KqwzptwgxwWrasoYOFP+/Fkg+NXB5mLoGdHlJ5i
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(136003)(376002)(396003)(451199021)(46966006)(40470700004)(36840700001)(6486002)(316002)(40460700003)(41300700001)(82310400005)(86362001)(83380400001)(47076005)(36860700001)(26005)(53546011)(6506007)(186003)(6512007)(2616005)(33656002)(2906002)(81166007)(356005)(82740400003)(40480700001)(336012)(5660300002)(36756003)(8936002)(6862004)(8676002)(70586007)(70206006)(54906003)(478600001)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 10:22:42.0852
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fde72a71-4023-42fa-6791-08db68d37574
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5589

DQoNCj4gT24gOSBKdW4gMjAyMywgYXQgMTE6MTEsIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gTUFTS19FWFRSKCkgYW5kIE1BU0tfSU5TUigp
IGFyZSBhIG1hdGNoaW5nIHBhaXIuICBLZWVwIHRoZW0gdG9nZXRoZXIuDQo+IA0KPiBEcm9wIHRo
ZSBwYWlyIGZyb20geDg2LWVtdWxhdGUuaCB3aGljaCBpbmNsdWRlcyBjb21tb24tbWFjcm9zLmgu
DQo+IA0KPiBGaXhlczogNTZhN2FhYTE2YmZlICgidG9vbHM6IGFkZCBwaHlzaW5mbyBhcmNoX2Nh
cGFiaWxpdGllcyBoYW5kbGluZyBmb3IgQXJtIikNCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCg0KSSB0aGluayB5b3UgZm9yZ290IHRv
IHJldGFpbiBteSBSLWJ5Og0KDQpSZXZpZXdlZC1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5j
ZWxsdUBhcm0uY29tPg0KDQoNCg0KPiAtLS0NCj4gQ0M6IEFudGhvbnkgUEVSQVJEIDxhbnRob255
LnBlcmFyZEBjaXRyaXguY29tPg0KPiBDQzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
Pg0KPiBDQzogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0KPiBDQzogSmFu
IEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPg0KPiBDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+DQo+IENDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPiANCj4gdjI6
DQo+ICogRHJvcCBmcm9tIHg4Ni1lbXVsYXRlLmggdG9vLg0KPiAtLS0NCj4gdG9vbHMvaW5jbHVk
ZS94ZW4tdG9vbHMvY29tbW9uLW1hY3Jvcy5oIHwgMSArDQo+IHRvb2xzL2xpYnMvbGlnaHQvbGli
eGxfaW50ZXJuYWwuaCAgICAgICB8IDIgLS0NCj4gdG9vbHMvdGVzdHMveDg2X2VtdWxhdG9yL3g4
Ni1lbXVsYXRlLmggIHwgMyAtLS0NCj4gMyBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
NSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90b29scy9pbmNsdWRlL3hlbi10b29s
cy9jb21tb24tbWFjcm9zLmggYi90b29scy9pbmNsdWRlL3hlbi10b29scy9jb21tb24tbWFjcm9z
LmgNCj4gaW5kZXggZDUzYjg4MTgyNTYwLi4xNjg2OTFiZTBlOTMgMTAwNjQ0DQo+IC0tLSBhL3Rv
b2xzL2luY2x1ZGUveGVuLXRvb2xzL2NvbW1vbi1tYWNyb3MuaA0KPiArKysgYi90b29scy9pbmNs
dWRlL3hlbi10b29scy9jb21tb24tbWFjcm9zLmgNCj4gQEAgLTczLDYgKzczLDcgQEANCj4gI2Vu
ZGlmDQo+IA0KPiAjZGVmaW5lIE1BU0tfRVhUUih2LCBtKSAoKCh2KSAmIChtKSkgLyAoKG0pICYg
LShtKSkpDQo+ICsjZGVmaW5lIE1BU0tfSU5TUih2LCBtKSAoKCh2KSAqICgobSkgJiAtKG0pKSkg
JiAobSkpDQo+IA0KPiAjaWZuZGVmIF9fbXVzdF9jaGVjaw0KPiAjZGVmaW5lIF9fbXVzdF9jaGVj
ayBfX2F0dHJpYnV0ZV9fKChfX3dhcm5fdW51c2VkX3Jlc3VsdF9fKSkNCj4gZGlmZiAtLWdpdCBh
L3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfaW50ZXJuYWwuaCBiL3Rvb2xzL2xpYnMvbGlnaHQvbGli
eGxfaW50ZXJuYWwuaA0KPiBpbmRleCA4YWJhM2UxMzg5MDkuLjYxZjRmZTFkZWM1NSAxMDA2NDQN
Cj4gLS0tIGEvdG9vbHMvbGlicy9saWdodC9saWJ4bF9pbnRlcm5hbC5oDQo+ICsrKyBiL3Rvb2xz
L2xpYnMvbGlnaHQvbGlieGxfaW50ZXJuYWwuaA0KPiBAQCAtMTMyLDggKzEzMiw2IEBADQo+IA0K
PiAjZGVmaW5lIERJVl9ST1VORFVQKG4sIGQpICgoKG4pICsgKGQpIC0gMSkgLyAoZCkpDQo+IA0K
PiAtI2RlZmluZSBNQVNLX0lOU1IodiwgbSkgKCgodikgKiAoKG0pICYgLShtKSkpICYgKG0pKQ0K
PiAtDQo+ICNkZWZpbmUgTElCWExfX0xPR0dJTkdfRU5BQkxFRA0KPiANCj4gI2lmZGVmIExJQlhM
X19MT0dHSU5HX0VOQUJMRUQNCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3RzL3g4Nl9lbXVsYXRv
ci94ODYtZW11bGF0ZS5oIGIvdG9vbHMvdGVzdHMveDg2X2VtdWxhdG9yL3g4Ni1lbXVsYXRlLmgN
Cj4gaW5kZXggZGUxZjgyNjY4MDEwLi5hYTFlZDc1ZWM4OTAgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xz
L3Rlc3RzL3g4Nl9lbXVsYXRvci94ODYtZW11bGF0ZS5oDQo+ICsrKyBiL3Rvb2xzL3Rlc3RzL3g4
Nl9lbXVsYXRvci94ODYtZW11bGF0ZS5oDQo+IEBAIC01MSw5ICs1MSw2IEBADQo+ICNkZWZpbmUg
REVGSU5FX1BFUl9DUFUodHlwZSwgdmFyKSB0eXBlIHBlcl9jcHVfIyN2YXINCj4gI2RlZmluZSB0
aGlzX2NwdSh2YXIpIHBlcl9jcHVfIyN2YXINCj4gDQo+IC0jZGVmaW5lIE1BU0tfRVhUUih2LCBt
KSAoKCh2KSAmIChtKSkgLyAoKG0pICYgLShtKSkpDQo+IC0jZGVmaW5lIE1BU0tfSU5TUih2LCBt
KSAoKCh2KSAqICgobSkgJiAtKG0pKSkgJiAobSkpDQo+IC0NCj4gI2RlZmluZSBfX2luaXQNCj4g
I2RlZmluZSBfX21heWJlX3VudXNlZCBfX2F0dHJpYnV0ZV9fKChfX3VudXNlZF9fKSkNCj4gDQo+
IC0tIA0KPiAyLjMwLjINCj4gDQoNCg==

