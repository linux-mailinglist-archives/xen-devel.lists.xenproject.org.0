Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 765A56C43CC
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 08:03:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513105.793619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pesUx-0007Nn-H4; Wed, 22 Mar 2023 07:03:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513105.793619; Wed, 22 Mar 2023 07:03:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pesUx-0007L2-Du; Wed, 22 Mar 2023 07:03:03 +0000
Received: by outflank-mailman (input) for mailman id 513105;
 Wed, 22 Mar 2023 07:03:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxM9=7O=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pesUw-0007Kt-C0
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 07:03:02 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0608.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9471e09c-c87f-11ed-85db-49a42c6b2330;
 Wed, 22 Mar 2023 08:03:00 +0100 (CET)
Received: from DU2PR04CA0258.eurprd04.prod.outlook.com (2603:10a6:10:28e::23)
 by AS8PR08MB8393.eurprd08.prod.outlook.com (2603:10a6:20b:569::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 07:02:57 +0000
Received: from DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28e:cafe::32) by DU2PR04CA0258.outlook.office365.com
 (2603:10a6:10:28e::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Wed, 22 Mar 2023 07:02:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT010.mail.protection.outlook.com (100.127.142.78) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.17 via Frontend Transport; Wed, 22 Mar 2023 07:02:57 +0000
Received: ("Tessian outbound c2bcb4c18c29:v135");
 Wed, 22 Mar 2023 07:02:57 +0000
Received: from a6a2712a17c4.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 77F657A4-E69D-4B09-8E02-C54CD8C8DCCE.1; 
 Wed, 22 Mar 2023 07:02:51 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a6a2712a17c4.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 22 Mar 2023 07:02:51 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by GV2PR08MB9278.eurprd08.prod.outlook.com (2603:10a6:150:e1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 07:02:40 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6c10:9ef5:6e6d:56a3]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6c10:9ef5:6e6d:56a3%7]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 07:02:40 +0000
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
X-Inumbo-ID: 9471e09c-c87f-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vt6K8YXPVCTU62et5xXQBcb2D3BNDzhTqy4aWhR5wNc=;
 b=E4siJss+YPGNknm+ixwBPtoMTxQR/uDvVYJ5B3p06bWKkX9xjst2FnhmkVfmB/ZD2ZBFmurjFJ3pUFgxJ40JbvJg8PHKoah3MCTPBQVbJ/6KGEnyuvvfGaVt6Bvul7OSkPrAPtTenCcGFtRKpne3dRUb0jftXOyWC+3zKGmi1Cg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6098d7911aa1db06
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HKlyf6AdzKrn575jhDZ2edw6tZhPHqfASHf/RzkK6bhfxwlbg9BZDGqL7WmZcgoEg0CED9xCowvPFtW6qunrsp/6Am/oUJk/uvOQdqWd9v7+m4l2u/upKecsKBLb13vYhXTxq9PZjuYnAPholdI+FR6v8d4aU/jAssn2x4NH7nl1kjitAilcQUiUF/ubT8aIYxkQ77U0swd0koGsqAXNPAi+paFPTyAa1zdsta8MBUL5RlffVHZEg2DKOOeUdES6zZ1p6EiWyXJz+c9kwuGgOcrw1kOSAQPDdZIG+7cjnj+V8p4luZie0qa1XPv1DQL4RGLEaWLhUHdOuNUBAKEE7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vt6K8YXPVCTU62et5xXQBcb2D3BNDzhTqy4aWhR5wNc=;
 b=PVsIJwVsamnjcRXRoAynKHb057Hn4fn8h5JVhZuRCDPzEA1IxrImF+xJ1ITUN/QGvFTrHblIG1A5W6oD69oKr8yN+CWBQOXtonJjzAqsWdhDsuVOjd3DR2GsgkiqxLYvL1F1tMy8mpn9Fzx5A+gqt+If1UbkAjXqc0nUw2vdVoK/WiTxuJZuQYmSgrP27O2Jod1wRZ0IWZIT0sKHWTgzzEoRTWQmV0O573g/B0DOrJsouNbz/TYepX5XcHc1Ej5AoX0a55rfGt6iBcBU9gwWtTg6H+aps8kshQLMK79kFOwNCcxABEPAHGzaGxv6n2NmxIYRsL75CyPlD/KA6nyBWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vt6K8YXPVCTU62et5xXQBcb2D3BNDzhTqy4aWhR5wNc=;
 b=E4siJss+YPGNknm+ixwBPtoMTxQR/uDvVYJ5B3p06bWKkX9xjst2FnhmkVfmB/ZD2ZBFmurjFJ3pUFgxJ40JbvJg8PHKoah3MCTPBQVbJ/6KGEnyuvvfGaVt6Bvul7OSkPrAPtTenCcGFtRKpne3dRUb0jftXOyWC+3zKGmi1Cg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Christian Lindig <christian.lindig@cloud.com>
CC: =?utf-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, George Dunlap
	<george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Christian Lindig <christian.lindig@citrix.com>, David
 Scott <dave@recoil.org>, =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v3 08/10] tools: add physinfo arch_capabilities handling
 for Arm
Thread-Topic: [PATCH v3 08/10] tools: add physinfo arch_capabilities handling
 for Arm
Thread-Index: AQHZWNNJv7KxtCj5PE2Y2ezKy93ynK8DhO2AgALh9IA=
Date: Wed, 22 Mar 2023 07:02:40 +0000
Message-ID: <947E57EC-84AC-4B4E-8146-ADEC9FD518EF@arm.com>
References: <20230317131949.4031014-1-luca.fancellu@arm.com>
 <20230317131949.4031014-9-luca.fancellu@arm.com>
 <5C1E6204-51FD-4C97-8182-848F30A4A58B@cloud.com>
In-Reply-To: <5C1E6204-51FD-4C97-8182-848F30A4A58B@cloud.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|GV2PR08MB9278:EE_|DBAEUR03FT010:EE_|AS8PR08MB8393:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e831d7d-75a1-41be-319f-08db2aa37791
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 kcbKmQJTe2lHfO+7EBZ8PGep3MR6edv3M1U8wdfUQobq23WqgsIIhdDoxtPf4mENlJvkEZgimmy7FqmqTr58X/W5s5E+/sTy5IWJw0X3a/2isP5fSQg8oPqQO3o8e8zv8W8YeBEZST8gL7QjaLfT5KRlhKNpZHQlKZ0z7LhGzgKcarE5TcngiDcHqTXe2b3jsLj7pB/Up7wm+1gnqnQOVFZ7KJ8KFM5PWv47UFmvSDJyD3qKppSxYd1JadVaDK+hrRyVRQO2IA3KP4MMAmosgQAF7BMvXi1RTMkAer5tRQYs0gcaGCeCZvN4k3gyBPpbdeXLZUlXEjcbSxz3GLFPL+c32K5PBu+hfpUFQqv0q5AtbzIU+YQ81zAZ/36rdmzJ9do2TQuOoXb3pj4iFBNuLKFzWXemDsmBeTPlo5TIu4qCwaHcWJF9XPmTAx+XG6Y5+DXSLO5RgL1sDD/DibhL41wmG0TuPxenRuDe+HSRWmSM91FJ3sbm3AHAxRvzUvt1rV/JEnxaPWfTmvVu4ovhk0DCGVaJcYhHLsfGdxKjIYhqJ24MWz7Z1ipmZHVFBxnZ8s0fz2ZX/X8//1fDsRgOpQvTqcPVzFsf5wwIGOF2MHTlklHw5XRxT2kppQKGF6U5w0wHDK24+9H1Q3RnXngKE1asSkUOdMc2QY5S/1Ti0wmVS8h/f8jFYLTwgaq3nj/m/SZgN4Ms3XPWg8nBhwgZe+028NQ4wCoSKKFMYwkvhiA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(366004)(376002)(346002)(396003)(136003)(451199018)(66446008)(6512007)(6506007)(2616005)(26005)(6486002)(8676002)(53546011)(64756008)(316002)(186003)(71200400001)(66476007)(91956017)(54906003)(478600001)(76116006)(66946007)(6916009)(4326008)(7416002)(8936002)(4744005)(5660300002)(2906002)(122000001)(41300700001)(66556008)(38100700002)(38070700005)(86362001)(36756003)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2287D2772FCD184DA00BC7EA17E981C1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9278
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c8ee3ad7-bfab-4e2d-10d4-08db2aa36d41
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cge24kzpKf61OplpMhRHGjY4CZtVwX0PEetgug1IdMAgRC/F08oSqs4N295ZBH53U/KjqHx4JOjaZcbVF3MBFvXaAPTOcpRfGTr4yYP2LLQmusq4jVLK0z2qFC0iRq4KNTEFdz8ohB3yCdeDxoD9JbBgTLnzPFouTBOaX0dC4dDxZXyA30stLURkUDY7dfj06H1W8FMzqBewEMUdlRIPZtTKMmrGHk/Ki/zYRSxylEl9b2tBXD9JGi2nOPVcpRDZoI/KLUq4wArdUohM0iKSBoRSapLJf2vkIDz6U6QMs3DsKraREm4i6u+2o/SDjmD6AepEMickGQioQHFamTGUWRGd/UjPtzE0lKPvTNMXAeJIDE8jPBoeyvbP7nGCThNsfAdwuiw7TSDUNHIPk3F+MZ2lAWkzn+t+0a6QK04aTnNm83qWRu1jviOakWfJW6GFL6o3XdT6RElf39sE9Awnyq5zLH/LSY7VDlgdcmxqqWLX2akST498yJNwNAITKJBK+OXlC1Hoj9cgOgVdZWAAFh6A0xDlekQUTTwXG3o2Ou5eOblDTJtN684kBMY9GSF4/mPEX0jA91vB1XQ8AMWCYP151e7RPJuqCeEqlTwniEWLzx71EXaNazd03b/teAikHizKlIwfAHflOqnImz1dNKiiqAB+ziCFV+t8g5xpQBefY07+tuk+HLsnMw3KJK5bjyRxLneMhNpoN1qI7moVOA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(396003)(346002)(136003)(451199018)(36840700001)(40470700004)(46966006)(478600001)(6486002)(2616005)(47076005)(107886003)(336012)(316002)(70586007)(70206006)(8676002)(186003)(6506007)(26005)(53546011)(54906003)(4326008)(6862004)(36860700001)(4744005)(5660300002)(6512007)(41300700001)(8936002)(81166007)(2906002)(82740400003)(40460700003)(40480700001)(82310400005)(36756003)(86362001)(356005)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 07:02:57.7097
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e831d7d-75a1-41be-319f-08db2aa37791
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8393

DQoNCj4gT24gMjAgTWFyIDIwMjMsIGF0IDExOjAxLCBDaHJpc3RpYW4gTGluZGlnIDxjaHJpc3Rp
YW4ubGluZGlnQGNsb3VkLmNvbT4gd3JvdGU6DQo+IA0KPiANCj4gDQo+PiBPbiAxNyBNYXIgMjAy
MywgYXQgMTM6MTksIEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4gd3JvdGU6
DQo+PiANCj4+IA0KPj4gYXJjaF9jYXBfZmxhZ3MgPSBjYW1sX2FsbG9jX3NtYWxsKDEsIGFyY2hf
Y2FwX2ZsYWdzX3RhZyk7DQo+PiBTdG9yZV9maWVsZChhcmNoX2NhcF9mbGFncywgMCwgYXJjaF9j
YXBfbGlzdCk7DQo+PiBTdG9yZV9maWVsZChwaHlzaW5mbywgMTAsIGFyY2hfY2FwX2ZsYWdzKTsN
Cj4+ICsjZWxpZiBkZWZpbmVkKF9fYWFyY2g2NF9fKQ0KPj4gKyBTdG9yZV9maWVsZChwaHlzaW5m
bywgMTAsIFZhbF9pbnQoY19waHlzaW5mby5hcmNoX2NhcGFiaWxpdGllcykpOw0KPj4gKyNlbHNl
DQo+PiArIGNhbWxfZmFpbHdpdGgoIlVuaGFuZGxlZCBhcmNoaXRlY3R1cmUiKTsNCj4+ICsjZW5k
aWYNCj4+IA0KPiANCj4gSXMgdGhpcyBjb2RlIG92ZXJ3cml0aW5nIGFuIGV4aXN0aW5nIGVudHJ5
IHRoYXQgd2FzIGNvbXB1dGVkIGJ1dCBub3cgaXNu4oCZdCB1c2VkPyBJZiBzbywgc2hvdWxkIHRo
ZSBjb25kaXRpb25hbCBjb21waWxhdGlvbiBub3QgYXZvaWQgdGhpcz8NCg0KSGkgQ2hyaXN0aWFu
LA0KDQpJIGRvbuKAmXQgdW5kZXJzdGFuZCwgd2hhdCBlbnRyeSBpcyBiZWluZyBvdmVyd3JpdHRl
bj8gSWYgSSB1bmRlcnN0b29kIGl0IGNvcnJlY3RseSwgSeKAmW0gd3JpdGluZyB0aGUgcG9zaXRp
b24gMTAgb2YgcGh5c2luZm8NCndoaWNoIGlzIG5vdCB3cml0dGVuIGJlZm9yZS4NCg0KQ2hlZXJz
LA0KTHVjYQ0KDQo+IA0KPiDigJQgQw0KDQoNCg==

