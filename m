Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BD17DCD28
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 13:46:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625682.975197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxo83-0001VN-RU; Tue, 31 Oct 2023 12:45:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625682.975197; Tue, 31 Oct 2023 12:45:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxo83-0001T8-Od; Tue, 31 Oct 2023 12:45:55 +0000
Received: by outflank-mailman (input) for mailman id 625682;
 Tue, 31 Oct 2023 12:45:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kxST=GN=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qxo82-0001T2-4K
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 12:45:54 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0608.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6bc478b5-77eb-11ee-9b0e-b553b5be7939;
 Tue, 31 Oct 2023 13:45:50 +0100 (CET)
Received: from AS4P190CA0014.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5de::18)
 by AS1PR08MB7611.eurprd08.prod.outlook.com (2603:10a6:20b:476::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.27; Tue, 31 Oct
 2023 12:45:44 +0000
Received: from AM3PEPF00009BA2.eurprd04.prod.outlook.com
 (2603:10a6:20b:5de:cafe::21) by AS4P190CA0014.outlook.office365.com
 (2603:10a6:20b:5de::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29 via Frontend
 Transport; Tue, 31 Oct 2023 12:45:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF00009BA2.mail.protection.outlook.com (10.167.16.27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.19 via Frontend Transport; Tue, 31 Oct 2023 12:45:44 +0000
Received: ("Tessian outbound 8289ea11ec17:v228");
 Tue, 31 Oct 2023 12:45:44 +0000
Received: from c412de52b74b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 33A791A8-7660-456B-87BD-34BB79445C31.1; 
 Tue, 31 Oct 2023 12:04:52 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c412de52b74b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 31 Oct 2023 12:04:52 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB5PR08MB10310.eurprd08.prod.outlook.com (2603:10a6:10:4a1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29; Tue, 31 Oct
 2023 12:04:50 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::ae6e:f96c:f2f3:efc9]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::ae6e:f96c:f2f3:efc9%4]) with mapi id 15.20.6933.028; Tue, 31 Oct 2023
 12:04:50 +0000
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
X-Inumbo-ID: 6bc478b5-77eb-11ee-9b0e-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=P47WqEihmUQGTGBt2VCPC+ybkzrQ61glldDuVL2i7LOG5w2fgtmhQt5meAJblm+JwL6u3TTvjUEoYGmzAi27z7LMpWWzl9cW3fCQmuewRKkTwVFJU+pViB1zZEom2ZqrWuzIs5iHOSuNcyhXtl9Shk1timDfu+jZCH2bffUZz9aRsi78YaE30f7kH03Z72jkztykLcNfyM8frr8Nd22rZspctFHVVlIl+O1PaCo0qcpNkV0Yay23/6n0ng3Ch/5+++Zey/DQq6O6s9Kp6UrXIDRcMftFXo7+HPN0ErDESFj2pdb4nV+Q+DqZBcvloruX3cp7F6R8XhO8AIhW5fPuBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=30adQHsFyS6yiltq+RhxDpeOy7RMzoWZue76dVEaWQ4=;
 b=TDHby5ZRtkoTln6GFeH/OsMg57WMRFW9jrrUp0U4gshlnyxd36mB15RGU21avfkyGfAnNi2ZR+ctaMjY7xBM/E6MgUxwZ7Sx+EhQ03UBa4n9wl5eEOeBjNeCjhtxyy2hB2IcNgmjYofaxLx1rQltTp+ge3DmLS+dZylX/ZU30ru+4nxqcHJjyEQjb7zfCTUmdpwgibSHGhBI/ElbKRBWhgAGEe94fRhmxhrjaR2v7awrncxMgpwEQ+GxM3tRgvYmxiTpyHKQioU37FtC67Y5QSjUcETT+qZMWd2AoAiNs1740rDsQIWS4KkNxhHeEbQJIRk4mwuPuZkBwXAdQiuwRA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=30adQHsFyS6yiltq+RhxDpeOy7RMzoWZue76dVEaWQ4=;
 b=mtjtEY1KQewTQqniEon6JywOjFm7yhbZsJt+nxDnxB6cG9JgPH27DkzcJKkucFAi4y8BRdnBu1jGdYBGrIB9iaMj92IHLM2drUSBC6pywX3dKBmhCqQVtrl8gUi9hZ1Uxg2rkgJKXOMH9sfbRAanwWLq5bUu8/fE0Au2kHpGaxg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: de12a21403e64403
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E85r8oSjt3nwu8ToP293kXDfn4ocQl2P9p45pdKIHz//5+dEQ2Q2astO3fUa3Tfw/xvvHvo+jPxLl7YSwAZgHbyvgaYFcxQ7rmZWAVu9efEeDe5dzR4wzxMk5KCfDrhX+h8Bt0dqVkUs3dQqwPURG/vfFhj8WJcP857oe2jhzjxw7K7IjY3dwfTvlAWIFruwlhQ/IVjGUnZS+XMvlaJOB3RwJ6b3CBHhiHak0kiqgWdQRqe1DK/yx7T5hlWGrmHUbUs7jN+5VHp5L7E3q7uJx6cy/WwvSLEH5zno+f0+H9OKhP4s7qeP6msxB/Gv3tQMFU6/3HdbaIKvFzQUEiUW6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=30adQHsFyS6yiltq+RhxDpeOy7RMzoWZue76dVEaWQ4=;
 b=Y5f2BJFdCTiV9t97pl1zMJu5WpSjxM7IOHAhq7fDVlX7R8pULOCqYxeFkqc2KPRAF6oxLoyMqZ3x24cRNigIUZguIhyHUfw3qlz1XcbmbuqxWWOF74HvD/7eE529TesTmUqgF1NYUMU5+N3XgsaJiMFrMtBMEpirVeHP97ELcCPih/PraqXdfNKVwe64VigseRHOcWgNLJ89bAgKnidia1gKjrufMgv6vubp02QGhydidRPCj8KVwL0zPevSAlcLTZcAlZnM61q74EFFpkkXJNJIHPwlMinQkRj1Aw3OK9koM1uxrbm0HGVqKSvTEGldQSCOJqImvoR/HpNZmoJLRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=30adQHsFyS6yiltq+RhxDpeOy7RMzoWZue76dVEaWQ4=;
 b=mtjtEY1KQewTQqniEon6JywOjFm7yhbZsJt+nxDnxB6cG9JgPH27DkzcJKkucFAi4y8BRdnBu1jGdYBGrIB9iaMj92IHLM2drUSBC6pywX3dKBmhCqQVtrl8gUi9hZ1Uxg2rkgJKXOMH9sfbRAanwWLq5bUu8/fE0Au2kHpGaxg=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	=?iso-8859-1?Q?Marek_Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>
Subject: Re: [PATCH for-4.18] docs: Fix IOMMU command line docs some more
Thread-Topic: [PATCH for-4.18] docs: Fix IOMMU command line docs some more
Thread-Index: AQHaC/IzprW/e81lMUm0ujgx6LUrCLBjzPMA
Date: Tue, 31 Oct 2023 12:04:50 +0000
Message-ID: <1BA31205-0991-4FD2-BEC5-D9D89DCC3B65@arm.com>
References: <20231031120215.3307356-1-andrew.cooper3@citrix.com>
In-Reply-To: <20231031120215.3307356-1-andrew.cooper3@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB5PR08MB10310:EE_|AM3PEPF00009BA2:EE_|AS1PR08MB7611:EE_
X-MS-Office365-Filtering-Correlation-Id: e981ce46-481e-44e2-4a95-08dbda0f4c5f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mlFwpXkhVUGryRYqWb+Al+qdT2aBWdcqEOIXl08WiU68gM2VCbI00KrxMnklGujWtT28o6Q//PCCMVXbgYcaaS4PkAkVubEUiDuOJwZ2YYidAFPPOjRFNlR/O+kaVujsgrYmmT10xrgTaCFvFBLovngnlOL4Yoea8aLGjXyKRoaZwngKg9KtxwYnCqRQ5qsuNviPL3AEtf4zAVtD1uifVJrpB7adYu4M/XqbLwPVWzRdtvtDSGoPy8qcfev01k/aG5afioDAGgTOriHH/dMJCfNTDxb4vWVJ7psl+TL/tJX21aWZ/x5hwhQJxwoWJxQSJMgZMi9Ts0NG8CKo2YPmJstS6ygqLArOsCsNJvg6mhiYyaGFqh5s489ImePRoMffRX5UymPtD7HqVeMLrWlrFElhj5mQfQZTLLMGV8R5nMmpoj8IWVjsm9CM+6pVzISgXuTQchqnCvp6GlmiGi6jGH5+zRBUjTadZme9BQKrCuelhqGieJ5UKm37eVrdUrXC9uf18IlyBghzpf4jHS2HXkbuZE/fhnY2gS7e856lGu4zrxg83H/Iq9WOmPvUvq4NtKzPMGxL+T5bHX9mWYUUeVnxcUgJpcOQZeVBcf8Q0PXVU4Ye4hj75Ctv6wuJ2iaXqLo1yQ3CqJk3Z2rdK5TByA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(366004)(39850400004)(346002)(136003)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(6486002)(66476007)(4326008)(5660300002)(8676002)(54906003)(64756008)(66446008)(8936002)(478600001)(122000001)(33656002)(36756003)(86362001)(41300700001)(2906002)(4744005)(38070700009)(76116006)(91956017)(6916009)(316002)(66556008)(66946007)(6506007)(6512007)(38100700002)(53546011)(71200400001)(26005)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <F9F763B3A44A3A4293A0696313227E86@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10310
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009BA2.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ff3cee3d-f11a-449e-fa2d-08dbda099598
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eINgq3aEZ97mnkPVp7R7fXWPEjMlI6dMN+HlyxIFX8IjkwMlkc37nJG7ZIgGg9Gv7syLUHFoqidrnjAJ4b5PChG5vnis4I8LyOsgpD/ojKSLYOnEe/3X8aY9XIytPPNpF0iapswOKbeZ/KGu7EArWa4v/sC/xlGA6YELHId1Qnuk8XfGRpBn45OGi/nsc5HOu49S7yhUEZ98UwTOrJuzHrGUDTb/uir7MhzmRsX1e8bL/oLw5+t6gNmzvwJL1zpe/MROqHZgmk/M7QIfj1msO7B+zSfAkrUjFG/UbKFU1r+VfNADfzOkZMnlcAlBpO66ITzwFqPlI0V7v4igVH6f7CYxRhCwygg/dAaJMb+s1AY+8tWs0LzwZcivMva3HUYIinIzODAagNRWbGNwuoxDssKaTTZ94+wB4RzsCL6HHKCMBFms4jfgH+sQzVFb3qqIEKEaUBLR92i6n5YCbEWIGNnyHtizdEm4/wEhEe/t5PgDA3+A09jxy0XKz6EHscWGkHuCfHB+Y0/Tae03FBpOnEDKpQLV69AW/mNZvHzxxtiHvRD9pe6R+Nc1CVxpqIOmMBf9oPtSAoFfwggUSPKJBU1iPi0WXy3P6WtBDT4tuUwhP2kduOpuFr8eYgtCtfA3zDWDFO//lurAa4t9rwk9f6LjBKB7fPubLrfi5rPr40zFKnAXzdK8nfbrmLoCW5eA1UItQKHsox0cl7WVFADNZ0MoKrCYqNKEVCuZ6I3EyTO3HFAcxomfyC4Rg1MRU9MR
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(39860400002)(376002)(136003)(230922051799003)(451199024)(1800799009)(186009)(82310400011)(64100799003)(46966006)(36840700001)(40470700004)(4744005)(86362001)(2906002)(33656002)(41300700001)(8676002)(4326008)(8936002)(6862004)(5660300002)(40460700003)(36756003)(478600001)(6486002)(6512007)(6506007)(40480700001)(47076005)(53546011)(81166007)(107886003)(316002)(54906003)(26005)(70206006)(70586007)(336012)(82740400003)(36860700001)(2616005)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 12:45:44.3266
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e981ce46-481e-44e2-4a95-08dbda0f4c5f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009BA2.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7611

Hi Andrew,

> On Oct 31, 2023, at 20:02, Andrew Cooper <andrew.cooper3@citrix.com> wrot=
e:
>=20
> Make the command line docs match the actual implementation, and state tha=
t the
> default behaviour is selected at compile time.
>=20
> Fixes: 980d6acf1517 ("IOMMU: make DMA containment of quarantined devices =
optional")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry


