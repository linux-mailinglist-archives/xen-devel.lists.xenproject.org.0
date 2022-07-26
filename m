Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F99D580E49
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 09:53:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375086.607379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGFMV-0001FG-8g; Tue, 26 Jul 2022 07:52:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375086.607379; Tue, 26 Jul 2022 07:52:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGFMV-0001Cq-5H; Tue, 26 Jul 2022 07:52:15 +0000
Received: by outflank-mailman (input) for mailman id 375086;
 Tue, 26 Jul 2022 07:52:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WF/t=X7=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oGFMS-0001Ck-Rc
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 07:52:13 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80057.outbound.protection.outlook.com [40.107.8.57])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da282a32-0cb7-11ed-924f-1f966e50362f;
 Tue, 26 Jul 2022 09:52:10 +0200 (CEST)
Received: from DU2PR04CA0251.eurprd04.prod.outlook.com (2603:10a6:10:28e::16)
 by DU0PR08MB7639.eurprd08.prod.outlook.com (2603:10a6:10:320::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Tue, 26 Jul
 2022 07:52:07 +0000
Received: from DBAEUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28e:cafe::f) by DU2PR04CA0251.outlook.office365.com
 (2603:10a6:10:28e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25 via Frontend
 Transport; Tue, 26 Jul 2022 07:52:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT045.mail.protection.outlook.com (100.127.142.142) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.17 via Frontend Transport; Tue, 26 Jul 2022 07:52:07 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Tue, 26 Jul 2022 07:52:07 +0000
Received: from 82e95c8aea08.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 80D137AE-7316-4240-A01A-48F06EDFAA67.1; 
 Tue, 26 Jul 2022 07:52:00 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 82e95c8aea08.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Jul 2022 07:52:00 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM0PR08MB4145.eurprd08.prod.outlook.com (2603:10a6:208:133::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Tue, 26 Jul
 2022 07:51:59 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5458.025; Tue, 26 Jul 2022
 07:51:59 +0000
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
X-Inumbo-ID: da282a32-0cb7-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=H4KHBNCiq6+jVEer135vGpkRh8vZlmIRa8r0LAQil1tIMH8SPO9YAFHsL7wbLOerFEHZJ4eVYbPffkqDb+KI0tcctT6Z8VwIHkEGUgEDBYHVKekUSomrjEJ1I7G7Wd4rxO3wRzpGSOxL/3mR4Z7T4udDcwvaTeV2iTPMtPPUNa61AJxEcEjoiowDlG4ZIVUYL3xbKCM8ZkXNKChr8x5OQgN2lbl/K9Op4YuN2p9chN3cfsGEVeOhiBijxwo9yQKtQZbSrs/DcOQok6Jtw3S8nR9KWRBXS98J3h3P30pewc/MGQqMihoN0byO0gvrXRHN9NDGlCZNv8jPaj4zX2UHnQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OQnlmttYqOPT1dDCAwnA8aCVAkKTAhXyjkUyxzQkV44=;
 b=fS5DU3xGpYsPnuMW8ABnAPDm9Z0rywDYUvRxXg1sqm2Ax+1FTG4MGClkQEXKlUxipZsjGjjQx4b/l8A9jZNalhxm9SVH5dR/AYmYiVqGxHi9y1AmNW7pI+2f7Ee3A+haOPHZfEYkhCGN5l5ZB0ny2rRqRkHk0qWbi4VlqboqirEgPP5gi9I+6bkWl9B+rQN9HCx9UPfAnjiod6tGwcpOuDfU/c5qcY6Q5tC1zJ1wahpnP889KQGD4XqfXoKKUKFQiTOav77O/PNVQl8XCwPFW1thq2ytJ0UhUaOmZkPfgA23oYHUgCKVJVUTsITOxrqnsY2L655AkYjbCFl3NJrVKQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQnlmttYqOPT1dDCAwnA8aCVAkKTAhXyjkUyxzQkV44=;
 b=M+MXCrQETyl5U7deOBZ2GbWhGz+/DeNCajx2K0VCJVp7ez7D8ZmcjlGMqXqe3DWOiCVZVEQKUiDdSVW1PC1wokEIAtl482NEzUxf0YhsKKvRp2KGc1gxbRk2YTRtMvfPUPJnef7RroZPvIjeNac/LSpW4iBOPkXfDZJkzANcCl8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c2a480c9381b007a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jHwACtIZByjS6owe3Ucecd+G/YbxNAwQpJrdpKrlH/Lhf1NDCWZ5N6h3LIno1uXQoM3a2B6dQUnu2py5u8FVio5RmzW0fhK0JJoqwO2QvAuzzPLlTKiL0WSAy3ecWEHVhTmo1Mw+unoKC6U22UxSoi6/1Cby2tILb0bYA7gn/fvWKN6T4zkjkPeb+3hsjtMt3HF3uioootAqg3feWEk1w5rD/p9nXfoc45KknOpt4iO2uFMSzC+MO5Sjpk9JFggO1eK8zzxxfMBkTyTy1MEMnGPR2lG7kjXjD+jp8AOI5A4218yNlUeeXwmZZFMUPODQ6OhDs2/jTUt+kmxRPiBZ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OQnlmttYqOPT1dDCAwnA8aCVAkKTAhXyjkUyxzQkV44=;
 b=GbrDzItAEIQiCPKTDOLDNfRLTbAp307Jy1cs1GQXcE1BbVX0FOWMTqMQE1aHcogfvzvVSpRu7RLPbDmozw49HX6nPZDZXpc5oxm+usc7oqBylFAn6WA5NaV5dkLnTEgGHfpJOZWccbfA5vFBariTs4h6RSBYAmvFIFF7jkodvXI46XJCE/4XcC7us+9s/pCoEYwz4p24lJfBGVuQL9eNr+yXHSYyaSJzCM4a/snXuNe6ye2tpjeb5buYMqHSYiw34VrvnYfuAIeloVNHLRUfLuSl03aRhoLSFdbswq8HQ3vylK73KcBttWxIb4TjwGw2VCHKVgl5N3SSZwrXe65oEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQnlmttYqOPT1dDCAwnA8aCVAkKTAhXyjkUyxzQkV44=;
 b=M+MXCrQETyl5U7deOBZ2GbWhGz+/DeNCajx2K0VCJVp7ez7D8ZmcjlGMqXqe3DWOiCVZVEQKUiDdSVW1PC1wokEIAtl482NEzUxf0YhsKKvRp2KGc1gxbRk2YTRtMvfPUPJnef7RroZPvIjeNac/LSpW4iBOPkXfDZJkzANcCl8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: Random crash during guest start on x86
Thread-Topic: Random crash during guest start on x86
Thread-Index: AQHYoD5xXkzOB8H120+6SchUWgFyYK2PQysAgAEFgQA=
Date: Tue, 26 Jul 2022 07:51:58 +0000
Message-ID: <880625A9-C3C8-4D45-A4E8-BB443E9D4CEF@arm.com>
References: <65C0A220-EC7E-4915-AC45-77D87F4E411E@arm.com>
 <7d816c9d-412a-bcee-f1ab-3b4b46051b8a@suse.com>
In-Reply-To: <7d816c9d-412a-bcee-f1ab-3b4b46051b8a@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 5853f7df-088d-4910-46c3-08da6edbbcd7
x-ms-traffictypediagnostic:
	AM0PR08MB4145:EE_|DBAEUR03FT045:EE_|DU0PR08MB7639:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 VDaYMtB+5oOG1rcBEzYb6vneTneYUzu1hRmwucGa4UaD5oiJyRO7btY+cnJtZGh4cdMbybgFtpXQWMVQB4OzgUOI0Rg0HyUuB+d5nit3kAJHHf+3z0TNHbb0+f1M7zQcgbSUVApcFoxBtYTnnOWcFM+1txcyHAFb8ayYQM5jtxq+gsDjRXcsec13q+Kgxx/UjgHODHhcaUIl3ckLK3PH+a9oFaIUevCP0kSfc5d7UqoH3Ui5u3nOUosqpo1UgbgiTIQHBj+d4N2netkwpoJWZcvrpk0FW21wfEF5U2rusYFFGq6jE50I4FKMITnJYF2gtqezu29l4sIxY1tPAyYw46ewd/53qer2vgjfr83UbvRAXV2oZXMHffpCN8v7A/QJiiVwpN92qDGHeiJLUEp3QigkCwOj6zGRJ1z1Q062GCXpSiQgyPloZ19g4JBbAY0HRw4FobCdoP9OQm/BHo2yEoDpGPjFYj4Trw8mGKiKy5bVxy0B2DkTJQ00SvL+HqkycXdmlN4/6xQBFk5Pl8JTujEmKXa28/smvDiHuwlv9tF+BZw8j3yPrFq1kFu22pm4fJUF2D5chOKae/d6Yc1qkwvKBjUV4UJh9Msw7TyypieSgZ1fokbkiiJbCNNl245LwTsEOiR56L2wq9XhaQQuJkYRJkmn3Yk8rO+L8LOwXD0RVMbOTBF/ajxJxfMFMAFZajkop/6EmQAuXiuWizV/eC86O12pLbi94fe99CC2OpNd1WQxv+ZeHg2rlsaEyjMYrsSUdNMMPCa187o6VbIUHQN882uuav3RXabPi6DiVDkBidtfqfFVp4/JHaE69Vmd3kDnXp9wXvPQO+TUEqSXsQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(366004)(396003)(376002)(346002)(38100700002)(122000001)(83380400001)(36756003)(66476007)(64756008)(66446008)(91956017)(76116006)(8676002)(45080400002)(66946007)(66556008)(38070700005)(4326008)(86362001)(54906003)(6916009)(316002)(478600001)(6512007)(8936002)(26005)(6506007)(2616005)(5660300002)(71200400001)(6486002)(41300700001)(2906002)(53546011)(186003)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <5697BC4DFB5DFE41A8C08C33E52950F7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4145
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	45910c76-fdd2-42b0-334c-08da6edbb803
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SsKXAjHBfMuc9QmgOudsfK1j6arrJ9jpmfGvyAE/q25N5qIfTBmHJzMf3iAKXUAnsAZV5dS08hCDe9avdad1d7RXko5vWcsWMqdF/qkeDcBXv0PQ5vG9w8BXVmkp6L2jnA+z37VYJHZ3v8K5Ny2i0bqz12yFJ+vEzs/Ryvzg1rubMEKNpPQTA0rgGjbhhuusN5IIlpm6O9va/3u909O3Ewxv9WoM0fzSKMh+pUHQBHF4Tph8Xii9iClZ4vGvSzyCBkLZvE7e2wFFaRPq6CTIsqlv8wYu1zH8JH+ZJan5aLfXXpi4FJO3Ilwh5M+8xkjSCi6h3Y7wzAlEkhaSVZESm0FYMajrZMI69no6VhBPKCp66xnjgtNI3KLFsWT803MGoT2LLc1ErQImzvvdFi7TmvGR2E0uCNRe0rV2JScoO5tbVtkBs6JqApU9pRT2R8Cwv4eLhT0Z77ToMhNmSzOAu7hBOgJ3YhBU1t/ysmo1oMyl+I5XhZ8dAuy440fbo7TeQeh/6u9zwJKzpeshAg7V1S/HJ1r+LIDC/y5oZoWHdYrBQlm/SVzykyLptHZ1Il9l0H1+u1p7WQPHfI9kejfDsBvfR5NzAlO7gUTAhpjnIo6ZviquE7FQSwIzdBldwSd4fX98NSNV7vLxc9uQOyXsV9YMNmPr+4LmINHlW4TMLfzxO2DKVgu8gsZOBiVVymTijApoH0KD8zWJ90Zr2UTOaIuZ1RVQnKzo+oOj4F8VbO4dWvE7+sME5qLF5+ixA8ZNh9rgAlf8I1hIBAl6RSEidUbZHKplzbV+b3i1ysGQv/gBOmlSbtcb9W8fmaL5mYGE
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(376002)(396003)(39860400002)(36840700001)(46966006)(40470700004)(316002)(6862004)(54906003)(36860700001)(36756003)(6486002)(45080400002)(8936002)(70586007)(70206006)(5660300002)(4326008)(8676002)(2906002)(26005)(53546011)(2616005)(6512007)(40460700003)(478600001)(41300700001)(47076005)(82740400003)(336012)(6506007)(33656002)(83380400001)(40480700001)(81166007)(356005)(82310400005)(186003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 07:52:07.1464
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5853f7df-088d-4910-46c3-08da6edbbcd7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7639



> On 25 Jul 2022, at 17:16, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 25.07.2022 17:51, Bertrand Marquis wrote:
>> On our CI we have randomly a crash during guest boot on x86.
>=20
> Afaict of a PV guest.
>=20
>> We are running on qemu x86_64 using Xen staging.
>=20
> Which may introduce unusual timing. An issue never hit on actual hardware
> _may_ (but doesn't have to be) one in qemu itself.
>=20
>> The crash is happening randomly (something like 1 out of 20 times).
>>=20
>> This is always happening on the first guest we start, we never got it af=
ter first guest was successfully started.
>>=20
>> Please tell me if you need any other info.
>>=20
>> Here is the guest kernel log:
>> [...]
>> [ 6.679020] general protection fault, maybe for address 0x8800: 0000 [#1=
] PREEMPT SMP NOPTI
>> [ 6.679020] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.17.6 #1
>> [ 6.679020] RIP: e030:error_entry+0xaf/0xe0
>> [ 6.679020] Code: 29 89 c8 48 39 84 24 88 00 00 00 74 15 48 81 bc 24 88 =
00 00 00 63 10 e0 81 75 03 0f 01 f8 90 90 90 c3 48 89 8c 24 88 00 00 00 <0f=
> 01 f8 90 90 90 eb 11 0f 20 d8 90 90 90 90 90 48 25 ff e7 ff ff
>=20
> This is SWAPGS, which supposedly a PV guest should never hit. Data furthe=
r
> down suggests the kernel is still in the process of patching alternatives=
,
> which may be the reason for the insn to still be there (being at a point
> where exceptions are still unexpected).

So the exception path is using alternative code ? Sounds logic with the err=
or output.
But does explain the original error.

>=20
>> [ 6.679020] RSP: e02b:ffffffff82803a90 EFLAGS: 00000046
>> [ 6.679020] RAX: 0000000000008800 RBX: 0000000000000000 RCX: ffffffff81e=
00fa7
>> [ 6.679020] RDX: 0000000000000000 RSI: ffffffff81e009f8 RDI: 00000000000=
000eb
>> [ 6.679020] RBP: 0000000000000000 R08: 0000000000000000 R09: 00000000000=
00000
>> [ 6.679020] R10: 0000000000000000 R11: 0000000000000000 R12: 00000000000=
00000
>> [ 6.679020] R13: 0000000000000000 R14: 0000000000000000 R15: 00000000000=
00000
>> [ 6.679020] FS: 0000000000000000(0000) GS:ffff88801f200000(0000) knlGS:0=
000000000000000
>> [ 6.679020] CS: 10000e030 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [ 6.679020] CR2: 0000000000000000 CR3: 000000000280c000 CR4: 00000000000=
50660
>> [ 6.679020] Call Trace:
>> [ 6.679020] <TASK>
>> [ 6.679020] RIP: e030:native_irq_return_iret+0x0/0x2
>> [ 6.679020] Code: 41 5d 41 5c 5d 5b 41 5b 41 5a 41 59 41 58 58 59 5a 5e =
5f 48 83 c4 08 eb 0a 0f 1f 00 90 66 0f 1f 44 00 00 f6 44 24 20 04 75 02 <48=
> cf 57 0f 01 f8 eb 12 0f 20 df 90 90 90 90 90 48 81 e7 ff e7 ff
>> [ 6.679020] RSP: e02b:ffffffff82803b48 EFLAGS: 00000046 ORIG_RAX: 000000=
000000e030
>> [ 6.679020] RAX: 0000000000008800 RBX: ffffffff82803be0 RCX: ffffffff81e=
00f95
>> [ 6.679020] RDX: ffffffff81e00f94 RSI: ffffffff81e00f95 RDI: 00000000000=
000eb
>> [ 6.679020] RBP: 00000000000000eb R08: 0000000090001f0f R09: 00000000000=
00007
>> [ 6.679020] R10: ffffffff81e00f94 R11: ffffffff8285a6c0 R12: 00000000000=
00000
>> [ 6.679020] R13: ffffffff81e00f94 R14: 0000000000000006 R15: 00000000000=
00006
>> [ 6.679020] ? asm_exc_general_protection+0x8/0x30
>> [ 6.679020] ? restore_regs_and_return_to_kernel+0x1b/0x27
>> [ 6.679020] ? restore_regs_and_return_to_kernel+0x1b/0x27
>> [ 6.679020] ? restore_regs_and_return_to_kernel+0x1c/0x27
>> [ 6.679020] ? restore_regs_and_return_to_kernel+0x1b/0x27
>> [ 6.679020] ? restore_regs_and_return_to_kernel+0x1c/0x27
>> [ 6.679020] RIP: e030:insn_get_opcode.part.0+0xab/0x180
>> [ 6.679020] Code: 00 00 8b 43 4c a9 c0 07 08 00 0f 84 bf 00 00 00 c6 43 =
1c 01 31 c0 5b 5d c3 83 e2 03 be 01 00 00 00 eb b7 89 ef e8 65 e4 ff ff <89=
> 43 4c a8 30 75 21 e9 8e 00 00 00 0f b6 7b 03 40 84 ff 75 73 8b
>> [ 6.679020] RSP: e02b:ffffffff82803b70 EFLAGS: 00000246
>> [ 6.679020] ? restore_regs_and_return_to_kernel+0x1b/0x27
>> [ 6.679020] insn_get_modrm+0x6c/0x120
>> [ 6.679020] ? restore_regs_and_return_to_kernel+0x1b/0x27
>> [ 6.679020] insn_get_sib+0x40/0x80
>> [ 6.679020] insn_get_displacement+0x82/0x100
>> [ 6.679020] insn_decode+0xf8/0x100
>> [ 6.679020] optimize_nops+0x60/0x1e0
>> [ 6.679020] ? rcu_nmi_exit+0x2b/0x140
>> [ 6.679020] ? restore_regs_and_return_to_kernel+0x1b/0x27
>> [ 6.679020] ? native_iret+0x3/0x7
>> [ 6.679020] ? restore_regs_and_return_to_kernel+0x1c/0x27
>> [ 6.679020] ? restore_regs_and_return_to_kernel+0x1b/0x27
>> [ 6.679020] apply_alternatives+0x165/0x2e0
>=20
> I have to admit that I'm a little lost with these "modern" stack traces,
> where contexts apparently switch without being clearly annotated. It is
> looking a little as if a #GP fault was happening somewhere here (hence
> the asm_exc_general_protection further up), but I cannot work out where
> (what insn) that would have come from.
>=20
> You may want to add some debugging code to the hypervisor to tell you
> where exactly that #GP (if there is one in the first place) originates
> from. With that it may then become a little more clear what's actually
> going on (and why the behavior is random).

I will check what I can do there but as the crash is very random and only
happening during our CI tests, this is not really easy to reproduce.
If you have any example of code to do the debugging, I could run some
tests with it.

>=20
> As a final remark - you've Cc-ed the x86 hypervisor maintainers, but at
> least from the data which is available so far this is more likely a
> kernel issue. So kernel folks might be of more help ...

I wanted to check if this could be a know issue first. The problem is
happening in the kernel, I agree, but only when it started as a Xen guest
so I assumed it could be related to Xen.

At the end I wanted to signal the problem, but I will not have much
resources to work on this.

Bertrand

>=20
> Jan
>=20
>> [ 6.679020] ? insn_get_opcode.part.0+0xab/0x180
>> [ 6.679020] ? insn_get_modrm+0x6c/0x120
>> [ 6.679020] ? rcu_nmi_enter+0x2b/0xf0
>> [ 6.679020] ? rcu_nmi_exit+0x2b/0x140
>> [ 6.679020] ? irqentry_exit+0x29/0x30
>> [ 6.679020] ? exc_xen_hypervisor_callback+0x8/0x10
>> [ 6.679020] ? relocate_restore_code+0x22a/0x240
>> [ 6.679020] alternative_instructions+0x8b/0x13a
>> [ 6.679020] check_bugs+0xa87/0xadf
>> [ 6.679020] ? __get_locked_pte+0xa8/0xf0
>> [ 6.679020] start_kernel+0x64c/0x680
>> [ 6.679020] xen_start_kernel+0x592/0x59f
>> [ 6.679020] startup_xen+0x3e/0x3e
>> [ 6.679020] </TASK>
>> [ 6.679020] Modules linked in:
>> [ 6.679020] ---[ end trace 0000000000000000 ]---
>> [ 6.679020] RIP: e030:error_entry+0xaf/0xe0
>> [ 6.679020] Code: 29 89 c8 48 39 84 24 88 00 00 00 74 15 48 81 bc 24 88 =
00 00 00 63 10 e0 81 75 03 0f 01 f8 90 90 90 c3 48 89 8c 24 88 00 00 00 <0f=
> 01 f8 90 90 90 eb 11 0f 20 d8 90 90 90 90 90 48 25 ff e7 ff ff
>> [ 6.679020] RSP: e02b:ffffffff82803a90 EFLAGS: 00000046
>> [ 6.679020] RAX: 0000000000008800 RBX: 0000000000000000 RCX: ffffffff81e=
00fa7
>> [ 6.679020] RDX: 0000000000000000 RSI: ffffffff81e009f8 RDI: 00000000000=
000eb
>> [ 6.679020] RBP: 0000000000000000 R08: 0000000000000000 R09: 00000000000=
00000
>> [ 6.679020] R10: 0000000000000000 R11: 0000000000000000 R12: 00000000000=
00000
>> [ 6.679020] R13: 0000000000000000 R14: 0000000000000000 R15: 00000000000=
00000
>> [ 6.679020] FS: 0000000000000000(0000) GS:ffff88801f200000(0000) knlGS:0=
000000000000000
>> [ 6.679020] CS: 10000e030 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [ 6.679020] CR2: 0000000000000000 CR3: 000000000280c000 CR4: 00000000000=
50660
>> [ 6.679020] Kernel panic - not syncing: Attempted to kill the idle task!
>>=20
>> Cheers
>> Bertrand


