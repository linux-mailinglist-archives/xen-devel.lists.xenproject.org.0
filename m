Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C78A4CB3E9
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 02:06:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282648.481434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPZum-00048i-DC; Thu, 03 Mar 2022 01:05:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282648.481434; Thu, 03 Mar 2022 01:05:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPZum-00046v-4r; Thu, 03 Mar 2022 01:05:56 +0000
Received: by outflank-mailman (input) for mailman id 282648;
 Thu, 03 Mar 2022 01:05:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HbtR=TO=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nPZuk-00046p-DL
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 01:05:54 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20631.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11377db3-9a8e-11ec-8eba-a37418f5ba1a;
 Thu, 03 Mar 2022 02:05:51 +0100 (CET)
Received: from AS9PR04CA0045.eurprd04.prod.outlook.com (2603:10a6:20b:46a::15)
 by AM6PR08MB4023.eurprd08.prod.outlook.com (2603:10a6:20b:a6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Thu, 3 Mar
 2022 01:05:49 +0000
Received: from VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46a:cafe::2e) by AS9PR04CA0045.outlook.office365.com
 (2603:10a6:20b:46a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Thu, 3 Mar 2022 01:05:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT012.mail.protection.outlook.com (10.152.18.211) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.22 via Frontend Transport; Thu, 3 Mar 2022 01:05:48 +0000
Received: ("Tessian outbound 63bb5eb69ee8:v113");
 Thu, 03 Mar 2022 01:05:48 +0000
Received: from 88c9726fdbe2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9875AD53-326C-4885-980F-8AF02F8EFAA1.1; 
 Thu, 03 Mar 2022 01:05:42 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 88c9726fdbe2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 03 Mar 2022 01:05:42 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AM0PR08MB4339.eurprd08.prod.outlook.com (2603:10a6:208:142::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 01:05:40 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::89b3:80a2:2b58:f1aa]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::89b3:80a2:2b58:f1aa%4]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 01:05:39 +0000
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
X-Inumbo-ID: 11377db3-9a8e-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7RTWfZctXhAoa06mMdMsSAwm5WCA7tHVDO1sXwXRxRo=;
 b=eVJoRjvFp1ebH5VodMZbV/HsjzT2cFjIYZvqUgPsh8udpTHVBj0JDujHMzrFza7+okmCQ/CMbdxO1eb60x5LmzWyA6N7H20jX+jcMnoBdwfp+1u1DCYQYR3YhMD0/LUtNiYrVUR5ER+pXYJy9VqXxoMPfd9W5Z+f0Vdka7vj7Hs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L7GQwkWNRKumhGvPk4YbZ0ELjyrwd/wxmQimaRGXhSQnrr+uvbWQWFSBIWaBcpaubkNq6o84X6uKo87DpC1fCUPOpQuKSlUW/56OOkjGPa+KcOpLOIgO3YuyXQ97asGaer4FM/XDKmliVteMVGQHett0xLP+J+w/Lh/HY482ZI6wPpc2tRSWiJwvMKgo9ssprlsiCR7A8HNcVqvDW2SxTk6uPvoxNFRSzMXRHkQ8qnLiopSeFiTVArHE6eJBhN0fQycE4P939lzGtaBSzZAtN5qQwaJjkWqAd4YCrAOe8EZe5cH4D/wE5ayTLXF2XFtX9RO4fd8p6TGsbnE8U5oivw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7RTWfZctXhAoa06mMdMsSAwm5WCA7tHVDO1sXwXRxRo=;
 b=nNgByuHo/QuJtgDbVfALyinqSHBbWy14p89NBi2P8ody7kIqBRWXloNEZGpNJxnjImWxd7DiwhFPbbL70Qbv/cnSz/ayAEChUfwCnusM2YRjMTZgEQwBhps85I3EDv58ne5vJPnvfAFksEzJOfwHY0Sknfj7LsYzy2K2WJceXd8agos2o+2/s/ryHHr5n4yaQHZJ+ojs2cfT5pMJ+evET65j0+TYvSgDJvaeju982MwUIegsG/zAjNZwBW+//61VxNbl4thuxg5YMboHCZpYhiwj4iH2npyLVLAFxOzCuMwX9NTJnidAnskbY/x+FJHcZsGdc2J3islbXmfd9eUrnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7RTWfZctXhAoa06mMdMsSAwm5WCA7tHVDO1sXwXRxRo=;
 b=eVJoRjvFp1ebH5VodMZbV/HsjzT2cFjIYZvqUgPsh8udpTHVBj0JDujHMzrFza7+okmCQ/CMbdxO1eb60x5LmzWyA6N7H20jX+jcMnoBdwfp+1u1DCYQYR3YhMD0/LUtNiYrVUR5ER+pXYJy9VqXxoMPfd9W5Z+f0Vdka7vj7Hs=
From: Wei Chen <Wei.Chen@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, Henry Wang
	<Henry.Wang@arm.com>, nd <nd@arm.com>
Subject: RE: Proposal for Porting Xen to Armv8-R64 - DraftA
Thread-Topic: Proposal for Porting Xen to Armv8-R64 - DraftA
Thread-Index:
 AdgpQxtXwh7LkfydTgiYk9bhMgU+ogAn0mUAABEK2UAAHxozAACs/mTQABukuQAADud+gAAh4EYAAARjx9A=
Date: Thu, 3 Mar 2022 01:05:38 +0000
Message-ID:
 <PAXPR08MB742017360AAF65AC2CCB1DF49E049@PAXPR08MB7420.eurprd08.prod.outlook.com>
References:
 <PAXPR08MB7420A01809B84E04E196793F9E3D9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2202241606450.239973@ubuntu-linux-20-04-desktop>
 <AS1PR08MB74269923288B75097392BDD99E3E9@AS1PR08MB7426.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2202251214210.239973@ubuntu-linux-20-04-desktop>
 <PAXPR08MB742081D5E3C94801350C4A739E029@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2203011455500.3261@ubuntu-linux-20-04-desktop>
 <PAXPR08MB74201779FC92E734A5107B769E039@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2203021454090.3261@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2203021454090.3261@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 5F30937351ED27478F2F62DFDCB73C5F.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 7e829b67-e16c-464c-9c0a-08d9fcb1f42a
x-ms-traffictypediagnostic:
	AM0PR08MB4339:EE_|VE1EUR03FT012:EE_|AM6PR08MB4023:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB402355108A154FBE0DDC08019E049@AM6PR08MB4023.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 RHEZNvhE1sSn85W1xyMNjVfFtMHEPkjOgMH1zua8PNvaWQJGF9vA0x/Z330ZhGXWfZcM1wWs/0n6/hqyqrL2u1VUlNERY62LdbRvoSKMHcLofAwrJlMNW4DcdxIPDKKeuCgqTyO0cGsXCl9mauGKdgGYUDq/n1gAUq/DbVxE6NpCD1zdjY75q/WvbNI8ZiZqykGBCUnup9EAxBYFnf558PzGnEjBXZtfcGxfYVkPMMI2noJmMNUs+tU9GI6LDZorhDUvtYIZpmYyBRXVWqCe2aAKBzWHeeCjhba31GiN9/CIqGQssLEZ4v91rX6HMP0CEjXlt8KFiXJ7JZpF1RmRRo0mjQ6gB7OMNAodUSIKD0ZuS1VRxjVW9ni/tBsovffZrcViLkKu+JLMuUXgTg7pa8mXCjDsJnTsYRYI7UC2K5Vg9EVMF64twDgrmOjdXtA8UrRDUUS3YnD0QLQJnOCwMzuS96P9gFctsgzKvuB4BF0q33gkdbj6OFSj2Vgzh/31Ldvlk5GwZbYhIFApMfjzEpfhq0YAlUaDmtzWRAHdfoKzD5RWwUQzafhjsSnU+Ot4p3SejWe1eOdS/K/G+HaJm07N1GiFx9ia07qjznn1MF1VFQGxmtw4SkKPBK1OdQesQ9pgToeby2OrFirxAr2B8sJHbA4dScCKR+7xVMfF/cFnt0Udya+Juep2b4OO3uCZt1cfjhIWUN+ZyWUiWwKHYw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(52536014)(5660300002)(38100700002)(186003)(122000001)(4326008)(55016003)(8676002)(2906002)(66946007)(76116006)(66476007)(66556008)(66446008)(64756008)(26005)(53546011)(6506007)(7696005)(83380400001)(316002)(38070700005)(86362001)(6916009)(54906003)(71200400001)(9686003)(33656002)(508600001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4339
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9e3c3d70-6073-41f8-31a6-08d9fcb1eef8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lym0qVbSUt1ChKa+JIjj7CBN9zQUI5IdLfp1f1XrzR5aoda2hsoA9e97F7OztPtdoxyWJ9a6fWFdXpcJ0kuXRtel0xK8Dv4GGOOMXQCqI8BWgx7huwGilRcotwNkK0CGDRDh2qqXmhgpU+0CK1uBwneWWXsbcyvudf07aAzMi/pUWsINmFs5fKeK4WYWPSY2dOcnjhlaDpnx25FOygmW/Kf7ddPPZSIWgZ0ImfReZFFqjXFGmtcHIF067amG66OI41+1RWFA+XI9gluwFNe3ujUnykpiTnVYlK9L077GrSR6denuIvB2oSTysbORXGobdp2K5jT+ZH9xb7F0IXE7Wq1FiKfJ5245UWnAMBAGJiufvkdJ0Wuri6GVMRbl+OyhEKXlFFBNNvNyUef2yXpMP0aMsjE6sOHS3DpWotoFyFekA0AR3eGsLCopIDlqVTN4zU1owp/5dkNJf6oewUHaIhI8MgKGVR+Xb1FxtL6/6pScB8khC6EeBw4IAslRZRfu776vFodp/xCzn98NQ2EUVzyp9XgyRMER1IHFR4Cxs1BxDGqUB1Xva73s5/N/4OppK8DCPWiVxuksqRxH4e8V7tMbOR6Cv/cN7+ZJZammbu9W2P7US+LKVuwRiB7bi0UxDBK8LwDu2rf5tP9y5/lV8hsNBAPaX35PXQrft0n3uevEULIipvvST4htTNCTi19I
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(53546011)(9686003)(356005)(81166007)(336012)(7696005)(6506007)(47076005)(36860700001)(2906002)(40460700003)(186003)(33656002)(26005)(82310400004)(5660300002)(70206006)(70586007)(52536014)(8676002)(4326008)(6862004)(86362001)(55016003)(508600001)(8936002)(83380400001)(54906003)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 01:05:48.4073
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e829b67-e16c-464c-9c0a-08d9fcb1f42a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4023

SGkgU3RlZmFubywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMjLlubQz
5pyIM+aXpSA2OjU2DQo+IFRvOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT4NCj4gQ2M6IFN0
ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IHhlbi0NCj4gZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmc7IGp1bGllbkB4ZW4ub3JnOyBCZXJ0cmFuZCBNYXJxdWlzDQo+
IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYXJt
LmNvbT47IEhlbnJ5IFdhbmcNCj4gPEhlbnJ5LldhbmdAYXJtLmNvbT47IG5kIDxuZEBhcm0uY29t
Pg0KPiBTdWJqZWN0OiBSRTogUHJvcG9zYWwgZm9yIFBvcnRpbmcgWGVuIHRvIEFybXY4LVI2NCAt
IERyYWZ0QQ0KPiANCj4gT24gV2VkLCAyIE1hciAyMDIyLCBXZWkgQ2hlbiB3cm90ZToNCj4gPiA+
ID4gPiA+ID4gSWYgbm90LCBhbmQgY29uc2lkZXJpbmcgdGhhdCB3ZSBoYXZlIHRvIGdlbmVyYXRl
DQo+ID4gPiA+ID4gPiA+IEFSTV9NUFVfKl9NRU1PUllfU1RBUlQvRU5EIGFueXdheSBhdCBidWls
ZCB0aW1lLCB3b3VsZCBpdCBtYWtlDQo+ID4gPiBzZW5zZQ0KPiA+ID4gPiA+IHRvDQo+ID4gPiA+
ID4gPiA+IGFsc28gZ2VuZXJhdGUgbXB1LGd1ZXN0LW1lbW9yeS1zZWN0aW9uLCB4ZW4sc3RhdGlj
LW1lbSwgZXRjLg0KPiBhdA0KPiA+ID4gYnVpbGQNCj4gPiA+ID4gPiA+ID4gdGltZSByYXRoZXIg
dGhhbiBwYXNzaW5nIGl0IHZpYSBkZXZpY2UgdHJlZSB0byBYZW4gYXQgcnVudGltZT8NCj4gPiA+
ID4gPiA+ID4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBEaWQgeW91IG1lYW4gd2Ugc3RpbGwg
YWRkIHRoZXNlIGluZm9ybWF0aW9uIGluIGRldmljZSB0cmVlLCBidXQNCj4gZm9yDQo+ID4gPiA+
ID4gYnVpbGQNCj4gPiA+ID4gPiA+IHRpbWUgb25seS4gSW4gcnVudGltZSB3ZSBkb24ndCBwYXJz
ZSB0aGVtPw0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gWWVzLCBzb21ldGhpbmcgbGlrZSB0aGF0LCBi
dXQgc2VlIGJlbG93Lg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gV2hhdCdz
IHRoZSB2YWx1ZSBvZiBkb2luZyBBUk1fTVBVXypfTUVNT1JZX1NUQVJUL0VORCBhdCBidWlsZA0K
PiB0aW1lDQo+ID4gPiBhbmQNCj4gPiA+ID4gPiA+ID4gZXZlcnl0aGluZyBlbHNlIGF0IHJ1bnRp
bWU/DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gQVJNX01QVV8qX01FTU9SWV9TVEFSVC9FTkQg
aXMgZGVmaW5lZCBieSBwbGF0Zm9ybS4gQnV0IG90aGVyDQo+IHRoaW5ncw0KPiA+ID4gYXJlDQo+
ID4gPiA+ID4gPiB1c2VycyBjdXN0b21pemVkLiBUaGV5IGNhbiBjaGFuZ2UgdGhlaXIgdXNhZ2Ug
d2l0aG91dCByZWJ1aWxkDQo+IHRoZQ0KPiA+ID4gaW1hZ2UuDQo+ID4gPiA+ID4NCj4gPiA+ID4g
PiBHb29kIHBvaW50Lg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gV2UgZG9uJ3Qgd2FudCB0byBoYXZl
IHRvIHJlYnVpbGQgWGVuIGlmIHRoZSB1c2VyIHVwZGF0ZWQgYSBndWVzdA0KPiA+ID4ga2VybmVs
LA0KPiA+ID4gPiA+IHJlc3VsdGluZyBpbiBhIGxhcmdlciBib290LW1vZHVsZS1zZWN0aW9uLg0K
PiA+ID4gPiA+DQo+ID4gPiA+ID4gU28gSSB0aGluayBpdCBtYWtlcyBzZW5zZSB0aGF0ICJtcHUs
Ym9vdC1tb2R1bGUtc2VjdGlvbiIgaXMNCj4gZ2VuZXJhdGVkDQo+ID4gPiBieQ0KPiA+ID4gPiA+
IHRoZSBzY3JpcHRzIChlLmcuIEltYWdlQnVpbGRlcikgYXQgYnVpbGQgdGltZSwgYW5kIFhlbiBy
ZWFkcyB0aGUNCj4gPiA+ID4gPiBwcm9wZXJ0eSBhdCBib290IGZyb20gdGhlIHJ1bnRpbWUgZGV2
aWNlIHRyZWUuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBJIHRoaW5rIHdlIG5lZWQgdG8gZGl2aWRl
IHRoZSBpbmZvcm1hdGlvbiBpbnRvIHR3byBncm91cHM6DQo+ID4gPiA+ID4NCj4gPiA+ID4gPg0K
PiA+ID4gPiA+ICMgR3JvdXAxOiBib2FyZCBpbmZvDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBUaGlz
IGluZm9ybWF0aW9uIGlzIHBsYXRmb3JtIHNwZWNpZmljIGFuZCBpdCBpcyBub3QgbWVhbnQgdG8N
Cj4gY2hhbmdlDQo+ID4gPiA+ID4gZGVwZW5kaW5nIG9uIHRoZSBWTSBjb25maWd1cmF0aW9uLiBJ
ZGVhbGx5LCB3ZSBidWlsZCBYZW4gZm9yIGENCj4gPiA+IHBsYXRmb3JtDQo+ID4gPiA+ID4gb25j
ZSwgdGhlbiB3ZSBjYW4gdXNlIHRoZSBzYW1lIFhlbiBiaW5hcnkgdG9nZXRoZXIgd2l0aCBhbnkN
Cj4gPiA+IGNvbWJpbmF0aW9uDQo+ID4gPiA+ID4gb2YgZG9tMC9kb21VIGtlcm5lbHMgYW5kIHJh
bWRpc2tzLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gVGhpcyBraW5kIG9mIGluZm9ybWF0aW9uIGRv
ZXNuJ3QgbmVlZCB0byBiZSBleHBvc2VkIHRvIHRoZSBydW50aW1lDQo+ID4gPiA+ID4gZGV2aWNl
IHRyZWUuIEJ1dCB3ZSBjYW4gc3RpbGwgdXNlIGEgYnVpbGQtdGltZSBkZXZpY2UgdHJlZSB0bw0K
PiBnZW5lcmF0ZQ0KPiA+ID4gPiA+IHRoZSBhZGRyZXNzZXMgaWYgaXQgaXMgY29udmVuaWVudC4N
Cj4gPiA+ID4gPg0KPiA+ID4gPiA+IFhFTl9TVEFSVF9BRERSRVNTLCBBUk1fTVBVX0RFVklDRV9N
RU1PUllfKiwgYW5kDQo+ID4gPiBBUk1fTVBVX05PUk1BTF9NRU1PUllfKg0KPiA+ID4gPiA+IHNl
ZW0gdG8gYmUgcGFydCBvZiB0aGlzIGdyb3VwLg0KPiA+ID4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+
IFllcy4NCj4gPiA+ID4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+ICMgR3JvdXAyOiBib290IGNvbmZp
Z3VyYXRpb24NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFRoaXMgaW5mb3JtYXRpb24gaXMgYWJvdXQg
dGhlIHNwZWNpZmljIHNldCBvZiBiaW5hcmllcyBhbmQgVk1zDQo+IHRoYXQgd2UNCj4gPiA+ID4g
PiBuZWVkIHRvIGJvb3QuIEl0IGlzIGNvbmNlcHR1YWxseSBzaW1pbGFyIHRvIHRoZSBkb20wbGVz
cyBkZXZpY2UNCj4gdHJlZQ0KPiA+ID4gPiA+IG5vZGVzIHRoYXQgd2UgYWxyZWFkeSBoYXZlLiBJ
ZiB3ZSBjaGFuZ2Ugb25lIG9mIHRoZSBWTSBiaW5hcmllcywNCj4gd2UNCj4gPiA+ID4gPiBsaWtl
bHkgaGF2ZSB0byByZWZyZXNoIHRoZSBpbmZvcm1hdGlvbiBoZXJlLg0KPiA+ID4gPiA+DQo+ID4g
PiA+ID4gIm1wdSxib290LW1vZHVsZS1zZWN0aW9uIiBwcm9iYWJseSBiZWxvbmdzIHRvIHRoaXMg
Z3JvdXAgKHVubGVzcw0KPiB3ZQ0KPiA+ID4gZmluZA0KPiA+ID4gPiA+IGEgd2F5IHRvIGRlZmlu
ZSAibXB1LGJvb3QtbW9kdWxlLXNlY3Rpb24iIGdlbmVyaWNhbGx5IHNvIHRoYXQgd2UNCj4gZG9u
J3QNCj4gPiA+ID4gPiBuZWVkIHRvIGNoYW5nZSBpdCBhbnkgdGltZSB0aGUgc2V0IG9mIGJvb3Qg
bW9kdWxlcyBjaGFuZ2UuKQ0KPiA+ID4gPiA+DQo+ID4gPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4g
SSBhZ3JlZS4NCj4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gSXQgbG9va3MgbGlrZSB3ZSBhcmUgZm9y
Y2VkIHRvIGhhdmUgdGhlIHNlY3Rpb25zIGRlZmluaXRpb25zDQo+IGF0DQo+ID4gPiBidWlsZA0K
PiA+ID4gPiA+ID4gPiB0aW1lIGJlY2F1c2Ugd2UgbmVlZCB0aGVtIGJlZm9yZSB3ZSBjYW4gcGFy
c2UgZGV2aWNlIHRyZWUuIEluDQo+IHRoYXQNCj4gPiA+ID4gPiBjYXNlLA0KPiA+ID4gPiA+ID4g
PiB3ZSBtaWdodCBhcyB3ZWxsIGRlZmluZSBhbGwgdGhlIHNlY3Rpb25zIGF0IGJ1aWxkIHRpbWUu
DQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IEJ1dCBJIHRoaW5rIGl0IHdvdWxkIGJlIGV2
ZW4gYmV0dGVyIGlmIFhlbiBjb3VsZCBhdXRvbWF0aWNhbGx5DQo+ID4gPiBjaG9vc2UNCj4gPiA+
ID4gPiA+ID4geGVuLHN0YXRpYy1tZW0sIG1wdSxndWVzdC1tZW1vcnktc2VjdGlvbiwgZXRjLiBv
biBpdHMgb3duDQo+IGJhc2VkIG9uDQo+ID4gPiB0aGUNCj4gPiA+ID4gPiA+ID4gcmVndWxhciBk
ZXZpY2UgdHJlZSBpbmZvcm1hdGlvbiAoL21lbW9yeSwgL2FtYmEsIGV0Yy4pLA0KPiB3aXRob3V0
DQo+ID4gPiBhbnkNCj4gPiA+ID4gPiBuZWVkDQo+ID4gPiA+ID4gPiA+IGZvciBleHBsaWNpdGx5
IGRlc2NyaWJpbmcgZWFjaCByYW5nZSB3aXRoIHRoZXNlIG5ldyBwcm9wZXJ0aWVzLg0KPiA+ID4g
PiA+ID4gPg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IGZvciBtcHUsZ3Vlc3QtbWVtb3J5LXNl
Y3Rpb24sIHdpdGggdGhlIGxpbWl0YXRpb25zOiBubyBvdGhlcg0KPiB1c2FnZQ0KPiA+ID4gPiA+
IGJldHdlZW4NCj4gPiA+ID4gPiA+IGRpZmZlcmVudCBndWVzdCcgbWVtb3J5IG5vZGVzLCB0aGlz
IGlzIE9LLiBCdXQgZm9yIHhlbixzdGF0aWMtDQo+IG1lbQ0KPiA+ID4gKGhlYXApLA0KPiA+ID4g
PiA+ID4gd2UganVzdCB3YW50IGV2ZXJ5dGhpbmcgb24gYSBNUFUgc3lzdGVtIGlzIGRlcnRlcm1p
c3RpYy4gQnV0LCBvZg0KPiA+ID4gY291cnNlDQo+ID4gPiA+ID4gWGVuDQo+ID4gPiA+ID4gPiBj
YW4gc2VsZWN0IGxlZnQgbWVtb3J5IGZvciBoZWFwIHdpdGhvdXQgc3RhdGljLW1lbS4NCj4gPiA+
ID4gPg0KPiA+ID4gPiA+IEl0IGlzIGdvb2QgdGhhdCB5b3UgdGhpbmsgdGhleSBjYW4gYmUgY2hv
c2VuIGJ5IFhlbi4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IERpZmZlcmVudGx5IGZyb20gImJvb3Qt
bW9kdWxlLXNlY3Rpb24iLCB3aGljaCBoYXMgdG8gZG8gd2l0aCB0aGUNCj4gYm9vdA0KPiA+ID4g
PiA+IG1vZHVsZXMgc2VsZWN0ZWQgYnkgdGhlIHVzZXIgZm9yIGEgc3BlY2lmaWMgZXhlY3V0aW9u
LA0KPiA+ID4gPiA+IGd1ZXN0LW1lbW9yeS1zZWN0aW9uIGFuZCBzdGF0aWMtbWVtIGFyZSBYZW4g
c3BlY2lmaWMgbWVtb3J5DQo+ID4gPiA+ID4gcG9saWNpZXMvYWxsb2NhdGlvbnMuDQo+ID4gPiA+
ID4NCj4gPiA+ID4gPiBBIHVzZXIgd291bGRuJ3Qga25vdyBob3cgdG8gZmlsbCB0aGVtIGluLiBB
bmQgSSB3b3JyeSB0aGF0IGV2ZW4gYQ0KPiA+ID4gc2NyaXB0DQo+ID4gPiA+DQo+ID4gPiA+IEJ1
dCB1c2VycyBzaG91bGQga25vdyBpdCwgYmVjYXVzZSBzdGF0aWMtbWVtIGZvciBndWVzdCBtdXN0
IGJlDQo+IGFsbG9jYXRlZA0KPiA+ID4gPiBpbiB0aGlzIHJhbmdlLiBBbmQgdXNlcnMgdGFrZSB0
aGUgcmVzcG9uc2liaWxpdHkgdG8gc2V0IHRoZSBEb21VJ3MNCj4gPiA+ID4gc3RhdGljIGFsbG9j
YXRlIG1lbW9yeSByYW5nZXMuDQo+ID4gPg0KPiA+ID4gTGV0IG1lIHByZW1pc2UgdGhhdCBteSBn
b2FsIGlzIHRvIGF2b2lkIGhhdmluZyBtYW55IHVzZXJzIHJlcG9ydGluZw0KPiA+ID4gZXJyb3Jz
IHRvIHhlbi1kZXZlbCBhbmQgeGVuLXVzZXJzIHdoZW4gYWN0dWFsbHkgaXQgaXMganVzdCBhIHdy
b25nDQo+ID4gPiBjaG9pY2Ugb2YgYWRkcmVzc2VzLg0KPiA+ID4NCj4gPiA+IEkgdGhpbmsgd2Ug
bmVlZCB0byBtYWtlIGEgZGlzdGluY3Rpb24gYmV0d2VlbiBhZGRyZXNzZXMgZm9yIHRoZSBib290
DQo+ID4gPiBtb2R1bGVzLCBlLmcuIGFkZHJlc3NlcyB3aGVyZSB0byBsb2FkIHhlbiwgdGhlIGRv
bTAvVSBrZXJuZWwsIGRvbTAvVQ0KPiA+ID4gcmFtZGlzayBpbiBtZW1vcnkgYXQgYm9vdCB0aW1l
LCBhbmQgVk0gc3RhdGljIG1lbW9yeSBhZGRyZXNzZXMuDQo+ID4gPg0KPiA+ID4gVGhlIGJvb3Qg
bW9kdWxlcyBhZGRyZXNzZXMgYXJlIHBhcnRpY3VsYXJseSBkaWZmaWN1bHQgdG8gZmlsbCBpbg0K
PiBiZWNhdXNlDQo+ID4gPiB0aGV5IGFyZSBtYW55IGFuZCBhIHNtYWxsIHVwZGF0ZSBpbiBvbmUg
b2YgdGhlIG1vZHVsZXMgY291bGQNCj4gaW52YWxpZGF0ZQ0KPiA+ID4gYWxsIHRoZSBvdGhlciBh
ZGRyZXNzZXMuIFRoaXMgaXMgd2h5IEkgZW5kZWQgdXAgd3JpdGluZyBJbWFnZUJ1aWxkZXIuDQo+
ID4gPiBTaW5jZSB0aGVtLCBJIHJlY2VpdmVkIHNldmVyYWwgZW1haWxzIGZyb20gdXNlcnMgdGhh
bmtpbmcgbWUgZm9yDQo+ID4gPiBJbWFnZUJ1aWxkZXIgOi0pDQo+ID4gPg0KPiA+DQo+ID4gVGhh
bmtzICs5OTkg8J+Yig0KPiA+DQo+ID4NCj4gPiA+IFRoZSBzdGF0aWMgVk0gbWVtb3J5IGFkZHJl
c3NlcyAoeGVuLHN0YXRpYy1tZW0pIHNob3VsZCBiZSBhIGJpdCBlYXNpZXINCj4gPiA+IHRvIGZp
bGwgaW4gY29ycmVjdGx5LiBUaGV5IGFyZSBtZWFudCB0byBiZSBjaG9zZW4gb25jZSwgYW5kIGl0
DQo+IHNob3VsZG4ndA0KPiA+ID4gaGFwcGVuIHRoYXQgYW4gdXBkYXRlIG9uIGEga2VybmVsIGZv
cmNlcyB0aGUgdXNlciB0byBjaGFuZ2UgYWxsIHRoZSBWTQ0KPiA+ID4gc3RhdGljIG1lbW9yeSBh
ZGRyZXNzZXMuIEFsc28sIEkga25vdyB0aGF0IHNvbWUgdXNlcnMgYWN0dWFsbHkgd2FudCB0bw0K
PiA+ID4gYmUgYWJsZSB0byBjaG9vc2UgdGhlIGRvbVUgYWRkcmVzc2VzIGJ5IGhhbmQgYmVjYXVz
ZSB0aGV5IGhhdmUNCj4gc3BlY2lmaWMNCj4gPiA+IG5lZWRzLiBTbyBpdCBpcyBnb29kIHRoYXQg
d2UgY2FuIGxldCB0aGUgdXNlciBjaG9vc2UgdGhlIGFkZHJlc3NlcyBpZg0KPiA+ID4gdGhleSB3
YW50IHRvLg0KPiA+ID4NCj4gPg0KPiA+IFllcy4NCj4gPg0KPiA+ID4gV2l0aCBhbGwgb2YgdGhh
dCBzYWlkLCBJIGRvIHRoaW5rIHRoYXQgbWFueSB1c2VycyB3b24ndCBoYXZlIGFuDQo+IG9waW5p
b24NCj4gPiA+IG9uIHRoZSBWTSBzdGF0aWMgbWVtb3J5IGFkZHJlc3NlcyBhbmQgd29uJ3Qga25v
dyBob3cgdG8gY2hvb3NlIHRoZW0uDQo+ID4gPiBJdCB3b3VsZCBiZSBlcnJvciBwcm9uZSB0byBs
ZXQgdGhlbSB0cnkgdG8gZmlsbCB0aGVtIGluIGJ5IGhhbmQuIFNvIEkNCj4gPiA+IHdhcyBhbHJl
YWR5IHBsYW5uaW5nIG9uIGFkZGluZyBzdXBwb3J0IHRvIEltYWdlQnVpbGRlciB0bw0KPiBhdXRv
bWF0aWNhbGx5DQo+ID4gPiBnZW5lcmF0ZSB4ZW4sc3RhdGljLW1lbSBmb3IgZG9tMGxlc3MgZG9t
YWlucy4NCj4gPiA+DQo+ID4NCj4gPiBMZXQgbWUgbWFrZSBzdXJlIHRoYXQncyB3aGF0IHlvdSBz
YWlkOiBVc2VycyBnaXZlIGFuIFZNIG1lbW9yeSBzaXplIHRvDQo+ID4gSW1hZ2VCdWlsZGVyLCBh
bmQgSW1hZ2VCdWlsZGVyIHdpbGwgZ2VuZXJhdGUgeGVuLHN0YXRpYy1tZW0gPSA8c3RhcnQsDQo+
IHNpemU+Lg0KPiA+IEZvciBzcGVjaWZpYyBWTSwgSW1hZ2VCdWlsZGVyIGFsc28gY2FuIGFjY2Vw
dCBzdGFydCBhbmQgc2l6ZSBhcyBpbnB1dHM/DQo+ID4NCj4gPiBEbyBJIHVuZGVyc3RhbmQgdGhp
cyBjb3JyZWN0bHk/DQo+IA0KPiBZZXMsIGV4YWN0bHkNCj4gDQo+IA0KPiA+ID4gR29pbmcgYmFj
ayB0byB0aGlzIHNwZWNpZmljIGRpc2N1c3Npb24gYWJvdXQgYm9vdC1tb2R1bGUtc2VjdGlvbjog
SQ0KPiBjYW4NCj4gPiA+IHNlZSBub3cgdGhhdCwgZ2l2ZW4geGVuLHN0YXRpYy1tZW0gaXMgY2hv
c2VuIGJ5IEltYWdlQnVpbGRlciAob3INCj4gPg0KPiA+IEJ5IGhhbmQgOiApDQo+ID4NCj4gPiA+
IHNpbWlsYXIpIGFuZCBub3QgWGVuLCB0aGVuIGl0IG1ha2VzIHNlbnNlIHRvIGhhdmUgSW1hZ2VC
dWlsZGVyIChvcg0KPiA+ID4gc2ltaWxhcikgYWxzbyBnZW5lcmF0ZSBib290LW1vZHVsZS1zZWN0
aW9uLg0KPiA+ID4NCj4gPg0KPiA+IElmIG15IGFib3ZlIHVuZGVyc3RhbmRpbmcgaXMgcmlnaHQs
IHRoZW4geWVzLg0KPiANCj4gWWVzLCBJIHRoaW5rIHdlIGFyZSBvbiB0aGUgc2FtZSBwYWdlDQo+
IA0KPiANCj4gPiA+ID4gPiBsaWtlIEltYWdlQnVpbGRlciB3b3VsZG4ndCBiZSB0aGUgYmVzdCBw
bGFjZSB0byBwaWNrIHRoZXNlIHZhbHVlcw0KPiAtLQ0KPiA+ID4gPiA+IHRoZXkgc2VlbSB0b28g
ImltcG9ydGFudCIgdG8gbGVhdmUgdG8gYSBzY3JpcHQuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBC
dXQgaXQgc2VlbXMgcG9zc2libGUgdG8gY2hvb3NlIHRoZSB2YWx1ZXMgaW4gWGVuOg0KPiA+ID4g
PiA+IC0gWGVuIGtub3dzIEFSTV9NUFVfTk9STUFMX01FTU9SWV8qIGJlY2F1c2UgaXQgd2FzIGRl
ZmluZWQgYXQNCj4gYnVpbGQNCj4gPiA+IHRpbWUNCj4gPiA+ID4gPiAtIFhlbiByZWFkcyBib290
LW1vZHVsZS1zZWN0aW9uIGZyb20gZGV2aWNlIHRyZWUNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IEl0
IHNob3VsZCBiZSBwb3NzaWJsZSBhdCB0aGlzIHBvaW50IGZvciBYZW4gdG8gcGljayB0aGUgYmVz
dA0KPiB2YWx1ZXMNCj4gPiA+IGZvcg0KPiA+ID4gPiA+IGd1ZXN0LW1lbW9yeS1zZWN0aW9uIGFu
ZCBzdGF0aWMtbWVtIGJhc2VkIG9uIHRoZSBtZW1vcnkgYXZhaWxhYmxlLg0KPiA+ID4gPiA+DQo+
ID4gPiA+DQo+ID4gPiA+IEhvdyBYZW4gdG8gcGljaz8gRG9lcyBpdCBtZWFuIGluIHN0YXRpYyBh
bGxvY2F0aW9uIERvbVUgRFQgbm9kZSwgd2UNCj4ganVzdA0KPiA+ID4gPiBuZWVkIGEgc2l6ZSwg
YnV0IGRvbid0IHJlcXVpcmUgYSBzdGFydCBhZGRyZXNzIGZvciBzdGF0aWMtbWVtPw0KPiA+ID4N
Cj4gPiA+IFllcyB0aGUgaWRlYSB3YXMgdGhhdCB0aGUgdXNlciB3b3VsZCBvbmx5IHByb3ZpZGUg
dGhlIHNpemUgKGUuZy4NCj4gPiA+IERPTVVfU1RBVElDX01FTVsxXT0xMDI0KSBhbmQgdGhlIGFk
ZHJlc3NlcyB3b3VsZCBiZSBhdXRvbWF0aWNhbGx5DQo+ID4gPiBjYWxjdWxhdGVkLiBCdXQgSSBk
aWRuJ3QgbWVhbiB0byBjaGFuZ2UgdGhlIGV4aXN0aW5nIHhlbixzdGF0aWMtbWVtDQo+ID4gPiBk
ZXZpY2UgdHJlZSBiaW5kaW5ncy4gU28gaXQgaXMgYmVzdCBpZiB0aGUgeGVuLHN0YXRpYy1tZW0g
YWRkcmVzc2VzDQo+ID4gPiBnZW5lcmF0aW9uIGlzIGRvbmUgYnkgSW1hZ2VCdWlsZGVyIChvciBz
aW1pbGFyIHRvb2wpIGluc3RlYWQgb2YgWGVuLg0KPiA+ID4NCj4gPg0KPiA+IElmIHdlIHN0aWxs
IGtlZXAgdGhlIG9wdGlvbiBmb3IgdXNlciB0byBzcGVjaWZ5IHRoZSBzdGFydCBhbmQgc2l6ZQ0K
PiA+IHBhcmFtZXRlcnMgZm9yIFZNIG1lbW9yeSwgYmVjYXVzZSBpdCBtYXliZSB2ZXJ5IGltcG9y
dGFudCBmb3IgYQ0KPiA+IGRldGVybWluaXN0aWMgc3lzdGVtIChmdWxseSBzdGF0aWMgc3lzdGVt
KSwgSSBhZ3JlZSB3aXRoIHlvdS4NCj4gPg0KPiA+IEFuZCBpbiBjdXJyZW50IHN0YXRpYy1hbGxv
Y2F0aW9uLCBJIHRoaW5rIFhlbiBkb2Vzbid0IGdlbmVyYXRlDQo+ID4geGVuLHN0YXRpYy1tZW0g
YWRkcmVzc2VzLCBhbGwgYnkgaGFuZHMuLi4NCj4gDQo+IFllYWgNCj4gDQo+IA0KDQpJIHdpbGwg
dXBkYXRlIG15IHByb3Bvc2FsIHRvIGNvdmVyIG91ciBhYm92ZSBkaXNjdXNzaW9uLCBidXQgSSBm
b3Jnb3Qgb25lDQp0aGluZy4gQXMgdGhlIHBsYXRmb3JtIGhlYWRlciBmaWxlcyB3aWxsIGJlIGdl
bmVyYXRlZCBmcm9tIERUUywgZG9lcyBpdA0KbWVhbiB3ZSBoYXZlIHRvIG1haW50YWluIHBsYXRm
b3JtIGR0cyBmaWxlcyBpbiBYZW4gbGlrZSB3aGF0IFplcGh5ciBoYXMNCmRvbmU/IEFuZCBkbyB5
b3UgaGF2ZSBzb21lIGlkZWEgdG8gaW50ZWdyYXRlIHRoZSAiSW1hZ2VCdWlsZGVyIj8gTWFrZSBp
dA0KYXMgYSBzdWJtb2R1bGUgb2YgWGVuIG9yIGludGVncmF0ZSB0byB4ZW4tdG9vbHM/DQoNCg0K
PiA+ID4gU29ycnkgZm9yIHRoZSBjb25mdXNpb24hDQo+ID4gPg0KPiA+DQo+ID4gTlAgOyApDQo=

