Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D824F939A
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 13:16:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301411.514389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncmaw-0003Gs-Gq; Fri, 08 Apr 2022 11:16:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301411.514389; Fri, 08 Apr 2022 11:16:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncmaw-0003E0-D6; Fri, 08 Apr 2022 11:16:02 +0000
Received: by outflank-mailman (input) for mailman id 301411;
 Fri, 08 Apr 2022 11:16:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2zQ4=US=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1ncmau-0003Du-Av
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 11:16:00 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0623.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43d23bf2-b72d-11ec-8fbc-03012f2f19d4;
 Fri, 08 Apr 2022 13:15:58 +0200 (CEST)
Received: from AM0PR04CA0063.eurprd04.prod.outlook.com (2603:10a6:208:1::40)
 by AS8PR08MB7282.eurprd08.prod.outlook.com (2603:10a6:20b:421::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 11:15:55 +0000
Received: from VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:1::4) by AM0PR04CA0063.outlook.office365.com
 (2603:10a6:208:1::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.25 via Frontend
 Transport; Fri, 8 Apr 2022 11:15:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT028.mail.protection.outlook.com (10.152.18.88) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.21 via Frontend Transport; Fri, 8 Apr 2022 11:15:54 +0000
Received: ("Tessian outbound 2d401af10eb3:v118");
 Fri, 08 Apr 2022 11:15:53 +0000
Received: from 272ac47fa801.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D12740C0-0A17-4A71-923B-7BCFA9A6C647.1; 
 Fri, 08 Apr 2022 11:15:43 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 272ac47fa801.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Apr 2022 11:15:43 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by AM6PR08MB3206.eurprd08.prod.outlook.com (2603:10a6:209:46::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.19; Fri, 8 Apr
 2022 11:15:33 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::c9b3:a7d5:f4ee:8c40]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::c9b3:a7d5:f4ee:8c40%5]) with mapi id 15.20.5144.025; Fri, 8 Apr 2022
 11:15:33 +0000
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
X-Inumbo-ID: 43d23bf2-b72d-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+83DT/uAtdMxoQzYy0KHyrfyw7jZqiTUrnK7IvFHIbM=;
 b=qh1C5Q3HAcfMgGTJeqg87iiOqFxX5vQvzLDqrXX2+JLxDcOVg91tA3AVKxMKMZTPI0/QBivpmweSxDEMcKWX3Dsk4iyA41s1vS6MAkvAVkBTzmmelINUnQ0TTD0YEy8fr9TOAFaa6Z2kPzbdWfiCddr2u+XNp4dYtyoVvNP0y5g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8e9ddf363c0633d0
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JnLMPAYyztF9jSp0JFykN+DulAzCEZIr01ynTeMvMMdSJnMVilNQwU7xolG+1ydf6wqx3IJa5oidW6NDIAjxCNY5mfGLFZBP26Ao8w9byStfAWlu6t7QqiWhX6qqCaT/juK8DefLtJ/e1OXpUsY/8cjo30GFsibZvsisqe0NA+T1QgYrvmxV92oCQRUoosUHViZaxeRBxLBE22IfcYbmmrZoB1zoSDNTAJ/iwKEo8v5uQU859K0+37Nd/WCskQXOTZbJcP0UdscHINJ/JC/jDibakmAo0zOvjdAfR+ZypfUXMid95Eehpk6erkBfULtd9pPTQgpzH6RPh0TwzqpTWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+83DT/uAtdMxoQzYy0KHyrfyw7jZqiTUrnK7IvFHIbM=;
 b=ljPj/ZBszVJ4zLzbEpF3TdM8OVqSgOvraz9IMU4CcoJJ/eeDDDnI86S3EtOYnmz79xbLgL58ng3+nF72wvxoUquesppLp6rxFADlcF6zY1/mWrokOaJR4sDz2PbprQzmE6dX/1jCkD7YN+PWtnp2I/h+20Mg8IGwpxcJRvnArlFqSA+Ft+t7dB37xeHnDdYOFhMO5aQJW6YP0W2iKWgjyhd3MgclJjLNu4KUUOAVK+AktqXKQuY3YtOjGC26/fuVcUQ6ncrXW7IJc0sBXXAZE1Vo5JFZmbH7zWUnPH5w5RjkATc+4rvWgUWFG4xTTc/a6H3ZjWbclNG8V9b3Oieilg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+83DT/uAtdMxoQzYy0KHyrfyw7jZqiTUrnK7IvFHIbM=;
 b=qh1C5Q3HAcfMgGTJeqg87iiOqFxX5vQvzLDqrXX2+JLxDcOVg91tA3AVKxMKMZTPI0/QBivpmweSxDEMcKWX3Dsk4iyA41s1vS6MAkvAVkBTzmmelINUnQ0TTD0YEy8fr9TOAFaa6Z2kPzbdWfiCddr2u+XNp4dYtyoVvNP0y5g=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Juergen Gross <jgross@suse.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 5/6] arm/dom0less: assign dom0less guests to cpupools
Thread-Topic: [PATCH v6 5/6] arm/dom0less: assign dom0less guests to cpupools
Thread-Index: AQHYSyUS0CLVSvR2nk+ITbzc2Ry0wKzlusgAgAAH7oCAAAy5gIAADjGA
Date: Fri, 8 Apr 2022 11:15:33 +0000
Message-ID: <61DEEA58-E570-4FEF-9B71-27316C7F8D7C@arm.com>
References: <20220408084517.33082-1-luca.fancellu@arm.com>
 <20220408084517.33082-6-luca.fancellu@arm.com>
 <d8c2e194-be59-f7d7-fcc6-9ef7a06ffd1c@suse.com>
 <16C482BB-BC45-4BD3-8357-87AA942F4D14@arm.com>
 <cacbaa1c-8ae8-9314-9364-97e5a53d876b@suse.com>
In-Reply-To: <cacbaa1c-8ae8-9314-9364-97e5a53d876b@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 5abff261-8e40-4f9b-a2a0-08da195125c8
x-ms-traffictypediagnostic:
	AM6PR08MB3206:EE_|VE1EUR03FT028:EE_|AS8PR08MB7282:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB72829207B6D47E7F6A9C6DF8E4E99@AS8PR08MB7282.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Mg+BBjrQ0yMKWTrJa2aBfqRLfpSK9JyNGrXi1VucM2w6iqPlHwVXmWdF0B9rWCKWYXj+khTsAkwgFbNqQGSTcdlFp9HgrpQwp8fpO4/7z2Jy0w0VjzTyjM5Bt4S8TG7NTDr0Irh8Ap0ijW161lZnHvrPbRvXSZVD6YHJsZ1I1dlckGCFm04yWIKe8CtkGtbYOg9x8FiSahKA9sfLlJTKvZSl1xmlrIQoUs6nTsc1CRGS3BjQ2EasPqOSxl7xNY05H6Nhdsb5REmpcTD2pISylIGHIh41i4BgcKr6qN/T+tURoyGGQD+2si26GFqDPN1XP7/AMWY59aBWd5AArjWlbZ/dyToLh56iOZeI7p7f1tseGgXTu+ju7STPNLC9DqFUrHgjZczWlyVDIY443fhcZ2ievnnIhtarBu/Wz8hppUF3CIDGqlsxjLzQIPFxD2ZEGrPg0yhsEYrSqS+h3S4orU4IQ4hEwnV/yWTjoXTN+9vO1Tw7VqJ6uC9chXjekvdVO3Vrkfno5DlTT7ab3TlFCMjo3NF0p/txSClysXO3dZwb4msulYex68KnMzdZQ8GMqpMvMfKzPoVZYmGINPe9dgCllTnBzDaZ2U+gLbMNX6Cxj++muo7hgFrZbYM6i3mwvn6eu3vUS9VZZw9Mu6Jv0BH0e+dkY6xuh6mqgw712B6Trms0VZmmDM2Y6nv/tRJreZ67UGMbB9Yx51RFLzj0cNgGg8SRXmrxTtmF78pjQO7zkEMWTWVuy/JVy6yz9Ccm6yPIYopz8ai2mkRic3fFDQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66476007)(6486002)(71200400001)(66946007)(6916009)(91956017)(64756008)(66446008)(2906002)(4326008)(8936002)(76116006)(8676002)(316002)(86362001)(33656002)(54906003)(66574015)(2616005)(66556008)(122000001)(26005)(38070700005)(5660300002)(186003)(508600001)(38100700002)(36756003)(6512007)(53546011)(6506007)(83380400001)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6DED4A989765B74796FB0CD6515C8B15@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3206
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a6bf91cd-32a8-4ebb-b3eb-08da19511926
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MiXgpCa4h9IFYac0ag00NBrLRj5xcxRjx9G+7ufwpUB2RJSzY3zrbidoLzbQjtkSYQgXo4NRuqqnmTBcVmtqkeLUrL+tdzPFbNClIi2r+LvoIMOm+zagDbJlPVCd8c9s8Lgb4tZFqVT1KQCNMp27vzbGKp5DgvUnNoYmPW51xvzYsH4XMRMdbPWKecukE7s6ghYHMa3BkJfu4EjZ+uUXvjDPPMME6CbtVVi/5Z7UKTM0kGTlXDsFk7zyWZq3hVZZsnqsvdoprkX3+s+crVmMumDz9nZ7BmR4C8iJ750h7/O5uf2BN+kpYpOkQY8tv2oC0Ja1pEL2mRZoPc1EQQnCTZBSUYT33D6SxdsUWfl9HDNzeAi9tFeUHtwGt5KWwubumfMQVrHqD4clpU8hcbCFW+JJbD6gUtNMU9OP5BTToOyL4UVg0nghRtpL3iKh3V7BQ3NrY1lKf3SWkZC9IOk4ueqjQeD8FFsU6en5HVwj7MpjU/ra3jtq4yTXJ5MtBT35NPEwd43jL1tMAeY6iG5Hvcgu6y6QK/LmpfkxNJ6/Cabv6iUW0coAenmKpqeSCI82BY7jPt5OdSHkI6L1Kj/+CqjXhpzdTOlh++FhOOQlOsigED8oweT2ixsCJ6fVnZj0/bPvGsjdV/GS0MBZFFhyHUBa1pxJjcHmJPoM7wlF1g4VH+j6TxAoCDXbxTwlYBW6xQ1Cd6GE7iwJ7UkaTPpJkQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(36756003)(508600001)(70206006)(26005)(2616005)(70586007)(83380400001)(336012)(82310400005)(33656002)(66574015)(6506007)(186003)(6512007)(47076005)(36860700001)(356005)(53546011)(6486002)(86362001)(316002)(2906002)(8936002)(5660300002)(54906003)(6862004)(8676002)(81166007)(4326008)(40460700003)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 11:15:54.2203
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5abff261-8e40-4f9b-a2a0-08da195125c8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7282

DQoNCj4gT24gOCBBcHIgMjAyMiwgYXQgMTE6MjQsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAwOC4wNC4yMDIyIDExOjM5LCBMdWNhIEZhbmNlbGx1IHdy
b3RlOg0KPj4gDQo+PiANCj4+PiBPbiA4IEFwciAyMDIyLCBhdCAxMDoxMCwgSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+PiANCj4+PiBPbiAwOC4wNC4yMDIyIDEwOjQ1
LCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4+PiBAQCAtMTA2LDYgKzEwNiw4IEBAIHN0cnVjdCB4
ZW5fZG9tY3RsX2NyZWF0ZWRvbWFpbiB7DQo+Pj4+IC8qIFBlci12Q1BVIGJ1ZmZlciBzaXplIGlu
IGJ5dGVzLiAwIHRvIGRpc2FibGUuICovDQo+Pj4+IHVpbnQzMl90IHZtdHJhY2Vfc2l6ZTsNCj4+
Pj4gDQo+Pj4+ICsgdWludDMyX3QgY3B1cG9vbF9pZDsNCj4+PiANCj4+PiBUaGlzIGNvdWxkIGRv
IHdpdGggYSBjb21tZW50IGV4cGxhaW5pbmcgZGVmYXVsdCBiZWhhdmlvci4gSW4gcGFydGljdWxh
cg0KPj4+IEkgd29uZGVyIHdoYXQgMCBtZWFuczogTG9va2luZyBhdCBjcHVwb29sX2Rlc3Ryb3ko
KSBJIGNhbid0IHNlZSB0aGF0IGl0DQo+Pj4gd291bGQgYmUgaW1wb3NzaWJsZSB0byBkZWxldGUg
cG9vbCAwIChidXQgdGhlcmUgbWF5IG9mIGNvdXJzZSBiZQ0KPj4+IHJlYXNvbnMgZWxzZXdoZXJl
LCBlLmcuIHByZXZlbnRpbmcgcG9vbCAwIHRvIGV2ZXIgZ28gZW1wdHkpIC0gSsO8cmdlbj8NCj4+
PiBZZXQgaWYgcG9vbCAwIGNhbiBiZSByZW1vdmVkLCB6ZXJvIGJlaW5nIHBhc3NlZCBpbiBoZXJl
IHNob3VsZCBpbW8gbm90DQo+Pj4gbGVhZCB0byBmYWlsdXJlIG9mIFZNIGNyZWF0aW9uLiBPdG9o
IEkgdW5kZXJzdGFuZCB0aGF0IHRoaXMgd291bGQNCj4+PiBhbHJlYWR5IGhhcHBlbiBhaGVhZCBv
ZiB5b3VyIGNoYW5nZSwgcHJldmVudGluZyBvZiB3aGljaCB3b3VsZA0KPj4+IGFwcGFyZW50bHkg
cG9zc2libGUgb25seSB2aWEgcGFzc2luZyBDUFVQT09MSURfTk9ORSBoZXJlLg0KPj4gDQo+PiBQ
b29sLTAgY2Fu4oCZdCBiZSBlbXB0aWVkIGJlY2F1c2UgRG9tMCBpcyBzaXR0aW5nIHRoZXJlICh0
aGUgcGF0Y2ggaXMgbW9kaWZ5aW5nDQo+PiBjcHVwb29sX2lkIG9ubHkgZm9yIERvbVVzKS4NCj4g
DQo+IEJ1dCB3ZSdyZSB0YWxraW5nIGFib3V0IGRvbTBsZXNzIGFzIHBlciB0aGUgc3ViamVjdCBv
ZiB0aGUgcGF0Y2ggaGVyZS4NCg0KRG9tYWlucyBzdGFydGVkIHVzaW5nIGRvbTBsZXNzIGZlYXR1
cmUgYXJlIG5vdCBwcml2aWxlZ2VkIGFuZCBjYW7igJl0IGRvIGFueSBvcGVyYXRpb24NCm9uIGNw
dSBwb29scywgdGhhdOKAmXMgd2h5IEkgdGhvdWdodCBhYm91dCBEb20wLg0KDQo+IA0KPj4gSSB0
aG91Z2h0IHRoZSBuYW1lIHdhcyBzZWxmIGV4cGxhbmF0b3J5LCBidXQgaWYgSSBoYXZlIHRvIHB1
dCBhIGNvbW1lbnQsIHdvdWxkDQo+PiBJdCB3b3JrIHNvbWV0aGluZyBsaWtlIHRoYXQ6DQo+PiAN
Cj4+IC8qIENwdXBvb2wgaWQgd2hlcmUgdGhlIGRvbWFpbiB3aWxsIGJlIGFzc2lnbmVkIG9uIGNy
ZWF0aW9uICovDQo+IA0KPiBJIGRvbid0IHZpZXcgdGhpcyBraW5kIG9mIGNvbW1lbnQgYXMgbmVj
ZXNzYXJ5LiBJIHdhcyByZWFsbHkgYWZ0ZXINCj4gY2FsbGluZyBvdXQgZGVmYXVsdCBiZWhhdmlv
ciwgYWxvbmcgdGhlIGxpbmVzIG9mICIwIHRvIGRpc2FibGUiIHRoYXQNCj4geW91IGNhbiBzZWUg
aW4gcGF0Y2ggY29udGV4dC4NCg0KT2ssIGNvdWxkIHRoaXMgd29yaz8NCg0KLyogRG9tYWluIGNw
dXBvb2wgaWQgb24gY3JlYXRpb24uIERlZmF1bHQgMCBhcyBQb29sLTAgaXMgYWx3YXlzIHByZXNl
bnQuICovDQoNCj4gDQo+IEphbg0KDQo=

