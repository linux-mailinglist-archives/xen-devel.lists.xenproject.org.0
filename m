Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E6B669EBD
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 17:51:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477492.740217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGNGm-0001HU-JV; Fri, 13 Jan 2023 16:51:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477492.740217; Fri, 13 Jan 2023 16:51:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGNGm-0001FE-Gm; Fri, 13 Jan 2023 16:51:08 +0000
Received: by outflank-mailman (input) for mailman id 477492;
 Fri, 13 Jan 2023 16:51:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Kou=5K=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pGNGl-0001F8-Bc
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 16:51:07 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2054.outbound.protection.outlook.com [40.107.21.54])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76222831-9362-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 17:51:02 +0100 (CET)
Received: from FR0P281CA0015.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::20)
 by AS8PR08MB8136.eurprd08.prod.outlook.com (2603:10a6:20b:561::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Fri, 13 Jan
 2023 16:50:53 +0000
Received: from VI1EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:15:cafe::4b) by FR0P281CA0015.outlook.office365.com
 (2603:10a6:d10:15::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6023.6 via Frontend
 Transport; Fri, 13 Jan 2023 16:50:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT036.mail.protection.outlook.com (100.127.144.159) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Fri, 13 Jan 2023 16:50:52 +0000
Received: ("Tessian outbound 43b0faad5a68:v132");
 Fri, 13 Jan 2023 16:50:52 +0000
Received: from 3fcef95ad4d8.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8D287D5E-50E5-477C-A203-62FFAA9CC2EC.1; 
 Fri, 13 Jan 2023 16:50:41 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3fcef95ad4d8.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 13 Jan 2023 16:50:41 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS8PR08MB6551.eurprd08.prod.outlook.com (2603:10a6:20b:319::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Fri, 13 Jan
 2023 16:50:39 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda%3]) with mapi id 15.20.5986.018; Fri, 13 Jan 2023
 16:50:39 +0000
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
X-Inumbo-ID: 76222831-9362-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GohCHgT8xkSR18XtakrCSXvIqvzjUApH5r1DLvdgF2M=;
 b=2JLDmm/LEqIc8fakUBwA5MV/lTlXbM8GI12dkgARpUDqAGs1D02wF+eAQzJZwQDZFHWSqBE2n5F8PgtgHGOH4riK/tTfv4wvG3tDs1/HXnYgWD3LfvBCskSR6hHfldCCSeCTB1NDo+QiT2ZuVtbdLWqXWckKS47K/ZDSSKHHLPg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 308f1ba78188b80a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mXdbkkroSyIoq4e3ZLCzRRd9aomzJfxlp69Y3SIaH7HxajXRb3HLB93ZUfhLOR+9ONlepM3MzWRpfDOkxtph/l8Y29zB1/iUQcArALDZ6/tbCizXs5PxQl/asSYej48WKoF5YUaORs99XEj+cIPr/0a/4C3TVsulrYvhWgdhEvjuX0FiJfQjE11/ll/KCwBKw9Lp0KtLCuFcVXBXOsVJFb6NBTvx58qkiYGmuGwsEQvMmTaPfRc7lQEwB/2C4AFPt8zO5rC2j7l88QB5tmUhvFfQn/r0OrNffp2Jolf6F24B/eIJP9J6mgk02FpSAOZDZVC3HqGp+MWfKZRK3Z7JPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GohCHgT8xkSR18XtakrCSXvIqvzjUApH5r1DLvdgF2M=;
 b=SBdvnrsFSjUDTHmGwZGjbutWRHG3GTxVqyeWCkJDIdjGBXoY4dPscQ/sb+OsfhGZbvxKNwLfpQkw6fnyLaUXlP2yHmqIzx6EF9wdNG0ASOSpFbGCNrb/CmY8b/v1zYphUWZpI8OoY9dr5RfOaFsJB9TP334CVS/Srv35pk7AzXFowBrruieVWf+L/+rIjXOKq4jOplKyfCn10dmfO/XBHG5esieQHM+xXDJbHnRdjINRAshuPOm+ZHFKBzUOi5I3w51soV41SaVyPQ5WPsCFWRDmXgw8vr5wYXdGxX4iKpjVVajE9uS8NwLGnczxswnMpDBSoVdlkACFpeJrPd84xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GohCHgT8xkSR18XtakrCSXvIqvzjUApH5r1DLvdgF2M=;
 b=2JLDmm/LEqIc8fakUBwA5MV/lTlXbM8GI12dkgARpUDqAGs1D02wF+eAQzJZwQDZFHWSqBE2n5F8PgtgHGOH4riK/tTfv4wvG3tDs1/HXnYgWD3LfvBCskSR6hHfldCCSeCTB1NDo+QiT2ZuVtbdLWqXWckKS47K/ZDSSKHHLPg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 13/14] xen/arm64: mm: Rework switch_ttbr()
Thread-Topic: [PATCH v4 13/14] xen/arm64: mm: Rework switch_ttbr()
Thread-Index: AQHZJzoRxQQAKbugEU6tZrnWUCTSoK6cj9MA
Date: Fri, 13 Jan 2023 16:50:38 +0000
Message-ID: <0F9A8368-8C5F-4FFF-977D-2401BD81C39A@arm.com>
References: <20230113101136.479-1-julien@xen.org>
 <20230113101136.479-14-julien@xen.org>
In-Reply-To: <20230113101136.479-14-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.300.101.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS8PR08MB6551:EE_|VI1EUR03FT036:EE_|AS8PR08MB8136:EE_
X-MS-Office365-Filtering-Correlation-Id: b05b17e3-0c5a-4772-d096-08daf5865503
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 g+Q9Dk2nkrOySyaMrqTpIB+tDV6LFtOmcKY5yQvtbjrmu6ZipebS8EN6zhGyll/jprCOUSrYNu2WCzhGRAb8A2bplbqERYUOdD9+s0Xv2m0l+Eoy0qYqB5+ycuBEWaIihmtmYiWsiUTk1ez7rqmP150G5TJsrm1UIpkLPhzHRLaPjhiZSLDAdIEIX9VzzTmQZacV4mcIgmluvSGr9n0EMjy+JRZY3nzd6C/lqHn/MsIRc7z7NGRgxYeCefPGUWwjENndjaYUEmhLDbGhDgOcfU7U8bBxNrHQFNBD8dbEp8xv84q8Os6c/uYMsQPgoF3Q584JHzeHwZmYEwff2ttU6xz9ir2mVtbCVEzpqiUiNqWvJK27JS02kn2dOt7eeEZzLpOSFbWrwJQ0ZQ4yrAtav6GLJm/8hX3njyYQRVxT6HZgoAVLWmfYlml00Zpo1AIP/KrKVCraqhfqXQ4bPEYyLRjK54LbxXH4YoylLFgxviFBTUE94GUSBLtA9f2LPCOTwRhC0S9ZvOMANNl+LJh73OSmM2BR9wALqB8rCJTlScXHX51qvXLJDivzCQDfTDtANHKY1MDHqfGafbwl2iAvPXrRxMwxuHGjLhKs/2228GZHzGxE1Tza3nrZT+fvnueb5RkV77kNTgTbUYFVTfiRFEADI+snRvEQ/b9JTkALyxZxdo+5vUlysApG7rP3PzrIzXerXqIha3DrUEnevDnz2kmjGJYvxCQBp0AzbZIMTdU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(136003)(396003)(376002)(366004)(451199015)(6506007)(41300700001)(53546011)(86362001)(122000001)(83380400001)(6486002)(38100700002)(186003)(8936002)(6512007)(478600001)(26005)(66446008)(4326008)(5660300002)(66556008)(64756008)(91956017)(8676002)(66476007)(71200400001)(316002)(36756003)(38070700005)(6916009)(33656002)(54906003)(2906002)(66946007)(2616005)(76116006)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9199AC8108E1AC409927014928DAF4DF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6551
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	59062414-42c8-4d32-d1f4-08daf5864cd2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wls2u8B/FafCAkoexjXIiU39wl6gAW0UCbnklGwaRgVVg9+CkZIAx6g2Xwfd3pDTcFBoeLc1JZ4/Qu4Q+khhxF/4c1WDsWKuIkdhc7GjX9CTTwQtBB8Y28WR/MwfefjmaPUBR3jNW0eY+XoZjI6taqT5MhvRPRLsIkR3xBnZwoIoXhWSXx+GYzwZEKPEAxkUcQE5jkMpq1DvWxrGxj7cEMt/7+1TWztAv6DznJplkFjxUHVwhmwknC6k3LR0g+UQ9xx9kbBN2tzp8rcxS4mhthO6dirxJLu4pjKoOldNomzUCmhXeKSicQRd9B1xbRKxSkGbvnpOqDeixvf6X8O1fimkNDxNFqD32mBMtuQe/Kn/J9jv652Tx+UK/uywL8rkZdpAXyJ6RFzkrOprJTArtemXWh722Iu1b3gbSRK1v/vwjuSNq9HYkWFR6Xyujs99Lvbe2kkkBVZFpuNIorUagBqyE5euHhEQRMnrbGvRM/oqsNDacu1o89c0xsAkxy2Aox9qwr0FRsqDYP+5z5SYbWR3VhGtZaWN33oLVwOB3zBSqqa3e4zZca1Q0GdsLgR+DOWXGfNqNZQ8U40BVokN0EdckmuBKzUrwluHAlBzn4JuZ+Oo1cbsulckPnIVBPCW5GKPo5HKFUSHISXNAGncVzXIB/YAkxdZYasOhrOSunrT+wZ4x+bI5GdADlAPBuwcRNwH4L8f+P734u2q7qlfwA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(346002)(136003)(396003)(451199015)(40470700004)(36840700001)(46966006)(26005)(33656002)(82740400003)(6486002)(186003)(6512007)(478600001)(40480700001)(36860700001)(356005)(81166007)(107886003)(82310400005)(2906002)(53546011)(83380400001)(5660300002)(2616005)(54906003)(336012)(316002)(6506007)(6862004)(40460700003)(47076005)(70206006)(86362001)(70586007)(8676002)(4326008)(41300700001)(8936002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 16:50:52.5988
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b05b17e3-0c5a-4772-d096-08daf5865503
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8136

DQoNCj4gT24gMTMgSmFuIDIwMjMsIGF0IDEwOjExLCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IEZyb206IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+
DQo+IA0KPiBBdCB0aGUgbW9tZW50LCBzd2l0Y2hfdHRicigpIGlzIHN3aXRjaGluZyB0aGUgVFRC
UiB3aGlsc3QgdGhlIE1NVSBpcw0KPiBzdGlsbCBvbi4NCj4gDQo+IFN3aXRjaGluZyBUVEJSIGlz
IGxpa2UgcmVwbGFjaW5nIGV4aXN0aW5nIG1hcHBpbmdzIHdpdGggbmV3IG9uZXMuIFNvDQo+IHdl
IG5lZWQgdG8gZm9sbG93IHRoZSBicmVhay1iZWZvcmUtbWFrZSBzZXF1ZW5jZS4NCj4gDQo+IElu
IHRoaXMgY2FzZSwgaXQgbWVhbnMgdGhlIE1NVSBuZWVkcyB0byBiZSBzd2l0Y2hlZCBvZmYgd2hp
bGUgdGhlDQo+IFRUQlIgaXMgdXBkYXRlZC4gSW4gb3JkZXIgdG8gZGlzYWJsZSB0aGUgTU1VLCB3
ZSBuZWVkIHRvIGZpcnN0DQo+IGp1bXAgdG8gYW4gaWRlbnRpdHkgbWFwcGluZy4NCj4gDQo+IFJl
bmFtZSBzd2l0Y2hfdHRicigpIHRvIHN3aXRjaF90dGJyX2lkKCkgYW5kIGNyZWF0ZSBhbiBoZWxw
ZXIgb24NCj4gdG9wIHRvIHRlbXBvcmFyeSBtYXAgdGhlIGlkZW50aXR5IG1hcHBpbmcgYW5kIGNh
bGwgc3dpdGNoX3R0YnIoKQ0KPiB2aWEgdGhlIGlkZW50aXR5IGFkZHJlc3MuDQo+IA0KPiBzd2l0
Y2hfdHRicl9pZCgpIGlzIG5vdyByZXdvcmtlZCB0byB0ZW1wb3JhcmlseSB0dXJuIG9mZiB0aGUg
TU1VDQo+IGJlZm9yZSB1cGRhdGluZyB0aGUgVFRCUi4NCj4gDQo+IFdlIGFsc28gbmVlZCB0byBt
YWtlIHN1cmUgdGhlIGhlbHBlciBzd2l0Y2hfdHRicigpIGlzIHBhcnQgb2YgdGhlDQo+IGlkZW50
aXR5IG1hcHBpbmcuIFNvIG1vdmUgX2VuZF9ib290IHBhc3QgaXQuDQo+IA0KPiBUaGUgYXJtMzIg
Y29kZSB3aWxsIHVzZSBhIGRpZmZlcmVudCBhcHByb2FjaC4gU28gdGhpcyBpc3N1ZSBpcyBmb3Ig
bm93DQo+IG9ubHkgcmVzb2x2ZWQgb24gYXJtNjQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKdWxp
ZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPg0KDQpUaGUgc2VxdWVuY2UgbG9va3Mgb2sgdG8g
bWUsIGFsc28gdGhlIHJlYXNvbmluZyBhYm91dCBiYXJyaWVycyBhbmQNCnJlZ2lzdGVyIGRlcGVu
ZGVuY2llcyBkaXNjdXNzZWQgaW4gdGhlIHByZXZpb3VzIHZlcnNpb24uDQoNClJldmlld2VkLWJ5
OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQoNCknigJl2ZSBhbHNvIGJ1
aWx0IGZvciBhcm0zMi82NCBhbmQgdGVzdCB0aGlzIHBhdGNoIG9uIGZ2cCwgYm9vdGluZyBEb20w
DQphbmQgY3JlYXRpbmcvcnVubmluZy9kZXN0cm95aW5nIHNvbWUgZ3Vlc3RzDQoNClRlc3RlZC1i
eTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0KDQoNCg0K

